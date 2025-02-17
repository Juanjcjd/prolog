# Documentación de Funciones Predefinidas en CLISP

## 1. Entrada y Salida (I/O)

### 1.1 Entrada y salida estándar

```lisp
(print "Hola, mundo!")  ;; Imprime con salto de línea
```
```lisp
(format t "El número es ~A y la cadena es ~A~%" 10 "Hola")  
;; Imprime "El número es 10 y la cadena es Hola"
```
```lisp
(write "Hola")  ;; Escribe en la salida estándar sin salto de línea.
```
```lisp
(setq entrada (read))  ;; Lee entrada del usuario y la almacena en `entrada`.
```

### 1.2 Manejo de archivos

```lisp
(setq stream (open "archivo.txt" :direction :output))  
(format stream "Escribiendo en el archivo...~%")  
(close stream)  ;; Cierra el archivo.
```
```lisp
(with-open-file (stream "archivo.txt" :direction :input)  
  (let ((contenido (read-line stream)))  
    (format t "Contenido del archivo: ~A~%" contenido)))  
```

---

## 2. Operaciones Matemáticas

### 2.1 Aritmética básica

```lisp
(+ 3 5 7)   ;; 15
(- 10 3)    ;; 7
(* 4 5)     ;; 20
(/ 10 2)    ;; 5
(mod 10 3)  ;; 1 (Residuo de la división)
(expt 2 3)  ;; 8 (2^3)
(sqrt 16)   ;; 4.0
```

### 2.2 Comparaciones

```lisp
(= 5 5)      ;; T
(/= 5 3)     ;; T (Diferente)
(< 3 5)      ;; T (Menor que)
(> 5 3)      ;; T (Mayor que)
(<= 3 3)     ;; T (Menor o igual)
(>= 4 3)     ;; T (Mayor o igual)
```

---

## 3. Manipulación de Listas

### 3.1 Creación y acceso

```lisp
(setq mi-lista '(1 2 3 4 5))  ;; Definir una lista
(car mi-lista)   ;; 1 (Primer elemento)
(cdr mi-lista)   ;; (2 3 4 5) (Resto de la lista)
(nth 2 mi-lista) ;; 3 (Elemento en la posición 2)
```

### 3.2 Modificación

```lisp
(cons 0 mi-lista)  ;; (0 1 2 3 4 5) Agrega un elemento al inicio
(append mi-lista '(6 7))  ;; (1 2 3 4 5 6 7) Concatena listas
(reverse mi-lista)  ;; (5 4 3 2 1) Invierte la lista
```

---

## 4. Control de Flujo

### 4.1 Condiciones

```lisp
(if (> 10 5)  
    (format t "10 es mayor que 5")  
    (format t "No lo es"))  
```
```lisp
(cond  
  ((< 5 3) (format t "Caso 1"))  
  ((= 5 5) (format t "Caso 2")))  ;; Ejecuta la segunda rama
```

### 4.2 Bucles

#### 4.2.1 Loop

```lisp
(loop for i from 1 to 5 do (print i))  
;; Imprime 1 2 3 4 5
```

#### 4.2.2 Dotimes

```lisp
(dotimes (i 5) (format t "Iteración: ~A~%" i))  
;; Iteración: 0, Iteración: 1, ..., Iteración: 4
```

---

## 5. Cadenas de Texto

```lisp
(setq str "Hola Mundo")  
(string-upcase str)  ;; "HOLA MUNDO"
(string-downcase str)  ;; "hola mundo"
(subseq str 0 4)  ;; "Hola"
(concatenate 'string "Hola" " " "Mundo")  ;; "Hola Mundo"
```

---

## 6. Definición de Funciones

```lisp
(defun suma (a b)  
  (+ a b))  

(format t "Suma: ~A~%" (suma 5 3))  ;; "Suma: 8"
```

Funciones anónimas con `lambda`:

```lisp
(mapcar (lambda (x) (* x 2)) '(1 2 3))  ;; (2 4 6)
```

---

## 7. Funciones Avanzadas

### 7.1 Evaluación dinámica

```lisp
(eval '(+ 3 5))  ;; 8
```

### 7.2 Macros

```lisp
(defmacro cuadrado (x) `(* ,x ,x))  
(cuadrado 4)  ;; 16
```

---

## 8. Manejo de Errores

### 8.1 Captura de errores

```lisp
(handler-case (/ 5 0)  
  (division-by-zero () (format t "Error: División por cero")))  
```

---

## 9. Otras Funciones Útiles

### 9.1 Funciones sobre tipos de datos

```lisp
(type-of 42)  ;; INTEGER
(type-of "Hola")  ;; STRING
```

### 9.2 Funciones de tiempo

```lisp
(get-universal-time)  ;; Retorna la hora en segundos desde 1900
```

---

