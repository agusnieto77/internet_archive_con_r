# GESTION DE LA API DE INTERNET ARCHIVE
# CARGAMOS LAS LIBRERIAS

require(internetarchive)
require(tidyverse)

# HACEMOS UNA BUSQUEDA POR PALABRAS CLAVE

ia_keyword_search(         # abrimos la función de busqueda por palabras clave del paquete internetarchive
  keywords ="comunismo",   # especificamos la palabra clave a ser buscada
  num_results = 20,        # determinamos la cantidad de devoluciones de la búsqueda
  page = 1,                # definimos la pagina que queremos que nos muestre en la consola
  print_total = TRUE       # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
  )                        # cerramos la función de busqueda por palabras clave del paquete internetarchive

# 1611 total items found. This query requested 20 results. (En este caso son un total de 1611 resultados)

##

# AHORA BUSCAMOS Y GUARDAMOS EN UN OBJETO LOS RESULTADOS OBTENIDOS CON LA PALABRA 'comunismo'

(                           # abrimos la impresión en consola del objeto que vamos a crear
  comunismo <-              # asignamos un nombre al objeto que vamos a crear
    ia_keyword_search(      # abrimos la función de busqueda por palabras clave del paquete internetarchive
    keywords ="comunismo",  # especificamos la palabra clave a ser buscada
    num_results = 1700,     # determinamos la cantidad de devoluciones de la búsqueda
    page = 1,               # definimos la pagina que queremos que nos muestre en la consola
    print_total = TRUE      # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
    )                       # cerramos la función de busqueda por palabras clave del paquete internetarchive
  %>%                       # simbolo pipe (de la libraria magrittr) para anclar objetos (en este caso anclamos el objeto 'comunismo')
    tibble()                # función para tabular los datos obtenidos (darle formato tabla)
)                           # cerramos la impresión en consola del objeto creado

##

# HACEMOS UNA NUEVA BUSQUEDA POR PALABRAS CLAVE

ia_keyword_search(         # abrimos la función de busqueda por palabras clave del paquete internetarchive
  keywords ="anarquismo",  # especificamos la palabra clave a ser buscada
  num_results = 20,        # determinamos la cantidad de devoluciones de la búsqueda
  page = 1,                # definimos la pagina que queremos que nos muestre en la consola
  print_total = TRUE       # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
)                          # cerramos la función de busqueda por palabras clave del paquete internetarchive

# 3510 total items found. This query requested 20 results. (En este caso son un total de 3510 resultados)

##

# AHORA VOLVEMOS BUSCAMOS Y GUARDAMOS EN UN OBJETO LOS RESULTADOS OBTENIDOS CON LA PALABRA 'anarquismo'

(                              # abrimos la impresión en consola del objeto que vamos a crear
  anarquismo <-                # asignamos un nombre al objeto que vamos a crear
    ia_keyword_search(         # abrimos la función de busqueda por palabras clave del paquete internetarchive
      keywords ="anarquismo",  # especificamos la palabra clave a ser buscada
      num_results = 4000,      # determinamos la cantidad de devoluciones de la búsqueda
      page = 1,                # definimos la pagina que queremos que nos muestre en la consola
      print_total = TRUE       # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
    )                          # cerramos la función de busqueda por palabras clave del paquete internetarchive
  %>%                          # simbolo pipe (de la libraria magrittr) para anclar objetos (en este caso anclamos el objeto 'comunismo')
    tibble()                   # función para tabular los datos obtenidos (darle formato tabla)
)                              # cerramos la impresión en consola del objeto creado

##

# SUPONGAMOS QUE AHORA QUEREMOS TENER TODO EN UNA SOLA TABLA

(                                 # abrimos la impresión en consola del objeto que vamos a crear
  comunismo_anarquismo_rbind <-   # asignamos un nombre al objeto que vamos a crear
    rbind(                        # abrimos la función para unir las tablas (solo une tablas de identica estructura)
      comunismo,                  # tabla 1
      anarquismo                  # tabla 2
    )                             # cerramos la función para unir las tablas
)                                 # cerramos la impresión en consola del objeto creado

##

