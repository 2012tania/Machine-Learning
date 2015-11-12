clear all;
clc;

splits=1:3;
intervals=1:3;
neurons=1:3;

crossvalidation5=[11.73,11.29,8.29];
crossvalidation4=[12.08,12.43,10.36];
crossvalidation2=[15.21,13.59,12.43];

test5=[20.41,18.18,17.89];
test4=[20.94,18.88,18.12];
test2=[23.56,25.17,18.94];

test5_intervals=[24.47,18.18,19.58];
crossval5_intervals=[14.2,11.29,11.54];

test_neurons=[18.94,18.12,17.89];
crossval_neurons=[12.43,10.36,8.29];

figure;
plot(splits,crossvalidation5,splits,test5);
set(gca, 'XTick',1:3, 'XTickLabel',{'60/40' '70/30' '80/20'});
title('Graph for 5 Hidden Neurons Per Class');
xlabel('Training-Testing Splits');
ylabel('Error Rate');
legend('Cross-validation','Test');

figure;
plot(splits,crossvalidation4,splits,test4);
set(gca, 'XTick',1:3, 'XTickLabel',{'60/40' '70/30' '80/20'});
title('Graph for 4 Hidden Neurons per Class');
xlabel('Training-Testing Splits');
ylabel('Error Rate');
legend('Cross-validation','Test');

figure;
plot(splits,crossvalidation2,splits,test2);
title('Graph for 2 Hidden Neurons per Class');
set(gca, 'XTick',1:3, 'XTickLabel',{'60/40' '70/30' '80/20'});
xlabel('Training-Testing Splits');
ylabel('Error Rate');
legend('Cross-validation','Test');

figure;
plot(neurons,crossval_neurons,neurons,test_neurons);
set(gca, 'XTick',1:3, 'XTickLabel',{'2' '4' '5'});
title({'Graph for Comparing Number of Hidden Neurons per Class','Split 80/20'});
xlabel('Number of Hidden Neurons');
ylabel('Error Rate');
legend('Cross-validation','Test');

figure;
plot(intervals,crossval5_intervals,intervals,test5_intervals);
set(gca, 'XTick',1:3, 'XTickLabel',{'600' '200' '150'});
title({'Graph for Different Pre-processing Intervals','Split 70/30','Number of Hidden Neurons per Class=5'});
xlabel('Number of Intervals');
ylabel('Error Rate');
legend('Cross-validation','Test');

