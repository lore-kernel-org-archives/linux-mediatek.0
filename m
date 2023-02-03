Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4313C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLaxgQn4PDQR/BBQv1tOCk5Bm8wuAo+A0Cee8gtPIcQ=; b=QYvcSAaCgvevjzjmlKIbsMTwYu
	Ov9HeLO+GWo+XyihCaJ/gw6V8EmoqYubZSvUACsbGTeMTxudHGrnydXGDB3w0fD2IlylsiqtxLrfL
	RAFTc4JOcePAziD5VdyOCwvfJlLBQ0iWAKWca0a2sYS9jy8zDCvvexeyhpaegVGqTcvTgP9ta91YE
	w7Sr/B0n16YCXS9SqYp2T8E9szZxUzYUmjovJaNYziN2jtTp9aGhXgf7Wr3/K9h9E/vDHB15yfqM9
	VXDCvxqyAlV0lhA9GZaDLSuVi57SrhswWzWehzOg6RkM0DA4/Fh5MF/FR96kNCMk2CQaIFv3qjhIz
	W3Wo9Cfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNv5w-001kzm-6q; Fri, 03 Feb 2023 12:23:08 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNv5d-001kpa-9Q; Fri, 03 Feb 2023 12:22:51 +0000
Received: by mail-ej1-x630.google.com with SMTP id dr8so14764819ejc.12;
        Fri, 03 Feb 2023 04:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLaxgQn4PDQR/BBQv1tOCk5Bm8wuAo+A0Cee8gtPIcQ=;
        b=VijK74znB3lxm3Wv08hx0cuv+NIYaGn3TPvhVevaFEV2UQtYVSYb9HSYSvskP3KfCI
         El2d9U9ULRqBD3Mh5XzSU3q33qWmd21R4kLh9MA2WyXcK8k1gmP5+P2mAqbAOOCEfD3K
         UEa/LSXYKATqL8mZnTpfErUegR6HW+/DRgHkQFKmzBLe2sdBordDLbd4JxQSwk2CWuyL
         xGE539G9hlhKENCMYDxAo4Oc8nUsHErN5WKyqb8O/ymi6ifUHfFb64E8ad2lKC/hFwCt
         9fz6ELcOM2CZog2+7k3ZBVlr3Vk8VBmM47v4cmZUoQtu4kxBq5Lhh9iBEylpW7aT8HdO
         7vcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLaxgQn4PDQR/BBQv1tOCk5Bm8wuAo+A0Cee8gtPIcQ=;
        b=NFUR50J3mHxYJuQeb2eWNRJw0Z0n9RwoNMrlCY+LA4o2twfH7vtCBqWAJFho8rkGCV
         uJNjLk7kFV+ztB5bun7oqpV0451vNo26FeZBBJylEy0dDMi15O6FTnvLvUMI9Qxeu4KK
         fVLrhtuFw/Z4c6JpcNX8hkoRPL4xRdY84KKtb9icbg7EuTQgXY1bsIjGl/JVmpQoj+ms
         raGyy4ubcROUmoTVR+AzM4N+z7KJlDWUBulV8fVQjQQrhI5DSwuyUfqtxyQwKIiCFopP
         dPah44iQ+cdOgZvY9aoThbntUuE6CEV+1hQtTxNUbRydouQvCiRIaTKk7nmZ/xk6qztY
         MuBg==
X-Gm-Message-State: AO0yUKVYTqB6Mh+y9ZDAXZNqzAsTe+28zBgeiYB6PfUjx6YYJsFGNj93
	dEOv05lpiOnyXWVGS/fI4xk=
X-Google-Smtp-Source: AK7set+sDJHmNk3XugDdse9cEEkhtdXQabV8pJSIDsS2BdE79nt9eyvROC5qWXu1RZ+JtWpv29jNdw==
X-Received: by 2002:a17:906:88a:b0:86f:1227:7a48 with SMTP id n10-20020a170906088a00b0086f12277a48mr9768860eje.17.1675426960400;
        Fri, 03 Feb 2023 04:22:40 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id ca10-20020a170906a3ca00b0084d34eec68esm1289828ejb.213.2023.02.03.04.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 04:22:39 -0800 (PST)
