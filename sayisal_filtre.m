function varargout = sayisal_filtre(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sayisal_filtre_OpeningFcn, ...
                   'gui_OutputFcn',  @sayisal_filtre_OutputFcn, ...
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



function sayisal_filtre_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
guidata(hObject, handles);
set(handles.niceleme_adim,'Visible','off');
set(handles.text6,'Visible','off');
set(handles.ust_kesim_frekans,'Visible','off');
set(handles.text4,'Visible','off');
set(handles.text3,'String','Kesim Frekansý');



function varargout = sayisal_filtre_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function filtre_secim_Callback(hObject, eventdata, handles)



filtre_secim= get(hObject,'Value');
if(filtre_secim~=2)
    
    set(handles.niceleme_adim,'Visible','off');
    set(handles.text6,'Visible','off');
else
    set(handles.niceleme_adim,'Visible','on');
    set(handles.text6,'Visible','on');
    
end




function filtre_secim_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)

filtre_secim=get(handles.filtre_secim,'Value');
filtre_tur_secim=get(handles.filtre_tur_secim,'Value');
alt_kesim_frekans=str2double(get(handles.alt_kesim_frekans,'String'));
ust_kesim_frekans=str2double(get(handles.ust_kesim_frekans,'String'));
frekans_katsayi=str2double(get(handles.frekans_katsayi,'String'));
niceleme_adim=str2double(get(handles.niceleme_adim,'String'));
ornekleme_frekans=str2double(get(handles.ornekleme_frekans,'String'));
filtre=filtre_secim*10+filtre_tur_secim;
disp(filtre);
myAudioRecording(ornekleme_frekans,1000,ornekleme_frekans,filtre,alt_kesim_frekans,ust_kesim_frekans,frekans_katsayi,niceleme_adim);




function filtre_tur_secim_Callback(hObject, eventdata, handles)


filtre_tur_secim= get(hObject,'Value');
if(filtre_tur_secim==1 || filtre_tur_secim==2)
    
    set(handles.ust_kesim_frekans,'Visible','off');
    set(handles.text4,'Visible','off');
    set(handles.text3,'String','Kesim Frekansý');
else
    set(handles.ust_kesim_frekans,'Visible','on');
    set(handles.text4,'Visible','on');
    set(handles.text3,'String','Alt Kesim Frekansý');
    
end


function filtre_tur_secim_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function alt_kesim_frekans_Callback(hObject, eventdata, handles)

function alt_kesim_frekans_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ust_kesim_frekans_Callback(hObject, eventdata, handles)

function ust_kesim_frekans_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function frekans_katsayi_Callback(hObject, eventdata, handles)

function frekans_katsayi_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function niceleme_adim_Callback(hObject, eventdata, handles)


function niceleme_adim_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ornekleme_frekans_Callback(hObject, eventdata, handles)

function ornekleme_frekans_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
