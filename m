Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD2DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 12:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxB3QSnG1uyp3kVVVNVdvWzFUO6QJEgJqxRJIsqCIPI=; b=XmedZfFZzybkSDbRSdAMUDBHzF
	0ly9mFjxWv3w6g2+Dz3MPS+DWHpIjjpAkvGmiRhFvQqmLuV4Hey3piHep5FCGeP4F/G4fBDeAA7Gp
	+lRW6GExKgYMSLl7sFacVHo3/NCFYbGslVSCdh/NhyB3jCkj8FAQRk5BHa/XbeiMsQITq2avkG+GV
	q/eBC6Qyj4bjAqaxT6ldrKyJ4MLlOT31o4DJmTR4RuYfyhbS1vSRJRbGQd/omtoL1qdxDqXhOknYy
	nBHARDJyljx1Upt8AR0GsOzvaNvEdlw9gJXFyofpRIPs0eZbn6rc4sslM9HD/2HmzT4277gC1pXVU
	qsB7hLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KnJ-00BuuQ-DQ; Thu, 22 Dec 2022 12:35:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K4e-00BXBm-0P; Thu, 22 Dec 2022 11:49:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 453746602CD8;
	Thu, 22 Dec 2022 11:49:17 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671709758;
	bh=X/oZl8ocJQt071EbQHuHIaXUvTU5xZlpFyUlUhGeBQk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FBt+uV3u8xFLavYUouyD4THDFwqNxoEaHEktDIVywjGjckt0EtRQhDAHPLAAUdEBZ
	 FXxNXT6XYiEoWOOqu46VAGLb2OYaGlo9JIsdqREMitXhu4/tB0YzsIk0cyVyEh4+MV
	 DlyWwiY6Fle3lyyQyUhvnCUNHAptdtlz3cY8KYn3jHoEFUvOmdjVfNm8sa5TVySoFk
	 6RZEFg7F9VzOrFl7K7yoo3+vhM0/A7ER9QjiF3k24cGAQYMzTzWN++itIqUw1kn2Yk
	 YkD2h/lonXVHUTbBqDdOATpj1Sd6AXksbox0UJKrdvmjuJZ3kM9bCz4WGCO5rs65mj
	 dl2bpJVT5qmXQ==
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
Subject: [PATCH v1 02/25] clk: mediatek: mt8192: Propagate struct device for gate clocks
Date: Thu, 22 Dec 2022 12:48:34 +0100
Message-Id: <20221222114857.120060-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
References: <20221222114857.120060-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034920_267440_DA754699 
X-CRM114-Status: GOOD (  10.22  )
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

Convert instances of mtk_clk_register_gates() to use the newer
mtk_clk_register_gates_with_dev() to propagate struct device to
the clk framework.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index eff66ca6c6a7..991d78a71644 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1127,7 +1127,8 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_top_composites;
 
-	r = mtk_clk_register_gates(node, top_clks, ARRAY_SIZE(top_clks), top_clk_data);
+	r = mtk_clk_register_gates_with_dev(node, top_clks, ARRAY_SIZE(top_clks),
+					    top_clk_data, &pdev->dev);
 	if (r)
 		goto unregister_adj_divs_composites;
 
@@ -1167,7 +1168,8 @@ static int clk_mt8192_infra_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks), clk_data);
+	r = mtk_clk_register_gates_with_dev(node, infra_clks, ARRAY_SIZE(infra_clks),
+					    clk_data, &pdev->dev);
 	if (r)
 		goto free_clk_data;
 
@@ -1198,7 +1200,8 @@ static int clk_mt8192_peri_probe(struct platform_device *pdev)
 	if (!clk_data)
 		return -ENOMEM;
 
-	r = mtk_clk_register_gates(node, peri_clks, ARRAY_SIZE(peri_clks), clk_data);
+	r = mtk_clk_register_gates_with_dev(node, peri_clks, ARRAY_SIZE(peri_clks),
+					    clk_data, &pdev->dev);
 	if (r)
 		goto free_clk_data;
 
@@ -1226,7 +1229,9 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
-	r = mtk_clk_register_gates(node, apmixed_clks, ARRAY_SIZE(apmixed_clks), clk_data);
+	r = mtk_clk_register_gates_with_dev(node, apmixed_clks,
+					    ARRAY_SIZE(apmixed_clks), clk_data,
+					    &pdev->dev);
 	if (r)
 		goto free_clk_data;
 
-- 
2.39.0


