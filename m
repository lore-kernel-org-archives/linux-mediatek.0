Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402F9C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwj6EBv/zIrCMqaul4jxoTOv2/8Z3qecnlfFOCxkFms=; b=Z30YVKwEixQlS3gV09g2hX3lPy
	ryYq53lFiZrA14KrbqVYeK+PYf0ETrYH7zxwur4kucYPPK91Qy9WQxARLgHPZ5lbeCftzabaG5vIk
	6/FZPNp3XaQhJwhvYJqjC+SdM+S7BkqHnnvoB6LfToYWVSQhYXPaW752/z+y8GS15oxhuKibc60Ld
	9Uu+yc3kAvoWUrKBFUdDA/s9VTIcAmhHCzsxdVAO7MVG5lZa4U57J4lU6/KHa+6h+yig8bd+rz74A
	2uzsgPwKnETbPrzUXq8ObNGHpwfXBu0gVOJ6vYI+uoabEKiuoo8uojM2ObaFNHuIL5ZtpKcG9No8a
	WFx0GwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8euG-0067xi-RD; Fri, 23 Dec 2022 10:04:01 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eaQ-005ssk-8g; Fri, 23 Dec 2022 09:43:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A03B76602D0D;
	Fri, 23 Dec 2022 09:43:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671788608;
	bh=p4HuxSnc6rYIjz4n4YZOsHO8uVPvIY0fR52pGIHTaV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aEtFMMjzr1Ic9EYQcGv+RtSahEiiR3Eiud0LCrk6AJp+Tjdsi//JSTCUJ1vTs0WND
	 zE5FGQftHmWaXthWoFparZTgmhkYmN3fOahoNRIow2RTpHRkg+Kd5J57YhVJ1oOTHm
	 5OiM7xAN3xvXitMz4Yo6hQMJi0NNIdQ2icuauGrlA76RUIl/29fzA72GwNqqZGRvK9
	 fPjJ8aU9GZ3o4q+OjgoeKxWVIPn1Fy30EWmtYRQ9kdstbfF/DADe7F5TNNv+H6KEn6
	 IO8chWSw9ZHWWtLp+83+UQGQamAoonGEOjZS2QJaulXNFxuv2TXiePF+ih0Ws8UIsq
	 ILW3+vCh1swJw==
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
Subject: [PATCH v2 15/23] clk: mediatek: mt8192: Join top_adj_divs and top_muxes
Date: Fri, 23 Dec 2022 10:42:51 +0100
Message-Id: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_014330_499608_B8C3CDDF 
X-CRM114-Status: GOOD (  11.81  )
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

These two are both mtk_composite arrays, one dependent on another, but
that's something that the clock framework is supposed to sort out and
anyway registering them separately isn't going to ease the framework's
job in checking dependencies.

Put the contents of top_adj_divs in top_muxes to join them together
and register them in one shot.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index ec9dc7fe848e..702770326286 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -698,9 +698,7 @@ static struct mtk_composite top_muxes[] = {
 	MUX(CLK_TOP_APLL_I2S7_M_SEL, "apll_i2s7_m_sel", apll_i2s_m_parents, 0x320, 23, 1),
 	MUX(CLK_TOP_APLL_I2S8_M_SEL, "apll_i2s8_m_sel", apll_i2s_m_parents, 0x320, 24, 1),
 	MUX(CLK_TOP_APLL_I2S9_M_SEL, "apll_i2s9_m_sel", apll_i2s_m_parents, 0x320, 25, 1),
-};
-
-static const struct mtk_composite top_adj_divs[] = {
+	/* APLL_DIV */
 	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "apll_i2s0_m_sel", 0x320, 0, 0x328, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "apll_i2s1_m_sel", 0x320, 1, 0x328, 8, 8),
 	DIV_GATE(CLK_TOP_APLL12_DIV2, "apll12_div2", "apll_i2s2_m_sel", 0x320, 2, 0x328, 8, 16),
@@ -1099,15 +1097,10 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_muxes;
 
-	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
-					&mt8192_clk_lock, top_clk_data, &pdev->dev);
-	if (r)
-		goto unregister_top_composites;
-
 	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
 					    top_clk_data, &pdev->dev);
 	if (r)
-		goto unregister_adj_divs_composites;
+		goto unregister_top_composites;
 
 	r = clk_mt8192_reg_mfg_mux_notifier(&pdev->dev,
 					    top_clk_data->hws[CLK_TOP_MFG_PLL_SEL]->clk);
@@ -1119,8 +1112,6 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 
 unregister_gates:
 	mtk_clk_unregister_gates(top_clks, ARRAY_SIZE(top_clks), top_clk_data);
-unregister_adj_divs_composites:
-	mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), top_clk_data);
 unregister_top_composites:
 	mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), top_clk_data);
 unregister_muxes:
-- 
2.39.0


