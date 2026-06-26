Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421CFCDE008
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 07:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BPfH4ziyXcnVcGJzJOWgPB8ZUkTdtH8/f+gKsbOitWk=; b=N9DEssYh0ndpPShJG7KMF8ArEy
	1gGqnHA8Xy1WgYmKhR6GqNiS3qkFrYFC7QrUAQ+pEK4wnqIIFFOtdncNCaB+AA0XNl3olF8/f3lWt
	hhKQX04koG2WzTtdyYl09yQGSn34Ec9vvBo8YSyEUZIUdtPM/l4AoZIOxzsuNExEuWYEEWBUyyxx/
	6F3UFmIkq4emYJX9JdJ96GYn4A0D+p0SuRf6e82YZvG9nhzNTkk+ZkfKLxduQkqQdec2GVRcFc7VL
	QKB0IAMJyfcIJRMmp4Zy1/6I1DE/EswkqNGn7XiXOXBvVmYp7puO0c4U/nx02QdJkj5GJ0NB794Gy
	LQoJ27JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Ie-0000000AiTl-42r4;
	Fri, 26 Jun 2026 07:48:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Ic-0000000AiSc-22p4
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 07:48:31 +0000
X-UUID: 694e8094713311f1afed4741b24580c9-20260626
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BPfH4ziyXcnVcGJzJOWgPB8ZUkTdtH8/f+gKsbOitWk=;
	b=J7N+kuYdc32b3EFK+y2X8x88FwbahObd3Xb4meATg59DUi3SybBxPZvAQOtDMhH5n1AaEbmH+VL0DbLS5gebOIh4SgKP4BZBleEEyuUbUR/I8P6T7K+mGzoNuYqQK3a6Liv+gITlsxO1RQYu2qjK1ar5LJK0TcATQSEgCTcSuuk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:8e2c0944-c911-41c5-a1f6-b62e190f17ea,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:d497b38,CLOUDID:fe1f8fa5-9ef7-4489-861a-e83b251ece46,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|123|136|836|865|888|898,TC:-5,Conten
	t:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,O
	SI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 694e8094713311f1afed4741b24580c9-20260626
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 861619976; Fri, 26 Jun 2026 00:48:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 26 Jun 2026 15:48:22 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 26 Jun 2026 15:48:22 +0800
From: <peter.wang@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <p.zabel@pengutronix.de>, <robh@kernel.org>,
	<krzysztof.kozlowski@linaro.org>, <conor+dt@kernel.org>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<linux-devicetree@vger.kernel.org>, <peter.wang@mediatek.com>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<naomi.chu@mediatek.com>, <ed.tsai@mediatek.com>
Subject: [PATCH v1 2/2] reset: mediatek: add syscon-based reset controller driver
Date: Fri, 26 Jun 2026 15:46:09 +0800
Message-ID: <20260626074820.2537772-3-peter.wang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260626074820.2537772-1-peter.wang@mediatek.com>
References: <20260626074820.2537772-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004830_545400_D49C5D45 
X-CRM114-Status: GOOD (  31.40  )
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

From: Peter Wang <peter.wang@mediatek.com>

Add a new reset controller driver for MediaTek SoCs that expose reset
lines through memory-mapped registers managed by a syscon node.

The driver reads reset line configurations from the device tree property
"mediatek,reset-bits", which encodes each reset as a 5-tuple of:

  <assert_offset, assert_bit, deassert_offset, deassert_bit, delay_us>

This allows support for hardware designs that use separate set/clear
registers for assertion and deassertion. The regmap handle is obtained
from the parent syscon node, and the driver registers itself with the
kernel reset controller framework, providing assert, deassert, and reset
operations.

The per-line pulse width between assert and deassert is configured
via the 'delay_us' field in the 'mediatek,reset-bits' device tree
property. If set to zero, no delay is inserted.

Signed-off-by: Peter Wang <peter.wang@mediatek.com>
---
 drivers/reset/Kconfig                 |  10 ++
 drivers/reset/Makefile                |   1 +
 drivers/reset/reset-mediatek-syscon.c | 230 ++++++++++++++++++++++++++
 3 files changed, 241 insertions(+)
 create mode 100644 drivers/reset/reset-mediatek-syscon.c

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index d009eb0849a3..64586fa8bcd9 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -187,6 +187,16 @@ config RESET_MCHP_SPARX5
 	help
 	  This driver supports switch core reset for the Microchip Sparx5 SoC.
 
