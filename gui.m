function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 11-May-2020 19:45:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;
handles.death=0;
handles.cases=0;
handles.days=0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
content=cellstr(get(hObject,'String'));%get currently selected option from menu
v=content(get(hObject,'Value'));
if (strcmp(v,'Germany')) %get currently selected option from menu
   %stuff here
  popUp=1;
  germany=readtable('data.xlsx','Sheet','Sheet1','Range','A2:F122');
handles.days=germany{:,1};
handles.death=germany{:,6};
handles.cases=germany{:,5};
elseif (strcmp(v,'China'))
   %stuff here
  popUp=2;
  china=readtable('data.xlsx','Sheet','Sheet1','Range','A124:F244');
handles.days=china{:,1};
handles.death=china{:,6};
handles.cases=china{:,5};
elseif (strcmp(v,'India'))
   %stuff here
    popUp=3;
     india=readtable('data.xlsx','Sheet','Sheet1','Range','A246:F365');
handles.days=india{:,1};
handles.death=india{:,6};
handles.cases=india{:,5};
elseif (strcmp(v,'Italy'))
    popUp=4;
    italy=readtable('data.xlsx','Sheet','Sheet1','Range','A367:F487');
handles.days=italy{:,1};
handles.death=italy{:,6};
handles.cases=italy{:,5};
elseif (strcmp(v,'United_States_of_America'))
  %stuff here
 popUp=5;  
  usa=readtable('data.xlsx','Sheet','Sheet1','Range','A489:F609');
handles.days=usa{:,1};
handles.death=usa{:,6};
handles.cases=usa{:,5};  
end
handles.total_death=sum(handles.death);
handles.total_confirmed=sum(handles.cases);
assignin('base','popUp',popUp);
assignin('base','death',handles.death);
assignin('base','cases',handles.cases);
assignin('base','days',handles.days);
assignin('base','total_confirmed',handles.total_confirmed);
assignin('base','total_death',handles.total_death);
set(handles.confirmed_text,'String',num2str(handles.total_confirmed));
set(handles.death_text,'String',num2str(handles.total_death));
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushButton=2;
assignin('base','pushButton',pushButton);
fig = uifigure;
ax = uiaxes(fig);
plot(ax,handles.days,handles.death);



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

pushButton=3;
assignin('base','pushButton',pushButton);
fig = uifigure;
ax = uiaxes(fig);
plot(ax,handles.days,handles.cases);
hold (ax,'on');
plot(ax,handles.days,handles.death);




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pushButton=1;
assignin('base','pushButton',pushButton);
fig = uifigure;
ax = uiaxes(fig);
plot(ax,handles.days,handles.cases);



function confirmed_text_Callback(hObject, eventdata, handles)
% hObject    handle to confirmed_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of confirmed_text as text
%        str2double(get(hObject,'String')) returns contents of confirmed_text as a double


% --- Executes during object creation, after setting all properties.
function confirmed_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to confirmed_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function death_text_Callback(hObject, eventdata, handles)
% hObject    handle to death_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of death_text as text
%        str2double(get(hObject,'String')) returns contents of death_text as a double


% --- Executes during object creation, after setting all properties.
function death_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to death_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
