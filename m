Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3876C369BA
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDln4KXF/7+F5/JQmkbmDgtFCiDcW7/b23N8sYic+uc=; b=saAOFE/hXGGVRgW0wiXjojqBrr
	e12XGkYhDncL3sM6uIge1pyUp5bkci3LaVMAuSKlgp6EMKOrCW4GWJIMnFS0IAGsCuYOWpJXmAP0u
	LbLq69FZwl3wocSNksqCxGPIepxYi9Mlrx2c57GG7uWyvPqQml6qzliw+gUYFQc98jXk8AtfZbm7v
	rG7xFbxRoB3CacFBHjVxsn34mzq6uVYKBk6+uzHaqHkSwS0XU3zzZbDn2zdxVgfpsHEXFqSa2cBTL
	zjipothRtJ8/VZ6VAmrgiQpkAZmq3sVMLtfFURn7/XhKGVbk1yEZ9S6JbK4xxiiM5rIWs4S6kto3J
	eZ9JQoHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stOg3-00000004fNQ-1MSh;
	Wed, 25 Sep 2024 09:51:19 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stOg0-00000004fMt-1BBe;
	Wed, 25 Sep 2024 09:51:17 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so56634525e9.3;
        Wed, 25 Sep 2024 02:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727257874; x=1727862674; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dDln4KXF/7+F5/JQmkbmDgtFCiDcW7/b23N8sYic+uc=;
        b=dJcx21DL5DEn4I+nVFesKRmCNnnlEZ9z+a2NLawpOxL1hOYIqfSlDzjh4SpvTiXgx+
         Hy+Fh2m1s3Ibh8MkR/KLc4t19C8AL8/Fhonq43I0BbT1m/h9l5dVPke5yn0wfQGxmCtq
         qtCFDfxzTbLg+BNK6Mq7z7HeXBAD3pNHU7XnPO6cF5NdP89Hfq0UM2ZeZFryFQ+Vl+my
         rYLV+4cbFU+gy45YOxZj5+SN7D4+M4Fr8dgIYOl2tKNBGYn3k7vRPtbaWfTnC8+kJE7x
         qT93WrkwlNg13jvuJGCPlv08W8MZ2YcOY0XwVFIIf5qok6hj91E5DHiSVkSl/as4lU8u
         ThDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257874; x=1727862674;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDln4KXF/7+F5/JQmkbmDgtFCiDcW7/b23N8sYic+uc=;
        b=ZZFbFs1FKf8cW2dYBk5QdvZRACYUF0vYngBF0ZpeYdggHuoOT93Z9tCZ4oNRbG5H1J
         exAHfr/By0XnAwzIzElKFtU7yK36JT6JfVmQY8OjjDndsnuLuIWZDiX5o1q1Vr+5AHd3
         9+UPkEC5HRrEsC5vkvsrCzcQ8E7K+GG8UGWrYE37sMktHX9qre72tBGmSbOS3cfIqIlt
         azqgdnYLeDdBqWu3Bkweiob4XCuhVLO2rmSKqkqzr6x1nruDOWAKlJjQh36Q/Dkebkrv
         4HUD78BU35fvBugLj4C9EqmDZkOujZ+6EERqe8BgBmKJ/FJJK1XSvGYsDVyFLD7Hm1zT
         gsFg==
X-Forwarded-Encrypted: i=1; AJvYcCXpg8MK9TAsiDM/2maUGvaeaO8pjiiEhG/jOvh6qB7+ngy/Bi0q4+gbX3DPOuJDaOH2luMXRv48jAB3S69ioOXy@lists.infradead.org, AJvYcCXxGDUtdjvjxGfUH5IJVkAtLZwNWFQrBEcltmPeMatyQHdYOMZyyGdX6WFAe4TRbbrj+q8V7B3JC3ZSnzvJdYc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx12A3SKlIw0Rt7lqVTzk88yFxIQXFxqEllw1tuvv9gixcyyyfN
	nizq+ZSwZXzu9Ds8e5y0ud5FvJMJOyMLrvBwnjw0w8rvmJrA/YXnXfCfFgAu
X-Google-Smtp-Source: AGHT+IHDUsmFcuyEuiXMU148+jNbNpI9r1/wqGCcgHuH7haynKQZFs61GjDI7QM15qHBWVStwTWHaw==
X-Received: by 2002:a05:600c:3b29:b0:42c:bd4d:e8ba with SMTP id 5b1f17b1804b1-42e9610a6famr13626365e9.8.1727257874435;
        Wed, 25 Sep 2024 02:51:14 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-90-105.ip49.fastwebnet.it. [93.34.90.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc1560a7sm3576976f8f.0.2024.09.25.02.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:51:14 -0700 (PDT)
Message-ID: <66f3dd12.5d0a0220.8f8b6.af43@mx.google.com>
X-Google-Original-Message-ID: <ZvPdDqLlCVrf5k9R@Ansuel-XPS.>
Date: Wed, 25 Sep 2024 11:51:10 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com, benjamin.larsson@genexis.eu,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 0/5] Add mfd, pinctrl and pwm support to EN7581 SoC
References: <20240911-en7581-pinctrl-v4-0-60ac93d760bb@kernel.org>
 <66f13ab0.5d0a0220.b0c27.b441@mx.google.com>
 <20240925094738.GD7545@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925094738.GD7545@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_025116_344534_912E4614 
