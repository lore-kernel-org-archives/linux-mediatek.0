Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1797C433FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:05:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73499208E4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 02:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Me/LsjD9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bEvV02KV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73499208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cL2TctDJug+inyBuuFk+rPbrSStyKUFU2zCHaDEYi5Y=; b=Me/LsjD96s9yk85aYckB5d3e5
	0XrkrlnWUzzYRM8NxTfHA4KzR8uLz8kiH+OYl2TrXf+u7kLM9qPW0ONrRPSmeaR2xHBNc2Vp5U3s3
	A59+UpKDLJ/RpxWgPKOjYbIv/OJWQiN7SMNTOyLXKJqnfmZEP1c860sEpjM1jQLKZ8GQTgdgDDNoT
	R3z9YROElAMT+STIeayCy+lZpayI4Fm2+2xJekEtVAkZcJl1jl3tDZrGoBg3HjzwemHyZ3fiYr+5Q
	HVF/KPANdslwcNsCUhVr+pTZOjSORDaM7Ca/cUQkf4XvF23gNXRbKdHhhBlKAq/CNJnqSUiEHOUyV
	TYB5B+J4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyQbP-0003Iy-K2; Thu, 23 Jul 2020 02:04:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyQbL-0003Hj-Md; Thu, 23 Jul 2020 02:04:53 +0000
X-UUID: bb6c70c3f4f040e7b649b631dbb45f39-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=D1koE3fFRT4X+AUeXEXFFx8bWVQfNZkexdFg7IZKCLE=; 
 b=bEvV02KV9dGLfqkfW8bAQsl33TU/IZVnPsiskgn8tk9ts+zgqSmdW/oAiJP7ctWbonTLUaZKScGa+EvLpg3U0smGSMNR0cHeLaZ8e5cequ1Zs8tbTuXy85SxkT95izeS6NAsgf/v/SJICCdrC/oP8pdqeXBfmNRHdgv9FDSJvaE=;
X-UUID: bb6c70c3f4f040e7b649b631dbb45f39-20200722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1393886740; Wed, 22 Jul 2020 18:04:45 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:04:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 10:04:42 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 10:04:38 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [v7, PATCH 2/7] mtk-mmsys: add mmsys private data
Date: Thu, 23 Jul 2020 10:03:13 +0800
Message-ID: <1595469798-3824-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_220451_965582_9EC7E5E6 
X-CRM114-Status: GOOD (  17.95  )
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

add mmsys private data

Feature: drm/mediatek
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/Makefile             |   1 +
 drivers/soc/mediatek/mmsys/Makefile       |   2 +
 drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 250 +++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c          | 271 +++++-------------------------
 include/linux/soc/mediatek/mtk-mmsys.h    |  15 ++
 5 files changed, 314 insertions(+), 225 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/Makefile
 create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c

diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 2afa7b9..b37ac2c 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mmsys/
diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
new file mode 100644
index 0000000..33b0dab
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += mt2701-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt2701-mmsys.c b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
new file mode 100644
index 0000000..b8e53b0
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
@@ -0,0 +1,250 @@
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
+#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
+#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
+#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
+#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
+#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
+#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
+#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
+#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
+#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
+#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
+#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
+#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
+#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
+#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
+
+#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
+#define DISP_REG_CONFIG_OUT_SEL			0x04c
+#define DISP_REG_CONFIG_DSI_SEL			0x050
+#define DISP_REG_CONFIG_DPI_SEL			0x064
+
+#define OVL0_MOUT_EN_COLOR0			0x1
+#define OD_MOUT_EN_RDMA0			0x1
+#define OD1_MOUT_EN_RDMA1			BIT(16)
+#define UFOE_MOUT_EN_DSI0			0x1
+#define COLOR0_SEL_IN_OVL0			0x1
+#define OVL1_MOUT_EN_COLOR1			0x1
+#define GAMMA_MOUT_EN_RDMA1			0x1
+#define RDMA0_SOUT_DPI0				0x2
+#define RDMA0_SOUT_DPI1				0x3
+#define RDMA0_SOUT_DSI1				0x1
+#define RDMA0_SOUT_DSI2				0x4
+#define RDMA0_SOUT_DSI3				0x5
+#define RDMA1_SOUT_DPI0				0x2
+#define RDMA1_SOUT_DPI1				0x3
+#define RDMA1_SOUT_DSI1				0x1
+#define RDMA1_SOUT_DSI2				0x4
+#define RDMA1_SOUT_DSI3				0x5
+#define RDMA2_SOUT_DPI0				0x2
+#define RDMA2_SOUT_DPI1				0x3
+#define RDMA2_SOUT_DSI1				0x1
+#define RDMA2_SOUT_DSI2				0x4
+#define RDMA2_SOUT_DSI3				0x5
+#define DPI0_SEL_IN_RDMA1			0x1
+#define DPI0_SEL_IN_RDMA2			0x3
+#define DPI1_SEL_IN_RDMA1			(0x1 << 8)
+#define DPI1_SEL_IN_RDMA2			(0x3 << 8)
+#define DSI0_SEL_IN_RDMA1			0x1
+#define DSI0_SEL_IN_RDMA2			0x4
+#define DSI1_SEL_IN_RDMA1			0x1
+#define DSI1_SEL_IN_RDMA2			0x4
+#define DSI2_SEL_IN_RDMA1			(0x1 << 16)
+#define DSI2_SEL_IN_RDMA2			(0x4 << 16)
+#define DSI3_SEL_IN_RDMA1			(0x1 << 16)
+#define DSI3_SEL_IN_RDMA2			(0x4 << 16)
+#define COLOR1_SEL_IN_OVL1			0x1
+
+#define OVL_MOUT_EN_RDMA			0x1
+#define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
+#define BLS_TO_DPI_RDMA1_TO_DSI			0x2
+#define DSI_SEL_IN_BLS				0x0
+#define DPI_SEL_IN_BLS				0x0
+#define DSI_SEL_IN_RDMA				0x1
+
+static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
+					  enum mtk_ddp_comp_id next,
+					  unsigned int *addr)
+{
+	unsigned int value;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
+		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
+		value = OVL0_MOUT_EN_COLOR0;
+	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
+		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
+		value = OVL_MOUT_EN_RDMA;
+	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
+		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
+		value = OD_MOUT_EN_RDMA0;
+	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
+		value = UFOE_MOUT_EN_DSI0;
+	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
+		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
+		value = OVL1_MOUT_EN_COLOR1;
+	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
+		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
+		value = GAMMA_MOUT_EN_RDMA1;
+	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
+		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
+		value = OD1_MOUT_EN_RDMA1;
+	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
+		value = RDMA0_SOUT_DPI0;
+	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
+		value = RDMA0_SOUT_DPI1;
+	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
+		value = RDMA0_SOUT_DSI1;
+	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
+		value = RDMA0_SOUT_DSI2;
+	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
+		value = RDMA0_SOUT_DSI3;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
+		value = RDMA1_SOUT_DSI1;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
+		value = RDMA1_SOUT_DSI2;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
+		value = RDMA1_SOUT_DSI3;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
+		value = RDMA1_SOUT_DPI0;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
+		value = RDMA1_SOUT_DPI1;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
+		value = RDMA2_SOUT_DPI0;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
+		value = RDMA2_SOUT_DPI1;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
+		value = RDMA2_SOUT_DSI1;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
+		value = RDMA2_SOUT_DSI2;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
+		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
+		value = RDMA2_SOUT_DSI3;
+	} else {
+		value = 0;
+	}
+
+	return value;
+}
+
+static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
+					 enum mtk_ddp_comp_id next,
+					 unsigned int *addr)
+{
+	unsigned int value;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
+		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
+		value = COLOR0_SEL_IN_OVL0;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
+		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
+		value = DPI0_SEL_IN_RDMA1;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
+		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
+		value = DPI1_SEL_IN_RDMA1;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
+		value = DSI0_SEL_IN_RDMA1;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
+		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
+		value = DSI1_SEL_IN_RDMA1;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
+		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
+		value = DSI2_SEL_IN_RDMA1;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
+		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
+		value = DSI3_SEL_IN_RDMA1;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
+		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
+		value = DPI0_SEL_IN_RDMA2;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
+		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
+		value = DPI1_SEL_IN_RDMA2;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
+		value = DSI0_SEL_IN_RDMA2;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
+		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
+		value = DSI1_SEL_IN_RDMA2;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
+		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
+		value = DSI2_SEL_IN_RDMA2;
+	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
+		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
+		value = DSI3_SEL_IN_RDMA2;
+	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
+		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
+		value = COLOR1_SEL_IN_OVL1;
+	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_REG_CONFIG_DSI_SEL;
+		value = DSI_SEL_IN_BLS;
+	} else {
+		value = 0;
+	}
+
+	return value;
+}
+
+static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
+				   enum mtk_ddp_comp_id cur,
+				   enum mtk_ddp_comp_id next)
+{
+	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
+		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
+			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
+		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
+			       config_regs + DISP_REG_CONFIG_OUT_SEL);
+		writel_relaxed(DSI_SEL_IN_RDMA,
+			       config_regs + DISP_REG_CONFIG_DSI_SEL);
+		writel_relaxed(DPI_SEL_IN_BLS,
+			       config_regs + DISP_REG_CONFIG_DPI_SEL);
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
+		.name = "mt2701-mmsys",
+	},
+};
+
+builtin_platform_driver(mmsys_drv);
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 36ad66b..605b992 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -10,267 +10,63 @@
 #include <linux/platform_device.h>
 #include <linux/soc/mediatek/mtk-mmsys.h>
 
