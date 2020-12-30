function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
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
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 30-Dec-2020 00:11:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function BackGround_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BackGround (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate BackGround
axes(hObject);
imshow('BG.jpg');


% --- Executes on selection change in ChannelSelect.
function ChannelSelect_Callback(hObject, eventdata, handles)
% hObject    handle to ChannelSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if get(hObject,'Value')==1
    set(handles.CorrectionSelect, 'Visible', 'off');
    set(handles.FEC_Text, 'Visible', 'off');
else
    set(handles.FEC_Text, 'Visible', 'on');
    set(handles.CorrectionSelect, 'Visible', 'on');
end
% Hints: contents = cellstr(get(hObject,'String')) returns ChannelSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from ChannelSelect


% --- Executes during object creation, after setting all properties.
function ChannelSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ChannelSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in CorrectionSelect.
function CorrectionSelect_Callback(hObject, eventdata, handles)
% hObject    handle to CorrectionSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns CorrectionSelect contents as cell array
%        contents{get(hObject,'Value')} returns selected item from CorrectionSelect


% --- Executes during object creation, after setting all properties.
function CorrectionSelect_CreateFcn(hObject, eventdata, handles)
% hObject    handle to CorrectionSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Plot_Button.
function Plot_Button_Callback(hObject, eventdata, handles)
SNR_From=str2num(get(handles.SNRFrom,'string'));
SNR_To=str2num(get(handles.SNRTo,'string'));
No_Of_Bits=str2num(get(handles.NoOfBits,'string'));


if(isempty(SNR_From))
    warndlg('From SNR must be numerical');
    return;
end

if(isempty(SNR_To))
    warndlg('To SNR must be numerical');
    return;
end
if(isempty(No_Of_Bits))
    warndlg('Number of Bits must be numerical');
    set(hObject.SNR_From,'String','0')
    return;
end
if (SNR_To<=SNR_From)
    warndlg(' To SNR must be greater than from SNR ');
    return;
end
if (No_Of_Bits<0)
    warndlg(' Number of Bits must be greater than zero');
    return;
end
if (No_Of_Bits~=floor(No_Of_Bits))
    warndlg(' Number of Bits must be an integer');
    return;
end
Fair=get(handles.FairOrNot,'Value');

Channel_Select=get(handles.ChannelSelect,'value')-1;
 
FEC_Select=get(handles.CorrectionSelect,'value')-1;
[SNRe,BER] = MainSimulator(SNR_To,SNR_From,Channel_Select,FEC_Select,Fair,No_Of_Bits);
axes(handles.Plotter);
semilogy(SNRe,BER);
title(handles.Plotter,['BPSK Perfomance graph with ',num2str(No_Of_Bits),' bits']);

xlabel(handles.Plotter,'SNR(dB)')
ylabel(handles.Plotter,'Log(BER')
hold on;







% --- Executes on button press in FairOrNot.
function FairOrNot_Callback(hObject, eventdata, handles)
% hObject    handle to FairOrNot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FairOrNot



function NoOfBits_Callback(hObject, eventdata, handles)
% hObject    handle to NoOfBits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of NoOfBits as text
%        str2double(get(hObject,'String')) returns contents of NoOfBits as a double


% --- Executes during object creation, after setting all properties.
function NoOfBits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to NoOfBits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SNRFrom_Callback(hObject, eventdata, handles)
% hObject    handle to SNRFrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SNRFrom as text
%        str2double(get(hObject,'String')) returns contents of SNRFrom as a double


% --- Executes during object creation, after setting all properties.
function SNRFrom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SNRFrom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SNRTo_Callback(hObject, eventdata, handles)
% hObject    handle to SNRTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SNRTo as text
%        str2double(get(hObject,'String')) returns contents of SNRTo as a double


% --- Executes during object creation, after setting all properties.
function SNRTo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SNRTo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function Plotter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Plotter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate Plotter


% --- Executes on button press in ResetPlot.
function ResetPlot_Callback(hObject, eventdata, handles)
% hObject    handle to ResetPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.Plotter); 
cla reset; 
