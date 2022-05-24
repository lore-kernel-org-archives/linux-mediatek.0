Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 08:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Y+Y1IA1kp339Z7www8atpBGnmTGVHxyuCP1N085PA0=; b=KSVqLAGd2piJXx
	bOOyvcPmTXIe8EAOTWDPwIDsmwe6EzdmYLB83Lce1BVfjUyucFlUF6CTgDKqmLIyBEG2GrTvUzMff
	JlVGO+M1Ze8OQQ8y0I+fmd6s9co+UAVb4QQtDINKSVf001V20RACy87wOp+dG2PsO+QOe0tmKOAzH
	yJZjT2gJFidEh+CIAzjAhM7lP98W4cKUeWf2e55xf4VM00Y1GAPiI5t6xk+H2XBSxbs0EVfcnkWAn
	k0vDjKtzZbr5nUoFtSkpdvYYWnzI0hF22C+YKxnPxh37Up4GkgV1vxhPUGhz8K8+R2l/e3Qh06WJl
	UvKn4FmA20Xnf8SLe4rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntQ6B-007Ga2-6r; Tue, 24 May 2022 08:41:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntQ4H-007FZT-BK; Tue, 24 May 2022 08:39:07 +0000
X-UUID: 1ec91a33f36b40b6a44cc81be0563200-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:7e4caed5-2fd8-425f-97a3-8d9de20bd2b5, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:677f6e7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 1ec91a33f36b40b6a44cc81be0563200-20220524
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 397526545; Tue, 24 May 2022 01:39:00 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 01:38:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 16:38:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 24 May 2022 16:38:57 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/7] clk: mediatek: mt8183: use mtk_clk_simple_probe to
 simplify driver
Date: Tue, 24 May 2022 16:38:39 +0800
Message-ID: <20220524083843.9994-7-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220524083843.9994-1-miles.chen@mediatek.com>
References: <20220524083843.9994-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_013905_449357_256194E3 
X-CRM114-Status: GOOD (  14.15  )
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
 drivers/clk/mediatek/clk-mt8183-cam.c      | 27 +++++++++-----------
 drivers/clk/mediatek/clk-mt8183-img.c      | 27 +++++++++-----------
 drivers/clk/mediatek/clk-mt8183-ipu0.c     | 27 +++++++++-----------
 drivers/clk/mediatek/clk-mt8183-ipu1.c     | 27 +++++++++-----------
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c  | 27 +++++++++-----------
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c | 27 +++++++++-----------
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c   | 29 +++++++++-------------
 drivers/clk/mediatek/clk-mt8183-vdec.c     | 27 +++++++++-----------
 drivers/clk/mediatek/clk-mt8183-venc.c     | 27 +++++++++-----------
 9 files changed, 108 insertions(+), 137 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-cam.c b/drivers/clk/mediatek/clk-mt8183-cam.c
index fcc598a45165..6907b1a6a824 100644
--- a/drivers/clk/mediatek/clk-mt8183-cam.c
+++ b/drivers/clk/mediatek/clk-mt8183-cam.c
@@ -34,26 +34,23 @@ static const struct mtk_gate cam_clks[] = {
 	GATE_CAM(CLK_CAM_CCU, "cam_ccu", "cam_sel", 12),
 };
 
