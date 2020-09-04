Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067CBC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4216206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 06:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FEPt8tR3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nLz+Ou+Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4216206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v8os/til3o1UVHtW0E96/BYpsJqOTEAy2uXWy2c4+i0=; b=FEPt8tR37pW2v2vIRqOsyzVmZ
	WsjUol5T71VjuZ9PBFrv+I4+EiDI8hQvGoYuufeq9vYba+YQHjDTuUjaeFseeSbQ+jQyWsK2MBT+p
	4NBoOTuQXK9f1zJEpU59ZcDbLYqvjytqizWhvR7zp2AWQrimeFsvG//XVPkFGcOAhJKfno/a0rWKx
	t7dvu0QqoR/SmESn6vH4BnD/LjTKDQ+KgjjpDZ2h8JmVEILge/rj8coWlwQ0Fu0yvFWdvmORkNhrX
	5CqCcfgeDhyHmLpl+9En3/FR2qc55VtUUkDiLL05dbrrrlx7XxY10RP/RnUFDYyAqpfBB7P6FPeJ8
	vQ1EQZm/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE5TT-00033V-Fp; Fri, 04 Sep 2020 06:45:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE5TB-0002w4-Nu; Fri, 04 Sep 2020 06:45:11 +0000
X-UUID: 439074698e4f4e538e354140ac862df2-20200903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7nUsk/pHfAG/iSAFVTR/NFc5f055hzi8UAiE9j6GLQo=; 
 b=nLz+Ou+YeJSCVlWWoLWxP1mnDuZwKSSKJUayi8loiuCQddUNCsMi1K4KrsaB+rndJkPHiKTcDKLgJQ3XcPsTQcgED54YergT/bNNDn+Bofz229nmSu1MVMBD1ztAcQtkiIDwfUVwBunSlbVMDWK8qyGYPlUbXTDLydmRgY2H3lQ=;
X-UUID: 439074698e4f4e538e354140ac862df2-20200903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1748407437; Thu, 03 Sep 2020 22:44:59 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Sep 2020 23:44:58 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Sep 2020 14:44:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 4 Sep 2020 14:44:55 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Subject: [PATCH 2/3] soc: mediatek: Add MT8192 scpsys support
Date: Fri, 4 Sep 2020 14:44:54 +0800
Message-ID: <1599201895-11013-3-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
References: <1599201895-11013-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_024509_991642_F4E1AA3B 
X-CRM114-Status: GOOD (  14.30  )
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

Add scpsys driver for MT8192

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 297 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 297 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 7158863b..19a0c7e 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/mt7623a-power.h>
 #include <dt-bindings/power/mt8173-power.h>
 #include <dt-bindings/power/mt8183-power.h>
+#include <dt-bindings/power/mt8192-power.h>
 
 #define MTK_POLL_DELAY_US   10
 #define MTK_POLL_TIMEOUT    USEC_PER_SEC
@@ -129,6 +130,43 @@
 #define MT8183_SMI_COMMON_SMI_CLAMP_VPU_TOP		(BIT(5) | BIT(6))
 #define MT8183_SMI_COMMON_SMI_CLAMP_VDEC		BIT(7)
 
+#define MT8192_TOP_AXI_PROT_EN_DISP			(BIT(6) | BIT(23))
+#define MT8192_TOP_AXI_PROT_EN_CONN			(BIT(13) | BIT(18))
+#define MT8192_TOP_AXI_PROT_EN_CONN_2ND		BIT(14)
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
+#define MT8192_TOP_AXI_PROT_EN_MM_2_ISP		BIT(8)
+#define MT8192_TOP_AXI_PROT_EN_MM_2_DISP		(BIT(8) | BIT(12))
+#define MT8192_TOP_AXI_PROT_EN_MM_2_ISP_2ND		BIT(9)
+#define MT8192_TOP_AXI_PROT_EN_MM_2_DISP_2ND		(BIT(9) | BIT(13))
+#define MT8192_TOP_AXI_PROT_EN_MM_2_MDP		BIT(12)
+#define MT8192_TOP_AXI_PROT_EN_MM_2_MDP_2ND		BIT(13)
+#define MT8192_TOP_AXI_PROT_EN_VDNR_CAM		BIT(21)
+
 #define MAX_CLKS	3
 #define MAX_SUBSYS_CLKS 10
 
@@ -1463,6 +1501,253 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	},
 };
 
