Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65368C6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 10:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=13hxr6W+QcX4UHmVrUqJocteKF15icvHoANjzCJxFMI=; b=EwyDli5cADgvsA0uBrbZDycDmY
	nun3Pj2qkruJG5jt5U9FYrzDikSkc3HQ/I4UfZ2hbUw/hUerKzjzfP4a+rZtB6IRo2aP2bfyl+fos
	hPQuP7gnj2/tHXZkkN9L4QhugABdBPY14qJFnZMXcC+f3DCQL9heiB54eGDR+E6/b3hhf7GQ4+XZp
	ujP+1gTkir3kIk5cHnZN9AfPee6jY3v0h6Xr1dbOt2vuT3y/zYSFsHmLzEE3C9n6eEx2n0qyWnmyv
	f6E6yA1zZYNFOHZNsJt6aRVupffSYzBfiQsCyeDyMuHdA5HIPve1LwjdZVy3o3p8P0if2W/MVlBTz
	Mu9EwQaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obJ8Z-00Enaf-QU; Thu, 22 Sep 2022 10:08:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obIqr-00EZWp-IM; Thu, 22 Sep 2022 09:50:39 +0000
X-UUID: c24e3675e9bf4d65ba09e1598f6a2164-20220922
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=13hxr6W+QcX4UHmVrUqJocteKF15icvHoANjzCJxFMI=;
	b=GvgUWBolqGB4els7HsE418HUEn3KavK42+EtlpH405jzF58NRypxbETLWTY+r+amRR5uJAC0DI1z8Rq9GTkFsWJdffyyu65it8gKzoZDyZdmQcZBwHQxSEE1X1oxLdeVwj8Zb/0x+hb/Kp81w9+NiZ53YCmuuPeUGioVp30zYv0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:5b3e689d-73df-4a6c-9f7b-4246b7720ab4,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:8918e1e3-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c24e3675e9bf4d65ba09e1598f6a2164-20220922
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 425536450; Thu, 22 Sep 2022 02:50:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 22 Sep 2022 17:18:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 22 Sep 2022 17:18:59 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
	<mturquette@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-kernel@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>, Miles Chen
	<miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 5/7] clk: mediatek: mt6797: use mtk_clk_simple_probe to simplify driver
Date: Thu, 22 Sep 2022 17:18:33 +0800
Message-ID: <20220922091841.4099-6-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220922091841.4099-1-miles.chen@mediatek.com>
References: <20220922091841.4099-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_025037_664386_A0FAC904 
X-CRM114-Status: GOOD (  14.85  )
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

mtk_clk_simple_probe was added by Chun-Jie to simply common flow
of MediaTek clock drivers and ChenYu enhanced the error path of
mtk_clk_simple_probe and added mtk_clk_simple_remove.

Let's use mtk_clk_simple_probe and mtk_clk_simple_probe in other
MediaTek clock drivers as well.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt6797-img.c  | 36 ++++++++++----------------
 drivers/clk/mediatek/clk-mt6797-vdec.c | 36 ++++++++++----------------
 drivers/clk/mediatek/clk-mt6797-venc.c | 36 ++++++++++----------------
 3 files changed, 39 insertions(+), 69 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 25d17db13bac..7c6a53fbb8be 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -32,33 +32,23 @@ static const struct mtk_gate img_clks[] = {
 	GATE_IMG(CLK_IMG_LARB6, "img_larb6", "mm_sel", 0),
 };
 
-static const struct of_device_id of_match_clk_mt6797_img[] = {
-	{ .compatible = "mediatek,mt6797-imgsys", },
-	{}
+static const struct mtk_clk_desc img_desc = {
+	.clks = img_clks,
+	.num_clks = ARRAY_SIZE(img_clks),
 };
 
-static int clk_mt6797_img_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IMG_NR);
-
-	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
-			       clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct of_device_id of_match_clk_mt6797_img[] = {
+	{
+		.compatible = "mediatek,mt6797-imgsys",
+		.data = &img_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6797_img_drv = {
-	.probe = clk_mt6797_img_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797-img",
 		.of_match_table = of_match_clk_mt6797_img,
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index de857894e033..6120fccc859f 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -49,33 +49,23 @@ static const struct mtk_gate vdec_clks[] = {
 	GATE_VDEC1(CLK_VDEC_LARB1_CKEN, "vdec_larb1_cken", "mm_sel", 0),
 };
 
-static const struct of_device_id of_match_clk_mt6797_vdec[] = {
-	{ .compatible = "mediatek,mt6797-vdecsys", },
-	{}
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
 };
 
-static int clk_mt6797_vdec_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_VDEC_NR);
-
-	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
-			       clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct of_device_id of_match_clk_mt6797_vdec[] = {
+	{
+		.compatible = "mediatek,mt6797-vdecsys",
+		.data = &vdec_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6797_vdec_drv = {
-	.probe = clk_mt6797_vdec_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797-vdec",
 		.of_match_table = of_match_clk_mt6797_vdec,
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index 78b7ed55f979..834d3834d2bb 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -34,33 +34,23 @@ static const struct mtk_gate venc_clks[] = {
 	GATE_VENC(CLK_VENC_3, "venc_3", "venc_sel", 12),
 };
 
-static const struct of_device_id of_match_clk_mt6797_venc[] = {
-	{ .compatible = "mediatek,mt6797-vencsys", },
-	{}
+static const struct mtk_clk_desc venc_desc = {
+	.clks = venc_clks,
+	.num_clks = ARRAY_SIZE(venc_clks),
 };
 
-static int clk_mt6797_venc_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_VENC_NR);
-
-	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
-			       clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct of_device_id of_match_clk_mt6797_venc[] = {
+	{
+		.compatible = "mediatek,mt6797-vencsys",
+		.data = &venc_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6797_venc_drv = {
-	.probe = clk_mt6797_venc_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6797-venc",
 		.of_match_table = of_match_clk_mt6797_venc,
-- 
2.18.0


