Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19824C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 08:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DeUefraTLOsYVw9xLhjc2jCiF4qkVOolmQaF127DKVk=; b=VG8IZO4jmU/Ea8KT3n6f0qSAJ3
	h1WXq2AC4LMWcQ9DtVUmG2AfHRLXUHR/73on2CiRd4jEQPHOQL1Sg2OW81yBef0wo+bpcGNvs917j
	nDXYQFvaEf4D89t32gExqYD6HLkzihL2BASYWcgI3Q2SPjrF9vK7+5e0P5aQgr95lYIwR/SESiTZz
	q4r0S1ViESosK596C7MoyzIa97hBIKSJivPpBY0RaW9Req8v6uMpl8UbvWywkBt79vVO4t0coUt78
	DhppEWvzPcBfT1GtfxMb7rNxg7wjiI/f1R9BknUhGmpx7xY9rYbIMZaoMtT614FE05Py29VJ5p1tS
	kQ7qkeQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7NT-006TU3-Qz; Thu, 24 Nov 2022 08:14:35 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy7My-006T8U-Cd; Thu, 24 Nov 2022 08:14:05 +0000
Received: by mail-lj1-x22d.google.com with SMTP id u2so1156407ljl.3;
        Thu, 24 Nov 2022 00:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DeUefraTLOsYVw9xLhjc2jCiF4qkVOolmQaF127DKVk=;
        b=PAL/4lgO3qwcAfVMsmymoQQ9m3TeqyOkDETk9KBNX6z/o9HLwn8RaXvTDlHWiBBDvg
         atY0ccAGfcCtVElHLwQsrm0QhHkHvKqJqM7RMLGPIFIPWuhF0QyVvPm9wRCzT9iCxASw
         LN5V+FcWg/SEJM7UxqmH+AYRIOqBhulcXZfzgGab0XACfOxuhyQKNDmHdtNHKaj/8Zfl
         FplfjNLMeze2dGtr55IUGmbCnmpZu5oViaQ4LvbS85ZhO261UmBzZe6bsie2P1qRpMeU
         ZCqIYWK6+QBAocMAgO6/neFsIvtKZ8dEs27C22xWp0mQ/KCBXyWacaXLkPM597S1fqZP
         NN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DeUefraTLOsYVw9xLhjc2jCiF4qkVOolmQaF127DKVk=;
        b=G1RhUDOwbQIa1U4pi9i3v5NTOMHZ31B4jdjMD7rUTJ7GaU6VM01NHwu6Wac7ZkOgLw
         ATcVSpcNXl/BjEbXTOxXfhCGklQRrQ3Mc/C6r3aw3E1tgZaIVxCjPRetkE8PmhXJ8sid
         DOWmrPEnTyfwJ+0lc3pPPFcn1TaywcY/CF0pWIvFJ4/urk7VZtwPpN/J/BTIgiTpHFiR
         +q24zlh6fZv5abx++VwU4FwqTlBKTkRFijo2YCpANwzid6aLCANQ1q0/Ku5hIVvfw3Yw
         CDHPeU0AoI8/eWNBnhiOVqaxLOKqNmwpr+jVCVQ0gEhobFI9mqe/ZBWHsNRFEt6iwy41
         jv/g==
X-Gm-Message-State: ANoB5pnqhdUTtKq7xXSmGbA7RGId4XHOzKf/ZhZOepCz+8oFIpOXxmdO
	LC63u6W2VP0X82ERccbWJ9A=
X-Google-Smtp-Source: AA0mqf6hK0Yfc6U0TtdSmI9ZQLi93h7zpR/we4ftZe8kBmfGIWxQNqL4Gq2HZFwudP2QWyuNPdZNhg==
X-Received: by 2002:a2e:c52:0:b0:277:9bf:9411 with SMTP id o18-20020a2e0c52000000b0027709bf9411mr4006863ljd.504.1669277641653;
        Thu, 24 Nov 2022 00:14:01 -0800 (PST)
