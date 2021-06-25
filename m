Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,UPPERCASE_50_75,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BDEC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:07:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C70926142D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 10:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C70926142D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lLM79VPP6XyzjQtQqracJdQjzlUr496EspTpwMqR/Ko=; b=kSORpyfjRh0ZKTjdtPLuUAx/Fs
	clCv5okID/UoyCOtuqCkS7hbQUbALjopswuAUwkZOCvVoRB7N7yOsBXlVtN0QfeigR8K6qfM2wpKS
	bK/VmdzmJ8s3Na11HogoZK0EPsnY+P6TNSkA715c5MWoxjhn5X29tKxLJ0nEYBAyn9kQN9d85scVR
	s1hjBv4SHBN/7+p+VBY3Cp4Lr9+mojdLRt8gZJBpLOsXTMPrpM8rT72X7HIkrGIQTPjyfnGkTfRnk
	sKW1ASLkbWPQVi4h2XSSRMI38w06UsbrMPRbpEMEmhoj8qGRYSuHarX+eyk3SxLl09R0PRziMg/Fx
	XlVw7S/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwikJ-000r4z-QB; Fri, 25 Jun 2021 10:07:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwhoD-000Zp3-8I; Fri, 25 Jun 2021 09:07:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 384D01F444DB
Subject: Re: [RESEND PATCH v2 3/4] soc: mediatek: pm-domains: Add support for
 mt8195
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210616000659.28347-1-chun-jie.chen@mediatek.com>
 <20210616000659.28347-4-chun-jie.chen@mediatek.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <3c7695d9-f7aa-0cb0-871a-f53daee0362d@collabora.com>
Date: Fri, 25 Jun 2021 11:07:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210616000659.28347-4-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_020733_683305_DA1B23A1 
X-CRM114-Status: GOOD (  22.10  )
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

Hi Chun-Jie Chen,

Thank you for your patch.

On 16/6/21 2:06, Chun-Jie Chen wrote:
> Add domain control data including bus protection data size
> change due to more protection steps in mt8195 and wakeup flag
> in power domain for wakeup control in suspend.
> 

The wakeup flag is used for different SoCs apart from mt8195, isn't it? I'd add
this on a separate patch so it is not dependent on the mt8195 changes. This will
also make more clear that is not really a mt8195 thing and can help in case at
some point we need to run a bisection because something is broken on another SoC.

Thanks,
  Enric


> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mt8195-pm-domains.h | 738 +++++++++++++++++++++++
>  drivers/soc/mediatek/mtk-pm-domains.c    |   8 +
>  drivers/soc/mediatek/mtk-pm-domains.h    |   2 +-
>  include/linux/soc/mediatek/infracfg.h    | 103 ++++
>  4 files changed, 850 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
> 
> diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/soc/mediatek/mt8195-pm-domains.h
> new file mode 100644
> index 000000000000..54bb7af8e9a3
> --- /dev/null
> +++ b/drivers/soc/mediatek/mt8195-pm-domains.h
> @@ -0,0 +1,738 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> + */
> +
> +#ifndef __SOC_MEDIATEK_MT8195_PM_DOMAINS_H
> +#define __SOC_MEDIATEK_MT8195_PM_DOMAINS_H
> +
> +#include "mtk-pm-domains.h"
> +#include <dt-bindings/power/mt8195-power.h>
> +
> +/*
> + * MT8195 power domain support
> + */
> +
> +static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
> +	[MT8195_POWER_DOMAIN_PCIE_MAC_P0] = {
> +		.name = "pcie_mac_p0",
> +		.sta_mask = BIT(11),
> +		.ctl_offs = 0x328,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P0,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P0,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_PCIE_MAC_P1] = {
> +		.name = "pcie_mac_p1",
> +		.sta_mask = BIT(12),
> +		.ctl_offs = 0x32C,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P1,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P1,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_PCIE_PHY] = {
> +		.name = "pcie_phy",
> +		.sta_mask = BIT(13),
> +		.ctl_offs = 0x330,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY] = {
> +		.name = "ssusb_pcie_phy",
> +		.sta_mask = BIT(14),
> +		.ctl_offs = 0x334,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8195_POWER_DOMAIN_CSI_RX_TOP] = {
> +		.name = "csi_rx_top",
> +		.sta_mask = BIT(18),
> +		.ctl_offs = 0x3C4,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_ETHER] = {
> +		.name = "ether",
> +		.sta_mask = BIT(3),
> +		.ctl_offs = 0x344,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8195_POWER_DOMAIN_ADSP] = {
> +		.name = "adsp",
> +		.sta_mask = BIT(10),
> +		.ctl_offs = 0x360,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_ADSP,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +		},
> +		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8195_POWER_DOMAIN_AUDIO] = {
> +		.name = "audio",
> +		.sta_mask = BIT(8),
> +		.ctl_offs = 0x358,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_AUDIO,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_AUDIO_ASRC] = {
> +		.name = "audio_asrc",
> +		.sta_mask = BIT(9),
> +		.ctl_offs = 0x35C,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_AUDIO_ASRC,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_NNA] = {
> +		.name = "nna",
> +		.sta_mask = BIT(17),
> +		.ctl_offs = 0x3C0,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_NNA,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_NNA,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_NNA_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_NNA0] = {
> +		.name = "nna0",
> +		.sta_mask = BIT(15),
> +		.ctl_offs = 0x3B8,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_NNA0,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_NNA0,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_NNA0_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA0,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_NNA1] = {
> +		.name = "nna1",
> +		.sta_mask = BIT(16),
> +		.ctl_offs = 0x3BC,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_NNA1,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_NNA1,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_NNA1_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA1,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_MFG0] = {
> +		.name = "mfg0",
> +		.sta_mask = BIT(1),
> +		.ctl_offs = 0x300,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_MFG1] = {
> +		.name = "mfg1",
> +		.sta_mask = BIT(2),
> +		.ctl_offs = 0x304,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MFG1,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_MFG1,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_1_MFG1,
> +				    MT8195_TOP_AXI_PROT_EN_1_SET,
> +				    MT8195_TOP_AXI_PROT_EN_1_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_1_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_MFG1_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MFG1_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_MFG2] = {
> +		.name = "mfg2",
> +		.sta_mask = BIT(3),
> +		.ctl_offs = 0x308,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_MFG3] = {
> +		.name = "mfg3",
> +		.sta_mask = BIT(4),
> +		.ctl_offs = 0x30C,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_MFG4] = {
> +		.name = "mfg4",
> +		.sta_mask = BIT(5),
> +		.ctl_offs = 0x310,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_MFG5] = {
> +		.name = "mfg5",
> +		.sta_mask = BIT(6),
> +		.ctl_offs = 0x314,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_MFG6] = {
> +		.name = "mfg6",
> +		.sta_mask = BIT(7),
> +		.ctl_offs = 0x318,
> +		.pwr_sta_offs = 0x174,
> +		.pwr_sta2nd_offs = 0x178,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_VPPSYS0] = {
> +		.name = "vppsys0",
> +		.sta_mask = BIT(11),
> +		.ctl_offs = 0x364,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VPPSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR_IGN(MT8195_TOP_AXI_PROT_EN_MM_VPPSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR_IGN(MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VPPSYS0_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VPPSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_VDOSYS0] = {
> +		.name = "vdosys0",
> +		.sta_mask = BIT(13),
> +		.ctl_offs = 0x36C,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR_IGN(MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR_IGN(MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDOSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_SET,
> +				    MT8195_TOP_AXI_PROT_EN_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VDOSYS0,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_VPPSYS1] = {
> +		.name = "vppsys1",
> +		.sta_mask = BIT(12),
> +		.ctl_offs = 0x368,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS1,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_VDOSYS1] = {
> +		.name = "vdosys1",
> +		.sta_mask = BIT(14),
> +		.ctl_offs = 0x370,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS1,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_DP_TX] = {
> +		.name = "dp_tx",
> +		.sta_mask = BIT(16),
> +		.ctl_offs = 0x378,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_DP_TX,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_EPD_TX] = {
> +		.name = "epd_tx",
> +		.sta_mask = BIT(17),
> +		.ctl_offs = 0x37C,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_EPD_TX,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_HDMI_TX] = {
> +		.name = "hdmi_tx",
> +		.sta_mask = BIT(18),
> +		.ctl_offs = 0x380,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8195_POWER_DOMAIN_HDMI_RX] = {
> +		.name = "hdmi_rx",
> +		.sta_mask = BIT(19),
> +		.ctl_offs = 0x384,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
> +	},
> +	[MT8195_POWER_DOMAIN_WPESYS] = {
> +		.name = "wpesys",
> +		.sta_mask = BIT(15),
> +		.ctl_offs = 0x374,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_WPESYS,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +	},
> +	[MT8195_POWER_DOMAIN_VDEC0] = {
> +		.name = "vdec0",
> +		.sta_mask = BIT(20),
> +		.ctl_offs = 0x388,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC0,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC0_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_VDEC1] = {
> +		.name = "vdec1",
> +		.sta_mask = BIT(21),
> +		.ctl_offs = 0x38C,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC1,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC1_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_VDEC2] = {
> +		.name = "vdec2",
> +		.sta_mask = BIT(22),
> +		.ctl_offs = 0x390,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_VENC] = {
> +		.name = "venc",
> +		.sta_mask = BIT(23),
> +		.ctl_offs = 0x394,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VENC,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VENC_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VENC,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_VENC_CORE1] = {
> +		.name = "venc_core1",
> +		.sta_mask = BIT(24),
> +		.ctl_offs = 0x398,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VENC_CORE1,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VENC_CORE1,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_IMG] = {
> +		.name = "img",
> +		.sta_mask = BIT(29),
> +		.ctl_offs = 0x3AC,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_IMG,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_IMG_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_IMG,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_DIP] = {
> +		.name = "dip",
> +		.sta_mask = BIT(30),
> +		.ctl_offs = 0x3B0,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_IPE] = {
> +		.name = "ipe",
> +		.sta_mask = BIT(31),
> +		.ctl_offs = 0x3B4,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_IPE,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_IPE,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_CAM] = {
> +		.name = "cam",
> +		.sta_mask = BIT(25),
> +		.ctl_offs = 0x39C,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.bp_infracfg = {
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_CAM,
> +				    MT8195_TOP_AXI_PROT_EN_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_2_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_CAM,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_1_CAM,
> +				    MT8195_TOP_AXI_PROT_EN_1_SET,
> +				    MT8195_TOP_AXI_PROT_EN_1_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_1_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_CAM_2ND,
> +				    MT8195_TOP_AXI_PROT_EN_MM_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
> +			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_CAM,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
> +				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
> +		},
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_CAM_RAWA] = {
> +		.name = "cam_rawa",
> +		.sta_mask = BIT(26),
> +		.ctl_offs = 0x3A0,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_CAM_RAWB] = {
> +		.name = "cam_rawb",
> +		.sta_mask = BIT(27),
> +		.ctl_offs = 0x3A4,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +	[MT8195_POWER_DOMAIN_CAM_MRAW] = {
> +		.name = "cam_mraw",
> +		.sta_mask = BIT(28),
> +		.ctl_offs = 0x3A8,
> +		.pwr_sta_offs = 0x16c,
> +		.pwr_sta2nd_offs = 0x170,
> +		.sram_pdn_bits = GENMASK(8, 8),
> +		.sram_pdn_ack_bits = GENMASK(12, 12),
> +		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
> +	},
> +};
> +
> +static const struct scpsys_soc_data mt8195_scpsys_data = {
> +	.domains_data = scpsys_domain_data_mt8195,
> +	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8195),
> +};
> +
> +#endif /* __SOC_MEDIATEK_MT8195_PM_DOMAINS_H */
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index 2689f02d7a41..d705860b47a7 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -20,6 +20,7 @@
>  #include "mt8173-pm-domains.h"
>  #include "mt8183-pm-domains.h"
>  #include "mt8192-pm-domains.h"
> +#include "mt8195-pm-domains.h"
>  
>  #define MTK_POLL_DELAY_US		10
>  #define MTK_POLL_TIMEOUT		USEC_PER_SEC
> @@ -446,6 +447,9 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
>  	pd->genpd.power_off = scpsys_power_off;
>  	pd->genpd.power_on = scpsys_power_on;
>  
> +	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
> +		pd->genpd.flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> +
>  	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
>  		pm_genpd_init(&pd->genpd, NULL, true);
>  	else
> @@ -576,6 +580,10 @@ static const struct of_device_id scpsys_of_match[] = {
>  		.compatible = "mediatek,mt8192-power-controller",
>  		.data = &mt8192_scpsys_data,
>  	},
> +	{
> +		.compatible = "mediatek,mt8195-power-controller",
> +		.data = &mt8195_scpsys_data,
> +	},
>  	{ }
>  };
>  
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index 8b86ed22ca56..caaa38100093 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -37,7 +37,7 @@
>  #define PWR_STATUS_AUDIO		BIT(24)
>  #define PWR_STATUS_USB			BIT(25)
>  
> -#define SPM_MAX_BUS_PROT_DATA		5
> +#define SPM_MAX_BUS_PROT_DATA		6
>  
>  #define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
>  		.bus_prot_mask = (_mask),			\
> diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> index 4615a228da51..3e90fb9b926a 100644
> --- a/include/linux/soc/mediatek/infracfg.h
> +++ b/include/linux/soc/mediatek/infracfg.h
> @@ -2,6 +2,109 @@
>  #ifndef __SOC_MEDIATEK_INFRACFG_H
>  #define __SOC_MEDIATEK_INFRACFG_H
>  
> +#define MT8195_TOP_AXI_PROT_EN_STA1                     0x228
> +#define MT8195_TOP_AXI_PROT_EN_1_STA1                   0x258
> +#define MT8195_TOP_AXI_PROT_EN_SET			0x2a0
> +#define MT8195_TOP_AXI_PROT_EN_CLR                      0x2a4
> +#define MT8195_TOP_AXI_PROT_EN_1_SET                    0x2a8
> +#define MT8195_TOP_AXI_PROT_EN_1_CLR                    0x2ac
> +#define MT8195_TOP_AXI_PROT_EN_MM_SET                   0x2d4
> +#define MT8195_TOP_AXI_PROT_EN_MM_CLR                   0x2d8
> +#define MT8195_TOP_AXI_PROT_EN_MM_STA1                  0x2ec
> +#define MT8195_TOP_AXI_PROT_EN_2_SET                    0x714
> +#define MT8195_TOP_AXI_PROT_EN_2_CLR                    0x718
> +#define MT8195_TOP_AXI_PROT_EN_2_STA1                   0x724
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_SET                 0xb84
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_CLR                 0xb88
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_STA1                0xb90
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_SET               0xba4
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR               0xba8
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1              0xbb0
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_SET               0xbb8
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_CLR               0xbbc
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_STA1              0xbc4
> +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET       0xbcc
> +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR       0xbd0
> +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1      0xbd8
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_SET                 0xdcc
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_CLR                 0xdd0
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_STA1                0xdd8
> +
> +#define MT8195_TOP_AXI_PROT_EN_NNA0			BIT(1)
> +#define MT8195_TOP_AXI_PROT_EN_NNA1			BIT(2)
> +#define MT8195_TOP_AXI_PROT_EN_NNA			GENMASK(2, 1)
> +#define MT8195_TOP_AXI_PROT_EN_VDOSYS0			BIT(6)
> +#define MT8195_TOP_AXI_PROT_EN_VPPSYS0			BIT(10)
> +#define MT8195_TOP_AXI_PROT_EN_MFG1			BIT(11)
> +#define MT8195_TOP_AXI_PROT_EN_MFG1_2ND			GENMASK(22, 21)
> +#define MT8195_TOP_AXI_PROT_EN_VPPSYS0_2ND		BIT(23)
> +#define MT8195_TOP_AXI_PROT_EN_1_MFG1			GENMASK(20, 19)
> +#define MT8195_TOP_AXI_PROT_EN_1_CAM			BIT(22)
> +#define MT8195_TOP_AXI_PROT_EN_2_CAM			BIT(0)
> +#define MT8195_TOP_AXI_PROT_EN_2_MFG1_2ND		GENMASK(6, 5)
> +#define MT8195_TOP_AXI_PROT_EN_2_MFG1			BIT(7)
> +#define MT8195_TOP_AXI_PROT_EN_2_AUDIO_ASRC		(BIT(8) | BIT(17))
> +#define MT8195_TOP_AXI_PROT_EN_2_AUDIO			(BIT(9) | BIT(11))
> +#define MT8195_TOP_AXI_PROT_EN_2_ADSP			(BIT(12) | GENMASK(16, 14))
> +#define MT8195_TOP_AXI_PROT_EN_2_NNA0_2ND		BIT(19)
> +#define MT8195_TOP_AXI_PROT_EN_2_NNA1_2ND		BIT(20)
> +#define MT8195_TOP_AXI_PROT_EN_2_NNA_2ND		GENMASK(20, 19)
> +#define MT8195_TOP_AXI_PROT_EN_2_NNA0			BIT(21)
> +#define MT8195_TOP_AXI_PROT_EN_2_NNA1			BIT(22)
> +#define MT8195_TOP_AXI_PROT_EN_2_NNA			GENMASK(22, 21)
> +#define MT8195_TOP_AXI_PROT_EN_MM_CAM			(BIT(0) | BIT(2) | BIT(4))
> +#define MT8195_TOP_AXI_PROT_EN_MM_IPE			BIT(1)
> +#define MT8195_TOP_AXI_PROT_EN_MM_IMG			(BIT(1) | BIT(3))
> +#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS0		(GENMASK(2, 0) | GENMASK(8, 6) |	\
> +							GENMASK(12, 10) | GENMASK(21, 19) |	\
> +							BIT(31))
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0		(GENMASK(5, 3) | BIT(9) |	\
> +							GENMASK(14, 13) | GENMASK(21, 17) |	\
> +							BIT(30))
> +#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1		GENMASK(8, 5)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VENC			(BIT(9) | BIT(11))
> +#define MT8195_TOP_AXI_PROT_EN_MM_VENC_CORE1		(BIT(10) | BIT(12))
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDEC0			BIT(13)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDEC1			BIT(14)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1_2ND		BIT(22)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1_2ND		BIT(23)
> +#define MT8195_TOP_AXI_PROT_EN_MM_CAM_2ND		BIT(24)
> +#define MT8195_TOP_AXI_PROT_EN_MM_IMG_2ND		BIT(25)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VENC_2ND		BIT(26)
> +#define MT8195_TOP_AXI_PROT_EN_MM_WPESYS		BIT(27)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDEC0_2ND		BIT(28)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDEC1_2ND		BIT(29)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0_2ND		GENMASK(29, 22)
> +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1		GENMASK(31, 30)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0_2ND		(GENMASK(7, 0) | GENMASK(18, 11))
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VENC		BIT(2)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VENC_CORE1		(BIT(3) | BIT(15))
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_CAM			(BIT(5) | BIT(17))
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS1		(GENMASK(7, 6) | BIT(18))
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0		(GENMASK(9, 8) | GENMASK(22, 21) | BIT(24))
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS1		BIT(10)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2_2ND		BIT(12)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0_2ND		BIT(13)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS_2ND		BIT(14)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_IMG			BIT(16)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_IPE			BIT(16)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2		BIT(21)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0		BIT(22)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS0		BIT(23)
> +#define MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS		GENMASK(24, 23)
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_EPD_TX		BIT(1)
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_DP_TX		BIT(2)
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P0		(BIT(11) | BIT(28))
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P1		(BIT(12) | BIT(29))
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P0	BIT(13)
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P1	BIT(14)
> +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1	(BIT(17) | BIT(19))
> +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VPPSYS0	BIT(20)
> +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VDOSYS0	BIT(21)
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA0		BIT(25)
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA1		BIT(26)
> +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA		GENMASK(26, 25)
> +
>  #define MT8192_TOP_AXI_PROT_EN_STA1			0x228
>  #define MT8192_TOP_AXI_PROT_EN_1_STA1			0x258
>  #define MT8192_TOP_AXI_PROT_EN_SET			0x2a0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
