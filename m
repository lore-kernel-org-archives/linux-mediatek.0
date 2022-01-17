Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7388DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/oKbnGjmlkeDFaxhe5rey9f5PDCePnpoMHxal8VEErI=; b=F9VNMxrfQL+9BW
	zdJTkXP1A+Qz1jHW8VDIROy4y8RRmNllckfEKTtAZlcr4R7zzh9yifqLEhHGAX1byMxi9dJcIWJuT
	DS9Ql5d8DeLWt2ZbW8vwscrzGmO5U68ee54a2u1lMbSJ57FAoTyGMXKJLrbC8xDd0VS1VAuqpW4oJ
	Fyufb+6gBpBb03zv766QfDfQjggk42tyuIn6wD4Cvmcoeu0LNGa7Ri5RkXlwFkwd0nGzhWzxW1/j1
	vmpy5/V1JNVA/uNBLUW96/64T+UXwpw8MwwpNbxLX6ZmAMuAylAUvHZifEyJPlId0G+5gF7YhPQ5v
	SQYQ7BOxeK2oYX+bpT3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9O0O-00EDO7-QV; Mon, 17 Jan 2022 09:08:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9O0B-00EDM0-FM; Mon, 17 Jan 2022 09:08:38 +0000
X-UUID: e1e9ba64e47a40ac987d6bf111dcb8c8-20220117
X-UUID: e1e9ba64e47a40ac987d6bf111dcb8c8-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 211508582; Mon, 17 Jan 2022 02:08:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 01:00:32 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 17:00:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 Jan 2022 17:00:30 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang
 <ikjn@chromium.org>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>
CC: Miles Chen <miles.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: mediatek: add unregister logic to mtk_clk_simple_probe
 error path
Date: Mon, 17 Jan 2022 17:00:29 +0800
Message-ID: <20220117090030.13064-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_010835_539628_2B704DFC 
X-CRM114-Status: GOOD (  13.70  )
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

Stephen pointed out that there is no unregister logic in
mtk_clk_simple_probe() error path [1].
Fix it by adding unregister logic to mtk_clk_simple_probe().

[1] https://lore.kernel.org/linux-mediatek/20220114221930.660B5C36AE9@smtp.kernel.org/

Fixes: c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers")
Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8d5791b3f460..edf21975cb4d 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -161,6 +161,22 @@ int mtk_clk_register_gates(struct device_node *node,
 }
 EXPORT_SYMBOL_GPL(mtk_clk_register_gates);
 
+static void mtk_clk_unregister_gates(const struct mtk_gate *clks,
+		int num, struct clk_onecell_data *clk_data)
+{
+	int i;
+	const struct mtk_gate *gate;
+	struct clk *clk;
+
+	for (i = 0; i < num; i++) {
+		gate = &clks[i];
+		clk = clk_data->clks[gate->id];
+
+		if (!IS_ERR_OR_NULL(clk))
+			clk_unregister(clk);
+	}
+}
+
 struct clk *mtk_clk_register_composite(const struct mtk_composite *mc,
 		void __iomem *base, spinlock_t *lock)
 {
@@ -320,15 +336,17 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 
 	r = mtk_clk_register_gates(node, mcd->clks, mcd->num_clks, clk_data);
 	if (r)
-		goto free_data;
+		goto err_free_data;
 
 	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r)
-		goto free_data;
+		goto err_unregister_gates;
 
 	return r;
 
-free_data:
+err_unregister_gates:
+	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
+err_free_data:
 	mtk_free_clk_data(clk_data);
 	return r;
 }
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
