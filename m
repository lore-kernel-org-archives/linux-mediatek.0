Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB54CCA48B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 14:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HBqZeJUdjxkzh5hrKxBcXbtaA1jFaMOL+KUWx6Yyb8=; b=olFw3y23HBcsxfscuvqo+UBmxn
	97ix+Ad6Kj5rtOjFBE4iJr1pym4TYXVpzui14p0oUqgOCOVPehXczhWk16fgEuOLmjr1NwQ2Tad+v
	2jgfalW/ZuKfGo8zaMFzLeNL6LwCcBVefgyU6UExpYGwOdwOAbtGokChnZIw+c4iuMQ2jaLrdyAIq
	GBlydBTnNgmhqTlWH7aPiEZVqIR0jfYcER3VZzbXHjYnMg15/ZFC0YZmvLVS4FfxvUNxON5LbZydZ
	q8p26S3BkH++nerEuy5yTDNndtKTryRkrQg93hShsgqKYu6/Sl72mQC3CVbN2trObgnHhDbNFeVPu
	7KSEr0Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hzw-005SQe-3Q; Fri, 01 Jul 2022 14:51:56 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Hzm-005SKX-ER
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 14:51:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id k9so2683408pfg.5
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 07:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8HBqZeJUdjxkzh5hrKxBcXbtaA1jFaMOL+KUWx6Yyb8=;
        b=E4p4OxtxtTkhgKLEFn/meT47L14lVaxyHdCQ3Q7lSPtw9F9kho70k3WeyANLiXiS8Z
         /DM5poYs2yIxf0CDRuqJziA2ICz1xNMptNxgjDmc/nE3lmYnrM+5Gsa2eGy/qtIhlTtY
         ev/iaMP4FDP43rVML4bhOUDlpAJatYas8uM+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8HBqZeJUdjxkzh5hrKxBcXbtaA1jFaMOL+KUWx6Yyb8=;
        b=DfqT15B16uOlbfaTsegK5p4EGKfNRGHkqLYwmyWmxHnGhdju6CI8S9BmdOvrFa+uyD
         4Sb9ya5KjNQYYViEqGOTlckATm4wU2RxQQ+XQqP4IX8sB5ZgNEb94BFpHEdRporGotNz
         0IYWIxNHizv6uYoykn4OiwRzakzv1YOKz0Zu8SrMgAeM2DWZBDSveWqeem/JEgZ7JH2c
         5Jt6FI8NuiUSmt/zeXfadCzbjiFRNQhpkx9BlzwiG0E6/mv8RhEJ9Pp0IhOiIxc2jAzJ
         ChawIek4fjBdixu2+BQF2+kSITnNySSVMSSFZbrCdxGqqY73oW87Ld69/6RxrZq5gH5I
         5zqg==
X-Gm-Message-State: AJIora9JF+DzzjoeGXuMBV4+84nmw0myPyKuULQEhLUsIprjBtyiS6/K
	X/zQYqHJgRQhvtR2tC+hrxZBaQ==
X-Google-Smtp-Source: AGRyM1tKEGzGEnYdoMoIQSxmKjFFraFY7nPFivGGOauoJYaYqvqTqZ+UsSz2Ea2HtcbQ+pqHQD2duQ==
X-Received: by 2002:a05:6a00:1d0d:b0:525:4214:e61b with SMTP id a13-20020a056a001d0d00b005254214e61bmr21630467pfx.28.1656687102455;
        Fri, 01 Jul 2022 07:51:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id i4-20020a17090332c400b0016a214e4afasm15780981plr.125.2022.07.01.07.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 07:51:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: mediatek: mt8183: Convert gate only drivers to mtk_clk_simple_*()
Date: Fri,  1 Jul 2022 22:51:31 +0800
Message-Id: <20220701145133.1152387-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701145133.1152387-1-wenst@chromium.org>
References: <20220701145133.1152387-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_075146_582879_991B691A 
X-CRM114-Status: GOOD (  15.00  )
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

mtk_clk_simple_*() was added after the MT8183 clock drivers were merged.
They provide shared boiler plate for clock providers that only have
clock gates.

Convert many of the MT8183 clock drivers to mtk_clk_simple_*(). This
also adds proper driver removal support for them.

Since the mtk_clk_simple_probe() function allocates the clk_hw pointer
array based on .num_clks given, it effectively requires there are no
holes in the clock ID map. Check that the size of the array matches
the number of clocks with a static assertion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8183-cam.c     | 21 ++++++++-------------
 drivers/clk/mediatek/clk-mt8183-img.c     | 21 ++++++++-------------
 drivers/clk/mediatek/clk-mt8183-ipu0.c    | 21 ++++++++-------------
 drivers/clk/mediatek/clk-mt8183-ipu1.c    | 21 ++++++++-------------
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c | 21 ++++++++-------------
 drivers/clk/mediatek/clk-mt8183-vdec.c    | 21 ++++++++-------------
 drivers/clk/mediatek/clk-mt8183-venc.c    | 21 ++++++++-------------
 7 files changed, 56 insertions(+), 91 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183-cam.c b/drivers/clk/mediatek/clk-mt8183-cam.c
index fcc598a45165..00492a451709 100644
--- a/drivers/clk/mediatek/clk-mt8183-cam.c
+++ b/drivers/clk/mediatek/clk-mt8183-cam.c
@@ -34,26 +34,21 @@ static const struct mtk_gate cam_clks[] = {
 	GATE_CAM(CLK_CAM_CCU, "cam_ccu", "cam_sel", 12),
 };
 
