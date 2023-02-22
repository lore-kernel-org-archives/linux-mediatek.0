Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B33C6379F
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5G5FZDTKyOkg09rAcDDNdH3OjrhqDu3UBeCM8OtRbVs=; b=PZvWe/048VJA1eaPYuGE9PzE7H
	lrcNUdpM93GThxef6bUj2AwhmcjyNY9WNnATQzrwMlBd+NnPhq+2IKyLbsUHuPZXGa8YvuuzbxeRn
	NHVpZAQMzsuOUKpSWJ++loUlvW6D6OEwweb0gEmij7e0X4NyfmdLPkzgRiY8zx8hfSXFK+LgWgs5A
	PPZGFnW9ZHlo4A7Pe1fPeVWj9N2xuXbOQEdJIBDm3JqG+dY20dJelbSngD2TV3XIL9ALlItRBg7PE
	+HXVp+1I+kXXIC26aquLatTshY6q5KVt2YG9aIuWzekmDowBz+7dhNT+rLzOSOGFBD/7hkoq0CxZ1
	2jYLj/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlYL-00BVD4-2k; Wed, 22 Feb 2023 09:36:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlOA-00BPpx-HJ; Wed, 22 Feb 2023 09:26:16 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39F5B660215E;
	Wed, 22 Feb 2023 09:26:12 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677057973;
	bh=Iu6k+PbPBvtvaUy/uF3aIBmcGMGBX1+Dm5St8Qyg5Gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VP1r4Nca1HN30QGUdL3e6Zco8UR2mSkMgMB6alrC3slWmG6oFJ2GyhiENSFOgz+Jx
	 JbvFx2JcoexmJ3Elx/EoAlAAQeClOhr5I9niBPXyzAPIoPNqJJ/8eWp4DboMWDDqiV
	 7qBfVLJzTsb95XNekrxSdm3lB6c/2qOWroDDKzbHSs/BhBN2xpOS6tdL6HPY2+ROz/
	 GUvhHRraiTzCZ7c2so2qEAZwONWErJl0NfPcBe2d9Ud1khpWAzmYum/1ncKtLWruf7
	 aQO9704mEvakH2zrDGxpiVkGPyJcycJK5m6sgpQdtaj1zlA37jA0aeXBsZxSq9jaBE
	 ikYuZ3mR82w6g==
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 13/54] clk: mediatek: mt8365: Join top_misc_mux_gates and top_misc_muxes arrays
Date: Wed, 22 Feb 2023 10:25:02 +0100
Message-Id: <20230222092543.19187-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
References: <20230222092543.19187-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_012614_756089_9801F7C1 
X-CRM114-Status: GOOD (  12.75  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
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
2.39.2


