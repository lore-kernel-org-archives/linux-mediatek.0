Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9573DC6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Sep 2022 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Tv1D8xpB0AirzCm+uQeZ3a4DhARqdvR/3+811r/xj4=; b=FlgHVj3STDtUHmQmt/UKx3Iosy
	j+/5qmlL+6TY8lNjCii9K7Dky1EXxI35wNNPY465TNxlCqlkeH5IsXQz6CACF1SCVfx9n1pqCAqCp
	H3FPvCx4alLGlG5WmX/V3UpN/DUt5VvRMiu0pODjW0ojVjbvLyIauluE1srYV/h1kFZO5fLZ2E32H
	iwMSdYsqLaZMDfg6lwmCwljzZJ7GzMbpkEss7YWC7T1en5E18sWCr7cde3s7YUe5Dg9RjDHfC4QK6
	msS6wEKLw3X3Sd7+Mtjl9zBFDIfUFOVouyO8+cg9Bgvbd5Kdj054ixL7uqA9D5ATnzKNP7yeS98SU
	vOx7j+8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA6a-0011qx-44; Mon, 05 Sep 2022 11:17:28 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8yG-00HIFV-A0; Mon, 05 Sep 2022 10:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4Tv1D8xpB0AirzCm+uQeZ3a4DhARqdvR/3+811r/xj4=; b=EyCOIllCcRu3VpFr/wCkownHdz
	waVCsO4XnpN6TVLsSPSJUp2MX1mZniR2B2FlxB63W3cHtHzDgOvvNpeVeILWtvUkOs+3jbTandX7v
	7vuC8h+Ppyz1zO+R1SHiaJfL3lu+KV+6voynkklAsCZlJl0J+xympTvGWoRGaSwI5V3GawuAOPKO5
	PMrp5eOnY8WdifSDI0ygoIArbRUrSGrLcNy+SlwpbYhA/VDs1oipNaOHDzNImUWiaZPf0mQ+aObM/
	bYZHED/E3/A9NhQimlPnNilfJYvFpNuPm8Sv7t1y6b7MFP0S0J6lGLybFjPPKyPrn8FmEhW/g96f1
	yxT2/NzA==;
Received: from madras.collabora.co.uk ([46.235.227.172])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV8yC-009NGD-Iz; Mon, 05 Sep 2022 10:04:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF8F26601EEC;
	Mon,  5 Sep 2022 11:04:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662372276;
	bh=jffXD3T2MOBqqGwvO+kvgVzF9lzP8ZPWA3RUmt8BGfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NKj4IwwP1ArxiD/Yn9oQYg4/iqAs/lypWASlzcKvephHVC2zKUiLfhBIF7KcxGgcW
	 EhYhy3I/uZzl9gI4YNxMTRGMt7RcIUY3PEUVg1gObWdYkJ4FBj2tz7MQZ2LE81NvT1
	 yRPjYLdUu88Erff+QYeez/IZJt9Z/40nf0QuhgWs1YbDGhoDpPE3ey7R4HWc2Apj9U
	 gSnVJ2XsTkvkz5Mk/Aj4EwV/W5YFG9VlHZNcMfdRkwl2l6sh91HMIH3MleYly625YY
	 sXfcl7qOEoB/a33DA9EQcTgfS0sBbajzzV5x/C9R92o7+7MuDNXnHpFEtzPNg04XLq
	 Wwv7yxF0QkDfw==
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
Subject: [PATCH 07/10] clk: mediatek: clk-mt8195-topckgen: Add GPU clock mux notifier
Date: Mon,  5 Sep 2022 12:04:13 +0200
Message-Id: <20220905100416.42421-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com>
References: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_110444_709531_0E35C9A0 
X-CRM114-Status: GOOD (  10.94  )
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

Following the changes done to MT8183, register a similar notifier
for MT8195 as well, allowing safe clockrate updates for the MFGPLL.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-topckgen.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
index e1c3ab4e146b..4dde23bece66 100644
--- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
@@ -1217,6 +1217,21 @@ static const struct of_device_id of_match_clk_mt8195_topck[] = {
 	{}
 };
 
+/* Register mux notifier for MFG mux */
+static int clk_mt8195_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
+{
+	struct mtk_mux_nb *mfg_mux_nb;
+
+	mfg_mux_nb = devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
+	if (!mfg_mux_nb)
+		return -ENOMEM;
+
+	mfg_mux_nb->ops = &clk_mux_ops;
+	mfg_mux_nb->bypass_index = 0; /* Bypass to TOP_MFG_CORE_TMP */
+
+	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
+}
+
 static int clk_mt8195_topck_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *top_clk_data;
@@ -1256,6 +1271,11 @@ static int clk_mt8195_topck_probe(struct platform_device *pdev)
 		goto unregister_muxes;
 	top_clk_data->hws[CLK_TOP_MFG_CK_FAST_REF] = hw;
 
+	r = clk_mt8195_reg_mfg_mux_notifier(&pdev->dev,
+					    top_clk_data->hws[CLK_TOP_MFG_CK_FAST_REF]->clk);
+	if (r)
+		goto unregister_muxes;
+
 	r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
 					&mt8195_clk_lock, top_clk_data);
 	if (r)
-- 
2.37.2


