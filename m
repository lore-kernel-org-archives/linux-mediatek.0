Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52D1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Apr 2022 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDFEEdWuWDYMFNmlTO9utSFZUbcxXGx0hP7ls4gg8K8=; b=NFhd7XPs+IOGiu
	x4zqgRoFg3ncBee6j1TGw9WQt0DvJNmL22blokzOKl6SGsULnfBpTj1oAVssVC9kUca2JWlbFZZTY
	VCikCWIF8jI9ckiMuvK63AqI/QuUrMyqoiLsfk44d3jxqjDJeQOff2DDPFUXLCImywG8D2AJtFIBF
	0fTkEPZt38m9r/8WYN77bW8hIaJo00dx9ptAYu6AZWRLsvdhlu9RO1uF2HSRIUA2d451vOz3lEXag
	sd8R+4+/vZdlJBrtTbSFXTfGDb10wiO8KMQDmepaA+dAIJ3ghSvXmGTT4Qk+H4FJLQkvjAdpOeg3e
	TbhriLPhzvvPdXeVPDjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngRMe-00H0wC-6r; Mon, 18 Apr 2022 13:24:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngRKv-00Gzoo-V0; Mon, 18 Apr 2022 13:22:39 +0000
X-UUID: 7a3581535e664695a9f7db92ea81f06a-20220418
X-UUID: 7a3581535e664695a9f7db92ea81f06a-20220418
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 219626472; Mon, 18 Apr 2022 06:22:28 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Apr 2022 06:22:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 18 Apr 2022 21:22:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Apr 2022 21:22:24 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <angelogioacchino.delregno@collabora.com>, <chun-jie.chen@mediatek.com>,
 <wenst@chromium.org>, <yong.liang@mediatek.com>, <runyang.chen@mediatek.com>, 
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH 7/7] clk: mediatek: reset: Add reset support for simple
 probe/remove
Date: Mon, 18 Apr 2022 21:21:54 +0800
Message-ID: <20220418132154.7401-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
References: <20220418132154.7401-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_062238_043357_D9392E68 
X-CRM114-Status: GOOD (  10.74  )
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

- Add a pointer of "mtk_clk_rst_data" to "mtk_clk_desc".
- Add register reset function in mtk_clk_simple_probe().
- Add unregister reset function in mtk_clk_simple_remove().

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 6 ++++++
 drivers/clk/mediatek/clk-mtk.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index b4063261cf56..4ecdf0be26d5 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -453,6 +453,9 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, clk_data);
 
+	if (mcd->rst && mcd->rst->supported)
+		r = mtk_clk_register_rst_ctrl(node, mcd->rst);
+
 	return r;
 
 unregister_clks:
@@ -468,6 +471,9 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
 	struct clk_onecell_data *clk_data = platform_get_drvdata(pdev);
 	struct device_node *node = pdev->dev.of_node;
 
+	if (mcd->rst && mcd->rst->supported)
+		mtk_clk_unregister_rst_ctrl(mcd->rst);
+
 	of_clk_del_provider(node);
 	mtk_clk_unregister_gates(mcd->clks, mcd->num_clks, clk_data);
 	mtk_free_clk_data(clk_data);
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index dfb0549ceb6c..453d12cb57ac 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -194,6 +194,7 @@ struct clk *mtk_clk_register_ref2usb_tx(const char *name,
 struct mtk_clk_desc {
 	const struct mtk_gate *clks;
 	size_t num_clks;
+	struct mtk_clk_rst_data *rst;
 };
 
 int mtk_clk_simple_probe(struct platform_device *pdev);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