-#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x040
-#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN	0x044
-#define DISP_REG_CONFIG_DISP_OD_MOUT_EN		0x048
-#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN	0x04c
-#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN	0x050
-#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x084
-#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN	0x088
-#define DISP_REG_CONFIG_DSIE_SEL_IN		0x0a4
-#define DISP_REG_CONFIG_DSIO_SEL_IN		0x0a8
-#define DISP_REG_CONFIG_DPI_SEL_IN		0x0ac
-#define DISP_REG_CONFIG_DISP_RDMA2_SOUT		0x0b8
-#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN	0x0c4
-#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN	0x0c8
-#define DISP_REG_CONFIG_MMSYS_CG_CON0		0x100
-
-#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN	0x030
-#define DISP_REG_CONFIG_OUT_SEL			0x04c
-#define DISP_REG_CONFIG_DSI_SEL			0x050
-#define DISP_REG_CONFIG_DPI_SEL			0x064
-
-#define OVL0_MOUT_EN_COLOR0			0x1
-#define OD_MOUT_EN_RDMA0			0x1
-#define OD1_MOUT_EN_RDMA1			BIT(16)
-#define UFOE_MOUT_EN_DSI0			0x1
-#define COLOR0_SEL_IN_OVL0			0x1
-#define OVL1_MOUT_EN_COLOR1			0x1
-#define GAMMA_MOUT_EN_RDMA1			0x1
-#define RDMA0_SOUT_DPI0				0x2
-#define RDMA0_SOUT_DPI1				0x3
-#define RDMA0_SOUT_DSI1				0x1
-#define RDMA0_SOUT_DSI2				0x4
-#define RDMA0_SOUT_DSI3				0x5
-#define RDMA1_SOUT_DPI0				0x2
-#define RDMA1_SOUT_DPI1				0x3
-#define RDMA1_SOUT_DSI1				0x1
-#define RDMA1_SOUT_DSI2				0x4
-#define RDMA1_SOUT_DSI3				0x5
-#define RDMA2_SOUT_DPI0				0x2
-#define RDMA2_SOUT_DPI1				0x3
-#define RDMA2_SOUT_DSI1				0x1
-#define RDMA2_SOUT_DSI2				0x4
-#define RDMA2_SOUT_DSI3				0x5
-#define DPI0_SEL_IN_RDMA1			0x1
-#define DPI0_SEL_IN_RDMA2			0x3
-#define DPI1_SEL_IN_RDMA1			(0x1 << 8)
-#define DPI1_SEL_IN_RDMA2			(0x3 << 8)
-#define DSI0_SEL_IN_RDMA1			0x1
-#define DSI0_SEL_IN_RDMA2			0x4
-#define DSI1_SEL_IN_RDMA1			0x1
-#define DSI1_SEL_IN_RDMA2			0x4
-#define DSI2_SEL_IN_RDMA1			(0x1 << 16)
-#define DSI2_SEL_IN_RDMA2			(0x4 << 16)
-#define DSI3_SEL_IN_RDMA1			(0x1 << 16)
-#define DSI3_SEL_IN_RDMA2			(0x4 << 16)
-#define COLOR1_SEL_IN_OVL1			0x1
-
-#define OVL_MOUT_EN_RDMA			0x1
-#define BLS_TO_DSI_RDMA1_TO_DPI1		0x8
-#define BLS_TO_DPI_RDMA1_TO_DSI			0x2
-#define DSI_SEL_IN_BLS				0x0
-#define DPI_SEL_IN_BLS				0x0
-#define DSI_SEL_IN_RDMA				0x1
-
 struct mtk_mmsys_driver_data {
 	const char *clk_driver;
+	const char *mmsys_driver;
+};
+
+struct mtk_mmsys_private_data {
+	void __iomem *config_regs;
+	struct mtk_mmsys_conn_funcs *funcs;
 };
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
+	.mmsys_driver = "mt2701-mmsys",
 };
 
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.clk_driver = "clk-mt2712-mm",
+	.mmsys_driver = "mt2701-mmsys",
 };
 
 static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
 	.clk_driver = "clk-mt6779-mm",
