Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7829ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 10:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeEES7WC7a4Hv8F52etLIKJPuKUPnKVwvbNmk2ulRdo=; b=2kN1JP9qD4koG3tNzu0pUZDVA5
	FECpaoUnugca9zrtsbqrhxjx2eNiZVCiucr1R/PphEDf/Arrmk3ma/o/JVbLlZV0+ua/dKC4Pl1n5
	FhLM2P7wJXWyXlbU70GXtsWwS+ppl/BqTf0b2b5Thx9ZE6mA/CQRychSiwe0ZOplILJlYCm7TM8pf
	iwzmTylzUAklVmQDbWOSCB+D/rSPmq/hGyrx+G9gCRaZTQyEjNfYZremYH4K/wu0mJH4SSXqQjlHu
	DmW1MxfPC6XQWPN23RGO1WIJUc1KKYIEjyvxzU97MC3AE6SzjH0owPqQNDG1BfSS7rmWG9bT3V9vu
	Slia+iug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omugJ-000j2E-AQ; Mon, 24 Oct 2022 10:27:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omucL-000gtF-9n; Mon, 24 Oct 2022 10:23:38 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 46435660282A;
	Mon, 24 Oct 2022 11:23:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666607016;
	bh=OaQQU68d+mZ/y3nMS8j/flqN6YzM2nFoIK5HdQQzj2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MRrKMkiYp1k47+EikQmkpcDPo7tWaNomrGUGzd6jDPvV0gt0NT6RypOVrEeJI40Lw
	 /4341jLzRNyukSrPxBFAOS+N8peIE9Dg22dAQlIqBleeU62k3lwPIIBlBRFlBlMH4c
	 7laxjJj1pcCFsL1uF/5ByXPp6vcVP11iWS8E9C+eNk94BTaXV4LrEx9jcn9wVKQP+z
	 wlk4kXEoF2M6w1LGZnSChq+kIV5MIhik61ONVsONdXyyrjpSmSRPzs7xJ8bdTvJXyl
	 rz10IeFhHJ88bTC7S/IH1hVNJN+ZyORtPRAaCoFObwVw1y/CvChmAT2ll80IoOeA5P
	 A5+UDGYXybUTg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	jose.exposito89@gmail.com,
	yangyingliang@huawei.com,
	msp@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier
Date: Mon, 24 Oct 2022 12:23:07 +0200
Message-Id: <20221024102307.33722-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_032337_533392_25AE007E 
X-CRM114-Status: GOOD (  14.02  )
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

Following the changes done to MT8183, MT8192, MT8195, register a
clock notifier for MT8186, allowing safe clockrate updates for the
MFG PLL.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8186-topckgen.c | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
index 62b5ff4a5723..c2beda7ef976 100644
--- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
@@ -689,6 +689,28 @@ static const struct of_device_id of_match_clk_mt8186_topck[] = {
 	{}
 };
 
+/* Register mux notifier for MFG mux */
+static int clk_mt8186_reg_mfg_mux_notifier(struct device *dev, struct clk *clk)
+{
+	struct mtk_mux_nb *mfg_mux_nb;
+	int i;
+
+	mfg_mux_nb = devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
+	if (!mfg_mux_nb)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(top_mtk_muxes); i++)
+		if (top_mtk_muxes[i].id == CLK_TOP_MFG)
+			break;
+	if (i == ARRAY_SIZE(top_mtk_muxes))
+		return -EINVAL;
+
+	mfg_mux_nb->ops = top_mtk_muxes[i].ops;
+	mfg_mux_nb->bypass_index = 0; /* Bypass to 26M crystal */
+
+	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);
+}
+
 static int clk_mt8186_topck_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
@@ -730,6 +752,11 @@ static int clk_mt8186_topck_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_composite_muxes;
 
+	r = clk_mt8186_reg_mfg_mux_notifier(&pdev->dev,
+					    clk_data->hws[CLK_TOP_MFG]->clk);
+	if (r)
+		goto unregister_composite_divs;
+
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
 		goto unregister_composite_divs;
-- 
2.37.2


