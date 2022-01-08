Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jan 2022 13:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AiRSYE5kUo3mXy29kPh+ykkvjQoiZPewdq1v4uoayPY=; b=ggWWG2YHp3c1JN
	y6TAoi/B469NQ+gTuCETwUNwjAVfKwFAsgYV6CSUF757sADTQ5s7LBqZWr6e5H/QTAFpnO0D2Tp7R
	YE0zrcAoWEGLMpck6EUHmgYIEtOS+8Iv1ZVd+KqVlGsYdLvWCuowfaX7pnAFTE+zDnaafRwXF8Eis
	0pAvjZMRJEbdzHI8DygsDSvQwIU/3a08j7xqFddL14Shh4to3OOLSPC6ElBaRJs0dT6mdDO9n/6r8
	2R1t4Zz46QGxrJ0/tkfjhgKsyFIhNhEp+vqNF7A0/Iw6lpphN7XCt4TpW/AB71XXJ/EkwIKGjXxSh
	ZHJHL9FJFMe95xDsaCLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6BeI-006TQv-8s; Sat, 08 Jan 2022 13:20:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6Bdq-006TJ1-Mg; Sat, 08 Jan 2022 13:20:20 +0000
X-UUID: 32ca3e3848f6468783285a27ba1bcf5b-20220108
X-UUID: 32ca3e3848f6468783285a27ba1bcf5b-20220108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 367742481; Sat, 08 Jan 2022 06:20:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 05:20:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sat, 8 Jan 2022 21:20:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 8 Jan 2022 21:20:12 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v1 2/2] soc: mediatek: pm-domains: Add support for mt8186
Date: Sat, 8 Jan 2022 21:19:53 +0800
Message-ID: <20220108131953.16744-3-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
References: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_052018_793282_E446EAED 
X-CRM114-Status: GOOD (  15.25  )
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

Add power domain control data in mt8186.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/soc/mediatek/mt8186-pm-domains.h | 344 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
 include/linux/soc/mediatek/infracfg.h    |  48 ++++
 3 files changed, 397 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8186-pm-domains.h b/drivers/soc/mediatek/mt8186-pm-domains.h