+	.mmsys_driver = "mt2701-mmsys",
 };
 
 static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
+	.mmsys_driver = "mt2701-mmsys",
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
+	.mmsys_driver = "mt2701-mmsys",
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
 };
 
-static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
-					  enum mtk_ddp_comp_id next,
-					  unsigned int *addr)
-{
-	unsigned int value;
-
-	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
-		*addr = DISP_REG_CONFIG_DISP_OVL0_MOUT_EN;
-		value = OVL0_MOUT_EN_COLOR0;
-	} else if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_RDMA0) {
-		*addr = DISP_REG_CONFIG_DISP_OVL_MOUT_EN;
-		value = OVL_MOUT_EN_RDMA;
-	} else if (cur == DDP_COMPONENT_OD0 && next == DDP_COMPONENT_RDMA0) {
-		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
-		value = OD_MOUT_EN_RDMA0;
-	} else if (cur == DDP_COMPONENT_UFOE && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DISP_UFOE_MOUT_EN;
-		value = UFOE_MOUT_EN_DSI0;
-	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
-		*addr = DISP_REG_CONFIG_DISP_OVL1_MOUT_EN;
-		value = OVL1_MOUT_EN_COLOR1;
-	} else if (cur == DDP_COMPONENT_GAMMA && next == DDP_COMPONENT_RDMA1) {
-		*addr = DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN;
-		value = GAMMA_MOUT_EN_RDMA1;
-	} else if (cur == DDP_COMPONENT_OD1 && next == DDP_COMPONENT_RDMA1) {
-		*addr = DISP_REG_CONFIG_DISP_OD_MOUT_EN;
-		value = OD1_MOUT_EN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN;
-		value = RDMA0_SOUT_DSI3;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DSI3;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN;
-		value = RDMA1_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DPI0;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DPI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DISP_RDMA2_SOUT;
-		value = RDMA2_SOUT_DSI3;
-	} else {
-		value = 0;
-	}
-
-	return value;
-}
-
-static unsigned int mtk_mmsys_ddp_sel_in(enum mtk_ddp_comp_id cur,
-					 enum mtk_ddp_comp_id next,
-					 unsigned int *addr)
-{
-	unsigned int value;
-
-	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_COLOR0) {
-		*addr = DISP_REG_CONFIG_DISP_COLOR0_SEL_IN;
-		value = COLOR0_SEL_IN_OVL0;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI0_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI1_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI0_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI1_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI2_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI3_SEL_IN_RDMA1;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI0) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI0_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DPI1) {
-		*addr = DISP_REG_CONFIG_DPI_SEL_IN;
-		value = DPI1_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI0_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI1) {
-		*addr = DISP_REG_CONFIG_DSIO_SEL_IN;
-		value = DSI1_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI2) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI2_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_RDMA2 && next == DDP_COMPONENT_DSI3) {
-		*addr = DISP_REG_CONFIG_DSIE_SEL_IN;
-		value = DSI3_SEL_IN_RDMA2;
-	} else if (cur == DDP_COMPONENT_OVL1 && next == DDP_COMPONENT_COLOR1) {
-		*addr = DISP_REG_CONFIG_DISP_COLOR1_SEL_IN;
-		value = COLOR1_SEL_IN_OVL1;
-	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		*addr = DISP_REG_CONFIG_DSI_SEL;
-		value = DSI_SEL_IN_BLS;
-	} else {
-		value = 0;
-	}
-
-	return value;
-}
-
-static void mtk_mmsys_ddp_sout_sel(void __iomem *config_regs,
-				   enum mtk_ddp_comp_id cur,
-				   enum mtk_ddp_comp_id next)
-{
-	if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DSI0) {
-		writel_relaxed(BLS_TO_DSI_RDMA1_TO_DPI1,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-	} else if (cur == DDP_COMPONENT_BLS && next == DDP_COMPONENT_DPI0) {
-		writel_relaxed(BLS_TO_DPI_RDMA1_TO_DSI,
-			       config_regs + DISP_REG_CONFIG_OUT_SEL);
-		writel_relaxed(DSI_SEL_IN_RDMA,
-			       config_regs + DISP_REG_CONFIG_DSI_SEL);
-		writel_relaxed(DPI_SEL_IN_BLS,
-			       config_regs + DISP_REG_CONFIG_DPI_SEL);
-	}
-}
-
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
 {
-	void __iomem *config_regs = dev_get_drvdata(dev);
+	struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
+	void __iomem *config_regs = private->config_regs;
+	struct mtk_mmsys_conn_funcs *priv_funcs = private->funcs;
 	unsigned int addr, value, reg;
 
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
+	value = priv_funcs->mout_en(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(config_regs + addr) | value;
 		writel_relaxed(reg, config_regs + addr);
 	}
 
-	mtk_mmsys_ddp_sout_sel(config_regs, cur, next);
+	priv_funcs->sout_sel(config_regs, cur, next);
 
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
+	value = priv_funcs->sel_in(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(config_regs + addr) | value;
 		writel_relaxed(reg, config_regs + addr);
@@ -282,16 +78,18 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next)
 {
-	void __iomem *config_regs = dev_get_drvdata(dev);
+	struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
+	void __iomem *config_regs = private->config_regs;
+	struct mtk_mmsys_conn_funcs *priv_funcs = private->funcs;
 	unsigned int addr, value, reg;
 
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
+	value = priv_funcs->mout_en(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(config_regs + addr) & ~value;
 		writel_relaxed(reg, config_regs + addr);
 	}
 
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
+	value = priv_funcs->sel_in(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(config_regs + addr) & ~value;
 		writel_relaxed(reg, config_regs + addr);
@@ -299,15 +97,29 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+void mtk_mmsys_register_conn_funcs(struct device *dev,
+				   struct mtk_mmsys_conn_funcs *funcs)
+{
+	struct mtk_mmsys_private_data *private = dev_get_drvdata(dev);
+
+	private->funcs = funcs;
+}
+
 static int mtk_mmsys_probe(struct platform_device *pdev)
 {
 	const struct mtk_mmsys_driver_data *data;
 	struct device *dev = &pdev->dev;
 	struct platform_device *clks;
 	struct platform_device *drm;
+	struct platform_device *mm;
 	void __iomem *config_regs;
 	struct resource *mem;
 	int ret;
+	struct mtk_mmsys_private_data *private;
+
+	private = devm_kzalloc(dev, sizeof(*private), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	config_regs = devm_ioremap_resource(dev, mem);
@@ -317,8 +129,9 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 			ret);
 		return ret;
 	}
+	private->config_regs = config_regs;
 
-	platform_set_drvdata(pdev, config_regs);
+	platform_set_drvdata(pdev, private);
 
 	data = of_device_get_match_data(&pdev->dev);
 
@@ -327,6 +140,14 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	if (IS_ERR(clks))
 		return PTR_ERR(clks);
 
+	mm = platform_device_register_data(&pdev->dev,
+					   data->mmsys_driver,
+					   PLATFORM_DEVID_AUTO,
+					   NULL,
+					   0);
+	if (IS_ERR(mm))
+		return PTR_ERR(mm);
+
 	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
 					    PLATFORM_DEVID_AUTO, NULL, 0);
 	if (IS_ERR(drm)) {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 2228bf6..89185c6 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -42,6 +42,21 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_ID_MAX,
 };
 
+struct mtk_mmsys_conn_funcs {
+	u32 (*mout_en)(enum mtk_ddp_comp_id cur,
+		       enum mtk_ddp_comp_id next,
+		       unsigned int *addr);
+	u32 (*sel_in)(enum mtk_ddp_comp_id cur,
+		      enum mtk_ddp_comp_id next,
+		      unsigned int *addr);
+	void (*sout_sel)(void __iomem *config_regs,
+			 enum mtk_ddp_comp_id cur,
+			 enum mtk_ddp_comp_id next);
+};
+
+void mtk_mmsys_register_conn_funcs(struct device *dev,
+				   struct mtk_mmsys_conn_funcs *funcs);
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
