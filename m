Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F9FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 10:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LgEXNCynfCqXY09+hE0tZm4JZLDDs7gzWacblx7Dbk=; b=rJ65dqXHXAQURL13gZhVHdf5DJ
	MCcSdsxVnzFuyJjs8hZhlqk/94ck36G0SF783H4gHA8dsO+bjqhNcPmNkmv+YgOIaXKUy0JU4T2mp
	6vqE5fqMPC464/LEAaAuQPHIyKEVhcTJpXg1Sd4rlRlLjpC1trB9MNBCT10eYxhhy0bdecgweUP2K
	7a0DSWR1EQlrAc+O+sLA8YgJkjGHgp61ziBBqWWAiyTW5sbuH7yZOHNGEJM2JroTAB9Cz2Zl+P8NK
	0El/GUmglg06BS/4cr6wIqnVGPXwHwsSw9Tx9uMNjveSBuwrJW3k4zTOCdp/NVzYKpUQ4m+1Ew+hn
	GzGl1Elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDUE-00949t-1X; Thu, 09 Mar 2023 10:27:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paDTf-0093wc-LI; Thu, 09 Mar 2023 10:26:30 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D4E666003AD;
	Thu,  9 Mar 2023 10:26:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678357582;
	bh=01EAgAUlV+xLXZIsHxxoCzrjdM/K1xZ06Pj/bk01CIU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WB67vFQcLGE3COLzGpjsEVxXX8oY0dO1ixlPUUausCXWND1Nf/6ddRoXO8Jyq15wZ
	 mSNgGS2hMGKJuEbKfXDImv0GAer1OiJCwRzCCH1DDiGXuikIghkhdT7k7NcnXgK25v
	 xYPompuHtlER3A0llr1HgIZ7ggfn9dUOyL3qdSxD1Q7zP9+Z5O9iS7jVp1Q6gYe9Ft
	 g7Z25xO5f/XauCPNKqUC+ogFrMjR0fW9vcYZCd+0be0Sri+7FcCr20ycFtfXhZVWsp
	 TFFrwij5k1xeBqqKv17o5g9jmEpUMxP/IhGBXAzmXKytYZ9CXFzlb+zcAu0cQHd3QA
	 pZjHdrrBJszNw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/3] soc: mediatek: mtk-mmsys: Split out MT8173 mmsys DDP routing table
Date: Thu,  9 Mar 2023 11:26:16 +0100
Message-Id: <20230309102618.114157-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
References: <20230309102618.114157-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_022628_007648_68B44BCF 
X-CRM114-Status: GOOD (  19.85  )
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

MT2701, MT2712 and MT8173 were relying on a "default" DDP I/O routing
table, describing all of the possible connections between display block
components: while this is definitely working it's suboptimal for the
actual routing description, as we may be enabling outputs and inputs
that are not needed, possibly impacting on actual DDP performance other
than slightly prolonging boot times by having to parse a table that is
bigger than needed.

Seen that all of the other supported SoCs have got their own table and
seen that a comment in mtk-mmsys.h explicitly mentions that the wanted
way is to have one table per SoC, create a new routing table that is
specifically tailored to MT8173 and, while at it, remove mentions to
said SoC from the comment in mtk-mmsys.h.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mt8173-mmsys.h | 95 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  5 +-
 drivers/soc/mediatek/mtk-mmsys.h    |  2 +-
 3 files changed, 99 insertions(+), 3 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8173-mmsys.h