# SUPONGAMOS QUE AHORA QUEREMOS TENER TODO EN UNA SOLA TABLA PERO COMO RESULTADO DE UNA SOLA CONSULTA

ia_keyword_search(                      # abrimos la función de busqueda por palabras clave del paquete internetarchive
  keywords ="comunismo OR anarquismo",  # especificamos la palabra clave a ser buscada
  num_results = 20,                     # determinamos la cantidad de devoluciones de la búsqueda
  page = 1,                             # definimos la pagina que queremos que nos muestre en la consola
  print_total = TRUE                    # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
)                                       # cerramos la función de busqueda por palabras clave del paquete internetarchive

# 5020 total items found. This query requested 20 results. (En este caso son un total de 5020 resultados)

##

# AHORA VOLVEMOS BUSCAMOS Y GUARDAMOS EN UN OBJETO LOS RESULTADOS OBTENIDOS CON LAs PALABRAs 'comunismo' o 'anarquismo'

(                              # abrimos la impresión en consola del objeto que vamos a crear
  comunismo_or_anarquismo <-   # asignamos un nombre al objeto que vamos a crear
    ia_keyword_search(         # abrimos la función de busqueda por palabras clave del paquete internetarchive
      keywords =               # especificamos las palabras clave a ser buscada y las combinamos con operadores lógicos (OR) en este caso
      "
      comunismo
      OR
      anarquismo
      ",                       # cerramos las comillas dobles
      num_results = 6000,      # determinamos la cantidad de devoluciones de la búsqueda
      page = 1,                # definimos la pagina que queremos que nos muestre en la consola
      print_total = TRUE       # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
    )                          # cerramos la función de busqueda por palabras clave del paquete internetarchive
  %>%                          # simbolo pipe (de la libraria magrittr) para anclar objetos (en este caso anclamos el objeto 'comunismo')
    tibble()                   # función para tabular los datos obtenidos (darle formato tabla)
)                              # cerramos la impresión en consola del objeto creado

##

# si prestamos atención notaremos que hay una divergencia entre el nº total del 'rbind' y el nº total del 'or'
# es posible que esto se deba a que haya valores duplicados en la tabla hecha con rbind

# COMPROBAMOS USANDO LA FUNCIÓN DE VALORES UNICOS 'unique'

unique(                       # abrimos función de valoes unicos
  comunismo_anarquismo_rbind  # definimos sobre que objeto aplicarla
  )                           # cerramos la función unique

# A tibble: 5,015 x 1

# efectivamente había valores duplicados, archivos que son devueltos cuando buscamos con
# anarquismo y también son devueltos cuando buscamos con comunismo como palabras clave
# podemos cambiar el operador logico de OR a & para ver cuales son esos archivos que contienen ambos términos

# AHORA VOLVEMOS BUSCAMOS Y GUARDAMOS EN UN OBJETO LOS RESULTADOS OBTENIDOS CON LAs PALABRAs 'comunismo' o 'anarquismo'

(                              # abrimos la impresión en consola del objeto que vamos a crear
  comunismo_and_anarquismo <-  # asignamos un nombre al objeto que vamos a crear
    ia_keyword_search(         # abrimos la función de busqueda por palabras clave del paquete internetarchive
      keywords =               # especificamos las palabras clave a ser buscada y las combinamos con operadores lógicos (&) en este caso
        "
      comunismo
      &
      anarquismo
      ",                       # cerramos las comillas dobles
      num_results = 200,       # determinamos la cantidad de devoluciones de la búsqueda
      page = 1,                # definimos la pagina que queremos que nos muestre en la consola
      print_total = TRUE       # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
    )                          # cerramos la función de busqueda por palabras clave del paquete internetarchive
  %>%                          # simbolo pipe (de la libraria magrittr) para anclar objetos (en este caso anclamos el objeto 'comunismo')
    tibble()                   # función para tabular los datos obtenidos (darle formato tabla)
)                              # cerramos la impresión en consola del objeto creado

##

# VER EL ARCHIVO EN EL NAVEGADOR

# si en algún momento queremos ver algunos de los archivos identificados con el buscador
# solo tenemos que hace ruso de la funcion ai_browse()

