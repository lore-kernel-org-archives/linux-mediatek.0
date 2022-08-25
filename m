Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF62BECAAA2
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 21:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nls6DGbfFRAP957pxJ4lCmbOvdtMF+yoGyK/eIAHqyg=; b=Va0aNnndE2UVwGq2JtyHCWgKdG
	fK6sDsbHS2VSYp+7cyGnNRfgHWEhwyQtKOZmECmX7obDcQ+CwPOdPPOYE06YsAneNsmN4gPge9g4b
	LLIZLwdgRl0XJiBBItu7G6iGUe+xvGd8xqPSdwvxc7GiWdb2i+lTvtBngouv3P2UQyd+wGc0CzLsq
	JA2L+aXHEidDlnJotfeoL09t+SHwW2keV0+lZ7vvtCNCG95M7AspM0rmc82qBZCFOJCpb5UIe32Qr
	KnlD+wfOvL5Q89mD1PWaUHvKJP6CmrMESFMbB81aDUgzHC/rJ/pGPX04zK8boceoPiHHMuQRx886B
	5Jvfvjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKMH-003Qt6-U2; Thu, 25 Aug 2022 21:25:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRKM5-003Qod-6q; Thu, 25 Aug 2022 21:25:38 +0000
Received: by mail-wm1-x32c.google.com with SMTP id r83-20020a1c4456000000b003a5cb389944so3388973wma.4;
        Thu, 25 Aug 2022 14:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=nls6DGbfFRAP957pxJ4lCmbOvdtMF+yoGyK/eIAHqyg=;
        b=dlpbM58i2Zl35pjmx5L7mRNtdc5YCm71F9sFmlELYER6ov9p1Zhw7Uryp66w+fECkw
         uWkzwI4ANxiJqV2NAH5qiBvSocnn8gCiQ2esbEPyK9VfrLMG6MP+UW57WsLhfQeb18Xm
         ywTHy3WQy2y0FYikqc1VoN0s6VRtWmBPqvQ7ayhaGh2a543N2UKdV/DJLzBcZZCckZJ6
         ioibCRuSXHClGOmbzN9j5ra8iRima6daMxIf45aGXMyoGgBcf5Q8AplMooQ7YxG8j1KJ
         +wVv5gF0Swo9gXi4Wnksh6Jhf6DtKC3uqCuZv3IfpxDnq0EW8o52F4JCeA7KQe1HLfXz
         RrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=nls6DGbfFRAP957pxJ4lCmbOvdtMF+yoGyK/eIAHqyg=;
        b=11j2y0yevzQSFDZByC9UbM033O1Sxm2OeyYRcpGK2VLKg2gdFs3teBVyHmGS0Wl3zy
         0g+n5ru/1Cn1IOsXv5Ugwva791jSaSe7EkCtIQY2XB28Hu4HFcuAMR97WbxzZHGiOePH
         WWD/tPcGoSVZ6S0QBRDf4aWmhmNC85FGcAhysAxVpsDdmJXNwCiBoKtRECaqQ1FmfOtc
         8/vgwTmFrgP7h4Q+kUZ68fol8AB2UGVPWiXZwfLMGuYKS5SA2UA7h7Gn2iO46EG5TGNw
         9h74bcZxssEUKs9Zj0m9nrYXgH/GPXuqXIrCs3ReK8klpyYUnJ8/63/SekYONOHvf8Rb
         yulQ==
X-Gm-Message-State: ACgBeo1TAKKHdgZ6B5mjVmOvesKYz+Du+25VhqqOB6C7e8s8Qv3Baq9E
	1PJycrrf75L3tcTM+8i05tw=
