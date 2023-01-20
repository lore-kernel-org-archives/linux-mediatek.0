Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D026C25B4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 09:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1w0f/dwQiQpk1uLm5kJvS4EyvaZTg+3B1MZFuf1kEsk=; b=qL/3iIwWmcypDIVJzTHLSUq+qi
	pUhkSCGELdDjLUcr53nh4WwYYT4J7G+Fp35bc/Y5XBr0L08N51E48OoB235BGj1Yk500mjVQpbKHB
	Qj3j0Ugb0uv3oKeTwTt1hZW0Z2JKtLN4Cf/UK39MvOThmp8HfApDfZjeC8rYwF4k7sDNDqNvbDDND
	Z917MeK1H1I5V1bJPqYsfgHJUEOnEJzaIFS6+9KmlVk5jNTHE7eIiD9R1VDU0Ty+vTqZs2Xkc4Za2
	G0bj4xbvQOJbQalsubf4XzY8jYd3yJVNRc1l41996zaX28GG+X0E+2PuIFOQZL9P1UgbODQ9Z1wTO
	85NMruLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInoa-009QSP-Ry; Fri, 20 Jan 2023 09:36:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pInaC-009JoE-KU; Fri, 20 Jan 2023 09:21:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B78526602E16;
	Fri, 20 Jan 2023 09:21:09 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674206471;
	bh=iyGyvF4gSjXW/Me+rS7Fs3WJzATcoXZh4BloNFgcSoA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lOdCOM/dyeY4ObpgWRkuSoeUmFdrXzhML+C1Krr3RzdQI46qxoXxl48z1wKFhri3R
	 8mWzQ6qLx8nHMUqL7ecYs4uE8Qf9BXt58kK3I3gHjdv+nSGlHZEvLEcJkwF+d+ht8e
	 x+34Zvxu/ifJNS4+FuTV6EuhR9PpF3+hO0bjE0DT5jnmXdRq6V16oLwgzEmUhK84U5
	 XLr8AY3Jrom5UtJLqV3SmFZSMqdwf2EHH9QijOcq6HxiYUaEXBLat8UTBn22RfsKtU
	 UeFjp0OYMB7eDvH3qmVaLy0bmgdVbzlAtoYzQ9myqubyv+tLaS+cBiW3oTA5I9BLI8
	 CH+aE6TdpcoCg==
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
Subject: [PATCH v4 07/23] clk: mediatek: clk-mtk: Add dummy clock ops
Date: Fri, 20 Jan 2023 10:20:37 +0100
Message-Id: <20230120092053.182923-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
References: <20230120092053.182923-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_012112_881875_AE4EE55F 
X-CRM114-Status: GOOD (  13.00  )
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-mtk.c | 16 ++++++++++++++++
 drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cf2f465ecf22..ca9aa24e769c 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -18,6 +18,22 @@
 #include "clk-mtk.h"
 #include "clk-gate.h"
 
+const struct mtk_gate_regs cg_regs_dummy = { 0, 0, 0 };
+EXPORT_SYMBOL_GPL(cg_regs_dummy);
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
index cd97d2722380..ed329d8d7349 100644
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


