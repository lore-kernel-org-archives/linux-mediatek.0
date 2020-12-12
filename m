Return-Path: <SRS0=F1mA=FQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF97C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:22:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E807D2313F
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E807D2313F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Chych+2coR9p/arv9gR6tmRo9IMN016qZTieYakNcY=; b=vexJ+Jdbiwky1XhvWHLlIYL1o
	L4bfWLXyGVHF1TVO/IEFzThFf2ZbO5gnAyvUrQg+ajzN4QVnna2ijjuWCLpNO5Zaauoaz4cBULQip
	Dn38jPpTTB1Eb1Zo+pVGK/uBSYaBYXbfcVaI3fkmtNOZRSaUOE95ihSs2YAsWB3yH+EYNQllMS8aA
	r4jgjV/UOarEalbuHXBrrATJlQznzesvctxoKB4COsW31UWxYInInuW1Ij91/rRpYCPSd8m76XKCB
	E6Hb/LUIXFvPdQ8RCv+29YOd2CaBCMylox02o019trpxR9/orwaMTLeHkXV1cynU/YazvV5WL9bjG
	MqJOQpDDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knwQa-0005sK-7s; Sat, 12 Dec 2020 04:22:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwQH-0005k7-Oa; Sat, 12 Dec 2020 04:22:23 +0000
X-UUID: 1073cd107d0d470eb53c122ad8df5987-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lkcZdc+TM3+g8KNS/R0A+hEO6aTAXrK73U1Q9IB6xn0=; 
 b=iiUBZwT6u4LgzH8Lxv6zzmoE48HaihcaGWdRemioydT+4YCmzBIArngoaCk8Gh0mI08rhJXXqyqNSLNTXOhYXmVML5TXOSReyDGRmWb4wdSgy7ZP4xJF027jydmevpbnv11oinjHtTmCEhb5FaBWDx24Q34htvPPTJH669rJOrE=;
X-UUID: 1073cd107d0d470eb53c122ad8df5987-20201211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 982437884; Fri, 11 Dec 2020 20:22:15 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 20:12:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:12 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:12 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 15/17] soc: mediatek: mmsys: add mt8192 mmsys support
Date: Sat, 12 Dec 2020 12:11:55 +0800
Message-ID: <1607746317-4696-16-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_232222_004822_D98BEDF3 
X-CRM114-Status: GOOD (  20.97  )
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
 drivers/soc/mediatek/mmsys/mt8192-mmsys.c | 119 ++++++++++++++++++++++++++++++
 include/linux/soc/mediatek/mtk-mmsys.h    |   1 +
 3 files changed, 121 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8192-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index 25eeb9e5..7508cd3 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_MMSYS) += mt2701-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mt8183-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mt8192-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8192-mmsys.c b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
new file mode 100644
index 0000000..79cb33f
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8192-mmsys.c
@@ -0,0 +1,119 @@
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
+#define MMSYS_OVL_MOUT_EN		0xf04
+#define DISP_OVL0_GO_BLEND			BIT(0)
+#define DISP_OVL0_GO_BG				BIT(1)
+#define DISP_OVL0_2L_GO_BLEND			BIT(2)
+#define DISP_OVL0_2L_GO_BG			BIT(3)
+#define DISP_OVL1_2L_MOUT_EN		0xf08
+#define OVL1_2L_MOUT_EN_RDMA1			BIT(4)
+#define DISP_OVL0_2L_MOUT_EN		0xf18
+#define DISP_OVL0_MOUT_EN		0xf1c
+#define OVL0_MOUT_EN_DISP_RDMA0			BIT(0)
+#define OVL0_MOUT_EN_OVL0_2L			BIT(4)
+#define DISP_RDMA0_SEL_IN		0xf2c
+#define RDMA0_SEL_IN_OVL0_2L			0x3
+#define DISP_RDMA0_SOUT_SEL		0xf30
+#define RDMA0_SOUT_COLOR0			0x1
+#define DISP_CCORR0_SOUT_SEL		0xf34
+#define CCORR0_SOUT_AAL0			0x1
+#define DISP_AAL0_SEL_IN		0xf38
+#define AAL0_SEL_IN_CCORR0			0x1
+#define DISP_DITHER0_MOUT_EN		0xf3c
+#define DITHER0_MOUT_DSI0			BIT(0)
+#define DISP_DSI0_SEL_IN		0xf40
+#define DSI0_SEL_IN_DITHER0			0x1
+#define DISP_OVL2_2L_MOUT_EN		0xf4c
+#define OVL2_2L_MOUT_RDMA4			BIT(0)
+
+static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
+					  enum mtk_ddp_comp_id next,
+					  unsigned int *addr)
+{
+	unsigned int value;
+
+	if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_RDMA0) {
+		*addr = DISP_OVL0_2L_MOUT_EN;
+		value = OVL0_MOUT_EN_DISP_RDMA0;
+	} else if (cur == DDP_COMPONENT_OVL_2L2 && next == DDP_COMPONENT_RDMA4) {
+		*addr = DISP_OVL2_2L_MOUT_EN;
+		value = OVL2_2L_MOUT_RDMA4;
+	} else if (cur == DDP_COMPONENT_DITHER && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_DITHER0_MOUT_EN;
+		value = DITHER0_MOUT_DSI0;
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
+	if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_RDMA0) {
+		*addr = DISP_RDMA0_SEL_IN;
+		value = RDMA0_SEL_IN_OVL0_2L;
+	} else if (cur == DDP_COMPONENT_CCORR && next == DDP_COMPONENT_AAL0) {
+		*addr = DISP_AAL0_SEL_IN;
+		value = AAL0_SEL_IN_CCORR0;
+	} else if (cur == DDP_COMPONENT_DITHER && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_DSI0_SEL_IN;
+		value = DSI0_SEL_IN_DITHER0;
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
+	if (cur == DDP_COMPONENT_RDMA0 && next == DDP_COMPONENT_COLOR0) {
+		writel_relaxed(RDMA0_SOUT_COLOR0, config_regs + DISP_RDMA0_SOUT_SEL);
+	} else if (cur == DDP_COMPONENT_CCORR && next == DDP_COMPONENT_AAL0) {
+		writel_relaxed(CCORR0_SOUT_AAL0, config_regs + DISP_CCORR0_SOUT_SEL);
+	}
+}
+
+static unsigned int mtk_mmsys_ovl_mout_en(enum mtk_ddp_comp_id cur,
+					  enum mtk_ddp_comp_id next,
+					  unsigned int *addr)
+{
+	int value = -1;
+
+	*addr = MMSYS_OVL_MOUT_EN;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_2L_GO_BG;
+	else if (cur == DDP_COMPONENT_OVL0)
+		value = DISP_OVL0_GO_BLEND;
+	else if (cur == DDP_COMPONENT_OVL_2L0)
+		value = DISP_OVL0_2L_GO_BLEND;
+	else
+		value = -1;
+
+	return value;
+}
+
+struct mtk_mmsys_conn_funcs mt8192_mmsys_funcs = {
+	.mout_en = mtk_mmsys_ddp_mout_en,
+	.ovl_mout_en = mtk_mmsys_ovl_mout_en,
+	.sel_in = mtk_mmsys_ddp_sel_in,
+	.sout_sel = mtk_mmsys_ddp_sout_sel,
+};
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 220203d..efa07b9 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -62,6 +62,7 @@ struct mtk_mmsys_conn_funcs {
 
 extern struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs;
 extern struct mtk_mmsys_conn_funcs mt8183_mmsys_funcs;
+extern struct mtk_mmsys_conn_funcs mt8192_mmsys_funcs;
 
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
