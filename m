Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD07C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 09:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WKlacHhWVR2IblvCAgYMcCw7cvtmo7gBzlhxFpijOWM=; b=oSP8sL8tKfWrFpLYSP+QI9N5Nj
	WoLvVMidJz4jRAtur2TmifKIRFWJnkVp/VKAbL2tlNN1hMiwDaxRxcm0LaTJrbCo+vef4ACZg1sF9
	JCsusiqtWEKVlMMaTrTjHFTJY60ME0iA0uRXxGL+zA6VjqlzVheeW75NbaCMDi18eUaCj32r3EQda
	qbYsNmFGqF9nzD8g7Ye9awbGQWiHqJ13zMca9eWBztcAeVUf7MzFbVM5j35Cp9ubbVdcLLVEzUmxy
	ouWLvY6R9/KCws2mKNRQfc3w1H6n8pz/Cjz/3MFd2X936OvA80dZ0+Nujz1JBnZkkzSTTo8k5OLSd
	UKrbAUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o916S-007gTo-Ac; Wed, 06 Jul 2022 09:13:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9162-007gE3-FC; Wed, 06 Jul 2022 09:13:23 +0000
Received: by mail-ed1-x536.google.com with SMTP id m16so2943943edb.11;
        Wed, 06 Jul 2022 02:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WKlacHhWVR2IblvCAgYMcCw7cvtmo7gBzlhxFpijOWM=;
        b=UyINPEp8aUU7+iO4UvYReAysG8acJi4s0lW7fYS990hIHuI2KgReqshlPjlC0FcdQX
         RWLEJ1iagzj5JHTLAwg1Tfl34CjKErUg06qCwRi5FpbuqXpIfRK0B8kuUc2l5x+40o+8
         2YldATzAdsq2GhIZIL2D0cZi8oKOkVG5Y5xLvvP4kajNiX5yCXAJSyEYBx1RvA9W9SdO
         piij5Lfa0VXVwqnHofYdHxRPOmYTBO/NXTATLm6C9JRKYr2iRvgzlsZTZRGqO8gtc9pI
         zkPBxco6Fa5B8qkZy3WblPhpXY+1PsQ3ol/zLxC+L8wAov5SdI1JA4byrn/VHyXJavbs
         ZPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WKlacHhWVR2IblvCAgYMcCw7cvtmo7gBzlhxFpijOWM=;
        b=oSe3/8keCNFk8WMgW9t+LfnfoxEFaOO8zdo8x1h3GcHMzBO9hwMlFhJmAxGtfRW24H
         1PSS/eIWWq5kpzvBPw46UFQCTcsubIEXqvsuth6jryhUmDoD3rT+jlHOv7FGgkHGT1DK
         Sq8YSWLboDghQbdYb7LTdu/Ga1L7vkFwc0nAohED01AB3oTeUVc2TEz4gtdyNQUq6/k9
         CF8WM3v22IVqZyWT63pufaSLaUpcSUmGG6B7Y80AZsEKN5wdsxYof56x4FCjgPjDjlao
         yQS2E768iUaaJBdHZSL6HbM57gt9QoMcXHCkiF3csD5TF3sHGRs7+7U0E+cJuw3gtOw9
         vc4Q==
X-Gm-Message-State: AJIora869NsRZOzgiSKeQaI1Qmof352cb/Iqup7z2bacXNu1O/SYmrCB
	cnb7rZi5mZk0Yq2zvCEPBD8=
X-Google-Smtp-Source: AGRyM1tgzHocOxIjG9HexS+g9z9ap2nsem/HblqVyMjIbl5ZbLhG8nAvflW5PCvUObUWjIPHfLadCA==
X-Received: by 2002:a05:6402:350a:b0:435:df44:30aa with SMTP id b10-20020a056402350a00b00435df4430aamr51209856edd.403.1657098799156;
        Wed, 06 Jul 2022 02:13:19 -0700 (PDT)
Received: from skbuf ([188.26.185.61])
        by smtp.gmail.com with ESMTPSA id er13-20020a056402448d00b0043a5bcf80a2sm6350790edb.60.2022.07.06.02.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:13:18 -0700 (PDT)
Date: Wed, 6 Jul 2022 12:13:15 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Wolfram Sang <wsa@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org, chrome-platform@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
	linux-omap@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220706091315.p5k2jck3rmyjhvqw@skbuf>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_021322_559615_8D07E95B 
X-CRM114-Status: GOOD (  12.74  )
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

On Tue, Jun 28, 2022 at 04:03:12PM +0200, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <uwe@kleine-koenig.org>
> 
> The value returned by an i2c driver's remove function is mostly ignored.
> (Only an error message is printed if the value is non-zero that the
> error is ignored.)
> 
> So change the prototype of the remove function to return no value. This
> way driver authors are not tempted to assume that passing an error to
> the upper layer is a good idea. All drivers are adapted accordingly.
> There is no intended change of behaviour, all callbacks were prepared to
> return 0 before.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Assuming you remove the spurious kasan change:

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

