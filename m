Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D676C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:16:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1EB2075E
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K4Zh5qYY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jiVWYDFz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB1EB2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZuNwFn0v/R+XXVx3YnHN2vnpBzr8ZvquTfENFALJXWI=; b=K4Zh5qYYVrl9aNMwb74KQh+B0
	MUFfVuL6/S0xUfV7RguN19lk3ZtJ7Tv7c5pR5TIYGBaeUE/p9EnLaXI+9nHzqm8SjF2dMzAMMyE3p
	HGQXcQwOSi2pQLzT1sBOcis+uMB2QYKahpCRr9XQ1buGBycg5y7VvviFXzbPTxpMh6Xk0uPCFhR6b
	CJkmF+Sf08z9TxafSGyKB4SN3PnmsZdq1oB5erwRvCa+ubmcV5XyUO/x8npd+6n689Puh5Y32oZQy
	kzwSMP6/tqFN5NkG8Zzi6QFmti1TUDxOxHd4ASzcUCIiiNkOQa7RleLBMVWLNLP9dTcCUHW25rMuR
	6wjsquZHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dsG-0008F3-CB; Thu, 20 Aug 2020 06:16:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drU-0007vz-3q; Thu, 20 Aug 2020 06:15:46 +0000
X-UUID: 9eb185c2da394156a886e882137b6ff3-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lFMgkncXYg8bkldshCfDIPngk3zXG9Y53QOyLpXvSOU=; 
 b=jiVWYDFz5XrKo4EG3Um54L+bGzzRQzL7OzTKRWjQmF1XdWYue/SPeQEIOsA/2YyK0b4VyOD73PcwMTWOCxQNvfeFq90Ji1BlOCIq9imyBj0RVH6haJMYaS9eLVdXOm2ti1oqTIwFS+eKjWlY5LG/lsKORjEQNfjnq6DoF5iO9iQ=;
X-UUID: 9eb185c2da394156a886e882137b6ff3-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2012662459; Wed, 19 Aug 2020 22:15:38 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:37 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:35 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:34 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 04/21] mtk-mmsys: add mt8192 mmsys support
Date: Thu, 20 Aug 2020 14:04:01 +0800
Message-ID: <1597903458-8055-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021544_471077_C8C15480 
X-CRM114-Status: GOOD (  21.86  )
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

add mt8192 mmsys support

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |   1 +
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 159 ++++++++++++++++++++++++++++++
 2 files changed, 160 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index 62cfedf..c4bb6be 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += mt2701-mmsys.o
 obj-y += mt8183-mmsys.o
+obj-y += mt8192-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
new file mode 100644
index 0000000..006d41d
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
@@ -0,0 +1,159 @@
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
+#define MT8192_MMSYS_OVL_MOUT_EN		0xf04
+#define DISP_OVL0_GO_BLEND				BIT(0)
+#define DISP_OVL0_GO_BG					BIT(1)
+#define DISP_OVL0_2L_GO_BLEND				BIT(2)
+#define DISP_OVL0_2L_GO_BG				BIT(3)
+#define MT8192_DISP_OVL0_2L_MOUT_EN		0xf18
+#define MT8192_DISP_OVL0_MOUT_EN		0xf1c
+#define OVL0_MOUT_EN_DISP_RDMA0				BIT(0)
+#define MT8192_DISP_RDMA0_SEL_IN		0xf2c
+#define MT8192_RDMA0_SEL_IN_OVL0_2L			0x3
+#define MT8192_DISP_RDMA0_SOUT_SEL		0xf30
+#define MT8192_RDMA0_SOUT_COLOR0			0x1
+#define MT8192_DISP_CCORR0_SOUT_SEL		0xf34
+#define MT8192_CCORR0_SOUT_AAL0				0x1
+#define MT8192_DISP_AAL0_SEL_IN			0xf38
+#define MT8192_AAL0_SEL_IN_CCORR0			0x1
+#define MT8192_DISP_DITHER0_MOUT_EN		0xf3c
+#define MT8192_DITHER0_MOUT_DSI0			BIT(0)
+#define MT8192_DISP_DSI0_SEL_IN			0xf40
+#define MT8192_DSI0_SEL_IN_DITHER0			0x1
+#define MT8192_DISP_OVL2_2L_MOUT_EN		0xf4c
+#define MT8192_OVL2_2L_MOUT_RDMA4			BIT(0)
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
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_DISP_RDMA0,
+	},
+	{
+		DDP_COMPONENT_OVL_2L2, DDP_COMPONENT_RDMA4,
+		MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_RDMA4,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_DSI0,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sel_in[] = {
+	{
+		DDP_COMPONENT_OVL_2L0, DDP_COMPONENT_RDMA0,
+		MT8192_DISP_RDMA0_SEL_IN, MT8192_RDMA0_SEL_IN_OVL0_2L,
+	},
+	{
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
+	},
+	{
+		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
+	},
+};
+
+static struct mmsys_path_sel mmsys_sout_sel[] = {
+	{
+		DDP_COMPONENT_RDMA0, DDP_COMPONENT_COLOR0,
+		MT8192_DISP_RDMA0_SOUT_SEL, MT8192_RDMA0_SOUT_COLOR0,
+	},
+	{
+		DDP_COMPONENT_CCORR, DDP_COMPONENT_AAL0,
+		MT8192_DISP_CCORR0_SOUT_SEL, MT8192_CCORR0_SOUT_AAL0,
+	}
+};
+
+static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
+					  enum mtk_ddp_comp_id next,
+					  unsigned int *addr)
+{
+	u32 i;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_mout_en); i++) {
+		path = &mmsys_mout_en[i];
+		if (cur == path->cur && next == path->next) {
+			*addr = path->addr;
+			return path->val;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
+					 enum mtk_ddp_comp_id next,
+					 unsigned int *addr)
+{
+	u32 i;
+	struct mmsys_path_sel *path;
+
+	for (i = 0; i < ARRAY_SIZE(mmsys_sel_in); i++) {
+		path = &mmsys_sel_in[i];
+		if (cur == path->cur && next == path->next) {
+			*addr = path->addr;
+			return path->val;
+		}
+	}
+
+	return 0;
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
+			writel_relaxed(path->val, config_regs + addr);
+			return;
+		}
+	}
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
+		.name = "mt8192-mmsys",
+	},
+};
+
+builtin_platform_driver(mmsys_drv);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
