Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C42C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SC417dr1WHcJBpcgt93z6IHksRMeqr+Vm7+4zO0HbbM=; b=USriByDaZtdDLs
	TPzp5hBnKxeULM9XbDJTMYUC0aG850eSn2YBY6tDjUqNaauJDpzgu4FhTxukYVCL1DG4aTqCISEy+
	hzgt76qdL4w4wMllj9WAHNHkk9Ldz5xeB6PLv/NdyUPSDi5pvxrG/SseO6b7PP+aDhTdbU/j23uOl
	aB5cZ0CL9eLmSaYcx3Hi3LD4jXv/YTSlczpSsQVyz08PtwzH1NmKLePMYfTflCY01v6z3DuoTlQGd
	5jGuE3Nxw9gL7rkME7na0o/kbea4wYuARCGpPbEczr3tZOAds5V4FlfY3KJs4TYapQMqx+Z3FLM1o
	qbPgQc+mB8mRP6S8IaTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntAdv-0058uO-3e; Mon, 23 May 2022 16:10:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntAcl-0058M4-NC; Mon, 23 May 2022 16:09:41 +0000
X-UUID: fe185f2ec8e94ca1aed7ec2819434ed0-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:10a52765-7d88-4ff9-9722-23c65fe6723a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:e7e340e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: fe185f2ec8e94ca1aed7ec2819434ed0-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 579622964; Mon, 23 May 2022 09:09:35 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 09:01:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 00:01:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 24 May 2022 00:01:01 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/8] clk: mediatek: mt6779: use mtk_clk_simple_probe to
 simplify driver
Date: Tue, 24 May 2022 00:00:47 +0800
Message-ID: <20220523160053.1922-6-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220523160053.1922-1-miles.chen@mediatek.com>
References: <20220523160053.1922-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_090939_797717_AC513A0D 
X-CRM114-Status: GOOD (  14.58  )
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
 drivers/clk/mediatek/clk-mt6779-aud.c  | 29 ++++++++++++--------------
 drivers/clk/mediatek/clk-mt6779-cam.c  | 29 ++++++++++++--------------
 drivers/clk/mediatek/clk-mt6779-img.c  | 29 ++++++++++++--------------
 drivers/clk/mediatek/clk-mt6779-ipe.c  | 29 ++++++++++++--------------
 drivers/clk/mediatek/clk-mt6779-mfg.c  | 27 +++++++++++-------------
 drivers/clk/mediatek/clk-mt6779-vdec.c | 29 ++++++++++++--------------
 drivers/clk/mediatek/clk-mt6779-venc.c | 29 ++++++++++++--------------
 7 files changed, 90 insertions(+), 111 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
index 97e44abb7e87..6e473ae1fd90 100644
--- a/drivers/clk/mediatek/clk-mt6779-aud.c
+++ b/drivers/clk/mediatek/clk-mt6779-aud.c
@@ -89,26 +89,23 @@ static const struct mtk_gate audio_clks[] = {
 		    "audio_h_sel", 31),
 };
 
