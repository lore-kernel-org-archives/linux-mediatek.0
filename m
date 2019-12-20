Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E925BC3F68F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:52:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70AD824676
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 03:52:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qar/02xm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AMjRp4PX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70AD824676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cciXTuIfA3HrtwLn1b5EizotoqdTWYKf8O0X0XmSR3Y=; b=Qar/02xm4hhlkP
	L2VXv/e+05X01OyUNfG35iQXuoIgPfTphjA4qkDwGP4NPuGkuIsuqjyFVD+KFobx6velI3T5CQZ5A
	rJvUxJOJ2+naqOQiU1uwD25mCIMNzcpGZfvaanpka6DeFBJJryS3EmS3PtTLU5OSts81mCjS7PpXc
	Mwv5y990DG6zH1+fbFATttzTo42QfqiULr9JALAKaVJFskTcHBS9c6aTw1paLJRUexzP5ksxPSjGt
	e/8A4pDgKGgTlr+z4Lpt733O0HAhWtCHClNAgZIEVr9z5x+RHWbszxDJD96hoETlggHaArlo06M+l
	tXxiaiSwazO5UPRqROEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ii9Kv-0007wX-Jq; Fri, 20 Dec 2019 03:52:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ii9Jp-0006r7-4N; Fri, 20 Dec 2019 03:51:15 +0000
X-UUID: 92f5268c676a4b66a54cadef6b28d550-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=uYspoCm4xFu6yAacCtn30TfK837cniUsJrXfoROjvYo=; 
 b=AMjRp4PXU0ssNArWC5+SXlrAYLv1RLDB0DTN50c9C23JszW7BeHjZJfv+atyPnDklwlOp7xYk8HvU0ENr+YQtpOSy8Ip1aky1bmkGQJNCVhXyJR2ywb9DXKK2PkPJSSzQQpF6eVNFF589WDgCH2LEUOJeXWn2+l48C8VGQN0l+M=;
X-UUID: 92f5268c676a4b66a54cadef6b28d550-20191219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1618420111; Thu, 19 Dec 2019 19:51:07 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 19:46:34 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 11:45:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Dec 2019 11:46:07 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v11 08/10] soc: mediatek: Add MT8183 scpsys support
Date: Fri, 20 Dec 2019 11:46:02 +0800
Message-ID: <1576813564-23927-9-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
References: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_195113_215584_BA953920 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add scpsys driver for MT8183
And minor fix to add a comma at the end

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/soc/mediatek/mtk-scpsys.c | 233 +++++++++++++++++++++++++++++++++++++-
 drivers/soc/mediatek/scpsys-ext.h |  28 +++++
 2 files changed, 255 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 1972726..b8b72fa 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/mt7622-power.h>
 #include <dt-bindings/power/mt7623a-power.h>
 #include <dt-bindings/power/mt8173-power.h>
+#include <dt-bindings/power/mt8183-power.h>
 
 #define MTK_POLL_DELAY_US   10
 #define MTK_POLL_TIMEOUT    USEC_PER_SEC
@@ -1082,12 +1083,218 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	{MT8173_POWER_DOMAIN_MFG_2D, MT8173_POWER_DOMAIN_MFG},
 };
 
