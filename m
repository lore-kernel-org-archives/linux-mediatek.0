Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3692BC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 07:06:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E930B61057
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 07:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E930B61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RbcX83jwsmFdZyPNwWoO7AdjNDekAjulMbn1gvMrbA4=; b=hTmyznEQ7jE8gI
	08XCgEGIbMRI2D0nKyAfZpHiBtJsEnDGHHDI+zvYvTONh4KdXJjSbYjXo+eIh+V1uSoPC95dleWKt
	agCUsymWfXNZtfW8rUbsBe9q6pqw6W46Ajg3NLBKZP15Mu8yuEs98TZabKxd900ku2WwNS6oCjWoV
	HxWbXEtWJAoUa6PYGbl8UK4c0hqqHIPbd4TrXX+KfHzU0unSHiJvuX1bcJdIW4OMVOJza/slxkZVX
	xw7nrvZ00jgGfoQKVlKTfxRqw7gAshVGooam+DEF/KVx87YkMzosKZgaNscUbPRWoSY0XyeXJRQ4i
	WkSvTCUL4If/lx4fUBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m907V-003Jsq-0l; Thu, 29 Jul 2021 07:06:17 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m907G-003JnA-JY; Thu, 29 Jul 2021 07:06:05 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout2.routing.net (Postfix) with ESMTP id 2DAF65FA8E;
 Thu, 29 Jul 2021 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1627542360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/LAZ73YjPmWGBqkhhTx62xnQDFJ6WYvVC10lm5EMIIk=;
 b=W+xa5Ako8s0FPxb7elO0UuS+AedtYOl+dKUS+IkBvdvkqO7ohdiDGHMEOBSzv6fzQVUMnQ
 xbE70f5u+QiehzcqST4jdBPy6CZOTOaZ1oVNLwpL7DXGtGhlA8+XUiv5ZNs48GSGzrRUyh
 ms0yxZgMA836Z1oxFO0/v7A12KbEY70=
Received: from localhost.localdomain (fttx-pool-217.61.146.92.bambit.de
 [217.61.146.92])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 4700B10010F;
 Thu, 29 Jul 2021 07:05:59 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: CK Hu <ck.hu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dafna.hirschfeld@collabora.com, Frank Wunderlich <frank-w@public-files.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v2] soc: mmsys: mediatek: add mask to mmsys routes
Date: Thu, 29 Jul 2021 09:05:49 +0200
Message-Id: <20210729070549.5514-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: 318a4e58-903f-4b95-80fe-59321db78235
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_000602_989401_48ACD329 
X-CRM114-Status: GOOD (  14.90  )
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

From: CK Hu <ck.hu@mediatek.com>

SOUT has many bits and need to be cleared before set new value.
Write only could do the clear, but for MOUT, it clears bits that
should not be cleared. So use a mask to reset only the needed bits.

this fixes HDMI issues on MT7623/BPI-R2 since 5.13

Fixes: 440147639ac7 ("soc: mediatek: mmsys: Use an array for setting the routing registers")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Signed-off-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
code is taken from here (upstreamed without mask part)
https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2345186/5
basicly CK Hu's code so i set him as author
---
v2:
- added mask to mt8183 specific table (mask=value),
  before val was used as mask and val itself not defined,
  breaking display on these devices
- as changes do not add addional code only restoring same
  behaviour for mt8183 added reviwed-by from CK Hu from v1
---
 drivers/soc/mediatek/mt8183-mmsys.h |  21 +++--
 drivers/soc/mediatek/mtk-mmsys.c    |   7 +-
 drivers/soc/mediatek/mtk-mmsys.h    | 133 +++++++++++++++++++---------
 3 files changed, 112 insertions(+), 49 deletions(-)

diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
index 579dfc8dc8fc..9dee485807c9 100644
--- a/drivers/soc/mediatek/mt8183-mmsys.h
+++ b/drivers/soc/mediatek/mt8183-mmsys.h
@@ -28,25 +28,32 @@
 static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
