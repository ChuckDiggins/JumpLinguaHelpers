//
//  JSONTest.swift
//  ContextFree
//
//  Created by Charles Diggins on 4/27/21.
//

import UIKit
import JumpLinguaHelpers

public struct JsonVerb: Codable, CustomStringConvertible {
    public var english: String
    public var french: String
    public var spanish: String
    var spanishPastPart1: String
    var spanishPastPart2: String
    var spanishGerund: String
    var transitivity: VerbTransitivity
    var verbType: String  //"RTA"
    //added some comments
    
    
    public var description: String {
        return "\(self.spanish) \(self.english) \(self.french)"
    }
    
    public init(spanish: String, english: String, french: String, transitivity: VerbTransitivity, verbType : String){
        self.spanish = spanish
        self.english = english
        self.french = french
        self.transitivity = transitivity
        self.verbType = verbType
        self.spanishPastPart1 = ""
        self.spanishPastPart2 = ""
        self.spanishGerund = ""
    }
    
    //if intransitive, then no object likes
    
    public init(spanish: String, english: String, french: String, spanishPastPart1: String = "", spanishPastPart2: String = "", spanishGerund: String = ""){
        self.spanish = spanish
        self.english = english
        self.french = french
        self.verbType = "N"
        self.transitivity = .intransitive
        self.spanishPastPart1 = spanishPastPart1
        self.spanishPastPart2 = spanishPastPart2
        self.spanishGerund = spanishGerund
    }
    
    public func getSpanishPastParticiple1()->String{
        spanishPastPart1
    }
    
    public func getSpanishGerund()->String{
        spanishGerund
    }
}

/*
 
 AGREE WITH - estar de acuerdo - "All women are bad drivers." "I don't agree with you."
 BE ABOUT TO - estar a punto de -I was about to leave the house when my friends arrived.
 BE BACK - regresar -I'm working late at the office tonight so I won't be back until 10.
 BE OUT OF - quedarse sin - We're out of eggs so we can't make a tortilla.
 BE OVER - terminarse - When the football match was over, we went to the pub.
 BE UP - estar levantado - "Phil isn't up yet: he's still in bed. Phone again in ten minutes."
 BLOW UP - estallar (una bomba) - The bomb blew up killing six people.
 BLOW UP - inflar - We blew up at least a hundred balloons for the Christmas party.
 BREAK DOWN - averiarse - My car broke down on the way to Motril.
 CALL BACK - volver a llamar - "I'm afraid the manager isn't here at the moment. Could you call back later?"
 CARRY ON - seguir. continuar - I'm sorry if I interrupted you. Please carry on.
 CARRY OUT - cumplir (una promesa) - The President carried out his promise to reduce taxation.
 CARRY OUT - llevar a cabo - The execution was carried out at seven o'clock in the morning.
 CLEAR UP - poner en orden - It took four hours to clear up after the party.
 */

var MichelleCarpeterVerbList3: [JsonVerb] = [
    
]

var myPhrasalVerbList: [JsonVerb] = [
    
    JsonVerb(spanish: "estar de acuerdo", english: "agree with",    french: "être d'accord avec", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar a punto de", english: "be about to",    french: "être sur le point de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "regresar", english: "be back",    french: "être de retour", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "quedarse sin", english: "be out of",    french: "être hors de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "terminarse", english: "be over",    french: "être fini", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estar levantado", english: "be up",    french: "être levé", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "estallar", english: "blow up",    french: "faire exploser", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "inflar", english: "blow up",    french: "faire sauter", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "averiarse", english: "break down",    french: "abattre", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "seguir", english: "carry on",    french: "poursuivre", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "cumplir", english: "carry out",    french: "effectuer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "agacharse", english: "bend over",    french: "se pencher", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "poner en orden", english: "blow out",    french: "souffler", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "irrumpir", english: "break in",    french: "entrer par effraction", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "aspirar", english: "breathe in",    french: "inspirer", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "retraer", english: "bring back",    french: "rapporter", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "volver a llamar", english: "call back",    french: "rentrer dans", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "aclarar", english: "clear up",    french: "rappeler", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "llamar a", english: "call on",    french: "redre visite à", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "preocuparse por", english: "care about",    french: "se soucier de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "cuidar de", english: "care for",    french: "s'occuper de", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "registrarse en", english: "check in",    french: "se présenter à l'enregistrement", transitivity: .ambitransitive, verbType : "NAC"),
]

var myMultiLingualVerbListB: [JsonVerb] = [
    JsonVerb(spanish: "regresar", english: "be back",    french: "être de retour", transitivity: .ambitransitive, verbType : "NAC"),
    
    JsonVerb(spanish: "registrarse en", english: "check in",    french: "se présenter à l'enregistrement", transitivity: .ambitransitive, verbType : "NAC"),
    JsonVerb(spanish: "cuidar de", english: "care for",    french: "s'occuper de", transitivity: .ambitransitive, verbType : "NAC"),
]

