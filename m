Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23C8C04FF8
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9RiRkzvl6JHRrCFV1HXUUirmnOMZXW3NKG8QkJSsKQ=; b=encbHzUi27Ie+1fANhD311Fn4B
	svfU15NUUH108y5VGTzLbEWqd9/SYB9dnx25PCIpUsW23BoVFcU1+BSr5VDSqRo3Tm2nMmoArlUlI
	TWIsefS5iRko2L+4fq/mBarFubHRa4iF+r+t4vO6blJ/gcxY7Lst6LFkHepBmUfqhqgmYN+ciRiU6
	7v09mc7W0R0MWbAncmv2bIshmB6HIz96luSRo2CQrg58rjKquA62URKT/qptznTSFzt0TZ0NDGhgy
	yi7CNMGOT8Y1AFBiK5wk7J8ol6GT+aeV2jV920D+O/FXT3HuKoi239d3ZYV2LmIAJz+p3ysHzuh1W
	cqs25f3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOIA-00000001fnW-3brJ;
	Thu, 18 Apr 2024 09:42:54 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOH7-00000001fA4-18kk;
	Thu, 18 Apr 2024 09:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713433308;
	bh=kHK683RtoyRF7nZWSIYwGwjmNGONAkN+rHwluYAbqCU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wPuQovGIYsvOm4oivffv6A6FD912DkVMTUwQLkBuVYNLxYrkP+fvUhlFIkjiNs6no
	 Cxkb6btQCng11/06GOO59gfSsBC8jwgd1jWpPW696AkK9W2RqFAVXUDbV6zpQklS4D
	 NjVO9bpgEhuhqRXPPz9Q5zqRhhGZlsug1buPet3uxqH3z4hjjuiJpKDJ2BuPnZvlWY
	 swwFoWGfgDWg6hFRI9TWdmvdITtr0gklsEPituD+5JruhPw66V+AualaPte03sMbwB
	 OLf5st6y1XItXCgxv07VrwY11GLzpJT2dyRmvn7qFI/VPhNHBY7zw/dn4DWiZ91NEr
	 AdxBkZGHTGoHg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A0D33782146;
	Thu, 18 Apr 2024 09:41:46 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: djakov@kernel.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	keescook@chromium.org,
	gustavoars@kernel.org,
	henryc.chen@mediatek.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	amergnat@baylibre.com