diff --git a/drivers/soc/mediatek/mt8173-mmsys.h b/drivers/soc/mediatek/mt8173-mmsys.h
new file mode 100644
index 000000000000..9d24e381271e
--- /dev/null
+++ b/drivers/soc/mediatek/mt8173-mmsys.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8173_MMSYS_H
+#define __SOC_MEDIATEK_MT8173_MMSYS_H
+
+#define MT8173_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
+#define MT8173_DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
+#define MT8173_DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
+#define MT8173_DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
+#define MT8173_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
+#define MT8173_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
+#define MT8173_DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
+#define MT8173_DISP_REG_CONFIG_DISP_AAL_SEL_IN		0x08c
+#define MT8173_DISP_REG_CONFIG_DISP_UFOE_SEL_IN		0x0a0
+#define MT8173_DISP_REG_CONFIG_DSI0_SEL_IN		0x0a4
+#define MT8173_DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
+#define MT8173_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN	0x0b0
+#define MT8173_DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
+#define MT8173_DISP_REG_CONFIG_DISP_COLOR0_SOUT_SEL_IN	0x0bc
+
+#define MT8173_AAL_SEL_IN_MERGE				BIT(0)
+#define MT8173_COLOR0_SEL_IN_OVL0			BIT(0)
+#define MT8173_COLOR0_SOUT_MERGE			BIT(0)
+#define MT8173_DPI0_SEL_IN_MASK				GENMASK(1, 0)
+#define MT8173_DPI0_SEL_IN_RDMA1			BIT(0)
+#define MT8173_DSI0_SEL_IN_UFOE				BIT(0)
+#define MT8173_GAMMA_MOUT_EN_RDMA1			BIT(0)
+#define MT8173_OD0_MOUT_EN_RDMA0			BIT(0)
+#define MT8173_OVL0_MOUT_EN_COLOR0			BIT(0)
+#define MT8173_OVL1_MOUT_EN_COLOR1			BIT(0)
+#define MT8173_UFOE_MOUT_EN_DSI0			BIT(0)
+#define MT8173_UFOE_SEL_IN_RDMA0			BIT(0)
+#define MT8173_RDMA0_SOUT_COLOR0			BIT(0)
+
+static const struct mtk_mmsys_routes mt8173_mmsys_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		MT8173_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN,
+		MT8173_OVL0_MOUT_EN_COLOR0, MT8173_OVL0_MOUT_EN_COLOR0
+	}, {
+		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
+		MT8173_DISP_REG_CONFIG_DISP_OD_MOUT_EN,
+		MT8173_OD0_MOUT_EN_RDMA0, MT8173_OD0_MOUT_EN_RDMA0
+	}, {
+		DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
+		MT8173_DISP_REG_CONFIG_DISP_UFOE_MOUT_EN,
+		MT8173_UFOE_MOUT_EN_DSI0, MT8173_UFOE_MOUT_EN_DSI0
+	}, {
+		DDP_COMPONENT_COLOR0, DDP_COMPONENT_AAL0,
+		MT8173_DISP_REG_CONFIG_DISP_COLOR0_SOUT_SEL_IN,
+		MT8173_COLOR0_SOUT_MERGE, 0 /* SOUT to AAL */
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_UFOE,
+		MT8173_DISP_REG_CONFIG_DISP_RDMA0_SOUT_SEL_IN,
+		MT8173_RDMA0_SOUT_COLOR0, 0 /* SOUT to UFOE */
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
+		MT8173_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN,
+		MT8173_COLOR0_SEL_IN_OVL0, MT8173_COLOR0_SEL_IN_OVL0
+	}, {
+		DDP_COMPONENT_AAL0, DDP_COMPONENT_COLOR0,
+		MT8173_DISP_REG_CONFIG_DISP_AAL_SEL_IN,
+		MT8173_AAL_SEL_IN_MERGE, 0 /* SEL_IN from COLOR0 */
+	}, {
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_UFOE,
+		MT8173_DISP_REG_CONFIG_DISP_UFOE_SEL_IN,
+		MT8173_UFOE_SEL_IN_RDMA0, 0 /* SEL_IN from RDMA0 */
+	}, {
+		DDP_COMPONENT_UFOE, DDP_COMPONENT_DSI0,
+		MT8173_DISP_REG_CONFIG_DSI0_SEL_IN,
+		MT8173_DSI0_SEL_IN_UFOE, 0, /* SEL_IN from UFOE */
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
+		MT8173_DISP_REG_CONFIG_DISP_OVL1_MOUT_EN,
+		MT8173_OVL1_MOUT_EN_COLOR1, MT8173_OVL1_MOUT_EN_COLOR1
+	}, {
+		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
+		MT8173_DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN,
+		MT8173_GAMMA_MOUT_EN_RDMA1, MT8173_GAMMA_MOUT_EN_RDMA1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8173_DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN,
+		RDMA1_SOUT_MASK, RDMA1_SOUT_DPI0
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
+		MT8173_DISP_REG_CONFIG_DISP_COLOR1_SEL_IN,
+		COLOR1_SEL_IN_OVL1, COLOR1_SEL_IN_OVL1
+	}, {
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		MT8173_DISP_REG_CONFIG_DPI_SEL_IN,
+		MT8173_DPI0_SEL_IN_MASK, MT8173_DPI0_SEL_IN_RDMA1
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MT8173_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index b84485670f91..d5844aff0621 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -15,6 +15,7 @@
 
 #include "mtk-mmsys.h"
 #include "mt8167-mmsys.h"
+#include "mt8173-mmsys.h"
 #include "mt8183-mmsys.h"
 #include "mt8186-mmsys.h"
 #include "mt8188-mmsys.h"
@@ -52,8 +53,8 @@ static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
-	.routes = mmsys_default_routing_table,
-	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
+	.routes = mt8173_mmsys_routing_table,
+	.num_routes = ARRAY_SIZE(mt8173_mmsys_routing_table),
 	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
 	.num_resets = 32,
 };
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 56f8cc3a97b7..6725403d2e3a 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -96,7 +96,7 @@ struct mtk_mmsys_driver_data {
 };
 
 /*
- * Routes in mt8173, mt2701, mt2712 are different. That means
+ * Routes in mt2701 and mt2712 are different. That means
  * in the same register address, it controls different input/output
  * selection for each SoC. But, right now, they use the same table as
  * default routes meet their requirements. But we don't have the complete
-- 
2.39.2


