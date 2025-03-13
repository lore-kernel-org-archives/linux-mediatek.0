Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C208C35FF4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 18:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AoTnsd8iHVdgBepKxF/OkxysUaYLk1//1WxCqfRtAH0=; b=GRVIFibabtaJnlNlkhGNWCAqSt
	Wh/b7ErQGIAOvpSOrGxFwsYtBJxYC8oHXvNSKFlmJ8T7cnP8lhqsRbdMQFEOHIrmoI4He//IXY/5P
	MpJeEX+Hw/g+ZWFBOMmEUDV9cIrlIeG6bWDPanvkNIR//95cYT4mZYQmEeHo++MLLDqXywY7YXX82
	hcFmCMdan5rnWejZ/RpuZiXV322F91JPF73Mqb50WIhoaNH6sBEdwifwEQIs3Km6UHA2VCO0WU8EZ
	vU+cPjkmwL9ngIlz+1nh8hA04SJlpnCM6yNA4nSX1O/n48hjJRJb+AglUv4DhgO3GjWPffwciW3gj
	NzimykbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsng1-0000000CEkS-3qHF;
	Thu, 13 Mar 2025 18:53:05 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsnJz-0000000CCLr-2CYY
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Mar 2025 18:30:21 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7c0892e4b19so142280685a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Mar 2025 11:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741890618; x=1742495418; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoTnsd8iHVdgBepKxF/OkxysUaYLk1//1WxCqfRtAH0=;
        b=eZWIXrcbGB4kx7Oed1yWpGUJ1ynHAFUK8N5RgaNn6VPzskof15YVOYFpd63VZcS9us
         cdiIUs4bkVKFnzaJs0FtBRR5PIi780f36H4/4cdPnlCE0jyg9mO2bKPXWVtdxhVxU+Wo
         gMKBE8CUqT6JGZDadURtsZYgW1i1EJeW4sYYyoMEubLD1OwFjgAP+BxuihStjhgeV8ik
         RKgewIaYnWi6wEDWBQ/J21Fm5+1voF9MZSs1IfSIBckQnrj7jHRqiiDz3NKBnfrRct8c
         s4vm1yT9Coxhw6j4TGq5D1ycRRLaUJqwv+r6XE632AJR33BKt/NY0yiKbid+M8UUxd2v
         OJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741890618; x=1742495418;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AoTnsd8iHVdgBepKxF/OkxysUaYLk1//1WxCqfRtAH0=;
        b=Uxi4mka6hxYjvBvAtkNk7iKzuw3jdj2Xeg83h37xHI46HGm43PNR9Bf3N83+LNLV1/
         PXfGF2Q5WzSBPIn7vNRj6I8XMDqwP701RZQMyHRejSzh7pA1HBqhTdu1ftOqgqZI+SIm
         kOB0TRr/ZhkgM9dImvymS++NARumdo7R2LzZ90LDxz9iBrR/jR2gFpwajYG7efEgJ0Ot
         tgnOK0qF5Du9PRMRgiEQgddjC9Em0uwVIbTaTMTRBj65lx/Upbs/CkQfACgKd7jCv2+8
         6foDoin7psWtIzFUyXLh27gbDvD/8dH7l3Zc7cRLw6vqO/2M/DNAbyo7oXn/CpN9MFn2
         X7jg==
X-Forwarded-Encrypted: i=1; AJvYcCWAWnzUAU1LKhvtIjOLDJrwjPdj0GvoqJGa9o3kjXW9pXRboc6CUm8vpMkX9ZkwC5FUjwx8MrjAN4HNJlDx5w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd2D/LV25RL+PgS0xVttkmPLhd2Onn91onfgNyKk4l/qlGyl6Z
	I00fKm/pDxtjvhHsvjZL9eDR1a5cnDe5JXnB/r3IZfunjCyah4nNaI2ErTYKpuQ=
X-Gm-Gg: ASbGncvJ+kwoQ3C6CtO897/f3zyrqGkszlkJ9lUQmsv5mzCsnAcfEr0ZU4QqpY2xT7y
	1V+CknO5I6+B/A+nz9NNDgqMMTMZwKTXhMwqz8HAeoEaKlp/YjS6AXx4DKjX5m+RU5tSxFjp4h1
	v1vqCW7c+NIE4BHmFz9jHKRUsm7+fI9KPgcNF5bJNEIpTrEgfxmsxsqucx4zqE54wKW0M3J6psm
	4rxL4aODlSVpoEgdGaL48+A0g+arrryxpWaiBYhWBxZt0dCWDGPmV78mJ35YBlazaESC1SNWbFi
	G+9ek6tvcvLK4J3phhDKsAAMFf4QlBwdSaInybEdL3MFSp3RAi6oNMhcqrPwMuDA2nfYrlIIcB5
	EVflKuXU=
