Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B81FC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 09:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4EB23B7D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 09:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB4EB23B7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E5JXvek44pwnxIwVPyauLtUJQpPyjA49RrNAEfGskZM=; b=HAsnxkTGouxRzVkdw0FUxLZeX
	Z9/u5fBkBBbUjL5hqKcwITayB/hoCQ16HfID+1QAiH0ciw1XQYiHE4p77aoegrfSW+ZtXdVqH8LY3
	YEyFwDsBG8uBSgOxNmzZEvo24emv93tstpVvHOgf8ddi+A1i9YvTjKxA6BOcifX8dEtLL56GehI75
	/5cNXIZtiCjTQURSeoPfwTs6zqTGYj3c3Tcba8y2j+I8VOfJRB2Y9R/vcGOw3hinYDtBbKr0FQloj
	PKwt8hgedmtIUCG8F0+w1pqYlcbHCAALBr7R/Dlw8P+sSJd3Lb5aDvIoFCJEk1A254Jo2P7tZ8cIi
	OOJUE2QsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmvqg-0003IL-H5; Wed, 09 Dec 2020 09:33:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmvqZ-0003Fm-FN; Wed, 09 Dec 2020 09:33:21 +0000
X-UUID: 9f4fd526346b4526beecb1349834fa74-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RoLVFaHJXXTPnp6Fw+qKPaeteQm+7e7JNNH6Iblmj84=; 
 b=uTJZj6qCd3i24m/fqRf/aEz9P3e851vJiQ4upRTJ3syWTi6iN9HNxkL82XbCQ1K+0Kry0DzRMFbRzNtQY1bTo5EnPWyPOo/to8Ywy3+TBbtG0Qq3JniQcyyXOId1z+IN4ircVZsBiCbWFpJOoXcPmXRj0DLn7vNwWxgJZFiRs4E=;
X-UUID: 9f4fd526346b4526beecb1349834fa74-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 960678456; Wed, 09 Dec 2020 01:33:07 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 01:33:05 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 17:33:03 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 17:33:04 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2,
 2/2] soc: mediatek: mmsys: Use function call for setting the routing
 registers
Date: Wed, 9 Dec 2020 17:32:59 +0800
Message-ID: <1607506379-10998-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607506379-10998-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_043319_798499_0ABADE25 
X-CRM114-Status: GOOD (  19.90  )
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

Actually, setting the registers for routing, use multiple 'if-else' for different
routes, but this code would be more and more complicated while we
support more and more SoCs. Change that and use a function call per SoC so the
code will be more portable and clear.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |   3 +-
 drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 233 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c    | 241 +++---------------------------
 include/linux/soc/mediatek/mtk-mmsys.h    |  14 ++
 4 files changed, 268 insertions(+), 223 deletions(-)
 create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index 5d976d7..ac03025 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
\ No newline at end of file
+obj-$(CONFIG_MTK_MMSYS) += mt2701-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt2701-mmsys.c b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
new file mode 100644
index 0000000..40576d3
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
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
+struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs = {
+	.mout_en = mtk_mmsys_ddp_mout_en,
+	.sel_in = mtk_mmsys_ddp_sel_in,
+	.sout_sel = mtk_mmsys_ddp_sout_sel,
+};
diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index da2de8f..9d6a3e9 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -10,91 +10,34 @@
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
+	const struct mtk_mmsys_conn_funcs *funcs;
 };
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.clk_driver = "clk-mt2701-mm",
+	.funcs = &mt2701_mmsys_funcs,
 };
 
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
 	.clk_driver = "clk-mt2712-mm",
+	.funcs = &mt2701_mmsys_funcs,
 };
 
 static const struct mtk_mmsys_driver_data mt6779_mmsys_driver_data = {
 	.clk_driver = "clk-mt6779-mm",
+	.funcs = &mt2701_mmsys_funcs,
 };
 
 static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
+	.funcs = &mt2701_mmsys_funcs,
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
 	.clk_driver = "clk-mt8173-mm",
+	.funcs = &mt2701_mmsys_funcs,
 };
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
@@ -106,176 +49,26 @@ struct mtk_mmsys {
 	const struct mtk_mmsys_driver_data *data;
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
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	unsigned int addr, value, reg;
+	struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;
 
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
+	if (!funcs)
+		return;
+
+	value = funcs->mout_en(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(mmsys->regs + addr) | value;
 		writel_relaxed(reg, mmsys->regs + addr);
 	}
 
-	mtk_mmsys_ddp_sout_sel(mmsys->regs, cur, next);
+	funcs->sout_sel(mmsys->regs, cur, next);
 
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
+	value = funcs->sel_in(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(mmsys->regs + addr) | value;
 		writel_relaxed(reg, mmsys->regs + addr);
@@ -289,14 +82,18 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 {
 	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
 	unsigned int addr, value, reg;
+	struct mtk_mmsys_conn_funcs *funcs = mmsys->data->funcs;
+
+	if (!funcs)
+		return;
 
-	value = mtk_mmsys_ddp_mout_en(cur, next, &addr);
+	value = funcs->mout_en(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(mmsys->regs + addr) & ~value;
 		writel_relaxed(reg, mmsys->regs + addr);
 	}
 
-	value = mtk_mmsys_ddp_sel_in(cur, next, &addr);
+	value = funcs->sel_in(cur, next, &addr);
 	if (value) {
 		reg = readl_relaxed(mmsys->regs + addr) & ~value;
 		writel_relaxed(reg, mmsys->regs + addr);
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 2228bf6..17e8b91 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -42,6 +42,20 @@ enum mtk_ddp_comp_id {
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
+extern struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs;
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
