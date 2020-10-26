Return-Path: <SRS0=oVGr=EB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD516C4363A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:02:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C545F222C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2020 18:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wzFVHL6o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C545F222C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4CrL0yAdQBJSI4TTW1QvU3n52h4/FWZxYOgbPYEkwAY=; b=wzFVHL6o+pcxjvW5A0N3yNlpA
	95IwsBwmGp6MkKZ2r/qypJoa396vpEzi4MSj22qlAHVdOWEYaxeVDwzQJIbqLo9qRdsPoCF6PBVP3
	xlIgPM5SjZm32wk+uWq85Kcl4QgjuQ500UC0JIMyGVyMemddLaBuqd4pLjIXmHVfqDHdUFNALUwZA
	iymwrUsq3jjkXpZtJ7HJH3e3GGcKBNOzCYN7JoSwWEOeZlr2T/fjBIIES/I3vB6th0hFR/I1lGGnL
	sp3VT94mfLz3fVhpIH8cklkpLy6zLd5YwWeKpLPr6wle0Mfrz5cp1vclQOvmP286pSazh0Zp6BQjI
	2ZMj/X3uQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX6oO-0002VH-IW; Mon, 26 Oct 2020 18:01:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX6ij-0007z6-U7; Mon, 26 Oct 2020 17:55:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 879D01F44FD5
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/16] soc: mediatek: pm-domains: Add support for mt8192
Date: Mon, 26 Oct 2020 18:55:25 +0100
Message-Id: <20201026175526.2915399-17-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026175526.2915399-1-enric.balletbo@collabora.com>
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_135550_257221_9D6DF7F1 
X-CRM114-Status: GOOD (  17.91  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Miles Chen <miles.chen@mediatek.com>, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Weiyi Lu <weiyi.lu@mediatek.com>

Add the needed board data to support mt8192 SoC.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v3: None
Changes in v2: None

 drivers/soc/mediatek/mt8192-pm-domains.h | 292 +++++++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
 drivers/soc/mediatek/mtk-pm-domains.h    |   2 +-
 include/linux/soc/mediatek/infracfg.h    |  56 +++++
 4 files changed, 354 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soc/mediatek/mt8192-pm-domains.h

diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
new file mode 100644
index 000000000000..b4bdddb7c817
--- /dev/null
+++ b/drivers/soc/mediatek/mt8192-pm-domains.h
@@ -0,0 +1,292 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8192_PM_DOMAINS_H
+#define __SOC_MEDIATEK_MT8192_PM_DOMAINS_H
+
+#include "mtk-pm-domains.h"
+#include <dt-bindings/power/mt8192-power.h>
+
+/*
+ * MT8192 power domain support
+ */
+
+static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
+	[MT8192_POWER_DOMAIN_AUDIO] = {
+		.sta_mask = BIT(21),
+		.ctl_offs = 0x0354,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_2_AUDIO,
+				    MT8192_TOP_AXI_PROT_EN_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_2_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_CONN] = {
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = 0x0304,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_CONN,
+				    MT8192_TOP_AXI_PROT_EN_SET,
+				    MT8192_TOP_AXI_PROT_EN_CLR,
+				    MT8192_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_CONN_2ND,
+				    MT8192_TOP_AXI_PROT_EN_SET,
+				    MT8192_TOP_AXI_PROT_EN_CLR,
+				    MT8192_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_1_CONN,
+				    MT8192_TOP_AXI_PROT_EN_1_SET,
+				    MT8192_TOP_AXI_PROT_EN_1_CLR,
+				    MT8192_TOP_AXI_PROT_EN_1_STA1),
+		},
+		.caps = MTK_SCPD_KEEP_DEFAULT_OFF,
+	},
+	[MT8192_POWER_DOMAIN_MFG0] = {
+		.sta_mask = BIT(2),
+		.ctl_offs = 0x0308,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG1] = {
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x030c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_1_MFG1,
+				    MT8192_TOP_AXI_PROT_EN_1_SET,
+				    MT8192_TOP_AXI_PROT_EN_1_CLR,
+				    MT8192_TOP_AXI_PROT_EN_1_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_2_MFG1,
+				    MT8192_TOP_AXI_PROT_EN_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_2_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MFG1,
+				    MT8192_TOP_AXI_PROT_EN_SET,
+				    MT8192_TOP_AXI_PROT_EN_CLR,
+				    MT8192_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_2_MFG1_2ND,
+				    MT8192_TOP_AXI_PROT_EN_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_2_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_MFG2] = {
+		.sta_mask = BIT(4),
+		.ctl_offs = 0x0310,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG3] = {
+		.sta_mask = BIT(5),
+		.ctl_offs = 0x0314,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG4] = {
+		.sta_mask = BIT(6),
+		.ctl_offs = 0x0318,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG5] = {
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x031c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG6] = {
+		.sta_mask = BIT(8),
+		.ctl_offs = 0x0320,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_DISP] = {
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x0350,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR_IGN(MT8192_TOP_AXI_PROT_EN_MM_DISP,
+					MT8192_TOP_AXI_PROT_EN_MM_SET,
+					MT8192_TOP_AXI_PROT_EN_MM_CLR,
+					MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR_IGN(MT8192_TOP_AXI_PROT_EN_MM_2_DISP,
+					MT8192_TOP_AXI_PROT_EN_MM_2_SET,
+					MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
+					MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_DISP,
+				    MT8192_TOP_AXI_PROT_EN_SET,
+				    MT8192_TOP_AXI_PROT_EN_CLR,
+				    MT8192_TOP_AXI_PROT_EN_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_DISP_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_2_DISP_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_IPE] = {
+		.sta_mask = BIT(14),
+		.ctl_offs = 0x0338,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_IPE,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_IPE_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_ISP] = {
+		.sta_mask = BIT(12),
+		.ctl_offs = 0x0330,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_2_ISP,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_2_ISP_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_ISP2] = {
+		.sta_mask = BIT(13),
+		.ctl_offs = 0x0334,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_ISP2,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_ISP2_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_MDP] = {
+		.sta_mask = BIT(19),
+		.ctl_offs = 0x034c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_2_MDP,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_2_MDP_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_2_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_VENC] = {
+		.sta_mask = BIT(17),
+		.ctl_offs = 0x0344,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_VENC,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_VENC_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_VDEC] = {
+		.sta_mask = BIT(15),
+		.ctl_offs = 0x033c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_VDEC,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_VDEC_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_VDEC2] = {
+		.sta_mask = BIT(16),
+		.ctl_offs = 0x0340,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_CAM] = {
+		.sta_mask = BIT(23),
+		.ctl_offs = 0x035c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_infracfg = {
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_2_CAM,
+				    MT8192_TOP_AXI_PROT_EN_2_SET,
+				    MT8192_TOP_AXI_PROT_EN_2_CLR,
+				    MT8192_TOP_AXI_PROT_EN_2_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_CAM,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_1_CAM,
+				    MT8192_TOP_AXI_PROT_EN_1_SET,
+				    MT8192_TOP_AXI_PROT_EN_1_CLR,
+				    MT8192_TOP_AXI_PROT_EN_1_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_MM_CAM_2ND,
+				    MT8192_TOP_AXI_PROT_EN_MM_SET,
+				    MT8192_TOP_AXI_PROT_EN_MM_CLR,
+				    MT8192_TOP_AXI_PROT_EN_MM_STA1),
+			BUS_PROT_WR(MT8192_TOP_AXI_PROT_EN_VDNR_CAM,
+				    MT8192_TOP_AXI_PROT_EN_VDNR_SET,
+				    MT8192_TOP_AXI_PROT_EN_VDNR_CLR,
+				    MT8192_TOP_AXI_PROT_EN_VDNR_STA1),
+		},
+	},
+	[MT8192_POWER_DOMAIN_CAM_RAWA] = {
+		.sta_mask = BIT(24),
+		.ctl_offs = 0x0360,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_CAM_RAWB] = {
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x0364,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_CAM_RAWC] = {
+		.sta_mask = BIT(26),
+		.ctl_offs = 0x0368,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+};
+
+static const struct scpsys_soc_data mt8192_scpsys_data = {
+	.domains = scpsys_domain_data_mt8192,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8192),
+	.pwr_sta_offs = 0x016c,
+	.pwr_sta2nd_offs = 0x0170,
+};
+
+#endif /* __SOC_MEDIATEK_MT8192_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index fe0e955076a0..69f8e5458731 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -17,6 +17,7 @@
 
 #include "mt8173-pm-domains.h"
 #include "mt8183-pm-domains.h"
