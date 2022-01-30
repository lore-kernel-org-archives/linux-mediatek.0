Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B1C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 01:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdZa6PcaKRR9pxwbn1d6iDi7iqinhMNlTLLgerBEfF4=; b=yLDWbeIzVcOdrG
	ZbdLZIlIZkJsBQr5QbmfiC0yR4lwf0eKsKcCeDPic1DVfgjxeuxJ6v9nE4mA/8B+LaUqjgrdKWbT0
	LABEIZb6lRu+T9IPHNJrG0hyiRT5IVxDAFW6jsCvHScBc0iPSVvfPt3bEDdr3Bw478gxDZFTzWgi4
	ZIayHW46N9Bw+RyFtbFXG4nGSXWBtVPstwZJcX4Y9O78h1tojMZXhKKOIFqdbV6zcP5RPKmITqvTF
	8dcIpxGSaUejC4tHH8zoFbKmBX18zYpsdWEelCQ7hkMfi7whVtMKTqG9Pg3lP+ZI79rIlx8xJuvEA
	vyR8YuuJr5F2sBTWZRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDyv9-005h8j-TK; Sun, 30 Jan 2022 01:22:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDyuJ-005gpF-A4; Sun, 30 Jan 2022 01:21:33 +0000
X-UUID: 2f1b0df9e6cf4019b33a63728f5c6889-20220129
X-UUID: 2f1b0df9e6cf4019b33a63728f5c6889-20220129
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 172584979; Sat, 29 Jan 2022 18:21:30 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 Jan 2022 17:21:28 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 30 Jan 2022 09:21:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 30 Jan 2022 09:21:26 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v7 4/5] soc: mediatek: pm-domains: Move power status offset to power
 domain data
Date: Sun, 30 Jan 2022 09:21:03 +0800
Message-ID: <20220130012104.5292-5-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220130012104.5292-1-chun-jie.chen@mediatek.com>
References: <20220130012104.5292-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_172131_399191_B2D2EF57 
X-CRM114-Status: GOOD (  11.89  )
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

MT8195 has more than 32 power domains so it needs
two set of pwr_sta and pwr_sta2nd registers,
so move the register offset from soc data into power domain data.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8167-pm-domains.h | 16 +++++++--
 drivers/soc/mediatek/mt8173-pm-domains.h | 22 ++++++++++--
 drivers/soc/mediatek/mt8183-pm-domains.h | 32 +++++++++++++++--
 drivers/soc/mediatek/mt8192-pm-domains.h | 44 ++++++++++++++++++++++--
 drivers/soc/mediatek/mtk-pm-domains.c    |  4 +--
 drivers/soc/mediatek/mtk-pm-domains.h    |  4 +--
 6 files changed, 110 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mt8167-pm-domains.h b/drivers/soc/mediatek/mt8167-pm-domains.h
index 15559ddf26e4..4d6c32759606 100644
--- a/drivers/soc/mediatek/mt8167-pm-domains.h
+++ b/drivers/soc/mediatek/mt8167-pm-domains.h
@@ -18,6 +18,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.name = "mm",
 		.sta_mask = PWR_STATUS_DISP,
 		.ctl_offs = SPM_DIS_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -30,6 +32,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.name = "vdec",
 		.sta_mask = PWR_STATUS_VDEC,
 		.ctl_offs = SPM_VDE_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
@@ -38,6 +42,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.name = "isp",
 		.sta_mask = PWR_STATUS_ISP,
 		.ctl_offs = SPM_ISP_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
