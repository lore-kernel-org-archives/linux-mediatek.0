Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381D6C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:24:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACDA760FEA
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 09:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACDA760FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rk/5BKXzH5M78C1nlTlq0F0gCM9KPs6Xn8WRwAM3DWA=; b=JXileaxjzYIAZ3EB9UMucsU8R
	Kl6FmbtZklBDLvq2E1RMC6B7d+JT8DQ0PuzH3SMLB/ONLqRSN25acflnbG2qKGXF873d2/bVCEUhU
	mTDyDtfoaxNQQv087Nxw4IBci+C98xpJPKgAlEN/fU0xjMrY0Y0xI7aio7k4MSLZ5lgqmfRNFkj0+
	zdDBNtZiqlOzC/3ys6YAr1HEbfr3yXX6GLvIxYgxAxs0j4JnA+Fqk8/8ZKiRcEkZj4ZaTfMYdnJOh
	6eRJDUgrdDDJdwKcaQwK/LtznorDBb0ckzo/LgWB02ygINnOWgBUMMQ1KYQCZ96mxjTLSVb+hjmjD
	QUOn4TMFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRtZ9-0092Ld-4n; Thu, 01 Apr 2021 09:24:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRtZ1-0092JG-9c; Thu, 01 Apr 2021 09:24:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id v11so1082233wro.7;
 Thu, 01 Apr 2021 02:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QOZ406BEEbEWHKFv25vOlBMps7sISsv3QFK8sS1MwtA=;
 b=SWab0PZ7BrG7ikUp/9BfwfF65yALwYpjPDfYWda+cCXfJR8UIxbUA30Clh6LoSKHVx
 qp2BJ4aXaiyYw5IhnZJRGrt0OqFJ79M8GEKybnzBLjwTNDwjgF04Z1Nxp+R8b5r24yvv
 hr3HMXaR0L29Ok2nRkRdD9vC/8Ek/07WsG14e95CrGFthD7V8OdD3GGsU+//2CW4B1vG
 qsZs9jKpKm99reBy4uCkCtjeoJOS7p7c5RiwJyn3mDNobGyPikADdAU4JEy5Xj7AtVCU
 64qLTbqH4DY1QJgnb5sDmU1DSzngtMlXbHwBhWSh0WWDHCTw3+qaUiPne1I5sOwU0a86
 aV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QOZ406BEEbEWHKFv25vOlBMps7sISsv3QFK8sS1MwtA=;
 b=nIML1v1yngC5J+qg2UX6zyXT2cLoGWT/QRxFnYFvCPkkWgDte+29I0T+VVWzbLPvMR
 AIi9IcwbkVZX/D71mDgznrWMpzHhq/tI3hH1YMeWywwqKcNHvCrJYtepQe+kqYHchHk9
 VnKgcNQe+95QbTCSMqDJgX9njMCaKhG84LPO2VwjEiTIna0RE56rCqEicVLitGfdaqPz
 l6mP2j/hvahH99Wq944cKLZH1LDd2/lhkhLJ7vBpMPsQhYI9v4TMZ3NRGPLMYVwuLWyz
 V+VWqYenNkdWoVEsCLaULNdhRl/ETtzb6+GE56k9N/s7stwSTaNcVzFM5L+ej+okL6MM
 uChA==
X-Gm-Message-State: AOAM531EixLDZ+o9OqSb61tfsNR2aPqbOPr3SPuiUiDrJRLxUJud8D9Q
 XB0fJfdKuYDcQgFL1Pyv6/A=
X-Google-Smtp-Source: ABdhPJxF7BHzMuUefc6Ht1IZf5VWDYA0aKA8LyX3aVJq/Cl/cTdsqEvTdPzMz3hnFIGM1PNtysKvFA==
X-Received: by 2002:adf:f851:: with SMTP id d17mr8396821wrq.267.1617269070552; 
 Thu, 01 Apr 2021 02:24:30 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id s9sm8153450wmh.31.2021.04.01.02.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 02:24:29 -0700 (PDT)
Subject: Re: [PATCH v10 2/4] soc: mediatek: add MT6765 scpsys and subdomain
 support
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Wendell Lin <Wendell.Lin@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Mars Cheng <mars.cheng@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
 Owen Chen <owen.chen@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Yong.Wu@mediatek.com, Joerg Roedel <jroedel@suse.de>,
 Shawn Guo <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>,
 Ryder Lee <Ryder.Lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, CC Hwang <cc.hwang@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>
References: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-3-git-send-email-macpaul.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <da80f06b-31d6-b728-43ab-e543f3f6d038@gmail.com>
Date: Thu, 1 Apr 2021 11:24:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1615358218-6540-3-git-send-email-macpaul.lin@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_102431_467594_C96BC0C8 
X-CRM114-Status: GOOD (  21.97  )
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

Hi Macpaul,

On 10/03/2021 07:36, Macpaul Lin wrote:
> From: Mars Cheng <mars.cheng@mediatek.com>
> 
> This adds scpsys support for MT6765
> Add subdomain support for MT6765:
> isp, mm, connsys, mfg, and cam.
> 
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-scpsys.c | 91 +++++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c

the mtk-scpsys is the old version of the driver. Please port your code to the
new driver: mtk-pm-domains.c