+#include "mt8192-pm-domains.h"
 
 #define MTK_POLL_DELAY_US		10
 #define MTK_POLL_TIMEOUT		USEC_PER_SEC
@@ -522,6 +523,10 @@ static const struct of_device_id scpsys_of_match[] = {
 		.compatible = "mediatek,mt8183-power-controller",
 		.data = &mt8183_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8192-power-controller",
+		.data = &mt8192_scpsys_data,
+	},
 	{ }
 };
 
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 0fa6a938b40c..eda453f55126 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -35,7 +35,7 @@
 #define PWR_STATUS_AUDIO		BIT(24)
 #define PWR_STATUS_USB			BIT(25)
 
-#define SPM_MAX_BUS_PROT_DATA		3
+#define SPM_MAX_BUS_PROT_DATA		5
 
 #define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
 		.bus_prot_mask = (_mask),			\
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 9d01e32e19bc..e7842debc05d 100644
--- a/include/linux/soc/mediatek/infracfg.h
+++ b/include/linux/soc/mediatek/infracfg.h
@@ -2,6 +2,62 @@
 #ifndef __SOC_MEDIATEK_INFRACFG_H
 #define __SOC_MEDIATEK_INFRACFG_H
 
+#define MT8192_TOP_AXI_PROT_EN_STA1			0x228
+#define MT8192_TOP_AXI_PROT_EN_1_STA1			0x258
+#define MT8192_TOP_AXI_PROT_EN_SET			0x2a0
+#define MT8192_TOP_AXI_PROT_EN_CLR			0x2a4
+#define MT8192_TOP_AXI_PROT_EN_1_SET			0x2a8
+#define MT8192_TOP_AXI_PROT_EN_1_CLR			0x2ac
+#define MT8192_TOP_AXI_PROT_EN_MM_SET			0x2d4
+#define MT8192_TOP_AXI_PROT_EN_MM_CLR			0x2d8
+#define MT8192_TOP_AXI_PROT_EN_MM_STA1			0x2ec
+#define MT8192_TOP_AXI_PROT_EN_2_SET			0x714
+#define MT8192_TOP_AXI_PROT_EN_2_CLR			0x718
+#define MT8192_TOP_AXI_PROT_EN_2_STA1			0x724
+#define MT8192_TOP_AXI_PROT_EN_VDNR_SET			0xb84
+#define MT8192_TOP_AXI_PROT_EN_VDNR_CLR			0xb88
+#define MT8192_TOP_AXI_PROT_EN_VDNR_STA1		0xb90
+#define MT8192_TOP_AXI_PROT_EN_MM_2_SET			0xdcc
+#define MT8192_TOP_AXI_PROT_EN_MM_2_CLR			0xdd0
+#define MT8192_TOP_AXI_PROT_EN_MM_2_STA1		0xdd8
+
+#define MT8192_TOP_AXI_PROT_EN_DISP			(BIT(6) | BIT(23))
+#define MT8192_TOP_AXI_PROT_EN_CONN			(BIT(13) | BIT(18))
+#define MT8192_TOP_AXI_PROT_EN_CONN_2ND			BIT(14)
+#define MT8192_TOP_AXI_PROT_EN_MFG1			GENMASK(22, 21)
+#define MT8192_TOP_AXI_PROT_EN_1_CONN			BIT(10)
+#define MT8192_TOP_AXI_PROT_EN_1_MFG1			BIT(21)
+#define MT8192_TOP_AXI_PROT_EN_1_CAM			BIT(22)
+#define MT8192_TOP_AXI_PROT_EN_2_CAM			BIT(0)
+#define MT8192_TOP_AXI_PROT_EN_2_ADSP			BIT(3)
+#define MT8192_TOP_AXI_PROT_EN_2_AUDIO			BIT(4)
+#define MT8192_TOP_AXI_PROT_EN_2_MFG1			GENMASK(6, 5)
+#define MT8192_TOP_AXI_PROT_EN_2_MFG1_2ND		BIT(7)
+#define MT8192_TOP_AXI_PROT_EN_MM_CAM			(BIT(0) | BIT(2))
+#define MT8192_TOP_AXI_PROT_EN_MM_DISP			(BIT(0) | BIT(2) | \
+							BIT(10) | BIT(12) | \
+							BIT(14) | BIT(16) | \
+							BIT(24) | BIT(26))
+#define MT8192_TOP_AXI_PROT_EN_MM_CAM_2ND		(BIT(1) | BIT(3))
+#define MT8192_TOP_AXI_PROT_EN_MM_DISP_2ND		(BIT(1) | BIT(3) | \
+							BIT(15) | BIT(17) | \
+							BIT(25) | BIT(27))
+#define MT8192_TOP_AXI_PROT_EN_MM_ISP2			BIT(14)
+#define MT8192_TOP_AXI_PROT_EN_MM_ISP2_2ND		BIT(15)
+#define MT8192_TOP_AXI_PROT_EN_MM_IPE			BIT(16)
+#define MT8192_TOP_AXI_PROT_EN_MM_IPE_2ND		BIT(17)
+#define MT8192_TOP_AXI_PROT_EN_MM_VDEC			BIT(24)
+#define MT8192_TOP_AXI_PROT_EN_MM_VDEC_2ND		BIT(25)
+#define MT8192_TOP_AXI_PROT_EN_MM_VENC			BIT(26)
+#define MT8192_TOP_AXI_PROT_EN_MM_VENC_2ND		BIT(27)
+#define MT8192_TOP_AXI_PROT_EN_MM_2_ISP			BIT(8)
+#define MT8192_TOP_AXI_PROT_EN_MM_2_DISP		(BIT(8) | BIT(12))
+#define MT8192_TOP_AXI_PROT_EN_MM_2_ISP_2ND		BIT(9)
+#define MT8192_TOP_AXI_PROT_EN_MM_2_DISP_2ND		(BIT(9) | BIT(13))
+#define MT8192_TOP_AXI_PROT_EN_MM_2_MDP			BIT(12)
+#define MT8192_TOP_AXI_PROT_EN_MM_2_MDP_2ND		BIT(13)
+#define MT8192_TOP_AXI_PROT_EN_VDNR_CAM			BIT(21)
+
 #define MT8183_TOP_AXI_PROT_EN_STA1			0x228
 #define MT8183_TOP_AXI_PROT_EN_STA1_1			0x258
 #define MT8183_TOP_AXI_PROT_EN_SET			0x2a0
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