+/*
+ * MT8183 power domain support
+ */
+
+static const struct scp_domain_data scp_domain_data_mt8183[] = {
+	[MT8183_POWER_DOMAIN_AUDIO] = {
+		.name = "audio",
+		.sta_mask = PWR_STATUS_AUDIO,
+		.ctl_offs = 0x0314,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.basic_clk_name = {"audio", "audio1", "audio2"},
+	},
+	[MT8183_POWER_DOMAIN_CONN] = {
+		.name = "conn",
+		.sta_mask = PWR_STATUS_CONN,
+		.ctl_offs = 0x032c,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0, 0x228,
+				MT8183_TOP_AXI_PROT_EN_CONN),
+		},
+	},
+	[MT8183_POWER_DOMAIN_MFG_ASYNC] = {
+		.name = "mfg_async",
+		.sta_mask = PWR_STATUS_MFG_ASYNC,
+		.ctl_offs = 0x0334,
+		.sram_pdn_bits = 0,
+		.sram_pdn_ack_bits = 0,
+		.basic_clk_name = {"mfg"},
+	},
+	[MT8183_POWER_DOMAIN_MFG] = {
+		.name = "mfg",
+		.sta_mask = PWR_STATUS_MFG,
+		.ctl_offs = 0x0338,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8183_POWER_DOMAIN_MFG_CORE0] = {
+		.name = "mfg_core0",
+		.sta_mask = BIT(7),
+		.ctl_offs = 0x034c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8183_POWER_DOMAIN_MFG_CORE1] = {
+		.name = "mfg_core1",
+		.sta_mask = BIT(20),
+		.ctl_offs = 0x0310,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+	},
+	[MT8183_POWER_DOMAIN_MFG_2D] = {
+		.name = "mfg_2d",
+		.sta_mask = PWR_STATUS_MFG_2D,
+		.ctl_offs = 0x0348,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2a8, 0x2ac, 0, 0x258,
+				MT8183_TOP_AXI_PROT_EN_1_MFG),
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0, 0x228,
+				MT8183_TOP_AXI_PROT_EN_MFG),
+		},
+	},
+	[MT8183_POWER_DOMAIN_DISP] = {
+		.name = "disp",
+		.sta_mask = PWR_STATUS_DISP,
+		.ctl_offs = 0x030c,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"mm"},
+		.subsys_clk_prefix = "mm",
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2a8, 0x2ac, 0, 0x258,
+				MT8183_TOP_AXI_PROT_EN_1_DISP),
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0, 0x228,
+				MT8183_TOP_AXI_PROT_EN_DISP),
+			BUS_PROT(SMI_TYPE, 0x3c4, 0x3c8, 0, 0x3c0,
+				MT8183_SMI_COMMON_SMI_CLAMP_DISP),
+		},
+	},
+	[MT8183_POWER_DOMAIN_CAM] = {
+		.name = "cam",
+		.sta_mask = BIT(25),
+		.ctl_offs = 0x0344,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.basic_clk_name = {"cam"},
+		.subsys_clk_prefix = "cam",
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0, 0x2ec,
+				MT8183_TOP_AXI_PROT_EN_MM_CAM),
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0, 0x228,
+				MT8183_TOP_AXI_PROT_EN_CAM),
+			BUS_PROT_IGN(IFR_TYPE, 0x2d4, 0x2d8, 0, 0x2ec,
+				MT8183_TOP_AXI_PROT_EN_MM_CAM_2ND),
+			BUS_PROT(SMI_TYPE, 0x3c4, 0x3c8, 0, 0x3c0,
+				MT8183_SMI_COMMON_SMI_CLAMP_CAM),
+		},
+	},
+	[MT8183_POWER_DOMAIN_ISP] = {
+		.name = "isp",
+		.sta_mask = PWR_STATUS_ISP,
+		.ctl_offs = 0x0308,
+		.sram_pdn_bits = GENMASK(9, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.basic_clk_name = {"isp"},
+		.subsys_clk_prefix = "isp",
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0, 0x2ec,
+				MT8183_TOP_AXI_PROT_EN_MM_ISP),
+			BUS_PROT_IGN(IFR_TYPE, 0x2d4, 0x2d8, 0, 0x2ec,
+				MT8183_TOP_AXI_PROT_EN_MM_ISP_2ND),
+			BUS_PROT(SMI_TYPE, 0x3c4, 0x3c8, 0, 0x3c0,
+				MT8183_SMI_COMMON_SMI_CLAMP_ISP),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VDEC] = {
+		.name = "vdec",
+		.sta_mask = BIT(31),
+		.ctl_offs = 0x0300,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.bp_table = {
+			BUS_PROT(SMI_TYPE, 0x3c4, 0x3c8, 0, 0x3c0,
+				MT8183_SMI_COMMON_SMI_CLAMP_VDEC),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VENC] = {
+		.name = "venc",
+		.sta_mask = PWR_STATUS_VENC,
+		.ctl_offs = 0x0304,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(15, 12),
+		.bp_table = {
+			BUS_PROT(SMI_TYPE, 0x3c4, 0x3c8, 0, 0x3c0,
+				MT8183_SMI_COMMON_SMI_CLAMP_VENC),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VPU_TOP] = {
+		.name = "vpu_top",
+		.sta_mask = BIT(26),
+		.ctl_offs = 0x0324,
+		.sram_pdn_bits = GENMASK(8, 8),
+		.sram_pdn_ack_bits = GENMASK(12, 12),
+		.basic_clk_name = {"vpu", "vpu1"},
+		.subsys_clk_prefix = "vpu",
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0, 0x2ec,
+				MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP),
+			BUS_PROT(IFR_TYPE, 0x2a0, 0x2a4, 0, 0x228,
+				MT8183_TOP_AXI_PROT_EN_VPU_TOP),
+			BUS_PROT(IFR_TYPE, 0x2d4, 0x2d8, 0, 0x2ec,
+				MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP_2ND),
+			BUS_PROT(SMI_TYPE, 0x3c4, 0x3c8, 0, 0x3c0,
+				MT8183_SMI_COMMON_SMI_CLAMP_VPU_TOP),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VPU_CORE0] = {
+		.name = "vpu_core0",
+		.sta_mask = BIT(27),
+		.ctl_offs = 0x33c,
+		.sram_iso_ctrl = true,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.basic_clk_name = {"vpu2"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2c4, 0x2c8, 0, 0x2e4,
+				MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0),
+			BUS_PROT(IFR_TYPE, 0x2c4, 0x2c8, 0, 0x2e4,
+				MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0_2ND),
+		},
+	},
+	[MT8183_POWER_DOMAIN_VPU_CORE1] = {
+		.name = "vpu_core1",
+		.sta_mask = BIT(28),
+		.ctl_offs = 0x0340,
+		.sram_iso_ctrl = true,
+		.sram_pdn_bits = GENMASK(11, 8),
+		.sram_pdn_ack_bits = GENMASK(13, 12),
+		.basic_clk_name = {"vpu3"},
+		.bp_table = {
+			BUS_PROT(IFR_TYPE, 0x2c4, 0x2c8, 0, 0x2e4,
+				MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1),
+			BUS_PROT(IFR_TYPE, 0x2c4, 0x2c8, 0, 0x2e4,
+				MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1_2ND),
+		},
+	},
+};
+
+static const struct scp_subdomain scp_subdomain_mt8183[] = {
+	{MT8183_POWER_DOMAIN_MFG_ASYNC, MT8183_POWER_DOMAIN_MFG},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_2D},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_CORE0},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_CORE1},
+	{MT8183_POWER_DOMAIN_DISP, MT8183_POWER_DOMAIN_CAM},
+	{MT8183_POWER_DOMAIN_DISP, MT8183_POWER_DOMAIN_ISP},
+	{MT8183_POWER_DOMAIN_DISP, MT8183_POWER_DOMAIN_VDEC},
+	{MT8183_POWER_DOMAIN_DISP, MT8183_POWER_DOMAIN_VENC},
+	{MT8183_POWER_DOMAIN_DISP, MT8183_POWER_DOMAIN_VPU_TOP},
+	{MT8183_POWER_DOMAIN_VPU_TOP, MT8183_POWER_DOMAIN_VPU_CORE0},
+	{MT8183_POWER_DOMAIN_VPU_TOP, MT8183_POWER_DOMAIN_VPU_CORE1},
+};
+
 static const struct scp_soc_data mt2701_data = {
 	.domains = scp_domain_data_mt2701,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt2701),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1098,7 +1305,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt2712),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1109,7 +1316,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt6797),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS_MT6797,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND_MT6797,
 	},
 };
 
