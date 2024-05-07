<marvel> {
  for $superheroe in doc('superheroes.xml')/marvel/superheroe
  let $nombre := $superheroe/@nombre
  let $poderes := $superheroe/@poderes
  let $amigos := $superheroe/@amigos
  let $nivel := $superheroe/@nivel
  return <superheroe>{ 
        <nombre>{data($nombre)}</nombre>,
        <poderes>{data($poderes)}</poderes>,
        <amigos>{data($amigos)}</amigos>,
        <nivel>{data($nivel)}</nivel>
    }</superheroe>
  } </marvel>