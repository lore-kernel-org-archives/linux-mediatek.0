Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE71C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 08:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8Lrs/+MllbH0EaND+y5sdEN8MnOT2GnsWA0+3oTxQk=; b=cxOz8HSRvxtSP+
	SU9Jey31XytlJ3GgXZFlhrPPqf8oovqZxuw1pwc+mGFucMbBIPr+N8OAKS0KXl3J2ff5wz4ifuSV3
	xwAd1o8bCDfz7ttQ0BsHFTb9Q/TUXyg/WoddLDGLTGka0cDauOin606ukUXNrLaoeuqL5/iIVNftq
	zY6APilosQq98o+P8ooxroGvlxwH7T7LpyejLfWt1i6kMNPOIkqeg/eYEU7OCtq/8Z75lnyiv5jFR
	lmAPktba58b3NllNiBhERTGwuxGN8X0l63lXC/vlV/mu7M5c9424yOyzzDQyuDpE/f+rfki8V9CDd
	/Q4dtCn+eshDaXodFH/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTfuk-004Ppd-RZ; Mon, 14 Mar 2022 08:18:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTfdp-004HzO-9b
 for linux-mediatek@lists.infradead.org; Mon, 14 Mar 2022 08:01:24 +0000
Received: by mail-wr1-x432.google.com with SMTP id h15so22443557wrc.6
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Mar 2022 01:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZbQvHoyGIYzvUki2Rr3koBlbf8HphwGvoPoiGFCWjVI=;
 b=Px/AIFSkS5xiQntL+czEDZNooaKyKwCT5+5oX3Dxiuaq0p2Muil6CAGE/yKjTcSPRk
 zDe4uh38/LLZAeLwbHMGwjTg12kmpC6yeWSofKA0umP5cCfX9/OYY82Bw345RNYb0ncn
 orCm5F+5ZfCmlxK+d1VXp7nIMCWzluoafQnmDOcfqWejvaYNcsBVEphbI2O0YMhV2/Sw
 btjwvk4hgGfi1Ebtg7vyteqdSKhr8lp3tlnQhW8mViZOmcTxC9P84ODdx/3FeHEOfW8P
 6h58+Jo9NlVZHRXuw0qPEJXdJKCF5VgLcohK/rtJkyKSW2QSe8R2Hvd+nhg3g9Uwmmee
 CRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=ZbQvHoyGIYzvUki2Rr3koBlbf8HphwGvoPoiGFCWjVI=;
 b=rH6SnZ/O8X1V73D9L0ASlHCIULPEEh+KWXniHM/IMdLS7jxA/y2IXRGyO2W/W4Ozs5
 qdCByqKgWx06MsQR7r+XFogUjOi3Xxr695GwUuWDGfxdkD2ApB2ThB9DEXyvEEoTnWjX
 fP9zaO2tZOhuJA9mlXYYZZIxMAeuKYwLNhB+iT28B2boIkI+5Gm7CVkVy2B98+JtGYWG
 6KbO6lhm2N1ledUxi9UzT3iBKckuSFIR65ICfZTrO3pOeUPS4/lgSLaf5qR5IC6w8lx3
 oG+jJdFkgOizE1MUaVgMuydG7+LHCZuS6np3xy+c48mEZLGMBNUCG68tqd0zG8p45qOn
 lTwg==
X-Gm-Message-State: AOAM530ViuAKrSPpLWCdYkddEZBeUU0PJ7Lx17Nsau4VBSJSaMFQ0e2R
 ZQ5DldqmOhWnagSVn39NbgbauQ==
