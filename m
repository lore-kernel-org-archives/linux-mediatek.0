Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BFFC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Dec 2022 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzEbirQxyhh6OeixBejRbj0ImzFqrXdHVgrtBLOEbEA=; b=bRY3v82fOoBC4I2tZMTR2PFiMa
	7N0b2cuxdZvfLWA8V3Ppc5nb0I+YKl/n9CWnkIMQvGYngDlIOH3KRPRw2QItMmsg9gv2YirLDvOol
	PlH0iS50J9kAZYcglBQAhdLZf55fmI5x6jfonODtVlRguy+ne36f1sBcdP/24NFVxyL5fg2BAGldk
	anSi4804+RYKqlrnfJeIXsJAX+ZBSkwTsz1OYFyDMW441nCwulLIJPoZ1aXxgnKqiees515vLPk2Z
	SsdstgO2xJ0ZJfq4d7PEtZz/BW+orFq7VCQKQ7Wbf9onBMtMd/xK//+FhJUnb9/YpBwS40HaaeL1W
	w2Yzsk+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eiz-005zjC-KK; Fri, 23 Dec 2022 09:52:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8eaE-005skm-LA; Fri, 23 Dec 2022 09:43:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0EB5A6602CE0;
	Fri, 23 Dec 2022 09:43:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671788597;
	bh=K3qkzfY6G2DncdZI0kKDSL9TE5yrQJlLDsPQh9qExmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h7rfYJziYRTHZ0eQUwgwBzY8/kMqSYFctHhDbsLYwP9y+abK/xGYat6S3B1xP8Aji
	 RURnwCX9FzTzYvhgCloZxW5ZVmgSiYQsb85RCCrjM6mtrxq688whSy+BkHlguRMrHP
	 OQrZLpC8ouLxLML5ryoVfuAOpN1RJFn+tejNxuSaqY+HBAAReO0dfUrmLuSCfkhKXL
	 yI5h7DocKpQ4cCE1t3phW3PDvBoAqxQ4dGibUGcfZWnbNeX5/Vvxeo9gSGdz3Te4WU
	 oQUJrODFfsfSZwEGqqeutAMV9Go/029L+U7tI6Dc5xNLMJnrKMoBhoCZSDc8aCW4g8
	 RUZivulr8ltjA==
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
Subject: [PATCH v2 07/23] clk: mediatek: clk-mtk: Add dummy clock ops
Date: Fri, 23 Dec 2022 10:42:43 +0100
Message-Id: <20221223094259.87373-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221223_014318_897031_03AFF730 
X-CRM114-Status: GOOD (  12.19  )
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

In order to migrate some (few) old clock drivers to the common
mtk_clk_simple_probe() function, add dummy clock ops to be able
to insert a dummy clock with ID 0 at the beginning of the list.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index a1ab34305b95..d05364e17e95 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -18,6 +18,21 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
+const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
+
+static int mtk_clk_dummy_enable(struct clk_hw *hw)
+{
+	return 0;
+}
+
+static void mtk_clk_dummy_disable(struct clk_hw *hw) { }
+
+const struct clk_ops mtk_clk_dummy_ops = {
+	.enable		= mtk_clk_dummy_enable,
+	.disable	= mtk_clk_dummy_disable,
+};
+EXPORT_SYMBOL_GPL(mtk_clk_dummy_ops);
+
 static void mtk_init_clk_data(struct clk_hw_onecell_data *clk_data,
 			      unsigned int clk_num)
 {
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 15122504c02d..dd43235285db 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -22,6 +22,25 @@
 
 struct platform_device;
 
+/*
+ * We need the clock IDs to start from zero but to maintain devicetree
+ * backwards compatibility we can't change bindings to start from zero.
+ * Only a few platforms are affected, so we solve issues given by the
+ * commonized MTK clocks probe function(s) by adding a dummy clock at
+ * the beginning where needed.
+ */
+#define CLK_DUMMY		0
+
+extern const struct clk_ops mtk_clk_dummy_ops;
+extern const struct mtk_gate_regs cg_regs_dummy;
+
+#define GATE_DUMMY(_id, _name) {				\
+		.id = _id,					\
+		.name = _name,					\
+		.regs = &cg_regs_dummy,				\
+		.ops = &mtk_clk_dummy_ops,			\
+	}
+
 struct mtk_fixed_clk {
 	int id;
 	const char *name;
-- 
2.39.0


