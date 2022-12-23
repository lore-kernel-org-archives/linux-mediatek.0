Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601F4C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=li8zgTsmQ5Z+JxKP9rtObd08LwlXBVhccXmsE/C4B4A=; b=vvGhMmoBYLt1OouXSgKqL4VK6P
	SvRajHVhvUV6h1IyftSwqus7ulPuk1cbshIdL6RuedAo2juS2oiDHFkgBXJg9pFXqmibIXDU3eR69
	mA1xT5MhxEQkuQB1gEGkGiomOlZDqS9yIf9OT+AJhb6sYZKNaqcMH3+Ur/ZhAhS8J7f1P6vI5XgEQ
	xW4TSlct4BHhGJ5BV9OJcibvT55gsVELXnWaBeZpdQZkYEFJoLJudpwtE4zexvRfqUAGp1Ggkekdq
	zJIlLNMZh/Si8lFBEu9FdSFBcRS7+b6nEmKSBmYHZB6qffL+BlXJ0dBtzM5fsIdOwdmTQTQlNkdsp
	7pOZR4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8drq-005RII-4S; Fri, 23 Dec 2022 08:57:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8dr5-005QuM-4e; Fri, 23 Dec 2022 08:56:42 +0000
X-UUID: b18eb09723cf4cd2a9154c3f2ce8b646-20221223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=li8zgTsmQ5Z+JxKP9rtObd08LwlXBVhccXmsE/C4B4A=;
	b=PEy0LlFk07pc9IYkFUTse6OLx6ocUECCddYCLgqR8/h31DYHBNGp/IN0xg7yKgQ1h0nPW9QEwxmT7jkLDSPjHVrv4Qw+hmDRNsgV+UMjvqRVRZz7UwrAPe0IagPFgzfb9Y5vsVIAxj5pmVIBNYXPHJbh5gK1p/KeM1St2cswkAc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:02967eb6-2687-4a51-b493-3472fc414f79,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:ccf5358a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b18eb09723cf4cd2a9154c3f2ce8b646-20221223
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1665914903; Fri, 23 Dec 2022 01:56:31 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 23 Dec 2022 16:05:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 23 Dec 2022 16:05:56 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <netdev@vger.kernel.org>, Garmin.Chang
	<Garmin.Chang@mediatek.com>
Subject: [PATCH v3 2/2] soc: mediatek: pm-domains: Add support for mt8188
Date: Fri, 23 Dec 2022 16:05:53 +0800
Message-ID: <20221223080553.9397-3-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
References: <20221223080553.9397-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_005639_379052_4B05081C 
X-CRM114-Status: GOOD (  12.90  )
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

Add domain control data including bus protection data size
change due to more protection steps in mt8188.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 drivers/soc/mediatek/mt8188-pm-domains.h | 623 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
 include/linux/soc/mediatek/infracfg.h    | 121 +++++
 3 files changed, 749 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8188-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8188-pm-domains.h b/drivers/soc/mediatek/mt8188-pm-domains.h
