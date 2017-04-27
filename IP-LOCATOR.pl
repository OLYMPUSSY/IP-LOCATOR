#!/usr/bin/perl
# Ip-Locator
#By : OLYMPUS


use JSON;
use Socket;
use Term::ANSIColor;
use WWW::Mechanize;

  
 
print color 'bold bright_yellow';
 
print q{

	 _____ ______          _                          _                
	|_   _|| ___ \        | |                        | |               
	  | |  | |_/ / ______ | |      ___    ___   __ _ | |_   ___   _ __ 
	  | |  |  __/ |______|| |     / _ \  / __| / _` || __| / _ \ | '__|
	 _| |_ | |            | |____| (_) || (__ | (_| || |_ | (_) || |   
	 \___/ \_|            \_____/ \___/  \___| \__,_| \__| \___/ |_|  

		                    IP-Locator                                          
		       ------------------------------------   
				    BY OLYMPUS
		       ------------------------------------   
};


 
print color 'bold bright_yellow';
@iphost=$ARGV[0] || die "Usage : ./IP-LOCATOR.pl  [Targets IP] \n        ./IP-LOCATOR.pl  [domain] \n        ./IP-LOCATOR.pl  [host] \n \n";
my @ip = inet_ntoa(scalar gethostbyname("@iphost")or die "IP or Host invalid!\n");
my @hn = scalar gethostbyaddr(inet_aton(@ip),AF_INET);
 
my $GET=WWW::Mechanize->new();
    $GET->get("http://ip-api.com/json/@ip"); # JSON API OF IP-API.COM
    my $json = $GET->content();
 
 
my $info = decode_json($json);
# Json API Response :
# A successful request will return, by default, the following:
#{
#    "status": "success",
#    "country": "COUNTRY",
#    "countryCode": "COUNTRY CODE",
#    "region": "REGION CODE",
#    "regionName": "REGION NAME",
#    "zip": "ZIP CODE",
#    "city": "CITY",
#    "lat": LATITUDE,
#    "lon": LONGITUDE,
#    "timezone": "TIME ZONE",
#    "isp": "ISP NAME",
#    "org": "ORGANIZATION NAME",
#    "as": "AS NUMBER / NAME",
#   "query": "IP ADDRESS USED FOR QUERY"
# }
# INFOS OF JSON API ...
 
print color 'bold bright_white';
print "     [!] IP: ", $info->{'query'}, "\n";
print color 'bold bright_yellow';
print "________________________________________________________________________________\n"; 
print color 'bold bright_white';
print "     [ORG] ORG: ", $info->{'as'}, "\n";
print "     [ISP] ISP: ", $info->{'isp'}, "\n";
print "     [COUNTRY] Country: ", $info->{'country'}," - ", $info->{'countryCode'}, "\n";
print "     [CITY] City: ", $info->{'city'}, "\n"; "\n";
print "     [REGION] Region: ", $info->{'regionName'}, " - " , $info->{'region'},
print color 'red';
print q{
	    [!!!] The location could be inaccurate 
}; "\n";
print color 'bold bright_yellow';
print "     [LOCATION] Geo: ", "Latitude: " , $info->{'lat'}, " - Longitude: ", $info->{'lon'}, "\n";
print "     [LOCATION] Geolocation: ", "Lat: " , $info->{'lat'}, " - Lat: ", $info->{'lat'}, "\n";
print color 'bold bright_white';
print "     [TIME] Timezone: ", "timezone: " , $info->{'timezone'}, " - Long: ", $info->{'timezone'}, "\n";
print "     [INFO] As number/name: ",
 "as: " , 
$info->{'as'},
 " - Long: ",
 $info->{'as'}, "\n";
print "     [ORGANISATION] ORG name: ", $info->{'as'}, "\n";
print "     [+COUNTRY CODE] Country code: ", $info->{'countryCode'}, "\n";
print color 'bold bright_red';
print "     [---STATUS---] Status: ", $info->{'status'}, "\n"; 
print "\n";
print "	    THIS TOOL WAS MADE BY OLYMPUS \n";
# EOF
