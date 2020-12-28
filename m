Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 894A3C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 08:38:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5237420897
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 08:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5237420897
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QUTVkx8yCMh4UOqZoOEL0hvMCoaToC6Msy5Q3RTG9m0=; b=nshZrgh2DN9QhQRC+JESRF5Xk
	NhMMKfuuG4kWsb2EPB7KIsvFaZFlV7cbWdkXmV1N8jXYdGJJyFtIym7SsG70VJTacOWhxHnvlFZfr
	B9dSptZL4XW1JqnHJAN9HvZRJdAnIz9GMEYQ4DWAf6BOeGSacO+BYA8ZpV9u8UleArOOsYwdvLHVL
	1plW40u66A0G1EoFSmM7kffXuxLGWc3iYrU9cTWuTifJZCyNqZxqanRm/CQwZ0qGcjpb1iYQ5CTLn
	4tuXUXxXmAvSb3u4pboyeBDZOHZ0iaTOis4iRXA3Hz6UwWBBTW636njld7bhM8pIKGSR/RmJtEWCx
	RupCW5gPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kto2Z-0002Mz-75; Mon, 28 Dec 2020 08:38:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kto1w-000258-Gj; Mon, 28 Dec 2020 08:37:32 +0000
X-UUID: f03c6a28e7fd4410ba5476efc2fffbd3-20201228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=nUgriw7eF3UtPpMrIStjxTmQRw6HBp8sREgt9OofA8U=; 
 b=o86eXexl3UizMUjgxeavKoaQE5dR+l1eZSRitwD//0XBlBxf07JeME1nJW+uM/syrL5C4mGPL75kCnEA3x3UwacRZ93dxgP3suK4HufLVikewdt5dYPboZXOnOa/1C9JisR1k3mNPALTdRWho2qUb7owuF6Zs28tXkHPBd7gRVQ=;
X-UUID: f03c6a28e7fd4410ba5476efc2fffbd3-20201228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2013610873; Mon, 28 Dec 2020 00:37:22 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 00:38:28 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 16:38:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Dec 2020 16:38:27 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 8/8] soc: mediatek: mmsys: add mt8192 mmsys support
Date: Mon, 28 Dec 2020 16:37:10 +0800
Message-ID: <1609144630-14721-9-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_033728_796180_BA903CE2 
X-CRM114-Status: GOOD (  23.41  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
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
 drivers/soc/mediatek/mmsys/mtk-mmsys.c    |   9 +++
 include/linux/soc/mediatek/mtk-mmsys.h    |   1 +
 4 files changed, 130 insertions(+)
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
index 0000000..a5145ff
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
+	unsigned int value;
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
+		value = 0;
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
diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index ea36a11..42a9f51 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -45,6 +45,11 @@ struct mtk_mmsys_driver_data {
 	.funcs = &mt8183_mmsys_funcs,
 };
 
+static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
+	.clk_driver = "clk-mt8192-mm",
+	.funcs = &mt8192_mmsys_funcs,
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
@@ -184,6 +189,10 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 		.compatible = "mediatek,mt8183-mmsys",
 		.data = &mt8183_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8192-mmsys",
+		.data = &mt8192_mmsys_driver_data,
+	},
 	{ }
 };
 
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