The biggest difference for you will be to describe the power domain hierarchy in
DT instead as in the driver.

Regards,
Matthias

> index ca75b14931ec..fc8d3858f1b4 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -15,6 +15,7 @@
>  
>  #include <dt-bindings/power/mt2701-power.h>
>  #include <dt-bindings/power/mt2712-power.h>
> +#include <dt-bindings/power/mt6765-power.h>
>  #include <dt-bindings/power/mt6797-power.h>
>  #include <dt-bindings/power/mt7622-power.h>
>  #include <dt-bindings/power/mt7623a-power.h>
> @@ -750,6 +751,81 @@ static const struct scp_subdomain scp_subdomain_mt2712[] = {
>  	{MT2712_POWER_DOMAIN_MFG_SC2, MT2712_POWER_DOMAIN_MFG_SC3},
>  };
>  
> +/*
> + * MT6765 power domain support
> + */
> +#define SPM_PWR_STATUS_MT6765			0x0180
> +#define SPM_PWR_STATUS_2ND_MT6765		0x0184
> +
> +static const struct scp_domain_data scp_domain_data_mt6765[] = {
> +	[MT6765_POWER_DOMAIN_VCODEC] = {
> +		.name = "vcodec",
> +		.sta_mask = BIT(26),
> +		.ctl_offs = 0x300,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +	},
> +	[MT6765_POWER_DOMAIN_ISP] = {
> +		.name = "isp",
> +		.sta_mask = BIT(5),
> +		.ctl_offs = 0x308,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +	},
> +	[MT6765_POWER_DOMAIN_MM] = {
> +		.name = "mm",
> +		.sta_mask = BIT(3),
> +		.ctl_offs = 0x30C,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.clk_id = {CLK_MM},
> +	},
> +	[MT6765_POWER_DOMAIN_CONN] = {
> +		.name = "conn",
> +		.sta_mask = BIT(1),
> +		.ctl_offs = 0x32C,
> +		.sram_pdn_bits = 0,
> +		.sram_pdn_ack_bits = 0,
> +	},
> +	[MT6765_POWER_DOMAIN_MFG_ASYNC] = {
> +		.name = "mfg_async",
> +		.sta_mask = BIT(23),
> +		.ctl_offs = 0x334,
> +		.sram_pdn_bits = 0,
> +		.sram_pdn_ack_bits = 0,
> +		.clk_id = {CLK_MFG},
> +	},
> +	[MT6765_POWER_DOMAIN_MFG] = {
> +		.name = "mfg",
> +		.sta_mask = BIT(4),
> +		.ctl_offs = 0x338,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +	},
> +	[MT6765_POWER_DOMAIN_CAM] = {
> +		.name = "cam",
> +		.sta_mask = BIT(25),
> +		.ctl_offs = 0x344,
> +		.sram_pdn_bits = GENMASK(9, 8),
> +		.sram_pdn_ack_bits = GENMASK(13, 12),
> +	},
> +	[MT6765_POWER_DOMAIN_MFG_CORE0] = {
> +		.name = "mfg_core0",
> +		.sta_mask = BIT(7),
> +		.ctl_offs = 0x34C,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +	},
> +};
> +
> +static const struct scp_subdomain scp_subdomain_mt6765[] = {
> +	{MT6765_POWER_DOMAIN_MM, MT6765_POWER_DOMAIN_CAM},
> +	{MT6765_POWER_DOMAIN_MM, MT6765_POWER_DOMAIN_ISP},
> +	{MT6765_POWER_DOMAIN_MM, MT6765_POWER_DOMAIN_VCODEC},
> +	{MT6765_POWER_DOMAIN_MFG_ASYNC, MT6765_POWER_DOMAIN_MFG},
> +	{MT6765_POWER_DOMAIN_MFG, MT6765_POWER_DOMAIN_MFG_CORE0},
> +};
> +
>  /*
>   * MT6797 power domain support
>   */
> @@ -1033,6 +1109,18 @@ static const struct scp_soc_data mt2712_data = {
>  	.bus_prot_reg_update = false,
>  };
>  
> +static const struct scp_soc_data mt6765_data = {
> +	.domains = scp_domain_data_mt6765,
> +	.num_domains = ARRAY_SIZE(scp_domain_data_mt6765),
> +	.subdomains = scp_subdomain_mt6765,
> +	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt6765),
> +	.regs = {
> +		.pwr_sta_offs = SPM_PWR_STATUS_MT6765,
> +		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6765,
> +	},
> +	.bus_prot_reg_update = true,
> +};
> +
>  static const struct scp_soc_data mt6797_data = {
>  	.domains = scp_domain_data_mt6797,
>  	.num_domains = ARRAY_SIZE(scp_domain_data_mt6797),
> @@ -1088,6 +1176,9 @@ static const struct of_device_id of_scpsys_match_tbl[] = {
>  	}, {
>  		.compatible = "mediatek,mt2712-scpsys",
>  		.data = &mt2712_data,
> +	}, {
> +		.compatible = "mediatek,mt6765-scpsys",
> +		.data = &mt6765_data,
>  	}, {
>  		.compatible = "mediatek,mt6797-scpsys",
>  		.data = &mt6797_data,
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
