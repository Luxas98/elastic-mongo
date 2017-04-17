pipeline = Source({name:"mongodb", tail: true, namespace: "rental_apartments.apartments"})
  .transform({filename: "transformers/passthrough_and_log.js", namespace: "rental_apartments.apartments"})
  .save({name:"es", namespace: "rental_apartments.apartments"})


