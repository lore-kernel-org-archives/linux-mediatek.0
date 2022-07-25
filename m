Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E33C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QR4thViojhLm7m3iVqTAzOPrEuZ+oboQVEbkcRYR7U0=; b=oBIyeRN3ICxvunjhpR7yuJEtPa
	K5oJUXAwzfpNXpRM1bJE9jXuczhgRk9zYL5m+xw+hlDsziULUrDPyHhEzJSm7MUr5Vjc1IzWVhatF
	uDvyn66hLyRfPgDBTEoaCAO/2RQ69j4Pahqi32vEIJgMey996N3poNuykMP2aTRb1cwcVMFAKTW7J
	rFtqnk9lrK8nBZ4AnET3qLnrGFNO1wxKNMF8X4+OxVF72883B0qKZLHzSNPaxqi6/ZHYgYYz9SEBn
	Qx9NDtFqn5U0HANelPcxkURzhrOE4gB31o1LYJxIND5hMcXMK7/1kgl2ZcfR38i5CjTLaUd2fXYCp
	sTfGukZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvNK-008G6v-3j; Mon, 25 Jul 2022 10:31:46 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFvN8-008Fr4-S8
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 10:31:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id m17so15029470wrw.7
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QR4thViojhLm7m3iVqTAzOPrEuZ+oboQVEbkcRYR7U0=;
        b=hcY3ebDhxmUgKAKSOPUOX7d/LMYdV3cijN2N6OfC0kvVYjMwOvmOolx+2NETIKYqUp
         GPy3YFMR7smmOlatz8CKT+4p2UQ+6lI9Ejv06f+y6zEFBSmLUPFbbscFbBBsOCvH434Q
         ke8WXFQ+uXl36Kdevvs6uhTIaQQgtIFRovUfQ/RDq3AHQ469OhSceGOKRnPmFWjpxVnH
         VERQ2rtptnToPx6leEXxAAby7RDypiZaQady2IbBpsvPlsYJ0uSwLW6l0adFiFhqOZ8D
         XJZDsGiJcpWWsVtF7ngMWVpb9VQHwHEkKK2RVLip5CsQWVUMkj1jqMMhHMjq3wvU4bke
         J0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QR4thViojhLm7m3iVqTAzOPrEuZ+oboQVEbkcRYR7U0=;
        b=qq0sKeRt9tKWaKMXwqYUmjP463MQdCc8nxuOCGn1f4Fr3cwT1epHNbvpY6U4hqX5LB
         uODuD1VdNTD+InS/cWGLjZ9d4QzY+1cZ0BSW8grTkr6LX3Y2SSUNyn2wi5tQs23M/jjH
         kE/jOuw9FVwQbIv1seoawjXqsJ1iIevf+j2C1qefqCPM23CyI5IwH9CZTR5EFnrrnjCd
         7aYYBzB1EsbnxvTa08x3dChmR9SDINS2o55l4b6n9kQrMV3TfaogcYS3rtQdW09GtYl+
         93cMEVIDB6GykygK+EtLuuayjvHrNRrDkADfdYw/qBU4YLl1lchK70bTRsoRZPnmTeIM
         2WGQ==
X-Gm-Message-State: AJIora+/OmbwKjfBmI0xWUB0GFgKyq3ATxDuL0eCgZ9LFfRfFt2IBTQ7
	25C6hk3YFZqBjuPwf/G48ZpKXA==
X-Google-Smtp-Source: AGRyM1uhInd5p9lSRbYGnaq9oTNYSYBtNWlkq9wyaVzmMkSkg4hYhWboyJgYIo9QbRHYBeJSc2cjCg==
X-Received: by 2002:a5d:584c:0:b0:21e:7f48:bf19 with SMTP id i12-20020a5d584c000000b0021e7f48bf19mr5190179wrf.474.1658745090915;
        Mon, 25 Jul 2022 03:31:30 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c1d1200b003a04d19dab3sm29367538wms.3.2022.07.25.03.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 03:31:30 -0700 (PDT)
Date: Mon, 25 Jul 2022 11:31:28 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: lee.jones@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com
Subject: Re: [PATCH v6 13/13] video: backlight: mt6370: Add MediaTek MT6370
 support
Message-ID: <20220725103128.xtaw2c4y5fobowg7@maple.lan>
References: <20220722102407.2205-1-peterwu.pub@gmail.com>
 <20220722102407.2205-14-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220722102407.2205-14-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_033134_916159_30503587 
X-CRM114-Status: GOOD (  26.17  )
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

On Fri, Jul 22, 2022 at 06:24:07PM +0800, ChiaEn Wu wrote:
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index a003e02..846dbe7 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -268,6 +268,18 @@ config BACKLIGHT_MAX8925
>  	  If you have a LCD backlight connected to the WLED output of MAX8925
>  	  WLED output, say Y here to enable this driver.
>
> +config BACKLIGHT_MT6370
> +	tristate "MediaTek MT6370 Backlight Driver"
> +	depends on MFD_MT6370
> +	help
> +	  This enables support for Mediatek MT6370 Backlight driver.
> +	  It's commonly used to drive the display WLED. There are 4 channels
> +	  inside, and each channel supports up to 30mA of current capability
> +	  with 2048 current steps in exponential or linear mapping curves.

Does the MT6372 support more steps than this? In other words does it use
a fourteen bit scale or does it use an 11-bit scale at a different
register location?


> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called "mt6370-backlight".
> +
> [...]
> diff --git a/drivers/video/backlight/mt6370-backlight.c b/drivers/video/backlight/mt6370-backlight.c
> new file mode 100644
> index 0000000..ba00a8f
> --- /dev/null
> +++ b/drivers/video/backlight/mt6370-backlight.c
> [...]
> +static int mt6370_bl_update_status(struct backlight_device *bl_dev)
> +{
> +	struct mt6370_priv *priv = bl_get_data(bl_dev);
> +	int brightness = backlight_get_brightness(bl_dev);
> +	unsigned int enable_val;
> +	u8 brightness_val[2];
> +	int ret;
> +
> +	if (brightness) {
> +		brightness_val[0] = (brightness - 1) & MT6370_BL_DIM2_MASK;
> +		brightness_val[1] = (brightness - 1) >> fls(MT6370_BL_DIM2_MASK);
> +
> +		/*
> +		 * To make MT6372 using 14 bits to control the brightness
> +		 * backward compatible with 11 bits brightness control
> +		 * (like MT6370 and MT6371 do), we left shift the value
> +		 * and pad with 1 to remaining bits. Hence, the MT6372's
> +		 * backlight brightness will be almost the same as MT6370's
> +		 * and MT6371's.
> +		 */
> +		if (priv->vid_type == MT6370_VID_6372) {
> +			brightness_val[0] <<= MT6370_BL_DIM2_6372_SHIFT;
> +			brightness_val[0] |= MT6370_BL_DUMMY_6372_MASK;
> +		}

This somewhat depends on the answer to the first question above, but
what is the point of this shifting? If the range is 14-bit then the
driver should set max_brightness to 16384 and present the full range of
the MT6372 to the user.

Especially when using linear mappings (which are a totally pointless
scale to use for a backlight) the extra steps are useful for backlight
animation.


Daniel.

