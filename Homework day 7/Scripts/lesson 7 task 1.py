# Исходная  необработанная строка из источника данных.
raw_user_record = '10807; aLeXanDer_vLaDimiRov ; mInSk ; ACTIVE '

elements = raw_user_record.split(';') # Метод split() разбивает строку на части по указанному разделителю, в данном случае это split().

# Создание пустого списка.
clean_elements = []

# Запускает цикл, перебирающий каждый элемент из списка elements по очереди.
for element in elements: 
    clean_element = element.strip() # С помощью метода strip() удаляет все пробельные символы в начале и в конце строки.
    clean_elements.append(clean_element) # С помощью метода append() добавляет очищенный элемент в конец списка clean_elements.
 
uid = f"UID-{clean_elements[0]}"

name = clean_elements[1].replace('_', ' ').title() # Заменяем _ на пробелы с помощью метода replace(), title() юзаем для того, чтобы первая буква слова была заглавной.

status = clean_elements[3].lower() # Заменяет буквы верхнего регистра на нижние с помощью метода lower().

city = clean_elements[2].upper() # Используем upper(), чтобы перевести буквы из нижнего регистра в верхний.

record_parts = [uid, name, city, status]

result = ' | '.join(record_parts) # Хранит результат нашей работы, чтобы его можно было вывести в консоль, также использовали метод join() для того, чтобы добавить разделитель между словами, также заметил, что в этом моменте синтаксис не похож на JS.

print(f"Нормализованная запись: {result}.")
