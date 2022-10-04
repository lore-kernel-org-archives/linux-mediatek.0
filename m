Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D019C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hxm4yivb9qe6KW7yOrfl6atyfbUDIKEw+3XA3aeuBI=; b=k9rf5t4KxzoFGshv9SY3GdS2py
	QTjc/cmtccldvCbkurUCx5jiTnPgUONm1hG9UM40MfUxoqCmzQ0RqlBN13CvflxEHvnb81r034z6Y
	4MpSUqt3cP5V6A8GGE7zznfcZVJ/xqTGya/PqjEYc2Ge1jmY3kw0pYKSd74PH648DjagJTLzeEzXV
	bzN75mvy5rVMlA7s7um8Du91Q7W+NAT2qKxXy8lUHtbedqAKJ8e7GPGtjIKnAzE+b6BCMSSX0qYAU
	8g/HAJ8pQ7QuGom4RXG09wgFvX7QV/PqfUhwRvyb/flvuTRYmcZxHZORVNm8cMc7UuaEp9qcRvBrp
	uPIYxXSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofd9d-008uXu-MQ; Tue, 04 Oct 2022 08:19:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofd99-008uOF-1M; Tue, 04 Oct 2022 08:19:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0398B6602295;
	Tue,  4 Oct 2022 09:19:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664871559;
	bh=QJxxjCuyw9mSyhrTPrvViT+uaUXJUxU6qTaI7W99V08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=acJbREzg/WNoo1LXoZcqDdPTogLgcpvEkfp6EfmgiiWXh4s/g3HxP2OaPGPyWjAsS
	 6dkD2RwjhrZfgUXq/b+qhIbnOWufCbmdpmXDtDVWeEd/t34qg7o7ZDyuqe3VSdFXYO
	 PSn1/GQgFZg8ArNSVPYPRka1MlZ09G4cA9a5B1UtWYiiT+vzyddwsBwXWhndLAhcBu
	 +2Stqp8mDqPwVtwQJtoLxKhiKP1Jy6VyOIZ6AZw59C2tfzcY2Cl0aRkocrBNCIjNf1
	 Y/epfNikP5pdsdcT5VPhVHtICvoTAf3ivgGux472hWMYmWPPIokhajzhwa1t3Z19XF
	 KC4LlWRblLhnw==
Message-ID: <ca0f9e3c-ae3f-b886-bfe9-63d7e45c9b3c@collabora.com>
Date: Tue, 4 Oct 2022 10:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/2] soc: mediatek: pm-domains: Add support for mt8188
Content-Language: en-US
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220928084315.29187-1-Garmin.Chang@mediatek.com>
 <20220928084315.29187-3-Garmin.Chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928084315.29187-3-Garmin.Chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_011932_305069_DD519A81 
X-CRM114-Status: GOOD (  17.90  )
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

Il 28/09/22 10:43, Garmin.Chang ha scritto:
> Add domain control data including bus protection data size
> change due to more protection steps in mt8188.
> 
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8188-pm-domains.h | 623 +++++++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
>   include/linux/soc/mediatek/infracfg.h    | 121 +++++
>   3 files changed, 749 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mt8188-pm-domains.h
> 
> diff --git a/drivers/soc/mediatek/mt8188-pm-domains.h b/drivers/soc/mediatek/mt8188-pm-domains.h
> new file mode 100644
> index 000000000000..63181f05457e
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8188-pm-domains.h
> @@ -0,0 +1,623 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Author: Garmin Chang <garmin.chang@mediatek.com>
> + */
> +
> +#ifndef __SOC_MEDIATEK_MT8188_PM_DOMAINS_H
> +#define __SOC_MEDIATEK_MT8188_PM_DOMAINS_H
> +
> +#include "mtk-pm-domains.h"
> +#include <dt-bindings/power/mediatek,mt8188-power.h>
> +
> +/*
> + * MT8188 power domain support
> + */
> +
> +static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
> +	[MT8188_POWER_DOMAIN_MFG0] = {
> +		.name = "mfg0",
> +		.sta_mask = BIT(1),
> +		.ctl_offs = 0x300,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
> +	},
> +	[MT8188_POWER_DOMAIN_MFG1] = {
> +		.name = "mfg1",
> +		.sta_mask = BIT(2),
> +		.ctl_offs = 0x304,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = BIT(8),
> +		.sram_pdn_ack_bits = BIT(12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MFG1_STEP1,
> +				    MT8188_TOP_AXI_PROT_EN_SET,
> +				    MT8188_TOP_AXI_PROT_EN_CLR,
> +				    MT8188_TOP_AXI_PROT_EN_STA),
> +			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_MFG1_STEP2,
> +				    MT8188_TOP_AXI_PROT_EN_2_SET,
> +				    MT8188_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8188_TOP_AXI_PROT_EN_2_STA),
> +			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_1_MFG1_STEP3,
> +				    MT8188_TOP_AXI_PROT_EN_1_SET,
> +				    MT8188_TOP_AXI_PROT_EN_1_CLR,
> +				    MT8188_TOP_AXI_PROT_EN_1_STA),
> +			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_MFG1_STEP4,
> +				    MT8188_TOP_AXI_PROT_EN_2_SET,
> +				    MT8188_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8188_TOP_AXI_PROT_EN_2_STA),
> +			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MFG1_STEP5,
> +				    MT8188_TOP_AXI_PROT_EN_SET,
> +				    MT8188_TOP_AXI_PROT_EN_CLR,
> +				    MT8188_TOP_AXI_PROT_EN_STA),
> +			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1_STEP6,
> +				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
> +				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
> +				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,

Please add MTK_SCPD_DOMAIN_SUPPLY cap to MFG1 as well.
For more information, please look at:
13bde169c6fe ("soc: mediatek: mtk-pm-domains: Allow probing vreg supply on two MFGs")

Regards,
Angelo