Subject: [PATCH v4 7/7] interconnect: mediatek: Add MediaTek MT8183/8195 EMI Interconnect driver
Date: Thu, 18 Apr 2024 11:41:34 +0200
Message-ID: <20240418094134.203330-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
References: <20240418094134.203330-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_024150_151508_A1EDF563 
X-CRM114-Status: GOOD (  23.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add an interconnect driver for the External Memory Interface (EMI),
voting for bus bandwidth over the Dynamic Voltage and Frequency Scaling
Resource Collector (DVFSRC).

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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/interconnect/Kconfig            |   1 +
 drivers/interconnect/Makefile           |   1 +
 drivers/interconnect/mediatek/Kconfig   |  32 +++
 drivers/interconnect/mediatek/Makefile  |   5 +
 drivers/interconnect/mediatek/icc-emi.c | 153 +++++++++++
 drivers/interconnect/mediatek/icc-emi.h |  40 +++
 drivers/interconnect/mediatek/mt8183.c  | 143 ++++++++++
 drivers/interconnect/mediatek/mt8195.c  | 339 ++++++++++++++++++++++++
 8 files changed, 714 insertions(+)
 create mode 100644 drivers/interconnect/mediatek/Kconfig
 create mode 100644 drivers/interconnect/mediatek/Makefile
 create mode 100644 drivers/interconnect/mediatek/icc-emi.c
 create mode 100644 drivers/interconnect/mediatek/icc-emi.h
 create mode 100644 drivers/interconnect/mediatek/mt8183.c
 create mode 100644 drivers/interconnect/mediatek/mt8195.c

diff --git a/drivers/interconnect/Kconfig b/drivers/interconnect/Kconfig
index 5faa8d2aecff..f2e49bd97d31 100644
--- a/drivers/interconnect/Kconfig
+++ b/drivers/interconnect/Kconfig
@@ -12,6 +12,7 @@ menuconfig INTERCONNECT
 if INTERCONNECT
 
 source "drivers/interconnect/imx/Kconfig"
+source "drivers/interconnect/mediatek/Kconfig"
 source "drivers/interconnect/qcom/Kconfig"
 source "drivers/interconnect/samsung/Kconfig"
 
diff --git a/drivers/interconnect/Makefile b/drivers/interconnect/Makefile
index d0888babb9a1..b0a9a6753b9d 100644
--- a/drivers/interconnect/Makefile
+++ b/drivers/interconnect/Makefile
@@ -5,6 +5,7 @@ icc-core-objs				:= core.o bulk.o debugfs-client.o
 
 obj-$(CONFIG_INTERCONNECT)		+= icc-core.o
 obj-$(CONFIG_INTERCONNECT_IMX)		+= imx/
+obj-$(CONFIG_INTERCONNECT_MTK)		+= mediatek/
 obj-$(CONFIG_INTERCONNECT_QCOM)		+= qcom/
 obj-$(CONFIG_INTERCONNECT_SAMSUNG)	+= samsung/
 
diff --git a/drivers/interconnect/mediatek/Kconfig b/drivers/interconnect/mediatek/Kconfig
new file mode 100644
index 000000000000..6da70d904b8c
--- /dev/null
+++ b/drivers/interconnect/mediatek/Kconfig
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config INTERCONNECT_MTK
+	bool "MediaTek interconnect drivers"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Support for MediaTek's bus interconnect hardware.
+
+config INTERCONNECT_MTK_DVFSRC_EMI
+	tristate "MediaTek DVFSRC EMI interconnect driver"
+	depends on INTERCONNECT_MTK
+	depends on MTK_DVFSRC || COMPILE_TEST
+	help
+	  This is a driver for the MediaTek External Memory Interface
+	  interconnect on SoCs equipped with the integrated Dynamic
+	  Voltage Frequency Scaling Resource Collector (DVFSRC) MCU
+
+config INTERCONNECT_MTK_MT8183
+	tristate "MediaTek MT8183 interconnect driver"
+	depends on INTERCONNECT_MTK
+	select INTERCONNECT_MTK_DVFSRC_EMI
+	help
+	  This is a driver for the MediaTek bus interconnect on MT8183-based
+	  platforms.
+
+config INTERCONNECT_MTK_MT8195
+	tristate "MediaTek MT8195 interconnect driver"
+	depends on INTERCONNECT_MTK
+	select INTERCONNECT_MTK_DVFSRC_EMI
+	help
+	  This is a driver for the MediaTek bus interconnect on MT8195-based
+	  platforms.
diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
new file mode 100644
index 000000000000..8e2283a9a5b5
--- /dev/null
+++ b/drivers/interconnect/mediatek/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
diff --git a/drivers/interconnect/mediatek/icc-emi.c b/drivers/interconnect/mediatek/icc-emi.c
new file mode 100644
index 000000000000..d420c55682d0
--- /dev/null
+++ b/drivers/interconnect/mediatek/icc-emi.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek External Memory Interface (EMI) Interconnect driver
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/dvfsrc.h>
+
+#include "icc-emi.h"
+
+static int mtk_emi_icc_aggregate(struct icc_node *node, u32 tag, u32 avg_bw,
+				 u32 peak_bw, u32 *agg_avg, u32 *agg_peak)
+{
+	struct mtk_icc_node *in = node->data;
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
+static int mtk_emi_icc_set(struct icc_node *src, struct icc_node *dst)
+{
+	struct mtk_icc_node *node = dst->data;
+	struct device *dev;
+	int ret;
+
+	if (unlikely(!src->provider))
+		return -EINVAL;
+
+	dev = src->provider->dev;
+
+	switch (node->ep) {
+	case 0:
+		break;
+	case 1:
+		ret = mtk_dvfsrc_send_request(dev, MTK_DVFSRC_CMD_PEAK_BW, node->max_peak);
+		if (ret) {
+			dev_err(dev, "Cannot send peak bw request: %d\n", ret);
+			return ret;
+		}
+
+		ret = mtk_dvfsrc_send_request(dev, MTK_DVFSRC_CMD_BW, node->sum_avg);
+		if (ret) {
+			dev_err(dev, "Cannot send bw request: %d\n", ret);
+			return ret;
+		}
+		break;
+	case 2:
+		ret = mtk_dvfsrc_send_request(dev, MTK_DVFSRC_CMD_HRT_BW, node->sum_avg);
+		if (ret) {
+			dev_err(dev, "Cannot send HRT bw request: %d\n", ret);
+			return ret;
+		}
+		break;
+	default:
+		dev_err(src->provider->dev, "Unknown endpoint %u\n", node->ep);
+		return -EINVAL;
+	};
+
+	return 0;
+}
+
+int mtk_emi_icc_probe(struct platform_device *pdev)
+{
+	const struct mtk_icc_desc *desc;
+	struct device *dev = &pdev->dev;
+	struct icc_node *node;
+	struct icc_onecell_data *data;
+	struct icc_provider *provider;
+	struct mtk_icc_node **mnodes;
+	int i, j, ret;
+
+	desc = of_device_get_match_data(dev);
+	if (!desc)
+		return -EINVAL;
+
+	mnodes = desc->nodes;
+
+	provider = devm_kzalloc(dev, sizeof(*provider), GFP_KERNEL);
+	if (!provider)
+		return -ENOMEM;
+
+	data = devm_kzalloc(dev, struct_size(data, nodes, desc->num_nodes), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	provider->dev = pdev->dev.parent;
+	provider->set = mtk_emi_icc_set;
+	provider->aggregate = mtk_emi_icc_aggregate;
+	provider->xlate = of_icc_xlate_onecell;
+	INIT_LIST_HEAD(&provider->nodes);
+	provider->data = data;
+
+	for (i = 0; i < desc->num_nodes; i++) {
+		if (!mnodes[i])
+			continue;
+
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
+	data->num_nodes = desc->num_nodes;
+
+	ret = icc_provider_register(provider);
+	if (ret)
+		goto err;
+
+	platform_set_drvdata(pdev, provider);
+
+	return 0;
+err:
+	icc_nodes_remove(provider);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(mtk_emi_icc_probe);
+
+void mtk_emi_icc_remove(struct platform_device *pdev)
+{
+	struct icc_provider *provider = platform_get_drvdata(pdev);
+
+	icc_provider_deregister(provider);
+	icc_nodes_remove(provider);
+}
+EXPORT_SYMBOL_GPL(mtk_emi_icc_remove);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_AUTHOR("Henry Chen <henryc.chen@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek External Memory Interface interconnect driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/interconnect/mediatek/icc-emi.h b/drivers/interconnect/mediatek/icc-emi.h
new file mode 100644
index 000000000000..9512a50db6fa
--- /dev/null
+++ b/drivers/interconnect/mediatek/icc-emi.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#ifndef __DRIVERS_INTERCONNECT_MEDIATEK_ICC_EMI_H
+#define __DRIVERS_INTERCONNECT_MEDIATEK_ICC_EMI_H
+
+/**
+ * struct mtk_icc_node - Mediatek EMI Interconnect Node
+ * @name:      The interconnect node name which is shown in debugfs
+ * @ep:        Type of this endpoint
+ * @id:        Unique node identifier
+ * @sum_avg:   Current sum aggregate value of all average bw requests in kBps
+ * @max_peak:  Current max aggregate value of all peak bw requests in kBps
+ * @num_links: The total number of @links
+ * @links:     Array of @id linked to this node
+ */
+struct mtk_icc_node {
+	unsigned char *name;
+	int ep;
+	u16 id;
+	u64 sum_avg;
+	u64 max_peak;
+
+	u16 num_links;
+	u16 links[] __counted_by(num_links);
+};
+
+struct mtk_icc_desc {
+	struct mtk_icc_node **nodes;
+	size_t num_nodes;
+};
+
+int mtk_emi_icc_probe(struct platform_device *pdev);
+void mtk_emi_icc_remove(struct platform_device *pdev);
+
+#endif /* __DRIVERS_INTERCONNECT_MEDIATEK_ICC_EMI_H */
diff --git a/drivers/interconnect/mediatek/mt8183.c b/drivers/interconnect/mediatek/mt8183.c
new file mode 100644
index 000000000000..eb98b7f821a1
--- /dev/null
+++ b/drivers/interconnect/mediatek/mt8183.c
@@ -0,0 +1,143 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/interconnect/mediatek,mt8183.h>
+
+#include "icc-emi.h"
+
+static struct mtk_icc_node ddr_emi = {
+	.name = "ddr-emi",
+	.id = SLAVE_DDR_EMI,
+	.ep = 1,
+};
+
+static struct mtk_icc_node mcusys = {
+	.name = "mcusys",
+	.id = MASTER_MCUSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node gpu = {
+	.name = "gpu",
+	.id = MASTER_MFG,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mmsys = {
+	.name = "mmsys",
+	.id = MASTER_MMSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mm_vpu = {
+	.name = "mm-vpu",
+	.id = MASTER_MM_VPU,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_disp = {
+	.name = "mm-disp",
+	.id = MASTER_MM_DISP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_vdec = {
+	.name = "mm-vdec",
+	.id = MASTER_MM_VDEC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_venc = {
+	.name = "mm-venc",
+	.id = MASTER_MM_VENC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_cam = {
+	.name = "mm-cam",
+	.id = MASTER_MM_CAM,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_img = {
+	.name = "mm-img",
+	.id = MASTER_MM_IMG,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_mdp = {
+	.name = "mm-mdp",
+	.id = MASTER_MM_MDP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node *mt8183_emi_icc_nodes[] = {
+	[SLAVE_DDR_EMI] = &ddr_emi,
+	[MASTER_MCUSYS] = &mcusys,
+	[MASTER_MFG] = &gpu,
+	[MASTER_MMSYS] = &mmsys,
+	[MASTER_MM_VPU] = &mm_vpu,
+	[MASTER_MM_DISP] = &mm_disp,
+	[MASTER_MM_VDEC] = &mm_vdec,
+	[MASTER_MM_VENC] = &mm_venc,
+	[MASTER_MM_CAM] = &mm_cam,
+	[MASTER_MM_IMG] = &mm_img,
+	[MASTER_MM_MDP] = &mm_mdp
+};
+
+static const struct mtk_icc_desc mt8183_emi_icc = {
+	.nodes = mt8183_emi_icc_nodes,
+	.num_nodes = ARRAY_SIZE(mt8183_emi_icc_nodes),
+};
+
+static const struct of_device_id mtk_mt8183_emi_icc_of_match[] = {
+	{ .compatible = "mediatek,mt8183-emi", .data = &mt8183_emi_icc },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mtk_emi_icc_of_match);
+
+static struct platform_driver mtk_emi_icc_mt8183_driver = {
+	.driver = {
+		.name = "emi-icc-mt8183",
+		.of_match_table = mtk_mt8183_emi_icc_of_match,
+		.sync_state = icc_sync_state,
+	},
+	.probe = mtk_emi_icc_probe,
+	.remove_new = mtk_emi_icc_remove,
+
+};
+module_platform_driver(mtk_emi_icc_mt8183_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT8183 EMI ICC driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/interconnect/mediatek/mt8195.c b/drivers/interconnect/mediatek/mt8195.c
new file mode 100644
index 000000000000..e782c5974e50
--- /dev/null
+++ b/drivers/interconnect/mediatek/mt8195.c
@@ -0,0 +1,339 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/device.h>
+#include <linux/interconnect.h>
+#include <linux/interconnect-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/interconnect/mediatek,mt8195.h>
+
+#include "icc-emi.h"
+
+static struct mtk_icc_node ddr_emi = {
+	.name = "ddr-emi",
+	.id = SLAVE_DDR_EMI,
+	.ep = 1,
+};
+
+static struct mtk_icc_node mcusys = {
+	.name = "mcusys",
+	.id = MASTER_MCUSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node gpu = {
+	.name = "gpu",
+	.id = MASTER_GPUSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mmsys = {
+	.name = "mmsys",
+	.id = MASTER_MMSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mm_vpu = {
+	.name = "mm-vpu",
+	.id = MASTER_MM_VPU,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_disp = {
+	.name = "mm-disp",
+	.id = MASTER_MM_DISP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_vdec = {
+	.name = "mm-vdec",
+	.id = MASTER_MM_VDEC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_venc = {
+	.name = "mm-venc",
+	.id = MASTER_MM_VENC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_cam = {
+	.name = "mm-cam",
+	.id = MASTER_MM_CAM,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_img = {
+	.name = "mm-img",
+	.id = MASTER_MM_IMG,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node mm_mdp = {
+	.name = "mm-mdp",
+	.id = MASTER_MM_MDP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MMSYS }
+};
+
+static struct mtk_icc_node vpusys = {
+	.name = "vpusys",
+	.id = MASTER_VPUSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node vpu_port0 = {
+	.name = "vpu-port0",
+	.id = MASTER_VPU_0,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_VPUSYS }
+};
+
+static struct mtk_icc_node vpu_port1 = {
+	.name = "vpu-port1",
+	.id = MASTER_VPU_1,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_VPUSYS }
+};
+
+static struct mtk_icc_node mdlasys = {
+	.name = "mdlasys",
+	.id = MASTER_MDLASYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node mdla_port0 = {
+	.name = "mdla-port0",
+	.id = MASTER_MDLA_0,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_MDLASYS }
+};
+
+static struct mtk_icc_node ufs = {
+	.name = "ufs",
+	.id = MASTER_UFS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node pcie0 = {
+	.name = "pcie0",
+	.id = MASTER_PCIE_0,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node pcie1 = {
+	.name = "pcie1",
+	.id = MASTER_PCIE_1,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node usb = {
+	.name = "usb",
+	.id = MASTER_USB,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node wifi = {
+	.name = "wifi",
+	.id = MASTER_WIFI,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node bt = {
+	.name = "bt",
+	.id = MASTER_BT,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node netsys = {
+	.name = "netsys",
+	.id = MASTER_NETSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node dbgif = {
+	.name = "dbgif",
+	.id = MASTER_DBGIF,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_DDR_EMI }
+};
+
+static struct mtk_icc_node hrt_ddr_emi = {
+	.name = "hrt-ddr-emi",
+	.id = SLAVE_HRT_DDR_EMI,
+	.ep = 2,
+};
+
+static struct mtk_icc_node hrt_mmsys = {
+	.name = "hrt-mmsys",
+	.id = MASTER_HRT_MMSYS,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_HRT_DDR_EMI }
+};
+
+static struct mtk_icc_node hrt_mm_disp = {
+	.name = "hrt-mm-disp",
+	.id = MASTER_HRT_MM_DISP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_vdec = {
+	.name = "hrt-mm-vdec",
+	.id = MASTER_HRT_MM_VDEC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_venc = {
+	.name = "hrt-mm-venc",
+	.id = MASTER_HRT_MM_VENC,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_cam = {
+	.name = "hrt-mm-cam",
+	.id = MASTER_HRT_MM_CAM,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_img = {
+	.name = "hrt-mm-img",
+	.id = MASTER_HRT_MM_IMG,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_mm_mdp = {
+	.name = "hrt-mm-mdp",
+	.id = MASTER_HRT_MM_MDP,
+	.ep = 0,
+	.num_links = 1,
+	.links = { MASTER_HRT_MMSYS }
+};
+
+static struct mtk_icc_node hrt_dbgif = {
+	.name = "hrt-dbgif",
+	.id = MASTER_HRT_DBGIF,
+	.ep = 0,
+	.num_links = 1,
+	.links = { SLAVE_HRT_DDR_EMI }
+};
+
+static struct mtk_icc_node *mt8195_emi_icc_nodes[] = {
+	[SLAVE_DDR_EMI] = &ddr_emi,
+	[MASTER_MCUSYS] = &mcusys,
+	[MASTER_GPUSYS] = &gpu,
+	[MASTER_MMSYS] = &mmsys,
+	[MASTER_MM_VPU] = &mm_vpu,
+	[MASTER_MM_DISP] = &mm_disp,
+	[MASTER_MM_VDEC] = &mm_vdec,
+	[MASTER_MM_VENC] = &mm_venc,
+	[MASTER_MM_CAM] = &mm_cam,
+	[MASTER_MM_IMG] = &mm_img,
+	[MASTER_MM_MDP] = &mm_mdp,
+	[MASTER_VPUSYS] = &vpusys,
+	[MASTER_VPU_0] = &vpu_port0,
+	[MASTER_VPU_1] = &vpu_port1,
+	[MASTER_MDLASYS] = &mdlasys,
+	[MASTER_MDLA_0] = &mdla_port0,
+	[MASTER_UFS] = &ufs,
+	[MASTER_PCIE_0] = &pcie0,
+	[MASTER_PCIE_1] = &pcie1,
+	[MASTER_USB] = &usb,
+	[MASTER_WIFI] = &wifi,
+	[MASTER_BT] = &bt,
+	[MASTER_NETSYS] = &netsys,
+	[MASTER_DBGIF] = &dbgif,
+	[SLAVE_HRT_DDR_EMI] = &hrt_ddr_emi,
+	[MASTER_HRT_MMSYS] = &hrt_mmsys,
+	[MASTER_HRT_MM_DISP] = &hrt_mm_disp,
+	[MASTER_HRT_MM_VDEC] = &hrt_mm_vdec,
+	[MASTER_HRT_MM_VENC] = &hrt_mm_venc,
+	[MASTER_HRT_MM_CAM] = &hrt_mm_cam,
+	[MASTER_HRT_MM_IMG] = &hrt_mm_img,
+	[MASTER_HRT_MM_MDP] = &hrt_mm_mdp,
+	[MASTER_HRT_DBGIF] = &hrt_dbgif
+};
+
+static struct mtk_icc_desc mt8195_emi_icc = {
+	.nodes = mt8195_emi_icc_nodes,
+	.num_nodes = ARRAY_SIZE(mt8195_emi_icc_nodes),
+};
+
+static const struct of_device_id mtk_mt8195_emi_icc_of_match[] = {
+	{ .compatible = "mediatek,mt8195-emi", .data = &mt8195_emi_icc },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mtk_emi_icc_of_match);
+
+static struct platform_driver mtk_emi_icc_mt8195_driver = {
+	.driver = {
+		.name = "emi-icc-mt8195",
+		.of_match_table = mtk_mt8195_emi_icc_of_match,
+		.sync_state = icc_sync_state,
+	},
+	.probe = mtk_emi_icc_probe,
+	.remove_new = mtk_emi_icc_remove,
+
+};
+module_platform_driver(mtk_emi_icc_mt8195_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek MT8195 EMI ICC driver");
+MODULE_LICENSE("GPL");
-- 
2.44.0


