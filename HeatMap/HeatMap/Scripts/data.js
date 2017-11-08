var heatmapData = [];
heatmapData[0] = [
{location: new google.maps.LatLng(22.314336521390842,113.93421337008476), weight: 15}
,{location: new google.maps.LatLng(22.314558602137748,113.93385529518127), weight: 54}
,{location: new google.maps.LatLng(22.314530066642554,113.93370777368546), weight: 28}
,{location: new google.maps.LatLng(22.314621876475822,113.93399611115456), weight: 28}
,{location: new google.maps.LatLng(22.31478192320294,113.93396660685539), weight: 25}
,{location: new google.maps.LatLng(22.315017650606418,113.93391162157059), weight: 13}
,{location: new google.maps.LatLng(22.315100775437983,113.9338767528534), weight: 17}
,{location: new google.maps.LatLng(22.315321614302274,113.93379628658295), weight: 6}
,{location: new google.maps.LatLng(22.315434514935017,113.9335361123085), weight: 35}
,{location: new google.maps.LatLng(22.315647909288167,113.93354013562202), weight: 43}
,{location: new google.maps.LatLng(22.315378684963203,113.93335372209549), weight: 14}
,{location: new google.maps.LatLng(22.315810436163872,113.93385663628578), weight: 18}
,{location: new google.maps.LatLng(22.315982888138052,113.9340229332447), weight: 11}
,{location: new google.maps.LatLng(22.314379945028364,113.93462106585503), weight: 39}
,{location: new google.maps.LatLng(22.315886736886776,113.93349319696426), weight: 31}
,{location: new google.maps.LatLng(22.314598924023166,113.93347844481468), weight: 6}
,{location: new google.maps.LatLng(22.31545560625189,113.9336809515953), weight: 4}
,{location: new google.maps.LatLng(22.315857581329052,113.9336608350277), weight: 5}
,{location: new google.maps.LatLng(22.314408480554228,113.93397465348244), weight: 1}
,{location: new google.maps.LatLng(22.31518265955201,113.93326319754124), weight: 1}
,{location: new google.maps.LatLng(22.314403517854494,113.93436625599861), weight: 14}
];
heatmapData[1] = [
{location: new google.maps.LatLng(22.314160345351507,113.93458619713783), weight: 9}
,{location: new google.maps.LatLng(22.31441964662799,113.93454596400261), weight: 16}
,{location: new google.maps.LatLng(22.31413305045228,113.93421873450279), weight: 14}
,{location: new google.maps.LatLng(22.31426456219037,113.93399074673653), weight: 3}
,{location: new google.maps.LatLng(22.31435140949666,113.93379092216492), weight: 5}
,{location: new google.maps.LatLng(22.314547436075102,113.93368631601334), weight: 10}
,{location: new google.maps.LatLng(22.314562324158427,113.93399074673653), weight: 10}
,{location: new google.maps.LatLng(22.314409721229133,113.93434345722198), weight: 11}
,{location: new google.maps.LatLng(22.314579693586957,113.93424689769745), weight: 17}
,{location: new google.maps.LatLng(22.315077202729583,113.93395990133286), weight: 10}
,{location: new google.maps.LatLng(22.31522236092334,113.93372520804405), weight: 18}
,{location: new google.maps.LatLng(22.31563426198464,113.93396392464638), weight: 30}
,{location: new google.maps.LatLng(22.31581788013838,113.93382042646408), weight: 15}
,{location: new google.maps.LatLng(22.315317892301834,113.93341675400734), weight: 8}
,{location: new google.maps.LatLng(22.31558339475069,113.93335238099098), weight: 4}
,{location: new google.maps.LatLng(22.31574840302754,113.93343687057495), weight: 10}
,{location: new google.maps.LatLng(22.316049883811566,113.93357902765274), weight: 18}
,{location: new google.maps.LatLng(22.316124323411092,113.93385261297226), weight: 27}
,{location: new google.maps.LatLng(22.315934502353855,113.93393978476524), weight: 25}
,{location: new google.maps.LatLng(22.31561565202315,113.93365278840065), weight: 1}
,{location: new google.maps.LatLng(22.31551639885329,113.93387541174889), weight: 6}
,{location: new google.maps.LatLng(22.314765794471324,113.9340028166771), weight: 11}
,{location: new google.maps.LatLng(22.315355112301738,113.93382981419563), weight: 6}
,{location: new google.maps.LatLng(22.314450663494824,113.93410608172417), weight: 4}
,{location: new google.maps.LatLng(22.314644208588298,113.93355756998062), weight: 7}
,{location: new google.maps.LatLng(22.315172734207415,113.93336176872253), weight: 3}
];
heatmapData[2] = [
{location: new google.maps.LatLng(22.313036287358948,113.92763525247574), weight: 72}
,{location: new google.maps.LatLng(22.31291221859325,113.9273750782013), weight: 63}
,{location: new google.maps.LatLng(22.312798075231434,113.92736971378326), weight: 7}
,{location: new google.maps.LatLng(22.312114453796095,113.92708875238895), weight: 5}
,{location: new google.maps.LatLng(22.312334677037743,113.92701767385006), weight: 10}
,{location: new google.maps.LatLng(22.312391128573324,113.92740726470947), weight: 10}
,{location: new google.maps.LatLng(22.312536289560025,113.9274850487709), weight: 9}
,{location: new google.maps.LatLng(22.31336755042316,113.92716318368912), weight: 4}
,{location: new google.maps.LatLng(22.313469906828992,113.92693251371384), weight: 5}
,{location: new google.maps.LatLng(22.31347548990351,113.92655164003372), weight: 18}
,{location: new google.maps.LatLng(22.313098321700444,113.92723225057125), weight: 15}
,{location: new google.maps.LatLng(22.312660979005017,113.92742402851582), weight: 18}
,{location: new google.maps.LatLng(22.312734800066732,113.9271430671215), weight: 15}
,{location: new google.maps.LatLng(22.31301767705112,113.92702504992485), weight: 18}
,{location: new google.maps.LatLng(22.313228593727874,113.92719469964504), weight: 22}
];
