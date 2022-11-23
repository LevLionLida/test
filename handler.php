<?php
require_once 'database/database.php';
$connection=get_database_connection();


if ('POST' !== $_SERVER['REQUEST_METHOD']) {
    exit('Method Not Allowed.');
}

$companyName = !empty($_POST['company_name']) ? trim($_POST['company_name']) : '';
$phone = !empty($_POST['phone']) ? trim($_POST['phone']) : '';
$platform = !empty($_POST['platform']) ? trim($_POST['platform']) : '';
$range_min = !empty($_POST['range_min']) ? trim($_POST['range_min']) : '';
$range_max = !empty($_POST['range_max']) ? trim($_POST['range_max']) : '';


$clean_phone=preg_replace("/[^0-9]/","", $phone);
$companyName=preg_replace("/[^a-zA-Z]/","", $companyName);

$whereSQL = '1=1 ';

if (!empty($companyName)) {
    $whereSQL .= ' AND companies.Name = "' . $companyName . '"';
}

if (!empty($phone)) {
    $whereSQL .= ' AND numbers.numbers = "' . $phone . '"';
}

if (!empty($platform)) {
    $whereSQL .= ' AND integration.Platform = "' . $platform . '"';
}

if (!empty($range_min)) {
    $whereSQL .= ' AND payments.amount >= "' . $range_min . '"';
}

if (!empty($range_max)) {
    $whereSQL .= ' AND payments.amount <= "' . $range_max . '"';
}

$sql = "
SELECT
    companies.id,
    companies.Name as name,
    COUNT(payments.id) AS number_of_payments,
    SUM(payments.Amount) AS total_amount
FROM payments
    JOIN integration ON payments.integrationID = integration.id
    JOIN numbers ON integration.NumberID = numbers.id
    JOIN companies ON numbers.CompanyID = companies.id
WHERE " . $whereSQL . "
GROUP BY companies.id, companies.Name;
";

$stmt =$connection->prepare($sql);
$stmt->execute();

$sqlResponseCompanies= $stmt->fetchAll();

$response = [
    'companies' => []
];

foreach ($sqlResponseCompanies as $companyRow) {
    $response['companies'][] = [
        'company' => [
            'id' => $companyRow['id'],
            'name' => $companyRow['name']
        ],
        'number_of_payments' => $companyRow['number_of_payments'],
        'total_amount' => $companyRow['total_amount']
    ];
}

echo json_encode($response);