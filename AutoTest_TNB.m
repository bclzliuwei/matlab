%Nspc = 48;
%NT = 1;
Ts = 1/50/24; 
xls_file_name = '.\PSCAD_test_report_TNB.xlsx';
sheet_name = 'Basic_Validation_Test';
%sheet_name1 = 'Difficult_scenarios';
%sheet_name2 = 'Special_check';
CfgFilesPath1 = 'C:\TNB_TestCase\External_fault';
CfgFilesPath2 = 'C:\TNB_TestCase\Internal_fault';
CfgFilesPath3 = 'C:\TNB_TestCase\Evolving_fault';
CfgFilesPath4 = 'C:\TNB_TestCase\RTE_section611';
%CfgFilesPath5 = '\\gbsrd01fs03.dom1.ad.sys\PCS\ENG\General\ZFU\PSCAD_comtrade_data\Special_check';

%%
%{
%External fault
D = dir(CfgFilesPath1);
[TotalFileNo,~] = size(D);
TotalFileNo = TotalFileNo -2;% the first two value of D is path info
TotalFileNo =TotalFileNo/2;
CurRow = 2; 

for caseNo = 1:TotalFileNo
   fileIndex = caseNo*2 + 1;
   fileName = D(fileIndex).name;
   
   %fileName ='Test178.cfg';
   nameLen = length(fileName);
   postfix = fileName(nameLen -3:nameLen);
   isCFG = strcmp(postfix,'.cfg');
   if true == isCFG
		fileName
		[Channelstr s dataraw data] = ReadComtrade(CfgFilesPath1,fileName);
        Tm = data(:,2)/1E6;
        
        ILa = [Tm, data(:,3)]';
        ILb = [Tm, data(:,4)]';
        ILc = [Tm, data(:,5)]';
        IRa = [Tm, data(:,6)]';
        IRb = [Tm, data(:,7)]';
        IRc = [Tm, data(:,8)]';
        ILa1 = [Tm, data(:,9)]';
        ILb1 = [Tm, data(:,10)]';
        ILc1 = [Tm, data(:,11)]';
        IRa1 = [Tm, data(:,12)]';
        IRb1 = [Tm, data(:,13)]';
        IRc1 = [Tm, data(:,14)]'; 
        faultST = [Tm, data(:,62)]';
        save('.\TNB\ILocal_Ia.mat', 'ILa');
        save('.\TNB\IRemote_Ia.mat', 'IRa'); 
        save('.\TNB\ILocal_Ib.mat', 'ILb');
        save('.\TNB\IRemote_Ib.mat', 'IRb'); 
        save('.\TNB\ILocal_Ic.mat', 'ILc');
        save('.\TNB\IRemote_Ic.mat', 'IRc');
        save('.\TNB\ILocal_Ia1.mat', 'ILa1');
        save('.\TNB\IRemote_Ia1.mat', 'IRa1'); 
        save('.\TNB\ILocal_Ib1.mat', 'ILb1');
        save('.\TNB\IRemote_Ib1.mat', 'IRb1'); 
        save('.\TNB\ILocal_Ic1.mat', 'ILc1');
        save('.\TNB\IRemote_Ic1.mat', 'IRc1');
        save('.\TNB\faultStart.mat', 'faultST');
        Model_Name = 'BusbarDiff_ComtradeTest_TNB.slx';
        load_system(Model_Name);
        sim(Model_Name);
        load('.\FinalSignalA.mat','FinalSignalA');
		load('.\FinalSignalB.mat','FinalSignalB');
		load('.\FinalSignalC.mat','FinalSignalC');
		FinalTripDataA = FinalSignalA.Data;
        FinalTripDataB = FinalSignalB.Data;
        FinalTripDataC = FinalSignalC.Data;
        delete ('.\FinalSignalA.mat');
        delete ('.\FinalSignalB.mat');              
        delete ('.\FinalSignalC.mat');
        if isempty(find(FinalTripDataA,1))== false||isempty(find(FinalTripDataB,1))== false||isempty(find(FinalTripDataC,1))== false
         
            Result = 'Fail';
        else
            
            Result = 'Pass';
        end
        disp(Result);

%  Write Information to file  
    xlswrite(xls_file_name, cellstr(Result), sheet_name,strcat('J', num2str(CurRow+3)));
    CurRow = CurRow +1;
   end
end

%}
% Internal fault
D = dir(CfgFilesPath2);
[TotalFileNo,~] = size(D);
TotalFileNo = TotalFileNo -2;% the first two value of D is path info
CurRow = 2; 
TotalFileNo =TotalFileNo/2;

