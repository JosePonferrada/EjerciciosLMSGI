let $niveles  := doc('superheroes.xml')/marvel/superheroe/@nivel/xs:double(.)
return <media>La media de nivel de todos los superheroes es { avg($niveles) }</media>