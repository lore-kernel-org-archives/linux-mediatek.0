Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91801C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A4C561029
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 17:09:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A4C561029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=msavcNvi/zSm81yt0/jLSZiB2hNpp8ivHYyRNo/UKWc=; b=1ePpvv4NtwvoD8q0MBAflH53XG
	W6jP1uRJ2aeOWU8tCYr3+6J049NySiiujdnKn0n1+rNhH28x6HGdEIFF/c7e5x0Gk+rtY649xSxoM
	Tmdvy7naZ1MlLtN6hCKU5VDXcxL1EvpYaqz9PoP0oUaltwlI4FtfLP7HlS7ofUsqp0n6tBoHT6Mq5
	GFehaPifmeOC/d3SxdgmS2Lfn/6qTgThTF7Prlp+hD0E//UvL0MSw6OUOu1dXOBdxVOHOmBWcsese
	dyv77ViSfyhtM8mFDqP8/RHmdiJQUWNDBnuCYbE+5YOoqLZLAvxxbhnVtlcTmIRe3IIT3rIV+3WpO
	FlA9RdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBKNx-006sG5-H2; Wed, 04 Aug 2021 17:08:53 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBKNv-006sFL-3E; Wed, 04 Aug 2021 17:08:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 n12-20020a05600c3b8cb029025a67bbd40aso4426812wms.0; 
 Wed, 04 Aug 2021 10:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/eXGTMv90CrY+h6kFPapkl2kvVM9xop2+wNswN+X3CQ=;
 b=dnQFEvCjJrFdVRUPB6Pm3vM1P5voe5NcznpNN9giJk0vDGKbK76jzHfsKvJMTm4xVE
 tb1DsJjJCx+FFtOQBtCIiIETpvXsiAq2vIFKLpuH7e7VOXi2lHXQ1kWeweXCSU5J4kye
 XW5BZW+bMGJ/KDhNKXe7VbuW6DkXmLSpvjHwS1QqeAXCI65uGNSvqNOdbI0TuX2r+0py
 0kNi6lj4td4yhFetYHfRA4F/EE1FKLszsClRkWcsYtxGa86xuIYXLNVMax0KmpAMeQH9
 WhSNul7Uy1xHq846nmY07e8u9PbfaookHRyl2wPHBh4+5ldvPYOFH/CSOiwFKGfIu001
 o3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/eXGTMv90CrY+h6kFPapkl2kvVM9xop2+wNswN+X3CQ=;
 b=Iw+qU+B1yfTUJI8/paNqh4VonemZ4RAyPCzE1jYFIUrGiII4wwRn3Nh5oraqVR0s8R
 MKeHpg2Lwjbowkz5wF0qnNXJzhWHYyimvg8WhYBZbbxDIam+CKjJNYH48UBLR7psIQjL
 GkDg5D+ZmeieNHMtDvUh8Z69M9JLyvKhzDdylKs3E7Dmt+1d27o5Nrqx/ttnpsOPTGYT
 YkkXLUOPAkZZoEBmCSpKcTDw5p67NmlvZGnMtxM6TK5cen73Bmr5P8Me4eA1CKZO9fwj
 k75imaDpnoAGtjRAb77aTVUp2UrtpZWjXyFkqctsEGwS9rFtp+rINQui08mICybnkmQ8
 IZmA==
X-Gm-Message-State: AOAM533IG8Hfd66+bIBI1bxazipgcpZAUBVtx/Gc8/kR9kfLoPnJDbpy
 gHyelwrbqr8JPhaykFeoAW/u/VO/AX18fw==
X-Google-Smtp-Source: ABdhPJyxEuNfD/DLY+3wo/r8+jwHbpOXBbsmEXEG3V6EbhJx0t1Gb9nR3pOGg1+CC2pMWCHojxlmkA==
X-Received: by 2002:a1c:f405:: with SMTP id z5mr10748720wma.33.1628096929356; 
 Wed, 04 Aug 2021 10:08:49 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id f194sm6631026wmf.23.2021.08.04.10.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 10:08:48 -0700 (PDT)
