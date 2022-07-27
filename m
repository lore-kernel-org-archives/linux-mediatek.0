Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE370C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 11:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjkFt+7WKUeV53qcyoac5gnTAo25nFzp3sCE82Gn7vo=; b=kgA39rP/g1lAh1LOzNuF99JYaO
	GTI7dhhrpUgtSrHL5S/bGgyFARlSPjl5Ys3Yor9Hx3m93RK/dfBLI+8a7fAzl6yN/JI/UQndvzHdI
	7aFbxw0pefzsvIk8oF7dnGVBq8noBNU/WZyTE9CZU9i/8uOdmMSOwPe7swZEWQFrX1y5g9MSS+SsW
	qYdIJj9VZz+bIVU63p4sv5+TIdHriiHSvfryo9XM+DdWQHJqEGC7Y/COGz2I5ce4fcQJ5aEV2mI1R
	aGHbTAh4Mw0D9C7EQKqucu87aDDpjvx8QLFf9VjRYqlLsGo7qF6Ka7m4CjVX0Sec9XU1x/nA66YhL
	KB1v1ZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfVF-00D77k-9S; Wed, 27 Jul 2022 11:47:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGfVC-00D74Z-5U
	for linux-mediatek@lists.infradead.org; Wed, 27 Jul 2022 11:46:59 +0000
X-UUID: 06149331f9fa4ce18c617c64eac22ac8-20220727
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7803a823-d80f-4bc9-b4b8-b2f7765c04c1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
	TION:release,TS:-20
X-CID-META: VersionHash:0f94e32,CLOUDID:27300716-4d40-4085-b6be-c498a879f53d,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:1,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 06149331f9fa4ce18c617c64eac22ac8-20220727
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1328195080; Wed, 27 Jul 2022 04:46:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 27 Jul 2022 18:46:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 27 Jul 2022 18:46:11 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v3 3/3] memory: mtk-smi: mt8188: Add SMI Support
Date: Wed, 27 Jul 2022 18:45:41 +0800
Message-ID: <20220727104541.7309-4-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727104541.7309-1-chengci.xu@mediatek.com>
References: <20220727104541.7309-1-chengci.xu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_044658_242078_122FB931 
X-CRM114-Status: UNSURE (   9.71  )
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
---
 drivers/memory/mtk-smi.c | 71 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 41ce66c39123..5ac2547b1480 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -272,6 +272,55 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	}
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
@@ -358,6 +407,13 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8186 = {
 	.flags_general	            = MTK_SMI_FLAG_SLEEP_CTL,
 };
 
+static const struct mtk_smi_larb_gen mtk_smi_larb_mt8188 = {
+	.config_port                = mtk_smi_larb_config_port_gen2_general,
+	.flags_general	            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
+				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_SEC_REG,
+	.ostd		            = mtk_smi_larb_mt8188_ostd,
+};
+
 static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
 	.config_port                = mtk_smi_larb_config_port_gen2_general,
 };
@@ -378,6 +434,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
 	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
 	{.compatible = "mediatek,mt8186-smi-larb", .data = &mtk_smi_larb_mt8186},
+	{.compatible = "mediatek,mt8188-smi-larb", .data = &mtk_smi_larb_mt8188},
 	{.compatible = "mediatek,mt8192-smi-larb", .data = &mtk_smi_larb_mt8192},
 	{.compatible = "mediatek,mt8195-smi-larb", .data = &mtk_smi_larb_mt8195},
 	{}
@@ -608,6 +665,18 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt8186 = {
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
@@ -644,6 +713,8 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
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