var myMasterVerbList: [JsonVerb] = [
    JsonVerb(spanish: "abandonar", english: "abandon",    french: "partir"),
    
    JsonVerb(spanish: "abarcar", english: "embrace",    french: "englober"),
    JsonVerb(spanish: "abatir", english: "abandon",    french: "partir"),
    JsonVerb(spanish: "abdicar", english: "abdicate",    french: "abdiquer"),
    JsonVerb(spanish: "ablandar", english: "melt",    french: "aboucir"),
    JsonVerb(spanish: "aborrecer", english: "abhor",    french: "détester"),
    JsonVerb(spanish: "abolir", english: "abolish",    french: "abolir"),
    JsonVerb(spanish: "abrir", english: "open",        french: "ouvrir", spanishPastPart1: "abierto"),
    JsonVerb(spanish: "abrazar", english: "hug",    french: "embrasser"),
    JsonVerb(spanish: "abrazarse", english: "hug each other",    french: "s'embrasser"),
    JsonVerb(spanish: "absolver", english: "absolve",    french: "absoudre", spanishPastPart1: "absuelto"),
    JsonVerb(spanish: "abstener", english: "abstain",    french: "s'abstenir"),
    JsonVerb(spanish: "aburrir", english: "bore", french: "ennuyer"),
    JsonVerb(spanish: "aburrirse", english: "be bored", french: "s'ennuyer"),
    JsonVerb(spanish: "abusar", english: "abuse",    french: "abuser"),
    JsonVerb(spanish: "acabar", english: "begin",      french: "commencer"),
    JsonVerb(spanish: "acaecer", english: "happen",   french: "arriver"),
    JsonVerb(spanish: "acaer", english: "fall", french: "tomber"),
    JsonVerb(spanish: "acalorarse", english: "get hot",    french: "chauffer"),
    JsonVerb(spanish: "acariciar", english: "caress",    french: "caresser"),
    JsonVerb(spanish: "accionar", english: "activate",    french: "actionner"),
    JsonVerb(spanish: "acelerar", english: "accelerate",    french: "accélérer"),
    JsonVerb(spanish: "aceptar", english: "accept",    french: "accepter"),
    JsonVerb(spanish: "acercar", english: "bring closer",    french: "rapprocher"),
    JsonVerb(spanish: "acercarse", english: "approach",    french: "se rapprocher"),
    JsonVerb(spanish: "acertar", english: "guess",    french: "frapper"),
    JsonVerb(spanish: "aclamar", english: "acclaim",    french: "acclamer"),
    JsonVerb(spanish: "aclarar", english: "clear up",    french: "rappeler"),
    JsonVerb(spanish: "acometer", english: "cease",    french: "entreprendre"),
    JsonVerb(spanish: "acompañar", english: "accompany",    french: "accompagner"),
    JsonVerb(spanish: "aconsejar", english: "advise",    french: "partir"),
    JsonVerb(spanish: "acontecer", english: "happen",   french: "arriver"),
    JsonVerb(spanish: "acoger", english: "embrace",    french: "embrasser"),
    JsonVerb(spanish: "actuar", english: "act",      french: "agir"),
    JsonVerb(spanish: "aceptar", english: "accept",    french: "accepter"),
    JsonVerb(spanish: "acreditar", english: "authorize",    french: "accréditer"),
    JsonVerb(spanish: "activar", english: "activate",    french: "activer"),
    JsonVerb(spanish: "actuar", english: "perform",    french: "actionner"),
    JsonVerb(spanish: "acudir", english: "attend",    french: "fréquenter"),
    JsonVerb(spanish: "acumular", english: "accumulate",    french: "accumuler"),
    JsonVerb(spanish: "acusar", english: "accuse",    french: "accusere"),
    JsonVerb(spanish: "adecuar", english: "adapt", french: "adapter"),
    JsonVerb(spanish: "adelantar", english: "advance",    french: "dépasser"),
    JsonVerb(spanish: "adelgazar", english: "lose weight",    french: "perdre eu poids"),
    JsonVerb(spanish: "adivinar", english: "foretell",    french: "deviner"),
    JsonVerb(spanish: "admitir", english: "admit",    french: "admettre"),
    JsonVerb(spanish: "adoptar", english: "adopt",    french: "adopter"),
    JsonVerb(spanish: "adorar", english: "adore",    french: "adorer"),
    JsonVerb(spanish: "adquirir", english: "acquire",    french: "acquérir"),
    JsonVerb(spanish: "advertir", english: "advise",    french: "avertir"),
    JsonVerb(spanish: "aducir", english: "adduce",    french: "apporter"),
    JsonVerb(spanish: "afectar", english: "affect",    french: "affecter"),
    JsonVerb(spanish: "afligir", english: "upset",    french: "affliger"),
    JsonVerb(spanish: "afluir", english: "afflict",    french: "affliger"),
    JsonVerb(spanish: "agarrar", english: "grasp",    french: "saisir"),
    JsonVerb(spanish: "agitar", english: "agitate",    french: "secouer"),
    JsonVerb(spanish: "agotar", english: "use up",    french: "épuiser"),
    JsonVerb(spanish: "agradar", english: "please",    french: "plaire"),
    JsonVerb(spanish: "agregar", english: "add", french: "ajouter"),
    JsonVerb(spanish: "agradecer", english: "thank", french: "remercier"),
    JsonVerb(spanish: "agrandar", english: "enlarge",    french: "agrandir"),
    JsonVerb(spanish: "agravar", english: "aggravate",    french: "aggraver"),
    JsonVerb(spanish: "agrupar", english: "form groups",    french: "grouper"),
    JsonVerb(spanish: "aguar", english: "wait", french: "attendre"),
    JsonVerb(spanish: "aguantar", english: "tolerate",    french: "endurer"),
    JsonVerb(spanish: "ahijar", english: "goddaughter", french: "ahorrar"),
    JsonVerb(spanish: "ahilar", english: "grind", french: "moudre"),
    JsonVerb(spanish: "ahincar", english: "perservere",    french: "conduire dans"),
    JsonVerb(spanish: "ahorrar", english: "economize",    french: "economiser"),
    JsonVerb(spanish: "ahuchar", english: "hoard", french: "amasser"),
    JsonVerb(spanish: "ahumar", english: "smoke", french: "fumer"),
    JsonVerb(spanish: "airar", english: "anger",    french: "mettre en colère"),
    JsonVerb(spanish: "aislar", english: "isolate",    french: "isoler"),
    JsonVerb(spanish: "alborozar", english: "rejoice",    french: "réjouir"),
    JsonVerb(spanish: "alcanzar", english: "attain",    french: "attteindre"),
    JsonVerb(spanish: "almorzar", english: "eat lunch",    french: "déjeuner"),
    JsonVerb(spanish: "alocar", english: "allocate",    french: "allouer"),
    JsonVerb(spanish: "alquilar", english: "rent",    french: "louer"),
    JsonVerb(spanish: "alumbrar", english: "illuminate",    french: "lumsère"),
    JsonVerb(spanish: "alzar", english: "pick up",    french: "soulever"),
    JsonVerb(spanish: "amanecer", english: "dawn",    french: "se lever"),
    JsonVerb(spanish: "amar", english: "love",    french: "aimer"),
    JsonVerb(spanish: "amarse", english: "love each other",    french: "aimer"),
    JsonVerb(spanish: "amortiguar", english: "cushion", french: "amortir"),
    JsonVerb(spanish: "añadir", english: "add", french: "ajouter"),
    JsonVerb(spanish: "andar", english: "walk", french: "promener"),
    JsonVerb(spanish: "analizar", english: "analyze",    french: "analyser"),
    JsonVerb(spanish: "animar", english: "animate",    french: "encourager"),
    JsonVerb(spanish: "anochecer", english: "get dark",    french: "faire noir"),
    JsonVerb(spanish: "anunciar", english: "announce",    french: "annoncer"),
    JsonVerb(spanish: "apaciguar", english: "appease", french: "apaiser"),
    JsonVerb(spanish: "apagar", english: "turn off",    french: "éteindre"),
    JsonVerb(spanish: "aparecer", english: "appear", french: "apparaître"),
    JsonVerb(spanish: "aplaudir", english: "applaud",    french: "applaudir"),
    
    JsonVerb(spanish: "apostar", english: "bet",    french: "parier"),
    JsonVerb(spanish: "apreciar", english: "appreciate",    french: "chérir"),
    JsonVerb(spanish: "aprender", english: "learn", french: "apprendre"),
    JsonVerb(spanish: "aprobar", english: "approve",    french: "approuver"),
    JsonVerb(spanish: "arcaizar", english: "archaize", french: "archaïser"),
    JsonVerb(spanish: "ascender", english: "ascend", french: "monter"),
    JsonVerb(spanish: "aprovechar", english: "take advantage of",    french: "tirer profit"),
    
    JsonVerb(spanish: "apurar", english: "hurry",    french: "se dépêcher"),
    JsonVerb(spanish: "arrancar", english: "tear off",    french: "démarrer"),
    JsonVerb(spanish: "arreglar", english: "arrange",    french: "organiser"),
    JsonVerb(spanish: "arrojar", english: "throw",    french: "jeter"),
    JsonVerb(spanish: "articular", english: "articulate",    french: "articuler"),
    JsonVerb(spanish: "asegurar", english: "assure",    french: "assurer"),
    JsonVerb(spanish: "asir", english: "seize", french: "asir"),
    JsonVerb(spanish: "asistir a", english: "attend", french: "assister à"),
    JsonVerb(spanish: "aspirar", english: "breathe in",    french: "inspirer"),
    JsonVerb(spanish: "asustarse", english: "be scared",    french: "avoir peur"),
    JsonVerb(spanish: "atacar", english: "attack",    french: "xxxer"),
    JsonVerb(spanish: "atañer", english: "concern", french: "concerner"),
    JsonVerb(spanish: "atardecer", english: "sun set", french: "coucher du soleil"),
    
    JsonVerb(spanish: "atestiguar", english: "testify", french: "témoigner"),
    JsonVerb(spanish: "atraer", english: "attract",    french: "attirer", spanishPastPart1: "atraído"),
    JsonVerb(spanish: "atraillar", english: "lure",    french: "leurre"),
    JsonVerb(spanish: "atender", english: "attend", french: "assister à"),
    JsonVerb(spanish: "atravesar", english: "cross",    french: "travesar"),
    JsonVerb(spanish: "atreverse", english: "dare",    french: "oser"),
    JsonVerb(spanish: "aullar", english: "yell", french: "hurler"),
    JsonVerb(spanish: "avanzar", english: "advance",    french: "avancer"),
    JsonVerb(spanish: "avergonzar", english: "be ashamed", french: "embarrasser"),
    JsonVerb(spanish: "averiguar", english: "find out", french: "déterminer"),
    JsonVerb(spanish: "ayudar", english: "help", french: "aider"),
    JsonVerb(spanish: "ayudar", english: "help each other", french: "aider"),
    
    JsonVerb(spanish: "bailar", english: "dance",    french: "danser"),
    JsonVerb(spanish: "bajar", english: "reduce",    french: "descendre"),
    JsonVerb(spanish: "bañar", english: "bathe",    french: "baigner"),
    JsonVerb(spanish: "barrer", english: "sweep",    french: "balayer"),
    JsonVerb(spanish: "bastar", english: "suffice",    french: "être assez"),
    JsonVerb(spanish: "beber", english: "drink", french: "boire"),
    JsonVerb(spanish: "beneficiar", english: "benefit",    french: "bénéficier à"),
    JsonVerb(spanish: "bendecir", english: "bless",    french: "bénir", spanishPastPart1: "bendicho"),
    JsonVerb(spanish: "besar", english: "kiss",    french: "embrasser"),
    JsonVerb(spanish: "besar", english: "kiss each other",    french: "embrasser"),
    JsonVerb(spanish: "bisbisar", english: "mutter",    french: "chuchoter"),
    JsonVerb(spanish: "bloquear", english: "block",    french: "bloquer"),
    JsonVerb(spanish: "bordear", english: "border",    french: "frontière sur"),
    JsonVerb(spanish: "borrar", english: "erase",    french: "effacer"),
    JsonVerb(spanish: "bostezar", english: "yawn",    french: "bâiller"),
    JsonVerb(spanish: "botar", english: "discard",    french: "jeter"),
    JsonVerb(spanish: "bregar", english: "toil",    french: "lutter"),
    JsonVerb(spanish: "bromear", english: "joke",    french: "plaisanter"),
    JsonVerb(spanish: "brotar", english: "sprout",    french: "pousser"),
    JsonVerb(spanish: "bruñir", english: "polish", french: "polir"),
    JsonVerb(spanish: "bullir", english: "seethe",    french: "bouillir"),
    JsonVerb(spanish: "buscar", english: "look for",    french: "chercher"),
    JsonVerb(spanish: "caber", english: "fit", french: "s'adapter"),
    JsonVerb(spanish: "cacar", english: "drink", french: "tocar"),
    JsonVerb(spanish: "caducar", english: "expire", french: "expirer"),
    JsonVerb(spanish: "calcar", english: "trace", french: "tracer"),
    JsonVerb(spanish: "caer", english: "fall", french: "tomber", spanishPastPart1: "caído"),
    JsonVerb(spanish: "caerse", english: "fall over", french: "tomber", spanishPastPart1: "caído"),
    JsonVerb(spanish: "calentar", english: "warm up",    french: "à réchauffer"),
    JsonVerb(spanish: "callarse", english: "be quiet",    french: "se taire"),
    JsonVerb(spanish: "cambiar", english: "change",    french: "changer"),
    JsonVerb(spanish: "caminar", english: "walk",    french: "marcher"),
    JsonVerb(spanish: "cantar", english: "sing", french: "chanter"),
    JsonVerb(spanish: "capitalizar", english: "capitalize",    french: "capitaliser"),
    JsonVerb(spanish: "carecer", english: "lack", french: "caracer"),
    JsonVerb(spanish: "cargar", english: "load", french: "porter"),
    
    JsonVerb(spanish: "cazar", english: "hunt", french: "chasser"),
    JsonVerb(spanish: "cegar", english: "blind", french: "aveugler"),
    JsonVerb(spanish: "celebrar", english: "celebrate", french: "célèbrer"),
    JsonVerb(spanish: "cenar", english: "eat dinner", french: "dîner"),
    JsonVerb(spanish: "cepillar", english: "brush", french: "brosser"),
    
    JsonVerb(spanish: "cerner", english: "sift", french: "tamiser"),
    JsonVerb(spanish: "cernir", english: "sift", french: "tamiser"),
    JsonVerb(spanish: "cerrar", english: "close", french: "fermer"),
    JsonVerb(spanish: "certificar", english: "celebrate", french: "certifier"),
    JsonVerb(spanish: "charlar", english: "chat", french: "bavader"),
    JsonVerb(spanish: "chistar", english: "mumble", french: "plaisanter"),
    JsonVerb(spanish: "chocar", english: "crash", french: "planter"),
    JsonVerb(spanish: "chupar", english: "suck", french: "sucer"),
    JsonVerb(spanish: "citar", english: "cite", french: "citer"),
    JsonVerb(spanish: "cobrar", english: "earn", french: "charger"),
    
    
    JsonVerb(spanish: "cocer", english: "cook", french: "cuisiner"),
    JsonVerb(spanish: "cocinar", english: "cook",    french: "cuisiner"),
    JsonVerb(spanish: "coger", english: "catch", french: "prendre"),
    JsonVerb(spanish: "cohibir", english: "restrain", french: "s'retenir"),
    JsonVerb(spanish: "colgar", english: "hang", french: "raccrocher"),
    JsonVerb(spanish: "colegir", english: "collect",    french: "collecter"),
    JsonVerb(spanish: "colocar", english: "place", french: "placer"),
    
    JsonVerb(spanish: "comenzar", english: "begin",    french: "commencer"),
    
    JsonVerb(spanish: "comer", english: "eat", french: "manger"),
    JsonVerb(spanish: "cometer", english: "commit", french: "se engager"),
    JsonVerb(spanish: "comparecer", english: "compare", french: "comparer"),
    
    JsonVerb(spanish: "compartir", english: "share", french: "partager"),
    JsonVerb(spanish: "componer", english: "compose", french: "composer"),
    
    JsonVerb(spanish: "competir", english: "compete",    french: "concourir"),
    JsonVerb(spanish: "comprar", english: "buy",    french: "acheter"),
    JsonVerb(spanish: "comprender", english: "understand",    french: "comprender"),
    JsonVerb(spanish: "computarizar", english: "computerize",    french: "informatiser"),
    JsonVerb(spanish: "conocer", english: "know",    french: "connaître"),
    JsonVerb(spanish: "conocerse", english: "know each other",    french: "connaître"),
    JsonVerb(spanish: "conducir", english: "drive",    french: "conduire"),
    JsonVerb(spanish: "confesar", english: "confess",    french: "avouer"),
    JsonVerb(spanish: "conjugar", english: "conjugate",    french: "combiner"),
    JsonVerb(spanish: "conseguir", english: "obtain",    french: "avoir"),
    JsonVerb(spanish: "constituir", english: "constitute", french: "constituer"),
    JsonVerb(spanish: "construir", english: "build",    french: "construire"),
    JsonVerb(spanish: "contar", english: "tell",    french: "raconter"),
    JsonVerb(spanish: "contener", english: "contain", french: "contenir"),
    JsonVerb(spanish: "contender", english: "contend", french: "combattre"),
    JsonVerb(spanish: "contestar", english: "answer",    french: "répondre"),
    JsonVerb(spanish: "continuar", english: "continue",    french: "continuer"),
    JsonVerb(spanish: "contorcerse", english: "contort",    french: "tordre"),
    JsonVerb(spanish: "contrapoder", english: "counter", french: "contrer"),
    JsonVerb(spanish: "contradecir", english: "contradict", french: "contradire", spanishPastPart1: "contradicho"),
    JsonVerb(spanish: "contribuir", english: "contribute",    french: "contribuer"),
    
    JsonVerb(spanish: "convencer", english: "convince",    french: "convaincre"),
    JsonVerb(spanish: "convenir", english: "agree",    french: "accepter"),
    
    JsonVerb(spanish: "converger", english: "converge",    french: "converger"),
    JsonVerb(spanish: "convertir", english: "convert",    french: "convertir"),
    JsonVerb(spanish: "convocar", english: "convene",    french: "convoquer"),
    JsonVerb(spanish: "corregir", english: "correct",    french: "corriger"),
    JsonVerb(spanish: "correr", english: "run",    french: "courir"),
    JsonVerb(spanish: "cortar", english: "cut",    french: "couper"),
    JsonVerb(spanish: "costar", english: "cost",    french: "coûter"),
    JsonVerb(spanish: "cotizar", english: "quote",    french: "citer"),
    JsonVerb(spanish: "crear", english: "create",    french: "créer"),
    JsonVerb(spanish: "crecer", english: "grow",    french: "grandir"),
    JsonVerb(spanish: "creer", english: "believe",    french: "croire", spanishPastPart1: "creído"),
    JsonVerb(spanish: "criar", english: "raise",    french: "élever"),
    JsonVerb(spanish: "cruzar", english: "cross",    french: "traveser"),
    JsonVerb(spanish: "cubrir", english: "cover", french: "couvrir", spanishPastPart1: "cubierto"),
    JsonVerb(spanish: "cuidar de", english: "care for",    french: "s'occuper de"),
    
    JsonVerb(spanish: "cumplir", english: "fulfill",    french: "effectuer"),
    JsonVerb(spanish: "dar", english: "give",    french: "donner"),
    JsonVerb(spanish: "dar un discurso", english: "give a speech",    french: "faire un discours"),
    JsonVerb(spanish: "deber", english: "owe", french: "devoir"),
    JsonVerb(spanish: "decaer", english: "decay", french: "dépérir"),
    JsonVerb(spanish: "decir", english: "say",   french: "dire", spanishPastPart1: "dicho"),
    JsonVerb(spanish: "decidir", english: "decide", french: "décider"),
    JsonVerb(spanish: "declarar", english: "declare",    french: "déclarer"),
    JsonVerb(spanish: "dedicar", english: "dedicate",    french: "consacrer"),
    JsonVerb(spanish: "deducir", english: "deduce",    french: "déduire"),
    JsonVerb(spanish: "defender", english: "defend", french: "défendre"),
    JsonVerb(spanish: "defoír", english: "stop", french: "arrêter"),
    JsonVerb(spanish: "dejar", english: "leave",    french: "partir"),
    JsonVerb(spanish: "delinquir", english: "commit a crime", french: "offenser"),
    JsonVerb(spanish: "demostrar", english: "show",    french: "afficher"),
    JsonVerb(spanish: "denegar", english: "refuse",    french: "nier"),
    JsonVerb(spanish: "denunciar", english: "denounce",    french: "dénoncer"),
    JsonVerb(spanish: "depender", english: "depend on",    french: "dépendre"),
    JsonVerb(spanish: "deponer", english: "abandon",    french: "déposer"),
    JsonVerb(spanish: "deportar", english: "deport",    french: "deportar"),
    JsonVerb(spanish: "derelinquir", english: "relinquish",    french: "abandonner"),
    JsonVerb(spanish: "derelinquir", english: "tear up ",    french: "déchirer"),
    JsonVerb(spanish: "derivar", english: "derive",    french: "dériver"),
    JsonVerb(spanish: "derribar", english: "demolish",    french: "démolir"),
    JsonVerb(spanish: "desafiar", english: "defy",    french: "contester"),
    JsonVerb(spanish: "desahijar", english: "uproot",    french: "déraciner"),
    JsonVerb(spanish: "desairar", english: "snub",    french: "snober"),
    JsonVerb(spanish: "desamparar", english: "abandon",    french: "abandonner"),
    JsonVerb(spanish: "desandar", english: "retrace",    french: "retracer"),
    JsonVerb(spanish: "desoír", english: "ignore", french: "ignorer"),
    JsonVerb(spanish: "desaparecer", english: "disappear",    french: "disparaître"),
    JsonVerb(spanish: "desasir", english: "undo", french: "lâcher prise"),
    
    JsonVerb(spanish: "descansar", english: "rest",    french: "se reposer"),
    JsonVerb(spanish: "descargar", english: "download", french: "télécharger"),
    JsonVerb(spanish: "descender", english: "descend", french: "descendre"),
    JsonVerb(spanish: "descreer", english: "disbelieve",    french: "ne-pas-croire"),
    JsonVerb(spanish: "describir", english: "describe", french: "décrire"),
    JsonVerb(spanish: "descubrir", english: "discover", french: "découvrir", spanishPastPart1: "descubierto"),
    
    JsonVerb(spanish: "desear", english: "desire",    french: "souhaiter"),
    JsonVerb(spanish: "desenvolver", english: "unwrap", french: "déballer", spanishPastPart1: "desenvuelto"),
    JsonVerb(spanish: "deshacer", english: "undo", french: "défaire", spanishPastPart1: "deshecho"),
    JsonVerb(spanish: "deslizar", english: "slide",    french: "faire glisser"),
    JsonVerb(spanish: "desolar", english: "desolate", french: "désoler"),
    JsonVerb(spanish: "desosar", english: "bone", french: "délier"),
    JsonVerb(spanish: "despedir", english: "say goodbye", french: "dire au revoir"),
    JsonVerb(spanish: "despedirse", english: "say goodbye to each other", french: "dire au revoir"),
    JsonVerb(spanish: "desplegar", english: "unfold", french: "dérouler"),
    JsonVerb(spanish: "despavorir", english: "terrify", french: "terrifier"),
    JsonVerb(spanish: "despoblar", english: "depopulate",    french: "dépeupler"),
    JsonVerb(spanish: "deservir", english: "serve", french: "servir"),
    JsonVerb(spanish: "desleír", english: "dissolve", french: "dissoudre"),
    JsonVerb(spanish: "deslucir", english: "fade", french: "s'effacer"),
    JsonVerb(spanish: "desposeer", english: "dispossess",    french: "déposséder"),
    JsonVerb(spanish: "despoveer", english: "deprive",    french: "priver"),
    JsonVerb(spanish: "desraizar", english: "uproot",    french: "déraciner"),
    JsonVerb(spanish: "destacar", english: "emphasize",    french: "souligner"),
    JsonVerb(spanish: "desterrar", english: "exile",    french: "bannir"),
    JsonVerb(spanish: "destituir", english: "deprive",    french: "congédir"),
    JsonVerb(spanish: "destorcer", english: "untwist",    french: "défaire"),
    JsonVerb(spanish: "detener", english: "detain", french: "arrêter"),
    
    JsonVerb(spanish: "devolver", english: "return", french: "retourner", spanishPastPart1: "devuelto"),
    JsonVerb(spanish: "dibujar", english: "draw",    french: "dessiner"),
    JsonVerb(spanish: "dirigir", english: "manage",    french: "mener"),
    JsonVerb(spanish: "discernir", english: "discern",    french: "discerner"),
    JsonVerb(spanish: "discubrir", english: "discover",    french: "découvrir"),
    
    JsonVerb(spanish: "discutir", english: "discuss", french: "se disputer"),
    JsonVerb(spanish: "diseñar", english: "design",    french: "concevoir"),
    JsonVerb(spanish: "disfrutar", english: "enjoy",    french: "jouir"),
    JsonVerb(spanish: "disminuir", english: "decrease",    french: "diminuer"),
    JsonVerb(spanish: "disonar", english: "disharmonize",    french: "désharmoniser"),
    JsonVerb(spanish: "dispensar", english: "dispense",    french: "distribuer"),
    JsonVerb(spanish: "dispersar", english: "disperse",    french: "disperser"),
    JsonVerb(spanish: "distinguir", english: "distinguish",    french: "distinguer"),
    JsonVerb(spanish: "distribuir", english: "distribute",    french: "distribuer"),
    JsonVerb(spanish: "divergir", english: "diverge",    french: "diverger"),
    JsonVerb(spanish: "divertir", english: "entertain",    french: "amuser"),
    
    JsonVerb(spanish: "doler", english: "hurt", french: "faire mal"),
    JsonVerb(spanish: "dormir", english: "sleep",    french: "dormir"),
    JsonVerb(spanish: "dormirse", english: "fall asleep",    french: "s'endormir"),
    JsonVerb(spanish: "dotar", english: "endow",    french: "doter"),
   
    JsonVerb(spanish: "dudar", english: "doubt",    french: "doute"),
    JsonVerb(spanish: "echar", english: "throw",    french: "jeter"),
    JsonVerb(spanish: "ejercer", english: "exercise",    french: "s'exercer"),
    JsonVerb(spanish: "ejecutar", english: "execute",    french: "exécuter"),
    JsonVerb(spanish: "elegir", english: "elect",    french: "choisir"),
    JsonVerb(spanish: "embeber", english: "soak up",    french: "absorber"),
    JsonVerb(spanish: "emerger", english: "emerge",    french: "émerger"),
    JsonVerb(spanish: "empedernir", english: "harden", french: "durcir"),
    JsonVerb(spanish: "empezar", english: "begin",    french: "commencer"),
    JsonVerb(spanish: "emplear", english: "employ",    french: "employer"),
    JsonVerb(spanish: "encantar", english: "enchant", french: "adorer"),
    JsonVerb(spanish: "encender", english: "turn on", french: "allumer"),
    JsonVerb(spanish: "encerrar", english: "lock up",    french: "clôturer"),
    JsonVerb(spanish: "encoger", english: "shrink",    french: "rétrécir"),
    JsonVerb(spanish: "encontrar", english: "find",    french: "trouver"),
    JsonVerb(spanish: "encontrarse", english: "find person",    french: "se trouver"),
    JsonVerb(spanish: "enfadar", english: "anger",    french: "colère"),
    
    JsonVerb(spanish: "engreír", english: "spoil", french: "gâcher"),
    JsonVerb(spanish: "engullir", english: "gobble", french: "engloutir"),
    JsonVerb(spanish: "enlucir", english: "plaster", french: "plâtrer"),
    JsonVerb(spanish: "enojar", english: "get angry", french: "colère"),
    JsonVerb(spanish: "enojarse", english: "get angry at each other", french: "ennuyer"),
    
    JsonVerb(spanish: "enrocar", english: "castle", french: "roquer"),
    JsonVerb(spanish: "ensayar", english: "test", french: "essayer"),
    JsonVerb(spanish: "enseñar", english: "teach",    french: "enseigner"),
    
    JsonVerb(spanish: "enraizar", english: "take root",    french: "rooter"),
    
    JsonVerb(spanish: "entapizar", english: "upholster",    french: "tapisser"),
    JsonVerb(spanish: "entender", english: "understand",    french: "comprendre"),
    JsonVerb(spanish: "entenderse", english: "understand each other",    french: "comprendre"),
    
    JsonVerb(spanish: "entrecoger", english: "catch",    french: "attraper"),
    JsonVerb(spanish: "entredecir", english: "interdict", french: "ignorer"),
    JsonVerb(spanish: "entrelucir", english: "scramble", french: "débrouiller"),
    JsonVerb(spanish: "entrar", english: "enter", french: "entrer"),
    JsonVerb(spanish: "entrar en", english: "enter into", french: "entrer dans"),
    JsonVerb(spanish: "entregar", english: "deliver", french: "livrer"),
    JsonVerb(spanish: "entretener", english: "entertain", french: "s'amuser"),
    JsonVerb(spanish: "entreoír", english: "listen", french: "écouter"),
    JsonVerb(spanish: "enunciar", english: "enunciate",    french: "énoncer"),
    JsonVerb(spanish: "envolver", english: "wrap up", french: "envelopper"),
    JsonVerb(spanish: "enternecer", english: "soften", french: "adoucir"),
    
    JsonVerb(spanish: "erguir", english: "erect",    french: "ériger"),
    
    JsonVerb(spanish: "erigir", english: "erect",    french: "ériger"),
    JsonVerb(spanish: "errar", english: "err",    french: "se tromper"),
    JsonVerb(spanish: "escocer", english: "burn",    french: "brûler"),
    JsonVerb(spanish: "escoger", english: "select",    french: "choisir"),
    JsonVerb(spanish: "escribir", english: "write",    french: "écrire", spanishPastPart1: "escrito"),
    JsonVerb(spanish: "escribirse", english: "write to each other",    french: "écrire", spanishPastPart1: "escrito"),
    JsonVerb(spanish: "escuchar", english: "listen", french: "écouter"),
    JsonVerb(spanish: "esparcir", english: "scatter",    french: "disperser"),
    JsonVerb(spanish: "esperar", english: "wait",    french: "attendre"),
    JsonVerb(spanish: "esquiar", english: "ski",    french: "skier"),
    JsonVerb(spanish: "estallar", english: "blow up",    french: "faire exploser"),
    JsonVerb(spanish: "estar", english: "be",    french: "être"),
    JsonVerb(spanish: "estudiar", english: "study",    french: "etudier"),
    JsonVerb(spanish: "europeizar", english: "Europeanize",    french: "européaniser"),
    JsonVerb(spanish: "evaluar", english: "evaluate",    french: "évaluer"),
    JsonVerb(spanish: "excluir", english: "exclude",    french: "exclure"),
    JsonVerb(spanish: "exigir", english: "demand",    french: "exiger"),
    JsonVerb(spanish: "existir", english: "fire",    french: "exister"),
    JsonVerb(spanish: "extinguir", english: "put out", french: "éteindre"),
    JsonVerb(spanish: "expedir", english: "publish", french: "publier"),
    JsonVerb(spanish: "explicar", english: "explain", french: "expliquer"),
    JsonVerb(spanish: "extender", english: "extend", french: "étendre"),
    JsonVerb(spanish: "fabricar", english: "manufacture",    french: "fabriquer"),
    JsonVerb(spanish: "fallecer", english: "die", french: "mourir"),
    JsonVerb(spanish: "faltar", english: "miss", french: "manquer"),
    JsonVerb(spanish: "fascinar", english: "fascinate", french: "fasciner"),
    JsonVerb(spanish: "favorecer", english: "favor",    french: "faveur"),
    JsonVerb(spanish: "felicitar", english: "congratulate",    french: "féliciter"),
    JsonVerb(spanish: "festejar", english: "celebrate",    french: "célèbrer"),
    JsonVerb(spanish: "fiar", english: "sell on credit",    french: "faire confiance"),
    
    JsonVerb(spanish: "finalizar", english: "finish",    french: "finir"),
    JsonVerb(spanish: "fingir", english: "pretend",    french: "faire semblant"),
    JsonVerb(spanish: "firmar", english: "sign",    french: "signer"),
    JsonVerb(spanish: "formar", english: "shape",    french: "s'entraîner"),
    JsonVerb(spanish: "forzar", english: "force",    french: "obliger"),
    JsonVerb(spanish: "fregar", english: "scrub",    french: "frotter"),
    JsonVerb(spanish: "fraguar", english: "forge", french: "forger"),
    JsonVerb(spanish: "freír", english: "fry",    french: "frire", spanishPastPart1: "freído", spanishPastPart2: "frito"),
    JsonVerb(spanish: "fulgir", english: "glow",    french: "briller"),
    JsonVerb(spanish: "fumar", english: "smoke",    french: "fumer"),
    JsonVerb(spanish: "funcionar", english: "function",    french: "fonctionner"),
    JsonVerb(spanish: "fungir", english: "serve",    french: "servir"),
    
    JsonVerb(spanish: "ganar", english: "earn", french: "gagner"),
    JsonVerb(spanish: "gañir", english: "yelp", french: "japper"),
    JsonVerb(spanish: "garantizar", english: "guarantee", french: "garantir"),
    JsonVerb(spanish: "gastar", english: "waste", french: "dépenser"),
    JsonVerb(spanish: "gemir", english: "groan",    french: "gémir"),
    JsonVerb(spanish: "generalizar", english: "generalize",    french: "généraliser"),
    JsonVerb(spanish: "gobernar", english: "govern", french: "gouverner"),
    JsonVerb(spanish: "golpear", english: "strike", french: "frapper"),
    JsonVerb(spanish: "gozar", english: "enjoy", french: "jouir"),
    JsonVerb(spanish: "grabar", english: "record", french: "enregistrer"),
    JsonVerb(spanish: "graduar", english: "graduate", french: "obtenir une diplôme"),
    JsonVerb(spanish: "granizar", english: "hail", french: "saluer"),
    JsonVerb(spanish: "gritar", english: "scream", french: "crier"),
    JsonVerb(spanish: "gruñir", english: "growl", french: "grogner"),
    JsonVerb(spanish: "guiar", english: "guide", french: "guider"),
    JsonVerb(spanish: "gustar", english: "be pleasing to", french: "aimer"),
    JsonVerb(spanish: "haber", english: "have",    french: "avoir"),
    JsonVerb(spanish: "hablar", english: "talk",    french: "parler"),
    JsonVerb(spanish: "hablarse", english: "talk to each other",    french: "parler"),
    JsonVerb(spanish: "hacer", english: "make",    french: "faire", spanishPastPart1: "hecho"),
    JsonVerb(spanish: "hacer una pregunta", english: "ask a question",    french: "poser une question"),
    JsonVerb(spanish: "hallar", english: "find", french: "trouver"),
    JsonVerb(spanish: "hastiar", english: "disgust", french: "dégoûter"),
    JsonVerb(spanish: "helar", english: "freeze", french: "geler"),
    JsonVerb(spanish: "heredar", english: "inherit", french: "hériter"),
    JsonVerb(spanish: "herir", english: "hurt", french: "blesser"),
    JsonVerb(spanish: "hervir", english: "boil",    french: "bouillir"),
    JsonVerb(spanish: "holgar", english: "hang out",    french: "traîner"),
    JsonVerb(spanish: "homogeneizar", english: "standardize", french: "homogénéiser"),
    JsonVerb(spanish: "hozar", english: "root",    french: "enraciner"),
    JsonVerb(spanish: "huir", english: "flee",    french: "fuir"),
    JsonVerb(spanish: "identificar", english: "identify", french: "identifier"),
    JsonVerb(spanish: "ignorar", english: "ignore", french: "ignorer"),
    JsonVerb(spanish: "illegalizar", english: "make illegal", french: "illéglaiser"),
    JsonVerb(spanish: "imitar", english: "imitate", french: "imiter"),
    JsonVerb(spanish: "impedir", english: "prevent", french: "empêcher"),
    JsonVerb(spanish: "implementar", english: "implement", french: "mettre en œuvre"),
    JsonVerb(spanish: "implicar", english: "implicate", french: "impliquer"),
    JsonVerb(spanish: "imponer", english: "impose", french: "imposer"),
    JsonVerb(spanish: "importar", english: "be important", french: "importer"),
    JsonVerb(spanish: "imprimir", english: "print", french: "imprimer", spanishPastPart1: "imprimido", spanishPastPart2: "impreso"),
    JsonVerb(spanish: "incluir", english: "include", french: "inclure"),
    JsonVerb(spanish: "incorporar", english: "incorporate", french: "incorperer"),
    JsonVerb(spanish: "indicar", english: "indicate", french: "indiquer"),
    JsonVerb(spanish: "inducir", english: "induce", french: "induire"),
    JsonVerb(spanish: "inferir", english: "infer", french: "déduire"),
    JsonVerb(spanish: "inflar", english: "blow up",    french: "faire sauter"),
    JsonVerb(spanish: "infligir", english: "inflict", french: "infliger"),
    JsonVerb(spanish: "influir", english: "influence",    french: "influencer"),
    JsonVerb(spanish: "informar", english: "inform", french: "informer"),
    JsonVerb(spanish: "ingresar", english: "join a group", french: "participer"),
    JsonVerb(spanish: "inquirir", english: "inquire",    french: "renseigner"),
    JsonVerb(spanish: "iniciar", english: "initiate", french: "initier"),
    JsonVerb(spanish: "inmigrar", english: "immigrate", french: "immigrer"),
    JsonVerb(spanish: "inscribir", english: "enroll", french: "inscrire"),
    JsonVerb(spanish: "insistir", english: "insist", french: "insister"),
    JsonVerb(spanish: "inspeccionar", english: "inspect", french: "inspecter"),
    JsonVerb(spanish: "inspirar", english: "inspire", french: "inspirer"),
    JsonVerb(spanish: "instituir", english: "estabish", french: "instituer"),
    JsonVerb(spanish: "instruir", english: "instruct",    french: "instruire"),
    JsonVerb(spanish: "insultar", english: "insult", french: "insulter"),
    JsonVerb(spanish: "intentar", english: "attempt", french: "essayer"),
    JsonVerb(spanish: "interpretar", english: "interpret", french: "interpréter"),
    JsonVerb(spanish: "interrumpir", english: "interrupt", french: "interrompre"),
    JsonVerb(spanish: "intervenir", english: "intervene", french: "intervenir"),
    JsonVerb(spanish: "intredecir", english: "guess", french: "deviner"),
    JsonVerb(spanish: "introducir", english: "introduce",    french: "présenter"),
    JsonVerb(spanish: "inventar", english: "invent", french: "inventer"),
    JsonVerb(spanish: "invertir", english: "invert", french: "investir"),
    JsonVerb(spanish: "investigar", english: "investigate", french: "enquêter"),
    JsonVerb(spanish: "invitar", english: "invite",    french: "inviter"),
    JsonVerb(spanish: "inyectar", english: "inject", french: "injecter"),
    JsonVerb(spanish: "ir", english: "go",    french: "aller"),
    JsonVerb(spanish: "irse", english: "go away",    french: "s'aller"),
    JsonVerb(spanish: "irrumpir", english: "break in",    french: "entrer par effraction"),
    JsonVerb(spanish: "judaizar", english: "Judaize",    french: "judaïser"),
    JsonVerb(spanish: "jugar", english: "play",    french: "jouer"),
    JsonVerb(spanish: "jaquir", english: "abandon",    french: "abandonner"),
    JsonVerb(spanish: "juntar", english: "connect", french: "unir"),
    JsonVerb(spanish: "jurar", english: "swear", french: "jurer"),
    JsonVerb(spanish: "justificar", english: "justify", french: "justifier"),
    JsonVerb(spanish: "juzgar", english: "judge", french: "juger"),
    JsonVerb(spanish: "lanzar", english: "launch", french: "jeter"),
    JsonVerb(spanish: "lastimar", english: "hurt", french: "blesser"),
    JsonVerb(spanish: "lavar", english: "wash",    french: "laver"),
    JsonVerb(spanish: "leer", english: "read",    french: "lire", spanishPastPart1: "leído"),
    JsonVerb(spanish: "levantar", english: "raise", french: "lever"),
    JsonVerb(spanish: "levantarse", english: "get up", french: "se lever"),
    JsonVerb(spanish: "limpiar", english: "wash",    french: "nettoyer"),
    JsonVerb(spanish: "localizar", english: "localize",    french: "localiser"),
    JsonVerb(spanish: "llamar", english: "call", french: "appeler"),
    JsonVerb(spanish: "llamarse", english: "be called", french: "appeler"),
    JsonVerb(spanish: "llegar", english: "arrive",    french: "arriver"),
    JsonVerb(spanish: "llenar", english: "fill", french: "remplir"),
    JsonVerb(spanish: "llevar", english: "wear", french: "porter"),
    JsonVerb(spanish: "llorar", english: "cry",    french: "pleurer"),
    JsonVerb(spanish: "llover", english: "rain", french: "pleuvoir"),
    JsonVerb(spanish: "luchar", english: "fight", french: "se battre"),
    JsonVerb(spanish: "lucir", english: "shine",    french: "luire"),
    JsonVerb(spanish: "luir", english: "rumple",    french: "froisser"),
    JsonVerb(spanish: "madurar", english: "mature", french: "mûrir"),
    JsonVerb(spanish: "maldecir", english: "curse", french: "maudire", spanishPastPart1: "maldicho"),
    JsonVerb(spanish: "maltratar", english: "mistreat", french: "maltraiter"),
    JsonVerb(spanish: "mandar", english: "command",    french: "envoyer"),
    JsonVerb(spanish: "manejar", english: "manage", french: "conduire"),
    JsonVerb(spanish: "manifestar", english: "display", french: "exprimer"),
    JsonVerb(spanish: "manipular", english: "manipulate", french: "manipuler"),
    JsonVerb(spanish: "mantener", english: "maintain", french: "garder"),
    JsonVerb(spanish: "marcar", english: "observe", french: "signaler"),
    JsonVerb(spanish: "marchar", english: "function", french: "marcher"),
    JsonVerb(spanish: "matar", english: "kill", french: "tuer"),
    JsonVerb(spanish: "matarse", english: "kill each other", french: "tuer"),
    JsonVerb(spanish: "maximizar", english: "maximize",    french: "maximiser"),
    JsonVerb(spanish: "mecer", english: "swing",    french: "bouger"),
    JsonVerb(spanish: "medir", english: "measure", french: "mesurer"),
    JsonVerb(spanish: "mejorar", english: "improve", french: "améliorer"),
    JsonVerb(spanish: "memorizar", english: "memorize", french: "mémoriser"),
    JsonVerb(spanish: "mencionar", english: "mention", french: "mentionner"),
    JsonVerb(spanish: "mentir", english: "lie",    french: "mentir"),
    JsonVerb(spanish: "merecer", english: "deserve", french: "mériter"),
    JsonVerb(spanish: "meter", english: "put in", french: "mettre"),
    JsonVerb(spanish: "minimizar", english: "tell a lie",    french: "mentir"),
    JsonVerb(spanish: "mirar", english: "look", french: "regarder"),
    JsonVerb(spanish: "mirarse", english: "look at each other", french: "regarder"),
    JsonVerb(spanish: "molestar", english: "bother", french: "déranger"),
    JsonVerb(spanish: "montar", english: "mount", french: "chevaucher"),
    JsonVerb(spanish: "morder", english: "bite", french: "mordre"),
    JsonVerb(spanish: "morir", english: "die",   french: "mourir", spanishPastPart1: "muerto"),
    JsonVerb(spanish: "mostrar", english: "show",    french: "montrer"),
    JsonVerb(spanish: "mover", english: "move",    french: "déménager"),
    JsonVerb(spanish: "muquir", english: "move",    french: "déménager"),
    JsonVerb(spanish: "nacer", english: "be born", french: "naître"),
    JsonVerb(spanish: "nadar", english: "swim", french: "nager"),
    JsonVerb(spanish: "naturalizar", english: "naturalize", french: "naturaliser"),
    JsonVerb(spanish: "navegar", english: "navigate", french: "naviguer"),
    JsonVerb(spanish: "necesitar", english: "need", french: "naturaliser"),
    JsonVerb(spanish: "negar", english: "deny", french: "nier"),
    JsonVerb(spanish: "negarse", english: "refuse", french: "se nier"),
    JsonVerb(spanish: "nevar", english: "snow", french: "neiger"),
    JsonVerb(spanish: "obedecer", english: "obey", french: "obéir"),
    JsonVerb(spanish: "obligar", english: "oblige", french: "obliger"),
    JsonVerb(spanish: "obsequiar", english: "present", french: "donner"),
    JsonVerb(spanish: "obstar", english: "hinder", french: "empêcher"),
    JsonVerb(spanish: "obstruir", english: "obstruct",    french: "bloquer"),
    JsonVerb(spanish: "obtener", english: "obtain", french: "obtenir"),
    JsonVerb(spanish: "ocultar", english: "hide", french: "cacher"),
    JsonVerb(spanish: "ocupar", english: "occupy",    french: "occuper"),
    JsonVerb(spanish: "ocuparse", english: "take care of",    french: "s'occuper"),
    JsonVerb(spanish: "ocurrir", english: "happen", french: "arriver"),
    JsonVerb(spanish: "odiar", english: "hate", french: "haïr"),
    JsonVerb(spanish: "odiarse", english: "hate each other", french: "haïr"),
    JsonVerb(spanish: "ofrecer", english: "offer", french: "offrir"),
    JsonVerb(spanish: "oír", english: "hear",    french: "écouter", spanishPastPart1: "oído"),
    JsonVerb(spanish: "oler", english: "smell",    french: "sentir"),
    JsonVerb(spanish: "olvidar", english: "forget",    french: "oublier"),
    JsonVerb(spanish: "omitir", english: "omit", french: "omettre"),
    JsonVerb(spanish: "operar", english: "operate", french: "opérer"),
    JsonVerb(spanish: "oponer", english: "oppose", french: "ouvre boîte"),
    JsonVerb(spanish: "optar", english: "choose", french: "opter"),
    JsonVerb(spanish: "orar", english: "pray", french: "prier"),
    JsonVerb(spanish: "ordenar", english: "put in order", french: "commander"),
    JsonVerb(spanish: "organizar", english: "organize",    french: "organiser"),
    JsonVerb(spanish: "osar", english: "dare", french: "oser"),
    JsonVerb(spanish: "ostentar", english: "flaunt", french: "étaler"),
    JsonVerb(spanish: "ortagar", english: "award", french: "donner"),
    JsonVerb(spanish: "pacer", english: "graze", french: "brouter"),
    JsonVerb(spanish: "pagar", english: "pay",    french: "payer"),
    JsonVerb(spanish: "paralizar", english: "paralyze",    french: "paralyser"),
    JsonVerb(spanish: "parar", english: "stop",    french: "arrêter"),
    JsonVerb(spanish: "parecer", english: "seem",    french: "sembler"),
    JsonVerb(spanish: "participar", english: "participate", french: "prendre part"),
    JsonVerb(spanish: "partir", english: "divide", french: "fendre"),
    JsonVerb(spanish: "pasar", english: "pass by", french: "passer"),
    
    JsonVerb(spanish: "pedir", english: "ask",    french: "demander"),
    JsonVerb(spanish: "pedir ayuda", english: "ask for help", french: "demander de l'aide"),
    JsonVerb(spanish: "peer", english: "peer", french: "regarder"),
    JsonVerb(spanish: "pegar", english: "slap", french: "frapper"),
    JsonVerb(spanish: "pelear", english: "fight",  french: "se battre"),
    JsonVerb(spanish: "pelearse", english: "fight with each other",  french: "se battre"),
    JsonVerb(spanish: "pensar", english: "think",  french: "penser"),
    JsonVerb(spanish: "percibir", english: "perceive", french: "percevoir"),
    JsonVerb(spanish: "perder", english: "lose", french: "perdre"),
    JsonVerb(spanish: "perderse", english: "become lost", french: "se perdre"),
    JsonVerb(spanish: "perdonar", english: "pardon", french: "pardonner"), 
    JsonVerb(spanish: "permanecer", english: "stay", french: "rester"),
    JsonVerb(spanish: "permitir", english: "permit",    french: "permettre"),
    JsonVerb(spanish: "perseguir", english: "pursue", french: "poursuivre"),
    JsonVerb(spanish: "pertenecer", english: "belong", french: "appartenir"),
    JsonVerb(spanish: "pintar", english: "paint", french: "peinture"),
    JsonVerb(spanish: "pisar", english: "trample", french: "marcher dessus"),
    JsonVerb(spanish: "placer", english: "gratify",    french: "plaisir"),
    JsonVerb(spanish: "placticar", english: "chat", french: "placticar"),
    JsonVerb(spanish: "plañir", english: "moan", french: "gémir"),
    JsonVerb(spanish: "plegar", english: "fold", french: "plier"),
    JsonVerb(spanish: "poblar", english: "populate",    french: "peupler"),
    JsonVerb(spanish: "poder", english: "can",    french: "pouvoir"),
    JsonVerb(spanish: "podrir", english: "decay",    french: "pourrir"),
    JsonVerb(spanish: "poner", english: "put",    french: "mettre", spanishPastPart1: "puesto"),
    JsonVerb(spanish: "ponerse", english: "put on",    french: "mettre", spanishPastPart1: "puesto"),
    JsonVerb(spanish: "poseer", english: "own",    french: "posséder", spanishPastPart1: "poseído"),
    JsonVerb(spanish: "practicar", english: "practice",    french: "s'entraîner"),
    JsonVerb(spanish: "predecir", english: "fortell",    french: "prédire", spanishPastPart1: "predicho"),
    JsonVerb(spanish: "predicar", english: "preach",    french: "prêcher"),
    JsonVerb(spanish: "preferir", english: "prefer",    french: "préférir"),
    JsonVerb(spanish: "preguntar", english: "ask",    french: "demander"),
   
    JsonVerb(spanish: "preparar", english: "prepare", french: "préparer"),
    
    JsonVerb(spanish: "presentar", english: "present",    french: "présenter"),
    JsonVerb(spanish: "prestar", english: "lend",    french: "prêter"),
    JsonVerb(spanish: "prestar atención", english: "pay attention", french: "prêter attention"),
    JsonVerb(spanish: "principiar", english: "begin",    french: "commencer"),
    JsonVerb(spanish: "probar", english: "test",    french: "tester"),
    JsonVerb(spanish: "proclamar", english: "proclaim",    french: "proclamer"),
    JsonVerb(spanish: "producir", english: "produce",    french: "produire"),
    JsonVerb(spanish: "programar", english: "program", french: "programmar"),
    JsonVerb(spanish: "prohibir", english: "prohibit",    french: "interdire"),
    JsonVerb(spanish: "prometer", english: "promise",    french: "promettre"),
    JsonVerb(spanish: "pronunciar", english: "pronounce",    french: "prononcer"),
    JsonVerb(spanish: "proporcionar", english: "proportion",    french: "fournir"),
    JsonVerb(spanish: "proteger", english: "protect",    french: "protéger"),
    JsonVerb(spanish: "proveer", english: "provide",    french: "apporter", spanishPastPart1: "proveído", spanishPastPart2: "provisto"),
    JsonVerb(spanish: "pudrir", english: "rot",    french: "pourrir"),
    JsonVerb(spanish: "pulir", english: "polish",    french: "polir"),
    JsonVerb(spanish: "quedar", english: "agree", french: "rester"),
    JsonVerb(spanish: "quedarse", english: "remain", french: "rester"),
   
    JsonVerb(spanish: "quemar", english: "burn", french: "brûler"),
    JsonVerb(spanish: "querer", english: "want",    french: "vouloir"),
    JsonVerb(spanish: "quitar", english: "remove",    french: "supprimer"),
    JsonVerb(spanish: "raer", english: "scrape",    french: "gratter"),
    JsonVerb(spanish: "rascar", english: "scratch", french: "gratter"),
    JsonVerb(spanish: "readquirir", english: "repurchase",    french: "racheter"),
    JsonVerb(spanish: "realizar", english: "realize",    french: "réaliser"),
    JsonVerb(spanish: "recaer", english: "relapse", french: "rechuter"),
    JsonVerb(spanish: "recibir", english: "receive",    french: "recevoir"),
    JsonVerb(spanish: "recoger", english: "pick up",    french: "ranger"),
    JsonVerb(spanish: "recomendar", english: "recommend", french: "recommander"),
    JsonVerb(spanish: "reconocer", english: "recognize", french: "reconnaître"),
    JsonVerb(spanish: "recopilar", english: "compile", french: "compiler"),
    JsonVerb(spanish: "recordar", english: "remember",    french: "rappeler"),
    JsonVerb(spanish: "reconstruir", english: "rebuild",    french: "reconstruire"),
    JsonVerb(spanish: "redecir", english: "rewrite", french: "racheter"),
    JsonVerb(spanish: "reducir", english: "reduce", french: "réduire"),
    JsonVerb(spanish: "reelegir", english: "reelect",    french: "rechoisir"),
    JsonVerb(spanish: "referir", english: "narrate",    french: "référir"),
    JsonVerb(spanish: "referirse", english: "refer",    french: "se référir"),
    JsonVerb(spanish: "regañar", english: "scold", french: "gronder"),
    JsonVerb(spanish: "regar", english: "irrigate",    french: "irriguer"),
    JsonVerb(spanish: "regatear", english: "bargain", french: "marchander"),
    JsonVerb(spanish: "regresar", english: "be back",    french: "être de retour"),
    JsonVerb(spanish: "rehacer", english: "redo", french: "refaire", spanishPastPart1: "rehecho"),
    JsonVerb(spanish: "reír", english: "laugh",    french: "rire", spanishPastPart1: "reído"),
    JsonVerb(spanish: "reírse", english: "laugh at",    french: "se rire", spanishPastPart1: "reído"),
    JsonVerb(spanish: "releer", english: "reread",    french: "relire", spanishPastPart1: "releído"),
    JsonVerb(spanish: "relampaguear", english: "flash", french: "clignoter"),
    JsonVerb(spanish: "relucir", english: "shine", french: "briller"),
    JsonVerb(spanish: "renegar", english: "renege", french: "renier"),
    JsonVerb(spanish: "rendir", english: "surrender", french: "rendre"),
    JsonVerb(spanish: "renovar", english: "renew",    french: "renouveler"),
    JsonVerb(spanish: "reñir", english: "quarrel",    french: "disputer"),
    JsonVerb(spanish: "reparar", english: "repair", french: "réparer"),
    
    JsonVerb(spanish: "repetir", english: "repeat",    french: "répéter"),
    JsonVerb(spanish: "reproducir", english: "reproduce",    french: "reproduire"),
    JsonVerb(spanish: "repudrir", english: "repudiate",    french: "repudrir"),
    JsonVerb(spanish: "resolver", english: "solve", french: "démêler", spanishPastPart1: "resuelto"),
    JsonVerb(spanish: "resfriar", english: "grow cold", french: "attraper"),
    JsonVerb(spanish: "resolver", english: "solve", french: "résoudre"),
    JsonVerb(spanish: "respetar", english: "respect", french: "respecter"),
    JsonVerb(spanish: "responder", english: "respond", french: "répondre"),
    JsonVerb(spanish: "restituir", english: "give back", french: "restaurer"),
    JsonVerb(spanish: "resumir", english: "summarize", french: "résumer"),
    JsonVerb(spanish: "retener", english: "retain", french: "retenir"),
    JsonVerb(spanish: "retirar", english: "remove", french: "retirer"),
    JsonVerb(spanish: "retirarse", english: "withdraw", french: "retirer"),
    JsonVerb(spanish: "retorcer", english: "twist",    french: "tourner"),
    JsonVerb(spanish: "retraer", english: "bring back",    french: "rapporter"),
    JsonVerb(spanish: "retrasar", english: "delay", french: "retarder"),
    JsonVerb(spanish: "retribuir", english: "give back",    french: "redonner"),
    JsonVerb(spanish: "reunir", english: "collect", french: "rassembler"),
    JsonVerb(spanish: "reunirse", english: "gather", french: "se rassembler"),
    JsonVerb(spanish: "reverter", english: "revert", french: "inverser"),
    JsonVerb(spanish: "revocar", english: "revoke", french: "révoquer"),
    //    JsonVerb(spanish: "xxx", english: "xxx", french: "xxx"),
    JsonVerb(spanish: "revolver", english: "scramble",    french: "remuer", spanishPastPart1: "revuelto"),
    JsonVerb(spanish: "rezar", english: "pray", french: "prier"),
    JsonVerb(spanish: "robar", english: "steal",    french: "voler"),
    JsonVerb(spanish: "roer", english: "gnaw",    french: "ronger"),
    //    JsonVerb(spanish: "rogar", english: "pray",    french: "prier"),
    JsonVerb(spanish: "romper", english: "break",    french: "casser", spanishPastPart1: "roto"),
    //    JsonVerb(spanish: "revolver", english: "revolve", french: "remuer"),
    JsonVerb(spanish: "robar", english: "rob", french: "voler"),
    JsonVerb(spanish: "rociar", english: "spray", french: "pulvériser"),
    JsonVerb(spanish: "roer", english: "gnaw", french: "ronger"),
    JsonVerb(spanish: "rogar", english: "ask", french: "mendier"),
    JsonVerb(spanish: "romper", english: "break", french: "casser"),
    JsonVerb(spanish: "roncar", english: "snore", french: "ronfier"),
    JsonVerb(spanish: "rugir", english: "roar",    french: "rugir"),
    JsonVerb(spanish: "saber", english: "know",    french: "savoir"),
    JsonVerb(spanish: "sacar", english: "take out",    french: "enlever"),
    JsonVerb(spanish: "sacudir", english: "shake", french: "secouer"),
    JsonVerb(spanish: "salir", english: "leave",    french: "sortir"),
    JsonVerb(spanish: "saltar", english: "jump", french: "sauter"),
    JsonVerb(spanish: "saludar", english: "greet", french: "saler"),
    JsonVerb(spanish: "satisfacer", english: "satisfy",    french: "satisfaire", spanishPastPart1: "satisfecho"),
    JsonVerb(spanish: "secar", english: "dry", french: "sécher"),
    JsonVerb(spanish: "secarse", english: "dry up", french: "se sécher"),
    JsonVerb(spanish: "seducir", english: "seduce",    french: "séduire"),
    JsonVerb(spanish: "segar", english: "reap", french: "recueillir"),
    JsonVerb(spanish: "seguir", english: "carry on",    french: "poursuivre"),
    JsonVerb(spanish: "señalar", english: "signal", french: "souligner"),
   
    JsonVerb(spanish: "sentir", english: "feel",    french: "sentir"),
    JsonVerb(spanish: "separar", english: "separate", french: "séparer"),
    JsonVerb(spanish: "ser", english: "be",    french: "avoir"),
    JsonVerb(spanish: "servir", english: "serve",    french: "servir"),
    JsonVerb(spanish: "sobrevenir", english: "happen", french: "résulter"),
    JsonVerb(spanish: "sofocar", english: "suffocate", french: "étouffer"),
    JsonVerb(spanish: "sofreír", english: "saute",    french: "sauter"),
    JsonVerb(spanish: "soler", english: "usually do", french: "faire habituellement"),
    JsonVerb(spanish: "sollozar", english: "whimper", french: "sangloter"),
    JsonVerb(spanish: "soltar", english: "release",    french: "libérer"),
    JsonVerb(spanish: "someter", english: "subdue", french: "envoyer"),
    JsonVerb(spanish: "sonar", english: "ring",    french: "rever"),
    JsonVerb(spanish: "soñar", english: "dream",    french: "sonner"),
    JsonVerb(spanish: "sonreír", english: "smile",    french: "sourire", spanishPastPart1: "sonreído"),
    JsonVerb(spanish: "sonreírse", english: "smile at each other",    french: "sourire", spanishPastPart1: "sonreído"),
    JsonVerb(spanish: "soplar", english: "blow", french: "souffler"),
    JsonVerb(spanish: "sorprender", english: "surprise", french: "surprendre"),
    JsonVerb(spanish: "sorprenderse", english: "surprise each other", french: "surprendre"),
    JsonVerb(spanish: "sospechar", english: "suspect", french: "soupçonner"),
    JsonVerb(spanish: "sostener", english: "sustain", french: "soutenir"),
    JsonVerb(spanish: "subestimar", english: "underestimate", french: "sous-estimer"),
    JsonVerb(spanish: "subir", english: "go up",    french: "se lever"),
    JsonVerb(spanish: "subscribir", english: "subscribe", french: "s'inscrire"),
    JsonVerb(spanish: "suceder", english: "happen", french: "arriver"),
    JsonVerb(spanish: "sufrir", english: "suffer",    french: "souffrir"),
    JsonVerb(spanish: "sugerir", english: "suggest",    french: "suggèrer"),
    JsonVerb(spanish: "sumergir", english: "submerge", french: "submerger"),
    JsonVerb(spanish: "suponer", english: "suppose",    french: "supposer"),
    JsonVerb(spanish: "surgir", english: "arise",    french: "surgir"),
    JsonVerb(spanish: "suspender", english: "delay",  french: "surseoir"),
    JsonVerb(spanish: "suspirar", english: "sigh", french: "soupir"),
    JsonVerb(spanish: "tañer", english: "strum", french: "sonner"),
    JsonVerb(spanish: "tardar", english: "delay", french: "retarder"),
    JsonVerb(spanish: "teleguiar", english: "teleguide", french: "téléguider"),
    JsonVerb(spanish: "temblar", english: "tremble",    french: "secouer"),
    JsonVerb(spanish: "temer", english: "be afraid", french: "avoir peur"),
    JsonVerb(spanish: "tender", english: "tend", french: "tendre"),
    JsonVerb(spanish: "tener", english: "have", french: "avoir"),
    JsonVerb(spanish: "tener que", english: "have to", french: "tenir à ce que"),
    JsonVerb(spanish: "tentar", english: "tempt", french: "tenter"),
    JsonVerb(spanish: "terminar", english: "terminate", french: "finir"),
    
    JsonVerb(spanish: "testificar", english: "testify", french: "témoigner"),
    JsonVerb(spanish: "tipificar", english: "classify", french: "établir"),
    JsonVerb(spanish: "tocar", english: "play", french: "toucher"),
    JsonVerb(spanish: "tolerar", english: "tolerate", french: "tolérar"),
    JsonVerb(spanish: "tomar", english: "take", french: "prendre"),
    JsonVerb(spanish: "torear", english: "bullfight", french: "taquiner"),
    JsonVerb(spanish: "torcer", english: "twist",    french: "tourner"),
    JsonVerb(spanish: "toser", english: "cough", french: "tousser"),
    JsonVerb(spanish: "tostar", english: "toast",    french: "porter un toast"),
    JsonVerb(spanish: "trabajar", english: "work",    french: "travailler"),
    JsonVerb(spanish: "traducir", english: "translate",    french: "traduire"),
    JsonVerb(spanish: "traer", english: "bring",    french: "apporter", spanishPastPart1: "traído"),
    JsonVerb(spanish: "traicionar", english: "betray", french: "trahir"),
    JsonVerb(spanish: "trascender", english: "transcend", french: "transcender"),
    JsonVerb(spanish: "trasoír", english: "overhear", french: "entendre"),
    JsonVerb(spanish: "tratar", english: "try", french: "essayer"),
    JsonVerb(spanish: "trepidar", english: "hesitate", french: "vibrer"),
    JsonVerb(spanish: "trocar", english: "trade",    french: "troquer"),
    JsonVerb(spanish: "tronar", english: "thunder", french: "tonner"),
    JsonVerb(spanish: "tronchar", english: "shatter", french: "couper"),
    JsonVerb(spanish: "tropezar", english: "stumble",    french: "trébucher"),
    JsonVerb(spanish: "tumbar", english: "knock down", french: "renverser"),
    
    JsonVerb(spanish: "ungir", english: "annoint",    french: "oindre"),
    JsonVerb(spanish: "unir", english: "unite",    french: "unir"),
    JsonVerb(spanish: "usar", english: "use", french: "utiliser"),
    JsonVerb(spanish: "untar", english: "spread", french: "enduire"),
    JsonVerb(spanish: "urgir", english: "urge",    french: "exhorter"),
    JsonVerb(spanish: "utilizar", english: "utilize", french: "utiliser"),
    JsonVerb(spanish: "valer", english: "be worth",    french: "valoir"),
    JsonVerb(spanish: "vaciar", english: "empty", french: "vider"),
    JsonVerb(spanish: "vedar", english: "prohibit", french: "interdire"),
    JsonVerb(spanish: "velar", english: "guard", french: "montre"),
    JsonVerb(spanish: "vencer", english: "overcome",    french: "surmonter"),
    JsonVerb(spanish: "vender", english: "sell",    french: "vendre"),
    JsonVerb(spanish: "venir", english: "come",    french: "venir"),
    JsonVerb(spanish: "ver", english: "see",   french: "regarder", spanishPastPart1: "visto"),
    JsonVerb(spanish: "verse", english: "see each other",   french: "regarder", spanishPastPart1: "visto"),
    JsonVerb(spanish: "verter", english: "pour", french: "verser"),
    JsonVerb(spanish: "vestir", english: "wear", french: "porter"),
    
    JsonVerb(spanish: "viajar", english: "travel", french: "voyager"),
    JsonVerb(spanish: "vigilar", english: "watch over", french: "montre"),
    JsonVerb(spanish: "visitar", english: "visit", french: "visiter"),
    JsonVerb(spanish: "vivir", english: "live",   french: "habiter"),
    JsonVerb(spanish: "volar", english: "fly",    french: "voler"),
    JsonVerb(spanish: "volver", english: "return",   french: "revenir", spanishPastPart1: "vuelto"),
    JsonVerb(spanish: "volverse", english: "become",   french: "se revenir", spanishPastPart1: "vuelto"),
    JsonVerb(spanish: "volver loco", english: "drive crazy",   french: "devenir fou", spanishPastPart1: "vuelto loco" ),
    JsonVerb(spanish: "votar", english: "vote", french: "voter"),
    JsonVerb(spanish: "yacer", english: "lie down",   french: "s'allonger" ),
    JsonVerb(spanish: "zumbar", english: "hum",   french: "bourdonner" ),
    JsonVerb(spanish: "zurcir", english: "mend",   french: "réparer" ),
    
    JsonVerb(spanish: "abandonarse", english: "abandon",    french: "partir"),
    JsonVerb(spanish: "acordarse", english: "remember",    french: "se souvenir"),
    JsonVerb(spanish: "acostarse", english: "go to bed",    french: "se coucher"),
    JsonVerb(spanish: "acostumbarse", english: "get used to something",    french: "habituer"),
    JsonVerb(spanish: "adaptarse", english: "adapt",    french: "adapter"),
    JsonVerb(spanish: "adelantarse", english: "advance",    french: "dépasser"),
    JsonVerb(spanish: "afeitarse", english: "shave",    french: "se raser"),
    JsonVerb(spanish: "aficionarse", english: "be a fan of",    french: "s'attacher a"),
    JsonVerb(spanish: "agacharse", english: "bend over",    french: "se pencher"),
    JsonVerb(spanish: "alegrarse", english: "rejoice",    french: "réjouir"),
    JsonVerb(spanish: "apoderarse", english: "take power",    french: "prendre possession"),
    JsonVerb(spanish: "aprovecharse", english: "take advantage of",    french: "tirer profit"),
    JsonVerb(spanish: "atenerse", english: "rely on",    french: "se conformer"),
    JsonVerb(spanish: "aterirse", english: "freeze", french: "geier"),
    JsonVerb(spanish: "avergonzarse", english: "be ashamed", french: "embarrasser"),
    JsonVerb(spanish: "averiarse", english: "break down",    french: "abattre"),
    JsonVerb(spanish: "burlarse", english: "make fun of",    french: "se moquer"),
    JsonVerb(spanish: "casarse", english: "get married", french: "épouser"),
    JsonVerb(spanish: "comedirse", english: "eat", french: "manger"),
    JsonVerb(spanish: "cuidarse", english: "take care of oneself",    french: "s'occuper de"),
    JsonVerb(spanish: "desayunarse", english: "have breakfast",    french: "déjeuner"),
    JsonVerb(spanish: "desvestirse", english: "undress",    french: "se déshabiller"),
    JsonVerb(spanish: "disculparse", english: "apologize",    french: "s'excuser"),
    JsonVerb(spanish: "divertirse", english: "have a good time",    french: "s'amuser"),
    JsonVerb(spanish: "divorciarse", english: "get divorced",    french: "divorcer"),
    JsonVerb(spanish: "ducharse", english: "take a shower",    french: "prendre une douche"),
    JsonVerb(spanish: "enfadarse", english: "get annoyed",    french: "se fâcher"),
    JsonVerb(spanish: "enfermarse", english: "become sick",    french: "tomber malade"),
    JsonVerb(spanish: "enojarse", english: "become angry",    french: "se fâcher"),
    JsonVerb(spanish: "ensuciarse", english: "get dirty",    french: "salir"),
    JsonVerb(spanish: "enterarse", english: "find out",    french: "se découvrir"),
    JsonVerb(spanish: "equivocarse", english: "be mistaken",    french: "faire une erreur"),
    JsonVerb(spanish: "erguirse", english: "straighten",    french: "redresser"),
    JsonVerb(spanish: "fiarse", english: "trust",    french: "se faire confiance"),
    JsonVerb(spanish: "fijarse", english: "notice",    french: "remarquer"),
    JsonVerb(spanish: "inscribirse", english: "sign up", french: "inscrire"),
    JsonVerb(spanish: "interesarse", english: "be interested", french: "s'intésser"),
    JsonVerb(spanish: "irse", english: "go away",    french: "partir"),
    JsonVerb(spanish: "marcharse", english: "go away", french: "partir"),
//    JsonVerb(spanish: "mirarse", english: "look at ", french: "se regarder"),
    JsonVerb(spanish: "mojarse", english: "get wet", french: "se mouiller"),
    JsonVerb(spanish: "mudarse", english: "move", french: "bouger"),
    JsonVerb(spanish: "paracerse", english: "resemble each other", french: "ressembler"),
    JsonVerb(spanish: "pasaerse", english: "take a walk", french: "marcher"),
    JsonVerb(spanish: "peinarse", english: "comb one's hair", french: "se peigner les cheveux"),
    JsonVerb(spanish: "ponerse", english: "become",    french: "mettre", spanishPastPart1: "puesto"),
    JsonVerb(spanish: "preocuparse", english: "be worried ",    french: "s'inquiéter"),
    JsonVerb(spanish: "prepararse", english: "be prepared",    french: "préparer"),
    JsonVerb(spanish: "quedarse", english: "remain", french: "rester"),
    JsonVerb(spanish: "quejarse", english: "complain", french: "se plaindre"),
    JsonVerb(spanish: "reunirse", english: "assemble", french: "rencontrer"),
    JsonVerb(spanish: "sentarse", english: "sit down",  french: "s'asseoir"),
    JsonVerb(spanish: "terminarse", english: "be over",    french: "être fini"),
    JsonVerb(spanish: "vestirse", english: "get dressed", french: "s'habiller"),
]


