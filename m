Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6402EC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 09:30:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 043C3206C9
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 09:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0GSZiEP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tcTDpc01"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 043C3206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RtYUnI2cxzW3J6DLyPqdYG0ZDHR81hXEsdpD/i4s9mg=; b=n0GSZiEPm9slH6vlc/2sIRolF
	TPlZB/9BrWfoIGdNAxPqW8aEI/Vhu9kpcR7DxDbARbJeADLgNbqiB+q2fExCXQxxPcFpz3PIw2FxB
	ZzuxfQ7l7jiHNRx8O3gFTcLwCWY0H3OUoHM9LJ38iLoaxfSpMyqtlNVEcXsPh39SBy7gCJPmayEpI
	xvY5FJZOxpY3aQQtHx79E5gMPm/J3YfTqkTYdK2rbAj0Xy5O2w6MiKpFkJ0rKE0V72rN/9aGbUTSx
	MDI83u5wlY5RM+G/+73Gv3MDVeNGExZg3+9jV7Ekj8bvUjoZVnDnXSl5cNiAjzWekhdMobRCcDn77
	g/n5p8crA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI7IM-0007dO-6J; Tue, 15 Sep 2020 09:30:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI7IJ-0007bx-Hw; Tue, 15 Sep 2020 09:30:36 +0000
Received: by mail-wm1-x344.google.com with SMTP id s13so2643823wmh.4;
 Tue, 15 Sep 2020 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6m9hGzpScNpe0b56EBK2dWXWtQbNdPaZy32XpIfUzGI=;
 b=tcTDpc01riv8x8bw9x6N+eXB9D0KSc8hBff90p2TcIddrEXpagnvQwoOfHIiq2QEZe
 4/XbDryeHTGZmotZzpbphwEpZXdn+HaPgtHeP6jyGcEBjuQyGqGgNwQ9ZJDxt85KjCLy
 o4z236CGZfSaN6XwGWaUtvbe+8zMnoEgnegftz69F3rMtBGyqa8ZsqirnPtfnaJwE5ff
 AkyM8GXqOTJPS09pSdKAwzkzMQ1zNqx67y//6IF5EC7cU8P2UJJ11fI00GF+ULwVCT79
 9pidFOHnR9a0poTLnJzd4FjIlTey6nOuD3xXPFtK/rjc94UqwQLVKkGRvwuztD90ItPu
 5Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6m9hGzpScNpe0b56EBK2dWXWtQbNdPaZy32XpIfUzGI=;
 b=N0aNHvU8CJ085PYlD0plQTdWWsHcUVH6fXj/WnpxXb+0Td84Shyd4DnZlgWmRr6atF
 dAZs9cbhzvAWW0CHeOP0vh/gizvwGGo/2G17uSGrFjIgLntVi6nua91NV5z5yCwWOJ2v
 jt6drgReU6aKwikM38KHEXSCCd1sKmIydTdrPftrfJftkGx6zhRgdhvqMSaXokoSdxCz
 1xH7K9uvtZZawsWBdauxLLR64On61CoVK1rWFPUx19I0OI47ppHmcfm/aT1hrfjy1W5Q
 bfWgF7i4deP/6BKAdcUBO4Uhqon457C6+FI/a+BZKWaN3bILUDp78RqH5iOTsPImF+Ei
 F5qA==
X-Gm-Message-State: AOAM532/dD+kOSkfmoyzcLN39rcsPe+01R2LM5lK4VKXYRPjnzv931IE
 xjO8xKQtuwVL4G3hk4WLgmU=
X-Google-Smtp-Source: ABdhPJzwyWXM3j+1zKJzsaZddm6XEeqWVpwu4h1mo5BPsGyBZnXitccFClJ0eyb6nO5CQ99v3t3EEQ==
X-Received: by 2002:a1c:818f:: with SMTP id c137mr1724589wmd.0.1600162232889; 
 Tue, 15 Sep 2020 02:30:32 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id l18sm19934057wrp.84.2020.09.15.02.30.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2020 02:30:32 -0700 (PDT)
Subject: Re: [PATCH 2/2] soc: mediatek: add SCPSYS power dmain for MT8167 SoC
To: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20200906172337.1052933-1-fparent@baylibre.com>
 <20200906172337.1052933-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e0819b9c-4dfd-a36e-3ead-4a375fb244d0@gmail.com>
