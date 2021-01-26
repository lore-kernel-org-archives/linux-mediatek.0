Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65347C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:06:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B85812251D
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 08:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B85812251D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UkbD7RFvI51SU6ev4QszhTfyGWbPH4jpUnbPJJrZHFg=; b=j0s2WK0LhmB6lE/5GIuS9W74N
	iMu0TfF5IgFmpX5B9sfFohqLajmYNjxFIamC/UcSrHK2/1RSHFOKHio8c70I5nkrTEHhh9IYD4aRg
	HDRw7pWPTn+Rn5EgvtoaPf54wV7pBzuwKWJQvdb1zF5dkzaDYHTYUAcu2gfmfEZGcwmBFlT2TM5Sf
	FBBfaEN5Ak04IUyhMO6FPnDWC5VjIb/0uhG3hqUga7Y/5HRZdXcPjgsRwB40Zwh4ULBesAhN5oQaF
	p5c3bCTepT5NkslDV5Z6G7t0BTcYqF9aCEycHWf7cGTfhhaBL0yW9rFDa/zYzOt5yUZH5ujQbyxq7
	2nsd7TyCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4JMQ-0007HZ-N4; Tue, 26 Jan 2021 08:06:02 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4JKj-0006LH-3L; Tue, 26 Jan 2021 08:04:19 +0000
X-UUID: 7b74929b10b24796bd85efd4ae1f68a3-20210126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=OX4J69QjxQfrAnqtEI2M3ZXk2jMgzgXaBDdT0jBos5c=; 
 b=SuM3dnHOHtWNs28gUrJ0LGXQDm4FCV2qywHL8pEaPBaOqxiytsEzyP+7/xAyBSGoWobOGXWNy2cwODtpGeayEwBU9+fbLLf9WS8Luds24moi32Y3Tr75alO0sac+7XF5AEz46wN6VUlU2SiVY4TcksOn2FAPh1a6rj8G52TtZa8=;
X-UUID: 7b74929b10b24796bd85efd4ae1f68a3-20210126
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 519197560; Tue, 26 Jan 2021 00:04:05 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 00:04:03 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Jan 2021 16:03:56 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 26 Jan 2021 16:03:57 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Subject: [PATCH V8 08/12] interconnect: mediatek: Add interconnect provider
 driver
