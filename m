Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78695C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 10:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YK/69Pm40Q2dPturViVB0JeneEzs83XdRDqoS7G1k4g=; b=vnGs+1src/8QQaOOrI2B7TcuVG
	kHa4G55xCQXPSfqRTGAv1eWTTy5zN9YKeopgFlpPZvGwY0mXLyiRSA4uMuqziDI+mjYmdhHRdvz+O
	ltnDAMzqO9L3FB6SfN668DS+sgTse13w8DozHWoV1xdQst758vmkNFowAn4g6s4JZsQuUrjpRxHa0
	U/tV/tLXSneGilJ3Ojw1uTKHnJBVbRm932p1QkVr2pizrPJOfkjYVIdRyQc5DBfxi0lkLRgIXe4rE
	Gr+t5LgndTtJ/wpJn+GLa98CyFV4+vWibHM04fpw4697mmN6fnFFdskdV7Nm0aTesNJSoeqEmX0qe
	IBrKqLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8f1C-006DAF-Fx; Fri, 23 Dec 2022 10:11:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eaT-005sv5-5G; Fri, 23 Dec 2022 09:43:37 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8A0916602CE6;
	Fri, 23 Dec 2022 09:43:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671788611;
	bh=Uhu9GD9MVCGtK+Cy9WGWrUBM/Iih3hCMigVFtPFuyag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=f7AZpSWd1k0sg1/RdUG0Z3mcp++c5+63TzpbY3wkuzEvxUmWAFe0ZMhy6UcgpVGuE
	 5zmyqn3X5FMe/ARef/u8nzErvv0y4oVaEirXW6/GFOd4rXWdJLqZX3dO7TtYxXWXCU
	 Da7XYl2Fijq7LqRnIUWHmPHonAOdBhtcOGVN23CCR+LVYAaB88NqZwJ307RHwbE//7
	 KfW1vECTAGd6hp1tsmGlQjhNqY07HBJx9xZBbWWqeOwpUEbP7yp2zojwDRnsLw9zTz
	 fSXMTTL6NaUZS84V6K6jxA02A7eF6rAOUvcotOgvoNo5KiJ8Iq67p3/jv3TbgSRRpZ
	 ZwUAFqGf66THg==
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
Subject: [PATCH v2 17/23] clk: mediatek: clk-mt8183: Join top_aud_muxes and top_aud_divs
Date: Fri, 23 Dec 2022 10:42:53 +0100
Message-Id: <20221223094259.87373-18-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_014333_448099_EA087CAC 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

Join the two to register them in one shot.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8183.c | 34 +++++++++++++------------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
index f1d84c0730d5..be2a53b3a881 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -613,21 +613,6 @@ static const char * const apll_i2s5_parents[] = {
 	"aud_2_sel"
 };
 
-static struct mtk_composite top_aud_muxes[] = {
-	MUX(CLK_TOP_MUX_APLL_I2S0, "apll_i2s0_sel", apll_i2s0_parents,
-		0x320, 8, 1),
-	MUX(CLK_TOP_MUX_APLL_I2S1, "apll_i2s1_sel", apll_i2s1_parents,
-		0x320, 9, 1),
-	MUX(CLK_TOP_MUX_APLL_I2S2, "apll_i2s2_sel", apll_i2s2_parents,
-		0x320, 10, 1),
-	MUX(CLK_TOP_MUX_APLL_I2S3, "apll_i2s3_sel", apll_i2s3_parents,
-		0x320, 11, 1),
-	MUX(CLK_TOP_MUX_APLL_I2S4, "apll_i2s4_sel", apll_i2s4_parents,
-		0x320, 12, 1),
-	MUX(CLK_TOP_MUX_APLL_I2S5, "apll_i2s5_sel", apll_i2s5_parents,
-		0x328, 20, 1),
-};
-
 static const char * const mcu_mp0_parents[] = {
 	"clk26m",
 	"armpll_ll",
@@ -658,7 +643,19 @@ static struct mtk_composite mcu_muxes[] = {
 	MUX(CLK_MCU_BUS_SEL, "mcu_bus_sel", mcu_bus_parents, 0x7C0, 9, 2),
 };
 
-static struct mtk_composite top_aud_divs[] = {
+static struct mtk_composite top_aud_comp[] = {
+	MUX(CLK_TOP_MUX_APLL_I2S0, "apll_i2s0_sel", apll_i2s0_parents,
+		0x320, 8, 1),
+	MUX(CLK_TOP_MUX_APLL_I2S1, "apll_i2s1_sel", apll_i2s1_parents,
+		0x320, 9, 1),
+	MUX(CLK_TOP_MUX_APLL_I2S2, "apll_i2s2_sel", apll_i2s2_parents,
+		0x320, 10, 1),
+	MUX(CLK_TOP_MUX_APLL_I2S3, "apll_i2s3_sel", apll_i2s3_parents,
+		0x320, 11, 1),
+	MUX(CLK_TOP_MUX_APLL_I2S4, "apll_i2s4_sel", apll_i2s4_parents,
+		0x320, 12, 1),
+	MUX(CLK_TOP_MUX_APLL_I2S5, "apll_i2s5_sel", apll_i2s5_parents,
+		0x328, 20, 1),
 	DIV_GATE(CLK_TOP_APLL12_DIV0, "apll12_div0", "apll_i2s0_sel",
 		0x320, 2, 0x324, 8, 0),
 	DIV_GATE(CLK_TOP_APLL12_DIV1, "apll12_div1", "apll_i2s1_sel",
@@ -1169,10 +1166,7 @@ static int clk_mt8183_top_probe(struct platform_device *pdev)
 	mtk_clk_register_muxes(top_muxes, ARRAY_SIZE(top_muxes),
 		node, &mt8183_clk_lock, top_clk_data, &pdev->dev);
 
-	mtk_clk_register_composites(top_aud_muxes, ARRAY_SIZE(top_aud_muxes),
-		base, &mt8183_clk_lock, top_clk_data, &pdev->dev);
-
-	mtk_clk_register_composites(top_aud_divs, ARRAY_SIZE(top_aud_divs),
+	mtk_clk_register_composites(top_aud_comp, ARRAY_SIZE(top_aud_comp),
 		base, &mt8183_clk_lock, top_clk_data, &pdev->dev);
 
 	mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks),
-- 
2.39.0