X-CRM114-Status: GOOD (  37.41  )
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

On Wed, Sep 25, 2024 at 10:47:38AM +0100, Lee Jones wrote:
> On Mon, 23 Sep 2024, Christian Marangi wrote:
> 
> > On Wed, Sep 11, 2024 at 09:50:00PM +0200, Lorenzo Bianconi wrote:
> > > Introduce airoha-mfd driver in order to load pinctrl and pwm drivers for
> > > EN7581 SoC. airoha-mfd is needed since both pinctrl and pwm drivers
> > > needs to access the same memory block (gpio memory region) to configure
> > > {gio,irq}_chip and pwm functionalities respectively, so model them as
> > > childs of a parent mfd driver.
> > > Current EN7581 pinctrl driver supports the following functionalities:
> > > - pin multiplexing via chip_scu syscon
> > > - pin pull-up, pull-down, open-drain, current strength,
> > >   {input,output}_enable, output_{low,high} via chip_scu syscon
> > > - gpio controller
> > > - irq controller
> > > 
> > > ---
> > > Changes in v4:
> > > - add 'Limitation' description in pwm driver
> > > - fix comments in pwm driver
> > > - rely on mfd->base __iomem pointer in pwm driver, modify register
> > >   offsets according to it and get rid of sgpio_cfg, flash_cfg and
> > >   cycle_cfg pointers
> > > - simplify register utility routines in pwm driver
> > > - use 'generator' instead of 'waveform' suffix for pwm routines
> > > - fix possible overflow calculating duty cycle in pwm driver
> > > - do not modify pwm state in free callback in pwm driver
> > > - cap the maximum period in pwm driver
> > > - do not allow inverse polarity in pwm driver
> > > - do not set of_xlate callback in the pwm driver and allow the stack to
> > >   do it
> > > - fix MAINTAINERS file for airoha pinctrl driver
> > > - fix undefined reference to __ffsdi2 in pinctrl driver
> > > - simplify airoha,en7581-gpio-sysctl.yam binding
> > > - Link to v3: https://lore.kernel.org/r/20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org
> > > 
> > > Changes in v3:
> > > - introduce airoha-mfd driver
> > > - add pwm driver to the same series
> > > - model pinctrl and pwm drivers as childs of a parent mfd driver.
> > > - access chip-scu memory region in pinctrl driver via syscon
> > > - introduce a single airoha,en7581-gpio-sysctl.yaml binding and get rid
> > >   of dedicated bindings for pinctrl and pwm
> > > - add airoha,en7581-chip-scu.yaml binding do the series
> > > - Link to v2: https://lore.kernel.org/r/20240822-en7581-pinctrl-v2-0-ba1559173a7f@kernel.org
> > > 
> > > Changes in v2:
> > > - Fix compilation errors
> > > - Collapse some register mappings for gpio and irq controllers
> > > - update dt-bindings according to new register mapping
> > > - fix some dt-bindings errors
> > > - Link to v1: https://lore.kernel.org/all/cover.1723392444.git.lorenzo@kernel.org/
> > > 
> > > ---
> > > Benjamin Larsson (1):
> > >       pwm: airoha: Add support for EN7581 SoC
> > > 
> > > Christian Marangi (2):
> > >       dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Controller
> > >       mfd: airoha: Add support for Airoha EN7581 MFD
> > > 
> > > Lorenzo Bianconi (2):
> > >       dt-bindings: arm: airoha: Add the chip-scu node for EN7581 SoC
> > >       pinctrl: airoha: Add support for EN7581 SoC
> > > 
> > >  .../bindings/arm/airoha,en7581-chip-scu.yaml       |   42 +
> > >  .../bindings/mfd/airoha,en7581-gpio-sysctl.yaml    |  433 +++
> > >  MAINTAINERS                                        |    7 +
> > >  drivers/mfd/Kconfig                                |    8 +
> > >  drivers/mfd/Makefile                               |    2 +
> > >  drivers/mfd/airoha-en7581-gpio-mfd.c               |   72 +
> > >  drivers/pinctrl/mediatek/Kconfig                   |   16 +-
> > >  drivers/pinctrl/mediatek/Makefile                  |    1 +
> > >  drivers/pinctrl/mediatek/pinctrl-airoha.c          | 2964 ++++++++++++++++++++
> > >  drivers/pwm/Kconfig                                |   10 +
> > >  drivers/pwm/Makefile                               |    1 +
> > >  drivers/pwm/pwm-airoha.c                           |  414 +++
> > >  include/linux/mfd/airoha-en7581-mfd.h              |    9 +
> > >  13 files changed, 3978 insertions(+), 1 deletion(-)
> > > ---
> > > base-commit: 264c13114bd71ddfd7b25c7b94f6cda4587eca25
> > > change-id: 20240818-en7581-pinctrl-1bf120154be0
> > > prerequisite-change-id: 20240705-for-6-11-bpf-a349efc08df8:v2
> > > 
> > >
> > 
> > Hi,
> > 
> > any news with this? Rob reviewed the DT schemas and he is ok with them.
> > 
> > Any other comments for the MFD driver and/or the pinctrl or PWM driver?
> 
> Note that the merge-window is still open.  Some maintainers, myself
> included, use this lull to prioritise other things.  This set is on my
> list and will be dealt with shortly.
> 

Wasn't aware the merge window was still open and sorry for the noise.
Thanks for the feedback!

-- 
	Ansuel

