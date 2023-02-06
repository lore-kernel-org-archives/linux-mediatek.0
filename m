Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8E7C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 15:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CmHI+7CBPPkH5jwJcBKStxVAIwbP1QotPCgKvopoGFQ=; b=06T+EVztDzTm93rP3NxIdY3ogl
	GELuzxuh920HkMCiPbjtjv+9W7uXa2YgVefJ1Q9fNNPkeOuF+Ty0m4nimBCzzSyfWj1AnPPc7P+Ns
	8mG92fWKe90XZmXuCG6clxDzQOQvI8mVfnQB+FGCByfG6AKGzrgn0oZEXAWv7+8DG0/NZaICtE7Tf
	gg91DfgH7vo/AtkRSpk2ro/rS81F3/E/UhtBdY+gSlxfyz6fNgl8gSrfRcFdeWpc3dbv2qIl0+NYF
	o+HJVHi1yQ12I/h19BNEgQtTnlQG7teD9dBvyChu5GcNgae+zXObil9z7nQ7ztW402xamEvpFBld4
	uKUtNk8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3Y5-008xd7-Ec; Mon, 06 Feb 2023 15:36:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3RV-008tqx-LT; Mon, 06 Feb 2023 15:30:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 508506602F93;
	Mon,  6 Feb 2023 15:30:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675697404;
	bh=mkbBbWYebgdFxhv1Yxn8HTTQtR6Vhd4o4rssC48MQ34=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jFs+SXYiVnSZdJLTy6IIhlF529ucepOu6DlEbMwRYnkeYypwUdRb0I3oC6xb8ZHwo
	 wfwJPhM3qpQ3ifSpkw6ZCVFrUjA65IW/F3AhA35DT10xWNT7FG0ueNU8ajnIccKkX0
	 tvEkS4tMzIviI//V0yU8WszwroEh6NwGwJM21fxjGBD7bzJdu64uJpNHGIK47r9dK8
	 quTGiS4ewuIhVHeGCAa1QZ5XJTzDYM8MvgY8lmlQJ3OfRq97+n9EmNkI8YSTU0eXwU
	 ocigwoZ9iobno7ZgdfXlboFRtjzoDrYK/es1rme+k/aAxTRLrrhZQA6neXhCswBZFs
	 0uBguxbwJzUVg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	johnson.wang@mediatek.com,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	daniel@makrotopia.org,
	fparent@baylibre.com,
	msp@baylibre.com,
	nfraprado@collabora.com,
	rex-bc.chen@mediatek.com,
	zhaojh329@gmail.com,
	sam.shih@mediatek.com,
	edward-jw.yang@mediatek.com,
	yangyingliang@huawei.com,
	granquet@baylibre.com,
	pablo.sun@mediatek.com,
	sean.wang@mediatek.com,
	chen.zhong@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1 13/45] clk: mediatek: mt8167: Compress GATE_TOPx macros
Date: Mon,  6 Feb 2023 16:28:56 +0100
Message-Id: <20230206152928.918562-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073006_023476_E15FF2E2 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

Use the GATE_MTK macro to compress the GATE_TOP{0..5} macros.
No functional changes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8167.c | 88 +++++++++----------------------
 1 file changed, 24 insertions(+), 64 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index 91669ebafaf9..97a443fdfc77 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -736,77 +736,37 @@ static const struct mtk_gate_regs top5_cg_regs = {
 	.sta_ofs = 0x44,
 };
 
-#define GATE_TOP0(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top0_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP0(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP0_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top0_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP0_I(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP1(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top1_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP1(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP2(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top2_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP2(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP2_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top2_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP2_I(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP3(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top3_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP3(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top3_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP4_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top4_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP4_I(_id, _name, _parent, _shift)		\
+	GATE_MTK(_id, _name, _parent, &top4_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP5(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top5_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_no_setclr,	\
-	}
+#define GATE_TOP5(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &top5_cg_regs,		\
+		 _shift, &mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate top_clks[] __initconst = {
 	/* TOP0 */
-- 
2.39.1


