Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99234C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 01:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tw0Mpn/oCz2tWZ8nEeH0MZWAnFSLIBCNqMDWrq72L7c=; b=ZorUxAUfVTmx6j
	MhD6Liqpd8/QBBiiwIykWzRHZ9aXzNfcd4ws+cXLQsQo+n8W71asaUrq1lD+i3hYj9xuw8+zQZkR9
	t1FR5AMVU/PRnH78xri6bEPiqqoi4pZ/Js6osIy2Fu4AinJeobSAOaXT0e+PPNy25ZAqe6VkFaY01
	BYUbbPrF9CtxrqxB90kSNYfVmXpAwQ9aaZPDCDlyvLNBiLBsS3bPZORUriPf+HENt/KiiUqZ5d+ls
	NbEi7w3G0o9Uqhnzt6E8F1EN2BEi7YM9/lIad3OMt3zQfbGtS3bYH3pbzOGEwG2gstpyC8FQRthlW
	KJblhgjp8NSdi2ZnLO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6j2j-008fGI-OX; Mon, 10 Jan 2022 01:00:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6j29-008eyq-Kt; Mon, 10 Jan 2022 00:59:39 +0000
X-UUID: 160955118194454b814229bd715f9a46-20220109
X-UUID: 160955118194454b814229bd715f9a46-20220109
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1217500609; Sun, 09 Jan 2022 17:59:29 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 9 Jan 2022 16:59:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 10 Jan 2022 08:59:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 10 Jan 2022 08:59:26 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v2 3/3] clk: mediatek: Integrate vppsys with mtk-mmsys in MT8195
Date: Mon, 10 Jan 2022 08:59:02 +0800
Message-ID: <20220110005902.27148-4-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
References: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_165937_717716_DA819CA1 
X-CRM114-Status: GOOD (  14.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Integrate vpp0 and vpp1 with mtk-mmsys driver which
will populate device by platform_device_register_data
to start vppsys clock driver.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8195-vpp0.c | 42 +++++++++++++++++---------
 drivers/clk/mediatek/clk-mt8195-vpp1.c | 42 +++++++++++++++++---------
 2 files changed, 56 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
index c3241466a8d0..68c375bfce8b 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
@@ -86,25 +86,39 @@ static const struct mtk_gate vpp0_clks[] = {
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
+		goto unregister_clk;
+
+	return r;
+
+unregister_clk:
+	mtk_clk_unregister(clk_data);
+
+free_vpp0_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
 
 static struct platform_driver clk_mt8195_vpp0_drv = {
-	.probe = mtk_clk_simple_probe,
+	.probe = clk_mt8195_vpp0_probe,
 	.driver = {
 		.name = "clk-mt8195-vpp0",
-		.of_match_table = of_match_clk_mt8195_vpp0,
 	},
 };
 builtin_platform_driver(clk_mt8195_vpp0_drv);
diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
index ce0b9a40a179..237077c60f54 100644
--- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
+++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
@@ -84,25 +84,39 @@ static const struct mtk_gate vpp1_clks[] = {
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
+		goto unregister_clk;
+
+	return r;
+
+unregister_clk:
+	mtk_clk_unregister(clk_data);
+
+free_vpp1_data:
+	mtk_free_clk_data(clk_data);
+	return r;
+}
 
 static struct platform_driver clk_mt8195_vpp1_drv = {
-	.probe = mtk_clk_simple_probe,
+	.probe = clk_mt8195_vpp1_probe,
 	.driver = {
 		.name = "clk-mt8195-vpp1",
-		.of_match_table = of_match_clk_mt8195_vpp1,
 	},
 };
 builtin_platform_driver(clk_mt8195_vpp1_drv);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