X-Google-Smtp-Source: AGHT+IEi+OIJZ2CCHX/QDN3TCc9Ssw9n2ip3mNRDZzcn/kMPCoNhGIFe17eJ+clCONEScKD+6PgNAQ==
X-Received: by 2002:a05:620a:8083:b0:7c0:6419:8bd3 with SMTP id af79cd13be357-7c579f46d76mr116800685a.22.1741890618305;
        Thu, 13 Mar 2025 11:30:18 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4f53csm128517685a.22.2025.03.13.11.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 11:30:17 -0700 (PDT)
Date: Thu, 13 Mar 2025 14:30:16 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
cc: Matthias Brugger <matthias.bgg@gmail.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, 
    linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dts: arm64: mediatek: mt8188: add more thermal trip
 points
In-Reply-To: <dcc62684-0579-4d03-a430-d4a276153ca1@collabora.com>
Message-ID: <85710oso-p1pp-647q-498p-23583s7nnn45@onlyvoer.pbz>
References: <s2sp5o57-o534-qso0-2733-o0prs6028por@onlyvoer.pbz> <dcc62684-0579-4d03-a430-d4a276153ca1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_113019_759431_78CC29CB 
X-CRM114-Status: GOOD (  19.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 13 Mar 2025, AngeloGioacchino Del Regno wrote:

> Il 13/03/25 16:43, Nicolas Pitre ha scritto:
> > Provide the "switch on" thermal trip point to be used by the power
> > allocator governor.
> > 
> 
> As far as I know, the power allocation is not supposed to be 
> SoC-global, as that does play with sustainable power values...
> 
> Sustainable power depends on multiple factors - besides the power that 
> is actually sustainable by intrinsic properties of the silicon, this 
> mostly depends on the PCB that it is soldered to.
> 
> Translated, this depends on the heat capacity of the copper layer(s) 
> and of the eventual additional passive heatsink, which is a physical 
> property relative to a board and not to the SoC by itself.
> 
> ....which means.... that those nodes shall go to board specific devicetrees
> and
> not to the SoC devicetree :-)
> 
> Unless I'm wrong - but if I am, please explain why :-)

I agree with everything you wrote above.

But this patch isn't about power allocation. This is about temperature 
thresholds. And temperature tolerance is rather SOC specific, no?


> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > index 338120930b..262eab8fd3 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> > @@ -472,6 +472,12 @@ cpu-little0-thermal {
> >      thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU0>;
> >   
> >   			trips {
> > +				cpu_little0_switch_on: trip-switch-on {
> > +					temperature = <68000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> > +
> >       cpu_little0_alert0: trip-alert0 {
> >        temperature = <85000>;
> >        hysteresis = <2000>;
> > @@ -510,6 +516,12 @@ cpu-little1-thermal {
> >      thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU1>;
> >   
> >   			trips {
> > +				cpu_little1_switch_on: trip-switch-on {
> > +					temperature = <68000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> > +
> >       cpu_little1_alert0: trip-alert0 {
> >        temperature = <85000>;
> >        hysteresis = <2000>;
> > @@ -548,6 +560,12 @@ cpu-little2-thermal {
> >      thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU2>;
> >   
> >   			trips {
> > +				cpu_little2_switch_on: trip-switch-on {
> > +					temperature = <68000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> > +
> >       cpu_little2_alert0: trip-alert0 {
> >        temperature = <85000>;
> >        hysteresis = <2000>;
> > @@ -586,6 +604,12 @@ cpu-little3-thermal {
> >      thermal-sensors = <&lvts_mcu MT8188_MCU_LITTLE_CPU3>;
> >   
> >   			trips {
> > +				cpu_little3_switch_on: trip-switch-on {
> > +					temperature = <68000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> > +
> >       cpu_little3_alert0: trip-alert0 {
> >        temperature = <85000>;
> >        hysteresis = <2000>;
> > @@ -624,6 +648,12 @@ cpu-big0-thermal {
> >      thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU0>;
> >   
> >   			trips {
> > +				cpu_big0_switch_on: trip-switch-on {
> > +					temperature = <68000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> > +
> >       cpu_big0_alert0: trip-alert0 {
> >        temperature = <85000>;
> >        hysteresis = <2000>;
> > @@ -658,6 +688,12 @@ cpu-big1-thermal {
> >      thermal-sensors = <&lvts_mcu MT8188_MCU_BIG_CPU1>;
> >   
> >   			trips {
> > +				cpu_big1_switch_on: trip-switch-on {
> > +					temperature = <68000>;
> > +					hysteresis = <2000>;
> > +					type = "passive";
> > +				};
> > +
> >       cpu_big1_alert0: trip-alert0 {
> >        temperature = <85000>;
> >        hysteresis = <2000>;
> 
> 
> 