Received: from ?IPV6:2001:999:485:946b:e412:ce24:16c6:ba10? ([2001:999:485:946b:e412:ce24:16c6:ba10])
        by smtp.gmail.com with ESMTPSA id p12-20020ac24ecc000000b0049a5a59aa68sm52803lfr.10.2022.11.24.00.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 00:14:01 -0800 (PST)
Message-ID: <b2a00199-fccf-5887-1029-99f9e7e55e7f@gmail.com>
Date: Thu, 24 Nov 2022 10:15:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3] dmaengine: drivers: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@microchip.com>, vkoul@kernel.org
Cc: f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, lars@metafoo.de, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, sean.wang@mediatek.com, matthias.bgg@gmail.com,
 daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 green.wan@sifive.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, ldewangan@nvidia.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, michal.simek@xilinx.com, tony@atomide.com,
 krzysztof.kozlowski@linaro.org, trix@redhat.com,
 radhey.shyam.pandey@xilinx.com, shravya.kumbham@xilinx.com,
 harini.katakam@xilinx.com, swati.agarwal@amd.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, ye.xingchen@zte.com.cn, quic_mojha@quicinc.com
References: <20221110152528.7821-1-tudor.ambarus@microchip.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20221110152528.7821-1-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_001404_489715_BAD8E7D4 
X-CRM114-Status: GOOD (  12.51  )
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



On 10/11/2022 17:25, Tudor Ambarus wrote:
> platform_get_resource() and devm_ioremap_resource() are wrapped up in the
> devm_platform_ioremap_resource() helper. Use the helper and get rid of the
> local variable for struct resource *. We now have a function call less.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
> v3:
> - fix errors reported-by lkp@intel.com
> - lkp@intel.com built successfully few configs, all should be good now.
> 
> v2:
> - rebase on dma/next. s3c24xx was removed, thus drop the changes for it.
> - collect Acked-by
> 
>   drivers/dma/bcm2835-dma.c                      |  4 +---
>   drivers/dma/dma-axi-dmac.c                     |  4 +---
>   drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  4 +---
>   drivers/dma/fsl-edma.c                         |  8 +++-----
>   drivers/dma/fsl-qdma.c                         | 10 +++-------
>   drivers/dma/idma64.c                           |  4 +---
>   drivers/dma/img-mdc-dma.c                      |  4 +---
>   drivers/dma/imx-dma.c                          |  4 +---
>   drivers/dma/imx-sdma.c                         |  4 +---
>   drivers/dma/mcf-edma.c                         |  5 +----
>   drivers/dma/mediatek/mtk-hsdma.c               |  4 +---
>   drivers/dma/mmp_pdma.c                         |  4 +---
>   drivers/dma/mmp_tdma.c                         |  4 +---
>   drivers/dma/moxart-dma.c                       |  4 +---
>   drivers/dma/mv_xor_v2.c                        |  7 ++-----
>   drivers/dma/mxs-dma.c                          |  4 +---
>   drivers/dma/nbpfaxi.c                          |  4 +---
>   drivers/dma/pxa_dma.c                          |  4 +---
>   drivers/dma/qcom/bam_dma.c                     |  4 +---
>   drivers/dma/sf-pdma/sf-pdma.c                  |  4 +---
>   drivers/dma/sh/usb-dmac.c                      |  4 +---
>   drivers/dma/stm32-dmamux.c                     |  4 +---
>   drivers/dma/stm32-mdma.c                       |  4 +---
>   drivers/dma/sun4i-dma.c                        |  4 +---
>   drivers/dma/sun6i-dma.c                        |  4 +---
>   drivers/dma/tegra210-adma.c                    |  4 +---
>   drivers/dma/ti/cppi41.c                        | 10 +++-------
>   drivers/dma/ti/omap-dma.c                      |  4 +---

For omap-dma:
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

>   drivers/dma/xilinx/zynqmp_dma.c                |  4 +---
>   29 files changed, 36 insertions(+), 100 deletions(-)
> -- 
Péter

