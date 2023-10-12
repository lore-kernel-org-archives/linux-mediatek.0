Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E62CDB474
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 21:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BYkIIVgUSUDIvsA7oyJJgebrxVB8pqETFUsWWaA5is=; b=eSnEFavE8dE6ly0rw47qlDyLmF
	sKE83kgvoH7YzpWKmclyfGYJvy0s+8QBuB1ZFndO7OIGGVS/IUN7ZEVsWAcICN6eFiUOHhOhdi0lL
	yM44oO2/eUC7bhGjiCGbUYDv2KdNJ8Oy2WQNg2ynhp4PnaVrdzB8YLdlw130bHlM7mUgJ0za06Fdw
	JwFgJ1HuGtsClAYPz79JQmY0mtoCJgMe1kB6sndS6cfggbF/pTgdBVXAkT3E7Fv1SBbcI4stYAPCy
	fYmLqoJZl2CntqrlRh0tvxTtnxJYnH1Q9MmEDKL8PISsTWnU1CijR5wNPgbAr3DMS2y9bggdSWOOT
	tO96e57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr3J8-001uKF-2K;
	Thu, 12 Oct 2023 21:33:26 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr3J6-001uJ3-0m
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 21:33:25 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-57b68556d6dso723282eaf.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 14:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697146400; x=1697751200; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2BYkIIVgUSUDIvsA7oyJJgebrxVB8pqETFUsWWaA5is=;
        b=VFaQLuqadYIxEPwQcHhF9C1cGMyyx425ZD5MB/8CaRT7IcnpZV7dgFQmCXh0KX/MG0
         4agd6NLpkNOLuhL+cfrE/miUTT0rRWxpiK3GsHtSa4P4x4YZby1dvJT75ZdDefQ009G8
         uH0zUcXH+8AYwTn/TJ11AruRmNcVZg3jt52vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697146400; x=1697751200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BYkIIVgUSUDIvsA7oyJJgebrxVB8pqETFUsWWaA5is=;
        b=GCokGGwAs4l0Vui5CUOkXhf9beGnPtqeeIozc0/S4sF1s6P+tpMF8D0cqBg++PLMQc
         UcZkS3m58hO9PyiMYtiCxc7vWkDIBxlO1fTF8fJ5stwisVXTvwasz30VhPDwC0DhgDlj
         tHTwUmLh+JqHxjc+IFPEwP0HuK0lly2+0cncyoxo52FfxvbWw1ZXsiOJWw5+e0gSyu9w
         mWm827sZWdx1L0vbT4evtC1QNFIaORRTCuwJWJxqPNUQZDg4LznYTuFb0k9InFDDNQEz
         Mee7rmeinQPAdtBcp65fCZwzDQ/9SzkrnZ6eWHpA3OY4fOD3/V35UIVB8iuuEZQntF15
         r8hA==
X-Gm-Message-State: AOJu0Yw83zofHf5Z8sKUJ6CbY3WsWft+JxtUkiZ6AzXf4MH64n8QeEI+
	N6TAucfzAjxziWAKxsnudxFnAw==
X-Google-Smtp-Source: AGHT+IEWHo3wYMQMcz7GsN7HjGYb7tuVwk/HPXskUKjfbq7nnE1N5b1naGdES5Ku76oGH6B7c1F9zA==
X-Received: by 2002:a05:6358:988d:b0:135:b4c:a490 with SMTP id q13-20020a056358988d00b001350b4ca490mr26095712rwa.10.1697146400420;
        Thu, 12 Oct 2023 14:33:20 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id n14-20020a62e50e000000b0069319bfed42sm12141026pff.79.2023.10.12.14.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 14:33:19 -0700 (PDT)
Date: Fri, 13 Oct 2023 05:33:16 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, matthias.bgg@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 1/4] arm64: dts: mediatek: cherry: Add platform
 thermal configuration
Message-ID: <20231012213316.GA2659196@google.com>
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com>
 <20230424112523.1436926-2-angelogioacchino.delregno@collabora.com>
 <31d1d1e4-2f75-bbbd-3e4b-6c796f2d39d1@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <31d1d1e4-2f75-bbbd-3e4b-6c796f2d39d1@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_143324_307181_C70B38FE 
X-CRM114-Status: GOOD (  19.71  )
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

Hi Angelo

