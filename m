Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BF3C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xn+GObOkyXDCpsD3xBExtnY/kB4ReIuvsp4HOYY0lM0=; b=vZRr/d+M2CwbEf
	ZJE0Y4ZxUmxNKMvJfHk6CXA3y9rDOscta9Zp29LtfVV+zJ12rXcvAwGLKV6mDSaULXZO0UZLqvVHT
	DOcsE3UgMtOADhiiE9eAtIsHSifRBSFxNcC9+Z5GeMmHvQ3cpLh/ATQh3yrY34o5tqa5juoQ0ddPW
	XanSEpVA3eTX5lkjIY4nImC0iQp/Cfhxn04aZ6Zl6SO6rTV1cEn6BIlJMrZJaoLHl7ETtXcyauB84
	DM3+Xky6e+yhoYRbEOAf69bOKzBiPa6PhvyeIflZD11k8K3eoP6/g1Nk34bcHcOWI846cZM05ck30
	ONdc+DqLV2YXbE1FEICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntQ4l-007Fmp-45; Tue, 24 May 2022 08:39:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntQ4F-007FYt-55; Tue, 24 May 2022 08:39:04 +0000
X-UUID: 7068af025771466fa7c88b87e7a021f5-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1c13f878-12fa-490b-bd54-5d324a847b21, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:3b7d6e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 7068af025771466fa7c88b87e7a021f5-20220524
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 285122831; Tue, 24 May 2022 01:38:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 01:38:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 16:38:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 24 May 2022 16:38:49 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/7] clk: mediatek: mt2701: use mtk_clk_simple_probe to
 simplify driver
Date: Tue, 24 May 2022 16:38:34 +0800
Message-ID: <20220524083843.9994-2-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220524083843.9994-1-miles.chen@mediatek.com>
References: <20220524083843.9994-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_013903_311995_1D657AB4 
X-CRM114-Status: GOOD (  15.40  )
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

mtk_clk_simple_probe was added by Chun-Jie to simply common flow
of MediaTek clock drivers and ChenYu enhanced the error path of
mtk_clk_simple_probe and added mtk_clk_simple_remove.

Let's use mtk_clk_simple_probe and mtk_clk_simple_probe in other
MediaTek clock drivers as well.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt2701-bdp.c  | 36 ++++++++++----------------
 drivers/clk/mediatek/clk-mt2701-img.c  | 36 ++++++++++----------------
 drivers/clk/mediatek/clk-mt2701-vdec.c | 36 ++++++++++----------------
 3 files changed, 39 insertions(+), 69 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt2701-bdp.c b/drivers/clk/mediatek/clk-mt2701-bdp.c
index 662a8ab3fbb1..435ed4819d56 100644
--- a/drivers/clk/mediatek/clk-mt2701-bdp.c
+++ b/drivers/clk/mediatek/clk-mt2701-bdp.c
@@ -94,33 +94,23 @@ static const struct mtk_gate bdp_clks[] = {
 	GATE_BDP1(CLK_BDP_HDMI_MON, "hdmi_mon", "hdmi_0_pll340m", 16),
 };
 
-static const struct of_device_id of_match_clk_mt2701_bdp[] = {
-	{ .compatible = "mediatek,mt2701-bdpsys", },
-	{}
+static const struct mtk_clk_desc bdp_desc = {
+	.clks = bdp_clks,
+	.num_clks = ARRAY_SIZE(bdp_clks),
 };
 
-static int clk_mt2701_bdp_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_BDP_NR);
-
-	mtk_clk_register_gates(node, bdp_clks, ARRAY_SIZE(bdp_clks),
-						clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct of_device_id of_match_clk_mt2701_bdp[] = {
+	{
+		.compatible = "mediatek,mt2701-bdpsys",
+		.data = &bdp_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt2701_bdp_drv = {
-	.probe = clk_mt2701_bdp_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-bdp",
 		.of_match_table = of_match_clk_mt2701_bdp,
diff --git a/drivers/clk/mediatek/clk-mt2701-img.c b/drivers/clk/mediatek/clk-mt2701-img.c
index c4f3cd26df60..7e53deb7f990 100644
--- a/drivers/clk/mediatek/clk-mt2701-img.c
+++ b/drivers/clk/mediatek/clk-mt2701-img.c
@@ -36,33 +36,23 @@ static const struct mtk_gate img_clks[] = {
 	GATE_IMG(CLK_IMG_VENC, "img_venc", "mm_sel", 9),
 };
 
-static const struct of_device_id of_match_clk_mt2701_img[] = {
-	{ .compatible = "mediatek,mt2701-imgsys", },
-	{}
+static const struct mtk_clk_desc img_desc = {
+	.clks = img_clks,
+	.num_clks = ARRAY_SIZE(img_clks),
 };
 
-static int clk_mt2701_img_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IMG_NR);
-
-	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
-						clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct of_device_id of_match_clk_mt2701_img[] = {
+	{
+		.compatible = "mediatek,mt2701-imgsys",
+		.data = &img_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt2701_img_drv = {
-	.probe = clk_mt2701_img_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-img",
 		.of_match_table = of_match_clk_mt2701_img,
diff --git a/drivers/clk/mediatek/clk-mt2701-vdec.c b/drivers/clk/mediatek/clk-mt2701-vdec.c
index a2f18117f27a..d3089da0ab62 100644
--- a/drivers/clk/mediatek/clk-mt2701-vdec.c
+++ b/drivers/clk/mediatek/clk-mt2701-vdec.c
@@ -47,33 +47,23 @@ static const struct mtk_gate vdec_clks[] = {
 	GATE_VDEC1(CLK_VDEC_LARB, "vdec_larb_cken", "mm_sel", 0),
 };
 
-static const struct of_device_id of_match_clk_mt2701_vdec[] = {
-	{ .compatible = "mediatek,mt2701-vdecsys", },
-	{}
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
 };
 
-static int clk_mt2701_vdec_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	int r;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_VDEC_NR);
-
-	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
-						clk_data);
-
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
-
-	return r;
-}
+static const struct of_device_id of_match_clk_mt2701_vdec[] = {
+	{
+		.compatible = "mediatek,mt2701-vdecsys",
+		.data = &vdec_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt2701_vdec_drv = {
-	.probe = clk_mt2701_vdec_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt2701-vdec",
 		.of_match_table = of_match_clk_mt2701_vdec,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