X-Google-Smtp-Source: AA6agR4u4BAmHRat5LFEkPb1QUEY6oOp43RCL7jbGC6PWwiKhCvUcU/tuSQkwukDJ89Tw4ddFY+90Q==
X-Received: by 2002:a05:600c:b47:b0:3a5:a431:ce36 with SMTP id k7-20020a05600c0b4700b003a5a431ce36mr3484083wmr.89.1661462735769;
        Thu, 25 Aug 2022 14:25:35 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b003a64f684704sm7324411wmq.40.2022.08.25.14.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 14:25:35 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: vkoul@kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>
Cc: f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, lars@metafoo.de, 
	Eugeniy.Paltsev@synopsys.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, daniel@zonque.org, 
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, agross@kernel.org, 
	bjorn.andersson@linaro.org, konrad.dybcio@somainline.org, 
	alim.akhtar@samsung.com, green.wan@sifive.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, wens@csie.org, samuel@sholland.org, 
	ldewangan@nvidia.com, jonathanh@nvidia.com, thierry.reding@gmail.com, 
	peter.ujfalusi@gmail.com, michal.simek@xilinx.com, tony@atomide.com, 
	trix@redhat.com, radhey.shyam.pandey@xilinx.com, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] dmaengine: drivers: Use devm_platform_ioremap_resource()
Date: Thu, 25 Aug 2022 23:25:33 +0200
Message-ID: <1922204.usQuhbGJ8B@kista>
In-Reply-To: <20220820130925.589472-1-tudor.ambarus@microchip.com>
References: <20220820130925.589472-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_142537_450200_26A902C2 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

Dne sobota, 20. avgust 2022 ob 15:09:25 CEST je Tudor Ambarus napisal(a):
> platform_get_resource() and devm_ioremap_resource() are wrapped up in the
> devm_platform_ioremap_resource() helper. Use the helper and get rid of the
> local variable for struct resource *. We now have a function call less.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/dma/bcm2835-dma.c                      |  4 +---
>  drivers/dma/dma-axi-dmac.c                     |  4 +---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  4 +---
>  drivers/dma/fsl-edma.c                         |  8 +++-----
>  drivers/dma/fsl-qdma.c                         | 10 +++-------
>  drivers/dma/idma64.c                           |  4 +---
>  drivers/dma/img-mdc-dma.c                      |  4 +---
>  drivers/dma/imx-dma.c                          |  4 +---
>  drivers/dma/imx-sdma.c                         |  4 +---
>  drivers/dma/mcf-edma.c                         |  5 +----
>  drivers/dma/mediatek/mtk-hsdma.c               |  4 +---
>  drivers/dma/mmp_pdma.c                         |  4 +---
>  drivers/dma/mmp_tdma.c                         |  4 +---
>  drivers/dma/moxart-dma.c                       |  4 +---
>  drivers/dma/mv_xor_v2.c                        |  7 ++-----
>  drivers/dma/mxs-dma.c                          |  4 +---
>  drivers/dma/nbpfaxi.c                          |  4 +---
>  drivers/dma/pxa_dma.c                          |  4 +---
>  drivers/dma/qcom/bam_dma.c                     |  4 +---
>  drivers/dma/s3c24xx-dma.c                      |  4 +---
>  drivers/dma/sf-pdma/sf-pdma.c                  |  4 +---
>  drivers/dma/sh/usb-dmac.c                      |  4 +---
>  drivers/dma/stm32-dma.c                        |  4 +---
>  drivers/dma/stm32-dmamux.c                     |  4 +---
>  drivers/dma/stm32-mdma.c                       |  4 +---
>  drivers/dma/sun4i-dma.c                        |  4 +---
>  drivers/dma/sun6i-dma.c                        |  4 +---

For sun4i-dma.c and sun6i-dma.c:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  drivers/dma/tegra210-adma.c                    |  4 +---
>  drivers/dma/ti/cppi41.c                        | 10 +++-------
>  drivers/dma/ti/omap-dma.c                      |  4 +---
>  drivers/dma/xilinx/zynqmp_dma.c                |  4 +---
>  31 files changed, 38 insertions(+), 106 deletions(-)