for caseNo = 1:TotalFileNo
   fileIndex = caseNo*2 + 1;
   fileName = D(fileIndex).name;
   
   %fileName ='Test146.cfg';
   nameLen = length(fileName);
   postfix = fileName(nameLen -3:nameLen);
   isCFG = strcmp(postfix,'.cfg');
   if true == isCFG
		fileName
		[Channelstr s dataraw data] = ReadComtrade(CfgFilesPath2,fileName);
        Tm = data(:,2)/1E6;
        
        ILa = [Tm, data(:,3)]';
        ILb = [Tm, data(:,4)]';
        ILc = [Tm, data(:,5)]';
        IRa = [Tm, data(:,6)]';
        IRb = [Tm, data(:,7)]';
        IRc = [Tm, data(:,8)]';
        ILa1 = [Tm, data(:,9)]';
        ILb1 = [Tm, data(:,10)]';
        ILc1 = [Tm, data(:,11)]';
        IRa1 = [Tm, data(:,12)]';
        IRb1 = [Tm, data(:,13)]';
        IRc1 = [Tm, data(:,14)]'; 
        faultST = [Tm, data(:,62)]';
        save('.\TNB\ILocal_Ia.mat', 'ILa');
        save('.\TNB\IRemote_Ia.mat', 'IRa'); 
        save('.\TNB\ILocal_Ib.mat', 'ILb');
        save('.\TNB\IRemote_Ib.mat', 'IRb'); 
        save('.\TNB\ILocal_Ic.mat', 'ILc');
        save('.\TNB\IRemote_Ic.mat', 'IRc');
        save('.\TNB\ILocal_Ia1.mat', 'ILa1');
        save('.\TNB\IRemote_Ia1.mat', 'IRa1'); 
        save('.\TNB\ILocal_Ib1.mat', 'ILb1');
        save('.\TNB\IRemote_Ib1.mat', 'IRb1'); 
        save('.\TNB\ILocal_Ic1.mat', 'ILc1');
        save('.\TNB\IRemote_Ic1.mat', 'IRc1');
        save('.\TNB\faultStart.mat', 'faultST');
        Model_Name = 'BusbarDiff_ComtradeTest_TNB.slx';
        load_system(Model_Name);
        sim(Model_Name);
        load('.\FinalSignalA.mat','FinalSignalA');
		load('.\FinalSignalB.mat','FinalSignalB');
		load('.\FinalSignalC.mat','FinalSignalC');
		FinalTripDataA = FinalSignalA.Data;
        FinalTripDataB = FinalSignalB.Data;
        FinalTripDataC = FinalSignalC.Data;
        delete ('.\FinalSignalA.mat');
        delete ('.\FinalSignalB.mat');              
        delete ('.\FinalSignalC.mat');
        % Find the maximum trip time
        load('.\TripTimeA.mat','TripTimeA');
        load('.\TripTimeB.mat','TripTimeB');
        load('.\TripTimeC.mat','TripTimeC');
        matrixA = TripTimeA;
        matrixB = TripTimeB;
        matrixC = TripTimeC;
        load('.\numberA.mat','numberA');
        %load('.\numberB.mat','numberB');
        %load('.\numberC.mat','numberC');
        NoA =max(numberA(2,:));
        %NoB =max(numberB(2,:));
        %NoC =max(numberC(2,:));
        subMatrixA = matrixA(2,:);
        subMatrixB = matrixB(2,:);
        subMatrixC = matrixC(2,:);
            if max(subMatrixA(:))>0
                ImaxA = 1000*max(subMatrixA(:));
            else
                ImaxA = 0;
            end
            if max(subMatrixB(:))>0
                ImaxB = 1000*max(subMatrixB(:));
            else
                ImaxB =0;
            end
            if max(subMatrixC(:))>0
                ImaxC = 1000*max(subMatrixC(:));
            else
                ImaxC =0;
            end
			delete ('.\TripTimeA.mat');
			delete ('.\TripTimeB.mat');
			delete ('.\TripTimeC.mat');
			if isempty(find(FinalTripDataA,1))== false||isempty(find(FinalTripDataB,1))== false||isempty(find(FinalTripDataC,1))== false
            
                Message = 'Trip';
				if (ImaxA<=10&&ImaxB<=10&&ImaxC<=10)    %tripping time of internal fault less than 10ms=pass
					%if (NoA==0||NoA==1)%&&(NoB==0||NoB==6)&&(NoC==0||NoC==6)
                        Result = 'Pass';
                    %else
                        %Result = 'Fail';
                    %end
				else    
					Result = 'Fail';
				end
            else
                Message = 'No Trip';
                Result = 'Fail';
            end
%  Write Information to file     
         xlswrite(xls_file_name, cellstr(Result), sheet_name, strcat('J', num2str(CurRow+12)));   
         xlswrite(xls_file_name, round(ImaxA,2), sheet_name, strcat('K', num2str(CurRow+12)));%ms
         xlswrite(xls_file_name, round(ImaxB,2), sheet_name, strcat('L', num2str(CurRow+12)));%ms
         xlswrite(xls_file_name, round(ImaxC,2), sheet_name, strcat('M', num2str(CurRow+12)));%ms
         CurRow = CurRow +1;
  
   end
end

