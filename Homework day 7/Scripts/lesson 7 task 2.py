# Список транзакций, полученных от платежного шлюза.
raw_transactions = ["SUCCESS:100", "FAILED:50", "SUCCESS:-10", "SUCCESS:0", "SUCCESS:250", "ERROR:200"]

# Реализация фильтрации в одну строку с помощью List Comprehension.
filtered = [
    int(transaction.split(':')[1]) # Преобразуем в int(), также используем split() для того, чтобы разбить строку на части по указанному разделителю.
    for transaction in raw_transactions
    if (transaction.startswith('SUCCESS:')) and int(transaction.split(':')[1]) > 0 # Если транзакция начинается с SUCCESS:, split(':') и преобразованное значение в int() первого элемента транзакции разбивает строку по символу(:), возвращает список из двух частей.
]

print(f"Очищенные транзакции: {filtered}.")