Subject: Re: [PATCH 3/3] soc: mediatek: mmsys: add MT8365 support
To: Fabien Parent <fparent@baylibre.com>
Cc: mkorpershoek@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20210519161847.3747352-1-fparent@baylibre.com>
 <20210519161847.3747352-3-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d8c0e3c6-c7bf-251a-cdb9-7ca35d1dae13@gmail.com>
Date: Wed, 4 Aug 2021 19:08:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210519161847.3747352-3-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_100851_208576_D5C355DC 
X-CRM114-Status: GOOD (  21.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fabien,

On 19/05/2021 18:18, Fabien Parent wrote:
> Add DSI mmsys connections for the MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/soc/mediatek/mt8365-mmsys.h | 60 +++++++++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-mmsys.c    | 11 ++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 drivers/soc/mediatek/mt8365-mmsys.h
> 
> diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
> new file mode 100644
> index 000000000000..2475aeb79791
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8365-mmsys.h
> @@ -0,0 +1,60 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8365_MMSYS_H
> +#define __SOC_MEDIATEK_MT8365_MMSYS_H
> +
> +#define MT8365_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0xf3c
> +#define MT8365_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL	0xf4c
> +#define MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN	0xf50
> +#define MT8365_DISP_REG_CONFIG_DISP_RDMA0_SEL_IN	0xf54
> +#define MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN	0xf60
> +#define MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0xf64
> +#define MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN		0xf68
> +
> +#define MT8365_RDMA0_SOUT_COLOR0			0x1
> +#define MT8365_DITHER_MOUT_EN_DSI0			0x1
> +#define MT8365_DSI0_SEL_IN_DITHER			0x1
> +#define MT8365_RDMA0_SEL_IN_OVL0			0x0
> +#define MT8365_RDMA0_RSZ0_SEL_IN_RDMA0			0x0
> +#define MT8365_DISP_COLOR_SEL_IN_COLOR0			0x0
> +#define MT8365_OVL0_MOUT_PATH0_SEL			BIT(0)
> +
> +static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8365_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
> +		MT8365_OVL0_MOUT_PATH0_SEL

I pushed this patch to v4.15-next/soc
As we now include the mask field in mtk_mmsys_routes I updated that in the patch.
Please let me know if I screwed something up.

Regards,
Matthias

> +	},
> +	{
> +		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
> +		MT8365_DISP_REG_CONFIG_DISP_RDMA0_SEL_IN,
> +		MT8365_RDMA0_SEL_IN_OVL0
> +	},
> +	{
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +		MT8365_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL,
> +		MT8365_RDMA0_SOUT_COLOR0
> +	},
> +	{
> +		DDP_COMPONENT_COLOR0, DDP_COMPONENT_CCORR,
> +		MT8365_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
> +		MT8365_DISP_COLOR_SEL_IN_COLOR0
> +	},
> +	{
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN,
> +		MT8365_DITHER_MOUT_EN_DSI0
> +	},
> +	{
> +		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
> +		MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
> +		MT8365_DSI0_SEL_IN_DITHER
> +	},
> +	{
> +		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
> +		MT8365_DISP_REG_CONFIG_DISP_RDMA0_RSZ0_SEL_IN,
> +		MT8365_RDMA0_RSZ0_SEL_IN_RDMA0
> +	},
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8365_MMSYS_H */
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 080660ef11bf..44aff822d035 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -13,6 +13,7 @@
>  #include "mtk-mmsys.h"
>  #include "mt8167-mmsys.h"
>  #include "mt8183-mmsys.h"
> +#include "mt8365-mmsys.h"
>  
>  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
>  	.clk_driver = "clk-mt2701-mm",
> @@ -52,6 +53,12 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
>  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
>  };
>  
> +static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
> +	.clk_driver = "clk-mt8365-mm",
> +	.routes = mt8365_mmsys_routing_table,
> +	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
> +};
> +
>  struct mtk_mmsys {
>  	void __iomem *regs;
>  	const struct mtk_mmsys_driver_data *data;
> @@ -157,6 +164,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>  		.compatible = "mediatek,mt8183-mmsys",
>  		.data = &mt8183_mmsys_driver_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt8365-mmsys",
> +		.data = &mt8365_mmsys_driver_data,
> +	},
>  	{ }
>  };
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