-		MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L
+		MT8183_DISP_OVL0_MOUT_EN, MT8183_OVL0_MOUT_EN_OVL0_2L,
+		MT8183_OVL0_MOUT_EN_OVL0_2L
 	}, {
 		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
-		MT8183_DISP_OVL0_2L_MOUT_EN, MT8183_OVL0_2L_MOUT_EN_DISP_PATH0
+		MT8183_DISP_OVL0_2L_MOUT_EN, MT8183_OVL0_2L_MOUT_EN_DISP_PATH0,
+		MT8183_OVL0_2L_MOUT_EN_DISP_PATH0
 	}, {
 		DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
-		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1
+		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1,
+		MT8183_OVL1_2L_MOUT_EN_RDMA1
 	}, {
 		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
-		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0
+		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0,
+		MT8183_DITHER0_MOUT_IN_DSI0
 	}, {
 		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
-		MT8183_DISP_PATH0_SEL_IN, MT8183_DISP_PATH0_SEL_IN_OVL0_2L
+		MT8183_DISP_PATH0_SEL_IN, MT8183_DISP_PATH0_SEL_IN_OVL0_2L,
+		MT8183_DISP_PATH0_SEL_IN_OVL0_2L
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		MT8183_DISP_DPI0_SEL_IN, MT8183_DPI0_SEL_IN_RDMA1
+		MT8183_DISP_DPI0_SEL_IN, MT8183_DPI0_SEL_IN_RDMA1,
+		MT8183_DPI0_SEL_IN_RDMA1
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
-		MT8183_DISP_RDMA0_SOUT_SEL_IN, MT8183_RDMA0_SOUT_COLOR0
+		MT8183_DISP_RDMA0_SOUT_SEL_IN, MT8183_RDMA0_SOUT_COLOR0,
+		MT8183_RDMA0_SOUT_COLOR0
 	}
 };
 
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 080660ef11bf..0f949896fd06 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -68,7 +68,9 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
-			reg = readl_relaxed(mmsys->regs + routes[i].addr) | routes[i].val;
+			reg = readl_relaxed(mmsys->regs + routes[i].addr);
+			reg &= ~routes[i].mask;
+			reg |= routes[i].val;
 			writel_relaxed(reg, mmsys->regs + routes[i].addr);
 		}
 }
@@ -85,7 +87,8 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 
 	for (i = 0; i < mmsys->data->num_routes; i++)
 		if (cur == routes[i].from_comp && next == routes[i].to_comp) {
-			reg = readl_relaxed(mmsys->regs + routes[i].addr) & ~routes[i].val;
+			reg = readl_relaxed(mmsys->regs + routes[i].addr);
+			reg &= ~routes[i].mask;
 			writel_relaxed(reg, mmsys->regs + routes[i].addr);
 		}
 }
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index a760a34e6eca..5f3e2bf0c40b 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -35,41 +35,54 @@
 #define RDMA0_SOUT_DSI1				0x1
 #define RDMA0_SOUT_DSI2				0x4
 #define RDMA0_SOUT_DSI3				0x5
+#define RDMA0_SOUT_MASK				0x7
 #define RDMA1_SOUT_DPI0				0x2
 #define RDMA1_SOUT_DPI1				0x3
 #define RDMA1_SOUT_DSI1				0x1
 #define RDMA1_SOUT_DSI2				0x4
 #define RDMA1_SOUT_DSI3				0x5
+#define RDMA1_SOUT_MASK				0x7
 #define RDMA2_SOUT_DPI0				0x2
 #define RDMA2_SOUT_DPI1				0x3
 #define RDMA2_SOUT_DSI1				0x1
 #define RDMA2_SOUT_DSI2				0x4
 #define RDMA2_SOUT_DSI3				0x5
+#define RDMA2_SOUT_MASK				0x7
 #define DPI0_SEL_IN_RDMA1			0x1
 #define DPI0_SEL_IN_RDMA2			0x3
+#define DPI0_SEL_IN_MASK			0x3
 #define DPI1_SEL_IN_RDMA1			(0x1 << 8)
 #define DPI1_SEL_IN_RDMA2			(0x3 << 8)
+#define DPI1_SEL_IN_MASK			(0x3 << 8)
 #define DSI0_SEL_IN_RDMA1			0x1
 #define DSI0_SEL_IN_RDMA2			0x4
+#define DSI0_SEL_IN_MASK			0x7
 #define DSI1_SEL_IN_RDMA1			0x1
 #define DSI1_SEL_IN_RDMA2			0x4
+#define DSI1_SEL_IN_MASK			0x7
 #define DSI2_SEL_IN_RDMA1			(0x1 << 16)
 #define DSI2_SEL_IN_RDMA2			(0x4 << 16)
+#define DSI2_SEL_IN_MASK			(0x7 << 16)
 #define DSI3_SEL_IN_RDMA1			(0x1 << 16)
 #define DSI3_SEL_IN_RDMA2			(0x4 << 16)
+#define DSI3_SEL_IN_MASK			(0x7 << 16)
 #define COLOR1_SEL_IN_OVL1			0x1
 
 #define OVL_MOUT_EN_RDMA			0x1
 #define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
 #define BLS_TO_DPI_RDMA1_TO_DSI			0x2
+#define BLS_RDMA1_DSI_DPI_MASK			0xf
 #define DSI_SEL_IN_BLS				0x0
 #define DPI_SEL_IN_BLS				0x0
+#define DPI_SEL_IN_MASK				0x1
 #define DSI_SEL_IN_RDMA				0x1
+#define DSI_SEL_IN_MASK				0x1
 
 struct mtk_mmsys_routes {
 	u32 from_comp;
 	u32 to_comp;
 	u32 addr;
+	u32 mask;
 	u32 val;
 };
 