-static const struct of_device_id of_match_clk_mt6779_aud[] = {
-	{ .compatible = "mediatek,mt6779-audio", },
-	{}
+static const struct mtk_clk_desc audio_desc = {
+	.clks = audio_clks,
+	.num_clks = ARRAY_SIZE(audio_clks),
 };
 
-static int clk_mt6779_aud_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_AUD_NR_CLK);
-
-	mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
-			       clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct of_device_id of_match_clk_mt6779_aud[] = {
+	{
+		.compatible = "mediatek,mt6779-audio",
+		.data = &audio_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6779_aud_drv = {
-	.probe = clk_mt6779_aud_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-aud",
 		.of_match_table = of_match_clk_mt6779_aud,
diff --git a/drivers/clk/mediatek/clk-mt6779-cam.c b/drivers/clk/mediatek/clk-mt6779-cam.c
index 9c5117aae146..7be3db90fa4a 100644
--- a/drivers/clk/mediatek/clk-mt6779-cam.c
+++ b/drivers/clk/mediatek/clk-mt6779-cam.c
@@ -38,26 +38,23 @@ static const struct mtk_gate cam_clks[] = {
 	GATE_CAM(CLK_CAM_FAKE_ENG, "camsys_fake_eng", "cam_sel", 14),
 };
 
-static const struct of_device_id of_match_clk_mt6779_cam[] = {
-	{ .compatible = "mediatek,mt6779-camsys", },
-	{}
+static const struct mtk_clk_desc cam_desc = {
+	.clks = cam_clks,
+	.num_clks = ARRAY_SIZE(cam_clks),
 };
 
-static int clk_mt6779_cam_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_CAM_NR_CLK);
-
-	mtk_clk_register_gates(node, cam_clks, ARRAY_SIZE(cam_clks),
-			       clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct of_device_id of_match_clk_mt6779_cam[] = {
+	{
+		.compatible = "mediatek,mt6779-camsys",
+		.data = &cam_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6779_cam_drv = {
-	.probe = clk_mt6779_cam_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-cam",
 		.of_match_table = of_match_clk_mt6779_cam,
diff --git a/drivers/clk/mediatek/clk-mt6779-img.c b/drivers/clk/mediatek/clk-mt6779-img.c
index 801271477d46..9bc51fc82dbd 100644
--- a/drivers/clk/mediatek/clk-mt6779-img.c
+++ b/drivers/clk/mediatek/clk-mt6779-img.c
@@ -30,26 +30,23 @@ static const struct mtk_gate img_clks[] = {
 	GATE_IMG(CLK_IMG_WPE_A, "imgsys_wpe_a", "img_sel", 7),
 };
 
-static const struct of_device_id of_match_clk_mt6779_img[] = {
-	{ .compatible = "mediatek,mt6779-imgsys", },
-	{}
+static const struct mtk_clk_desc img_desc = {
+	.clks = img_clks,
+	.num_clks = ARRAY_SIZE(img_clks),
 };
 
-static int clk_mt6779_img_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IMG_NR_CLK);
-
-	mtk_clk_register_gates(node, img_clks, ARRAY_SIZE(img_clks),
-			       clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct of_device_id of_match_clk_mt6779_img[] = {
+	{
+		.compatible = "mediatek,mt6779-imgsys",
+		.data = &img_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6779_img_drv = {
-	.probe = clk_mt6779_img_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-img",
 		.of_match_table = of_match_clk_mt6779_img,
diff --git a/drivers/clk/mediatek/clk-mt6779-ipe.c b/drivers/clk/mediatek/clk-mt6779-ipe.c
index f67814ca7dfb..92e9d1ade422 100644
--- a/drivers/clk/mediatek/clk-mt6779-ipe.c
+++ b/drivers/clk/mediatek/clk-mt6779-ipe.c
@@ -32,26 +32,23 @@ static const struct mtk_gate ipe_clks[] = {
 	GATE_IPE(CLK_IPE_DPE, "ipe_dpe", "ipe_sel", 6),
 };
 
-static const struct of_device_id of_match_clk_mt6779_ipe[] = {
-	{ .compatible = "mediatek,mt6779-ipesys", },
-	{}
+static const struct mtk_clk_desc ipe_desc = {
+	.clks = ipe_clks,
+	.num_clks = ARRAY_SIZE(ipe_clks),
 };
 
-static int clk_mt6779_ipe_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_IPE_NR_CLK);
-
-	mtk_clk_register_gates(node, ipe_clks, ARRAY_SIZE(ipe_clks),
-			       clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct of_device_id of_match_clk_mt6779_ipe[] = {
+	{
+		.compatible = "mediatek,mt6779-ipesys",
+		.data = &ipe_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6779_ipe_drv = {
-	.probe = clk_mt6779_ipe_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-ipe",
 		.of_match_table = of_match_clk_mt6779_ipe,
diff --git a/drivers/clk/mediatek/clk-mt6779-mfg.c b/drivers/clk/mediatek/clk-mt6779-mfg.c
index fc7387b59758..efc793a1969a 100644
--- a/drivers/clk/mediatek/clk-mt6779-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6779-mfg.c
@@ -27,26 +27,23 @@ static const struct mtk_gate mfg_clks[] = {
 	GATE_MFG(CLK_MFGCFG_BG3D, "mfg_bg3d", "mfg_sel", 0),
 };
 
-static int clk_mt6779_mfg_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_MFGCFG_NR_CLK);
-
-	mtk_clk_register_gates(node, mfg_clks, ARRAY_SIZE(mfg_clks),
-			       clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct mtk_clk_desc mfg_desc = {
+	.clks = mfg_clks,
+	.num_clks = ARRAY_SIZE(mfg_clks),
+};
 
 static const struct of_device_id of_match_clk_mt6779_mfg[] = {
-	{ .compatible = "mediatek,mt6779-mfgcfg", },
-	{}
+	{
+		.compatible = "mediatek,mt6779-mfgcfg",
+		.data = &mfg_desc,
+	}, {
+		/* sentinel */
+	}
 };
 
 static struct platform_driver clk_mt6779_mfg_drv = {
-	.probe = clk_mt6779_mfg_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-mfg",
 		.of_match_table = of_match_clk_mt6779_mfg,
diff --git a/drivers/clk/mediatek/clk-mt6779-vdec.c b/drivers/clk/mediatek/clk-mt6779-vdec.c
index 7e195b082e86..3209a6518d5b 100644
--- a/drivers/clk/mediatek/clk-mt6779-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6779-vdec.c
@@ -39,26 +39,23 @@ static const struct mtk_gate vdec_clks[] = {
 	GATE_VDEC1_I(CLK_VDEC_LARB1, "vdec_larb1_cken", "vdec_sel", 0),
 };
 
-static const struct of_device_id of_match_clk_mt6779_vdec[] = {
-	{ .compatible = "mediatek,mt6779-vdecsys", },
-	{}
+static const struct mtk_clk_desc vdec_desc = {
+	.clks = vdec_clks,
+	.num_clks = ARRAY_SIZE(vdec_clks),
 };
 
-static int clk_mt6779_vdec_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_VDEC_GCON_NR_CLK);
-
-	mtk_clk_register_gates(node, vdec_clks, ARRAY_SIZE(vdec_clks),
-			       clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct of_device_id of_match_clk_mt6779_vdec[] = {
+	{
+		.compatible = "mediatek,mt6779-vdecsys",
+		.data = &vdec_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6779_vdec_drv = {
-	.probe = clk_mt6779_vdec_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-vdec",
 		.of_match_table = of_match_clk_mt6779_vdec,
diff --git a/drivers/clk/mediatek/clk-mt6779-venc.c b/drivers/clk/mediatek/clk-mt6779-venc.c
index 573efa87c9bd..c25035c0f334 100644
--- a/drivers/clk/mediatek/clk-mt6779-venc.c
+++ b/drivers/clk/mediatek/clk-mt6779-venc.c
@@ -30,26 +30,23 @@ static const struct mtk_gate venc_clks[] = {
 	GATE_VENC_I(CLK_VENC_GCON_GALS, "venc_gals", "venc_sel", 28),
 };
 
-static const struct of_device_id of_match_clk_mt6779_venc[] = {
-	{ .compatible = "mediatek,mt6779-vencsys", },
-	{}
+static const struct mtk_clk_desc venc_desc = {
+	.clks = venc_clks,
+	.num_clks = ARRAY_SIZE(venc_clks),
 };
 
-static int clk_mt6779_venc_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
-
-	clk_data = mtk_alloc_clk_data(CLK_VENC_GCON_NR_CLK);
-
-	mtk_clk_register_gates(node, venc_clks, ARRAY_SIZE(venc_clks),
-			       clk_data);
-
-	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-}
+static const struct of_device_id of_match_clk_mt6779_venc[] = {
+	{
+		.compatible = "mediatek,mt6779-vencsys",
+		.data = &venc_desc,
+	}, {
+		/* sentinel */
+	}
+};
 
 static struct platform_driver clk_mt6779_venc_drv = {
-	.probe = clk_mt6779_venc_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt6779-venc",
 		.of_match_table = of_match_clk_mt6779_venc,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
