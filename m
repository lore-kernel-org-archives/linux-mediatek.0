Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 14:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K+rGe9v6CDZ/o/FdYyYCjYvBXNdKuEz0QVEJYRWRNsw=; b=Jfj1FXUglZwscW
	ndPUbRMT0xx2rVv20itxoTfFYsCF/f4YGgNetKvk8a1bixpXiyrxoc8bjPpMOPtG9zayeS0AlRqu2
	TiAMSv4DZY5ZMkNzXqC75niT22pj14B/xmSpRdoPdPlJ4ibZ2wtGvu+sFiP+JKsnZ6jjWesxR0fOc
	Gi0TFR0T2G2pec0hjlnxyCJWAkR+sCRwMtpItbTZhZBr4XTrSCHGXW8nsLywbQjIHXfm9dIU7LELY
	uqnQYkZWZk4DwE3E3v2MI4Cnu4SgKpjeHnrL9GDfBogcRuTlahHMuS/XxyY5xp01v4X6Elz1OFPTB
	3niwIu4X/3vGCjZZ6Ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4Oit-009FbR-Uj; Mon, 03 Jan 2022 14:54:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4OiK-009FOX-Bj; Mon, 03 Jan 2022 14:53:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5C51C1F402EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641221610;
 bh=NGTXfOIL5zOU/+5DW6dMjFB25yKQDzqC4jgJ9S1Zrro=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FdtqLXtIeiz2bblKBoQ2E3SyvVMP2twvL2qA8A3O1dZyzLo8/0iUqofS09YbCdsMe
 aE6qDkSseeN+o07exRW5nAfhZTX/72uLHrWJ5oByd5ifqU/uq2n6lnjuw9FKDXD/Rz
 fNwQ70z0/adq6au3joh05MTFsQttIYXai6o0jkgeyyNwQ7E439eEHwBA5jIV1t9lrf
 FEazEDt3ycMSbu30c/YCDseMiaq2keF5Vk/VVuLuDGI0ZhP/2q8LeVTXM8/Tv0wz7c
 woyePZG+o7U7ZnMml8VcwET6zpLA4a3DxHG/8VgiEwmo5yiaxagFBV/R/0YSp3tXrT
 +xYdAUpstdLHw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/3] phy: mediatek: phy-mtk-mipi-dsi: Reorder and stop
 implicit header inclusion
Date: Mon,  3 Jan 2022 15:53:23 +0100
Message-Id: <20220103145324.48008-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
References: <20220103145324.48008-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_065332_553717_BC9FDFC7 
X-CRM114-Status: GOOD (  10.14  )
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

All the headers for phy-mtk-mipi-{dsi,dsi-mt8173,dsi-mt8183}.c were
included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
increase readability and sensibly reduce build times, the inclusions
should be done per-file, also avoiding to include unused headers and
should not be implicit.

For this reason, move the inclusions to each file and remove unused ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c |  4 ++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c |  4 ++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c        |  7 +++++++
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h        | 10 ++--------
 4 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 95a0d9a3cca7..59f028da9d3e 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -4,7 +4,11 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_DSI_CON		0x00
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
index 01b59527669e..6c6b192485ba 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.c
@@ -4,7 +4,11 @@
  * Author: jitao.shi <jitao.shi@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-mipi-dsi.h"
 
 #define MIPITX_LANE_CON		0x000c
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 51b1b1d4ad38..6f7425b0bf5b 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -3,7 +3,14 @@
  * Copyright (c) 2015 MediaTek Inc.
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-mipi-dsi.h"
 
 inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index 8d32e9027a15..4eb5fc91e083 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -7,16 +7,10 @@
 #ifndef _MTK_MIPI_TX_H
 #define _MTK_MIPI_TX_H
 
-#include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/module.h>
-#include <linux/nvmem-consumer.h>
-#include <linux/of_device.h>
-#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/regmap.h>
 #include <linux/phy/phy.h>
-#include <linux/slab.h>
 
 struct mtk_mipitx_data {
 	const u32 mppll_preserve;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