new file mode 100644
index 000000000000..0692cb444ed0
--- /dev/null
+++ b/drivers/soc/mediatek/mt8188-pm-domains.h
@@ -0,0 +1,623 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Garmin Chang <garmin.chang@mediatek.com>
+ */
+
+#ifndef __SOC_MEDIATEK_MT8188_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8188_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mediatek,mt8188-power.h>
+
+/*
+ * MT8188 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8188[] = {
+	[MT8188_POWER_DOMAIN_MFG0] = {
+		.name = "mfg0",
+		.sta_mask = BIT(1),
+		.ctl_offs = 0x300,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+	},
+	[MT8188_POWER_DOMAIN_MFG1] = {
+		.name = "mfg1",
+		.sta_mask = BIT(2),
+		.ctl_offs = 0x304,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MFG1_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_SET,
+				    MT8188_TOP_AXI_PROT_EN_CLR,
+				    MT8188_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_MFG1_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_1_MFG1_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_1_SET,
+				    MT8188_TOP_AXI_PROT_EN_1_CLR,
+				    MT8188_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_MFG1_STEP4,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MFG1_STEP5,
+				    MT8188_TOP_AXI_PROT_EN_SET,
+				    MT8188_TOP_AXI_PROT_EN_CLR,
+				    MT8188_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1_STEP6,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+	},
+	[MT8188_POWER_DOMAIN_MFG2] = {
+		.name = "mfg2",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x308,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_MFG3] = {
+		.name = "mfg3",
+		.sta_mask = BIT(4),
+		.ctl_offs = 0x30C,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_MFG4] = {
+		.name = "mfg4",
+		.sta_mask = BIT(5),
+		.ctl_offs = 0x310,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_PEXTP_MAC_P0] = {
+		.name = "pextp_mac_p0",
+		.sta_mask = BIT(10),
+		.ctl_offs = 0x324,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_PEXTP_MAC_P0_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_SET,
+				    MT8188_TOP_AXI_PROT_EN_CLR,
+				    MT8188_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_PEXTP_MAC_P0_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_PEXTP_PHY_TOP] = {
+		.name = "pextp_phy_top",
+		.sta_mask = BIT(12),
+		.ctl_offs = 0x328,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_CSIRX_TOP] = {
+		.name = "pextp_csirx_top",
+		.sta_mask = BIT(17),
+		.ctl_offs = 0x3C4,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_ETHER] = {
+		.name = "ether",
+		.sta_mask = BIT(1),
+		.ctl_offs = 0x338,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_ETHER_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8188_POWER_DOMAIN_HDMI_TX] = {
+		.name = "hdmi_tx",
+		.sta_mask = BIT(18),
+		.ctl_offs = 0x37C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_HDMI_TX_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8188_POWER_DOMAIN_ADSP_AO] = {
+		.name = "adsp_ao",
+		.sta_mask = BIT(10),
+		.ctl_offs = 0x35C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_ADSP_AO_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_ADSP_AO_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+		},
+		.caps = MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8188_POWER_DOMAIN_ADSP_INFRA] = {
+		.name = "adsp_infra",
+		.sta_mask = BIT(9),
+		.ctl_offs = 0x358,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_ADSP_INFRA_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_ADSP_INFRA_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+		},
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_ALWAYS_ON,
+	},
+	[MT8188_POWER_DOMAIN_ADSP] = {
+		.name = "adsp",
+		.sta_mask = BIT(8),
+		.ctl_offs = 0x354,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_ADSP_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_ADSP_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_SRAM_ISO | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8188_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = BIT(6),
+		.ctl_offs = 0x34C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8188_POWER_DOMAIN_AUDIO_ASRC] = {
+		.name = "audio_asrc",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x350,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_AUDIO_ASRC_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_AUDIO_ASRC_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_VPPSYS0] = {
+		.name = "vppsys0",
+		.sta_mask = BIT(11),
+		.ctl_offs = 0x360,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_VPPSYS0_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_SET,
+				    MT8188_TOP_AXI_PROT_EN_CLR,
+				    MT8188_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_VPPSYS0_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_VPPSYS0_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_SET,
+				    MT8188_TOP_AXI_PROT_EN_CLR,
+				    MT8188_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_VPPSYS0_STEP4,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VPPSYS0_STEP5,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA),
+		},
+	},
+	[MT8188_POWER_DOMAIN_VDOSYS0] = {
+		.name = "vdosys0",
+		.sta_mask = BIT(13),
+		.ctl_offs = 0x368,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VDOSYS0_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_VDOSYS0_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_SET,
+				    MT8188_TOP_AXI_PROT_EN_CLR,
+				    MT8188_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VDOSYS0_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA),
+		},
+	},
+	[MT8188_POWER_DOMAIN_VDOSYS1] = {
+		.name = "vdosys1",
+		.sta_mask = BIT(14),
+		.ctl_offs = 0x36C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VDOSYS1_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VDOSYS1_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_VDOSYS1_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+	},
+	[MT8188_POWER_DOMAIN_DP_TX] = {
+		.name = "dp_tx",
+		.sta_mask = BIT(16),
+		.ctl_offs = 0x374,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_DP_TX_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_EDP_TX] = {
+		.name = "edp_tx",
+		.sta_mask = BIT(17),
+		.ctl_offs = 0x378,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_EDP_TX_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_SET,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_CLR,
+				    MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_VPPSYS1] = {
+		.name = "vppsys1",
+		.sta_mask = BIT(12),
+		.ctl_offs = 0x364,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VPPSYS1_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VPPSYS1_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_VPPSYS1_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+	},
+	[MT8188_POWER_DOMAIN_WPE] = {
+		.name = "wpe",
+		.sta_mask = BIT(15),
+		.ctl_offs = 0x370,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_WPE_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_WPE_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_VDEC0] = {
+		.name = "vdec0",
+		.sta_mask = BIT(19),
+		.ctl_offs = 0x380,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VDEC0_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_VDEC0_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_VDEC1] = {
+		.name = "vdec1",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x384,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VDEC1_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VDEC1_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = BIT(22),
+		.ctl_offs = 0x38C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VENC_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_VENC_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_VENC_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_IMG_VCORE] = {
+		.name = "vcore",
+		.sta_mask = BIT(28),
+		.ctl_offs = 0x3A4,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_IMG_VCORE_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_IMG_VCORE_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_IMG_VCORE_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+	},
+	[MT8188_POWER_DOMAIN_IMG_MAIN] = {
+		.name = "img_main",
+		.sta_mask = BIT(29),
+		.ctl_offs = 0x3A8,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_IMG_MAIN_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_IMG_MAIN_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_DIP] = {
+		.name = "dip",
+		.sta_mask = BIT(30),
+		.ctl_offs = 0x3AC,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_IPE] = {
+		.name = "ipe",
+		.sta_mask = BIT(31),
+		.ctl_offs = 0x3B0,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_CAM_VCORE] = {
+		.name = "cam_vcore",
+		.sta_mask = BIT(27),
+		.ctl_offs = 0x3A0,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_CAM_VCORE_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_CAM_VCORE_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_1_CAM_VCORE_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_1_SET,
+				    MT8188_TOP_AXI_PROT_EN_1_CLR,
+				    MT8188_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_CAM_VCORE_STEP4,
+				    MT8188_TOP_AXI_PROT_EN_MM_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_CAM_VCORE_STEP5,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+	},
+	[MT8188_POWER_DOMAIN_CAM_MAIN] = {
+		.name = "cam_main",
+		.sta_mask = BIT(24),
+		.ctl_offs = 0x394,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_CAM_MAIN_STEP1,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_CAM_MAIN_STEP2,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_MM_2_CAM_MAIN_STEP3,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_MM_2_STA),
+			BUS_PROT_WR(MT8188_TOP_AXI_PROT_EN_2_CAM_MAIN_STEP4,
+				    MT8188_TOP_AXI_PROT_EN_2_SET,
+				    MT8188_TOP_AXI_PROT_EN_2_CLR,
+				    MT8188_TOP_AXI_PROT_EN_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_CAM_SUBA] = {
+		.name = "cam_suba",
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x398,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8188_POWER_DOMAIN_CAM_SUBB] = {
+		.name = "cam_subb",
+		.sta_mask = BIT(26),
+		.ctl_offs = 0x39C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+};
+
+static const struct scpsys_soc_data mt8188_scpsys_data = {
+	.domains_data = scpsys_domain_data_mt8188,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8188),
+};
+
+#endif /* __SOC_MEDIATEK_MT8188_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 474b272f9b02..ea3878bf4387 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -21,6 +21,7 @@
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
 #include "mt8186-pm-domains.h"
+#include "mt8188-pm-domains.h"
 #include "mt8192-pm-domains.h"
 #include "mt8195-pm-domains.h"
 
@@ -579,6 +580,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8186-power-controller",
 		.data = &mt8186_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8188-power-controller",
+		.data = &mt8188_scpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt8192-power-controller",
 		.data = &mt8192_scpsys_data,
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 50804ac748bd..07f67b3d8e97 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -140,6 +140,127 @@
 #define MT8192_TOP_AXI_PROT_EN_MM_2_MDP_2ND		BIT(13)
 #define MT8192_TOP_AXI_PROT_EN_VDNR_CAM			BIT(21)
 
+#define MT8188_TOP_AXI_PROT_EN_SET				0x2A0
+#define MT8188_TOP_AXI_PROT_EN_CLR				0x2A4
+#define MT8188_TOP_AXI_PROT_EN_STA				0x228
+#define MT8188_TOP_AXI_PROT_EN_1_SET				0x2A8
+#define MT8188_TOP_AXI_PROT_EN_1_CLR				0x2AC
+#define MT8188_TOP_AXI_PROT_EN_1_STA				0x258
+#define MT8188_TOP_AXI_PROT_EN_2_SET				0x714
+#define MT8188_TOP_AXI_PROT_EN_2_CLR				0x718
+#define MT8188_TOP_AXI_PROT_EN_2_STA				0x724
+
+#define MT8188_TOP_AXI_PROT_EN_MM_SET				0x2D4
+#define MT8188_TOP_AXI_PROT_EN_MM_CLR				0x2D8
+#define MT8188_TOP_AXI_PROT_EN_MM_STA				0x2EC
+#define MT8188_TOP_AXI_PROT_EN_MM_2_SET				0xDCC
+#define MT8188_TOP_AXI_PROT_EN_MM_2_CLR				0xDD0
+#define MT8188_TOP_AXI_PROT_EN_MM_2_STA				0xDD8
+
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_SET			0xB84
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_CLR			0xB88
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_STA			0xB90
+#define MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET		0xBCC
+#define MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR		0xBD0
+#define MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA		0xBD8
+
+#define MT8188_TOP_AXI_PROT_EN_MFG1_STEP1			BIT(11)
+#define MT8188_TOP_AXI_PROT_EN_2_MFG1_STEP2			BIT(7)
+#define MT8188_TOP_AXI_PROT_EN_1_MFG1_STEP3			BIT(19)
+#define MT8188_TOP_AXI_PROT_EN_2_MFG1_STEP4			BIT(5)
+#define MT8188_TOP_AXI_PROT_EN_MFG1_STEP5			GENMASK(22, 21)
+#define MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1_STEP6	BIT(17)
+
+#define MT8188_TOP_AXI_PROT_EN_PEXTP_MAC_P0_STEP1		BIT(2)
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_PEXTP_MAC_P0_STEP2	(BIT(8) | BIT(18) | BIT(30))
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_ETHER_STEP1		BIT(24)
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_HDMI_TX_STEP1		BIT(20)
+#define MT8188_TOP_AXI_PROT_EN_2_ADSP_AO_STEP1			GENMASK(31, 29)
+#define MT8188_TOP_AXI_PROT_EN_2_ADSP_AO_STEP2			(GENMASK(4, 3) | BIT(28))
+#define MT8188_TOP_AXI_PROT_EN_2_ADSP_INFRA_STEP1		(GENMASK(16, 14) | BIT(23) | \
+								BIT(27))
+#define MT8188_TOP_AXI_PROT_EN_2_ADSP_INFRA_STEP2		(GENMASK(19, 17) | GENMASK(26, 25))
+#define MT8188_TOP_AXI_PROT_EN_2_ADSP_STEP1			GENMASK(11, 8)
+#define MT8188_TOP_AXI_PROT_EN_2_ADSP_STEP2			GENMASK(22, 21)
+#define MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP1			BIT(20)
+#define MT8188_TOP_AXI_PROT_EN_2_AUDIO_STEP2			BIT(12)
+#define MT8188_TOP_AXI_PROT_EN_2_AUDIO_ASRC_STEP1		BIT(24)
+#define MT8188_TOP_AXI_PROT_EN_2_AUDIO_ASRC_STEP2		BIT(13)
+
+#define MT8188_TOP_AXI_PROT_EN_VPPSYS0_STEP1			BIT(10)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_VPPSYS0_STEP2		GENMASK(9, 8)
+#define MT8188_TOP_AXI_PROT_EN_VPPSYS0_STEP3			BIT(23)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_VPPSYS0_STEP4		(BIT(1) | BIT(4) | BIT(11))
+#define MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VPPSYS0_STEP5	(BIT(20))
+#define MT8188_TOP_AXI_PROT_EN_MM_VDOSYS0_STEP1			(GENMASK(18, 17) | GENMASK(21, 20))
+#define MT8188_TOP_AXI_PROT_EN_VDOSYS0_STEP2			BIT(6)
+#define MT8188_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VDOSYS0_STEP3	BIT(21)
+#define MT8188_TOP_AXI_PROT_EN_MM_VDOSYS1_STEP1			GENMASK(31, 30)
+#define MT8188_TOP_AXI_PROT_EN_MM_VDOSYS1_STEP2			BIT(22)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_VDOSYS1_STEP3		BIT(10)
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_DP_TX_STEP1		BIT(23)
+#define MT8188_TOP_AXI_PROT_EN_INFRA_VDNR_EDP_TX_STEP1		BIT(22)
+
+#define MT8188_TOP_AXI_PROT_EN_MM_VPPSYS1_STEP1			GENMASK(6, 5)
+#define MT8188_TOP_AXI_PROT_EN_MM_VPPSYS1_STEP2			BIT(23)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_VPPSYS1_STEP3		BIT(18)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_WPE_STEP1			BIT(23)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_WPE_STEP2			BIT(21)
+#define MT8188_TOP_AXI_PROT_EN_MM_VDEC0_STEP1			BIT(13)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_VDEC0_STEP2			BIT(13)
+#define MT8188_TOP_AXI_PROT_EN_MM_VDEC1_STEP1			BIT(14)
+#define MT8188_TOP_AXI_PROT_EN_MM_VDEC1_STEP2			BIT(29)
+#define MT8188_TOP_AXI_PROT_EN_MM_VENC_STEP1			(BIT(9) | BIT(11))
+#define MT8188_TOP_AXI_PROT_EN_MM_VENC_STEP2			BIT(26)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_VENC_STEP3			BIT(2)
+#define MT8188_TOP_AXI_PROT_EN_MM_IMG_VCORE_STEP1		(BIT(1) | BIT(3))
+#define MT8188_TOP_AXI_PROT_EN_MM_IMG_VCORE_STEP2		BIT(25)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_IMG_VCORE_STEP3		BIT(16)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_IMG_MAIN_STEP1		GENMASK(27, 26)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_IMG_MAIN_STEP2		GENMASK(25, 24)
+#define MT8188_TOP_AXI_PROT_EN_MM_CAM_VCORE_STEP1		(BIT(2) | BIT(4))
+#define MT8188_TOP_AXI_PROT_EN_2_CAM_VCORE_STEP2		BIT(0)
+#define MT8188_TOP_AXI_PROT_EN_1_CAM_VCORE_STEP3		BIT(22)
+#define MT8188_TOP_AXI_PROT_EN_MM_CAM_VCORE_STEP4		BIT(24)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_CAM_VCORE_STEP5		BIT(17)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_CAM_MAIN_STEP1		GENMASK(31, 30)
+#define MT8188_TOP_AXI_PROT_EN_2_CAM_MAIN_STEP2			BIT(2)
+#define MT8188_TOP_AXI_PROT_EN_MM_2_CAM_MAIN_STEP3		GENMASK(29, 28)
+#define MT8188_TOP_AXI_PROT_EN_2_CAM_MAIN_STEP4			BIT(1)
+
+#define MT8188_SMI_COMMON_CLAMP_EN_STA				0x3C0
+#define MT8188_SMI_COMMON_CLAMP_EN_SET				0x3C4
+#define MT8188_SMI_COMMON_CLAMP_EN_CLR				0x3C8
+
+#define MT8188_SMI_COMMON_SMI_CLAMP_DIP_TO_VDO0			GENMASK(3, 1)
+#define MT8188_SMI_COMMON_SMI_CLAMP_DIP_TO_VPP1			GENMASK(2, 1)
+#define MT8188_SMI_COMMON_SMI_CLAMP_IPE_TO_VPP1			BIT(0)
+
+#define MT8188_SMI_COMMON_SMI_CLAMP_CAM_SUBA_TO_VPP0		GENMASK(3, 2)
+#define MT8188_SMI_COMMON_SMI_CLAMP_CAM_SUBB_TO_VDO0		GENMASK(3, 2)
+
+#define MT8188_SMI_LARB10_RESET_ADDR				0xC
+#define MT8188_SMI_LARB11A_RESET_ADDR				0xC
+#define MT8188_SMI_LARB11C_RESET_ADDR				0xC
+#define MT8188_SMI_LARB12_RESET_ADDR				0xC
+#define MT8188_SMI_LARB11B_RESET_ADDR				0xC
+#define MT8188_SMI_LARB15_RESET_ADDR				0xC
+#define MT8188_SMI_LARB16B_RESET_ADDR				0xA0
+#define MT8188_SMI_LARB17B_RESET_ADDR				0xA0
+#define MT8188_SMI_LARB16A_RESET_ADDR				0xA0
+#define MT8188_SMI_LARB17A_RESET_ADDR				0xA0
+
+#define MT8188_SMI_LARB10_RESET					BIT(0)
+#define MT8188_SMI_LARB11A_RESET				BIT(0)
+#define MT8188_SMI_LARB11C_RESET				BIT(0)
+#define MT8188_SMI_LARB12_RESET					BIT(8)
+#define MT8188_SMI_LARB11B_RESET				BIT(0)
+#define MT8188_SMI_LARB15_RESET					BIT(0)
+#define MT8188_SMI_LARB16B_RESET				BIT(4)
+#define MT8188_SMI_LARB17B_RESET				BIT(4)
+#define MT8188_SMI_LARB16A_RESET				BIT(4)
+#define MT8188_SMI_LARB17A_RESET				BIT(4)
+
 #define MT8186_TOP_AXI_PROT_EN_SET			(0x2A0)
 #define MT8186_TOP_AXI_PROT_EN_CLR			(0x2A4)
 #define MT8186_TOP_AXI_PROT_EN_STA			(0x228)
-- 
2.18.0


