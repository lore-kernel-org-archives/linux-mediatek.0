Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2ADC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:19:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0CD222AAC
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:19:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0CD222AAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J2PPYDogOOX0vZiE5yTuNDOKqjoBOsmv6/C629dX1B0=; b=gBTjGohVdg8DP5/qfeTrkDpr1
	I7PCsfyTkfmRO32oWsv9TANdFFe+Ty0WXzfUImF/05DqXtNDIhnsVpMUJvsvCpR1k1ZkGMFT8EpWX
	J00PYxJvdV8HLPtuWfW7rMP0qfeQfeC0J81WV/PgbONw6jpAs6rMJWE9H54MTiL43OoDF98oPW8sA
	p22pbsGasRb1wtxgsAy4qxFkIi3HPjXZ5ZFdZKtKZ12R6nUbWjqRZAa7Arvi+7NGm5slxgfiGp6N3
	VtEEaposgGLBOsiA4QyofEkToCE/IwqH5oQepvvPdWLs0aIu88gyjI3ZZjRoCZtlC+V4fW1+FkAOh
	6LD36bmXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksJyM-00082y-Kl; Thu, 24 Dec 2020 06:19:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksJxp-0007hx-Ud; Thu, 24 Dec 2020 06:19:08 +0000
X-UUID: be8f1c4e312343a49aeff23f7a84bc28-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=/W25A8L2KRH020V3NsObSlRYgpkyVSWV7zCX6dIICuo=; 
 b=I46xLRodDYU7F8yQq0YeQcdTpIswJ0gbDcg/sO4+hHkyGKUbVOHFFgjVNK+ks4KIh9R1F6aX0/A89xbif3yHhETXh7xEltsRjclqUxv3snOB2fYfC/2/lJ9jEmTdapwlV2gU1L++OovVdBR/Q+WFE944pZFQvs3PNJXaVzG5Ekk=;
X-UUID: be8f1c4e312343a49aeff23f7a84bc28-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1783126027; Wed, 23 Dec 2020 22:19:01 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 22:08:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 14:08:56 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Dec 2020 14:08:58 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH V6 08/13] interconnect: mediatek: Add interconnect provider
 driver
Date: Thu, 24 Dec 2020 14:08:49 +0800
Message-ID: <1608790134-27425-9-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F85BFC41489E6CF72EF670B1C36A49F9C9769B14E2BAF3AA92D932ADF75682A92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_011906_236873_D0C5D3C6 
X-CRM114-Status: GOOD (  20.29  )
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
 drivers/interconnect/mediatek/mtk-emi.c | 330 ++++++++++++++++++++++++++++++++
 5 files changed, 348 insertions(+)
 create mode 100644 drivers/interconnect/mediatek/Kconfig
 create mode 100644 drivers/interconnect/mediatek/Makefile
 create mode 100644 drivers/interconnect/mediatek/mtk-emi.c

diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
index 5b7204e..e939f5a 100644
--- a/drivers/interconnect/Kconfig
+++ b/drivers/interconnect/Kconfig
@@ -13,5 +13,6 @@ if INTERCONNECT
 
 source "drivers/interconnect/imx/Kconfig"
 source "drivers/interconnect/qcom/Kconfig"
+source "drivers/interconnect/mediatek/Kconfig"
 
 endif
diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
index d203520..0643a24 100644
--- a/drivers/interconnect/Makefile
+++ b/drivers/interconnect/Makefile
@@ -6,3 +6,4 @@ icc-core-objs				:= core.o bulk.o
 obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
 obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
 obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
+obj-$(CONFIG_INTERCONNECT_MTK)		+= mediatek/
diff --git a/drivers/interconnect/mediatek/Kconfig b/drivers/interconnect/mediatek/Kconfig
new file mode 100644
index 0000000..972d3bb
--- /dev/null
+++ b/drivers/interconnect/mediatek/Kconfig
@@ -0,0 +1,13 @@
+config INTERCONNECT_MTK
+	bool "Mediatek Network-on-Chip interconnect drivers"
+	depends on ARCH_MEDIATEK
+	help
+	  Support for Mediatek's Network-on-Chip interconnect hardware.
+
+config INTERCONNECT_MTK_EMI
+	tristate "Mediatek EMI interconnect driver"
+	depends on INTERCONNECT_MTK
+	depends on (MTK_DVFSRC && OF)
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
index 0000000..9670077
--- /dev/null
+++ b/drivers/interconnect/mediatek/mtk-emi.c
@@ -0,0 +1,330 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ *
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk_dvfsrc.h>
+#include <dt-bindings/interconnect/mtk,mt8183-emi.h>
+#include <dt-bindings/interconnect/mtk,mt6873-emi.h>
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
