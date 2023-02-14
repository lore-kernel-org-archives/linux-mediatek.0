Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073C1C6379F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JH6NWf0Qae8wKQ3C3NeuRQ154dXA1x7rDH36XQOyAZs=; b=tCKm4FstbrGnmZTpk0ApAEng8G
	pGekQNwtjPpMqYjzVEtvSscBwOdlyX9rDFN1JfD981+UncotgQXR1YVER1A2eXt/dSNB1hX0i6LFV
	lOG9C72rGoj87IvqLSYB/xEDI6WnJBQBDhN8VU/F00Dhha0IFKCK0XS9D3+QVj8KVnsQfwP5dE9TW
	WY2BTrOA+5xn1MstjZBs5YqxgPhAnBUt8+dGm27R0x9FLCE698ObyjwzSrI+306hSBrfcHuPieAvX
	LOGi0hXZYxwGbI2NuJSs7yc/DixVuCCvwZ2/D1wOPFytesXb/tdRSdMUjIWbHcWMMJKr2BbNFGehz
	1voO/7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRveH-001oNC-8h; Tue, 14 Feb 2023 13:47:09 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRvZH-001ldp-63; Tue, 14 Feb 2023 13:42:00 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDB80660216E;
	Tue, 14 Feb 2023 13:41:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676382118;
	bh=W1hCb/GVpxVj6kcJ2pUutNXHndgZx+UpTjJu3uvyuG0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ah7upU//4WPyQW6NFIxxuVfmdDMhBcMl87hlMATvCdzMqXFkugc6poYZcG456fqWM
	 anGiXM6KOVjEYAofbjgryExXYM5aMSg935j2XwnbE5wehCglQduGqtqjCCQzzAZL2p
	 1nxMvDJKpNso0NaTWhpd8Ci6zehlSyP7KMIAhaHZLluJggcet30RrCob1hT7LMTRex
	 FsADuAwJyD4QFk4ot24a4W2b4fcZ5mvHMTwShsOQ+4rFcrZwjb57cSSnkwT1/++iVJ
	 13c0U2Nf1bSTpi23CeJLye7njSGp39H7uLiRs6Z673pVTA8XxNpkamVl4LojwjXQrb
	 afx9aM1+kFJbw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 12/47] clk: mediatek: mt8365: Join top_misc_mux_gates and top_misc_muxes arrays
Date: Tue, 14 Feb 2023 14:40:52 +0100
Message-Id: <20230214134127.59273-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_054159_510347_0E0B328F 
X-CRM114-Status: GOOD (  12.37  )
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

In preparation for migrating this driver to the simple probe mechanism,
join the audio gates to the top_misc_mux_gates array of mtk_composite
clocks in one top_misc_muxes array.

While at it, since the `apll_i2s0_parents` array is for all i2s clocks,
rename that to `apll_i2s_parents`.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8365.c | 46 ++++++++++---------------------
 1 file changed, 14 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
index 85fe7586a69b..fef6c653c9ce 100644
--- a/drivers/clk/mediatek/clk-mt8365.c
+++ b/drivers/clk/mediatek/clk-mt8365.c
@@ -384,25 +384,23 @@ static const char * const mbist_diag_parents[] = {
 	"univpll2_d8"
 };
 
-static const char * const apll_i2s0_parents[] = {
+static const char * const apll_i2s_parents[] = {
 	"aud_1_sel",
 	"aud_2_sel"
 };
 
-static struct mtk_composite top_misc_mux_gates[] = {
+static struct mtk_composite top_misc_muxes[] = {
 	/* CLK_CFG_11 */
 	MUX_GATE(CLK_TOP_MBIST_DIAG_SEL, "mbist_diag_sel", mbist_diag_parents,
 		 0x0ec, 0, 2, 7),
-};
-
-static struct mt8365_clk_audio_mux top_misc_muxes[] = {
-	{ CLK_TOP_APLL_I2S0_SEL, "apll_i2s0_sel", 11},
-	{ CLK_TOP_APLL_I2S1_SEL, "apll_i2s1_sel", 12},
-	{ CLK_TOP_APLL_I2S2_SEL, "apll_i2s2_sel", 13},
-	{ CLK_TOP_APLL_I2S3_SEL, "apll_i2s3_sel", 14},
-	{ CLK_TOP_APLL_TDMOUT_SEL, "apll_tdmout_sel", 15},
-	{ CLK_TOP_APLL_TDMIN_SEL, "apll_tdmin_sel", 16},
-	{ CLK_TOP_APLL_SPDIF_SEL, "apll_spdif_sel", 17},
+	/* Audio MUX */
+	MUX(CLK_TOP_APLL_I2S0_SEL, "apll_i2s0_sel", apll_i2s_parents, 0x0320, 11, 1),
+	MUX(CLK_TOP_APLL_I2S1_SEL, "apll_i2s1_sel", apll_i2s_parents, 0x0320, 12, 1),
+	MUX(CLK_TOP_APLL_I2S2_SEL, "apll_i2s2_sel", apll_i2s_parents, 0x0320, 13, 1),
+	MUX(CLK_TOP_APLL_I2S3_SEL, "apll_i2s3_sel", apll_i2s_parents, 0x0320, 14, 1),
+	MUX(CLK_TOP_APLL_TDMOUT_SEL, "apll_tdmout_sel", apll_i2s_parents, 0x0320, 15, 1),
+	MUX(CLK_TOP_APLL_TDMIN_SEL, "apll_tdmin_sel", apll_i2s_parents, 0x0320, 16, 1),
+	MUX(CLK_TOP_APLL_SPDIF_SEL, "apll_spdif_sel", apll_i2s_parents, 0x0320, 17, 1),
 };
 
 #define CLK_CFG_UPDATE 0x004
@@ -787,28 +785,12 @@ static int clk_mt8365_top_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_factors;
 
-	ret = mtk_clk_register_composites(&pdev->dev, top_misc_mux_gates,
-					  ARRAY_SIZE(top_misc_mux_gates), base,
+	ret = mtk_clk_register_composites(&pdev->dev, top_misc_muxes,
+					  ARRAY_SIZE(top_misc_muxes), base,
 					  &mt8365_clk_lock, clk_data);
 	if (ret)
 		goto unregister_muxes;
 
-	for (i = 0; i != ARRAY_SIZE(top_misc_muxes); ++i) {
-		struct mt8365_clk_audio_mux *mux = &top_misc_muxes[i];
-		struct clk_hw *hw;
-
-		hw = devm_clk_hw_register_mux(dev, mux->name, apll_i2s0_parents,
-					      ARRAY_SIZE(apll_i2s0_parents),
-					      CLK_SET_RATE_PARENT, base + 0x320,
-					      mux->shift, 1, 0, NULL);
-		if (IS_ERR(hw)) {
-			ret = PTR_ERR(hw);
-			goto unregister_composites;
-		}
-
-		clk_data->hws[mux->id] = hw;
-	}
-
 	ret = mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
 					base, &mt8365_clk_lock, clk_data);
 	if (ret)
@@ -830,8 +812,8 @@ static int clk_mt8365_top_probe(struct platform_device *pdev)
 	mtk_clk_unregister_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
 				    clk_data);
 unregister_composites:
-	mtk_clk_unregister_composites(top_misc_mux_gates,
-				      ARRAY_SIZE(top_misc_mux_gates), clk_data);
+	mtk_clk_unregister_composites(top_misc_muxes,
+				      ARRAY_SIZE(top_misc_muxes), clk_data);
 unregister_muxes:
 	mtk_clk_unregister_muxes(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 unregister_factors:
-- 
2.39.1


