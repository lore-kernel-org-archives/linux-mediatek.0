Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2083C54EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 11:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wj1NDUspl/lh2JxWp557VpNe2372Bl+Z4h8QvWuScg=; b=DfeTkngJzUld4KQ1QG79RsBw+W
	fpydpS4sg+Vy4+h3FePxsZD/hNS5BePdIfUZMflof5f6am7xyTmcAxO7x9tSGtjiZ+h5r0mW2ke4M
	1tCqQKBjSeDI/sfORW6CJ3PQjKoYff3yHUK2Gl5pgRjYOAEs9v7vlxqMmFXWB/dbH9VK0xWm962LB
	/+caqPzg8xIdHmH4zAZEsZF9uJnZ4rT6UmBZ6h4WKoeyhSQ+54z96mbe/VWyHdazG4Z5wbzSgxSOU
	ZIMV4VhRloMYG07u94lmHF4jX3k63zUEGUZr44JEkTKUzKrdfaxJrGjjLTJ8rKYFj6iGHge7uQIkB
	TXRm3UgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIDp-002ANB-VN; Fri, 13 Jan 2023 11:27:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGHu9-0020hY-H9; Fri, 13 Jan 2023 11:07:27 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E37CE6602DD7;
	Fri, 13 Jan 2023 11:07:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673608044;
	bh=SXiLONoRIH0CB+iFY3cC1DgibyfjwwOez/ev+oSe93E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H7zwtXKiSJIvYUdxmx+dqpK/XBuebU/UdSFRFj5SxaPdzjqlpfW4nJtL/WIACGLe9
	 WFwduJeFh7cDGLAFEJ0ODW4FhG7fM04Dlm6cWG7hSmMfvk7mwnek1QLQZxFzt3WoZL
	 oNaNtZbBfZs54/6bh4NbPULdFVE1Q5FfJmc6mg2BzioDTithftbYPLflzvDjtQcLOl
	 k0cpouOEC2blQWGlQ9mkc1DaeKxSFfL39+s/YFSrgdKSV/cDiDeoOrny5Q1xfTlgqw
	 sS3+YB1wsoeda8Gb5Uezn4wyzTCmOAeXS6v/zFo4PmfD8CuESu2pJpGWMyOLhXAbPX
	 57HTNNYcUzENQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	fparent@baylibre.com,
	chun-jie.chen@mediatek.com,
	sam.shih@mediatek.com,
	y.oudjana@protonmail.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	ryder.lee@kernel.org,
	daniel@makrotopia.org,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	pablo.sun@mediatek.com,
	msp@baylibre.com,
	weiyi.lu@mediatek.com,
	ikjn@chromium.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 16/23] clk: mediatek: mt8186: Join top_adj_div and top_muxes
Date: Fri, 13 Jan 2023 12:06:09 +0100
Message-Id: <20230113110616.111001-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
References: <20230113110616.111001-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_030725_759333_625CC3F4 
X-CRM114-Status: GOOD (  11.11  )
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

Like done for MT8192, join the two to register them in one shot, as
there's no point in doing that separately from one another.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index 3ce2818dcbdd..c1107b2b614c 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -669,9 +669,6 @@ static struct mtk_composite top_muxes[] = {
 	MUX(CLK_TOP_APLL_I2S4_MCK_SEL, "apll_i2s4_mck_sel", apll_mck_parents, 0x0320, 19, 1),
 	MUX(CLK_TOP_APLL_TDMOUT_MCK_SEL, "apll_tdmout_mck_sel", apll_mck_parents,
 		0x0320, 20, 1),
-};
-
-static const struct mtk_composite top_adj_divs[] = {
 	DIV_GATE(CLK_TOP_APLL12_CK_DIV0, "apll12_div0", "apll_i2s0_mck_sel",
 			0x0320, 0, 0x0328, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_CK_DIV1, "apll12_div1", "apll_i2s1_mck_sel",
@@ -749,27 +746,19 @@ static int clk_mt8186_topck_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_muxes;
 
-	r = mtk_clk_register_composites(&pdev->dev, top_adj_divs,
-					ARRAY_SIZE(top_adj_divs), base,
-					&mt8186_clk_lock, clk_data);
-	if (r)
-		goto unregister_composite_muxes;
-
 	r = clk_mt8186_reg_mfg_mux_notifier(&pdev->dev,
 					    clk_data->hws[CLK_TOP_MFG]->clk);
 	if (r)
-		goto unregister_composite_divs;
+		goto unregister_composite_muxes;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		goto unregister_composite_divs;
+		goto unregister_composite_muxes;
 
 	platform_set_drvdata(pdev, clk_data);
 
 	return r;
 
-unregister_composite_divs:
-	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
 unregister_composite_muxes:
 	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 unregister_muxes:
@@ -789,7 +778,6 @@ static int clk_mt8186_topck_remove(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 
 	of_clk_del_provider(node);
-	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
 	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
 	mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), clk_data);
 	mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
-- 
2.39.0


