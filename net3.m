function varargout = net3(varargin)

% NET3 M-file for net3.fig
%      NET3, by itself, creates a new NET3 or raises the existing
%      singleton*.
%
%      H = NET3 returns the handle to a new NET3 or the handle to
%      the existing singleton*.
%
%      NET3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NET3.M with the given input arguments.
%
%      NET3('Property','Value',...) creates a new NET3 or raises the
%      existing singleton*.  Starting from the left, property value pairs
%      are
%      applied to the GUI before net3_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to net3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help net3

% Last Modified by GUIDE v2.5 03-Dec-2021 06:55:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @net3_OpeningFcn, ...
                   'gui_OutputFcn',  @net3_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before net3 is made visible.
function net3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to net3 (see VARARGIN)

% Choose default command line output for net3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes net3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = net3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Warning off;
warning off;
load('data/methord/m1.mat');
t1=m1(1,1);t2=m1(2,1);t3=m1(3,1);t4=m1(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit4,'string',t_s);
load('data/methord/m2.mat');
t1=m2(1,1);t2=m2(2,1);t3=m2(3,1);t4=m2(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit9,'string',t_s);

load('data/methord/m3.mat');
t1=m3(1,1);t2=m3(2,1);t3=m3(3,1);t4=m3(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit10,'string',t_s);

load('data/methord/m4.mat');
t1=m4(1,1);t2=m4(2,1);t3=m4(3,1);t4=m4(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit11,'string',t_s);

load('data/methord/m5.mat');
t1=m5(1,1);t2=m5(2,1);t3=m5(3,1);t4=m5(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit12,'string',t_s);

global filename;global fname1;
global pathname;
global num;
global index;
global g_th;global g_th2; g_th=80;g_th2=25;
 global g_th3; g_th3=150;
pause(0.00001);
index=1;
[filename,pathname]=uigetfile({'*.tif;*.jpg;*.png','(*.tif;*.jpg;*.png)';'*.tif','(*.tif)';'*.jpg','(*.jpg)';'*.png','(*.png)';},'????????????');
if filename==0
    return;
    set(handles.text1,'visible','off')
end
fname1=[pathname,filename];
A=imread(fname1);

 
 
     

axes(handles.axes1);
% imshow(A8);
imshow(A);
   axes(handles.axes2);
imshow(A);  
 oldpath=cd;
cd(pathname);
filename1=ls('*jpg');
filename2=ls('*tif');
filename3=ls('*png');
filename={};
if ~isempty(filename1)
    filename=[filename;cellstr(filename1)];
end
if ~isempty(filename2)
    filename=[filename;cellstr(filename2)];
end
if ~isempty(filename3)
    filename=[filename;cellstr(filename3)];
end
num=size(filename,1);
set(handles.pushbutton2,'enable','on')
cd(oldpath);
% set(handles.text1,'visible','off')
% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;global fname1; 
global pathname;
global num;
global index;
% set(handles.text1,'visible','on')
% pause(0.00001);
index=index+1;
if index==num+1 
    index=1;
end
fname1=[pathname,filename{index}];
A=imread(fname1);
 axes(handles.axes1);
 imshow(A);
 axes(handles.axes2);
 imshow(A);
%     text(50, -50,  str1 , 'color', 'b','Fontsize',28);%text(990,  -80,  str11 , 'color', 'b','Fontsize',28);
% set(handles.text1,'visible','off')


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
global fname1;global B;
  th_p1=210;th_s1=27;th_s2=80;th_ban=150;
A=imread(fname1);
%global g_th;global g_th2; g_th=80;g_th2=25;
g_th=th_s2;
set(handles.edit1,'string',num2str(fix(g_th)));
g_th2=th_s1;
set(handles.edit2,'string',num2str(fix(g_th2)));
g_th3=th_ban;
set(handles.edit3,'string',num2str(fix(g_th3)));
g_th4=th_p1;
set(handles.edit13,'string',num2str(fix(g_th4)));
[ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);

axes(handles.axes1);
  imshow(B);
%   figure,imshow(BW_pao );title('pao');
% figure,imshow(BW_si );title('si');
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
%text(1050, 1000,  str1 , 'color', 'b','Fontsize',18,'rotation',90);
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 
g_th=get(hObject,'value');
set(handles.edit1,'string',num2str(fix(g_th)));
 
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1=g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;

[ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);
% disp(g_th);
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global B;
imwrite(B,'RESULT.BMP');
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 
g_th2=get(hObject,'value');
set(handles.edit2,'string',num2str(fix(g_th2)));
 
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1=g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
 [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);
% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 
g_th3=get(hObject,'value');
set(handles.edit3,'string',num2str(fix(g_th3)));
 
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
 [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)

load('data/methord/m1.mat');
t1=m1(1,1);t2=m1(2,1);t3=m1(3,1);t4=m1(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit4,'string',t_s);
set(handles.edit13,'string',t4);
set(handles.edit3,'string',t3);
set(handles.edit2,'string',t2);
set(handles.edit1,'string',t1);
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 g_th4=t4;
g_th3=t3;
g_th=t1;
 g_th2=t2;
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
 [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)

load('data/methord/m2.mat');

t1=m2(1,1);t2=m2(2,1);t3=m2(3,1);t4=m2(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit4,'string',t_s);
set(handles.edit13,'string',t4);
set(handles.edit3,'string',t3);
set(handles.edit2,'string',t2);
set(handles.edit1,'string',t1);
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 g_th4=t4;
g_th3=t3;
g_th=t1;
 g_th2=t2;
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
 [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)

load('data/methord/m3.mat');

