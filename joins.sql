/* LEFT JOIN */
SELECT *
FROM car_model model
LEFT JOIN car ON model.car_model_id = car.car_model_id
ORDER BY model.car_model_id;