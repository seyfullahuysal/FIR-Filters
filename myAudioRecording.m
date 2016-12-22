function [recorder] = myAudioRecording(Fs,duraklama_zamani,N,filt_tur,alt_fre,ust_fre,filt_kat,nic_adim)

    if ~exist('durationSecs','var')
        duraklama_zamani = 300;
    end
    
    if ~exist('N','var')
        N = Fs;
    end
    
    duraklama_zamani = duraklama_zamani + 0.5;
    
    son_ornek_id = 0;
    zaman= 0;
    
    adaptive_w=0.5;
  
    recorder = audiorecorder(Fs,8,2);
    
  
    set(recorder,'TimerPeriod',1,'TimerFcn',@audioTimerCallback);
    

    hFig   = figure;
    hAxes1 = subplot(5,1,1);
    hAxes2 = subplot(5,1,2);
    hAxes3 = subplot(5,1,3);
    hAxes4 = subplot(5,1,4);
    
    
    
    hPlot1 = plot(hAxes1,NaN,NaN);
    hPlot2 = plot(hAxes2,NaN,NaN);
    hPlot3 = plot(hAxes3,NaN,NaN);
    hPlot4 = plot(hAxes4,NaN,NaN);
   
    drawnow;
    
    
    record(recorder,duraklama_zamani);
  
    function audioTimerCallback(hObject,~)
        
        samples  = getaudiodata(hObject);
        
        if length(samples)<son_ornek_id+1+Fs
            return;
        end
        
        X = samples(son_ornek_id+1:son_ornek_id+Fs);
       

        t = linspace(0,1-1/Fs,Fs) + zaman;
        f = 0:Fs/N:(Fs/N)*(N-1);

        set(hPlot1,'XData',t,'YData',X);
        Y = fft(X,N);
        set(hPlot3,'XData',f,'YData',abs(Y));  
        
        
        
       switch filt_tur
           case 11
                Y=FIR(X,alcak_geciren(Fs,alt_fre,filt_kat));
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 12
                Y=FIR(X,yuksek_geciren(Fs,alt_fre,filt_kat));
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 13
                Y=FIR(X,band_geciren(Fs,alt_fre,ust_fre,filt_kat));
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 14
                Y=FIR(X,band_durduran(Fs,alt_fre,ust_fre,filt_kat));
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 21
                Y=niceleme(FIR(X,alcak_geciren(Fs,alt_fre,filt_kat)),nic_adim);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 22
                Y=niceleme(FIR(X,yuksek_geciren(Fs,alt_fre,filt_kat)),nic_adim);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 23
                Y=niceleme(FIR(X,band_geciren(Fs,alt_fre,ust_fre,filt_kat)),nic_adim);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 24
                Y=niceleme(FIR(X,band_durduran(Fs,alt_fre,ust_fre,filt_kat)),nic_adim);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 31
                [Y,adaptive_w]=adaptive_filter(X,alcak_geciren(Fs,alt_fre,filt_kat),adaptive_w);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 32
                [Y,adaptive_w]=adaptive_filter(X,yuksek_geciren(Fs,alt_fre,filt_kat),adaptive_w);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 33
                [Y,adaptive_w]=adaptive_filter(X,band_geciren(Fs,alt_fre,ust_fre,filt_kat),adaptive_w);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           case 34
                [Y,adaptive_w]=adaptive_filter(X,band_durduran(Fs,alt_fre,ust_fre,filt_kat),adaptive_w);
                set(hPlot2,'XData',t,'YData',Y,'Color','red');
           otherwise
       end
        
        

         Y = fft(Y,N);
         set(hPlot4,'XData',f,'YData',abs(Y),'Color','blue');
         
        son_ornek_id = son_ornek_id + Fs;
        
        zaman     = zaman + 1; 
    end

    waitfor(hFig);
end