Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C1CC25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3avrf0tq6qTnEWZDuk/e0bs7qVAMSgucssyhOI51z0=; b=hht2eCObSqub6EdYB4TtFe010W
	r7PzmX02uoaqEmIcspG7PZO/jmGpYb6B7+TeUbHgRGzAx4izQmrv2JHefO4kKjY9WIxb/rhfMCas1
	9pER/7NnquleqZEuGRcxCeoWq2FAtFXsoOKqGwkuqZvP2I3tgqyOniMyKGjjwuNT3vVeTqahGqrrI
	Dlzc7NiDZ+rkHOqZwy2kuOkXPjZNaThV+5AeH6lb/kf0hX0owZB8YMqIv343azLqOFgeTIf4JIRE8
	3nnros36PM84VITXKt1QS0Y1UGvmuFUunkNLoKiJwvOA8FA4aO3Tkr6GyXnTaRgNUYOCe5A3U2zMP
	RXTbTPsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIUu-0022aP-DJ; Wed, 17 Aug 2022 12:50:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIUj-0022W4-Ck; Wed, 17 Aug 2022 12:50:03 +0000
X-UUID: 642dcecfe36c440e81ab7f45d0a0bd5d-20220817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t3avrf0tq6qTnEWZDuk/e0bs7qVAMSgucssyhOI51z0=;
	b=S3t/LpSrzHNfHIz7ufXNeYo5XUaMCK6c4eu0IykbLDsY7mGmx/4GDG9AFPE72yNgDnNTjcp1/9vOFCnPOsocwDzOqs3wlnRUtSaRhl44dZ5TJKx6iV44qyF2MuYRspSoW7WNKsYBF5FEGwpmKUrslFveM8nYOK0F1ObAqBv2pY4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:1d816727-e6c5-4d2d-ad2c-18918e3a2895,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-20
X-CID-META: VersionHash:84eae18,CLOUDID:5d3d18af-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 642dcecfe36c440e81ab7f45d0a0bd5d-20220817
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1250174339; Wed, 17 Aug 2022 05:49:55 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 17 Aug 2022 20:49:22 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 17 Aug 2022 20:49:21 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <yi.kuo@mediatek.com>,
	<anthony.huang@mediatek.com>, <wendy-st.lin@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 4/4] memory: mtk-smi: mt8188: Add SMI Support
Date: Wed, 17 Aug 2022 20:46:08 +0800
Message-ID: <20220817124608.10062-5-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220817124608.10062-1-chengci.xu@mediatek.com>
References: <20220817124608.10062-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_055001_614935_184287A9 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Add mt8188 smi common & larb support

Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 71 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 73a8a9867082..5a9754442bc7 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -283,6 +283,55 @@ static int mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	return 0;
 }
 
