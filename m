Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C267C00A5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 03:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQIyMUF35KzZzjYbaN4jibaebhkaoD3I1UFKe4hNees=; b=msFAxpRZTfl4MOMxnZH7uop/E/
	DKcZJScS9VqC1QRzm7ImB8u6U1f2UzJ0az3sCFzGR9OYCujVIg7zP1s8wzBAcg/gQMx/L3DrEUSaQ
	Us9Cz8UOYjJ3y2B3kmiRik9paRshTH9gi7M5ODi8xEs7pUo2PvS7Nc/Xfva9vBl7AW61VwhmZ6QFi
	/2ByQmIhChA3cJwGZ6U/zxc/RPV8hyfZY/AEg25zGiWdrKYAcDLx3w4PRXttJeY+6s5mFByBgJQeX
	leH6BYi9yw+KoO8MtSuPnjvaYpx4fTyoQNe7s2Sb1cy2hq2ppXa4CfafhK7gxvY9m74aeHgT1Va3/
	/pNUeAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzF7-00Gm3e-03; Wed, 18 Jan 2023 03:36:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHzF6-00Gm3S-1a; Wed, 18 Jan 2023 03:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VQIyMUF35KzZzjYbaN4jibaebhkaoD3I1UFKe4hNees=; b=Hb1TVcdNF1EVs7V5WINiV/wdxA
	NP3k7KWXMq7YfGbBoNq2n7dHX5fpWnhqIamCTgUrXGESpNw6u9TxHb6ZYvvwAM0651LCwDruKVtY7
	QjQHWuPfhZNi7/bECA0EaFZ2+a0PLVe00skuAJkffRkrwS/FG62pSdLtIZeCvNcEp1Iiz9moMCFLO
	2sly6hOp28jQ3YOEoqxC3qCwLxj+jtC221oNDJYXnMP1TZc92B9mhhtlEir6NhijNV9LSZXoSb7kT
	3cncDAtw1kFWCJ62GUFfQqpniqWpE0pYswrWM5oYbjWRux8ClNfnuIyb9ONEipR+zQkxuS1rAp0bH
	lcwPuBtw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHzEq-0068rm-18;
	Wed, 18 Jan 2023 03:35:52 +0000
X-UUID: 31aecea896e111eda08d4d6090ec5a5c-20230117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VQIyMUF35KzZzjYbaN4jibaebhkaoD3I1UFKe4hNees=;
	b=XqS693LQ6/yoqqNGAZnhnSmmBB8kJM1BKQThYtJiGrF/trc2hlE36V/uOg3cwsaKunqHdBOxtV+Y4Y4OEgO6u6LvOOnLVNAJD740kcVbsmzkqyENT/x1plZaJ4JK0nGEtMeTd50FhPN93zhZcvProZkWW+m6sIOkACLxzjol2uI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:2bc00b6a-895a-47f1-8ac4-66ce3307cb71,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:b8d5f654-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: 31aecea896e111eda08d4d6090ec5a5c-20230117
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1363160269; Tue, 17 Jan 2023 20:35:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 18 Jan 2023 11:15:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 18 Jan 2023 11:15:10 +0800
From: Moudy Ho <moudy.ho@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-clk@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>
Subject: [PATCH v6 3/4] clk: mediatek: remove MT8195 vppsys/0/1 simple_probe
Date: Wed, 18 Jan 2023 11:15:08 +0800
Message-ID: <20230118031509.29834-4-moudy.ho@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230118031509.29834-1-moudy.ho@mediatek.com>
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_033549_218752_0C33D4E1 
X-CRM114-Status: GOOD (  17.06  )
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

MT8195 VPPSYS0/1 will be probed by the compatible name in
the mtk-mmsys driver and then probe its own clock driver as
a platform driver.

Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8195-vpp0.c | 58 +++++++++++++++++++-------
 drivers/clk/mediatek/clk-mt8195-vpp1.c | 58 +++++++++++++++++++-------
 2 files changed, 86 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
index bf2939c3a023..6d5800f69f6c 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
@@ -86,26 +86,54 @@ static const struct mtk_gate vpp0_clks[] = {
 	GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "top_wpe_vpp", 3),
 };
 
-static const struct mtk_clk_desc vpp0_desc = {
-	.clks = vpp0_clks,
-	.num_clks = ARRAY_SIZE(vpp0_clks),
-};
+static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data;
+	int r;
 
-static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
-	{
-		.compatible = "mediatek,mt8195-vppsys0",
-		.data = &vpp0_desc,
-	}, {
-		/* sentinel */
-	}
-};
+	clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
+	if (r)
+		goto free_vpp0_data;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_gates;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return r;
+
+unregister_gates:
+	mtk_clk_unregister_gates(vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
+free_vpp0_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8195_vpp0_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
 
 static struct platform_driver clk_mt8195_vpp0_drv = {
-	.probe = mtk_clk_simple_probe,
-	.remove = mtk_clk_simple_remove,
+	.probe = clk_mt8195_vpp0_probe,
+	.remove = clk_mt8195_vpp0_remove,
 	.driver = {
 		.name = "clk-mt8195-vpp0",
-		.of_match_table = of_match_clk_mt8195_vpp0,
 	},
 };
 builtin_platform_driver(clk_mt8195_vpp0_drv);
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
index ffd52c762890..3b88c69e96c9 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
@@ -84,26 +84,54 @@ static const struct mtk_gate vpp1_clks[] = {
 	GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_26M, "vpp1_vpp_split_26m", "clk26m", 26),
 };
 
-static const struct mtk_clk_desc vpp1_desc = {
-	.clks = vpp1_clks,
-	.num_clks = ARRAY_SIZE(vpp1_clks),
-};
+static int clk_mt8195_vpp1_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_onecell_data *clk_data;
+	int r;
 
-static const struct of_device_id of_match_clk_mt8195_vpp1[] = {
-	{
-		.compatible = "mediatek,mt8195-vppsys1",
-		.data = &vpp1_desc,
-	}, {
-		/* sentinel */
-	}
-};
+	clk_data = mtk_alloc_clk_data(CLK_VPP1_NR_CLK);
+	if (!clk_data)
+		return -ENOMEM;
+
+	r = mtk_clk_register_gates(node, vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
+	if (r)
+		goto free_vpp1_data;
+
+	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
+	if (r)
+		goto unregister_gates;
+
+	platform_set_drvdata(pdev, clk_data);
+
+	return r;
+
+unregister_gates:
+	mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
+free_vpp1_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
+
+static int clk_mt8195_vpp1_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *node = dev->parent->of_node;
+	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
+
+	of_clk_del_provider(node);
+	mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
+	mtk_free_clk_data(clk_data);
+
+	return 0;
+}
 
 static struct platform_driver clk_mt8195_vpp1_drv = {
-	.probe = mtk_clk_simple_probe,
-	.remove = mtk_clk_simple_remove,
+	.probe = clk_mt8195_vpp1_probe,
+	.remove = clk_mt8195_vpp1_remove,
 	.driver = {
 		.name = "clk-mt8195-vpp1",
-		.of_match_table = of_match_clk_mt8195_vpp1,
 	},
 };
 builtin_platform_driver(clk_mt8195_vpp1_drv);
-- 
2.18.0