X-Google-Smtp-Source: ABdhPJztePfcEZyw3gKDCW6el7zVf+skc/7D+PKs0YU6FDvddmqBB//lsO2gITU97Xj5EZ5qC+/51g==
X-Received: by 2002:adf:fb4e:0:b0:1e3:3e66:d5f6 with SMTP id
 c14-20020adffb4e000000b001e33e66d5f6mr16194756wrs.615.1647244875196; 
 Mon, 14 Mar 2022 01:01:15 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:67f0:57f7:2185:6d18?
 ([2001:861:44c0:66c0:67f0:57f7:2185:6d18])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm14188253wme.24.2022.03.14.01.01.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 01:01:14 -0700 (PDT)
Message-ID: <18f984ff-36c8-dbe5-6dd0-404c4fe9deab@baylibre.com>
Date: Mon, 14 Mar 2022 09:01:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 64/64] media: Kconfig: cleanup VIDEO_DEV dependencies
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, mjpeg-users@lists.sourceforge.net,
 openbmc@lists.ozlabs.org
References: <cover.1647242578.git.mchehab@kernel.org>
 <decd26e90adc5c16470e4f738810f22fe6478b27.1647242579.git.mchehab@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <decd26e90adc5c16470e4f738810f22fe6478b27.1647242579.git.mchehab@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_010121_430434_4B27688A 