+static const u8 mtk_smi_larb_mt8188_ostd[][SMI_LARB_PORT_NR_MAX] = {
+	[0] = {0x02, 0x18, 0x22, 0x22, 0x01, 0x02, 0x0a,},
+	[1] = {0x12, 0x02, 0x14, 0x14, 0x01, 0x18, 0x0a,},
+	[2] = {0x12, 0x12, 0x12, 0x12, 0x0a,},
+	[3] = {0x12, 0x12, 0x12, 0x12, 0x28, 0x28, 0x0a,},
+	[4] = {0x06, 0x01, 0x17, 0x06, 0x0a, 0x07, 0x07,},
+	[5] = {0x02, 0x01, 0x04, 0x02, 0x06, 0x01, 0x06, 0x0a,},
+	[6] = {0x06, 0x01, 0x06, 0x0a,},
+	[7] = {0x0c, 0x0c, 0x12,},
+	[8] = {0x0c, 0x01, 0x0a, 0x05, 0x02, 0x03, 0x01, 0x01, 0x14, 0x14,
+	       0x0a, 0x14, 0x1e, 0x01, 0x0c, 0x0a, 0x05, 0x02, 0x02, 0x05,
+	       0x03, 0x01, 0x1e, 0x01, 0x05,},
+	[9] = {0x1e, 0x01, 0x0a, 0x0a, 0x01, 0x01, 0x03, 0x1e, 0x1e, 0x10,
+	       0x07, 0x01, 0x0a, 0x06, 0x03, 0x03, 0x0e, 0x01, 0x04, 0x28,},
+	[10] = {0x03, 0x20, 0x01, 0x20, 0x01, 0x01, 0x14, 0x0a, 0x0a, 0x0c,
+		0x0a, 0x05, 0x02, 0x03, 0x02, 0x14, 0x0a, 0x0a, 0x14, 0x14,
+		0x14, 0x01, 0x01, 0x14, 0x1e, 0x01, 0x05, 0x03, 0x02, 0x28,},
+	[11] = {0x03, 0x20, 0x01, 0x20, 0x01, 0x01, 0x14, 0x0a, 0x0a, 0x0c,
+		0x0a, 0x05, 0x02, 0x03, 0x02, 0x14, 0x0a, 0x0a, 0x14, 0x14,
+		0x14, 0x01, 0x01, 0x14, 0x1e, 0x01, 0x05, 0x03, 0x02, 0x28,},
+	[12] = {0x03, 0x20, 0x01, 0x20, 0x01, 0x01, 0x14, 0x0a, 0x0a, 0x0c,
+		0x0a, 0x05, 0x02, 0x03, 0x02, 0x14, 0x0a, 0x0a, 0x14, 0x14,
+		0x14, 0x01, 0x01, 0x14, 0x1e, 0x01, 0x05, 0x03, 0x02, 0x28,},
+	[13] = {0x07, 0x02, 0x04, 0x02, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
+		0x07, 0x02, 0x04, 0x02, 0x05, 0x05,},
+	[14] = {0x02, 0x02, 0x0c, 0x0c, 0x0c, 0x0c, 0x01, 0x01, 0x02, 0x02,
+		0x02, 0x02, 0x0c, 0x0c, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02,
+		0x02, 0x02, 0x01, 0x01,},
+	[15] = {0x0c, 0x0c, 0x02, 0x02, 0x02, 0x02, 0x01, 0x01, 0x0c, 0x0c,
+		0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x01, 0x02,
+		0x0c, 0x01, 0x01,},
+	[16] = {0x28, 0x28, 0x03, 0x01, 0x01, 0x03, 0x14, 0x14, 0x0a, 0x0d,
+		0x03, 0x05, 0x0e, 0x01, 0x01, 0x05, 0x06, 0x0d, 0x01,},
+	[17] = {0x28, 0x02, 0x02, 0x12, 0x02, 0x12, 0x10, 0x02, 0x02, 0x0a,
+		0x12, 0x02, 0x02, 0x0a, 0x16, 0x02, 0x04,},
+	[18] = {0x28, 0x02, 0x02, 0x12, 0x02, 0x12, 0x10, 0x02, 0x02, 0x0a,
+		0x12, 0x02, 0x02, 0x0a, 0x16, 0x02, 0x04,},
+	[19] = {0x1a, 0x0e, 0x0a, 0x0a, 0x0c, 0x0e, 0x10,},
+	[20] = {0x1a, 0x0e, 0x0a, 0x0a, 0x0c, 0x0e, 0x10,},
+	[21] = {0x01, 0x04, 0x01, 0x01, 0x01, 0x01, 0x01, 0x04, 0x04, 0x01,
+		0x01, 0x01, 0x04, 0x0a, 0x06, 0x01, 0x01, 0x01, 0x0a, 0x06,
+		0x01, 0x01, 0x05, 0x03, 0x03, 0x04, 0x01,},
+	[22] = {0x28, 0x19, 0x0c, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x04,
+		0x01,},
+	[23] = {0x01, 0x01, 0x04, 0x01, 0x01, 0x01, 0x18, 0x01, 0x01,},
+	[24] = {0x12, 0x06, 0x12, 0x06,},
+	[25] = {0x01},
+};
+
 static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_PORT_NR_MAX] = {
 	[0] = {0x0a, 0xc, 0x22, 0x22, 0x01, 0x0a,}, /* larb0 */
 	[1] = {0x0a, 0xc, 0x22, 0x22, 0x01, 0x0a,}, /* larb1 */
@@ -369,6 +418,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8186 = {
 	.flags_general	            = MTK_SMI_FLAG_SLEEP_CTL,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
+				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CFG_PORT_SEC_CTL,
+	.ostd		            = mtk_smi_larb_mt8188_ostd,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 };
@@ -389,6 +445,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
 	{.compatible = "mediatek,mt8186-smi-larb", .data = &mtk_smi_larb_mt8186},
+	{.compatible = "mediatek,mt8188-smi-larb", .data = &mtk_smi_larb_mt8188},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
 	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
@@ -617,6 +674,18 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8186 = {
 	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(4) | F_MMU1_LARB(7),
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8188_vdo = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(5) | F_MMU1_LARB(7),
+	.init     = mtk_smi_common_mt8195_init,
+};
+
+static const struct mtk_smi_common_plat mtk_smi_common_mt8188_vpp = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(1) | F_MMU1_LARB(2) | F_MMU1_LARB(7),
+	.init     = mtk_smi_common_mt8195_init,
+};
+
 static const struct mtk_smi_common_plat mtk_smi_common_mt8192 = {
 	.type     = MTK_SMI_GEN2,
 	.has_gals = true,
@@ -653,6 +722,8 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
 	{.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},
 	{.compatible = "mediatek,mt8186-smi-common", .data = &mtk_smi_common_mt8186},
+	{.compatible = "mediatek,mt8188-smi-common-vdo", .data = &mtk_smi_common_mt8188_vdo},
+	{.compatible = "mediatek,mt8188-smi-common-vpp", .data = &mtk_smi_common_mt8188_vpp},
 	{.compatible = "mediatek,mt8192-smi-common", .data = &mtk_smi_common_mt8192},
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
-- 
2.25.1


