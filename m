Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DFDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 17:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4CLVtIzhzxmKrlwmoExmHvkSOnW3+yIbYfuCc4aEvOQ=; b=nhwn34RN8a4VtU
	5cI7Z6eGvLh/r3TSrb//C/V1ytAHps/RJbNXBku8LEg7dRXgqpEQZvwQ5dracDT4AFDViMBUFcOMN
	7JxtYebN6t8X2j8MM6CfqYwrmln9oTdCsJ/qb9XgF6umE2zPaHM5DP4P9FrUcZOXyxbKrqBRsXwB7
	U1gMl7qiNzMSnfDGlUjmdB11W921OHqt/nZpEMhY8CvNQ2xHLvLABef4bk25m2+235M2SYEd+Yuse
	RGkBvBJpcSkrWgO0VmpAycySK3GDSMQWtPHwT4i3S38I+nKJ0jCb3LXTh4o+jEOhUrqB0PaoS3JZk
	whfhjXsQHUIUIAJ9it8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6yBu-00CUeR-Tr; Mon, 10 Jan 2022 17:10:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6yBU-00CUTB-9T; Mon, 10 Jan 2022 17:10:19 +0000
X-UUID: cb72deee31f14323998fe0562346d92e-20220110
X-UUID: cb72deee31f14323998fe0562346d92e-20220110
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 153805267; Mon, 10 Jan 2022 10:10:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 10 Jan 2022 09:10:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 11 Jan 2022 01:10:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 11 Jan 2022 01:10:08 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Miles Chen <miles.chen@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] clk: mediatek: clk-mt8192: drop CLK_OF_DECLARE_DRIVER
Date: Tue, 11 Jan 2022 01:09:58 +0800
Message-ID: <20220110171000.24316-3-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220110171000.24316-1-miles.chen@mediatek.com>
References: <20220110171000.24316-1-miles.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_091016_364980_B58A673D 
X-CRM114-Status: GOOD (  13.78  )
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

clk-mt8192.c uses CLK_OF_DECLARE_DRIVER and it does not work for
kernel modules.

To support clk-mt8192 moudle build, move the
clk_mt8192_top_init_early() logic to clk_mt8192_top_probe()
and drop clk_mt8192_top_init_early() and CLK_OF_DECLARE_DRIVER.

Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8192.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index cbc7c6dbe0f4..552fae4f0fd5 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1179,31 +1179,20 @@ static const struct mtk_pll_data plls[] = {
 
 static struct clk_onecell_data *top_clk_data;
 
-static void clk_mt8192_top_init_early(struct device_node *node)
+static int clk_mt8192_top_probe(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
+	int r;
+	void __iomem *base;
 	int i;
 
 	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
 	if (!top_clk_data)
-		return;
+		return -ENOMEM;
 
 	for (i = 0; i < CLK_TOP_NR_CLK; i++)
 		top_clk_data->clks[i] = ERR_PTR(-EPROBE_DEFER);
 
-	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
-
-	of_clk_add_provider(node, of_clk_src_onecell_get, top_clk_data);
-}
-
-CLK_OF_DECLARE_DRIVER(mt8192_topckgen, "mediatek,mt8192-topckgen",
-		      clk_mt8192_top_init_early);
-
-static int clk_mt8192_top_probe(struct platform_device *pdev)
-{
-	struct device_node *node = pdev->dev.of_node;
-	int r;
-	void __iomem *base;
-
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