%{
%  Evolving fault
D = dir(CfgFilesPath3);
[TotalFileNo,~] = size(D);
TotalFileNo = TotalFileNo -2;% the first two value of D is path info
CurRow = 2;
TotalFileNo =TotalFileNo/2;

for caseNo = 1:TotalFileNo
   fileIndex = caseNo*2 + 1;
   fileName = D(fileIndex).name;
   
   %fileName ='Test207.cfg';
   nameLen = length(fileName);
   postfix = fileName(nameLen -3:nameLen);
   isCFG = strcmp(postfix,'.cfg');
   if true == isCFG
		fileName
		[Channelstr s dataraw data] = ReadComtrade(CfgFilesPath3,fileName);
        Tm = data(:,2)/1E6;
        
        ILa = [Tm, data(:,3)]';
        ILb = [Tm, data(:,4)]';
        ILc = [Tm, data(:,5)]';
        IRa = [Tm, data(:,6)]';
        IRb = [Tm, data(:,7)]';
        IRc = [Tm, data(:,8)]';
        ILa1 = [Tm, data(:,9)]';
        ILb1 = [Tm, data(:,10)]';
        ILc1 = [Tm, data(:,11)]';
        IRa1 = [Tm, data(:,12)]';
        IRb1 = [Tm, data(:,13)]';
        IRc1 = [Tm, data(:,14)]'; 
        faultST = [Tm, data(:,63)]';
        save('.\TNB\ILocal_Ia.mat', 'ILa');
        save('.\TNB\IRemote_Ia.mat', 'IRa'); 
        save('.\TNB\ILocal_Ib.mat', 'ILb');
        save('.\TNB\IRemote_Ib.mat', 'IRb'); 
        save('.\TNB\ILocal_Ic.mat', 'ILc');
        save('.\TNB\IRemote_Ic.mat', 'IRc');
        save('.\TNB\ILocal_Ia1.mat', 'ILa1');
        save('.\TNB\IRemote_Ia1.mat', 'IRa1'); 
        save('.\TNB\ILocal_Ib1.mat', 'ILb1');
        save('.\TNB\IRemote_Ib1.mat', 'IRb1'); 
        save('.\TNB\ILocal_Ic1.mat', 'ILc1');
        save('.\TNB\IRemote_Ic1.mat', 'IRc1');
        save('.\TNB\faultStart.mat', 'faultST');
        Model_Name = 'BusbarDiff_ComtradeTest_TNB.slx';
        load_system(Model_Name);
        sim(Model_Name);
        load('.\FinalSignalA.mat','FinalSignalA');
		load('.\FinalSignalB.mat','FinalSignalB');
		load('.\FinalSignalC.mat','FinalSignalC');
		FinalTripDataA = FinalSignalA.Data;
        FinalTripDataB = FinalSignalB.Data;
        FinalTripDataC = FinalSignalC.Data;
        delete ('.\FinalSignalA.mat');
        delete ('.\FinalSignalB.mat');              
        delete ('.\FinalSignalC.mat');
        % Find the maximum trip time
        load('.\TripTimeA.mat','TripTimeA');
        load('.\TripTimeB.mat','TripTimeB');
        load('.\TripTimeC.mat','TripTimeC');
        matrixA = TripTimeA;
        matrixB = TripTimeB;
        matrixC = TripTimeC;
        load('.\numberA.mat','numberA');
        %load('.\numberB.mat','numberB');
        %load('.\numberC.mat','numberC');
        NoA =max(numberA(2,:));
        %NoB =max(numberB(2,:));
        %NoC =max(numberC(2,:));
        subMatrixA = matrixA(2,:);
        subMatrixB = matrixB(2,:);
        subMatrixC = matrixC(2,:);
            if max(subMatrixA(:))>0
                ImaxA = 1000*max(subMatrixA(:));
            else
                ImaxA = 0;
            end
            if max(subMatrixB(:))>0
                ImaxB = 1000*max(subMatrixB(:));
            else
                ImaxB =0;
            end
            if max(subMatrixC(:))>0
                ImaxC = 1000*max(subMatrixC(:));
            else
                ImaxC =0;
            end
			delete ('.\TripTimeA.mat');
			delete ('.\TripTimeB.mat');
			delete ('.\TripTimeC.mat');
			if isempty(find(FinalTripDataA,1))== false||isempty(find(FinalTripDataB,1))== false||isempty(find(FinalTripDataC,1))== false
            
                Message = 'Trip';
				if (ImaxA<=10&&ImaxB<=10&&ImaxC<=10)    %tripping time of internal fault less than 10ms=pass
					%if (NoA==0||NoA==1)%&&(NoB==0||NoB==6)&&(NoC==0||NoC==6)
                        Result = 'Pass';
                    %else
                        %Result = 'Fail';
                    %end
				else    
					Result = 'Fail';
				end
            else
                Message = 'No Trip';
                Result = 'Fail';
            end
%  Write Information to file
         xlswrite(xls_file_name, cellstr(Result), sheet_name,strcat('I', num2str(CurRow+32)));
         xlswrite(xls_file_name, round(ImaxA,2), sheet_name, strcat('J', num2str(CurRow+32)));%ms
         xlswrite(xls_file_name, round(ImaxB,2), sheet_name, strcat('K', num2str(CurRow+32)));%ms
         xlswrite(xls_file_name, round(ImaxC,2), sheet_name, strcat('L', num2str(CurRow+32)));%ms
         CurRow= CurRow+1;
   end
end

%}