t1=m3(1,1);t2=m3(2,1);t3=m3(3,1);t4=m3(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit4,'string',t_s);
set(handles.edit13,'string',t4);
set(handles.edit3,'string',t3);
set(handles.edit2,'string',t2);
set(handles.edit1,'string',t1);
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 g_th4=t4;
g_th3=t3;
g_th=t1;
 g_th2=t2;
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
 [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)

load('data/methord/m4.mat');

t1=m4(1,1);t2=m4(2,1);t3=m4(3,1);t4=m4(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit4,'string',t_s);
set(handles.edit13,'string',t4);
set(handles.edit3,'string',t3);
set(handles.edit2,'string',t2);
set(handles.edit1,'string',t1);
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 g_th4=t4;
g_th3=t3;
g_th=t1;
 g_th2=t2;
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
 [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)

load('data/methord/m5.mat');

t1=m5(1,1);t2=m5(2,1);t3=m5(3,1);t4=m5(4,1);
   t_s=strcat( num2str(t2),'~',num2str(t1),',',num2str(t3),',',num2str(t4));
set(handles.edit4,'string',t_s);
set(handles.edit13,'string',t4);
set(handles.edit3,'string',t3);
set(handles.edit2,'string',t2);
set(handles.edit1,'string',t1);
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 g_th4=t4;
g_th3=t3;
g_th=t1;
 g_th2=t2;
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
 [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
% [PIC_pao ] = get_nang(A,th_p1,th_s1,th_s2,th_ban);
 axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);

% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
t1 = get(handles.edit1, 'string');
t2 = get(handles.edit2, 'string');
t3 = get(handles.edit3, 'string');
t4 = get(handles.edit13, 'string');
m1=[str2num(t1);str2num(t2);str2num(t3);str2num(t4)];
save('data/methord/m1.mat','m1');
   t_s=strcat( t2,'~',t1,',',t3,',',t4);
set(handles.edit4,'string',t_s);
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
t1 = get(handles.edit1, 'string');
t2 = get(handles.edit2, 'string');
t3 = get(handles.edit3, 'string');
t4 = get(handles.edit13, 'string');
m2=[str2num(t1);str2num(t2);str2num(t3);str2num(t4)];
save('data/methord/m2.mat','m2');
   t_s=strcat( t2,'~',t1,',',t3,',',t4);
set(handles.edit9,'string',t_s);

% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
t1 = get(handles.edit1, 'string');
t2 = get(handles.edit2, 'string');
t3 = get(handles.edit3, 'string');
t4 = get(handles.edit13, 'string');
m3=[str2num(t1);str2num(t2);str2num(t3);str2num(t4)];
save('data/methord/m3.mat','m3');
   t_s=strcat( t2,'~',t1,',',t3,',',t4);
set(handles.edit10,'string',t_s);

% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
t1 = get(handles.edit1, 'string');
t2 = get(handles.edit2, 'string');
t3 = get(handles.edit3, 'string');
t4 = get(handles.edit13, 'string');
m4=[str2num(t1);str2num(t2);str2num(t3);str2num(t4)];
save('data/methord/m4.mat','m4');
   t_s=strcat( t2,'~',t1,',',t3,',',t4);
set(handles.edit11,'string',t_s);

% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
t1 = get(handles.edit1, 'string');
t2 = get(handles.edit2, 'string');
t3 = get(handles.edit3, 'string');
t4 = get(handles.edit13, 'string');
m5=[str2num(t1);str2num(t2);str2num(t3);str2num(t4)];
save('data/methord/m5.mat','m5');
   t_s=strcat( t2,'~',t1,',',t3,',',t4);
set(handles.edit12,'string',t_s);

% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider5_Callback(hObject, eventdata, handles)
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
 
g_th4=get(hObject,'value');
set(handles.edit13,'string',num2str(fix(g_th4)));
 
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1=g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;

[ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
axes(handles.axes1);
  imshow(B);
  str1=strcat('?????????:???',num2str(area_si,'%d'),'???',num2str(area_pao,'%d'), '??????:' ,num2str(area_si/area_pao*100,'%.2f'),'%  ????????????',num2str(num_si),'???',num2str(num_pao), '??????:' ,num2str(num_si/num_pao*100,'%.2f'),'%');
text(-50, -30,  str1 , 'color', 'b','Fontsize',18);
  str2=strcat('S/(S+P):',num2str(area_si/(area_si+area_pao)*100,'%.2f'),'%  N_S',num2str(num_si),'N_P',num2str(num_pao));
text(580, 1237,  str2, 'color', 'b','Fontsize',18);
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
%  [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
 [BW_SI ] = get_BW_SI(A,th_p1,th_s1,th_s2,th_ban);
 axes(handles.axes2);
  imshow(BW_SI);

% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
%  [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
 [PIC_pao ] = get_nang(A,th_p1,th_s1,th_s2,th_ban);
 axes(handles.axes2);
  imshow(PIC_pao);

% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fname1;global B;
 global g_th;global g_th2;global g_th3;global g_th4;
A=imread(fname1);
% th_p1=210;th_s1=27;th_s2=80;th_ban=150;
th_p1= g_th4;th_s1=g_th2;th_s2=g_th;th_ban=g_th3;
%  [ B ,area_pao,area_si,num_si,num_pao ]= get_sipao(A,th_p1,th_s1,th_s2,th_ban);
 [BW_SI ] = get_BW_SI(A,th_p1,th_s1,th_s2,th_ban);
 axes(handles.axes2);
  imshow(BW_SI);
axes(handles.axes1);
  imshow(A);