Un **buzón de sala** (_Room Mailbox_) y un **buzón de equipamiento** (_Equipment Mailbox_) son tipos de **destinatarios especiales de Exchange**.

El concepto fundamental es que son objetos que tienen asociado un **calendario**, permitiendo a los usuarios ver si están **libres o están ocupados**.

### 1. Buzón de Sala (_Room Mailbox_)

- **Propósito:** Representa una ubicación física, como una sala de reuniones.
- **Licenciamiento:** **No ocupa licencia**.
- **Uso:** Un usuario puede convocar una reunión y agregar el buzón de sala como si fuera un asistente más. El buzón de sala usa su calendario para ver si está disponible para esa hora y acepta o rechaza automáticamente la solicitud.
- **Atributos Especiales:** Tiene atributos específicos que no son normales en usuarios:
  - **Capacidad** (_Capacity_): Para indicar cuántas personas caben. Esto se usa como un **filtro**; si metes a 20 personas y la capacidad es de 13, la sala no aparecerá en la lista de salas disponibles.
  - **Delegados:** Personas que pueden ser responsables de **autorizar o no las reservas**. Por defecto, cualquiera puede reservar la sala.
  - **Opciones de Reserva:** Se puede configurar si se permiten reuniones periódicas, la duración máxima de la reserva (ej. 2 horas), si acepta automáticamente las solicitudes o si tiene que preguntar al delegado.

### 2. Buzón de Equipamiento (_Equipment Mailbox_)

- **Propósito:** Se utiliza para reservar recursos físicos móviles o equipos. Ejemplos incluyen un proyector, un portátil auxiliar, un módem 4G. (Incluso se ha usado para recursos más atípicos como una excavadora).
- **Uso:** Al igual que con las salas, el objetivo es **verificar la disponibilidad** a través del calendario y reservarlo.
- **Administración:** Se configura de manera similar a una sala.

### 3. Administración Común y Avanzada

La administración de las configuraciones de reserva para ambos (como quién puede reservar, si se acepta automáticamente o no, o si hay restricciones de duración) se suele realizar mediante comandos avanzados de **PowerShell**.

Tanto las salas como el equipamiento se muestran en el **asistente para programación** al convocar una reunión.
