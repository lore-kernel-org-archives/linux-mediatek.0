Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26C9C6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ubtJP5qVSYYGZAiXEHGINHxz0Et/JdDA5N29olNJeEk=; b=SPJgkW2jJNV3jymmj2yl8OEPaB
	TGkJr0ZlWRtQSGRkIVwvsn90q43UHE6kha74F+KHuKEf/srt51NSfXZLGrdHlkpNfPI33Tr6Aj2dD
	C8+sbSI7MIxu1U/BaMpFzJzXLRZCdWtLVp8nrrNsVrW1VIgmpCtreY8uPu2M634fkpBWnfZBkH5d1
	EbWrcI828JIoxO7tthm8gvQyfExxGnQGrTpQYEG0awsH0+Lyxr+pqLQ6264xZDqMQPW5C2vZtTrBZ
	Nwtpy2bioI0hQjiUVLNoG40w/fP9R5MhfmuA/PbbnTbVgryrzKLcdiOj6oX1h9uUdB8vClL5NN7dt
	6l4CFP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7bK-009mbv-JL; Tue, 27 Sep 2022 10:14:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7Yz-009lMC-TR; Tue, 27 Sep 2022 10:11:43 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A5B6F660226B;
	Tue, 27 Sep 2022 11:11:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664273500;
	bh=SI+bsUvXdy+vcBrVZsvIUzXyHPAsjJKQ7BPKX/FdGuM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X4IKvUd5iazMIvbj5Mfe/imxa1qpYQlM+ZDXq9JfZYK5sDOORDxls8F+Xt+CoxTJ4
	 TBKpC8/4rHUzyHQe0LrhvyP0+pnVx4AcooV67qXCkAiIoBRU37BNmMh2XG6Fqvpowc
	 0VBUOPP7NkDZUPgCgK96FslGUS9EflMy2CN4X33d9jlU5pfvRL/QPHmSr8H0NRtxRm
	 o1wP9dr26xZfPRxUQOqdmibQKZo1w5k2VRlTVKOZ9xtNA8YELdSPv3edj3+ngi0POi
	 u1OEKwBiL+Cht4sJP0jlZKtIy14Dg7ndYEOHTcZ9Ad8N5PJ/z+kdStls/1CS7F5Cup
	 NlviEjm3a3HhQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	drinkcat@chromium.org,
	weiyi.lu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v3 06/10] clk: mediatek: clk-mt8195-topckgen: Register mfg_ck_fast_ref as generic mux
Date: Tue, 27 Sep 2022 12:11:24 +0200
Message-Id: <20220927101128.44758-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_031142_160407_F366131D 
X-CRM114-Status: GOOD (  12.26  )
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

This clock was being registered as clk-composite through the helpers
for the same in the MediaTek clock APIs but, in reality, this isn't
a composite clock.

Appropriately register this clock with devm_clk_hw_register_mux().
No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index ec70e1f65eaf..e1c3ab4e146b 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1149,11 +1149,6 @@ static const struct mtk_mux top_mtk_muxes[] = {
 	 */
 };
 
-static struct mtk_composite top_muxes[] = {
-	/* CLK_MISC_CFG_3 */
-	MUX(CLK_TOP_MFG_CK_FAST_REF, "mfg_ck_fast_ref", mfg_fast_parents, 0x0250, 8, 1),
-};
-
 static const struct mtk_composite top_adj_divs[] = {
 	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "top_i2si1_mck", 0x0320, 0, 0x0328, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "top_i2si2_mck", 0x0320, 1, 0x0328, 8, 8),
@@ -1226,6 +1221,7 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *top_clk_data;
 	struct device_node *node = pdev->dev.of_node;
+	struct clk_hw *hw;
 	int r;
 	void __iomem *base;
 
@@ -1253,15 +1249,17 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_factors;
 
-	r = mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
-					&mt8195_clk_lock, top_clk_data);
-	if (r)
+	hw = devm_clk_hw_register_mux(&pdev->dev, "mfg_ck_fast_ref", mfg_fast_parents,
+				      ARRAY_SIZE(mfg_fast_parents), CLK_SET_RATE_PARENT,
+				      (base + 0x250), 8, 1, 0, &mt8195_clk_lock);
+	if (IS_ERR(hw))
 		goto unregister_muxes;
+	top_clk_data->hws[CLK_TOP_MFG_CK_FAST_REF] = hw;
 
 	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
 					&mt8195_clk_lock, top_clk_data);
 	if (r)
-		goto unregister_composite_muxes;
+		goto unregister_muxes;
 
 	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
 	if (r)
@@ -1279,8 +1277,6 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
 unregister_composite_divs:
 	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
-unregister_composite_muxes:
-	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
 unregister_muxes:
 	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
 unregister_factors:
@@ -1300,7 +1296,6 @@ static int clk_mt8195_topck_remove(struct platform_device *pdev)
 	of_clk_del_provider(node);
 	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
 	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
-	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
 	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), top_clk_data);
 	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
 	mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
-- 
2.37.2


