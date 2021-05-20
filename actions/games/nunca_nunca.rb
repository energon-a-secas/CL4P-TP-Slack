require './lib/message_slack'

### ENERBOT: yo nunca (random|niños|joven|adulto|sfw|incomoda|nsfw) --- Enerbot te hará cuestionar a tus compañeros de trabajo.
module RetrieveNeverNever
  extend MessageSlack

  def self.exec(data)
    sfw_awkward_text = ['me he comido un insecto.', 'he reutilizado el mismo tampón.', 'me he orinado en una piscina.', 'he sido mojado con aguas tratadas.', 'me he cortado las uñas de los pies frente a alguien más.', 'he comido pan con moho.', 'me he hurgado la nariz y me he comido mis mocos.', 'he orinado en un lavamanos.', 'he usado un baño público que no tuviera papel higiénico y me tuve que limpiar con la mano.', 'he usado maquillaje ajeno.', 'me he sentado desnudo y sudado en un sofá.', 'me he limpiado con un calcetín después de ir al baño.', 'me he ensuciado de vómito en una borrachera.', 'me he comido un alimento caduco.', 'he dejado los trastes en la cocina por más de 1 semana sin lavarlos.', 'he comido ancas de rana.', 'he tenido una diarrea tan fea que no me haya permitido llegar al baño a tiempo.', 'he tenido pies olorosos.', 'he compartido el hilo dental con otra persona.', 'he compartido la misma esponja de baño con otra persona.', 'he olido mi ropa para saber si la puedo volver a utilizar.', 'he usado la ropa interior de alguien más.', 'he utilizado la misma ropa interior por más de tres días.', 'he comido carne podrida.', 'he sacado cosas de mi ombligo.', 'me he sentado en un baño público sucio.', 'he lavado ropa interior ajena manchada.', 'he lamido la suela del zapato de alguien más.', 'he tocado el interior de un contenedor de basura de un baño público.', 'he usado el cepillo de dientes de alguien más.', 'me he quedado más de una semana sin bañarme.', 'he tapado un baño público y lo dejé así.', 'he probado la cera de oído.', 'he dejado mi baño por semanas sin limpiarlo.', 'le he estornudado en la cara a nadie.', 'he ido a orinar y no me lavé las manos.', 'he utilizado zapatos de bolos rentados sin calcetines.', 'he usado la misma toalla íntima por dos días seguidos.', 'he probado la comida de perro o gato.', 'me he comido mis uñas.', 'he volteado la ropa interior para poder usarla de nuevo.', 'he vomitado dentro de mi boca y me lo he tragado de vuelta.', 'he pisado popo de perro estando descalzo.']
    sfw_kids_text = ['me he quedado dormido en el cine.', 'he llorado en la escuela.', 'he robado el/los juguete(s) de mi hermano/a.', 'he jugado videojuegos todo el día.', 'he comido calamar.', 'he presumido algo que nunca he hecho o no tengo.', 'me he pasado horas viendo videos en YouTube.', 'me he apropiado la historia de un amigo y he pretendido hacer crear que me sucedió a mí.', 'he llamado mamá a mi profesora.', 'he tenido una mascota.', 'me quedado dormido con ropa casual.', 'he tenido miedo de quedarme solo/a en casa.', 'he hecho trampa en un examen.', 'le he mentido a mis padres acerca de hacia dónde voy.', 'le tengo miedo a la oscuridad.', 'me he subido a un crucero/barco.', 'me he burlado de alguien.', 'me he robado algo con un valor mayor a 10 dólares/euros.', 'he hecho algo de lo que me haya arrepentido.', 'he hecho una broma telefónica.', 'le he tenido miedo a los payasos.', 'he mezclado Coca Cola con Mentos.', 'he fingido estar enfermo/a para quedarme en casa a jugar videojuegos.', 'he culpado a mi hermano/a de algo que yo hice.', 'he comido solo dulces en una comida.', 'he pegado un chicle debajo de una butaca, banca o mesa.', 'he llorado viendo una película de Pixar o Disney.', 'tengo problemas para quedarme dormido después de ver una película de terror.', 'he tenido un chicle pegado en el cabello.', 'me he quedado dormido en el autobús y se me ha pasado mi parada.', 'he mentido al decir que conozco a alguien de la farándula o la televisión.', 'he mentido acerca de quedarme en la escuela y en realidad irme a otra parte.', 'me he roto un hueso.', 'me he hurgado la nariz en público.', 'he ido a un campamento de verano.', 'me he asustado a mí mismo/a al verme en el espejo.', 'me tirado de un bungee.', 'he matado hormigas quemándolas con una lupa.', 'he deseado en secreto ser un mago/bruja en Hogwarts.', 'he ido a un acuario.', 'he sido enviado a la oficina del director.', 'he montado a caballo.', 'he ido a Disney World.', 'he ido a una pijamada.', 'he cocinado algo elaborado.', 'he “limpiado” apilando todo en el clóset o en las cajoneras.', 'he participado en un show de talentos.', 'me he gastado todo mi dinero en golosinas.', 'he tratado de ver el sol.', 'le he tenido miedo a ir a un parque temático.', 'me he astillado un diente.']
    sfw_adults_text = ["he dado 'like' por accidente a una foto de mi ex.", 'he sido botado de un bar o club nocturno.', 'me he quedado dormido en una reunión de trabajo.', 'le he agarrado la mano a la persona equivocada.', 'he olvidado mi propia edad.', 'he mojado la cama más allá de mi niñez.', 'he aparecido en un video vergonzoso que haya sido subido a YouTube.', 'he ido a un restaurante sin dejar propina.', 'me he tratado de tirar un pedo de manera silenciosa… y terminó siendo ruidoso.', 'me he accidentado al tratar de impresionar un chico o una chica que me gustara.', 'me quedado paralizado en una presentación en público.', 'he comido alimentos que se me han caído al piso.', 'he tirado mi celular al retrete.', 'he vomitado por estar demasiado/a borracho/a.', 'he saludado a alguien pensando que era otra persona.', 'le echado la culpa de un gas a un animal.', 'he sido abofeteado/a por alguien en la calle.', 'he llamado a la persona incorrecta, pero fingí que en realidad si quería llamarles.', 'he utilizado Facebook mientras estaba borracho/a.', 'he sido pillado masturbándome.', 'he golpeado con el auto contra la banqueta mientras manejaba.', 'he caminado el día entero con la cremallera abajo.', 'he espiado a mis vecinos.', 'he fingido conocer a un extraño.', 'he dejado de recordar a mi primer amor.', 'he robado algo de una tienda.', "he puesto una 'duck face' al tomarme una foto.", 'me he desmayado en público.', "he 'perdido' los lentes que estaba usando en ese momento.", 'le he enviado un mensaje de texto a la persona equivocada.', 'me he subido por accidente a un carro ajeno.', 'he grabado un video de mí mismo cantando o bailando.', 'me he caído en público.', 'he sido gritoneado por un cliente en mi trabajo.', 'he cantado a todo pulmón, he olvidado la letra y he improvisado.', 'he roto un mueble al sentarme en él.', 'he tratado de impresionar al/la chico/a que me gusta tratando de aparentar conocimiento sobre los temas que le gustan.', 'me he visto a mí mismo/a desnudo/a en el espejo.', 'he mandado a mi madre/padre un mensaje erótico por accidente.', 'he roto algo en la casa de un(a) amigo/a sin que lo supiera.', 'me he equivocado al entrar al baño correcto.', 'he recibido serenata.', 'he tenido diarrea en la casa de un amigo.', 'he mentido acerca de mi edad.', 'me he colado en una fiesta.', 'he fingido reírme de una broma que no entendí.', 'he llorado en público por una canción.', "le he dicho a alguien accidentalmente 'te amo'.", 'me he comprado un juguete para niños, siendo un adulto.', 'he fingido lavarme las manos y abrí la manija del agua, solo en caso de que alguien estuviera escuchándome.', 'he estado tan borracho.', 'he ido al baño y me he salido sin lavarme las manos.', 'me he vestido del sexo opuesto.', 'me he perdido en un parque de diversiones.', 'he llegado tarde y todo mundo se me quedó viendo.', 'he entrado por accidente a un baño que estaba ocupado.', 'he gritado durante una película de terror.', 'me he sentido atraído por el padre/madre de un(a) amigo/a.', 'le escrito borracho a mi ex.', 'le he salpicado saliva en la cara a alguien.', 'he tomado un alimento de la basura y lo he consumido.', "he dicho 'te amo' sin sentirlo.", 'me he echado un gas en frente de alguien que me atraía.', 'he tenido un ataque de pánico.', 'he dejado mis llaves adentro del auto.', 'he confundido a un hombre con una mujer o viceversa.', 'he causado un accidente vial por estar utilizando el celular.', 'me he peleado en la calle.', "he dicho 'perdón' cuando no había nadie cerca."]
    sfw_teenagers_text = ['he tomado una pastilla del día siguiente.', 'he probado ser vegano.', 'he visto el celular de un(a) amigo/a sin su permiso.', 'he sido multado.', 'he comprado ropa en línea.', 'he estado celoso/a de mi novio/a.', 'me he escapado de la escuela.', 'me he ido de compras con la tarjeta de crédito de mis padres.', 'he lastimado a alguien en un ataque de ira.', 'he disparado un arma.', 'me he enamorado a primera vista.', 'le he dado indicaciones erróneas a propósito a alguien.', 'he tenido mi primer beso.', 'he besado a mi mejor amigo/a.', 'he sido arrestado.', 'he sido suspendido de la escuela.', 'he mandado a alguien al hospital por accidente.', 'he mentido en una entrevista de trabajo.', 'he roto la ley.', 'he tenido resaca.', 'he chocado el auto de mi padre/madre.', 'he besado el póster de una celebridad.', 'le he mentido a un amigo para evitar un mal más grande.', 'he coqueteado con la pareja de mi amigo/a.', 'me he quedado dormido en un lugar y he despertado en otro.', 'he perdido mi teléfono.', 'me he quedado despierto por dos días seguidos.', 'he ido a un bar.', 'he visto caricaturas para las que me siento demasiado viejo.', 'me he emborrachado con mis padres.', 'he tenido una mala cita a ciegas.', 'he sido despedido de mi trabajo.', 'le he gritado a mis padres.', 'he llorado enfrente del chico/a que me gusta.', 'he tenido un altercado físico con mi mejor amigo.', 'he tratado de cortarme el cabello por mi cuenta.', 'me he enamorado del amigo/a de mi hermano/a.', 'me he orinado en público.', 'he tenido una experiencia paranormal.', 'he salido del país.', 'he ido al baile de graduación.', 'he falsificado la firma de mis padres.', 'he considerado practicarme cirugía estética.', 'he besado a alguien sin conocerlo.', 'he escabullido a un chico o una chica dentro de habitación.', 'me he desmayado después de tomar.', 'le he gritado a mis padres.', 'le he dejado un ojo morado a alguien.', 'he sido la persona más ebria de la fiesta.', 'he rechazado un beso.', 'me he tirado de un paracaídas.', 'me he hecho un piercing.', 'he terminado con alguien mientras estaba borracho/a.', 'he tenido una identificación falsa.', 'me he probado ropa y me la he llevado puesta sin pagar.', 'he mentido acerca de mi edad.', 'he reprobado una materia.', 'he tenido un trabajo que haya realmente odiado.', 'me he metido en problemas con un oficial de policía.', 'he tomado el auto de mis padres sin que ellos supieran.', 'salí en una cita con alguien porque estuviera aburrido/a.', 'he escondido mis cigarros para evitar que mis padres supieran que estaba fumando.', 'me he practicado una rinoplastia.', 'he fumado hierba.', 'me he ido de un restaurante sin pagar la cuenta.', 'he olvidado donde dejé estacionado el auto.', 'he cometido un delito.', 'he montado una motocicleta.', 'he jugado a la botella.', 'he invitado a una chica al baile.', 'me he enamorado de mi profesor.', 'le enviado un mensaje inapropiado a mi madre/padre que originalmente iba intencionado para mi novio/a.', 'he tenido que correr para salvar mi vida.', 'he ido a un concierto.', 'he dormido todo el día.', 'he coqueteado con alguien para ganar una apuesta.', 'he espiado a un enovio/enovia a través de redes sociales.', 'me he puesto un tatuaje del que luego me arrepintiera.', 'he fingido recibir una llamada para dejar de hablar con alguien.', 'he mentido acerca de la muerte de un miembro de mi familia para zafarme de alguna responsabilidad.', 'le he robado dinero a mis padres.', 'he trabajado en un restaurante de comida rápida.', 'le he dado a alguien un número de teléfono falso.', 'le he pedido a una chica ir a una cita.', 'le he dicho una mentira a un(a) amigo/a para evitar salir con él/ella.', 'me he pintado el cabello de un color alocado.']
    nsfw_text = ['he participado en un trío', 'he sido pillado masturbándome', 'he pillado a un familiar masturbándose', 'he pillado a un familiar teniendo sexo', 'he pillado a un amigo teniendo sexo', 'lo he hecho en un sitio público', 'lo he hecho en el mar', 'lo he hecho en el probador de una tienda', 'lo he hecho en un sitio público', 'lo he hecho en un coche', 'lo he hecho en una moto', 'he participado en una orgía', 'me he sentido atraído por alguien del mismo sexo', 'me he sentido atraído por alguien de este grupo', 'me he sentido atraído por un profesor o profesora', 'me he sentido atraído por un familiar', 'me he sentido atraído por la pareja de una amistad', 'me he sentido atraído por una persona del trabajo', 'he meado en la calle', 'he sido pillado borracho al llegar a casa', 'he sido pillado fumado al llegar a casa', 'he estado esposado', 'he sido detenido por la policía', 'he robado algo de menos de 100 euros', 'he robado algo de más de 100 euros', 'me he grabado o tomado una foto teniendo sexo', 'he tenido sexo telefónico', 'he tenido sexo con alguien que acababa de conocer', 'me he masturbado con un objeto extraño', 'he fingido un orgasmo', 'he ligado con la pareja de una amistad', 'me he masturbado fuera de casa', 'he fingido estar enfermo para no ir al trabajo', 'he fingido estar enfermo para no ir a la escuela', 'he hablado por Whatsapp con un amigo mientras estaba en el lavabo', 'he probado la comida para animales', 'le he escrito un mensaje borracho/a a mi ex', 'he espiado la nueva pareja de mi ex por redes', 'he robado copas de una discoteca', 'he hablado mal de una persona de este grupo', 'me he liado con una persona de este grupo', 'he tenido más de tres orgasmos en un día', 'he tenido más de dos orgasmos en una cita', 'he usado juguetes sexuales con mi pareja', 'he sido infiel', 'he tenido una relación abierta con mi pareja', 'he vomitado en público después de beber', 'he perdido el conocimiento después de beber', 'me he tropezado por mirar el móvil', 'he ido a trabajar borracho', 'he mentido a mis amigos', 'he mentido a mi pareja', 'he hecho un baile erótico', 'he recibido un baile erótico', 'me he tomado la pastilla del día después', "he enviado un mensaje 'hot' a un contacto equivocado", 'he paseado por casa desnudo', 'he paseado por la calle sin ropa interior', 'he consumido drogas', 'he ligado con alguien estando en pareja', 'he fingido dormir para no tener sexo', 'he tenido un fetiche extraño', 'he llegado al orgasmo con el sexo oral', 'he tenido sexo en la cocina', 'he tenido sexo en casa de otra persona', 'he tenido que huir de la policía', 'he pasado la noche en el cuartelillo', 'he jugado al streap poker', 'he tenido algo con alguien de esta habitación', 'he tenido sexo en la cama de mis padres', 'me he acostado con dos personas el mismo día', 'he hecho cosas indecentes en el cine', 'he hecho cosas indecentes en compañía de amigos', 'he llorado por una película', 'he usado preservativos de sabores', 'he besado a alguien sin saber su nombre', 'he visto porno con mi pareja', 'he hecho juegos de bondage', 'he hecho un streaptease', 'he recibido un streaptease', 'he hecho sexo oral conduciendo', 'he tenido sexo con mi expareja', 'he usado lubricante sexual', 'he recibido un cumplido por mis genitales', 'he roto la cama durante el sexo', 'he probado más de 5 posturas durante el sexo', 'me he emborrachado por la mañana', 'he probado el cibersexo', 'he jugado a ser otra persona durante el sexo', 'he gritado el nombre de otra persona durante el sexo', 'he fumado en un bong', 'he cantado en la ducha', 'me he liado con una persona casada', 'me he vestido con ropa del sexo opuesto', 'he visto a mis padres desnudos', 'he pillado a mis padres teniendo sexo', 'me he hecho un test de embarazo', 'me he masturbado más de 3 veces en un día']
    response = case data.text
               when /random/
                 surprise = [sfw_kids_text.sample, sfw_teenagers_text.sample, sfw_adults_text.sample].sample
                 ":tada: *Yo nunca nunca:*\n#{surprise}"
               when /niños/
                 ":balloon: Yo *nunca nunca* #{sfw_kids_text.sample}"
               when /(adolescente|joven)/
                 "Yo *nunca nunca* #{sfw_teenagers_text.sample}"
               when /adulto/
                 "Yo *nunca nunca* #{sfw_adults_text.sample}"
               when /nsfw/
                 if ENV['SLACK_NSFW'] == 'locked'
                   'No hay autorización para este modo, consulte con el gerente de ventas de ENERGON más cercano.'
                 else
                   send_direct_message(":kiss: Yo *nunca nunca* #{nsfw_text.sample} :fire:", data.user)
                   "Enviada directamente a <@#{data.user}>"
                 end
               when /(incomoda|awkward)/
                 "Yo *nunca nunca* #{sfw_awkward_text.sample}"
               else
                 "Yo *nunca nunca* #{sfw_adults_text.sample}"
               end
    send_message(response, data)
  end
end