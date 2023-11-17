Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704AEC072A2
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 05:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FcMZpDC6yml9facMQDLQ+P2N2C8lZhAA3P7ZoPS0VcU=; b=mK7IEoc0cUHT7K3sOHWfDZ8SDh
	lN1IDc/iDZQbf9SmTSj3van+V/4JCqdS/31XeLk96/N6xgpNUz2IXP7lwpsqjP2IJggmHUWeEBlRZ
	zvEEqdJlgEEDnjYpCsFOOdEDeSzWLQb7yg8zbQodzcOIMe5RZfDFXa/7DxuJoIueRGiltaGIr2D00
	dj3Nd8IaZvC4sEUu7G6ZqxDwJ7dQjGevf4UyCZoNfu7FexDNMH7BpYt1a9ZWzYNIRGze0K4Z3Jh/H
	N1bExw+t0SYaVChiV/wZR/DU8UNnJQVIf/G3D0DA0L9UmW/J6qMVgSF3rNHlLvxZhhRzEi6JUOQ4F
	LE/ZSWZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3reZ-005hS5-0Z;
	Fri, 17 Nov 2023 05:44:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3reW-005hRJ-0e;
	Fri, 17 Nov 2023 05:44:29 +0000
X-UUID: 5d40a0fe850c11ee9b7791016c24628a-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=FcMZpDC6yml9facMQDLQ+P2N2C8lZhAA3P7ZoPS0VcU=;
	b=IApvH4TnW+dF43+2x6SktkYaGNr1uViteD4EFQgGellvrgys6Y9k+I5xOxYYhIaWog0vMw+DvqSdY8qI0EI1gpfWHxQR5S24EexE1dCTGht7/wIwXg7F2DyhusBcm8tkBphz/oohBxxz/Hlhs4vvhWmi8/gSgoMu+Kk+PTN+IC8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:76a00288-a5cb-436d-a3cb-a0bb8f6b5cd7,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:f3897f95-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 5d40a0fe850c11ee9b7791016c24628a-20231116
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1924250845; Thu, 16 Nov 2023 22:44:24 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 17 Nov 2023 13:43:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 17 Nov 2023 13:43:47 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH v3] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
Date: Fri, 17 Nov 2023 13:43:45 +0800
Message-ID: <20231117054345.15859-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.008100-8.000000
X-TMASE-MatchedRID: y/MOm6ldwRI9S3IiQd+eNbGj3LN0+Ey99pLnYtQ99xJh2fnHe1cil/PE
	OEokggNLThbvLLI8RvNq7k1NHAqvK5sYdIGP6PlZFYJUGv4DL3x9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO0UQCQtpNwWeqxGR/UCdr1/BcR/xqmsIALmw2V0fc0U3JAygRKJNv92
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.008100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: B418852BE266F37F58A72B352146686BCE146B14E9EBDF21082A27399081D6F82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_214428_263199_E32D724D 
X-CRM114-Status: GOOD (  10.26  )
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

Add MT8188 VPPSYS0 and VPPSYS1 driver data.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
Changes in v3:
- Separate dt-binding patch from driver patch.
- dt-binding patch can refer to
https://lore.kernel.org/all/20231117053934.10571-1-yu-chang.lee@mediatek.com/

Changes in v2:
- Refine commit message
- Refine commit title
---
 drivers/soc/mediatek/mtk-mmsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 88209102ff3b..1e5239cc5445 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -89,6 +89,16 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vppsys0_driver_data = {
+	.clk_driver = "clk-mt8188-vpp0",
+	.is_vppsys = true,
+};
+
+static const struct mtk_mmsys_driver_data mt8188_vppsys1_driver_data = {
+	.clk_driver = "clk-mt8188-vpp1",
+	.is_vppsys = true,
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -429,6 +439,8 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8183-mmsys", .data = &mt8183_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8186-mmsys", .data = &mt8186_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8188-vdosys0", .data = &mt8188_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys0", .data = &mt8188_vppsys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys1", .data = &mt8188_vppsys1_driver_data },
 	{ .compatible = "mediatek,mt8192-mmsys", .data = &mt8192_mmsys_driver_data },
 	/* "mediatek,mt8195-mmsys" compatible is deprecated */
 	{ .compatible = "mediatek,mt8195-mmsys", .data = &mt8195_vdosys0_driver_data },
-- 
2.18.0


