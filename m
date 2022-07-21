Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB8FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jul 2022 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JsNvQYgS7LcjVv/c6iexGN5Si+fKRd5f5BAbC7QtYk4=; b=x83MYdvPCcVQtXxt0r+F7drgOT
	WGFer+UO868bpiqPd2mAbjTXGJFMyfBpPepKtL+sUBFftf5qk3jtGk+0hQm4MHevJ3QA8H87LYZp8
	ldpIEiWQopftLxgDJ9L2CZcYLBzDa3TBS3qSKZmbFb50xtPOV2vTWXbMF8ZcViFCbCWFTbPUo2w1R
	tv+rRlsFrNipbXNYIQDgSY+1xcCicnJIqYfvYF4a2kRX3YaC9Cuwb0t+mAd2sui5wwoN9VDwUrtKQ
	8BES82/2YwNczeTolPsLwWU6qE3B8YESEdFoKTPzG3f+xrI//tOqvLvsj6QxqyNxaPu8dqm66Ikre
	K8dRF1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oET8o-003iN3-Jv; Thu, 21 Jul 2022 10:10:46 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oET80-003hro-2Y; Thu, 21 Jul 2022 10:09:58 +0000
Received: by mail-pf1-x432.google.com with SMTP id y9so1297245pff.12;
        Thu, 21 Jul 2022 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JsNvQYgS7LcjVv/c6iexGN5Si+fKRd5f5BAbC7QtYk4=;
        b=eAa08a3+tl/ZofuTfcSSlCIRAq8gzsE5weAOP7UsxCGX7Y3mEwbV149NCokUNAuKe5
         EN8JAjfmhP9N9CspG2jqaZSyIaGbkZUhDaW7qofKWFu8aKMXKSZIN/OslbLhdpG3vXAe
         Ur/lyWqy91Q56Es+2f1zy2dzQ+hj8jlo3qE0YiObY2S52rcdXtLGShkNUGJiecJGeLOG
         GtukmBHV1TgkmoL4837XnIBFnmUr7cQbqEUii+cPTEyr6HZ7158GO1PQ1FREaPNHpO3p
         +zxpj8UH5CIEkJ0zMqYXxrZuHhPdN0LgPYLVzbKBbdgveUmcPeMuT3v6VXPjNd763lsV
         k55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JsNvQYgS7LcjVv/c6iexGN5Si+fKRd5f5BAbC7QtYk4=;
        b=qy2gQVcH5AvUnEZbfViOCO+JT6+VjI0wCOw5RzaqcX8sNodajs5ePGBGh3YP5RCR8W
         jT1WwOYhD57CvWlQkjWNrZE5OIbfUSX2wW2aM3Gum55arZtJNIF18M3Ya9jirMfd7wGc
         DWX/Vl1Lsa6Ns7ghy+N4xDE/4VCUiDEohtCeRn4V87fOOOqN6l5k+GhpGnDoM1ckSVRH
         QidGPZnBOOl4L/Y2WDMp0r2YXCs7OE+8d5Hj2UKOeYzdvw3Nzfglw5PxI0sdzfN6v1j9
         Rakd8TxqphiNaAYr5+6S0NYyXG1g95RbH8yvyoF+N+RFwroo8ikCJRJ4u+es/4v5tHuK
         +qDA==
X-Gm-Message-State: AJIora+i2gg6f8aH7TQf78DLQslTwuxlrO9im+dbSUrC+EZD4GsZn0yS
	k0IvFZRSVFSni71d+6DEaI0=
X-Google-Smtp-Source: AGRyM1tMdDKZ5ydOiuf36WZNOlcNoDOh7UeG2Wl5nFnV3DeSsvm2YGSyx3q8fnZshmx3L5mTpd0DGQ==
X-Received: by 2002:a05:6a00:23c9:b0:52a:cedd:3992 with SMTP id g9-20020a056a0023c900b0052acedd3992mr42915651pfc.43.1658398191449;
        Thu, 21 Jul 2022 03:09:51 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt ([2402:7500:56a:cec2:d9ce:3b52:7023:4b90])
        by smtp.gmail.com with ESMTPSA id x187-20020a6286c4000000b0052ac2e23295sm1351501pfd.44.2022.07.21.03.09.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Jul 2022 03:09:50 -0700 (PDT)
Date: Thu, 21 Jul 2022 18:09:37 +0800
From: ChiYuan Huang <u0084500@gmail.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: ChiaEn Wu <peterwu.pub@gmail.com>, lee.jones@linaro.org,
	daniel.thompson@linaro.org, jingoohan1@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
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
Subject: Re: [PATCH v5 11/13] leds: mt6370: Add MediaTek MT6370 current sink
 type LED Indicator support
Message-ID: <20220721100933.GA17618@cyhuang-hp-elitebook-840-g3.rt>
References: <20220715112607.591-1-peterwu.pub@gmail.com>
 <20220715112607.591-12-peterwu.pub@gmail.com>
 <20220717084643.GA14285@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717084643.GA14285@duo.ucw.cz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_030956_152790_E7D925CE 
X-CRM114-Status: GOOD (  20.51  )
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

On Sun, Jul 17, 2022 at 10:46:43AM +0200, Pavel Machek wrote:
> Hi!
> 
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> > 
> > In MediaTek MT6370, there are four channel current-sink RGB LEDs that
> > support hardware pattern for constant current, PWM, and breath mode.
> > Isink4 channel can also be used as a CHG_VIN power good indicator.
> > 
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> 
> > index a49979f..71bacb5 100644
> > --- a/drivers/leds/Kconfig
> > +++ b/drivers/leds/Kconfig
> > @@ -244,6 +244,20 @@ config LEDS_MT6323
> >  	  This option enables support for on-chip LED drivers found on
> >  	  Mediatek MT6323 PMIC.
> >  
> > +config LEDS_MT6370_RGB
> > +	tristate "LED Support for MediaTek MT6370 PMIC"
> > +	depends on LEDS_CLASS
> > +	depends on MFD_MT6370
> > +	select LINEAR_RANGE
> > +	help
> > +	  Say Y here to enable support for MT6370_RGB LED device.
> > +	  In MT6370, there are four channel current-sink LED drivers that
> > +	  support hardware pattern for constant current, PWM, and breath mode.
> > +	  Isink4 channel can also be used as a CHG_VIN power good
> 
> Should this go to leds/rgb directory, and should it depend on
> multicolor framework?
Yes, and I may also want to change the file name from 'leds-mt6370'
to 'leds-mt6370-rgb'. Is it ok?
> 
> Best regards,
> 							Pavel
> -- 
> People of Russia, stop Putin before his war on Ukraine escalates.