+config RESET_MEDIATEK_SYSCON
+	tristate "MediaTek Syscon Reset Driver"
+	depends on (ARCH_MEDIATEK || COMPILE_TEST) && HAS_IOMEM && OF
+	select MFD_SYSCON
+	help
+	  This enables reset driver support for MediaTek devices
+	  that use memory-mapped reset registers as part of a syscon
+	  device node. Say Y if you want to control reset signals
+	  provided by this controller. Otherwise, say N.
+
 config RESET_NPCM
 	bool "NPCM BMC Reset Driver" if COMPILE_TEST
 	default ARCH_NPCM
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 3e52569bd276..c0a7fdbe9768 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -27,6 +27,7 @@ obj-$(CONFIG_RESET_K230) += reset-k230.o
 obj-$(CONFIG_RESET_LANTIQ) += reset-lantiq.o
 obj-$(CONFIG_RESET_LPC18XX) += reset-lpc18xx.o
 obj-$(CONFIG_RESET_MCHP_SPARX5) += reset-microchip-sparx5.o
+obj-$(CONFIG_RESET_MEDIATEK_SYSCON) += reset-mediatek-syscon.o
 obj-$(CONFIG_RESET_NPCM) += reset-npcm.o
 obj-$(CONFIG_RESET_NUVOTON_MA35D1) += reset-ma35d1.o
 obj-$(CONFIG_RESET_PISTACHIO) += reset-pistachio.o