//create json from
public struct JsonVerbManager {
    var myVerbList = [JsonVerb]()
    
    public func printVerbs(){
        print(myVerbList)
    }
    
    public func printOne(jv: JsonVerb){
        print(jv)
    }
    
    //    func encodeInternalVerbs(total: Int){
    //        for v in myMultiLingualVerbListA{
    //            myVerbList.append(v)
    //            if myVerbList.count >= total {break}
    //        }
    //        encodeVerbs()
    //    }
    
    mutating public func encodeInternalVerbs(collectionType: JsonCollectionTypes, total: Int){
        clearWords()
        var wordList = [JsonVerb]()
        switch collectionType {
        case .Master:
            wordList = myMasterVerbList
        case .Simple:
            wordList = myMasterVerbList
        case .Irregular:
            wordList = myMasterVerbList
        }
        for v in wordList {
            myVerbList.append(v)
            if myVerbList.count >= total {break}
        }
        encodeVerbs()
    }
    
    mutating public func clearWords(){
        myVerbList.removeAll()
    }
    
    public func getLastVerb()->JsonVerb{
        return myVerbList.last!
    }
    
    mutating public func encodeVerbs(){
        //encode to JSON
        let encoder = JSONEncoder()
        if let encodedVerbs = try? encoder.encode(myVerbList){
            //print(String(data: encodedVerbs, encoding: .utf8)!)
            try? encodedVerbs.write(to: getURL(), options: .noFileProtection)
        }
    }
    
    mutating public func decodeVerbs(){
        let decoder = JSONDecoder()
        if let data = try? Data.init(contentsOf: getURL()){
            if let decodedVerbs = try? decoder.decode([JsonVerb].self, from: data){
                myVerbList = decodedVerbs
            }
        }
    }
    mutating public func appendVerb(verb: JsonVerb){
        var appendThis = true
        for i in 0..<myVerbList.count {
            let v = myVerbList[i]
            if v.spanish == verb.spanish && v.french == verb.french {
                myVerbList.remove(at: i)
                myVerbList.insert(verb, at:i)
                appendThis = false
                break
            }
        }
        if ( appendThis ){myVerbList.append(verb)}
        encodeVerbs()
    }
    
    mutating public func clearVerbs(){
        myVerbList.removeAll()
    }
    
    public func getVerbAt(index: Int)->JsonVerb{
        if index > myVerbList.count-1 { return myVerbList[0] }
        return myVerbList[index]
    }
    
    public func getVerbCount()->Int{
        return myVerbList.count
    }
    
    public func getURL()->URL{
        let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return docsURL.appendingPathComponent("SPIFEMultiLingualVerbs").appendingPathExtension("json")
    }
    
}
