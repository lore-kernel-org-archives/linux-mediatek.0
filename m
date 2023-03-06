Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686DEC6FA99
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 16:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGK7uYgfmXKtAkOa/DRv26VDc5Yfml7Nle1V0NA0v4o=; b=vP+jM//TjdtZfxbWom9PWIWuN9
	X6dxdVd9XFsGmg/M8QNWs8NumzZY2h9MabFXRSj6fTn6QPfippEIqxKortpRX+SNGeNpqWF40gOQN
	7zvFKsrg6GSSoyK4X9FQAV4vKHLLocsK7dvxEzx09SAt9+PLkJ+0vTnQ3uW3O188TekkKlkVHb/KB
	hnX/IkjC8tQ26QRhhdAk0+I+CzMzvFxPZP1DJzvdzghdzpyjE3VGd9uB9oCGsc9oG2pjb94x6SP8w
	8sLYxaAfCnu5HpHcikEvsqUvcKKO08gOov96DGxoR+k5cRT7WT2GMT8aHrKZAb1ed78j1UFcWMSVC
	XS80GsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZDUo-00DnTr-20; Mon, 06 Mar 2023 16:15:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZBTh-00D3Zk-Cv; Mon, 06 Mar 2023 14:06:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 885EA6602FD5;
	Mon,  6 Mar 2023 14:06:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678111571;
	bh=Xp9TEfZv4eGDq3vh90sVOE3VpalfzIe3/ABObqfU5yg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCFSd2tcIjMOC2nUKfLiKSzmdE8EA/AuHLDJ/VRzp7jFwXT1ReHc1GmW8gcg7v0O7
	 91kDdiSHKY7OM8eJWUl/k7rmAc9aNQFufWyeK6FpO5wWmrbtDncUDBcoCMy2pAZBJh
	 NRsZe7osPhlSH9j3GXv2NziWQImMkoSEsiezweYwxYX5qnvLScOlyTAHNNT2/dyPRZ
	 tsGWWhbshuAyQZ2EpYz2sfYYmZJfIXhreX9txemwF8QUhISbnfTd6JJ3h6yg/HvXC9
	 8Ghi8CkeCO2Y/ZcWZErXomlhirLVulX9i8mmDhHKaP/LH/anWeaWKn8mbpbOnH19Gc
	 ZwoCIHrAtXgWg==
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
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v6 15/54] clk: mediatek: mt8167: Compress GATE_TOPx macros
Date: Mon,  6 Mar 2023 15:05:04 +0100
Message-Id: <20230306140543.1813621-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
References: <20230306140543.1813621-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_060613_751011_772DACE2 
X-CRM114-Status: UNSURE (   8.58  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8167.c | 80 +++++++------------------------
 1 file changed, 16 insertions(+), 64 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index 91669ebafaf9..12384da4002d 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -736,77 +736,29 @@ static const struct mtk_gate_regs top5_cg_regs = {
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
+#define GATE_TOP0(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP0_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top0_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP0_I(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top0_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP1(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top1_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP1(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP2(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top2_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP2(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top2_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP2_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top2_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP2_I(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top2_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP3(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top3_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr,	\
-	}
+#define GATE_TOP3(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top3_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
-#define GATE_TOP4_I(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top4_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_setclr_inv,	\
-	}
+#define GATE_TOP4_I(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top4_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
-#define GATE_TOP5(_id, _name, _parent, _shift) {	\
-		.id = _id,				\
-		.name = _name,				\
-		.parent_name = _parent,			\
-		.regs = &top5_cg_regs,			\
-		.shift = _shift,			\
-		.ops = &mtk_clk_gate_ops_no_setclr,	\
-	}
+#define GATE_TOP5(_id, _name, _parent, _shift) \
+	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate top_clks[] __initconst = {
 	/* TOP0 */
-- 
2.39.2