-static int clk_mt8183_cam_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_CAM_NR_CLK);
-
-	mtk_clk_register_gates(node, cam_clks, ARRAY_SIZE(cam_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc cam_desc = {
+	.clks = cam_clks,
+	.num_clks = ARRAY_SIZE(cam_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_cam[] = {
-	{ .compatible = "mediatek,mt8183-camsys", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-camsys",
+		.data = &cam_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_cam_drv = {
-	.probe = clk_mt8183_cam_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-cam",
 		.of_match_table = of_match_clk_mt8183_cam,
diff --git a/drivers/clk/mediatek/clk-mt8183-img.c b/drivers/clk/mediatek/clk-mt8183-img.c
index eb2def2cf0ae..8d884425d79f 100644
--- a/drivers/clk/mediatek/clk-mt8183-img.c
+++ b/drivers/clk/mediatek/clk-mt8183-img.c
@@ -34,26 +34,23 @@ static const struct mtk_gate img_clks[] = {
 	GATE_IMG(CLK_IMG_OWE, "img_owe", "img_sel", 9),
 };
 
-static int clk_mt8183_img_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IMG_NR_CLK);
-
-	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc img_desc = {
+	.clks = img_clks,
+	.num_clks = ARRAY_SIZE(img_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_img[] = {
-	{ .compatible = "mediatek,mt8183-imgsys", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-imgsys",
+		.data = &img_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_img_drv = {
-	.probe = clk_mt8183_img_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-img",
 		.of_match_table = of_match_clk_mt8183_img,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu0.c b/drivers/clk/mediatek/clk-mt8183-ipu0.c
index b30fc9f47518..953a8a33d048 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu0.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu0.c
@@ -27,26 +27,23 @@ static const struct mtk_gate ipu_core0_clks[] = {
 	GATE_IPU_CORE0(CLK_IPU_CORE0_IPU, "ipu_core0_ipu", "dsp_sel", 2),
 };
 
-static int clk_mt8183_ipu_core0_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IPU_CORE0_NR_CLK);
-
-	mtk_clk_register_gates(node, ipu_core0_clks, ARRAY_SIZE(ipu_core0_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc ipu_core0_desc = {
+	.clks = ipu_core0_clks,
+	.num_clks = ARRAY_SIZE(ipu_core0_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_ipu_core0[] = {
-	{ .compatible = "mediatek,mt8183-ipu_core0", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-ipu_core0",
+		.data = &ipu_core0_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_ipu_core0_drv = {
-	.probe = clk_mt8183_ipu_core0_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_core0",
 		.of_match_table = of_match_clk_mt8183_ipu_core0,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu1.c b/drivers/clk/mediatek/clk-mt8183-ipu1.c
index b378957e11d0..221d12265974 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu1.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu1.c
@@ -27,26 +27,23 @@ static const struct mtk_gate ipu_core1_clks[] = {
 	GATE_IPU_CORE1(CLK_IPU_CORE1_IPU, "ipu_core1_ipu", "dsp_sel", 2),
 };
 
-static int clk_mt8183_ipu_core1_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IPU_CORE1_NR_CLK);
-
-	mtk_clk_register_gates(node, ipu_core1_clks, ARRAY_SIZE(ipu_core1_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc ipu_core1_desc = {
+	.clks = ipu_core1_clks,
+	.num_clks = ARRAY_SIZE(ipu_core1_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_ipu_core1[] = {
-	{ .compatible = "mediatek,mt8183-ipu_core1", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-ipu_core1",
+		.data = &ipu_core1_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_ipu_core1_drv = {
-	.probe = clk_mt8183_ipu_core1_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_core1",
 		.of_match_table = of_match_clk_mt8183_ipu_core1,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
index 941b43ac8bec..8c4fd96df821 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
@@ -25,26 +25,23 @@ static const struct mtk_gate ipu_adl_clks[] = {
 	GATE_IPU_ADL_I(CLK_IPU_ADL_CABGEN, "ipu_adl_cabgen", "dsp_sel", 24),
 };
 
-static int clk_mt8183_ipu_adl_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IPU_ADL_NR_CLK);
-
-	mtk_clk_register_gates(node, ipu_adl_clks, ARRAY_SIZE(ipu_adl_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc ipu_adl_desc = {
+	.clks = ipu_adl_clks,
+	.num_clks = ARRAY_SIZE(ipu_adl_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_ipu_adl[] = {
-	{ .compatible = "mediatek,mt8183-ipu_adl", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-ipu_adl",
+		.data = &ipu_adl_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_ipu_adl_drv = {
-	.probe = clk_mt8183_ipu_adl_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_adl",
 		.of_match_table = of_match_clk_mt8183_ipu_adl,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu_conn.c b/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
index ae82c2e17110..14a4c3ff82a1 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu_conn.c
@@ -94,26 +94,23 @@ static const struct mtk_gate ipu_conn_clks[] = {
 		"ipu_conn_cab3to1_slice", "dsp1_sel", 17),
 };
 
-static int clk_mt8183_ipu_conn_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IPU_CONN_NR_CLK);
-
-	mtk_clk_register_gates(node, ipu_conn_clks, ARRAY_SIZE(ipu_conn_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc ipu_conn_desc = {
+	.clks = ipu_conn_clks,
+	.num_clks = ARRAY_SIZE(ipu_conn_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_ipu_conn[] = {
-	{ .compatible = "mediatek,mt8183-ipu_conn", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-ipu_conn",
+		.data = &ipu_conn_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_ipu_conn_drv = {
-	.probe = clk_mt8183_ipu_conn_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_conn",
 		.of_match_table = of_match_clk_mt8183_ipu_conn,
diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index d774edaf760b..f578b393f41e 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -26,28 +26,23 @@ static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFG_BG3D, "mfg_bg3d", "mfg_sel", 0)
 };
 
-static int clk_mt8183_mfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	pm_runtime_enable(&pdev->dev);
-
-	clk_data = mtk_alloc_clk_data(CLK_MFG_NR_CLK);
-
-	mtk_clk_register_gates_with_dev(node, mfg_clks, ARRAY_SIZE(mfg_clks),
-			clk_data, &pdev->dev);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc mfg_desc = {
+	.clks = mfg_clks,
+	.num_clks = ARRAY_SIZE(mfg_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
-	{ .compatible = "mediatek,mt8183-mfgcfg", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-mfgcfg",
+		.data = &mfg_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_mfg_drv = {
-	.probe = clk_mt8183_mfg_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-mfg",
 		.of_match_table = of_match_clk_mt8183_mfg,
diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediatek/clk-mt8183-vdec.c
index 0548cde159d0..c294e50b96b7 100644
--- a/drivers/clk/mediatek/clk-mt8183-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
@@ -38,26 +38,23 @@ static const struct mtk_gate vdec_clks[] = {
 	GATE_VDEC1_I(CLK_VDEC_LARB1, "vdec_larb1", "mm_sel", 0),
 };
 
-static int clk_mt8183_vdec_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_VDEC_NR_CLK);
-
-	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_vdec[] = {
-	{ .compatible = "mediatek,mt8183-vdecsys", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-vdecsys",
+		.data = &vdec_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_vdec_drv = {
-	.probe = clk_mt8183_vdec_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-vdec",
 		.of_match_table = of_match_clk_mt8183_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8183-venc.c b/drivers/clk/mediatek/clk-mt8183-venc.c
index f86ec607d87a..0051c5d92fc5 100644
--- a/drivers/clk/mediatek/clk-mt8183-venc.c
+++ b/drivers/clk/mediatek/clk-mt8183-venc.c
@@ -30,26 +30,23 @@ static const struct mtk_gate venc_clks[] = {
 		"mm_sel", 8),
 };
 
-static int clk_mt8183_venc_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_VENC_NR_CLK);
-
-	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
-			clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc venc_desc = {
+	.clks = venc_clks,
+	.num_clks = ARRAY_SIZE(venc_clks),
+};
 
 static const struct of_device_id of_match_clk_mt8183_venc[] = {
-	{ .compatible = "mediatek,mt8183-vencsys", },
-	{}
+	{
+		.compatible = "mediatek,mt8183-vencsys",
+		.data = &venc_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt8183_venc_drv = {
-	.probe = clk_mt8183_venc_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-venc",
 		.of_match_table = of_match_clk_mt8183_venc,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
