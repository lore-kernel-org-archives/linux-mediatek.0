Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61077C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:23:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24BD160F9B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24BD160F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Gbm9vGrk1fA2p5At6ydm+ibGATQrRHfAlQIr6eVS1Y=; b=nCjXWSkCa40f3+
	Arh4z8FuF+zbi2Nefkr7L+iJnFGHCgMF0FM82xoaeJ9EG+Xmy5sc4EIetK8z0ZOD92j4jpHw+xzhp
	dIeQMXdkNeJPVFjZkFIODLb3nSZmgI6fcLFuPxARZwTWEz1kp/w1Z2156nSGfSnu0OM63RQL99F6t
	VffavGj3yZc9687UF44RCLSbE3AeLtPhRBZy0b7jKRoT2IPHK53YKQBigDU6NNXr7OWAI2HigfOUC
	I3b6zT/ZLpMGKdcbPE+RxbrlVbYDBNc61LfAfsAiETo0C/2lSTwW0W4Jl4kjTO5Q0qTcWHn/ql8za
	3uyPWh62ORWPWNxyoNqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPj7o-001FVv-Dp; Mon, 13 Sep 2021 10:23:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPj7i-001FS4-7c; Mon, 13 Sep 2021 10:23:41 +0000
X-UUID: 66140c59a9854deca90378e8da1a9506-20210913
X-UUID: 66140c59a9854deca90378e8da1a9506-20210913
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 259570377; Mon, 13 Sep 2021 03:23:37 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 03:23:35 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Sep 2021 18:23:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 13 Sep 2021 18:23:33 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v5 5/5] soc: mediatek: pm-domains: Add support for mt8195
Date: Mon, 13 Sep 2021 18:22:32 +0800
Message-ID: <20210913102232.26344-6-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210913102232.26344-1-chun-jie.chen@mediatek.com>
References: <20210913102232.26344-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_032338_356640_D7A19920 
X-CRM114-Status: GOOD (  13.88  )
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

Add domain control data including bus protection data size
change due to more protection steps in mt8195.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
change license in drivers/soc/mediatek/mt8195-pm-domains.h
---
 drivers/soc/mediatek/mt8195-pm-domains.h | 613 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
 drivers/soc/mediatek/mtk-pm-domains.h    |   2 +-
 include/linux/soc/mediatek/infracfg.h    |  82 +++
 4 files changed, 701 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h b/drivers/soc/mediatek/mt8195-pm-domains.h
