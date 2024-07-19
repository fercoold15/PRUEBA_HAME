SELECT
    f.finca AS nombre_finca,
    em.empresa AS nombre_empresa,
    COUNT(e.idenvio) AS total_transacciones,
    MONTH(e.fecha) AS mes,
    YEAR(e.fecha) AS año
FROM
    envio e
JOIN
    finca f ON e.codfinca = f.codfinca
JOIN
    empresa em ON f.codempresa = em.codempresa
WHERE
    YEAR(e.fecha) = 2024
    AND MONTH(e.fecha) BETWEEN 1 AND 6
GROUP BY
    f.finca, em.empresa, MONTH(e.fecha), YEAR(e.fecha)
HAVING
    COUNT(e.idenvio) >= 100
ORDER BY
    nombre_finca;
