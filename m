Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B34C6FA83
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 10:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWyGb0q7QYUfq+xg02k1Xun1TFDNpiRZ01Fk0RQlU/U=; b=gNmxezDQ7qvpiramTjHm8NyDyq
	FmNzOPgrloYTWnX0Pz1/GMW8teLlEKK49RyapYSXsXSkCSEtiZ1rXXEfZVEhaXMxysbJk/TM2qQF1
	Q3TrhuIOxNUY5rgEIxSOja2Q+vOzd+b3Z0mW30lJJOVawA2Pbcb0EGmLy7Q2r5FGbi4md9VAelYgx
	+vqua/ef8pR9yGn9DpWuMLz9s7vRU+ZBOWFAwdoTwrREr8cnV/o09hHWekhgQrsb73lhmIDEXMI3F
	fFMVmwPkgBOLydXmXw3m6eKoAincEb56UZPYb/tBnB6TZKSt2jB4L3NFDrCOQPowLl6jo8S0/KRZQ
	0dJK/LPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7bk-009msA-Tc; Tue, 27 Sep 2022 10:14:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od7Z0-009lMe-VZ; Tue, 27 Sep 2022 10:11:44 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D455C660226C;
	Tue, 27 Sep 2022 11:11:40 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664273501;
	bh=P8qf8sm2+n6h5GY24T45/pBhBpIHyvw5DFQp0vf8aik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GkDdRUq4dfwyECaN1Ea5hKftsbJIDkDkv5RdHCV0f5dYGdrfGeSCjK7O4VUpvqfZX
	 e5qGzzPwy4K6+L4AGUithUYgO+YdSTsNdYHuuwWOelBVACM1ARB1dQ0K8bR4Sx0mR5
	 iLcQd7mXosjEWuEO1uCGVZ/or/IUgGFc0JKdO94KnBhs3NaUK/trYMHrk07DgcQUnD
	 PrrIN2EqA92nSZJDQmLk1Mtf3y+4NjvXVg8cb86wRWnHj4PBV1xzeTOoyJsfohRcey
	 idk+2wI6qqdYxwoHvr2BE4NUNIMeQCMse/8hHtAYwtvkRAdC9EXF2FNwfGj5lkktZc
	 vVPv4AK6M6ztQ==
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
Subject: [PATCH v3 07/10] clk: mediatek: clk-mt8195-topckgen: Add GPU clock mux notifier
Date: Tue, 27 Sep 2022 12:11:25 +0200
Message-Id: <20220927101128.44758-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
References: <20220927101128.44758-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_031143_217677_D107289A 
X-CRM114-Status: GOOD (  12.46  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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


