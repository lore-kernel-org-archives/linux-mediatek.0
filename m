Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5661C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MhyJyYvnVFdRtI6YFdGUJEIFzNrLgFgYioxHSpRhvA=; b=36+AP4hqIDCYCG
	ZfHvzJ+ha0Gi1odA/8FBOOT/uptDOo70lyJCiDrpOzTR8WQ9/QJm4TNV94bLySU6wN4BgOCIMv/EQ
	N9r+x19sQJsHtfPux/tfHG+z+9jdr8zCD6qDbM7HB8qAMZcr0+6bvoOseJr9Hv8Xfi0cTxfijCmk1
	gRNwB3oXsTBpSd2vTrPU5nYdpm1pTHagWczAvKZsHEkDyzy4oBRrqweN4rFQqdb3hRh2WAHDvl3Cy
	mBBnYjvvSBNC5JbEMrss+u/dPnd+t24pro6b7YtqdCmfTVCqzIGN6TNfghl0nfmVViX6h/2uCksme
	i0w+rAqnp89yS6uT/OeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4PJm-009LZN-RQ; Mon, 03 Jan 2022 15:32:14 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4PId-009L2y-F2; Mon, 03 Jan 2022 15:31:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8249F1F4254C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641223862;
 bh=sEDq2d+5/abLrttz8U18JMOJJuSHWVdlfX/N3MRUvHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fQ1z/nL8jFTbNjKYRB+PMQyIzYsFu8sg0pylMTuCTroCVbNbcK8gxDvbw3InCv3Eo
 APnlC7ub0pkwb6wX2AeUIbRQ62kF+tJ5KgGt7vk7Iy3736YtYuXAx77SH5Qz7sLyS3
 kTQpo+2Z1D9+0f1IHN7S8bsHtGS8CVEMlQqUpTi6ol54LYyMraQbMLQbuqFvs3XlWz
 h2w8qP3AuUSe5CCDPg5SMKKfpgftvNQIximMZiuS7EKyHe49z6RCSGDrSg01FwDG0q
 9n9ZLhC31266uN1touKYVJfUA2OUlxFOJtMMIJg4eujsjfVs2bpChzdaFlbgbT/MKG
 kzSzetjsZVD3g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 3/4] phy: mediatek: phy-mtk-hdmi: Reorder and stop implicit
 header inclusion
Date: Mon,  3 Jan 2022 16:30:54 +0100
Message-Id: <20220103153055.50473-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_073103_654940_358B02E5 
X-CRM114-Status: UNSURE (   9.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

All the headers for phy-mtk-{hdmi,hdmi-mt2701,hdmi-mt8183}.c were
included from phy-mtk-mipi-dsi.h, but this isn't optimal: in order to
increase readability and sensibly reduce build times, the inclusions
should be done per-file, also avoiding to include unused headers and
should not be implicit.

For this reason, move the inclusions to each file and remove unused ones.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c |  5 +++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c |  5 +++++
 drivers/phy/mediatek/phy-mtk-hdmi.c        |  8 ++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h        | 10 +---------
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
index 09e0dd7499d8..270c5f538483 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
@@ -4,6 +4,11 @@
  * Author: Chunhui Dai <chunhui.dai@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 #include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0	0x00
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
index e317bf4a9db9..87ba9a3687b7 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
@@ -4,6 +4,11 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
+#include <linux/clk-provider.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
 #include "phy-mtk-hdmi.h"
 
 #define HDMI_CON0		0x00
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index b4193cb4e4e3..e037fa89696c 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -4,6 +4,14 @@
  * Author: Jie Qiu <jie.qiu@mediatek.com>
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/phy/phy.h>
 #include "phy-mtk-hdmi.h"
 
 inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index a0571271d730..ef81e44a235d 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -6,17 +6,9 @@
 
 #ifndef _MTK_HDMI_PHY_H
 #define _MTK_HDMI_PHY_H
-#include <linux/clk.h>
+
 #include <linux/clk-provider.h>
-#include <linux/delay.h>
-#include <linux/io.h>
-#include <linux/mfd/syscon.h>
-#include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/phy/phy.h>
-#include <linux/platform_device.h>
 #include <linux/regmap.h>
-#include <linux/types.h>
 
 struct mtk_hdmi_phy;
 
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