ia_browse("doctrinassociale00vivi")

# cuando abran el archivo en el navegador podrán bajar el archivo desde la propia pagina web
# pero no es la idea de este curso que hagan eso...

# ahora vamos a complejizar un poco los parámetros de busqueda

# BUSQUEDA AVANZADA DE PERIÓDICOS ANTIGUOS EN ESPAÑOL

# EJEMPLO 1

# CREAMOS EL OBJETO 'parametros1' PARA LA BUSQUEDA

(                                        # abrimos la impresión en consola del objeto que vamos a crear
  parametros1 <-                         # asignamos un nombre al objeto que vamos a crear
    c(                                   # abrimos el vector
    "subject" = "Hemeroteca+Histórica",  # definimos el tópico
    "mediatype" = "texts",               # definimos el tipo de objeto
    "languageSorter" = "Spanish",        # definimos el idioma
    date = "1800 TO 1990"                # definimos el período
    )                                    # cerramos el vector
)                                        # cerramos la impresión en consola del objeto creado

##

# HACEMOS LA BUSQUEDA

(                                # abrimos la impresión en consola del objeto que vamos a crear
  HemerotecaHistoricaEs <-       # asignamos un nombre al objeto que vamos a crear
    tibble(                      # abrimos la tabla
      id_doc =                   # asignamos nombre a la variable
        ia_search(               # abrimos la funcion de busqueda
          terms = parametros1,   # ingresamos el objeto con los parametros
          num_results = 700,     # determinamos la cantidad de devoluciones de la búsqueda
          page = 1,              # definimos la pagina que queremos que nos muestre en la consola
          print_url = TRUE,      # pedimos que imprima en consola la url de la busqueda
          print_total = TRUE     # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
        )                        # cerramos la funcion de busqueda
    )                            # cerramos la tabla
)                                # cerramos la impresión en consola del objeto que vamos a crear

##

# EJEMPLO 2

# CREAMOS EL OBJETO 'parametros2' PARA LA BUSQUEDA

(                                                            # abrimos la impresión en consola del objeto que vamos a crear
  parametros2 <-                                             # asignamos un nombre al objeto que vamos a crear
    c(                                                       # abrimos el vector
      "collection" = "bibliotecauniversitariadesevilla",     # definimos la coleccion
      "mediatype" = "texts",                                 # definimos el tipo de objeto
      date = "1500 TO 2020"                                  # definimos el período
    )                                                        # cerramos el vector
)                                                            # cerramos la impresión en consola del objeto creado

##

# HACEMOS LA BUSQUEDA

(                                # abrimos la impresión en consola del objeto que vamos a crear
  biblioteca_sevilla_texts <-    # asignamos un nombre al objeto que vamos a crear
    tibble(                      # abrimos la tabla
      id_doc =                   # asignamos nombre a la variable
        ia_search(               # abrimos la funcion de busqueda
          terms = parametros2,   # ingresamos el objeto con los parametros
          num_results = 20000,   # determinamos la cantidad de devoluciones de la búsqueda
          page = 1,              # definimos la pagina que queremos que nos muestre en la consola
          print_url = TRUE,      # pedimos que imprima en consola la url de la busqueda
          print_total = TRUE     # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
        )                        # cerramos la funcion de busqueda
    )                            # cerramos la tabla
)                                # cerramos la impresión en consola del objeto que vamos a crear

##

# EJEMPLO 3

# CREAMOS EL OBJETO 'parametros3' PARA LA BUSQUEDA

(                                                            # abrimos la impresión en consola del objeto que vamos a crear
  parametros3 <-                                             # asignamos un nombre al objeto que vamos a crear
    c(                                                       # abrimos el vector
      "subject" = "IWW",                                     # definimos el topico
      "mediatype" = "image",                                 # definimos el tipo de objeto
      date = "1900 TO 1950"                                  # definimos el período
    )                                                        # cerramos el vector
)                                                            # cerramos la impresión en consola del objeto creado

##

# HACEMOS LA BUSQUEDA

