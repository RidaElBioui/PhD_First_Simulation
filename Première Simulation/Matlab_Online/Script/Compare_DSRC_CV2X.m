clear
close all
clc

%% Paramètres de simulation en basant sur l'analyse comparative entre DSRC et C-V2X 
numPackets = 10000;   % Nombre total de paquets envoyés
packetSize = 500;     % Taille d'un paquet en octets
dataRate_DSRC = 6e6;  % Débit DSRC en bits/s
dataRate_CV2X = 10e6; % Débit C-V2X en bits/s

%% Probabilité de perte de paquets (hypothétique en basant sur notre analyse comparative)
lossRate_DSRC = 0.05;  % 5% de perte pour DSRC
lossRate_CV2X = 0.02;  % 2% de perte pour C-V2X

%% Calcul du temps de transmission (sans perte)
time_DSRC = (packetSize * 8) / dataRate_DSRC;  % en secondes
time_CV2X = (packetSize * 8) / dataRate_CV2X;  % en secondes

%% Simulation de transmission
lostPackets_DSRC = sum(rand(1, numPackets) < lossRate_DSRC);
lostPackets_CV2X = sum(rand(1, numPackets) < lossRate_CV2X);

%% Calcul du taux de perte de paquets
lossRateSim_DSRC = (lostPackets_DSRC / numPackets) * 100;
lossRateSim_CV2X = (lostPackets_CV2X / numPackets) * 100;

%% Affichage des résultats
fprintf(' Les Résultats de la simulation sont: \n');
fprintf('DSRC: Temps de transmission = %.6f s | Taux de perte = %.2f%%\n', time_DSRC, lossRateSim_DSRC);
fprintf('C-V2X: Temps de transmission = %.6f s | Taux de perte = %.2f%%\n', time_CV2X, lossRateSim_CV2X);

%% Tracé des résultats: Personnalisation du tracé intitulé "Comparaison du taux de perte de paquets"
figure;
bar([lossRateSim_DSRC, lossRateSim_CV2X]);
set(gca, 'XTickLabel', {'DSRC', 'C-V2X'});
ylabel('Taux de perte de paquets (%)');
title('Comparaison du taux de perte de paquets');
%% Tracé des résultats: Personnalisation du tracé intitulé "Comparaison du temps de transmission"
figure;
bar([time_DSRC, time_CV2X]);
set(gca, 'XTickLabel', {'DSRC', 'C-V2X'});
ylabel('Temps de transmission (s)');
title('Comparaison du temps de transmission');


