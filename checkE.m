function [outputArg1] = checkE(E, x, Vx, step)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% Om energin är ändlig över x så får man tillbaka true vilket på
% matlabspråk är 1. False = 0


%% Vågfunktion
% eftersom psi(i+1) = 2 * psi(i) - psi(i-1) + deltaX^2 * (2 * mass /
% hbar^2) * (V(i) - E) *psi(i) känns det rimligt att uttrycka detta i en
% for-loop.
% De första två värdena sätter vi till psi(1) = 0 oh psi(2) = 0 då vi kan
% förvänta oss att vågfunktionen har avtagit då x går mot oändligheten.
% E är okänd och kommer framöver köras i for-loop förslagsvis:
E = 1;


% Skapa en array med längd av x full med nollor.
psi = zeros(1, length(x));
psi(2) = 1e-50;

% Bestäm deltaX (samma som step pga underförstått (dessa steg som används i plotten för alla värden))
deltaX = step;



for k = 2:1:length(psi)-1
    psi(k+1) = (2 * psi(k)) - (psi(k-1)) + (deltaX^2 * (mass * 2 * 0.51e6)/(197^2) * (Vx(k) - E)*psi(k));
end








if max(psi) = inf
    outputArg1 = 0;
else if max(psi) = -inf
    outputArg1 = 0;
else
    outputArg1 = 1;




end