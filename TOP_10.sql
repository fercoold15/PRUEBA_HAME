SELECT TOP 10
    c.cliente AS nombre_cliente,
    c.direccion AS direccion_cliente,
    c.nit AS nit_cliente,
    p.producto AS nombre_producto,
    SUM(e.pbruto) AS suma_peso_bruto,
    MONTH(e.fecha) AS mes,
    YEAR(e.fecha) AS año
FROM
    envio e
JOIN
    cliente c ON e.codcliente = c.codcliente
JOIN
    producto p ON e.codproducto = p.codproducto
WHERE
    YEAR(e.fecha) = 2023
GROUP BY
    c.cliente, c.direccion, c.nit, p.producto, MONTH(e.fecha), YEAR(e.fecha)
ORDER BY
    suma_peso_bruto DESC;