(                                # abrimos la impresión en consola del objeto que vamos a crear
  iwwES <-                       # asignamos un nombre al objeto que vamos a crear
    tibble(                      # abrimos la tabla
      id_doc =                   # asignamos nombre a la variable
        ia_search(               # abrimos la funcion de busqueda
          terms = parametros3,   # ingresamos el objeto con los parametros
          num_results = 20,      # determinamos la cantidad de devoluciones de la búsqueda
          page = 1,              # definimos la pagina que queremos que nos muestre en la consola
          print_url = TRUE,      # pedimos que imprima en consola la url de la busqueda
          print_total = TRUE     # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
        )                        # cerramos la funcion de busqueda
    )                            # cerramos la tabla
)                                # cerramos la impresión en consola del objeto que vamos a crear

##

# TABLA COMPLETA DE LOS DOCUMENTOS

(                              # abrimos la impresión en consola del objeto que vamos a crear
  biblio_sevilla_metadatos <-  # asignamos un nombre al objeto que vamos a crear
    tibble(                    # abrimos la tabla
      ia_search(               # abrimos la funcion de busqueda
        terms = parametros2,   # ingresamos el objeto con los parametros
        num_results = 20000,   # determinamos la cantidad de devoluciones de la búsqueda
        page = 1,              # definimos la pagina que queremos que nos muestre en la consola
        print_url = TRUE,      # pedimos que imprima en consola la url de la busqueda
        print_total = TRUE     # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
      )                        # cerramos la funcion de busqueda
      %>%                      # simbolo pipe (de la libraria magrittr) para anclar objetos para encadenar funciones
        ia_get_items()         # aplicamos una función para obtener los metadatos de los elementos encontrados
      %>%                      # simbolo pipe (de la libraria magrittr) para anclar objetos para encadenar funciones
        ia_metadata()          # aplicamos una función para acceder a y ordenar los metadatos obtenidos con la función anterior
    )                          # cerramos la tabla
)                              # cerramos la impresión en consola del objeto que vamos a crear

# guardamos el objeto 'biblio_sevilla_metadatos' que es una tibble con 3 columnas y 513.499 filas

saveRDS(                            # abrimos funcion de guardado
  biblio_sevilla_metadatos,         # objeto creado
  "biblio_sevilla_metadatos.rds"    # objeto guardado
)                                   # cerramos funcion de guardado

## biblio_sevilla_metadatos <- readRDS("biblio_sevilla_metadatos.rds")

##

# Transformamos la tabla, los valores de la columna pasan a ser variables
biblio_sevilla_metadatos_tibble <- biblio_sevilla_metadatos %>% spread(field, value)

# Mostramos la nueva tabla con las columnas acostadas
tibble::glimpse(biblio_sevilla_metadatos_tibble)

# Nos quedamos con 39 de las 117 variables existentes
biblio_sevilla_metadatos_tibble_select <- biblio_sevilla_metadatos_tibble %>%
  select(-`bookreader-defaults`, -color, -contibutor, -contribution, -contributolr,
         -contributor1, -contributor2, -contributor3, -contributor4, -contributor5,
         -contributoro, -contritubor, -cotributor, -coverage, -crator, -creato, -creatoar,
         -creator10, -creator11, -creator12, -creator13, -creator14, -creator15, -creator16,
         -creator17, -creator18, -creator19, -creator20, -creator21, -creator22, -creator6,
         -creator7, -creator8, -creator9, -creatr, -cretor, -curation, -date1, -date2, -digitized_by1,
         -digitized_by2, -digitized_bya, -digitized_byc, -digitized_byhdg, -editor, -imagecount1,
         -imagecount2, -lang, -lang1, -lang2, -language1, -language2, -noarchivetorrent, -notes,
         -olsearch, -openlibrary_edition, -openlibrary_work, -page_number_confidence, -pbg,
         -printer, -pubilsher, -pubisher, -publiher, -publisehr, -publisher1, -publisher2, -publisher3,
         -publishr, -publishre, -publishser, -reache, -skipocr, -sound, -subject, -subject7, -volume,
         -year1, -year2)

##

# TABLA DE TITULOS DE LOS DOCUMENTOS