Message-ID: <07a16be1-3f96-374c-3a9b-e3920bb4b437@gmail.com>
Date: Fri, 3 Feb 2023 13:22:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
 <20230105170735.1637416-9-msp@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 8/8] soc: mediatek: pm-domains: Add support for MT8365
In-Reply-To: <20230105170735.1637416-9-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_042249_410484_0323DF99 
X-CRM114-Status: GOOD (  20.33  )
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



On 05/01/2023 18:07, Markus Schneider-Pargmann wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add the needed board data to support MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>   drivers/soc/mediatek/mt8365-pm-domains.h | 147 +++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
>   2 files changed, 152 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8365-pm-domains.h
> 
> diff --git a/drivers/soc/mediatek/mt8365-pm-domains.h b/drivers/soc/mediatek/mt8365-pm-domains.h
> new file mode 100644
> index 000000000000..8735e833b15b
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8365-pm-domains.h
> @@ -0,0 +1,147 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
> +#define __SOC_MEDIATEK_MT8365_PM_DOMAINS_H
> +
> +#include "mtk-pm-domains.h"
> +#include <dt-bindings/power/mediatek,mt8365-power.h>
> +
> +/*
> + * MT8365 power domain support
> + */
> +
> +static const struct scpsys_domain_data scpsys_domain_data_mt8365[] = {
> +	[MT8365_POWER_DOMAIN_MM] = {
> +		.name = "mm",
> +		.sta_mask = PWR_STATUS_DISP,
> +		.ctl_offs = 0x30c,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_STRICT_BUS_PROTECTION | MTK_SCPD_HAS_WAY_EN,
> +		.bp_infracfg = {
> +			BUS_PROT_WR(BIT(16) | BIT(17), 0x2a8, 0x2ac, 0x258),
> +			BUS_PROT_WR(BIT(1) | BIT(2) | BIT(10) | BIT(11), 0x2a0, 0x2a4, 0x228),
> +			BUS_PROT_WAY_EN(BIT(6), 0x200, BIT(24), 0x0),
> +			BUS_PROT_WAY_EN(BIT(5), 0x234, BIT(14), 0x28),
> +			BUS_PROT_WR(BIT(6), 0x2a0, 0x2a4, 0x228),


BUS_PROT_WR(BIT(6), 0x2a0, 0x2a4, 0x228) repeates several times in the 
definition. Would it make sense to create a new define like we did with 
BUS_PROT_UPDATE_TOPAXI()? Are this offests are used in other SoCs.

In any case instead of magic numbers the values should be defined in 
include/linux/soc/mediatek/infracfg.h or appropiate header files.

Regards,
Matthias

> +		},
> +	},
> +	[MT8365_POWER_DOMAIN_VENC] = {
> +		.name = "venc",
> +		.sta_mask = PWR_STATUS_VENC,
> +		.ctl_offs = 0x0304,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_smi = {
> +			BUS_PROT_WR(BIT(1), 0x3c4, 0x3c8, 0x3c0),
> +		},
> +	},
> +	[MT8365_POWER_DOMAIN_AUDIO] = {
> +		.name = "audio",
> +		.sta_mask = PWR_STATUS_AUDIO,
> +		.ctl_offs = 0x0314,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(12, 8),
> +		.sram_pdn_ack_bits = GENMASK(17, 13),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(BIT(27) | BIT(28), 0x2a8, 0x2ac, 0x258),
> +		},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8365_POWER_DOMAIN_CONN] = {
> +		.name = "conn",
> +		.sta_mask = PWR_STATUS_CONN,
> +		.ctl_offs = 0x032c,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = 0,
> +		.sram_pdn_ack_bits = 0,
> +		.bp_infracfg = {
> +			BUS_PROT_WR(BIT(13), 0x2a0, 0x2a4, 0x228),
> +			BUS_PROT_WR(BIT(18), 0x2a8, 0x2ac, 0x258),
> +			BUS_PROT_WR(BIT(14), 0x2a0, 0x2a4, 0x228),
> +			BUS_PROT_WR(BIT(21), 0x2a8, 0x2ac, 0x258),
> +		},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP | MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8365_POWER_DOMAIN_MFG] = {
> +		.name = "mfg",
> +		.sta_mask = PWR_STATUS_MFG,
> +		.ctl_offs = 0x0338,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(9, 8),
> +		.sram_pdn_ack_bits = GENMASK(13, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(BIT(25), 0x2a0, 0x2a4, 0x228),
> +			BUS_PROT_WR(BIT(21) | BIT(22), 0x2a0, 0x2a4, 0x228),
> +		},
> +	},
> +	[MT8365_POWER_DOMAIN_CAM] = {
> +		.name = "cam",
> +		.sta_mask = BIT(25),
> +		.ctl_offs = 0x0344,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(9, 8),
> +		.sram_pdn_ack_bits = GENMASK(13, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(BIT(19), 0x2a8, 0x2ac, 0x258),
> +		},
> +		.bp_smi = {
> +			BUS_PROT_WR(BIT(2), 0x3c4, 0x3c8, 0x3c0),
> +		},
> +	},
> +	[MT8365_POWER_DOMAIN_VDEC] = {
> +		.name = "vdec",
> +		.sta_mask = BIT(31),
> +		.ctl_offs = 0x0370,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_smi = {
> +			BUS_PROT_WR(BIT(3), 0x3c4, 0x3c8, 0x3c0),
> +		},
> +	},
> +	[MT8365_POWER_DOMAIN_APU] = {
> +		.name = "apu",
> +		.sta_mask = BIT(16),
> +		.ctl_offs = 0x0378,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(14, 8),
> +		.sram_pdn_ack_bits = GENMASK(21, 15),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(BIT(2) | BIT(20), 0x2a8, 0x2ac, 0x258),
> +		},
> +		.bp_smi = {
> +			BUS_PROT_WR(BIT(4), 0x3c4, 0x3c8, 0x3c0),
> +		},
> +	},
> +	[MT8365_POWER_DOMAIN_DSP] = {
> +		.name = "dsp",
> +		.sta_mask = BIT(17),
> +		.ctl_offs = 0x037C,
> +		.pwr_sta_offs = 0x0180,
> +		.pwr_sta2nd_offs = 0x0184,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.sram_pdn_ack_bits = GENMASK(15, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(BIT(24) | BIT(30) | BIT(31), 0x2a8, 0x2ac, 0x258),
> +		},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +};
> +
> +static const struct scpsys_soc_data mt8365_scpsys_data = {
> +	.domains_data = scpsys_domain_data_mt8365,
> +	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8365),
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8365_PM_DOMAINS_H */
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 29a9028dd9b3..adb7716df0a8 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -23,6 +23,7 @@
>   #include "mt8186-pm-domains.h"
>   #include "mt8192-pm-domains.h"
>   #include "mt8195-pm-domains.h"
> +#include "mt8365-pm-domains.h"
>   
>   #define MTK_POLL_DELAY_US		10
>   #define MTK_POLL_TIMEOUT		USEC_PER_SEC
> @@ -647,6 +648,10 @@ static const struct of_device_id scpsys_of_match[] = {
>   		.compatible = "mediatek,mt8195-power-controller",
>   		.data = &mt8195_scpsys_data,
>   	},
> +	{
> +		.compatible = "mediatek,mt8365-power-controller",
> +		.data = &mt8365_scpsys_data,
> +	},
>   	{ }
>   };
>   

