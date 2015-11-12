clear all;
clc;

trainSize=0;
testSize=0;

for a=1:5
    if(a==1)
        list = transpose(dir('C:\Users\Tania\Projects\ML_Project\DATA\Ag51Gd14\*.csv'));
        cd('C:\Users\Tania\Projects\ML_Project\DATA\Ag51Gd14\');
    end
    if(a==2)
    list = transpose(dir('C:\Users\Tania\Projects\ML_Project\DATA\AlB2\*.csv'));
    cd('C:\Users\Tania\Projects\ML_Project\DATA\AlB2\');
    end
    if(a==3)
    list = transpose(dir('C:\Users\Tania\Projects\ML_Project\DATA\BaNiSn3\*.csv'));
    cd('C:\Users\Tania\Projects\ML_Project\DATA\BaNiSn3\');
    end
    if(a==4)
    list = transpose(dir('C:\Users\Tania\Projects\ML_Project\DATA\Cr3Si\*.csv'));
    cd('C:\Users\Tania\Projects\ML_Project\DATA\Cr3Si\');
    end
    if(a==5)
    list = transpose(dir('C:\Users\Tania\Projects\ML_Project\DATA\Sodalite\*.csv'));
    cd('C:\Users\Tania\Projects\ML_Project\DATA\Sodalite\');
    end
    
    numberFiles=size(list,2);

    M= zeros(numberFiles,600);
    T=zeros(2,600);
    i=1;
    for file = list
        fileName=file.name;
        T=transpose(csvread(fileName));
        M(i,:)=T(2,:);
        i=i+1;
    end

    diffMatrix=diff(M,1,2);
    %peakData=zeros(numberFiles,600);
    peakData=zeros(numberFiles,40);
    
    for k=1:numberFiles
        for i=2:599
            if diffMatrix(k,i-1)>=0 && diffMatrix(k,i)<0
                peakData(k,ceil(i/15))= 1;
                %peakData(k,i)= 1;
            end
        end
    end
    dataLabel=zeros(numberFiles,1);
    dataLabel(:,1)=a;
    
    fraction=ceil(0.8*numberFiles);
    fraction2=numberFiles-fraction;
    
    trainPeakData(trainSize+1:trainSize+fraction,:)=peakData(1:fraction,:);
    trainDataLabel(trainSize+1:trainSize+fraction,:)=dataLabel(1:fraction,:);
    trainSize=size(trainPeakData,1);
    
    
    testPeakData(testSize+1:testSize+fraction2,:)=peakData(fraction+1:numberFiles,:);
    testDataLabel(testSize+1:testSize+fraction2,:)=dataLabel(fraction+1:numberFiles,:);
    testSize=size(testPeakData,1);
   
end
f=1;
cd('C:\Users\Tania\Projects\ML_Project\');
save('ProcessedData80&40','trainPeakData','trainDataLabel','testPeakData','testDataLabel');
