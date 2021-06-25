Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DFAC48BC2
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:18:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 310C36142D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 310C36142D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFVVcBHNet01rz/tPV4e+xKBzHLBYzvpVsuReIgGCEM=; b=J1MDjFozXl3gvM
	J84MWhejoUaDDh72K3FASXVAROUUoLzZW0syG7aEBC3l6tKredo9L0xMQlIypkVvpM7w1k0ON5lsd
	J20XK9fP/oA9lWyHsn9JvxjTTg9FF4whoavpXd6QqauEjId82o1hOC/EXD+ghe/38WpZ2K9ETw6gv
	90MWrS1uJ/Ba2+DEoCcHv8hUyjRPFiMYgTHCsRydZSgFKLOhFlCTWWQU+Lma+8UCml1Ep7GdKIqeb
	JdJdSROcB2SViXf1Aoabd0fZ8qapCsKwh7W+SRgfdIQkJmFYgnR8Plz9HefE9fFTegXjXp/fLP8uP
	z/pat9CeADzakYd7lzcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwiuT-000uHE-WF; Fri, 25 Jun 2021 10:18:06 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwi34-000dLw-0j; Fri, 25 Jun 2021 09:22:55 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1lwi2t-0000zB-Rr; Fri, 25 Jun 2021 11:22:44 +0200
Date: Fri, 25 Jun 2021 11:22:31 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Woudstra <ericwouds@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: Re: [PATCH] Fix mt7622.dtsi thermal cpu
Message-ID: <YNWgVxvNbwNcT3B8@makrotopia.org>
References: <20210619121927.32699-1-ericwouds@gmail.com>
 <e30a2d01-a200-80cb-88d9-6aea62dd49f1@linaro.org>
 <56fb5540-fb86-4e6a-a596-1276026b37e5@gmail.com>
 <a4e41929-6ab4-fabb-741e-f25a5fd14e3b@linaro.org>
 <47261865-00e3-41eb-bb36-2b939f81f1e8@gmail.com>
 <fb633034-96e5-6165-b43f-290ae1a65cfd@linaro.org>
 <189b52d5-b103-43e1-a64f-1e627fbc75af@gmail.com>
 <173e6bab-9d21-eb28-9b91-a5f80c01fd03@linaro.org>
 <3dd22cf2-1186-4870-aa49-e5cddc18c6e9@gmail.com>
 <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-7580d955-3187-41e5-9297-1ac8f628a9d5-1624609003739@3c-app-gmx-bs66>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_022254_178735_A5D440D7 
X-CRM114-Status: GOOD (  21.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 25, 2021 at 10:16:43AM +0200, Frank Wunderlich wrote:
> Hi,
> =

> > Gesendet: Donnerstag, 24. Juni 2021 um 15:29 Uhr
> > Von: "Eric Woudstra" <ericwouds@gmail.com>
> > The SOC runs unthrotlled slowly to 80 degrees. This takes minutes. Poll=
ing interval 1 second or less does not matter much when looking at these te=
mperature rise times =

> > =

> > After that in more then an hour it slowly creeps up to 85. I believe th=
e design is so that the SOC, under normal circumstances, can run at 1.35 GH=
z without throttling frequency, without heatsink. It just needs a safeguard=
 for different circumstances.
> > =

> > Most of these SOCs can also run in industrial grade circumstances, whic=
h means up to 85 degrees ambient temperature already . If not industrial th=
en this would be 60 degrees ambient already =

> > =

> > But only someone at Mediatek can confirm this =

> =

> maybe Matthias knows anybody?
> get_maintainers-script shows no mtk employee for mtk_thermal driver, adde=
d Sean and Ryder as common Linux-Contacts...
> =

> Daniel from openwrt have some other mt7622 Boards maybe he can test the F=
an approach below

I got Linksys E8450 aka. Belkin RT3200 ( https://fcc.io/K7S-03571 ) as
well as Ubiquiti UniFi 6 LR ( https://fcc.io/SWX-U6LR ). Both got quite
massive customized heatsinks (see internal photos on FCC submission),
which results in much better heat dissipation than just having the
naked chip like on the BPi-R64.
Hence I also can't test the fan approach on boards other than the R64.


> =

> > On Jun 24, 2021, 12:21 PM, at 12:21 PM, Daniel Lezcano <daniel.lezcano@=
linaro.org> wrote:
> > >Found that:
> > >
> > >https://download.kamami.pl/p579344-MT7622A_Datasheet_for_BananaPi_Only=
%281%29.pdf
> > >
> > >Chapter 3.3 - Thermal Characteristics
> > >
> > >Given the values I suggest:
> > >
> > > - Passive - 80=B0C
> > >
> > > - Hot - 90=B0C
> > >
> > > - Critical - 100=B0C
> =

> maybe adding FAN (r64, don't know for other mt7622 boards) for lower 2 tr=
ips (with adjusted temperature points) and cpu-throtteling for upper 2 trips
> =

> something like this (used the 70/80 trip points discussed before):
> =

> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> @@ -134,6 +134,13 @@
>  		};
>  	};
>  =

> +	fan0: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		#cooling-cells =3D <2>;
> +		pwms =3D <&pwm 2 10000 0>;
> +		cooling-levels =3D <0 102 170 230>;
> +	};
> +
>  	thermal-zones {
>  		cpu_thermal: cpu-thermal {
>  			polling-delay-passive =3D <1000>;
> @@ -143,13 +150,13 @@
>  =

>  			trips {
>  				cpu_passive: cpu-passive {
> -					temperature =3D <47000>;
> +					temperature =3D <70000>;
>  					hysteresis =3D <2000>;
>  					type =3D "passive";
>  				};
>  =

>  				cpu_active: cpu-active {
> -					temperature =3D <67000>;
> +					temperature =3D <80000>;
>  					hysteresis =3D <2000>;
>  					type =3D "active";
>  				};
> @@ -170,14 +177,12 @@
>  			cooling-maps {
>  				map0 {
>  					trip =3D <&cpu_passive>;
> -					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +					cooling-device =3D <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  				};
>  =

>  				map1 {
>  					trip =3D <&cpu_active>;
> -					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> -							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +					cooling-device =3D <&fan0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
>  				};
>  =

>  				map2 {
> @@ -428,6 +433,7 @@
>  	pwm: pwm@11006000 {
>  		compatible =3D "mediatek,mt7622-pwm";
>  		reg =3D <0 0x11006000 0 0x1000>;
> +		#pwm-cells =3D <3>;
>  		interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_LOW>;
>  		clocks =3D <&topckgen CLK_TOP_PWM_SEL>,
>  			 <&pericfg CLK_PERI_PWM_PD>,
> =

> =

> regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
