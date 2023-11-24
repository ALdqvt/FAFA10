% Main

%% Potential dokumentation
% Potentialen i vårt fall är dels den för harmonisk oscillation:
% V(x) = (1/2) * m * \omega^2 * x^2
% ... och dels den för Lennard-Jones' potential:
% V(r) = 4 * \epsilon * [(\sigma / r)^12 - (\sigma / r)^6]



%% Potential harmonisk oscillaiton
% En array med värden för potential bör likna följande:

mass = 1; % Anges i elektronmassor
omega = 20;

plotLength = 2;
step = 1e-4;

x = -plotLength:step:plotLength;
Vx =  (mass * omega^2 * x.^2)/2;




%% Vågfunktion
% eftersom psi(i+1) = 2 * psi(i) - psi(i-1) + deltaX^2 * (2 * mass /
% hbar^2) * (V(i) - E) *psi(i) känns det rimligt att uttrycka detta i en
% for-loop.
% De första två värdena sätter vi till psi(1) = 0 oh psi(2) = 0 då vi kan
% förvänta oss att vågfunktionen har avtagit då x går mot oändligheten.
% E är okänd och kommer framöver köras i for-loop förslagsvis:
E = 4.0;


% Skapa en array med längd av x full med nollor.
psi = zeros(1, length(x));
psi(2) = 1e-100;

% Bestäm deltaX (samma som step pga underförstått (dessa steg som används i plotten för alla värden))
deltaX = step;



for k = 2:1:length(psi)-1
    psi(k+1) = (2 * psi(k)) - (psi(k-1)) + (deltaX^2 * (mass * 2 * 0.51e6)/(197^2) * (Vx(k) - E)*psi(k));
end



plot(x, Vx, x, psi);
% title('Max =' + toString(max(psi)));
axis([-plotLength plotLength -5 20]);
max(psi)
