import neatCsv from "neat-csv";
import { promises as fs } from 'fs';
import { initializeApp, cert } from 'firebase-admin/app';
import { getFirestore } from 'firebase-admin/firestore';

async function main() {
  initializeApp({credential: cert('./credentials.json')});
  const countries = await readLocalData();
  firestoreCreateData(countries);
}

async function readLocalData() {
  const data = await neatCsv(await fs.readFile('./data/world-cities.csv'));
  const countriesWithCities = [];
  data.forEach(item => {
    const exists = countriesWithCities.find(country => country.country == item.country);
    if (!exists) {
      countriesWithCities.push({
        country: item.country,
        cities: [item.name]
      })
    } else {
      exists.cities.push(item.name);
    }
  })
  return countriesWithCities;
}

function firestoreCreateData(countries) {
  const db = getFirestore();
  let batch = db.batch();
  countries.forEach(country => batch.set(db.doc(`world-cities/${country.country}`), country));
  batch.commit().then(response => {
    console.log('Success');
  }).catch(err => {
    console.error(err);
  });
}

main();