Date: Tue, 26 Jan 2021 16:03:50 +0800
Message-ID: <1611648234-15043-9-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
References: <1611648234-15043-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210126_030417_327110_C13CA8B9 
X-CRM114-Status: GOOD (  20.48  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Henry Chen <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce Mediatek MT6873/MT8183/MT8192 specific provider driver
using the interconnect framework.

             ICC provider         ICC Nodes
                              ----          ----
             ---------       |CPU |   |--- |VPU |
    -----   |         |-----  ----    |     ----
   |DRAM |--|DRAM     |       ----    |     ----
   |     |--|scheduler|----- |GPU |   |--- |DISP|
   |     |--|(EMI)    |       ----    |     ----
   |     |--|         |       -----   |     ----
    -----   |         |----- |MMSYS|--|--- |VDEC|
             ---------        -----   |     ----
               /|\                    |     ----
                |change DRAM freq     |--- |VENC|
             ----------               |     ----
            |  DVFSR   |              |
            |          |              |     ----
             ----------               |--- |IMG |
                                      |     ----
                                      |     ----
                                      |--- |CAM |
                                            ----

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/interconnect/Kconfig            |   1 +
 drivers/interconnect/Makefile           |   1 +
 drivers/interconnect/mediatek/Kconfig   |  13 ++
 drivers/interconnect/mediatek/Makefile  |   3 +
 drivers/interconnect/mediatek/mtk-emi.c | 331 ++++++++++++++++++++++++++++++++
 5 files changed, 349 insertions(+)
 create mode 100644 drivers/interconnect/mediatek/Kconfig
 create mode 100644 drivers/interconnect/mediatek/Makefile
 create mode 100644 drivers/interconnect/mediatek/mtk-emi.c

diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
index d637a89..da91f84 100644
--- a/drivers/interconnect/Kconfig
+++ b/drivers/interconnect/Kconfig
@@ -12,6 +12,7 @@ menuconfig INTERCONNECT
 if INTERCONNECT
 
 source "drivers/interconnect/imx/Kconfig"
+source "drivers/interconnect/mediatek/Kconfig"
 source "drivers/interconnect/qcom/Kconfig"
 source "drivers/interconnect/samsung/Kconfig"
 
diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
index 97d393f..d697500 100644
--- a/drivers/interconnect/Makefile
+++ b/drivers/interconnect/Makefile
@@ -5,5 +5,6 @@ icc-core-objs				:= core.o bulk.o
 
 obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
 obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
+obj-$(CONFIG_INTERCONNECT_MTK)		+= mediatek/
 obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
 obj-$(CONFIG_INTERCONNECT_SAMSUNG)	+= samsung/
diff --git a/drivers/interconnect/mediatek/Kconfig b/drivers/interconnect/mediatek/Kconfig
new file mode 100644
index 0000000..ec98d6a
--- /dev/null
+++ b/drivers/interconnect/mediatek/Kconfig
@@ -0,0 +1,13 @@
+config INTERCONNECT_MTK
+	bool "Mediatek Network-on-Chip interconnect drivers"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Support for Mediatek's Network-on-Chip interconnect hardware.
+
+config INTERCONNECT_MTK_EMI
+	tristate "Mediatek EMI interconnect driver"
+	depends on INTERCONNECT_MTK
+	depends on (MTK_DVFSRC && OF) || COMPILE_TEST
+	help
+	  This is a driver for the Mediatek Network-on-Chip on DVFSRC-based
+	  platforms.
diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
new file mode 100644
index 0000000..353842b
--- /dev/null
+++ b/drivers/interconnect/mediatek/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_INTERCONNECT_MTK_EMI) += mtk-emi.o
\ No newline at end of file
diff --git a/drivers/interconnect/mediatek/mtk-emi.c b/drivers/interconnect/mediatek/mtk-emi.c
new file mode 100644
index 0000000..8d650be
--- /dev/null
+++ b/drivers/interconnect/mediatek/mtk-emi.c
@@ -0,0 +1,331 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk_dvfsrc.h>
+#include <dt-bindings/interconnect/mtk,mt6873-emi.h>
+#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
+
+enum mtk_icc_name {
+	SLAVE_DDR_EMI,
+	MASTER_MCUSYS,
+	MASTER_GPUSYS,
+	MASTER_MMSYS,
+	MASTER_MM_VPU,
+	MASTER_MM_DISP,
+	MASTER_MM_VDEC,
+	MASTER_MM_VENC,
+	MASTER_MM_CAM,
+	MASTER_MM_IMG,
+	MASTER_MM_MDP,
+	MASTER_VPUSYS,
+	MASTER_VPU_PORT_0,
+	MASTER_VPU_PORT_1,
+	MASTER_MDLASYS,
+	MASTER_MDLA_PORT_0,
+	MASTER_UFS,
+	MASTER_PCIE,
+	MASTER_USB,
+	MASTER_WIFI,
+	MASTER_BT,
+	MASTER_NETSYS,
+	MASTER_DBGIF,
+
+	SLAVE_HRT_DDR_EMI,
+	MASTER_HRT_MMSYS,
+	MASTER_HRT_MM_DISP,
+	MASTER_HRT_MM_VDEC,
+	MASTER_HRT_MM_VENC,
+	MASTER_HRT_MM_CAM,
+	MASTER_HRT_MM_IMG,
+	MASTER_HRT_MM_MDP,
+	MASTER_HRT_DBGIF,
+};
+
+#define MT8183_MAX_LINKS	1
+
+/**
+ * struct mtk_icc_node - Mediatek specific interconnect nodes
+ * @name: the node name used in debugfs
+ * @ep : the type of this endpoint
+ * @id: a unique node identifier
+ * @links: an array of nodes where we can go next while traversing
+ * @num_links: the total number of @links
+ * @sum_avg: current sum aggregate value of all avg bw kBps requests
+ * @max_peak: current max aggregate value of all peak bw kBps requests
+ */
+struct mtk_icc_node {
+	unsigned char *name;
+	int ep;
+	u16 id;
+	u16 links[MT8183_MAX_LINKS];
+	u16 num_links;
+	u64 sum_avg;
+	u64 max_peak;
+};
+
+struct mtk_icc_desc {
+	struct mtk_icc_node **nodes;
+	size_t num_nodes;
+};
+
+#define DEFINE_MNODE(_name, _id, _ep, ...)	\
+		static struct mtk_icc_node _name = {			\
+		.name = #_name,						\
+		.id = _id,						\
+		.ep = _ep,						\
+		.num_links = ARRAY_SIZE(((int[]){ __VA_ARGS__ })),	\
+		.links = { __VA_ARGS__ },				\
+}
+
+DEFINE_MNODE(ddr_emi, SLAVE_DDR_EMI, 1);
+DEFINE_MNODE(mcusys, MASTER_MCUSYS, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(gpu, MASTER_GPUSYS, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(mmsys, MASTER_MMSYS, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(mm_vpu, MASTER_MM_VPU, 0, MASTER_MMSYS);
+DEFINE_MNODE(mm_disp, MASTER_MM_DISP, 0, MASTER_MMSYS);
+DEFINE_MNODE(mm_vdec, MASTER_MM_VDEC, 0, MASTER_MMSYS);
+DEFINE_MNODE(mm_venc, MASTER_MM_VENC, 0, MASTER_MMSYS);
+DEFINE_MNODE(mm_cam, MASTER_MM_CAM, 0, MASTER_MMSYS);
+DEFINE_MNODE(mm_img, MASTER_MM_IMG, 0, MASTER_MMSYS);
+DEFINE_MNODE(mm_mdp, MASTER_MM_MDP, 0, MASTER_MMSYS);
+DEFINE_MNODE(vpusys, MASTER_VPUSYS, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(vpu_port_0, MASTER_VPU_PORT_0, 0, MASTER_VPUSYS);
+DEFINE_MNODE(vpu_port_1, MASTER_VPU_PORT_1, 0, MASTER_VPUSYS);
+DEFINE_MNODE(mdlasys, MASTER_MDLASYS, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(mdla_port_0, MASTER_MDLA_PORT_0, 0, MASTER_MDLASYS);
+DEFINE_MNODE(ufs, MASTER_UFS, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(pcie, MASTER_PCIE, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(usb, MASTER_USB, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(wifi, MASTER_WIFI, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(bt, MASTER_BT, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(netsys, MASTER_NETSYS, 0, SLAVE_DDR_EMI);
+DEFINE_MNODE(dbgif, MASTER_DBGIF, 0, SLAVE_DDR_EMI);
+
+DEFINE_MNODE(hrt_ddr_emi, SLAVE_HRT_DDR_EMI, 2);
+DEFINE_MNODE(hrt_mmsys, MASTER_HRT_MMSYS, 0, SLAVE_HRT_DDR_EMI);
+DEFINE_MNODE(hrt_mm_disp, MASTER_HRT_MM_DISP, 0, MASTER_HRT_MMSYS);
+DEFINE_MNODE(hrt_mm_vdec, MASTER_HRT_MM_VDEC, 0, MASTER_HRT_MMSYS);
+DEFINE_MNODE(hrt_mm_venc, MASTER_HRT_MM_VENC, 0, MASTER_HRT_MMSYS);
+DEFINE_MNODE(hrt_mm_cam, MASTER_HRT_MM_CAM, 0, MASTER_HRT_MMSYS);
+DEFINE_MNODE(hrt_mm_img, MASTER_HRT_MM_IMG, 0, MASTER_HRT_MMSYS);
+DEFINE_MNODE(hrt_mm_mdp, MASTER_HRT_MM_MDP, 0, MASTER_HRT_MMSYS);
+DEFINE_MNODE(hrt_dbgif, MASTER_HRT_DBGIF, 0, SLAVE_HRT_DDR_EMI);
+
+static struct mtk_icc_node *mt8183_icc_nodes[] = {
+	[MT8183_SLAVE_DDR_EMI] = &ddr_emi,
+	[MT8183_MASTER_MCUSYS] = &mcusys,
+	[MT8183_MASTER_GPU] = &gpu,
+	[MT8183_MASTER_MMSYS] = &mmsys,
+	[MT8183_MASTER_MM_VPU] = &mm_vpu,
+	[MT8183_MASTER_MM_DISP] = &mm_disp,
+	[MT8183_MASTER_MM_VDEC] = &mm_vdec,
+	[MT8183_MASTER_MM_VENC] = &mm_venc,
+	[MT8183_MASTER_MM_CAM] = &mm_cam,
+	[MT8183_MASTER_MM_IMG] = &mm_img,
+	[MT8183_MASTER_MM_MDP] = &mm_mdp,
+};
+
+static const struct mtk_icc_desc mt8183_icc = {
+	.nodes = mt8183_icc_nodes,
+	.num_nodes = ARRAY_SIZE(mt8183_icc_nodes),
+};
+
+static struct mtk_icc_node *mt6873_icc_nodes[] = {
+	[MT6873_SLAVE_DDR_EMI] = &ddr_emi,
+	[MT6873_MASTER_MCUSYS] = &mcusys,
+	[MT6873_MASTER_GPUSYS] = &gpu,
+	[MT6873_MASTER_MMSYS] = &mmsys,
+	[MT6873_MASTER_MM_VPU] = &mm_vpu,
+	[MT6873_MASTER_MM_DISP] = &mm_disp,
+	[MT6873_MASTER_MM_VDEC] = &mm_vdec,
+	[MT6873_MASTER_MM_VENC] = &mm_venc,
+	[MT6873_MASTER_MM_CAM] = &mm_cam,
+	[MT6873_MASTER_MM_IMG] = &mm_img,
+	[MT6873_MASTER_MM_MDP] = &mm_mdp,
+	[MT6873_MASTER_VPUSYS] = &vpusys,
+	[MT6873_MASTER_VPU_0] = &vpu_port_0,
+	[MT6873_MASTER_VPU_1] = &vpu_port_1,
+	[MT6873_MASTER_MDLASYS] = &mdlasys,
+	[MT6873_MASTER_MDLA_0] = &mdla_port_0,
+	[MT6873_MASTER_UFS] = &ufs,
+	[MT6873_MASTER_PCIE] = &pcie,
+	[MT6873_MASTER_USB] = &usb,
+	[MT6873_MASTER_WIFI] = &wifi,
+	[MT6873_MASTER_BT] = &bt,
+	[MT6873_MASTER_NETSYS] = &netsys,
+	[MT6873_MASTER_DBGIF] = &dbgif,
+
+	[MT6873_SLAVE_HRT_DDR_EMI] = &hrt_ddr_emi,
+	[MT6873_MASTER_HRT_MMSYS] = &hrt_mmsys,
+	[MT6873_MASTER_HRT_MM_DISP] = &hrt_mm_disp,
+	[MT6873_MASTER_HRT_MM_VDEC] = &hrt_mm_vdec,
+	[MT6873_MASTER_HRT_MM_VENC] = &hrt_mm_venc,
+	[MT6873_MASTER_HRT_MM_CAM] = &hrt_mm_cam,
+	[MT6873_MASTER_HRT_MM_IMG] = &hrt_mm_img,
+	[MT6873_MASTER_HRT_MM_MDP] = &hrt_mm_mdp,
+	[MT6873_MASTER_HRT_DBGIF] = &hrt_dbgif,
+};
+
+static struct mtk_icc_desc mt6873_icc = {
+	.nodes = mt6873_icc_nodes,
+	.num_nodes = ARRAY_SIZE(mt6873_icc_nodes),
+};
+
+static const struct of_device_id emi_icc_of_match[] = {
+	{ .compatible = "mediatek,mt8183-dvfsrc", .data = &mt8183_icc },
+	{ .compatible = "mediatek,mt8192-dvfsrc", .data = &mt6873_icc },
+	{ .compatible = "mediatek,mt6873-dvfsrc", .data = &mt6873_icc },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, emi_icc_of_match);
+
+static int emi_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
+			     u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	struct mtk_icc_node *in;
+
+	in = node->data;
+
+	*agg_avg += avg_bw;
+	*agg_peak = max_t(u32, *agg_peak, peak_bw);
+
+	in->sum_avg = *agg_avg;
+	in->max_peak = *agg_peak;
+
+	return 0;
+}
+
+static int emi_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	int ret = 0;
+	struct mtk_icc_node *node;
+
+	node = dst->data;
+
+	if (node->ep == 1) {
+		mtk_dvfsrc_send_request(src->provider->dev,
+					MTK_DVFSRC_CMD_PEAK_BW_REQUEST,
+					node->max_peak);
+		mtk_dvfsrc_send_request(src->provider->dev,
+					MTK_DVFSRC_CMD_BW_REQUEST,
+					node->sum_avg);
+	} else if (node->ep == 2) {
+		mtk_dvfsrc_send_request(src->provider->dev,
+					MTK_DVFSRC_CMD_HRTBW_REQUEST,
+					node->sum_avg);
+	}
+
+	return ret;
+}
+
+static int emi_icc_remove(struct platform_device *pdev);
+static int emi_icc_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	const struct mtk_icc_desc *desc;
+	struct device *dev = &pdev->dev;
+	struct icc_node *node;
+	struct icc_onecell_data *data;
+	struct icc_provider *provider;
+	struct mtk_icc_node **mnodes;
+	size_t num_nodes, i, j;
+	int ret;
+
+	match = of_match_node(emi_icc_of_match, dev->parent->of_node);
+
+	if (!match) {
+		dev_err(dev, "invalid compatible string\n");
+		return -ENODEV;
+	}
+
+	desc = match->data;
+	mnodes = desc->nodes;
+	num_nodes = desc->num_nodes;
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	data = devm_kzalloc(dev, struct_size(data, nodes, num_nodes),
+			    GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	provider->dev = pdev->dev.parent;
+	provider->set = emi_icc_set;
+	provider->aggregate = emi_icc_aggregate;
+	provider->xlate = of_icc_xlate_onecell;
+	INIT_LIST_HEAD(&provider->nodes);
+	provider->data = data;
+
+	ret = icc_provider_add(provider);
+	if (ret) {
+		dev_err(&pdev->dev, "error adding interconnect provider\n");
+		return ret;
+	}
+
+	for (i = 0; i < num_nodes; i++) {
+		node = icc_node_create(mnodes[i]->id);
+		if (IS_ERR(node)) {
+			ret = PTR_ERR(node);
+			goto err;
+		}
+
+		node->name = mnodes[i]->name;
+		node->data = mnodes[i];
+		icc_node_add(node, provider);
+
+		for (j = 0; j < mnodes[i]->num_links; j++)
+			icc_link_create(node, mnodes[i]->links[j]);
+
+		data->nodes[i] = node;
+	}
+	data->num_nodes = num_nodes;
+
+	platform_set_drvdata(pdev, provider);
+
+	return 0;
+err:
+	icc_nodes_remove(provider);
+	icc_provider_del(provider);
+	return ret;
+}
+
+static int emi_icc_remove(struct platform_device *pdev)
+{
+	struct icc_provider *provider = platform_get_drvdata(pdev);
+
+	icc_nodes_remove(provider);
+	return icc_provider_del(provider);
+}
+
+static struct platform_driver emi_icc_driver = {
+	.probe = emi_icc_probe,
+	.remove = emi_icc_remove,
+	.driver = {
+		.name = "mediatek-emi-icc",
+	},
+};
+
+static int __init mtk_emi_icc_init(void)
+{
+	return platform_driver_register(&emi_icc_driver);
+}
+subsys_initcall(mtk_emi_icc_init);
+
+static void __exit mtk_emi_icc_exit(void)
+{
+	platform_driver_unregister(&emi_icc_driver);
+}
+module_exit(mtk_emi_icc_exit);
+
+MODULE_AUTHOR("Henry Chen <henryc.chen@mediatek.com>");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