diff --git a/drivers/reset/reset-mediatek-syscon.c b/drivers/reset/reset-mediatek-syscon.c
new file mode 100644
index 000000000000..da8aa646cee7
--- /dev/null
+++ b/drivers/reset/reset-mediatek-syscon.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 MediaTek Inc.
+ * Authors:
+ *	Peter Wang <peter.wang@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+
+/* Must match the maximum value in mediatek,syscon-reset.yaml */
+#define MEDIATEK_SYSCON_RESET_MAX_DELAY_US	1000000 /* 1 second */
+
+/**
+ * struct mediatek_syscon_reset_control - The control for a single reset line.
+ *
+ * @assert_offset: Register offset from syscon base to assert the reset.
+ * @assert_bit: Bit index within the assert register to set for assertion.
+ * @deassert_offset: Register offset from syscon base to deassert the reset.
+ * @deassert_bit: Bit index within the deassert register to set for deassertion.
+ * @delay_us: Delay in microseconds between assertion and deassertion.
+ *            Zero means no delay is inserted.
+ */
+struct mediatek_syscon_reset_control {
+	unsigned int assert_offset;
+	unsigned int assert_bit;
+	unsigned int deassert_offset;
+	unsigned int deassert_bit;
+	unsigned int delay_us;
+};
+
+/**
+ * struct mediatek_syscon_reset_data - Private data for a MediaTek syscon
+ * reset controller.
+ *
+ * @rcdev: The embedded reset controller device, registered with the core.
+ * @regmap: The regmap handle for accessing hardware reset registers.
+ * @mrstc: Pointer to an array of reset line configurations
+ *         (struct mediatek_syscon_reset_control).
+ */
+struct mediatek_syscon_reset_data {
+	struct reset_controller_dev rcdev;
+	struct regmap *regmap;
+	struct mediatek_syscon_reset_control *mrstc;
+};
+
+/**
+ * mediatek_syscon_reset_assert() - Assert a specific reset line.
+ * @rcdev: The reset controller device.
+ * @id: The index of the reset line to assert.
+ *
+ * This function implements the .assert operation for the reset controller. It
+ * sets the specific assertion bit for the given reset ID by writing to the
+ * hardware register defined in the driver's configuration data.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int mediatek_syscon_reset_assert(struct reset_controller_dev *rcdev,
+					unsigned long id)
+{
+	struct mediatek_syscon_reset_data *data =
+		container_of(rcdev, struct mediatek_syscon_reset_data, rcdev);
+	struct mediatek_syscon_reset_control *rstc = &data->mrstc[id];
+	unsigned int val = BIT(rstc->assert_bit);
+
+	return regmap_write_bits(data->regmap, rstc->assert_offset, val, val);
+}
+
+/**
+ * mediatek_syscon_reset_deassert() - Deassert a specific reset line.
+ * @rcdev: The reset controller device.
+ * @id: The index of the reset line to deassert.
+ *
+ * Writes a '1' to the bit in the dedicated hardware deassert (clear) register
+ * for the given reset line. This assumes the hardware uses separate
+ * set-to-assert and set-to-deassert registers; @deassert_offset must point
+ * to the clear register, not the same register as @assert_offset.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int mediatek_syscon_reset_deassert(struct reset_controller_dev *rcdev,
+					  unsigned long id)
+{
+	struct mediatek_syscon_reset_data *data =
+		container_of(rcdev, struct mediatek_syscon_reset_data, rcdev);
+	struct mediatek_syscon_reset_control *rstc = &data->mrstc[id];
+	unsigned int val = BIT(rstc->deassert_bit);
+
+	return regmap_write_bits(data->regmap, rstc->deassert_offset, val, val);
+}
+
+/**
+ * mediatek_syscon_reset_reset() - Assert then deassert a reset line.
+ * @rcdev: The reset controller device.
+ * @id: The index of the reset line to reset.
+ *
+ * Performs a full reset cycle by asserting the reset line, waiting for the
+ * per-line hardware-required pulse width defined in the 'mediatek,reset-bits'
+ * device tree property, then deasserting it. If the pulse width is zero,
+ * no delay is inserted.
+ *
+ * Return: 0 on success, or a negative error code on failure.
+ */
+static int mediatek_syscon_reset_reset(struct reset_controller_dev *rcdev,
+				       unsigned long id)
+{
+	struct mediatek_syscon_reset_data *data =
+		container_of(rcdev, struct mediatek_syscon_reset_data, rcdev);
+	struct mediatek_syscon_reset_control *rstc = &data->mrstc[id];
+	int ret;
+
+	ret = mediatek_syscon_reset_assert(rcdev, id);
+	if (ret)
+		return ret;
+
+	if (rstc->delay_us)
+		fsleep(rstc->delay_us);
+
+	return mediatek_syscon_reset_deassert(rcdev, id);
+}
+
+static const struct reset_control_ops mediatek_syscon_reset_ops = {
+	.assert = mediatek_syscon_reset_assert,
+	.deassert = mediatek_syscon_reset_deassert,
+	.reset = mediatek_syscon_reset_reset,
+};
+
+static int mediatek_syscon_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mediatek_syscon_reset_control *mrstc;
+	struct mediatek_syscon_reset_data *data;
+	struct device_node *np = dev->of_node;
+	int nr_resets, i, count, idx, ret;
+	struct regmap *regmap;
+	u32 *arr;
+
+	if (!dev->parent) {
+		dev_err(dev, "missing parent device node\n");
+		return -EINVAL;
+	}
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	regmap = syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	count = of_property_count_u32_elems(np, "mediatek,reset-bits");
+	if (count <= 0) {
+		dev_err(dev, "failed to read mediatek,reset-bits property: %d\n", count);
+		return -EINVAL;
+	}
+	if (count % 5 != 0) {
+		dev_err(dev, "mediatek,reset-bits count (%d) must be a multiple of 5\n", count);
+		return -EINVAL;
+	}
+
+	nr_resets = count / 5;
+
+	arr = devm_kcalloc(dev, count, sizeof(u32), GFP_KERNEL);
+	if (!arr)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "mediatek,reset-bits", arr, count);
+	if (ret) {
+		dev_err(dev, "failed to read mediatek,reset-bits: %d\n", ret);
+		return ret;
+	}
+
+	mrstc = devm_kcalloc(dev, nr_resets, sizeof(*mrstc), GFP_KERNEL);
+	if (!mrstc)
+		return -ENOMEM;
+
+	for (i = 0; i < nr_resets; i++) {
+		idx = i * 5;
+		mrstc[i].assert_offset = arr[idx];
+		mrstc[i].assert_bit = arr[idx + 1];
+		mrstc[i].deassert_offset = arr[idx + 2];
+		mrstc[i].deassert_bit = arr[idx + 3];
+		mrstc[i].delay_us = arr[idx + 4];
+
+		if (mrstc[i].assert_bit >= 32 || mrstc[i].deassert_bit >= 32) {
+			dev_err(dev, "reset[%d]: bit index out of range\n", i);
+			return -EINVAL;
+		}
+
+		if (mrstc[i].delay_us > MEDIATEK_SYSCON_RESET_MAX_DELAY_US) {
+			dev_err(dev, "reset[%d]: delay %u us exceeds maximum %u us\n",
+				i, mrstc[i].delay_us,
+				MEDIATEK_SYSCON_RESET_MAX_DELAY_US);
+			return -EINVAL;
+		}
+	}
+
+	data->regmap = regmap;
+	data->mrstc = mrstc;
+	data->rcdev.ops = &mediatek_syscon_reset_ops;
+	data->rcdev.owner = THIS_MODULE;
+	data->rcdev.of_node = np;
+	data->rcdev.nr_resets = nr_resets;
+
+	return devm_reset_controller_register(dev, &data->rcdev);
+}
+
+static const struct of_device_id mediatek_syscon_reset_of_match[] = {
+	{ .compatible = "mediatek,syscon-reset" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mediatek_syscon_reset_of_match);
+
+static struct platform_driver mediatek_syscon_reset_driver = {
+	.probe = mediatek_syscon_reset_probe,
+	.driver = {
+		.name = "mediatek-syscon-reset",
+		.of_match_table = mediatek_syscon_reset_of_match,
+	},
+};
+module_platform_driver(mediatek_syscon_reset_driver);
+
+MODULE_AUTHOR("Peter Wang <peter.wang@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek SYSCON Regmap Reset Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.45.2