On Tue, Apr 25, 2023 at 01:46:42PM +0200, Alexandre Mergnat wrote:
> On 24/04/2023 13:25, AngeloGioacchino Del Regno wrote:
> > This platform has three auxiliary NTC thermistors, connected to the
> > SoC's ADC pins. Enable the auxadc in order to be able to read the
> > ADC values, add a generic-adc-thermal LUT for each and finally assign
> > them to the SoC's thermal zones.
> > 
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   .../boot/dts/mediatek/mt8195-cherry.dtsi      | 105 ++++++++++++++++++
> >   1 file changed, 105 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > index 8ac80a136c37..4229f4f7dc2f 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> > @@ -114,6 +114,77 @@ ppvar_sys: regulator-ppvar-sys {
> >   		regulator-boot-on;
> >   	};
> > +	/* Murata NCP03WF104F05RL */
> > +	tboard_thermistor1: thermal-sensor-t1 {
> > +		compatible = "generic-adc-thermal";
> > +		#thermal-sensor-cells = <0>;
> > +		io-channels = <&auxadc 0>;
> > +		io-channel-names = "sensor-channel";
> > +		temperature-lookup-table = <	(-10000) 1553
> > +						(-5000) 1485
> > +						0 1406
> > +						5000 1317
> > +						10000 1219
> > +						15000 1115
> > +						20000 1007
> > +						25000 900
> > +						30000 796
> > +						35000 697
> > +						40000 605
> > +						45000 523
> > +						50000 449
> > +						55000 384
> > +						60000 327
> > +						65000 279
> > +						70000 237
> > +						75000 202
> > +						80000 172
> > +						85000 147
> > +						90000 125
> > +						95000 107
> > +						100000 92
> > +						105000 79
> > +						110000 68
> > +						115000 59
> > +						120000 51
> > +						125000 44>;
> > +	};
> > +
> > +	tboard_thermistor2: thermal-sensor-t2 {
> > +		compatible = "generic-adc-thermal";
> > +		#thermal-sensor-cells = <0>;
> > +		io-channels = <&auxadc 1>;
> > +		io-channel-names = "sensor-channel";
> > +		temperature-lookup-table = <	(-10000) 1553
> > +						(-5000) 1485
> > +						0 1406
> > +						5000 1317
> > +						10000 1219
> > +						15000 1115
> > +						20000 1007
> > +						25000 900
> > +						30000 796
> > +						35000 697
> > +						40000 605
> > +						45000 523
> > +						50000 449
> > +						55000 384
> > +						60000 327
> > +						65000 279
> > +						70000 237
> > +						75000 202
> > +						80000 172
> > +						85000 147
> > +						90000 125
> > +						95000 107
> > +						100000 92
> > +						105000 79
> > +						110000 68
> > +						115000 59
> > +						120000 51
> > +						125000 44>;
> > +	};
> > +
> >   	usb_vbus: regulator-5v0-usb-vbus {
> >   		compatible = "regulator-fixed";
> >   		regulator-name = "usb-vbus";
> > @@ -260,6 +331,10 @@ &gpu {
> >   	mali-supply = <&mt6315_7_vbuck1>;
> >   };
> > +&auxadc {
> 
> Can you put it in alphabetical order please. ?

I believe this patch needs to be respun?

> > +	status = "okay";
> > +};
> > +
> >   &i2c0 {
> >   	status = "okay";
> > @@ -1098,6 +1173,36 @@ mt6315_7_vbuck1: vbuck1 {
> >   	};
> >   };
> > +&thermal_zones {
> > +	soc-area-thermal {
> > +		polling-delay = <1000>;
> > +		polling-delay-passive = <250>;
> > +		thermal-sensors = <&tboard_thermistor1>;
> > +
> > +		trips {
> > +			trip-crit {
> > +				temperature = <84000>;
> > +				hysteresis = <1000>;
> > +				type = "critical";
> > +			};
> > +		};
> > +	};
> > +
> > +	pmic-area-thermal {
> > +		polling-delay = <1000>;
> > +		polling-delay-passive = <0>;
> > +		thermal-sensors = <&tboard_thermistor2>;
> > +
> > +		trips {
> > +			trip-crit {
> > +				temperature = <84000>;
> > +				hysteresis = <1000>;
> > +				type = "critical";
> > +			};
> > +		};
> > +	};
> > +};
> > +
> >   &u3phy0 {
> >   	status = "okay";
> >   };
> 
> After that:
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> Regards,
> Alexandre
> 

