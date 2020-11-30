INSERT INTO 
`pyme_markets`.`pyme_profile` (`PymeProf_Name`, `PymeProf_Tags`, `PymeProf_Icon_Url`, `PymeProf_Img_Url`, `PymeProf_Search_Url`) 
VALUES 
('Nescafe', 'cafe, cocina, cafetera', '../assets/icons/Nescafe', '../assets/img/pymes/Nescafe', '/Nescafe');

INSERT INTO 
`pyme_markets`.`pyme_profile` (`PymeProf_Name`, `PymeProf_Tags`, `PymeProf_Icon_Url`, `PymeProf_Img_Url`, `PymeProf_Search_Url`) 
VALUES 
('Starbucks', 'cafe, cocina, cafetera, fino', '../assets/icons/Starbucks', '../assets/img/pymes/Starbucks', '/Starbucks');


INSERT INTO `pyme_markets`.`product` 
(`Product_PymeProf_Id`, `Product_CatProd_Id`, `Product_Name`, `Product_Description`, `Product_Img_Url`, `Product_Search_Url`, `Product_Unit_Price`, `Product_Offer`, `Product_Date_Created`, `Product_Last_Update`, `Product_Is_Free_Shipping`) 
VALUES 
(1, '6', 'Cafe Nescafe Fina Selección Origins Frasco 100g  X5 Sabores', 'Cafe Nescafe Fina Selección Origins Frasco 100g  X5 Sabores', 'https://http2.mlstatic.com/cafe-nescafe-fina-seleccion-origins-frasco-100g-x5-sabores-D_NQ_NP_704560-MLC43834391833_102020-V.jpg', 'cafe-nescafe-fina-seleccion-origins-frasco-100g-x5-sabores-D_NQ_NP_704560-MLC43834391833_102020-V', '25.990', '13% OFF', 'NOW()', 'NOW()', '1');

INSERT INTO `pyme_markets`.`product` 
(`Product_PymeProf_Id`, `Product_CatProd_Id`, `Product_Name`, `Product_Description`, `Product_Img_Url`, `Product_Search_Url`, `Product_Unit_Price`, `Product_Offer`, `Product_Date_Created`, `Product_Last_Update`) 
VALUES 
('1', '1', 'Producto Prueba', 'AAAAAAAAAAAA', '../assets/img/products/productPruebaImg', '/producto-prueba', '10000', '0.00', '2020-10-28', '2020-10-28');