new file mode 100644
index 000000000000..186e2209e176
--- /dev/null
+++ b/drivers/soc/mediatek/mt8195-pm-domains.h
@@ -0,0 +1,613 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+ */
+
+#ifndef __SOC_MEDIATEK_MT8195_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8195_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mt8195-power.h>
+
+/*
+ * MT8195 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8195[] = {
+	[MT8195_POWER_DOMAIN_PCIE_MAC_P0] = {
+		.name = "pcie_mac_p0",
+		.sta_mask = BIT(11),
+		.ctl_offs = 0x328,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P0,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_SET,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_CLR,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P0,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_PCIE_MAC_P1] = {
+		.name = "pcie_mac_p1",
+		.sta_mask = BIT(12),
+		.ctl_offs = 0x32C,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P1,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_SET,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_CLR,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P1,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_PCIE_PHY] = {
+		.name = "pcie_phy",
+		.sta_mask = BIT(13),
+		.ctl_offs = 0x330,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY] = {
+		.name = "ssusb_pcie_phy",
+		.sta_mask = BIT(14),
+		.ctl_offs = 0x334,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8195_POWER_DOMAIN_CSI_RX_TOP] = {
+		.name = "csi_rx_top",
+		.sta_mask = BIT(18),
+		.ctl_offs = 0x3C4,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_ETHER] = {
+		.name = "ether",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x344,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8195_POWER_DOMAIN_ADSP] = {
+		.name = "adsp",
+		.sta_mask = BIT(10),
+		.ctl_offs = 0x360,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_ADSP,
+				    MT8195_TOP_AXI_PROT_EN_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_2_STA1),
+		},
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8195_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = BIT(8),
+		.ctl_offs = 0x358,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_AUDIO,
+				    MT8195_TOP_AXI_PROT_EN_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_2_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_MFG0] = {
+		.name = "mfg0",
+		.sta_mask = BIT(1),
+		.ctl_offs = 0x300,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_MFG1] = {
+		.name = "mfg1",
+		.sta_mask = BIT(2),
+		.ctl_offs = 0x304,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MFG1,
+				    MT8195_TOP_AXI_PROT_EN_SET,
+				    MT8195_TOP_AXI_PROT_EN_CLR,
+				    MT8195_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_MFG1,
+				    MT8195_TOP_AXI_PROT_EN_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_1_MFG1,
+				    MT8195_TOP_AXI_PROT_EN_1_SET,
+				    MT8195_TOP_AXI_PROT_EN_1_CLR,
+				    MT8195_TOP_AXI_PROT_EN_1_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_MFG1_2ND,
+				    MT8195_TOP_AXI_PROT_EN_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MFG1_2ND,
+				    MT8195_TOP_AXI_PROT_EN_SET,
+				    MT8195_TOP_AXI_PROT_EN_CLR,
+				    MT8195_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_MFG2] = {
+		.name = "mfg2",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x308,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_MFG3] = {
+		.name = "mfg3",
+		.sta_mask = BIT(4),
+		.ctl_offs = 0x30C,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_MFG4] = {
+		.name = "mfg4",
+		.sta_mask = BIT(5),
+		.ctl_offs = 0x310,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_MFG5] = {
+		.name = "mfg5",
+		.sta_mask = BIT(6),
+		.ctl_offs = 0x314,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_MFG6] = {
+		.name = "mfg6",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x318,
+		.pwr_sta_offs = 0x174,
+		.pwr_sta2nd_offs = 0x178,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_VPPSYS0] = {
+		.name = "vppsys0",
+		.sta_mask = BIT(11),
+		.ctl_offs = 0x364,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VPPSYS0,
+				    MT8195_TOP_AXI_PROT_EN_SET,
+				    MT8195_TOP_AXI_PROT_EN_CLR,
+				    MT8195_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VPPSYS0_2ND,
+				    MT8195_TOP_AXI_PROT_EN_SET,
+				    MT8195_TOP_AXI_PROT_EN_CLR,
+				    MT8195_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VPPSYS0,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_VDOSYS0] = {
+		.name = "vdosys0",
+		.sta_mask = BIT(13),
+		.ctl_offs = 0x36C,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDOSYS0,
+				    MT8195_TOP_AXI_PROT_EN_SET,
+				    MT8195_TOP_AXI_PROT_EN_CLR,
+				    MT8195_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VDOSYS0,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR,
+				    MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_VPPSYS1] = {
+		.name = "vppsys1",
+		.sta_mask = BIT(12),
+		.ctl_offs = 0x368,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS1,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_VDOSYS1] = {
+		.name = "vdosys1",
+		.sta_mask = BIT(14),
+		.ctl_offs = 0x370,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS1,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_DP_TX] = {
+		.name = "dp_tx",
+		.sta_mask = BIT(16),
+		.ctl_offs = 0x378,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_DP_TX,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_EPD_TX] = {
+		.name = "epd_tx",
+		.sta_mask = BIT(17),
+		.ctl_offs = 0x37C,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_VDNR_1_EPD_TX,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_SET,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR,
+				    MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_HDMI_TX] = {
+		.name = "hdmi_tx",
+		.sta_mask = BIT(18),
+		.ctl_offs = 0x380,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8195_POWER_DOMAIN_WPESYS] = {
+		.name = "wpesys",
+		.sta_mask = BIT(15),
+		.ctl_offs = 0x374,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_WPESYS,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+	},
+	[MT8195_POWER_DOMAIN_VDEC0] = {
+		.name = "vdec0",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x388,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC0,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC0_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_VDEC1] = {
+		.name = "vdec1",
+		.sta_mask = BIT(21),
+		.ctl_offs = 0x38C,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC1,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VDEC1_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_VDEC2] = {
+		.name = "vdec2",
+		.sta_mask = BIT(22),
+		.ctl_offs = 0x390,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = BIT(23),
+		.ctl_offs = 0x394,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VENC,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VENC_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VENC,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_VENC_CORE1] = {
+		.name = "venc_core1",
+		.sta_mask = BIT(24),
+		.ctl_offs = 0x398,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_VENC_CORE1,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_VENC_CORE1,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_IMG] = {
+		.name = "img",
+		.sta_mask = BIT(29),
+		.ctl_offs = 0x3AC,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_IMG,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_IMG_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_DIP] = {
+		.name = "dip",
+		.sta_mask = BIT(30),
+		.ctl_offs = 0x3B0,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_IPE] = {
+		.name = "ipe",
+		.sta_mask = BIT(31),
+		.ctl_offs = 0x3B4,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_IPE,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_IPE,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_CAM] = {
+		.name = "cam",
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x39C,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_2_CAM,
+				    MT8195_TOP_AXI_PROT_EN_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_2_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_CAM,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_1_CAM,
+				    MT8195_TOP_AXI_PROT_EN_1_SET,
+				    MT8195_TOP_AXI_PROT_EN_1_CLR,
+				    MT8195_TOP_AXI_PROT_EN_1_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_CAM_2ND,
+				    MT8195_TOP_AXI_PROT_EN_MM_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8195_TOP_AXI_PROT_EN_MM_2_CAM,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8195_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_CAM_RAWA] = {
+		.name = "cam_rawa",
+		.sta_mask = BIT(26),
+		.ctl_offs = 0x3A0,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_CAM_RAWB] = {
+		.name = "cam_rawb",
+		.sta_mask = BIT(27),
+		.ctl_offs = 0x3A4,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8195_POWER_DOMAIN_CAM_MRAW] = {
+		.name = "cam_mraw",
+		.sta_mask = BIT(28),
+		.ctl_offs = 0x3A8,
+		.pwr_sta_offs = 0x16c,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+};
+
+static const struct scpsys_soc_data mt8195_scpsys_data = {
+	.domains_data = scpsys_domain_data_mt8195,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8195),
+};
+
+#endif /* __SOC_MEDIATEK_MT8195_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index ad06b6f90435..61973a306e97 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -20,6 +20,7 @@
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
 #include "mt8192-pm-domains.h"
+#include "mt8195-pm-domains.h"
 
 #define MTK_POLL_DELAY_US		10
 #define MTK_POLL_TIMEOUT		USEC_PER_SEC
@@ -569,6 +570,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8192-power-controller",
 		.data = &mt8192_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-power-controller",
+		.data = &mt8195_scpsys_data,
+	},
 	{ }
 };
 
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index c233ed828f86..daa24e890dd4 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -37,7 +37,7 @@
 #define PWR_STATUS_AUDIO		BIT(24)
 #define PWR_STATUS_USB			BIT(25)
 
-#define SPM_MAX_BUS_PROT_DATA		5
+#define SPM_MAX_BUS_PROT_DATA		6
 
 #define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
 		.bus_prot_mask = (_mask),			\
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 4615a228da51..d858e0bab7a2 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -2,6 +2,88 @@
 #ifndef __SOC_MEDIATEK_INFRACFG_H
 #define __SOC_MEDIATEK_INFRACFG_H
 
+#define MT8195_TOP_AXI_PROT_EN_STA1                     0x228
+#define MT8195_TOP_AXI_PROT_EN_1_STA1                   0x258
+#define MT8195_TOP_AXI_PROT_EN_SET			0x2a0
+#define MT8195_TOP_AXI_PROT_EN_CLR                      0x2a4
+#define MT8195_TOP_AXI_PROT_EN_1_SET                    0x2a8
+#define MT8195_TOP_AXI_PROT_EN_1_CLR                    0x2ac
+#define MT8195_TOP_AXI_PROT_EN_MM_SET                   0x2d4
+#define MT8195_TOP_AXI_PROT_EN_MM_CLR                   0x2d8
+#define MT8195_TOP_AXI_PROT_EN_MM_STA1                  0x2ec
+#define MT8195_TOP_AXI_PROT_EN_2_SET                    0x714
+#define MT8195_TOP_AXI_PROT_EN_2_CLR                    0x718
+#define MT8195_TOP_AXI_PROT_EN_2_STA1                   0x724
+#define MT8195_TOP_AXI_PROT_EN_VDNR_SET                 0xb84
+#define MT8195_TOP_AXI_PROT_EN_VDNR_CLR                 0xb88
+#define MT8195_TOP_AXI_PROT_EN_VDNR_STA1                0xb90
+#define MT8195_TOP_AXI_PROT_EN_VDNR_1_SET               0xba4
+#define MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR               0xba8
+#define MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1              0xbb0
+#define MT8195_TOP_AXI_PROT_EN_VDNR_2_SET               0xbb8
+#define MT8195_TOP_AXI_PROT_EN_VDNR_2_CLR               0xbbc
+#define MT8195_TOP_AXI_PROT_EN_VDNR_2_STA1              0xbc4
+#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET       0xbcc
+#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR       0xbd0
+#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1      0xbd8
+#define MT8195_TOP_AXI_PROT_EN_MM_2_SET                 0xdcc
+#define MT8195_TOP_AXI_PROT_EN_MM_2_CLR                 0xdd0
+#define MT8195_TOP_AXI_PROT_EN_MM_2_STA1                0xdd8
+
+#define MT8195_TOP_AXI_PROT_EN_VDOSYS0			BIT(6)
+#define MT8195_TOP_AXI_PROT_EN_VPPSYS0			BIT(10)
+#define MT8195_TOP_AXI_PROT_EN_MFG1			BIT(11)
+#define MT8195_TOP_AXI_PROT_EN_MFG1_2ND			GENMASK(22, 21)
+#define MT8195_TOP_AXI_PROT_EN_VPPSYS0_2ND		BIT(23)
+#define MT8195_TOP_AXI_PROT_EN_1_MFG1			GENMASK(20, 19)
+#define MT8195_TOP_AXI_PROT_EN_1_CAM			BIT(22)
+#define MT8195_TOP_AXI_PROT_EN_2_CAM			BIT(0)
+#define MT8195_TOP_AXI_PROT_EN_2_MFG1_2ND		GENMASK(6, 5)
+#define MT8195_TOP_AXI_PROT_EN_2_MFG1			BIT(7)
+#define MT8195_TOP_AXI_PROT_EN_2_AUDIO			(BIT(9) | BIT(11))
+#define MT8195_TOP_AXI_PROT_EN_2_ADSP			(BIT(12) | GENMASK(16, 14))
+#define MT8195_TOP_AXI_PROT_EN_MM_CAM			(BIT(0) | BIT(2) | BIT(4))
+#define MT8195_TOP_AXI_PROT_EN_MM_IPE			BIT(1)
+#define MT8195_TOP_AXI_PROT_EN_MM_IMG			BIT(3)
+#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0		GENMASK(21, 17)
+#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1		GENMASK(8, 5)
+#define MT8195_TOP_AXI_PROT_EN_MM_VENC			(BIT(9) | BIT(11))
+#define MT8195_TOP_AXI_PROT_EN_MM_VENC_CORE1		(BIT(10) | BIT(12))
+#define MT8195_TOP_AXI_PROT_EN_MM_VDEC0			BIT(13)
+#define MT8195_TOP_AXI_PROT_EN_MM_VDEC1			BIT(14)
+#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1_2ND		BIT(22)
+#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1_2ND		BIT(23)
+#define MT8195_TOP_AXI_PROT_EN_MM_CAM_2ND		BIT(24)
+#define MT8195_TOP_AXI_PROT_EN_MM_IMG_2ND		BIT(25)
+#define MT8195_TOP_AXI_PROT_EN_MM_VENC_2ND		BIT(26)
+#define MT8195_TOP_AXI_PROT_EN_MM_WPESYS		BIT(27)
+#define MT8195_TOP_AXI_PROT_EN_MM_VDEC0_2ND		BIT(28)
+#define MT8195_TOP_AXI_PROT_EN_MM_VDEC1_2ND		BIT(29)
+#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1		GENMASK(31, 30)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0_2ND		(GENMASK(1, 0) | BIT(4) | BIT(11))
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VENC		BIT(2)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VENC_CORE1		(BIT(3) | BIT(15))
+#define MT8195_TOP_AXI_PROT_EN_MM_2_CAM			(BIT(5) | BIT(17))
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS1		(GENMASK(7, 6) | BIT(18))
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0		GENMASK(9, 8)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS1		BIT(10)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2_2ND		BIT(12)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0_2ND		BIT(13)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS_2ND		BIT(14)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_IPE			BIT(16)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2		BIT(21)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0		BIT(22)
+#define MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS		GENMASK(24, 23)
+#define MT8195_TOP_AXI_PROT_EN_VDNR_1_EPD_TX		BIT(1)
+#define MT8195_TOP_AXI_PROT_EN_VDNR_1_DP_TX		BIT(2)
+#define MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P0		(BIT(11) | BIT(28))
+#define MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P1		(BIT(12) | BIT(29))
+#define MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P0	BIT(13)
+#define MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P1	BIT(14)
+#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1	(BIT(17) | BIT(19))
+#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VPPSYS0	BIT(20)
+#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VDOSYS0	BIT(21)
+
 #define MT8192_TOP_AXI_PROT_EN_STA1			0x228
 #define MT8192_TOP_AXI_PROT_EN_1_STA1			0x258
 #define MT8192_TOP_AXI_PROT_EN_SET			0x2a0
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