@@ -1118,7 +1325,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt7622),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1127,7 +1334,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_domains = ARRAY_SIZE(scp_domain_data_mt7623a),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
@@ -1138,10 +1345,21 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8173),
 	.regs = {
 		.pwr_sta_offs = SPM_PWR_STATUS,
-		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 	},
 };
 
+static const struct scp_soc_data mt8183_data = {
+	.domains = scp_domain_data_mt8183,
+	.num_domains = ARRAY_SIZE(scp_domain_data_mt8183),
+	.subdomains = scp_subdomain_mt8183,
+	.num_subdomains = ARRAY_SIZE(scp_subdomain_mt8183),
+	.regs = {
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
+	}
+};
+
 /*
  * scpsys driver init
  */
@@ -1166,6 +1384,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
 		.compatible = "mediatek,mt8173-scpsys",
 		.data = &mt8173_data,
 	}, {
+		.compatible = "mediatek,mt8183-scpsys",
+		.data = &mt8183_data,
+	}, {
 		/* sentinel */
 	}
 };
diff --git a/drivers/soc/mediatek/scpsys-ext.h b/drivers/soc/mediatek/scpsys-ext.h
index 458b2c5..0f90e5d 100644
--- a/drivers/soc/mediatek/scpsys-ext.h
+++ b/drivers/soc/mediatek/scpsys-ext.h
@@ -43,6 +43,34 @@
 #define MT8173_TOP_AXI_PROT_EN_MFG_M1		BIT(22)
 #define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT	BIT(23)
 
