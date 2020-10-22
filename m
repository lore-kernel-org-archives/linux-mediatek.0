Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UPPERCASE_50_75,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991CDC388F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:56:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D16223BF
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 12:56:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T0ObTTXI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kgDYDVua"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D16223BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vfXZnoTt3zrAT3kVVUEJyE8W1AeLEpqOGuKsyervwA0=; b=T0ObTTXIrkfVX1mHaI8glE1B2
	I26o45djVZYk14ZbgjLZ5iWNzJRYHxsZPy5iYbuE6QHZWRPQMyLvIw5sFWaCqIDG01wxvB0kmlWo2
	sWC3pctJGQO3sT3TWfyc8qiYtA9h6HM52i5pv0JkxirvuJNoeA9dwlSvGQ/cjiHRDk4PeCk6ju0pp
	xjfgWa5FdbiuhhiuFsSsVvOUTUxsBvC93GU2C6zr/Qkiam5F4lmIuNpbl8xsMcAPJX4g0FvXk5OYQ
	OVNnnjR5iYr1/9OGlh001UaWZufnPRaDqIxRoXKsbGROkJXFrENpL217Ye3YnLOaM2FgRpM5pnHdD
	AWwFulLLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVa84-0002cx-Kz; Thu, 22 Oct 2020 12:55:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa0p-0007Bs-2P; Thu, 22 Oct 2020 12:48:19 +0000
X-UUID: 875015e55f444669aa450e72f3abfd82-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=o1PXqqGSzmNF7ctuJUoykFZ6xviuU0qYJD17rIqWnxs=; 
 b=kgDYDVuay8taKN0iL0+ENfPiuqj5O1+kwTHDrMiySi3KtROTV4NfydddeukZI/EpIN/aFm8fb8lb8rL/tS8bci4N0td0oBaCvtfkkM/kll3AedJU2C3BnAOURH7vOBuf++Dx1aJqhqP4wqH9HhVIw4dMGzAqIZdGofrTeK9C/7I=;
X-UUID: 875015e55f444669aa450e72f3abfd82-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 490707875; Thu, 22 Oct 2020 04:47:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:47:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:47:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:47:39 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH v2 3/4] soc: mediatek: pm-domains: Add support for mt8192
Date: Thu, 22 Oct 2020 20:47:36 +0800
Message-ID: <1603370857-30646-4-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
References: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084811_423642_1A2E772B 
X-CRM114-Status: GOOD (  14.69  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the needed board data to support mt8192 SoC.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 290 +++++++++++++++++++++++++++++++++-
 include/linux/soc/mediatek/infracfg.h |  56 +++++++
 2 files changed, 345 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 50a7ae1..a3c2f7e 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -17,6 +17,7 @@
 
 #include <dt-bindings/power/mt8173-power.h>
 #include <dt-bindings/power/mt8183-power.h>
+#include <dt-bindings/power/mt8192-power.h>
 
 #define MTK_POLL_DELAY_US   10
 #define MTK_POLL_TIMEOUT    USEC_PER_SEC
@@ -61,7 +62,7 @@
 #define PWR_STATUS_AUDIO		BIT(24)
 #define PWR_STATUS_USB			BIT(25)
 
-#define SPM_MAX_BUS_PROT_DATA		3
+#define SPM_MAX_BUS_PROT_DATA		5
 
 #define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
 		.bus_prot_mask = (_mask),			\
@@ -922,6 +923,282 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 	},
 };
 
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
 static const struct scpsys_soc_data mt8173_scpsys_data = {
 	.domains = scpsys_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8173),
@@ -936,6 +1213,13 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 	.pwr_sta2nd_offs = 0x0184
 };
 
+static const struct scpsys_soc_data mt8192_scpsys_data = {
+	.domains = scpsys_domain_data_mt8192,
+	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8192),
+	.pwr_sta_offs = 0x016c,
+	.pwr_sta2nd_offs = 0x0170,
+};
+
 static const struct of_device_id scpsys_of_match[] = {
 	{
 		.compatible = "mediatek,mt8173-power-controller",
@@ -945,6 +1229,10 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys)
 		.compatible = "mediatek,mt8183-power-controller",
 		.data = &mt8183_scpsys_data,
 	},
+	{
+		.compatible = "mediatek,mt8192-power-controller",
+		.data = &mt8192_scpsys_data,
+	},
 	{ }
 };
 
diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
index 826ed51..122db6b 100644
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
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