X-CRM114-Status: GOOD (  21.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14/03/2022 08:55, Mauro Carvalho Chehab wrote:
> media Kconfig has two entries associated to V4L API:
> VIDEO_DEV and VIDEO_V4L2.
> 
> On Kernel 2.6.x, there were two V4L APIs, each one with its own flag.
> VIDEO_DEV were meant to:
> 	1) enable Video4Linux and make its Kconfig options to appear;
> 	2) it makes the Kernel build the V4L core.
> 
> while VIDEO_V4L2 where used to distinguish between drivers that
> implement the newer API and drivers that implemented the former one.
> 
> With time, such meaning changed, specially after the removal of
> all V4L version 1 drivers.
> 
> At the current implementation, VIDEO_DEV only does (1): it enables
> the media options related to V4L, that now has:
> 
> 	menu "Video4Linux options"
> 		visible if VIDEO_DEV
> 
> 	source "drivers/media/v4l2-core/Kconfig"
> 	endmenu
> 
> but it doesn't affect anymore the V4L core drivers.
> 
> The rationale is that the V4L2 core has a "soft" dependency
> at the I2C bus, and now requires to select a number of other
> Kconfig options:
> 
> 	config VIDEO_V4L2
> 		tristate
> 		depends on (I2C || I2C=n) && VIDEO_DEV
> 		select RATIONAL
> 		select VIDEOBUF2_V4L2 if VIDEOBUF2_CORE
> 		default (I2C || I2C=n) && VIDEO_DEV
> 
> In the past, merging them would be tricky, but it seems that it is now
> possible to merge those symbols, in order to simplify V4L dependencies.
> 
> Let's keep VIDEO_DEV, as this one is used on some make *defconfig
> configurations.
> 
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/64] at: https://lore.kernel.org/all/cover.1647242578.git.mchehab@kernel.org/
> 
>   drivers/input/rmi4/Kconfig                    |   2 +-
>   drivers/input/touchscreen/Kconfig             |   4 +-
>   drivers/media/Kconfig                         |   3 +
>   drivers/media/common/saa7146/Kconfig          |   2 +-
>   drivers/media/dvb-core/Kconfig                |   2 +-
>   drivers/media/dvb-frontends/Kconfig           |   4 +-
>   drivers/media/i2c/Kconfig                     | 250 +++++++++---------
>   drivers/media/i2c/ccs/Kconfig                 |   2 +-
>   drivers/media/i2c/cx25840/Kconfig             |   2 +-
>   drivers/media/i2c/et8ek8/Kconfig              |   2 +-
>   drivers/media/i2c/m5mols/Kconfig              |   2 +-
>   drivers/media/pci/Kconfig                     |   2 +-
>   drivers/media/pci/bt8xx/Kconfig               |   2 +-
>   drivers/media/pci/cobalt/Kconfig              |   2 +-
>   drivers/media/pci/cx18/Kconfig                |   2 +-
>   drivers/media/pci/dt3155/Kconfig              |   2 +-
>   drivers/media/pci/intel/ipu3/Kconfig          |   2 +-
>   drivers/media/pci/ivtv/Kconfig                |   2 +-
>   drivers/media/pci/meye/Kconfig                |   2 +-
>   drivers/media/pci/saa7146/Kconfig             |   6 +-
>   drivers/media/pci/sta2x11/Kconfig             |   2 +-
>   drivers/media/pci/tw5864/Kconfig              |   2 +-
>   drivers/media/pci/tw68/Kconfig                |   2 +-
>   drivers/media/pci/tw686x/Kconfig              |   2 +-
>   drivers/media/platform/Kconfig                |   6 +-
>   drivers/media/platform/allegro-dvt/Kconfig    |   2 +-
>   .../platform/allwinner/sun4i-csi/Kconfig      |   2 +-
>   .../platform/allwinner/sun6i-csi/Kconfig      |   2 +-
>   .../media/platform/allwinner/sun8i-di/Kconfig |   2 +-
>   .../platform/allwinner/sun8i-rotate/Kconfig   |   2 +-
>   .../media/platform/amlogic/meson-ge2d/Kconfig |   2 +-
>   drivers/media/platform/aspeed/Kconfig         |   2 +-
>   drivers/media/platform/atmel/Kconfig          |   8 +-
>   drivers/media/platform/cadence/Kconfig        |   4 +-
>   drivers/media/platform/chips-media/Kconfig    |   2 +-
>   drivers/media/platform/intel/Kconfig          |   2 +-
>   drivers/media/platform/marvell/Kconfig        |   4 +-
>   .../media/platform/mediatek/mtk-jpeg/Kconfig  |   2 +-
>   .../media/platform/mediatek/mtk-mdp/Kconfig   |   2 +-
>   .../platform/mediatek/mtk-vcodec/Kconfig      |   2 +-
>   .../media/platform/mediatek/mtk-vpu/Kconfig   |   2 +-
>   .../media/platform/nvidia/tegra-vde/Kconfig   |   2 +-
>   drivers/media/platform/nxp/Kconfig            |   6 +-
>   drivers/media/platform/nxp/amphion/Kconfig    |   2 +-
>   drivers/media/platform/nxp/imx-jpeg/Kconfig   |   2 +-
>   drivers/media/platform/qcom/camss/Kconfig     |   2 +-
>   drivers/media/platform/qcom/venus/Kconfig     |   2 +-
>   drivers/media/platform/renesas/Kconfig        |  30 +--
>   .../media/platform/renesas/rcar-vin/Kconfig   |   4 +-
>   drivers/media/platform/rockchip/rga/Kconfig   |   2 +-
>   .../media/platform/rockchip/rkisp1/Kconfig    |   2 +-
>   .../media/platform/samsung/exynos-gsc/Kconfig |   2 +-
>   .../media/platform/samsung/exynos4-is/Kconfig |   2 +-
>   .../media/platform/samsung/s3c-camif/Kconfig  |   2 +-
>   .../media/platform/samsung/s5p-g2d/Kconfig    |   2 +-
>   .../media/platform/samsung/s5p-jpeg/Kconfig   |   2 +-
>   .../media/platform/samsung/s5p-mfc/Kconfig    |   2 +-
>   drivers/media/platform/sti/bdisp/Kconfig      |   2 +-
>   drivers/media/platform/sti/delta/Kconfig      |   2 +-
>   drivers/media/platform/sti/hva/Kconfig        |   2 +-
>   drivers/media/platform/sti/stm32/Kconfig      |   4 +-
>   drivers/media/platform/ti/am437x/Kconfig      |   2 +-
>   drivers/media/platform/ti/davinci/Kconfig     |  12 +-
>   drivers/media/platform/ti/omap/Kconfig        |   2 +-
>   drivers/media/platform/ti/omap3isp/Kconfig    |   2 +-
>   drivers/media/platform/ti/vpe/Kconfig         |   4 +-
>   drivers/media/platform/via/Kconfig            |   2 +-
>   drivers/media/platform/xilinx/Kconfig         |   2 +-
>   drivers/media/radio/Kconfig                   |  54 ++--
>   drivers/media/radio/si470x/Kconfig            |   2 +-
>   drivers/media/radio/wl128x/Kconfig            |   2 +-
>   drivers/media/spi/Kconfig                     |   4 +-
>   drivers/media/test-drivers/Kconfig            |   2 +-
>   drivers/media/test-drivers/vicodec/Kconfig    |   2 +-
>   drivers/media/test-drivers/vimc/Kconfig       |   2 +-
>   drivers/media/test-drivers/vivid/Kconfig      |   2 +-
>   drivers/media/tuners/Kconfig                  |   6 +-
>   drivers/media/tuners/e4000.c                  |   6 +-
>   drivers/media/tuners/fc2580.c                 |   6 +-
>   drivers/media/usb/airspy/Kconfig              |   2 +-
>   drivers/media/usb/au0828/Kconfig              |   6 +-
>   drivers/media/usb/cpia2/Kconfig               |   2 +-
>   drivers/media/usb/dvb-usb-v2/Kconfig          |   8 +-
>   drivers/media/usb/dvb-usb/Kconfig             |   4 +-
>   drivers/media/usb/gspca/Kconfig               |  96 +++----
>   drivers/media/usb/gspca/gl860/Kconfig         |   2 +-
>   drivers/media/usb/gspca/m5602/Kconfig         |   2 +-
>   drivers/media/usb/hackrf/Kconfig              |   2 +-
>   drivers/media/usb/hdpvr/Kconfig               |   2 +-
>   drivers/media/usb/msi2500/Kconfig             |   2 +-
>   drivers/media/usb/pvrusb2/Kconfig             |   2 +-
>   drivers/media/usb/pwc/Kconfig                 |   2 +-
>   drivers/media/usb/s2255/Kconfig               |   2 +-
>   drivers/media/usb/stkwebcam/Kconfig           |   2 +-
>   drivers/media/usb/usbtv/Kconfig               |   2 +-
>   drivers/media/usb/uvc/Kconfig                 |   2 +-
>   drivers/media/usb/zr364xx/Kconfig             |   2 +-
>   drivers/media/v4l2-core/Kconfig               |  12 +-
>   drivers/media/v4l2-core/Makefile              |   2 +-
>   drivers/staging/media/atomisp/Kconfig         |   2 +-
>   drivers/staging/media/atomisp/i2c/Kconfig     |  14 +-
>   drivers/staging/media/hantro/Kconfig          |   2 +-
>   drivers/staging/media/imx/Kconfig             |   2 +-
>   drivers/staging/media/ipu3/Kconfig            |   2 +-
>   drivers/staging/media/max96712/Kconfig        |   2 +-
>   drivers/staging/media/meson/vdec/Kconfig      |   2 +-
>   drivers/staging/media/omap4iss/Kconfig        |   2 +-
>   drivers/staging/media/rkvdec/Kconfig          |   2 +-
>   drivers/staging/media/sunxi/cedrus/Kconfig    |   2 +-
>   drivers/staging/media/tegra-video/Kconfig     |   2 +-
>   drivers/staging/media/zoran/Kconfig           |   2 +-
>   drivers/staging/most/video/Kconfig            |   2 +-
>   .../vc04_services/bcm2835-camera/Kconfig      |   2 +-
>   drivers/usb/gadget/Kconfig                    |   2 +-
>   drivers/usb/gadget/legacy/Kconfig             |   2 +-
>   sound/pci/Kconfig                             |   4 +-
>   116 files changed, 371 insertions(+), 376 deletions(-)


Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> # for meson-vdec & meson-ge2d

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
