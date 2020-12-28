Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFF4BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 08:38:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6367F2074D
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 08:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6367F2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2H7Ogyop9BBam1voPv5T3p8tr5kDA3sR9bekR1zZ4oY=; b=tVX23N8TT8jX13KKtJsiDuRRF
	hAs61RsYC7NKMRd+7ZBKfuHApNPgbioJN+PxXp+M9bp7bgZeMJa9sVajL1afWYfII/UWVCJMptqsw
	dyhJGSPvw9hMvm+pQZuahG1AwVNdkM6nRYp3hAqGniApqQgWEf9v7zTuqSTgbZMOGB3ZU4io05VgM
	8P//8ekOecnfzKApHO+T6793ZakrsPMkvgavccu1hH5avnA5R+s05Je6xUUUNWRiOjk7ZgfVWvpnC
	0fqmpTv7LYm8df8d/GZtPgmcya4K/kuCs6edzf1v8dqoYbBkd4zqp9lb3Xi1WwePcBRAU7Cp2XmQg
	18HZh8ZkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kto27-0002Ak-L9; Mon, 28 Dec 2020 08:37:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kto1r-000242-En; Mon, 28 Dec 2020 08:37:25 +0000
X-UUID: add0bd65351d4509a7996442c8f11352-20201228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XmHcGR3qMnxNC57mXu8H4b3uKMfpRYUvqLAwk7+jKWI=; 
 b=oLl8WG8gu0NgR0X2UAe3/0mzVha746Zks0csXhgTwbK6lDNEhQxYMBhSGYMWZE7lqAQekM4DrZCB4h4uv+WHceBM2h2Q8PME00ym2IJBuKdE40hHjWoXbfynCurn47nSsj5y4qBGxoeHcb80JiZTXbMKSI2niwDw5DwINuBRQJU=;
X-UUID: add0bd65351d4509a7996442c8f11352-20201228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1046191954; Mon, 28 Dec 2020 00:37:17 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 00:38:24 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 16:38:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Dec 2020 16:38:23 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3,
 3/8] soc: mediatek: mmsys: add mt8183 function call for setting the
 routing registers
Date: Mon, 28 Dec 2020 16:37:05 +0800
Message-ID: <1609144630-14721-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_033723_731819_3DC2D130 
X-CRM114-Status: GOOD (  21.07  )
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

add mt8183 function call for setting the routing registers

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/soc/mediatek/mmsys/Makefile       |  1 +
 drivers/soc/mediatek/mmsys/mt8183-mmsys.c | 90 +++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mmsys/mtk-mmsys.c    |  1 +
 include/linux/soc/mediatek/mtk-mmsys.h    |  1 +
 4 files changed, 93 insertions(+)
 create mode 100644 drivers/soc/mediatek/mmsys/mt8183-mmsys.c

diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
index ac03025..25eeb9e5 100644
--- a/drivers/soc/mediatek/mmsys/Makefile
+++ b/drivers/soc/mediatek/mmsys/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_MTK_MMSYS) += mt2701-mmsys.o
+obj-$(CONFIG_MTK_MMSYS) += mt8183-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
diff --git a/drivers/soc/mediatek/mmsys/mt8183-mmsys.c b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
new file mode 100644
index 0000000..192b4ab
--- /dev/null
+++ b/drivers/soc/mediatek/mmsys/mt8183-mmsys.c
@@ -0,0 +1,90 @@
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
+static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
+					  enum mtk_ddp_comp_id next,
+					  unsigned int *addr)
+{
+	unsigned int value;
+
+	if (cur == DDP_COMPONENT_OVL0 && next == DDP_COMPONENT_OVL_2L0) {
+		*addr = DISP_OVL0_MOUT_EN;
+		value = OVL0_MOUT_EN_OVL0_2L;
+	} else if (cur == DDP_COMPONENT_OVL_2L0 && next == DDP_COMPONENT_RDMA0) {
+		*addr = DISP_OVL0_2L_MOUT_EN;
+		value = OVL0_2L_MOUT_EN_DISP_PATH0;
+	} else if (cur == DDP_COMPONENT_OVL_2L1 && next == DDP_COMPONENT_RDMA1) {
+		*addr = DISP_OVL1_2L_MOUT_EN;
+		value = OVL1_2L_MOUT_EN_RDMA1;
+	} else if (cur == DDP_COMPONENT_DITHER && next == DDP_COMPONENT_DSI0) {
+		*addr = DISP_DITHER0_MOUT_EN;
+		value = DITHER0_MOUT_IN_DSI0;
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
+		*addr = DISP_PATH0_SEL_IN;
+		value = DISP_PATH0_SEL_IN_OVL0_2L;
+	} else if (cur == DDP_COMPONENT_RDMA1 && next == DDP_COMPONENT_DPI0) {
+		*addr = DISP_DPI0_SEL_IN;
+		value = DPI0_SEL_IN_RDMA1;
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
+		writel_relaxed(RDMA0_SOUT_COLOR0, config_regs + DISP_RDMA0_SOUT_SEL_IN);
+	}
+}
+
+struct mtk_mmsys_conn_funcs mt8183_mmsys_funcs = {
+	.mout_en = mtk_mmsys_ddp_mout_en,
+	.sel_in = mtk_mmsys_ddp_sel_in,
+	.sout_sel = mtk_mmsys_ddp_sout_sel,
+};
diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
index c35bda1..dae665b 100644
--- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
@@ -42,6 +42,7 @@ struct mtk_mmsys_driver_data {
 
 static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.clk_driver = "clk-mt8183-mm",
+	.funcs = &mt8183_mmsys_funcs,
 };
 
 struct mtk_mmsys {
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 17e8b91..4b6c514 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -55,6 +55,7 @@ struct mtk_mmsys_conn_funcs {
 };
 
 extern struct mtk_mmsys_conn_funcs mt2701_mmsys_funcs;
+extern struct mtk_mmsys_conn_funcs mt8183_mmsys_funcs;
 
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