@@ -46,6 +52,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.name = "mfg_async",
 		.sta_mask = MT8167_PWR_STATUS_MFG_ASYNC,
 		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
 		.bp_infracfg = {
@@ -57,6 +65,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.name = "mfg_2d",
 		.sta_mask = MT8167_PWR_STATUS_MFG_2D,
 		.ctl_offs = SPM_MFG_2D_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
@@ -64,6 +74,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.name = "mfg",
 		.sta_mask = PWR_STATUS_MFG,
 		.ctl_offs = SPM_MFG_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
@@ -71,6 +83,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = SPM_CONN_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = 0,
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
@@ -85,8 +99,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8167[] = {
 static const struct scpsys_soc_data mt8167_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8167,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8167),
-	.pwr_sta_offs = SPM_PWR_STATUS,
-	.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 };
 
 #endif /* __SOC_MEDIATEK_MT8167_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mt8173-pm-domains.h b/drivers/soc/mediatek/mt8173-pm-domains.h
index 714fa92575df..1a5dc63b7357 100644
--- a/drivers/soc/mediatek/mt8173-pm-domains.h
+++ b/drivers/soc/mediatek/mt8173-pm-domains.h
@@ -15,6 +15,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "vdec",
 		.sta_mask = PWR_STATUS_VDEC,
 		.ctl_offs = SPM_VDE_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -22,6 +24,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "venc",
 		.sta_mask = PWR_STATUS_VENC,
 		.ctl_offs = SPM_VEN_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
@@ -29,6 +33,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "isp",
 		.sta_mask = PWR_STATUS_ISP,
 		.ctl_offs = SPM_ISP_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 	},
@@ -36,6 +42,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "mm",
 		.sta_mask = PWR_STATUS_DISP,
 		.ctl_offs = SPM_DIS_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -47,6 +55,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "venc_lt",
 		.sta_mask = PWR_STATUS_VENC_LT,
 		.ctl_offs = SPM_VEN2_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
@@ -54,6 +64,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "audio",
 		.sta_mask = PWR_STATUS_AUDIO,
 		.ctl_offs = SPM_AUDIO_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
@@ -61,6 +73,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "usb",
 		.sta_mask = PWR_STATUS_USB,
 		.ctl_offs = SPM_USB_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 		.caps = MTK_SCPD_ACTIVE_WAKEUP,
@@ -69,6 +83,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "mfg_async",
 		.sta_mask = PWR_STATUS_MFG_ASYNC,
 		.ctl_offs = SPM_MFG_ASYNC_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = 0,
 		.caps = MTK_SCPD_DOMAIN_SUPPLY,
@@ -77,6 +93,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "mfg_2d",
 		.sta_mask = PWR_STATUS_MFG_2D,
 		.ctl_offs = SPM_MFG_2D_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 	},
@@ -84,6 +102,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 		.name = "mfg",
 		.sta_mask = PWR_STATUS_MFG,
 		.ctl_offs = SPM_MFG_PWR_CON,
+		.pwr_sta_offs = SPM_PWR_STATUS,
+		.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 		.sram_pdn_bits = GENMASK(13, 8),
 		.sram_pdn_ack_bits = GENMASK(21, 16),
 		.bp_infracfg = {
@@ -98,8 +118,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8173[] = {
 static const struct scpsys_soc_data mt8173_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8173,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8173),
-	.pwr_sta_offs = SPM_PWR_STATUS,
-	.pwr_sta2nd_offs = SPM_PWR_STATUS_2ND,
 };
 
 #endif /* __SOC_MEDIATEK_MT8173_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mt8183-pm-domains.h b/drivers/soc/mediatek/mt8183-pm-domains.h
index 98a9940d05fb..71b8757e552d 100644
--- a/drivers/soc/mediatek/mt8183-pm-domains.h
+++ b/drivers/soc/mediatek/mt8183-pm-domains.h
@@ -15,6 +15,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "audio",
 		.sta_mask = PWR_STATUS_AUDIO,
 		.ctl_offs = 0x0314,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 	},
@@ -22,6 +24,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = 0x032c,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
 		.bp_infracfg = {
@@ -33,6 +37,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "mfg_async",
 		.sta_mask = PWR_STATUS_MFG_ASYNC,
 		.ctl_offs = 0x0334,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
 	},
