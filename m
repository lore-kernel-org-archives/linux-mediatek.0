Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D42C35FE7
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Sep 2024 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/DaHEnUjrhvmfJyjNw/EJYlPiWPCk7haRRTEhJV3pU=; b=5FqIoG10IPKjGY/eLMDV3qI8a4
	c7wjpV7DfS3sCRh7cgAn1TZYLHO2C/GlqCz9v01A8ShrhcwoIEV9BTZ3IJku6UyQ9IINmyObM7r0d
	vxkyXEPjN6HWI8XNUqHdBWoH3Sw/jY12FReWRmgxyZIZxZcYC4mFt73iqk0sEp+XXFnBQjIc6hvOO
	2uoXcNYlzkixDFZOGGAwjfBXP6W8cDQbH+6BHV2XzDJ0Tt+BoOOVsPp57IspAH1dlMPLXf0l7Uqh5
	bv7zZw+thZOeai9FzOfK9p8P1MhQVELdViDKjBIomTRWDn3yMTc3l+kOcKk3Xn6KCfPQlhHj/rEB1
	PXbCP87Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spmDN-00000001xFn-0Pm9;
	Sun, 15 Sep 2024 10:10:45 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spmCG-00000001xAb-3aMd;
	Sun, 15 Sep 2024 10:09:38 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5365b71a6bdso2465055e87.2;
        Sun, 15 Sep 2024 03:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726394974; x=1726999774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/DaHEnUjrhvmfJyjNw/EJYlPiWPCk7haRRTEhJV3pU=;
        b=atLY7qVCTGb7tirr0wX+NeqOzLI7blVrIwKCm0ffWHIuC6SL+mP6jgDej7TxsCvEKy
         qJBKf0pe/diaR6hI2yFNN6PsRUvAGi4dvoAxTfoVIHJVx1fxEU8UA9I4PuH2o/CnpEPa
         uPQ4puvI7Oncmn6KLzXTHRpk6JBideTiRE/4nBHYgRFVWZ7cvhG/9F5mWo8HsH7g8rAn
         XZ5aD/rdFQHgRPcLO6Xdo2W0cK3TRvc4rgRh+L5S4oS+J0OMnn1x6yuUNpvP0EOlVo0T
         22q0+rPRWzMHR2gvVa9iRAfG704lQoN+WqWLoQH93+qtqZ2zOcAmGJY85//KW8ilC/qq
         3r/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726394974; x=1726999774;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/DaHEnUjrhvmfJyjNw/EJYlPiWPCk7haRRTEhJV3pU=;
        b=g0J+mttn87chl1CKV8Pn1ZCOa2x2U9XP62PBBS/FArxw7lEkwJ9/UEnPCGuFHZ4uS9
         4TvYWoMpfdpW+cJ6uFQd+GiOG2u0zp5T/7WlH3lLS0UExk1c+nk0cXhUAjD2mlCqbQ8l
         /RogFaRrX8e3OpIn2n9ez0GR+rpncEpseKglJN+id9mJsaxsSJS5CBvc/TMCGI8sZFNG
         hiuzpuGHNZ/Ulu3MTXiXTvWBJeWijpvqwbeV3iE1tr0vBPqrk+qaFla2yUy59M607PIF
         A6Y7buCCPneIGEArop0Lh0kgwIoI/hXQ1GgE0sNxvyHMRDosbQLJarECDvfgCs6NgkvG
         jftQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7GwZ7nY7P9Z56GcIbsDOrLoItrJG/ksNfGVUpEa9d1Ablv7mihkWMwSZ++QSLxGBg3rm+VFuhWnTEHyRV8y1L@lists.infradead.org, AJvYcCXPrJvnxC00keWTeq6Z+J9CJ4iGL+IJTT4bYDmismuUEQgz5Cdygw42JzLk2KZ8GKEBtGbr3+gRsHk5E+xsco8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLEek1ALrK2uIiO5el/Fy7jXadKBE9Z+wSkn/UjBYgJo12dg00
	Vaqlxlrx7fgTjOOkGG+Buy3QsxSNZbsNP2GPmGocMUGd7zEPN1BI
X-Google-Smtp-Source: AGHT+IGaUky0E13On+sxK3FeW8LoYl+upTv1F/M3d5F2vr5G6OAHtvOyCkJgJ5xhe603775A/voLzw==
X-Received: by 2002:a05:6512:3f06:b0:534:5453:ecda with SMTP id 2adb3069b0e04-5367fee2703mr4169678e87.23.1726394973484;
        Sun, 15 Sep 2024 03:09:33 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368704c2c2sm513630e87.75.2024.09.15.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 03:09:32 -0700 (PDT)
Date: Sun, 15 Sep 2024 13:09:32 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v7 06/10] i2c: Introduce OF component probe function
Message-ID: <ZuayXMGMdEqSyvUl@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
References: <20240911072751.365361-1-wenst@chromium.org>
 <20240911072751.365361-7-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240911072751.365361-7-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_030936_919857_6A0D2CC7 
X-CRM114-Status: GOOD (  25.39  )
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

On 24-09-11 15:27, Chen-Yu Tsai wrote:
> Some devices are designed and manufactured with some components having
> multiple drop-in replacement options. These components are often
> connected to the mainboard via ribbon cables, having the same signals
> and pin assignments across all options. These may include the display
> panel and touchscreen on laptops and tablets, and the trackpad on
> laptops. Sometimes which component option is used in a particular device
> can be detected by some firmware provided identifier, other times that
> information is not available, and the kernel has to try to probe each
> device.
> 
> This change attempts to make the "probe each device" case cleaner. The
> current approach is to have all options added and enabled in the device
> tree. The kernel would then bind each device and run each driver's probe
> function. This works, but has been broken before due to the introduction
> of asynchronous probing, causing multiple instances requesting "shared"
> resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
> time, with only one instance succeeding. Work arounds for these include
> moving the pinmux to the parent I2C controller, using GPIO hogs or
> pinmux settings to keep the GPIO pins in some fixed configuration, and
> requesting the interrupt line very late. Such configurations can be seen
> on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
> Lenovo Thinkpad 13S.
> 
> Instead of this delicate dance between drivers and device tree quirks,
> this change introduces a simple I2C component probe. function For a
> given class of devices on the same I2C bus, it will go through all of
> them, doing a simple I2C read transfer and see which one of them responds.
> It will then enable the device that responds.
> 
> This requires some minor modifications in the existing device tree. The
> status for all the device nodes for the component options must be set
> to "failed-needs-probe". This makes it clear that some mechanism is

Wrong status name ("failed-needs-probe"), "fail-needs-probe". This is
minor, but it confused me as I went through patchset first time, since
there are different name in different patches.

> needed to enable one of them, and also prevents the prober and device
> drivers running at the same time.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

-- 
Best regards,
Andrey Skvortsov

