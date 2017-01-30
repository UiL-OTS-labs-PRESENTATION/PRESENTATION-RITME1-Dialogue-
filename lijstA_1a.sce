# Scenario for playing .wav files and sending markers defined in a text file using PCL
# 2005 Petra van Alphen (p.m.vanalphen@uva.nl).
# 2012 Anne van Leeuwen (a.r.vanleeuwen1@uu.nl)
# 2014 adapted by Anne van Leeuwen a.r.vanleeuwen@uu.nl for the rhythm experiment
# after each .wav file listeners are asked 3 questions
 
#audio mode moet in exclusive mode staan als we gaan testen! aanpassen aub

scenario = "lijstA_1a";
pcl_file = "lijstA_1a.pcl";
no_logfile = false ;

#write_codes = true;               
#pulse_width= 10;

# define button codes, 1=enter, 2=x (helemaal niet mee eens), 3=c, 4=v, 5=b, 6=n, 7=m, 8=,(helemaal wel mee eens)  
active_buttons = 8;    
button_codes = 1,2,3,4,5,6,7,8;
response_port_output = false;
response_logging = log_active;

default_font_size=30;
default_font = "Arial";
default_text_color = 200,200,200;
default_formatted_text = true;

begin;

#piepje
wavefile { filename = "beep.wav"; } b1;
sound { wavefile b1; } beep;

	# First we define several displays
	picture {} default;
	picture { text {caption = "+"; font_size = 60;};   x=0; y=0;} fix1;
	picture { text {caption = "- - -"; font_size = 60;};   x=0; y=0;} knipper;
	picture { text {caption = 

"Bedankt voor je deelname aan dit experiment! 

Dit experiment bestaat uit 4 taken:
1. Dialogen (20 minuten)
2. Muziek (10 minuten)
3. Non-verbaal (15 minuten) 
4. Vragenlijst (10 minuten)

De proefleider zal je voor iedere taak uitleg en instructie geven. 
Daarnaast worden de instructies uitgelegd op het scherm.
Lees voor je aan een taak begint steeds de instructies zorgvuldig en rustig door.

Druk op Enter om door te gaan."; max_text_height = 1200; max_text_width = 1600; text_align = align_left; font_size = 30;}; x=0; y=0;} beginexp1;
	picture { text {caption =
 
"DIALOGEN (1/3)

Bedankt voor je deelname aan dit experiment! 

In dit experiment krijg je korte stukjes dialoog te horen tussen twee mensen. 
In elk fragment zegt de eerste spreker iets waar de tweede vervolgens op reageert. 
De fragmenten zijn zodanig bewerkt dat je niet meer hoort wat de sprekers precies zeggen. 
Toch zijn we benieuwd naar hoe jij de reactie van de tweede spreker ervaart. 

Druk op Enter om door te gaan."; max_text_height = 1200; max_text_width = 1600; text_align = align_left; font_size = 30;}; x=0; y=0;} beginexp2;

	picture { text {caption =
"DIALOGEN (2/3)

Je wordt na elk fragment gevraagd de reactie van de tweede spreker duiden. De vraag waarop je je moet focussen is:

'GAAT de tweede spreker MEE' met de visie of het voorstel van de eerste spreker? 
D.w.z. kan hij of zij zich vinden in wat de eerste spreker net heeft gezegd?

Druk op Enter om door te gaan." ; max_text_height = 1200; max_text_width = 1600; text_align = align_left; font_size = 30;}; x=0; y=0;} beginexp3;
	picture { text {caption =
"DIALOGEN (3/3)

Je zult merken dat het niet altijd makkelijk is dit te beoordelen, maar dat is niet erg. 
Er zijn in deze taak geen goede of foute antwoorden, het gaat ons alleen om je eerste intuïtie. 
Reageer dus gewoon ‘op je gevoel’.

We beginnen met een oefensessie. 
Na de oefensessie is er nog gelegenheid tot het stellen van vragen. 

Druk op Enter om te beginnen."; max_text_height = 1200; max_text_width = 1600; text_align = align_left; font_size = 30;}; x=0; y=0;} beginexp4;

	picture { text {caption = "Einde Oefensessie \n Druk op Enter om verder te gaan"; font_size = 30;}; x=0; y=0;} eindoefen;
	picture { text {caption = "BEGIN EXPERIMENT \n \n Druk op Enter om met het experiment te beginnen"; font_size = 30;}; x=0; y=0;} begintest; 
	picture { text {caption = "Luister aandachtig \n \n en probeer zo stil mogelijk te zitten"; font_size = 30;}; x=0; y=0;} aandacht; 
	picture { text {caption = "EINDE EXPERIMENT \n Dank je wel voor het meedoen";}; x=0; y=0;} eindexp;    
	
	picture { text {caption = 
"PAUZE

Neem een korte pauze.
Knipper even goed met je ogen, beweeg je nek langzaam heen en weer
en draai rustig met je schouders.

Druk op Enter als je klaar bent om door te gaan.";max_text_height = 1200; max_text_width = 1600; font_size = 30;}; x=0; y=0;} pauzeklein;
picture { text {caption = "1. Heeft de tweede spreker ZIN in dit gesprek?";font_size = 30;};  x=0; y=0; } vraag1;
picture { text {caption = "2. Heeft de tweede spreker een GOEDE VERSTANDHOUDING met de eerste spreker?";font_size = 30;};  x=0; y=0; } vraag2;

text {caption = "De eerste spreker zegt wat of doet een voorstel."; font_size = 30;} text1;
text {caption = "Gaat de tweede spreker daarin mee?"; font_size = 30;} text2;
text {caption = "HELEMAAL NIET □\t □\t □\t □\t □\t □\t □\t HELEMAAL WEL"; font_color =  255, 255, 255; font_size = 25;}text3;
picture {text text1; x=0; y=100;
			text text2; x=0; y=0;
			text text3; x=0; y=-150;
			} vraag3;


	# We define a sound and name it
	sound { 
		wavefile 
		{	filename = ""; 
			preload = false;
		} 
		s; 
	} snd;

	# Warning before the start
	trial {
		trial_type = correct_response;
		trial_duration = forever; 
		picture beginexp1;
		code = "beginexp1";
		target_button = 1;
		response_active = true;
	}startexp1;
	
	trial {
		trial_type = correct_response;
		trial_duration = forever; 
		picture beginexp2;
		code = "beginexp2"; 
		target_button = 1;
		response_active = true;
	}startexp2;
	
	trial {
		trial_type = correct_response;
		trial_duration = forever; 
		picture beginexp3;
		code = "beginexp3"; 
		target_button = 1;
		response_active = true;
	}startexp3;

	trial {
		trial_type = correct_response;
		trial_duration = forever; 
		picture beginexp4;
		code = "beginexp4"; 
		target_button = 1;
		response_active = true;
	}startexp4;

	# End of Practice
	trial {
		start_delay = 1000;
		trial_type = correct_response;
		trial_duration = forever; 
		picture eindoefen;
		code = "eindeoefening";
		target_button = 1;
		response_active = true;
	}endpractice;

	# Begin of Testitems
	trial {
		trial_type = correct_response;
		trial_duration = forever; 
		picture begintest;
		code = "starttest";
		target_button = 1;
		response_active = true;
	}starttest;

	# End of Experiment
	trial {
		start_delay = 1000;
		trial_type = correct_response;
		trial_duration = forever; 
		picture eindexp;
		code = "eindexp";
		target_button = 1;
		response_active = true;
	}endexp;


	# End of Testitems
	trial {
		start_delay = 500;
		trial_duration = 1500; 
		picture aandacht;
		code ="aandacht";
	}payattention;


	# Main trial definition. Play wav sound and send marker at the beginning of each dialogue plus
	# 12 crtitical markers during the dialogue.
	trial { 
		trial_duration = stimuli_length; 
		monitor_sounds = true;
		
		#play beep, direct when trial begins
		stimulus_event {
			sound beep;
			time = 100;
			response_active = false;
		} event_beep;
	
		#show fixation cross, direct when trail starts time=0#
		stimulus_event {
			picture fix1;
			code = 155;
#			port_code = 155;
			time = 100;
			response_active = false;
		} event0;
			 #play sound 1000ms after start picture, sends out code 100=onset sound code, start speaker A
		stimulus_event {
			sound snd; 
			time = 1100; 
			code = 110;			
#			port_code = 110;	
			response_active = false;
		} wavevent;
		
		#critical marker1 first beat A
		stimulus_event {
			nothing {};
			deltat = 0; 
			code = 111;
#			port_code = 111;
			response_active = false;
		} eventlab1;

		#critical marker2 second beat A
		stimulus_event {
			nothing {};
			deltat = 0;
			code = 112;
#			port_code = 112;
			response_active = false;
		} eventlab2;
		
		#critical marker3 third beat A
		stimulus_event {
			nothing {};
			deltat = 0;
			code = 113;
#			port_code = 113;
			response_active = false;
		} eventlab3;

		#critical marker4 fourth beat A
		stimulus_event {
			nothing {};
			deltat = 0; 
			code = 114;
#			port_code = 114;
			response_active = false;
		} eventlab4;

		#critical marker5 fifth beat A
		stimulus_event {
			nothing {};
			deltat = 0;
			code = 115;
#			port_code = 115;
			response_active = false;
		} eventlab5;
		
		#critical marker6
		#stimulus_event {
		#	nothing {};
		#	deltat = 0;
		#	code = 270;
		#	port_code = 207;
		#} eventlab6;

		#critical marker7 start B
		stimulus_event {
			nothing {};
			deltat = 0;
			code = 210;
#			port_code = 210;
			response_active = false;
		} eventlab7;
		
		#critical marker8 first beat B - critical marker
		stimulus_event {
			nothing {};
			deltat = 0; 
			code = 210;
#			port_code = 210;
			response_active = false;
		} eventlab8;

		#critical marker9 second beat B 
		stimulus_event {
			nothing {};
			deltat = 0;
			code = 220;
#			port_code = 220;
			response_active = false;
		} eventlab9;
		
		#critical marker10 third beat B
		stimulus_event {
			nothing {};
			deltat = 0;
			code = 230;
#			port_code = 230;
			response_active = false;
		} eventlab10;

		#critical marker11 fourth beat B
		stimulus_event {
			nothing {};
			deltat = 0; 
			code = 240;
#			port_code = 240;
			response_active = false;
		} eventlab11;

		#critical marker12 fifth beat B
		stimulus_event {
			nothing {};
			deltat = 0; 
			code = 250;
#			port_code = 250;
			response_active = false;
		} eventlab12;
		
		#critical marker13 end B
		stimulus_event {
			nothing {};
			deltat = 0;
			code = 190;
#			port_code = 190;
			response_active = false;
		} eventlab13;


	} playsent;

	#fixation cross 500ms after sound

	trial{
		trial_duration = stimuli_length;
		trial_type = fixed;
		stimulus_event{
		picture fix1;
		deltat = 0;
		duration = 500;
		response_active = false;
		}fix2;
	} trial_fix;

	trial{
		trial_duration = stimuli_length;
		trial_type = fixed;
		stimulus_event{
		picture default;
		deltat = 0;
		duration = 500;
		response_active = false;
		}black;
	} trial_black;
		
	#Trials to present the 4 critical questions
	trial {
		trial_type = correct_response;
		trial_duration = forever;
		stimulus_event {
		picture vraag1;
		target_button = 2,3,4,5,6,7,8;
		code = "vraag1";
#		port_code = 171;
		} event_vraag1;
	}trial_vraag1;
		
	trial {
		trial_type = correct_response;
		trial_duration = forever;
		stimulus_event {
		picture vraag2;
		target_button = 2,3,4,5,6,7,8;
		code = "vraag2";
#		port_code = 172;
		} event_vraag2;
	}trial_vraag2;

	trial {
		trial_type = correct_response;
		trial_duration = forever;
		stimulus_event {
		picture vraag3;
		target_button = 2,3,4,5,6,7,8;
		code = "vraag3";
#		port_code = 173;
		} event_vraag3;
	}trial_vraag3;

	array {
		picture { bitmap { filename = "foto1.jpg"; preload = true; description = "101" ;}; x=0; y=0;} pic1;
		picture { bitmap { filename = "foto2.jpg"; preload = true; description = "102" ;}; x=0; y=0;} pic2;
		picture { bitmap { filename = "foto3.jpg"; preload = true; description = "103" ;}; x=0; y=0;} pic3;
		picture { bitmap { filename = "foto4.jpg"; preload = true; description = "104" ;}; x=0; y=0;} pic4;
		picture { bitmap { filename = "foto5.jpg"; preload = true; description = "105" ;}; x=0; y=0;} pic5;
		picture { bitmap { filename = "foto6.jpg"; preload = true; description = "106" ;}; x=0; y=0;} pic6;
	} pauzes;

	trial{
		trial_duration = stimuli_length;
		trial_type = fixed; 
			stimulus_event {
				picture pic1;
				duration = 8000; 
				code = "pic1";
				target_button = 1;
				response_active = true;
#				port_code =179;
				} event_pauze;
	}trial_pauze;


	trial {
		trial_type = correct_response;
		trial_duration = forever;
		stimulus_event {
		picture pauzeklein;
		target_button = 1;
		code = "pauze";
#		port_code = 178;
		} event_pauze2;
	}trial_pauze2;