(                                # abrimos la impresión en consola del objeto que vamos a crear
  biblio_sevilla_metadatos_ti <- # asignamos un nombre al objeto que vamos a crear
    tibble(                      # abrimos la tabla
      ia_search(                 # abrimos la funcion de busqueda
        terms = parametros2,     # ingresamos el objeto con los parametros
        num_results = 30,        # determinamos la cantidad de devoluciones de la búsqueda
        page = 1,                # definimos la pagina que queremos que nos muestre en la consola
        print_url = TRUE,        # pedimos que imprima en consola la url de la busqueda
        print_total = TRUE       # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
      )                          # cerramos la funcion de busqueda
      %>%                        # simbolo pipe (de la libraria magrittr) para anclar objetos para encadenar funciones
        ia_get_items()           # aplicamos una función para obtener los metadatos de los elementos encontrados
      %>%                        # simbolo pipe (de la libraria magrittr) para anclar objetos para encadenar funciones
        ia_metadata()            # aplicamos una función para acceder a y ordenar los metadatos obtenidos con la función anterior
      %>%                        # simbolo pipe (de la libraria magrittr) para anclar objetos para encadenar funciones
        filter(field == "title") # aplicamos un filtro para quedarnos solo con un valor, aquellos que son iguales a 'title'
      %>%                        # simbolo pipe (de la libraria magrittr) para anclar objetos para encadenar funciones
        select(value)            # aplicamos un selector para quedarnos solo con la variable value
    )                            # cerramos la tabla
)                                # cerramos la impresión en consola del objeto que vamos a crear

# guardamos el objeto 'biblio_sevilla_metadatos_ti'

saveRDS(                            # abrimos funcion de guardado
  biblio_sevilla_metadatos_ti,      # objeto creado
  "biblio_sevilla_metadatos_ti.rds" # objeto guardado
  )                                 # cerramos funcion de guardado

##

# BAJAR LOS ARCHIVOS QUE NECESITAMOS PARA NUESTRA INVESTIGACION

(                        # abrimos la impresión en consola del objeto que vamos a crear
  IWW_tabla <-           # asignamos un nombre al objeto que vamos a crear
    tibble(              # abrimos la tabla
      ia_search(         # abrimos la funcion de busqueda
  terms = parametros3,   # ingresamos el objeto con los parametros
  num_results = 20,      # determinamos la cantidad de devoluciones de la búsqueda
  page = 1,              # definimos la pagina que queremos que nos muestre en la consola
  print_url = TRUE,      # pedimos que imprima en consola la url de la busqueda
  print_total = TRUE     # pedimos que nos muestre el total de items existentes que refieren a la palabra buscada
) %>%                    # pipe
  ia_get_items() %>%     # aplicamos una función para obtener los metadatos de los elementos encontrados
  ia_files() %>%         # accedemos a la lista de archivos asociados a elementos del ia
  filter(                # aplicamos un filtro para quedarnos solo con un valor
    type == "jpg"        # filtramos aquellos valores que son iguales a 'jpg'
    )%>%                 # pipe
  group_by(id            # aplicamos funcion para agrupar
           ) %>%         # pipe
  slice(1                # aplicamos funcion para elegir una fila
        ) %>%            # pipe
  ia_download(           # aplicamos la función de ia para descargar los documentos
    dir = paste0(        # llamamos la función de pegado para indicar el directorio
      getwd(),           # indicamos cual es el directorio de trabajo
      "/IWW"),           # indicamos cual es la carpeta para las descargas
    overwrite = FALSE    # establecemos que no sobrescriba archivos
              ) %>%      # pipe
  glimpse()              # aplicamos función para mostrar las variables en sentido horizontal
    )                    # cerramos la tabla
)                        # cerramos la impresión en consola del objeto que vamos a crear

###

"FUENTE: https://cran.r-project.org/web/packages/internetarchive/vignettes/internet-archive.html"
"FUENTE: https://ropensci.org/tutorials/internetarchive_tutorial/"
"CITA: Lincoln Mullen (2016). internetarchive: An API Client for the Internet Archive. R package version 0.1.6. https://CRAN.R-project.org/package=internetarchive"
