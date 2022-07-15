Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EE7C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 16:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4utnIEpgUH8SrFacOeGCRYGCTX0362lTOZoYsGdnLU=; b=KAX1FL4kG/h+xxCrCWBJlGOaBk
	TGjiCBv0bw2l0I5oLuJqOSOJHdBMvjHFK+Uvkb3wJSgexQKpuKSjQ/rWRBiJNhbUhXUEcDuILIFa/
	uYwqdL+VXGqn7spdAKDYHeHeGWncJ8cKIeBwwYyV+WnvrHZBCjouUk10qSBTBxS6yCbg60SZXiJKW
	gvzUrxT2fllxQ7dZUeI8roLauoEvEwY/bFjm4AWcc0454nuutM6x8X9UlF/jSMp8N/qJ/CjAc0+QE
	JsrBjCOdSynuLK+BUJPSca5onvgkPGCdPp/Wb/Hf6B8bV3x/aPQRExPzzKZH07ZPyba3PwWe6glOm
	S6OOW97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOC6-008nVz-JE; Fri, 15 Jul 2022 16:29:34 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCOBs-008nOb-6x
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 16:29:21 +0000
Received: by mail-wr1-x435.google.com with SMTP id r2so6402927wrs.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 09:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g4utnIEpgUH8SrFacOeGCRYGCTX0362lTOZoYsGdnLU=;
        b=OzC/9QXaaDqxoCP/B7s3PFEoW1r/3BL4QbU0Itu4yM/SSqwTf9zl3vnXpqm6D9/wLg
         u9IULLjrR/XGDkdPfCpFCJs5/QboFpLuQOffp2IKLY+TcH8l8BzzHthtTM5hML+jlRHO
         FG6Cxp7CivJKWEJLvCIuG26LkXP6sxJbO1IKctA1ERVcnJsmcMUdeLVDCwMA4onz9+H1
         1MNjc+56N5uGO0uP7FpLmEqEBd9LvV4yyBSj2q2kCVBKFG5yQDPjhzHOHdM+unWA77AD
         SzvLrlWu0scXmQGI3iWJ+50TPqZt4sVHUFRyHKBkMNQSgWZ1mUzUSIa7VQPGG7NvSDCO
         TFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g4utnIEpgUH8SrFacOeGCRYGCTX0362lTOZoYsGdnLU=;
        b=Oxr6bu5SjgF+RhTb23s5d3WB9TukRPpVIFFCJ4x9VeVLLfzuevSr7BQX5KZBoeKP8t
         W8hdmAK7j7kk7gBfFnWUZ0iI8dIwgiz6QMhX5cFDUmT069iQhEQIIKIIoadOmiC+sog0
         TmNRO4i4scAAm2y64bY2XQiW3KkFVfwN/jA12yk8StojPHPl6Hfx2eq16VMeyDmfclDm
         8VsGxnPZP9ot01oNxmpQOC1/Isci10ypzVDXJ+opQr5xuM1tIUSAxzVoLEZMh7YV0nVT
         vOKjlZkFAPlPzqxp0X8aDqUgY4UeZcCaXOk0hH1uE2lLdiCBauIO2DfVC5e51oAHxZNF
         RfcA==
X-Gm-Message-State: AJIora9TqvU+ryEa3gRXcKddOv7vfBkwO5izobmCQ8aPVydAHxoetcvV
	HUweQkQ8n78SOY11tq5HZIlDtg==
X-Google-Smtp-Source: AGRyM1tSF48yUDKFkMabG1ZK0Ufn2HDShLc1rfkqldFR9s050thAUB7FUGwV6hpIfcU96gErNHiZ9Q==
X-Received: by 2002:a05:6000:16cb:b0:21d:7b9e:d0af with SMTP id h11-20020a05600016cb00b0021d7b9ed0afmr13306509wrf.139.1657902556488;
        Fri, 15 Jul 2022 09:29:16 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id h7-20020adffd47000000b0021d650e4df4sm4283198wrs.87.2022.07.15.09.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 09:29:16 -0700 (PDT)
Date: Fri, 15 Jul 2022 17:29:13 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
	jingoohan1@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
	sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v5 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <20220715162913.5ewxwhv6jtdgt3c2@maple.lan>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-14-peterwu.pub@gmail.com>
 <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec3bdfb8-0e42-a772-28b1-165811872afa@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_092920_259161_D2A9C6BD 
X-CRM114-Status: GOOD (  20.88  )
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

On Fri, Jul 15, 2022 at 02:38:45PM +0200, AngeloGioacchino Del Regno wrote:
> Il 15/07/22 13:26, ChiaEn Wu ha scritto:
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
> > MediaTek MT6370 is a SubPMIC consisting of a single cell battery charger
> > with ADC monitoring, RGB LEDs, dual channel flashlight, WLED backlight
> > driver, display bias voltage supply, one general purpose LDO, and the
> > USB Type-C & PD controller complies with the latest USB Type-C and PD
> > standards.
> >
> > This adds support for MediaTek MT6370 Backlight driver. It's commonly used
> > to drive the display WLED. There are 4 channels inside, and each channel
> > supports up to 30mA of current capability with 2048 current steps in
> > exponential or linear mapping curves.
> >
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
>
> Hello ChiaEn,
>
> I propose to move this one to drivers/leds (or drivers/pwm) and, instead of
> registering a backlight device, register a PWM device.
>
> This way you will be able to reuse the generic backlight-pwm driver, as you'd
> be feeding the PWM device exposed by this driver to the generic one: this will
> most importantly make it easy to chain it with MTK_DISP_PWM (mtk-pwm-disp)
> with a devicetree that looks like...

Out of interest, does MT6370 have the same structure for backlights as the prior
systems using mtk-pwm-disp or was mtk-pwm-disp simply a normal(-ish) PWM
that relied on something on the board for all the constant current
driver hardware?


>
> 	pwmleds-disp {
> 		compatible = "pwm-leds";
>
> 		disp_led: disp-pwm {
> 			label = "backlight-pwm";
> 			pwms = <&pwm0 0 500000>;
> 			max-brightness = <1024>;
> 		};
> 	};
>
> 	backlight_lcd0: backlight {
> 		compatible = "led-backlight";
> 		leds = <&disp_led>, <&pmic_bl_led>;
> 		default-brightness-level = <300>;
> 	};

I think this proposal has to start with the devicetree bindings rather
than the driver. Instead I think the question is: does this proposal
result in DT bindings that better describe the underlying hardware?

This device has lots of backlight centric features (OCP, OVP, single
control with multiple outputs, exponential curves, etc) and its not
clear where they would fit into the "PWM" bindings.

Come to think of it I'm also a little worried also about the whole linear
versus exponential curve thing since I thought LED drivers were required
to use exponential curves.


Daniel.