-static int clk_mt8183_cam_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(cam_clks) == CLK_CAM_NR_CLK);
 
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
+	{ .compatible = "mediatek,mt8183-camsys", .data = &cam_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_cam_drv = {
-	.probe = clk_mt8183_cam_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-cam",
 		.of_match_table = of_match_clk_mt8183_cam,
diff --git a/drivers/clk/mediatek/clk-mt8183-img.c b/drivers/clk/mediatek/clk-mt8183-img.c
index eb2def2cf0ae..9c9dc71dd398 100644
--- a/drivers/clk/mediatek/clk-mt8183-img.c
+++ b/drivers/clk/mediatek/clk-mt8183-img.c
@@ -34,26 +34,21 @@ static const struct mtk_gate img_clks[] = {
 	GATE_IMG(CLK_IMG_OWE, "img_owe", "img_sel", 9),
 };
 
-static int clk_mt8183_img_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(img_clks) == CLK_IMG_NR_CLK);
 
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
+	{ .compatible = "mediatek,mt8183-imgsys", .data = &img_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_img_drv = {
-	.probe = clk_mt8183_img_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-img",
 		.of_match_table = of_match_clk_mt8183_img,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu0.c b/drivers/clk/mediatek/clk-mt8183-ipu0.c
index b30fc9f47518..b5ea97ff72fe 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu0.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu0.c
@@ -27,26 +27,21 @@ static const struct mtk_gate ipu_core0_clks[] = {
 	GATE_IPU_CORE0(CLK_IPU_CORE0_IPU, "ipu_core0_ipu", "dsp_sel", 2),
 };
 
-static int clk_mt8183_ipu_core0_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(ipu_core0_clks) == CLK_IPU_CORE0_NR_CLK);
 
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
+	{ .compatible = "mediatek,mt8183-ipu_core0", .data = &ipu_core0_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_ipu_core0_drv = {
-	.probe = clk_mt8183_ipu_core0_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_core0",
 		.of_match_table = of_match_clk_mt8183_ipu_core0,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu1.c b/drivers/clk/mediatek/clk-mt8183-ipu1.c
index b378957e11d0..09f96ed3cf1c 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu1.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu1.c
@@ -27,26 +27,21 @@ static const struct mtk_gate ipu_core1_clks[] = {
 	GATE_IPU_CORE1(CLK_IPU_CORE1_IPU, "ipu_core1_ipu", "dsp_sel", 2),
 };
 
-static int clk_mt8183_ipu_core1_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(ipu_core1_clks) == CLK_IPU_CORE1_NR_CLK);
 
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
+	{ .compatible = "mediatek,mt8183-ipu_core1", .data = &ipu_core1_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_ipu_core1_drv = {
-	.probe = clk_mt8183_ipu_core1_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_core1",
 		.of_match_table = of_match_clk_mt8183_ipu_core1,
diff --git a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
index 941b43ac8bec..3181b0829d80 100644
--- a/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
+++ b/drivers/clk/mediatek/clk-mt8183-ipu_adl.c
@@ -25,26 +25,21 @@ static const struct mtk_gate ipu_adl_clks[] = {
 	GATE_IPU_ADL_I(CLK_IPU_ADL_CABGEN, "ipu_adl_cabgen", "dsp_sel", 24),
 };
 
-static int clk_mt8183_ipu_adl_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(ipu_adl_clks) == CLK_IPU_ADL_NR_CLK);
 
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
+	{ .compatible = "mediatek,mt8183-ipu_adl", .data = &ipu_adl_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_ipu_adl_drv = {
-	.probe = clk_mt8183_ipu_adl_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-ipu_adl",
 		.of_match_table = of_match_clk_mt8183_ipu_adl,
diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediatek/clk-mt8183-vdec.c
index 0548cde159d0..94dd6ab6b3a0 100644
--- a/drivers/clk/mediatek/clk-mt8183-vdec.c
+++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
@@ -38,26 +38,21 @@ static const struct mtk_gate vdec_clks[] = {
 	GATE_VDEC1_I(CLK_VDEC_LARB1, "vdec_larb1", "mm_sel", 0),
 };
 
-static int clk_mt8183_vdec_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(vdec_clks) == CLK_VDEC_NR_CLK);
 
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
+	{ .compatible = "mediatek,mt8183-vdecsys", .data = &vdec_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_vdec_drv = {
-	.probe = clk_mt8183_vdec_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-vdec",
 		.of_match_table = of_match_clk_mt8183_vdec,
diff --git a/drivers/clk/mediatek/clk-mt8183-venc.c b/drivers/clk/mediatek/clk-mt8183-venc.c
index f86ec607d87a..33ef3be02727 100644
--- a/drivers/clk/mediatek/clk-mt8183-venc.c
+++ b/drivers/clk/mediatek/clk-mt8183-venc.c
@@ -30,26 +30,21 @@ static const struct mtk_gate venc_clks[] = {
 		"mm_sel", 8),
 };
 
-static int clk_mt8183_venc_probe(struct platform_device *pdev)
-{
-	struct clk_hw_onecell_data *clk_data;
-	struct device_node *node = pdev->dev.of_node;
+static_assert(ARRAY_SIZE(venc_clks) == CLK_VENC_NR_CLK);
 
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
+	{ .compatible = "mediatek,mt8183-vencsys", .data = &venc_desc },
 	{}
 };
 
 static struct platform_driver clk_mt8183_venc_drv = {
-	.probe = clk_mt8183_venc_probe,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8183-venc",
 		.of_match_table = of_match_clk_mt8183_venc,
-- 
2.37.0.rc0.161.g10f37bed90-goog


