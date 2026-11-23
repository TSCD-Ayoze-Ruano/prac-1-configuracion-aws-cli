# Consideraciones sobre las credenciales de AWS Academy

Las credenciales proporcionadas por AWS Academy son **temporales** y caducan después de un periodo limitado, normalmente de unas 4 horas. Cuando caducan, es necesario obtener unas nuevas desde el laboratorio y actualizar la configuración de AWS CLI.

Se puede compartir información no sensible de la configuración, como el nombre de los perfiles, la región utilizada o el formato de salida. También se pueden compartir salidas de comandos siempre que hayan sido previamente anonimizadas.

**No se deben compartir** el `aws_access_key_id`, `aws_secret_access_key` ni el `aws_session_token`, ya que son credenciales de autenticación y podrían permitir el acceso al entorno de AWS mientras sean válidas.