new file mode 100644
index 000000000000..bf2dd0cdc3a8
--- /dev/null
+++ b/drivers/soc/mediatek/mt8186-pm-domains.h
@@ -0,0 +1,344 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+ */
+
+#ifndef __SOC_MEDIATEK_MT8186_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8186_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mt8186-power.h>
+
+/*
+ * MT8186 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8186[] = {
+	[MT8186_POWER_DOMAIN_MFG0] = {
+		.name = "mfg0",
+		.sta_mask = BIT(2),
+		.ctl_offs = 0x308,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_DOMAIN_SUPPLY,
+	},
+	[MT8186_POWER_DOMAIN_MFG1] = {
+		.name = "mfg1",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x30c,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_MFG1_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_MFG1_STEP2,
+				MT8186_TOP_AXI_PROT_EN_SET,
+				MT8186_TOP_AXI_PROT_EN_CLR,
+				MT8186_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_MFG1_STEP3,
+				MT8186_TOP_AXI_PROT_EN_SET,
+				MT8186_TOP_AXI_PROT_EN_CLR,
+				MT8186_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_MFG1_STEP4,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_MFG2] = {
+		.name = "mfg2",
+		.sta_mask = BIT(4),
+		.ctl_offs = 0x310,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_MFG3] = {
+		.name = "mfg3",
+		.sta_mask = BIT(5),
+		.ctl_offs = 0x314,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_SSUSB] = {
+		.name = "ssusb",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x9F0,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8186_POWER_DOMAIN_SSUSB_P1] = {
+		.name = "ssusb_p1",
+		.sta_mask = BIT(19),
+		.ctl_offs = 0x9F4,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8186_POWER_DOMAIN_DIS] = {
+		.name = "dis",
+		.sta_mask = BIT(21),
+		.ctl_offs = 0x354,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_DIS_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_DIS_STEP2,
+				MT8186_TOP_AXI_PROT_EN_SET,
+				MT8186_TOP_AXI_PROT_EN_CLR,
+				MT8186_TOP_AXI_PROT_EN_STA),
+		},
+	},
+	[MT8186_POWER_DOMAIN_IMG] = {
+		.name = "img",
+		.sta_mask = BIT(13),
+		.ctl_offs = 0x334,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_IMG_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_IMG_STEP2,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_IMG2] = {
+		.name = "img2",
+		.sta_mask = BIT(14),
+		.ctl_offs = 0x338,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_IPE] = {
+		.name = "ipe",
+		.sta_mask = BIT(15),
+		.ctl_offs = 0x33C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_IPE_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_IPE_STEP2,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_CAM] = {
+		.name = "cam",
+		.sta_mask = BIT(23),
+		.ctl_offs = 0x35C,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_CAM_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_CAM_STEP2,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_CAM_RAWA] = {
+		.name = "cam_rawa",
+		.sta_mask = BIT(24),
+		.ctl_offs = 0x360,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_CAM_RAWB] = {
+		.name = "cam_rawb",
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x364,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = BIT(18),
+		.ctl_offs = 0x348,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_VENC_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_VENC_STEP2,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = BIT(16),
+		.ctl_offs = 0x340,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_VDEC_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_VDEC_STEP2,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_WPE] = {
+		.name = "wpe",
+		.sta_mask = BIT(0),
+		.ctl_offs = 0x3F8,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_2_WPE_STEP1,
+				MT8186_TOP_AXI_PROT_EN_2_SET,
+				MT8186_TOP_AXI_PROT_EN_2_CLR,
+				MT8186_TOP_AXI_PROT_EN_2_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_2_WPE_STEP2,
+				MT8186_TOP_AXI_PROT_EN_2_SET,
+				MT8186_TOP_AXI_PROT_EN_2_CLR,
+				MT8186_TOP_AXI_PROT_EN_2_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_CONN_ON] = {
+		.name = "conn_on",
+		.sta_mask = BIT(1),
+		.ctl_offs = 0x304,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_1_CONN_ON_STEP1,
+				MT8186_TOP_AXI_PROT_EN_1_SET,
+				MT8186_TOP_AXI_PROT_EN_1_CLR,
+				MT8186_TOP_AXI_PROT_EN_1_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_CONN_ON_STEP2,
+				MT8186_TOP_AXI_PROT_EN_SET,
+				MT8186_TOP_AXI_PROT_EN_CLR,
+				MT8186_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_CONN_ON_STEP3,
+				MT8186_TOP_AXI_PROT_EN_SET,
+				MT8186_TOP_AXI_PROT_EN_CLR,
+				MT8186_TOP_AXI_PROT_EN_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_CONN_ON_STEP4,
+				MT8186_TOP_AXI_PROT_EN_SET,
+				MT8186_TOP_AXI_PROT_EN_CLR,
+				MT8186_TOP_AXI_PROT_EN_STA),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+	[MT8186_POWER_DOMAIN_CSIRX_TOP] = {
+		.name = "csirx_top",
+		.sta_mask = BIT(6),
+		.ctl_offs = 0x318,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_ADSP_AO] = {
+		.name = "adsp_ao",
+		.sta_mask = BIT(17),
+		.ctl_offs = 0x9FC,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_ADSP_INFRA] = {
+		.name = "adsp_infra",
+		.sta_mask = BIT(10),
+		.ctl_offs = 0x9F8,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8186_POWER_DOMAIN_ADSP_TOP] = {
+		.name = "adsp_top",
+		.sta_mask = BIT(31),
+		.ctl_offs = 0x3E4,
+		.pwr_sta_offs = 0x16C,
+		.pwr_sta2nd_offs = 0x170,
+		.sram_pdn_bits = BIT(8),
+		.sram_pdn_ack_bits = BIT(12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_3_ADSP_TOP_STEP1,
+				MT8186_TOP_AXI_PROT_EN_3_SET,
+				MT8186_TOP_AXI_PROT_EN_3_CLR,
+				MT8186_TOP_AXI_PROT_EN_3_STA),
+			BUS_PROT_WR_IGN(MT8186_TOP_AXI_PROT_EN_3_ADSP_TOP_STEP2,
+				MT8186_TOP_AXI_PROT_EN_3_SET,
+				MT8186_TOP_AXI_PROT_EN_3_CLR,
+				MT8186_TOP_AXI_PROT_EN_3_STA),
+		},
+		.caps = MTK_SCPD_SRAM_ISO | MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_ACTIVE_WAKEUP,
+	},
+};
+
+static const struct scpsys_soc_data mt8186_scpsys_data = {
+	.domains_data = scpsys_domain_data_mt8186,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8186),
+};
+
+#endif /* __SOC_MEDIATEK_MT8186_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 61973a306e97..5ced254b082b 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -19,6 +19,7 @@
 #include "mt8167-pm-domains.h"
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
+#include "mt8186-pm-domains.h"
 #include "mt8192-pm-domains.h"
 #include "mt8195-pm-domains.h"
 
@@ -566,6 +567,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8183-power-controller",
 		.data = &mt8183_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8186-power-controller",
+		.data = &mt8186_scpsys_data,
+	},
 	{
 		.compatible = "mediatek,mt8192-power-controller",
 		.data = &mt8192_scpsys_data,
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index d858e0bab7a2..8a1c2040a28e 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -140,6 +140,54 @@
 #define MT8192_TOP_AXI_PROT_EN_MM_2_MDP_2ND		BIT(13)
 #define MT8192_TOP_AXI_PROT_EN_VDNR_CAM			BIT(21)
 
+#define MT8186_TOP_AXI_PROT_EN_SET			(0x2A0)
+#define MT8186_TOP_AXI_PROT_EN_CLR			(0x2A4)
+#define MT8186_TOP_AXI_PROT_EN_STA			(0x228)
+#define MT8186_TOP_AXI_PROT_EN_1_SET			(0x2A8)
+#define MT8186_TOP_AXI_PROT_EN_1_CLR			(0x2AC)
+#define MT8186_TOP_AXI_PROT_EN_1_STA			(0x258)
+#define MT8186_TOP_AXI_PROT_EN_2_SET			(0x2B0)
+#define MT8186_TOP_AXI_PROT_EN_2_CLR			(0x2B4)
+#define MT8186_TOP_AXI_PROT_EN_2_STA			(0x26C)
+#define MT8186_TOP_AXI_PROT_EN_3_SET			(0x2B8)
+#define MT8186_TOP_AXI_PROT_EN_3_CLR			(0x2BC)
+#define MT8186_TOP_AXI_PROT_EN_3_STA			(0x2C8)
+
+/* MFG1 */
+#define MT8186_TOP_AXI_PROT_EN_1_MFG1_STEP1		(GENMASK(28, 27))
+#define MT8186_TOP_AXI_PROT_EN_MFG1_STEP2		(GENMASK(22, 21))
+#define MT8186_TOP_AXI_PROT_EN_MFG1_STEP3		(BIT(25))
+#define MT8186_TOP_AXI_PROT_EN_1_MFG1_STEP4		(BIT(29))
+/* DIS */
+#define MT8186_TOP_AXI_PROT_EN_1_DIS_STEP1		(GENMASK(12, 11))
+#define MT8186_TOP_AXI_PROT_EN_DIS_STEP2		(GENMASK(2, 1) | GENMASK(11, 10))
+/* IMG */
+#define MT8186_TOP_AXI_PROT_EN_1_IMG_STEP1		(BIT(23))
+#define MT8186_TOP_AXI_PROT_EN_1_IMG_STEP2		(BIT(15))
+/* IPE */
+#define MT8186_TOP_AXI_PROT_EN_1_IPE_STEP1		(BIT(24))
+#define MT8186_TOP_AXI_PROT_EN_1_IPE_STEP2		(BIT(16))
+/* CAM */
+#define MT8186_TOP_AXI_PROT_EN_1_CAM_STEP1		(GENMASK(22, 21))
+#define MT8186_TOP_AXI_PROT_EN_1_CAM_STEP2		(GENMASK(14, 13))
+/* VENC */
+#define MT8186_TOP_AXI_PROT_EN_1_VENC_STEP1		(BIT(31))
+#define MT8186_TOP_AXI_PROT_EN_1_VENC_STEP2		(BIT(19))
+/* VDEC */
+#define MT8186_TOP_AXI_PROT_EN_1_VDEC_STEP1		(BIT(30))
+#define MT8186_TOP_AXI_PROT_EN_1_VDEC_STEP2		(BIT(17))
+/* WPE */
+#define MT8186_TOP_AXI_PROT_EN_2_WPE_STEP1		(BIT(17))
+#define MT8186_TOP_AXI_PROT_EN_2_WPE_STEP2		(BIT(16))
+/* CONN_ON */
+#define MT8186_TOP_AXI_PROT_EN_1_CONN_ON_STEP1		(BIT(18))
+#define MT8186_TOP_AXI_PROT_EN_CONN_ON_STEP2		(BIT(14))
+#define MT8186_TOP_AXI_PROT_EN_CONN_ON_STEP3		(BIT(13))
+#define MT8186_TOP_AXI_PROT_EN_CONN_ON_STEP4		(BIT(16))
+/* ADSP_TOP */
+#define MT8186_TOP_AXI_PROT_EN_3_ADSP_TOP_STEP1		(GENMASK(12, 11))
+#define MT8186_TOP_AXI_PROT_EN_3_ADSP_TOP_STEP2		(GENMASK(1, 0))
+
 #define MT8183_TOP_AXI_PROT_EN_STA1			0x228
 #define MT8183_TOP_AXI_PROT_EN_STA1_1			0x258
 #define MT8183_TOP_AXI_PROT_EN_SET			0x2a0
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