Date: Tue, 15 Sep 2020 11:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200906172337.1052933-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_053035_649662_6DE2F68D 
X-CRM114-Status: GOOD (  23.66  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ulf.hansson@linaro.org, krzk@kernel.org, robh+dt@kernel.org,
 mars.cheng@mediatek.com, macpaul.lin@mediatek.com,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, owen.chen@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Fabien,

On 06/09/2020 19:23, Fabien Parent wrote:
> Add SCPSYS power domain support for MT8167 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

First of all, thanks for your patch!

The actual scpsys driver has some limitations. Enric and I are working on a new 
driver [1]. My idea is to deprecate the old scpsys driver in favor of this new one.

Would you mind to resend your series on top of [1]? From what I can see the 
changes in the driver will be minimal (change the bus protection macros and drop 
the clock ID). The DTS (which is not part of this series) would need some more 
work then.

Regards,
Matthias

[1] 
https://lore.kernel.org/linux-mediatek/20200910172826.3074357-1-enric.balletbo@collabora.com/T/#t

> ---
>   drivers/soc/mediatek/mtk-scpsys.c     | 99 +++++++++++++++++++++++++++
>   include/linux/soc/mediatek/infracfg.h |  8 +++
>   2 files changed, 107 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index f669d3754627..ce897720ef17 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -18,6 +18,7 @@
>   #include <dt-bindings/power/mt6797-power.h>
>   #include <dt-bindings/power/mt7622-power.h>
>   #include <dt-bindings/power/mt7623a-power.h>
> +#include <dt-bindings/power/mt8167-power.h>
>   #include <dt-bindings/power/mt8173-power.h>
>   
>   #define MTK_POLL_DELAY_US   10
> @@ -89,6 +90,7 @@ enum clk_id {
>   	CLK_HIFSEL,
>   	CLK_JPGDEC,
>   	CLK_AUDIO,
> +	CLK_AXI_MFG,
>   	CLK_MAX,
>   };
>   
> @@ -103,6 +105,7 @@ static const char * const clk_names[] = {
>   	"hif_sel",
>   	"jpgdec",
>   	"audio",
> +	"axi_mfg",
>   	NULL,
>   };
>   
> @@ -911,6 +914,87 @@ static const struct scp_domain_data scp_domain_data_mt7623a[] = {
>   	},
>   };
>   
> +/*
> + * MT8167 power domain support
> + */
> +#define PWR_STATUS_MFG_2D_MT8167	BIT(24)
> +#define PWR_STATUS_MFG_ASYNC_MT8167	BIT(25)
> +
> +static const struct scp_domain_data scp_domain_data_mt8167[] = {
> +	[MT8167_POWER_DOMAIN_DISP] = {
> +		.name = "disp",
> +		.sta_mask = PWR_STATUS_DISP,
> +		.ctl_offs = SPM_DIS_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bus_prot_mask = MT8167_TOP_AXI_PROT_EN_MM_EMI |
> +				 MT8167_TOP_AXI_PROT_EN_MCU_MM,
> +		.clk_id = {CLK_MM},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8167_POWER_DOMAIN_VDEC] = {
> +		.name = "vdec",
> +		.sta_mask = PWR_STATUS_VDEC,
> +		.ctl_offs = SPM_VDE_PWR_CON,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.clk_id = {CLK_MM, CLK_VDEC},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8167_POWER_DOMAIN_ISP] = {
> +		.name = "isp",
> +		.sta_mask = PWR_STATUS_ISP,
> +		.ctl_offs = SPM_ISP_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.sram_pdn_ack_bits = GENMASK(13, 12),
> +		.clk_id = {CLK_MM},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8167_POWER_DOMAIN_MFG_ASYNC] = {
> +		.name = "mfg_async",
> +		.sta_mask = PWR_STATUS_MFG_ASYNC_MT8167,
> +		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
> +		.sram_pdn_bits = 0,
> +		.sram_pdn_ack_bits = 0,
> +		.bus_prot_mask = MT8167_TOP_AXI_PROT_EN_MCU_MFG |
> +				 MT8167_TOP_AXI_PROT_EN_MFG_EMI,
> +		.clk_id = {CLK_MFG, CLK_AXI_MFG},
> +	},
> +	[MT8167_POWER_DOMAIN_MFG_2D] = {
> +		.name = "mfg_2d",
> +		.sta_mask = PWR_STATUS_MFG_2D_MT8167,
> +		.ctl_offs = SPM_MFG_2D_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.sram_pdn_ack_bits = GENMASK(15, 12),
> +		.clk_id = {CLK_NONE},
> +	},
> +	[MT8167_POWER_DOMAIN_MFG] = {
> +		.name = "mfg",
> +		.sta_mask = PWR_STATUS_MFG,
> +		.ctl_offs = SPM_MFG_PWR_CON,
> +		.sram_pdn_bits = GENMASK(11, 8),
> +		.sram_pdn_ack_bits = GENMASK(15, 12),
> +		.clk_id = {CLK_NONE},
> +	},
> +	[MT8167_POWER_DOMAIN_CONN] = {
> +		.name = "conn",
> +		.sta_mask = PWR_STATUS_CONN,
> +		.ctl_offs = SPM_CONN_PWR_CON,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = 0,
> +		.bus_prot_mask = MT8167_TOP_AXI_PROT_EN_CONN_EMI |
> +				 MT8167_TOP_AXI_PROT_EN_CONN_MCU |
> +				 MT8167_TOP_AXI_PROT_EN_MCU_CONN,
> +		.clk_id = {CLK_NONE},
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +};
> +
> +static const struct scp_subdomain scp_subdomain_mt8167[] = {
> +	{MT8167_POWER_DOMAIN_MFG_ASYNC, MT8167_POWER_DOMAIN_MFG_2D},
> +	{MT8167_POWER_DOMAIN_MFG_2D, MT8167_POWER_DOMAIN_MFG},
> +};
> +
>   /*
>    * MT8173 power domain support
>    */
> @@ -1064,6 +1148,18 @@ static const struct scp_soc_data mt7623a_data = {
>   	.bus_prot_reg_update = true,
>   };
>   
> +static const struct scp_soc_data mt8167_data = {
> +	.domains = scp_domain_data_mt8167,
> +	.num_domains = ARRAY_SIZE(scp_domain_data_mt8167),
> +	.subdomains = scp_subdomain_mt8167,
> +	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8167),
> +	.regs = {
> +		.pwr_sta_offs = SPM_PWR_STATUS,
> +		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
> +	},
> +	.bus_prot_reg_update = true,
> +};
> +
>   static const struct scp_soc_data mt8173_data = {
>   	.domains = scp_domain_data_mt8173,
>   	.num_domains = ARRAY_SIZE(scp_domain_data_mt8173),
> @@ -1096,6 +1192,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
>   	}, {
>   		.compatible = "mediatek,mt7623a-scpsys",
>   		.data = &mt7623a_data,
> +	}, {
> +		.compatible = "mediatek,mt8167-scpsys",
> +		.data = &mt8167_data,
>   	}, {
>   		.compatible = "mediatek,mt8173-scpsys",
>   		.data = &mt8173_data,
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index fd25f0148566..6ee49bf90acf 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -2,6 +2,14 @@
>   #ifndef __SOC_MEDIATEK_INFRACFG_H
>   #define __SOC_MEDIATEK_INFRACFG_H
>   
> +#define MT8167_TOP_AXI_PROT_EN_MM_EMI		BIT(1)
> +#define MT8167_TOP_AXI_PROT_EN_MCU_MFG		BIT(2)
> +#define MT8167_TOP_AXI_PROT_EN_CONN_EMI		BIT(4)
> +#define MT8167_TOP_AXI_PROT_EN_MFG_EMI		BIT(5)
> +#define MT8167_TOP_AXI_PROT_EN_CONN_MCU		BIT(8)
> +#define MT8167_TOP_AXI_PROT_EN_MCU_CONN		BIT(9)
> +#define MT8167_TOP_AXI_PROT_EN_MCU_MM		BIT(11)
> +
>   #define MT8173_TOP_AXI_PROT_EN_MCI_M2		BIT(0)
>   #define MT8173_TOP_AXI_PROT_EN_MM_M0		BIT(1)
>   #define MT8173_TOP_AXI_PROT_EN_MM_M1		BIT(2)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
