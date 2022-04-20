Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 777C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rJ3WKubXtI34QWAINFun2Wz7xM5D8BqTLtTosUvO7UU=; b=Ocwgl0LnBl91/g
	ce9wZGjBpmQARgRiuFgOyyQTfbJVGQwns80+LCC4t6dzN6r0EbPIN/EmI7NRTxEWhfDjFnb4rMWZJ
	C3J/81KApnspT4RmxzSHV/F2d09thBeF9t9HT9EYViLipfjkZ7UlFovjk0NcnY8WLE5Hby7Wf51j0
	cp4KHg0ZPX3Lx/uc1UB2IdVBPabt1VfOZADc09s2z1+zZ6fHCql1uBLKnT5ZD8o0RKOjJJ89QPR95
	yMgiV7Q+J7YxLAfLPml/A42f7xyJl41iTvhIlbjpyCqU2izUtW40YBHT6u9t9ZmcX6gwblsK1qBrg
	8WwIEOcoWX0XQt771WFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhAE5-0099U0-6m; Wed, 20 Apr 2022 13:18:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhABL-0098Gn-Jk; Wed, 20 Apr 2022 13:15:45 +0000
X-UUID: cba35b4fcbe542b1a53768d31c522293-20220420
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e2be743c-0ec0-451e-956d-75fa640b8a66, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:f6135df0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: cba35b4fcbe542b1a53768d31c522293-20220420
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 689083346; Wed, 20 Apr 2022 06:15:38 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Apr 2022 06:05:38 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 Apr 2022 21:05:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Apr 2022 21:05:29 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 07/12] clk: mediatek: reset: Add return for clock reset
 register function
Date: Wed, 20 Apr 2022 21:05:22 +0800
Message-ID: <20220420130527.23200-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_061543_677141_7878FB8B 
X-CRM114-Status: GOOD (  14.01  )
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

To make error handling, we add return for mtk_clk_register_rst_ctrl().

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/reset.c | 14 ++++++++------
 drivers/clk/mediatek/reset.h |  4 ++--
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index d67c13958458..b164b1da7dd3 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -64,8 +64,8 @@ static const struct reset_control_ops *rst_op[MTK_RST_MAX] = {
 	[MTK_RST_SET_CLR] = &mtk_reset_ops_set_clr,
 };
 
-void mtk_clk_register_rst_ctrl(struct device_node *np,
-			       const struct mtk_clk_rst_desc *desc)
+int mtk_clk_register_rst_ctrl(struct device_node *np,
+			      const struct mtk_clk_rst_desc *desc)
 {
 	struct regmap *regmap;
 	struct mtk_clk_rst_data *data;
@@ -73,23 +73,23 @@ void mtk_clk_register_rst_ctrl(struct device_node *np,
 
 	if (!desc) {
 		pr_err("mtk clock reset desc is NULL\n");
-		return;
+		return -EINVAL;
 	}
 
 	if (desc->version >= MTK_RST_MAX) {
 		pr_err("Error version number: %d\n", desc->version);
-		return;
+		return -EINVAL;
 	}
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
 		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
-		return;
+		return -EINVAL;
 	}
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
-		return;
+		return -ENOMEM;
 
 	data->desc = desc;
 	data->regmap = regmap;
@@ -103,6 +103,8 @@ void mtk_clk_register_rst_ctrl(struct device_node *np,
 		pr_err("could not register reset controller: %d\n", ret);
 		kfree(data);
 	}
+
+	return ret;
 }
 
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
index 3a93f61e106e..d59f4b89384d 100644
--- a/drivers/clk/mediatek/reset.h
+++ b/drivers/clk/mediatek/reset.h
@@ -27,7 +27,7 @@ struct mtk_clk_rst_data {
 	const struct mtk_clk_rst_desc *desc;
 };
 
-void mtk_clk_register_rst_ctrl(struct device_node *np,
-			       const struct mtk_clk_rst_desc *desc);
+int mtk_clk_register_rst_ctrl(struct device_node *np,
+			      const struct mtk_clk_rst_desc *desc);
 
 #endif /* __DRV_CLK_MTK_RESET_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