+/*
+ * MT8192 power domain support
+ */
+
+static const struct scp_domain_data scp_domain_data_mt8192[] = {
+	[MT8192_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = BIT(21),
+		.ctl_offs = 0x0354,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"audio", "audio1", "audio2"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x714, 0x718, 0x710, 0x724,
+				MT8192_TOP_AXI_PROT_EN_2_AUDIO),
+		},
+	},
+	[MT8192_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = 0x0304,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.basic_clk_name = {"conn"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0x220, 0x228,
+				MT8192_TOP_AXI_PROT_EN_CONN),
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0x220, 0x228,
+				MT8192_TOP_AXI_PROT_EN_CONN_2ND),
+			BUS_PROT(IFR_TYPE, 0x2a8, 0x2ac, 0x250, 0x258,
+				MT8192_TOP_AXI_PROT_EN_1_CONN),
+		},
+	},
+	[MT8192_POWER_DOMAIN_MFG0] = {
+		.name = "mfg",
+		.sta_mask = BIT(2),
+		.ctl_offs = 0x0308,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"mfg"},
+	},
+	[MT8192_POWER_DOMAIN_MFG1] = {
+		.name = "mfg1",
+		.sta_mask = BIT(3),
+		.ctl_offs = 0x030c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2a8, 0x2ac, 0x250, 0x258,
+				MT8192_TOP_AXI_PROT_EN_1_MFG1),
+			BUS_PROT(IFR_TYPE, 0x714, 0x718, 0x710, 0x724,
+				MT8192_TOP_AXI_PROT_EN_2_MFG1),
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0x220, 0x228,
+				MT8192_TOP_AXI_PROT_EN_MFG1),
+			BUS_PROT(IFR_TYPE, 0x714, 0x718, 0x710, 0x724,
+				MT8192_TOP_AXI_PROT_EN_2_MFG1_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_MFG2] = {
+		.name = "mfg2",
+		.sta_mask = BIT(4),
+		.ctl_offs = 0x0310,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG3] = {
+		.name = "mfg3",
+		.sta_mask = BIT(5),
+		.ctl_offs = 0x0314,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG4] = {
+		.name = "mfg4",
+		.sta_mask = BIT(6),
+		.ctl_offs = 0x0318,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG5] = {
+		.name = "mfg5",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x031c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_MFG6] = {
+		.name = "mfg6",
+		.sta_mask = BIT(8),
+		.ctl_offs = 0x0320,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_DISP] = {
+		.name = "disp",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x0350,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"disp", "disp1"},
+		.bp_table = {
+			BUS_PROT_IGN(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_DISP),
+			BUS_PROT_IGN(IFR_TYPE, 0xdcc, 0xdd0, 0xdc8, 0xdd8,
+				MT8192_TOP_AXI_PROT_EN_MM_2_DISP),
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0x220, 0x228,
+				MT8192_TOP_AXI_PROT_EN_DISP),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_DISP_2ND),
+			BUS_PROT(IFR_TYPE, 0xdcc, 0xdd0, 0xdc8, 0xdd8,
+				MT8192_TOP_AXI_PROT_EN_MM_2_DISP_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_IPE] = {
+		.name = "ipe",
+		.sta_mask = BIT(14),
+		.ctl_offs = 0x0338,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"ipe"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_IPE),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_IPE_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = BIT(12),
+		.ctl_offs = 0x0330,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"isp"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0xdcc, 0xdd0, 0xdc8, 0xdd8,
+				MT8192_TOP_AXI_PROT_EN_MM_2_ISP),
+			BUS_PROT(IFR_TYPE, 0xdcc, 0xdd0, 0xdc8, 0xdd8,
+				MT8192_TOP_AXI_PROT_EN_MM_2_ISP_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_ISP2] = {
+		.name = "isp2",
+		.sta_mask = BIT(13),
+		.ctl_offs = 0x0334,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"isp1"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_ISP2),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_ISP2_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_MDP] = {
+		.name = "mdp",
+		.sta_mask = BIT(19),
+		.ctl_offs = 0x034c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"mdp"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0xdcc, 0xdd0, 0xdc8, 0xdd8,
+				MT8192_TOP_AXI_PROT_EN_MM_2_MDP),
+			BUS_PROT(IFR_TYPE, 0xdcc, 0xdd0, 0xdc8, 0xdd8,
+				MT8192_TOP_AXI_PROT_EN_MM_2_MDP_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = BIT(17),
+		.ctl_offs = 0x0344,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"venc"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_VENC),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_VENC_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = BIT(15),
+		.ctl_offs = 0x033c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"vdec"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_VDEC),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_VDEC_2ND),
+		},
+	},
+	[MT8192_POWER_DOMAIN_VDEC2] = {
+		.name = "vdec2",
+		.sta_mask = BIT(16),
+		.ctl_offs = 0x0340,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_CAM] = {
+		.name = "cam",
+		.sta_mask = BIT(23),
+		.ctl_offs = 0x035c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"cam"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x714, 0x718, 0x710, 0x724,
+				MT8192_TOP_AXI_PROT_EN_2_CAM),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_CAM),
+			BUS_PROT(IFR_TYPE, 0x2a8, 0x2ac, 0x250, 0x258,
+				MT8192_TOP_AXI_PROT_EN_1_CAM),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0x2d0, 0x2ec,
+				MT8192_TOP_AXI_PROT_EN_MM_CAM_2ND),
+			BUS_PROT(IFR_TYPE, 0xb84, 0xb88, 0xb80, 0xb90,
+				MT8192_TOP_AXI_PROT_EN_VDNR_CAM),
+		},
+	},
+	[MT8192_POWER_DOMAIN_CAM_RAWA] = {
+		.name = "cam_rawa",
+		.sta_mask = BIT(24),
+		.ctl_offs = 0x0360,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_CAM_RAWB] = {
+		.name = "cam_rawb",
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x0364,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8192_POWER_DOMAIN_CAM_RAWC] = {
+		.name = "cam_rawc",
+		.sta_mask = BIT(26),
+		.ctl_offs = 0x0368,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+};
+
 static const struct scp_soc_data mt2701_data = {
 	.domains = scp_domain_data_mt2701,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt2701),
@@ -1532,6 +1817,15 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	}
 };
 
+static const struct scp_soc_data mt8192_data = {
+	.domains = scp_domain_data_mt8192,
+	.num_domains = ARRAY_SIZE(scp_domain_data_mt8192),
+	.regs = {
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
+	},
+};
+
 /*
  * scpsys driver init
  */
@@ -1559,6 +1853,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.compatible = "mediatek,mt8183-scpsys",
 		.data = &mt8183_data,
 	}, {
+		.compatible = "mediatek,mt8192-scpsys",
+		.data = &mt8192_data,
+	}, {
 		/* sentinel */
 	}
 };
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