+#define MT8183_TOP_AXI_PROT_EN_DISP			(BIT(10) | BIT(11))
+#define MT8183_TOP_AXI_PROT_EN_CONN			(BIT(13) | BIT(14))
+#define MT8183_TOP_AXI_PROT_EN_MFG			(BIT(21) | BIT(22))
+#define MT8183_TOP_AXI_PROT_EN_CAM			BIT(28)
+#define MT8183_TOP_AXI_PROT_EN_VPU_TOP			BIT(27)
+#define MT8183_TOP_AXI_PROT_EN_1_DISP			(BIT(16) | BIT(17))
+#define MT8183_TOP_AXI_PROT_EN_1_MFG			GENMASK(21, 19)
+#define MT8183_TOP_AXI_PROT_EN_MM_ISP			(BIT(3) | BIT(8))
+#define MT8183_TOP_AXI_PROT_EN_MM_ISP_2ND		BIT(10)
+#define MT8183_TOP_AXI_PROT_EN_MM_CAM			(BIT(4) | BIT(5) | \
+							 BIT(9) | BIT(13))
+#define MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP		(GENMASK(9, 6) | \
+							 BIT(12))
+#define MT8183_TOP_AXI_PROT_EN_MM_VPU_TOP_2ND		(BIT(10) | BIT(11))
+#define MT8183_TOP_AXI_PROT_EN_MM_CAM_2ND		BIT(11)
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0_2ND	(BIT(0) | BIT(2) | \
+							 BIT(4))
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1_2ND	(BIT(1) | BIT(3) | \
+							 BIT(5))
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE0		BIT(6)
+#define MT8183_TOP_AXI_PROT_EN_MCU_VPU_CORE1		BIT(7)
+#define MT8183_SMI_COMMON_SMI_CLAMP_DISP		GENMASK(7, 0)
+#define MT8183_SMI_COMMON_SMI_CLAMP_VENC		BIT(1)
+#define MT8183_SMI_COMMON_SMI_CLAMP_ISP		BIT(2)
+#define MT8183_SMI_COMMON_SMI_CLAMP_CAM		(BIT(3) | BIT(4))
+#define MT8183_SMI_COMMON_SMI_CLAMP_VPU_TOP		(BIT(5) | BIT(6))
+#define MT8183_SMI_COMMON_SMI_CLAMP_VDEC		BIT(7)
+
 enum regmap_type {
 	INVALID_TYPE = 0,
 	IFR_TYPE,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