@@ -40,6 +46,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "mfg",
 		.sta_mask = PWR_STATUS_MFG,
 		.ctl_offs = 0x0338,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.caps = MTK_SCPD_DOMAIN_SUPPLY,
@@ -48,6 +56,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "mfg_core0",
 		.sta_mask = BIT(7),
 		.ctl_offs = 0x034c,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -55,6 +65,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "mfg_core1",
 		.sta_mask = BIT(20),
 		.ctl_offs = 0x0310,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -62,6 +74,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "mfg_2d",
 		.sta_mask = PWR_STATUS_MFG_2D,
 		.ctl_offs = 0x0348,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -75,6 +89,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "disp",
 		.sta_mask = PWR_STATUS_DISP,
 		.ctl_offs = 0x030c,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -94,6 +110,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "cam",
 		.sta_mask = BIT(25),
 		.ctl_offs = 0x0344,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(9, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.bp_infracfg = {
@@ -117,6 +135,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "isp",
 		.sta_mask = PWR_STATUS_ISP,
 		.ctl_offs = 0x0308,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(9, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.bp_infracfg = {
@@ -140,6 +160,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "vdec",
 		.sta_mask = BIT(31),
 		.ctl_offs = 0x0300,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_smi = {
@@ -153,6 +175,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "venc",
 		.sta_mask = PWR_STATUS_VENC,
 		.ctl_offs = 0x0304,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(15, 12),
 		.bp_smi = {
@@ -166,6 +190,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "vpu_top",
 		.sta_mask = BIT(26),
 		.ctl_offs = 0x0324,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -193,6 +219,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "vpu_core0",
 		.sta_mask = BIT(27),
 		.ctl_offs = 0x33c,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.bp_infracfg = {
@@ -211,6 +239,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 		.name = "vpu_core1",
 		.sta_mask = BIT(28),
 		.ctl_offs = 0x0340,
+		.pwr_sta_offs = 0x0180,
+		.pwr_sta2nd_offs = 0x0184,
 		.sram_pdn_bits = GENMASK(11, 8),
 		.sram_pdn_ack_bits = GENMASK(13, 12),
 		.bp_infracfg = {
@@ -230,8 +260,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8183[] = {
 static const struct scpsys_soc_data mt8183_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8183,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8183),
-	.pwr_sta_offs = 0x0180,
-	.pwr_sta2nd_offs = 0x0184
 };
 
 #endif /* __SOC_MEDIATEK_MT8183_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mt8192-pm-domains.h b/drivers/soc/mediatek/mt8192-pm-domains.h
index 543dda70de01..558c4ee4784a 100644
--- a/drivers/soc/mediatek/mt8192-pm-domains.h
+++ b/drivers/soc/mediatek/mt8192-pm-domains.h
@@ -15,6 +15,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "audio",
 		.sta_mask = BIT(21),
 		.ctl_offs = 0x0354,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -28,6 +30,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "conn",
 		.sta_mask = PWR_STATUS_CONN,
 		.ctl_offs = 0x0304,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = 0,
 		.sram_pdn_ack_bits = 0,
 		.bp_infracfg = {
@@ -50,6 +54,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mfg0",
 		.sta_mask = BIT(2),
 		.ctl_offs = 0x0308,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -57,6 +63,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mfg1",
 		.sta_mask = BIT(3),
 		.ctl_offs = 0x030c,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -82,6 +90,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mfg2",
 		.sta_mask = BIT(4),
 		.ctl_offs = 0x0310,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -89,6 +99,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mfg3",
 		.sta_mask = BIT(5),
 		.ctl_offs = 0x0314,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -96,6 +108,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mfg4",
 		.sta_mask = BIT(6),
 		.ctl_offs = 0x0318,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -103,6 +117,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mfg5",
 		.sta_mask = BIT(7),
 		.ctl_offs = 0x031c,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -110,6 +126,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mfg6",
 		.sta_mask = BIT(8),
 		.ctl_offs = 0x0320,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -117,6 +135,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "disp",
 		.sta_mask = BIT(20),
 		.ctl_offs = 0x0350,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -146,6 +166,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "ipe",
 		.sta_mask = BIT(14),
 		.ctl_offs = 0x0338,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -163,6 +185,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "isp",
 		.sta_mask = BIT(12),
 		.ctl_offs = 0x0330,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -180,6 +204,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "isp2",
 		.sta_mask = BIT(13),
 		.ctl_offs = 0x0334,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -197,6 +223,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "mdp",
 		.sta_mask = BIT(19),
 		.ctl_offs = 0x034c,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -214,6 +242,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "venc",
 		.sta_mask = BIT(17),
 		.ctl_offs = 0x0344,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -231,6 +261,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "vdec",
 		.sta_mask = BIT(15),
 		.ctl_offs = 0x033c,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -248,6 +280,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "vdec2",
 		.sta_mask = BIT(16),
 		.ctl_offs = 0x0340,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -255,6 +289,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "cam",
 		.sta_mask = BIT(23),
 		.ctl_offs = 0x035c,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 		.bp_infracfg = {
@@ -284,6 +320,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "cam_rawa",
 		.sta_mask = BIT(24),
 		.ctl_offs = 0x0360,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -291,6 +329,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "cam_rawb",
 		.sta_mask = BIT(25),
 		.ctl_offs = 0x0364,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -298,6 +338,8 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 		.name = "cam_rawc",
 		.sta_mask = BIT(26),
 		.ctl_offs = 0x0368,
+		.pwr_sta_offs = 0x016c,
+		.pwr_sta2nd_offs = 0x0170,
 		.sram_pdn_bits = GENMASK(8, 8),
 		.sram_pdn_ack_bits = GENMASK(12, 12),
 	},
@@ -306,8 +348,6 @@ static const struct scpsys_domain_data scpsys_domain_data_mt8192[] = {
 static const struct scpsys_soc_data mt8192_scpsys_data = {
 	.domains_data = scpsys_domain_data_mt8192,
 	.num_domains = ARRAY_SIZE(scpsys_domain_data_mt8192),
-	.pwr_sta_offs = 0x016c,
-	.pwr_sta2nd_offs = 0x0170,
 };
 
 #endif /* __SOC_MEDIATEK_MT8192_PM_DOMAINS_H */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index afd2fd74802d..ad06b6f90435 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -60,10 +60,10 @@ static bool scpsys_domain_is_on(struct scpsys_domain *pd)
 	struct scpsys *scpsys = pd->scpsys;
 	u32 status, status2;
 
-	regmap_read(scpsys->base, scpsys->soc_data->pwr_sta_offs, &status);
+	regmap_read(scpsys->base, pd->data->pwr_sta_offs, &status);
 	status &= pd->data->sta_mask;
 
-	regmap_read(scpsys->base, scpsys->soc_data->pwr_sta2nd_offs, &status2);
+	regmap_read(scpsys->base, pd->data->pwr_sta2nd_offs, &status2);
 	status2 &= pd->data->sta_mask;
 
 	/* A domain is on when both status bits are set. */
diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 089a31679806..c233ed828f86 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -92,13 +92,13 @@ struct scpsys_domain_data {
 	u8 caps;
 	const struct scpsys_bus_prot_data bp_infracfg[SPM_MAX_BUS_PROT_DATA];
 	const struct scpsys_bus_prot_data bp_smi[SPM_MAX_BUS_PROT_DATA];
+	int pwr_sta_offs;
+	int pwr_sta2nd_offs;
 };
 
 struct scpsys_soc_data {
 	const struct scpsys_domain_data *domains_data;
 	int num_domains;
-	int pwr_sta_offs;
-	int pwr_sta2nd_offs;
 };
 
 #endif /* __SOC_MEDIATEK_MTK_PM_DOMAINS_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