@@ -91,124 +104,164 @@ struct mtk_mmsys_driver_data {
 static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
 	{
 		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_TO_DSI_RDMA1_TO_DPI1
+		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		BLS_TO_DSI_RDMA1_TO_DPI1
 	}, {
 		DDP_COMPONENT_BLS, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_BLS
+		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		DSI_SEL_IN_BLS
 	}, {
 		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_OUT_SEL, BLS_TO_DPI_RDMA1_TO_DSI
+		DISP_REG_CONFIG_OUT_SEL, BLS_RDMA1_DSI_DPI_MASK,
+		BLS_TO_DPI_RDMA1_TO_DSI
 	}, {
 		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_RDMA
+		DISP_REG_CONFIG_DSI_SEL, DSI_SEL_IN_MASK,
+		DSI_SEL_IN_RDMA
 	}, {
 		DDP_COMPONENT_BLS, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_BLS
+		DISP_REG_CONFIG_DPI_SEL, DPI_SEL_IN_MASK,
+		DPI_SEL_IN_BLS
 	}, {
 		DDP_COMPONENT_GAMMA, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1
+		DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN, GAMMA_MOUT_EN_RDMA1,
+		GAMMA_MOUT_EN_RDMA1
 	}, {
 		DDP_COMPONENT_OD0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0
+		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD_MOUT_EN_RDMA0,
+		OD_MOUT_EN_RDMA0
 	}, {
 		DDP_COMPONENT_OD1, DDP_COMPONENT_RDMA1,
-		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1
+		DISP_REG_CONFIG_DISP_OD_MOUT_EN, OD1_MOUT_EN_RDMA1,
+		OD1_MOUT_EN_RDMA1
 	}, {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0
+		DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
+		OVL0_MOUT_EN_COLOR0
 	}, {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
-		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0
+		DISP_REG_CONFIG_DISP_COLOR0_SEL_IN, COLOR0_SEL_IN_OVL0,
+		COLOR0_SEL_IN_OVL0
 	}, {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
-		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
+		DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA,
+		OVL_MOUT_EN_RDMA
 	}, {
 		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1
+		DISP_REG_CONFIG_DISP_OVL1_MOUT_EN, OVL1_MOUT_EN_COLOR1,
+		OVL1_MOUT_EN_COLOR1
 	}, {
 		DDP_COMPONENT_OVL1, DDP_COMPONENT_COLOR1,
-		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1
+		DISP_REG_CONFIG_DISP_COLOR1_SEL_IN, COLOR1_SEL_IN_OVL1,
+		COLOR1_SEL_IN_OVL1
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		RDMA0_SOUT_DPI0
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI1
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		RDMA0_SOUT_DPI1
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI1
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		RDMA0_SOUT_DSI1
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI2
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		RDMA0_SOUT_DSI2
 	}, {
 		DDP_COMPONENT_RDMA0, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DSI3
+		DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_MASK,
+		RDMA0_SOUT_DSI3
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DPI0
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		RDMA1_SOUT_DPI0
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_RDMA1
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		DPI0_SEL_IN_RDMA1
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DPI1
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		RDMA1_SOUT_DPI1
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_RDMA1
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		DPI1_SEL_IN_RDMA1
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_RDMA1
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		DSI0_SEL_IN_RDMA1
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI1
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		RDMA1_SOUT_DSI1
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_RDMA1
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		DSI1_SEL_IN_RDMA1
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI2
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		RDMA1_SOUT_DSI2
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_RDMA1
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		DSI2_SEL_IN_RDMA1
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_DSI3
+		DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN, RDMA1_SOUT_MASK,
+		RDMA1_SOUT_DSI3
 	}, {
 		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA1
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
+		DSI3_SEL_IN_RDMA1
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DPI0
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		RDMA2_SOUT_DPI0
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI0,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_RDMA2
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI0_SEL_IN_MASK,
+		DPI0_SEL_IN_RDMA2
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DPI1
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		RDMA2_SOUT_DPI1
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DPI1,
-		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_RDMA2
+		DISP_REG_CONFIG_DPI_SEL_IN, DPI1_SEL_IN_MASK,
+		DPI1_SEL_IN_RDMA2
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI0,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_RDMA2
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI0_SEL_IN_MASK,
+		DSI0_SEL_IN_RDMA2
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI1
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		RDMA2_SOUT_DSI1
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI1,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_RDMA2
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI1_SEL_IN_MASK,
+		DSI1_SEL_IN_RDMA2
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI2
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		RDMA2_SOUT_DSI2
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI2,
-		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_RDMA2
+		DISP_REG_CONFIG_DSIE_SEL_IN, DSI2_SEL_IN_MASK,
+		DSI2_SEL_IN_RDMA2
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_DSI3
+		DISP_REG_CONFIG_DISP_RDMA2_SOUT, RDMA2_SOUT_MASK,
+		RDMA2_SOUT_DSI3
 	}, {
 		DDP_COMPONENT_RDMA2, DDP_COMPONENT_DSI3,
-		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_RDMA2
+		DISP_REG_CONFIG_DSIO_SEL_IN, DSI3_SEL_IN_MASK,
+		DSI3_SEL_IN_RDMA2
 	}
 };
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
