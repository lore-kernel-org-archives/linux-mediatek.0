Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C49C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:05:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8193E20771
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:05:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IsnaODon";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hPmauhfz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8193E20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TsEP3vyHGGEvXmNOg+CQ4qSxvuy0CdadKEd8OHe5OnM=; b=IsnaODonPjgCqpPU29vSZbKtf
	RCbXPv9obuau7RW3SqIl4EfGjA8J2H+KIlEfKouBgSQ1rY/c0dEzxVe5MS+XpTfVjTJWrmBQJaTdO
	FsuXHJ3hBtqaqBDOr06QasRL/eYj8pWNK7F3EKTJY5IfoYBfWIZgIRz/CyExxFMODVycuIT0g5ISs
	ULTWj9goaR7+Z6fds44YKPMgoBPXl9746x6cN52Qy9jWwHi+ju3ZhYLL2jB+MexszJjbc2zwNsikS
	TSgPlV7wl4Y4i8l/wxEZ4MpJdp5PnsEVIlp9uSWa6Y3GAWyv4H+jnO7kpiGQUf1nnah3Vwm7YSJye
	bW7eCvWTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyQbU-0003LS-Hg; Thu, 23 Jul 2020 02:05:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyQbQ-0003Io-7I; Thu, 23 Jul 2020 02:04:58 +0000
X-UUID: 9059d9ad2a3c42568dab5297cd7718d3-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Pq8ryqqd1XId2hCe/DQWnyfH74kyeJyUn6djhAqMZkE=; 
 b=hPmauhfzmvse3uZ6+2Ww8gCU3L/k3FM4cweCj/UKUgZQxbSpZu6FNGRlxfe2YxSkbTE3aF9pvUlfUYvCajJYsFAb690p7fKB3Y73Vl/gOOQ4XBtK+uETV1Yo4w8C9/aUKf00OITl+4Xx+oUt01OcEzrFMYAfr5SWYTMRMa+8/2A=;
X-UUID: 9059d9ad2a3c42568dab5297cd7718d3-20200722
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1460976049; Wed, 22 Jul 2020 18:04:52 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:04:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:04:49 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:04:39 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v7, PATCH 3/7] mtk-mmsys: add mt8183 mmsys support
Date: Thu, 23 Jul 2020 10:03:14 +0800
Message-ID: <1595469798-3824-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_220456_492602_8E3F83ED 
X-CRM114-Status: GOOD (  21.36  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add mt8183 mmsys support

Feature: drm/mediatek
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |   1 +
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 161 ++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c          |   1 +
 3 files changed, 163 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index 33b0dab..62cfedf 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += mt2701-mmsys.o
+obj-y += mt8183-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8183-mmsys.c b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
new file mode 100644
index 0000000..9d5f276
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 MediaTek Inc.
+
+#include <linux/device.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-mmsys.h>
+
+#define DISP_OVL0_MOUT_EN		0xf00
+#define DISP_OVL0_2L_MOUT_EN		0xf04
+#define DISP_OVL1_2L_MOUT_EN		0xf08
+#define DISP_DITHER0_MOUT_EN		0xf0c
+#define DISP_PATH0_SEL_IN		0xf24
+#define DISP_DSI0_SEL_IN		0xf2c
+#define DISP_DPI0_SEL_IN		0xf30
+#define DISP_RDMA0_SOUT_SEL_IN		0xf50
+#define DISP_RDMA1_SOUT_SEL_IN		0xf54
+
+#define OVL0_MOUT_EN_OVL0_2L			BIT(4)
+#define OVL0_2L_MOUT_EN_DISP_PATH0		BIT(0)
+#define OVL1_2L_MOUT_EN_RDMA1			BIT(4)
+#define DITHER0_MOUT_IN_DSI0			BIT(0)
+#define DISP_PATH0_SEL_IN_OVL0_2L		0x1
+#define DSI0_SEL_IN_RDMA0			0x1
+#define DSI0_SEL_IN_RDMA1			0x3
+#define DPI0_SEL_IN_RDMA0			0x1
+#define DPI0_SEL_IN_RDMA1			0x2
+#define RDMA0_SOUT_COLOR0			0x1
+#define RDMA1_SOUT_DSI0				0x1
+
+struct mmsys_path_sel {
+	enum mtk_ddp_comp_id cur;
+	enum mtk_ddp_comp_id next;
+	u32 addr;
+	u32 val;
+};
+
+static struct mmsys_path_sel mmsys_mout_en[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL_2L0,
+		DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_OVL0_2L,
+	},
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		DISP_OVL0_2L_MOUT_EN, OVL0_2L_MOUT_EN_DISP_PATH0,
+	},
+	{
+		DDP_COMPONENT_OVL_2L1, DDP_COMPONENT_RDMA1,
+		DISP_OVL1_2L_MOUT_EN, OVL1_2L_MOUT_EN_RDMA1,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DISP_DITHER0_MOUT_EN, DITHER0_MOUT_IN_DSI0,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sel_in[] = {
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		DISP_PATH0_SEL_IN, DISP_PATH0_SEL_IN_OVL0_2L,
+	},
+	{
+		DDP_COMPONENT_RDMA1, DDP_COMPONENT_DPI0,
+		DISP_DPI0_SEL_IN, DPI0_SEL_IN_RDMA1,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sout_sel[] = {
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		DISP_RDMA0_SOUT_SEL_IN, RDMA0_SOUT_COLOR0,
+	},
+};
+
+static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
+					  enum mtk_ddp_comp_id next,
+					  unsigned int *addr)
+{
+	u32 i;
+	u32 val = 0;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_mout_en); i++) {
+		path = &mmsys_mout_en[i];
+		if (cur == path->cur && next == path->next) {
+			*addr = path->addr;
+			val = path->val;
+			break;
+		}
+	}
+
+	return val;
+}
+
+static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
+					 enum mtk_ddp_comp_id next,
+					 unsigned int *addr)
+{
+	u32 i;
+	u32 val = 0;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_sel_in); i++) {
+		path = &mmsys_sel_in[i];
+		if (cur == path->cur && next == path->next) {
+			*addr = path->addr;
+			val = path->val;
+			break;
+		}
+	}
+
+	return val;
+}
+
+static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
+				   enum mtk_ddp_comp_id cur,
+				   enum mtk_ddp_comp_id next)
+{
+	u32 i;
+	u32 val = 0;
+	u32 addr = 0;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_sout_sel); i++) {
+		path = &mmsys_sout_sel[i];
+		if (cur == path->cur && next == path->next) {
+			addr = path->addr;
+			val = path->val;
+			break;
+		}
+	}
+
+	if (val)
+		writel_relaxed(val, config_regs + addr);
+}
+
+static struct mtk_mmsys_conn_funcs mmsys_funcs = {
+	.mout_en = mtk_mmsys_ddp_mout_en,
+	.sel_in = mtk_mmsys_ddp_sel_in,
+	.sout_sel = mtk_mmsys_ddp_sout_sel,
+};
+
+static int mmsys_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	mtk_mmsys_register_conn_funcs(dev->parent, &mmsys_funcs);
+
+	return 0;
+}
+
+static struct platform_driver mmsys_drv = {
+	.probe = mmsys_probe,
+	.driver = {
+		.name = "mt8183-mmsys",
+	},
+};
+
+builtin_platform_driver(mmsys_drv);
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 605b992..6a451ac 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -47,6 +47,7 @@ struct mtk_mmsys_private_data {
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
+	.mmsys_driver = "mt8183-mmsys",
 };
 
 void mtk_mmsys_ddp_connect(struct device *dev,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
