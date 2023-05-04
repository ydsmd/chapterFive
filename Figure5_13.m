%%%%%%%%%%%%%%%%%%%%%%%%%%%Figure5.13.m%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                         本文件绘制论文图5.13                      %
%                         作者：余道洪                                         %
%                         修改日期：2023.4.27                                  %                     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear;
%% 基础参数设置
r=0.42;zhouju=2.3;dingju=15.6;
ffff=5120;
tmpDataSet = [];Mark =[];mar = 1;
%% 文件检索
fileName = pwd;
fileName = [fileName ,'\DFS'];
files = dir(fullfile(fileName));
fileName_file=[];
size_row = size(files);
folder_num = size_row(1);
for i=3:folder_num
    if(~files(i).isdir)     
         fileName_file = [fileName_file;string(files(i).name)];
    end
end
Num = size(fileName_file,1)/26;
% Num = 3;
file_col = 26;
fileSET = string({});
%% 基础参数设置
r=0.42;zhouju=2.3;dingju=15.6;
ffff=5120;
tmpDataSet = [];Mark =[];mar = 1;
for i = 1:Num
    File = fileName_file(26*i-25:26*i);
    New_File = File(1:2);
    New_File(3:18) = File(11:26);
    New_File(19:26) = File(3:10);
    for jj = 1 : file_col
        if rem(jj,2) ~=0
            type = 1;
            ii = (jj + 1) / 2;
        else
            type = 2;
            ii = jj / 2;
        end
        
        switch type
            case 2  % 读取参数文件
                file_ID = fopen(New_File(jj),'r');
                para_info = fscanf(file_ID,'%s',1);               % 读入第一行关键信息
                para_info2 = fscanf(file_ID,'%s',1);
                splitStr = regexp(para_info,',','split');
                temp1=regexp(para_info2,':','split');

                time_t=fscanf(file_ID,'%s',4);  
                Datetime_t=regexp(time_t,'LMT=','split');
                Datetime=Datetime_t{2};
                fileSET(i,:) = Datetime;
                Date{1}=Datetime(1:10);
                Trriger_time{1}=Datetime(12:end);

                SF{ii,1} = splitStr{1,1};                          % 采样页数
                ISC{ii,1} = splitStr{1,4};                                % 采样通道
                Gain{ii,1} = splitStr{1,6};                      % 总采样通道数
                CV{ii,1} = splitStr{1,8};


            case 1  % 读取数据文件  
                file_ID = fopen(New_File(jj),'r');
                precision = '4*float';                
                raw_Data{ii,1} = fread(file_ID,precision);                
                % 存入句柄

                
        end
        fclose(file_ID);          
    end
    for ii = 1:size(raw_Data,1)
        ISCtmp = str2double(ISC{ii,1}); % 采样零头
        SFtmp = str2double(SF{ii,1});   % 采样频率
        Gaintmp = str2double(Gain{ii,1}); % 程控增益
        CVtmp = str2double(CV{ii,1}); % 标定值
        
        need_data_length = size(raw_Data{ii,1},1) - rem( size(raw_Data{ii,1},1),512 );
        raw_Data{ii,1} = raw_Data{ii,1}(1:need_data_length)/Gaintmp/CVtmp;                  % 除以增益和标定值
        sec{ii,1} = [linspace(0,(size(raw_Data{ii,1},1) - 1)/SFtmp,size(raw_Data{ii,1},1))]';     % 总的秒数
    end
    data1=sec{1,1};
    data2=raw_Data{13,1}/9.81;
    data3=raw_Data{3,1}/9.81;
    data4=raw_Data{11,1}/9.81;

    data5=raw_Data{1,1}/9.81;
    data6=raw_Data{10,1}/9.81;
    data7=raw_Data{12,1}/9.81;
    data8=raw_Data{4,1}/9.81;
    data9=raw_Data{2,1}/9.81;

    data10=raw_Data{6,1}/1000;
    data11=raw_Data{7,1}/1000;
    data12=raw_Data{8,1}/1000;
    data13=raw_Data{9,1}/1000;
    [~,max_location1]=cgtg(data10,200);
    [~,max_location2]=cgtg(data11,500);
    [~,max_location3]=cgtg(data12,200);
    [~,max_location4]=cgtg(data13,200);
    time_real1=[];time_real2=[];time_real3=[];time_real4=[];
    time_real1=data1(max_location1);
    time_real2=data1(max_location2);  
    time_real3=data1(max_location3);
    time_real4=data1(max_location4); 
    v=zhouju/(time_real2(2)-time_real2(1))*3.6;                  %计算车速 （A型车2.5，B型车2.3）(km/h)
    time_limit=round(pi*r/(v/3.6)*ffff);             %计算半个周长通过时间
    time_min2=max_location2-time_limit;            
    time_min1=max_location1-time_limit; 
    time_max2=max_location2+time_limit;           
    time_max1=max_location1+time_limit;
    time_min3=max_location3-time_limit;            
    time_min4=max_location4-time_limit; 
    time_max3=max_location3+time_limit;            
    time_max4=max_location4+time_limit;
    FeatureVector = [];
end

%% 磁钢1处
    i = 1;
    h = figure(i)
    subplot(311)
    eval(['plot(data1,data',num2str(i+1),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢1处左侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(312)
    eval(['plot(data1,data',num2str(i+5),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢1处右侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(313)
    eval(['plot(data1,data',num2str(i+9),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('电压(V)','FontSize',14)
    title('磁钢1信号','FontSize',14)
    xlim([3 12])
    set(h,'position',[500 150 1000 600]);

%% 磁钢2处
    i = 2;
    h = figure(i)
    subplot(311)
    eval(['plot(data1,data',num2str(i+1),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢2处左侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(312)
    eval(['plot(data1,data',num2str(i+5),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢2处右侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(313)
    eval(['plot(data1,data',num2str(i+9),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('电压(V)','FontSize',14)
    title('磁钢2信号','FontSize',14)
    xlim([3 12])
    set(h,'position',[500 150 1000 600]);
   %% 磁钢3处
    i = 3;
    h = figure(i)
    subplot(311)
    eval(['plot(data1,data',num2str(i+1),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢3处左侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(312)
    eval(['plot(data1,data',num2str(i+5),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢3处右侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(313)
    eval(['plot(data1,data',num2str(i+9),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('电压(V)','FontSize',14)
    title('磁钢3信号','FontSize',14)
    xlim([3 12])
    set(h,'position',[500 150 1000 600]);

%% 磁钢4处
    i = 4;
    h = figure(i)
    subplot(311)
    eval(['plot(data1,data',num2str(i+1),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢4处左侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(312)
    eval(['plot(data1,data',num2str(i+5),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('加速度(m/s²)','FontSize',14)
    title('磁钢4处右侧加速度传感器信号','FontSize',14)
    xlim([3 12])
    hold on
    subplot(313)
    eval(['plot(data1,data',num2str(i+9),')'])
    xlabel('时间(s)','FontSize',14)
    ylabel('电压(V)','FontSize',14)
    title('磁钢4信号','FontSize',14)
    xlim([3 12])
    set(h,'position',[500 150 1000 600]);