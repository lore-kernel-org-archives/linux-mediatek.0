Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D82C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eeGL4AaoZIJRFHARMlU0IyUKs+mHN1KeN76FL64saU0=; b=RZmToMmy0yzhDPR3YbQHEJtI+S
	S5oOPBcLYuBPhV22usrDkXGE95VDniGTJWME9JcGTu5ZNYhMpFKjBHhB0635L+6ZrivgYo+VuS0uI
	EOJWJrdsNJ2eFXbDXCNxbdyR9BS04ynqBg1KHXwBSDPUBHOgy7+sMfK6YKDSQavW4Jdv6WCrH+UlQ
	NKYD470StqLakJz7E49VQHQnAQSsh1phS/P4GwreepXoZZa9sFgtYS8lHmqd78/3eEWWrmha+REjK
	iMTllOSJx52kBE8L6wxYDAOTluyHTcNBSx0nWiMVc3uoM36mqFclEsbgtajGhf+pCAMxh5PpmUdAO
	l8nXnhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1m42-001jFW-OG; Thu, 16 Jun 2022 09:45:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1m3q-001j7s-Kh; Thu, 16 Jun 2022 09:45:12 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9372B6601747;
	Thu, 16 Jun 2022 10:45:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655372707;
	bh=owOec3ENWoPb4iRlfY9RietfB+Qk2KOm5zhpCMG04tM=;
	h=From:To:Cc:Subject:Date:From;
	b=ovhB16DKYKkIROx3Rs3Scft0/Z5GkNFbwGsx9RTPm2lZh5bdYhzr373WXVzyG32kW
	 b8Ea5JBxyRApcIajSIkflDtr3XM2GtDN9shRpde39h9Tf2Al00Jk/A+4t8ILPg5Umv
	 aYplr1syjm2OS+MXdTQXdLAPupuIhcZ3RaBd0kFbRW6ujtGeo4BYSXaf+sU+YocR4M
	 iBMSs3SJNY7b7cm4td5YYnFnfqbZshl7Auc11l/diCfuBF9RMHQ0KmwMDIUxgAujFM
	 CVCOrkg2pcVwuQ/F8jPSpLXi3sHkkiKkD3VWSbL9Mp9rVTw3be8KO+kBpgJYXwFlYG
	 UyFYWx8XfMxfA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	alyssa.rosenzweig@collabora.com,
	nfraprado@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] soc: mediatek: Introduce mediatek-regulator-coupler driver
Date: Thu, 16 Jun 2022 11:45:02 +0200
Message-Id: <20220616094502.15318-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_024511_071068_D12C20AE 
X-CRM114-Status: GOOD (  26.54  )
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

This driver currently deals with GPU-SRAM regulator coupling, ensuring
that the SRAM voltage is always between a specific range of distance to
the GPU voltage, depending on the SoC, necessary in order to achieve
system stability across the full range of supported GPU frequencies.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Context:
This driver is one of the pieces of a bigger puzzle, aiming to finally
enable Dynamic Voltage/Frequency Scaling for Mali GPUs found on MediaTek
SoCs on the fully open source graphics stack (Panfrost driver).

No devicetree bindings are provided because this does not require any
driver-specific binding at all.

Last but not least: it was chosen to have this driver enabled for
( ARCH_MEDIATEK && REGULATOR ) without really giving a free configuration
choice because, once the DVFS mechanism will be fully working, using one
of the listed MediaTek SoCs *without* this coupling mechanism *will* lead
to unstabilities and system crashes.
For COMPILE_TEST, choice is given for obvious reasons.

 drivers/soc/mediatek/Kconfig                 |   5 +
 drivers/soc/mediatek/Makefile                |   1 +
 drivers/soc/mediatek/mtk-regulator-coupler.c | 148 +++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-regulator-coupler.c

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index fdd8bc08569e..b0d9bc2b98fc 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -43,6 +43,11 @@ config MTK_PMIC_WRAP
 	  on different MediaTek SoCs. The PMIC wrapper is a proprietary
 	  hardware to connect the PMIC.
 
+config MTK_REGULATOR_COUPLER
+	bool "MediaTek SoC Regulator Coupler" if COMPILE_TEST
+	default ARCH_MEDIATEK
+	depends on REGULATOR
+
 config MTK_SCPSYS
 	bool "MediaTek SCPSYS Support"
 	default ARCH_MEDIATEK
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 90270f8114ed..7f9114aba0b5 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
 obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
 obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
 obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
+obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
 obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
 obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
new file mode 100644
index 000000000000..241d60e74a6e
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Voltage regulators coupler for MediaTek SoCs
+ *
+ * Copyright (C) 2022 Collabora, Ltd.
+ * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/regulator/coupler.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/suspend.h>
+
+#define to_mediatek_coupler(x)	container_of(x, struct mediatek_regulator_coupler, coupler)
+
+struct mediatek_regulator_coupler {
+	struct regulator_coupler coupler;
+	struct regulator_dev *vsram_rdev;
+};
+
+/*
+ * We currently support only couples of not more than two vregs and
+ * modify the vsram voltage only when changing voltage of vgpu.
+ *
+ * This function is limited to the GPU<->SRAM voltages relationships.
+ */
+static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
+					      struct regulator_dev *rdev,
+					      suspend_state_t state)
+{
+	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
+	int max_spread = rdev->constraints->max_spread[0];
+	int vsram_min_uV = mrc->vsram_rdev->constraints->min_uV;
+	int vsram_max_uV = mrc->vsram_rdev->constraints->max_uV;
+	int vsram_target_min_uV, vsram_target_max_uV;
+	int min_uV = 0;
+	int max_uV = INT_MAX;
+	int ret;
+
+	/*
+	 * If the target device is on, setting the SRAM voltage directly
+	 * is not supported as it scales through its coupled supply voltage.
+	 *
+	 * An exception is made in case the use_count is zero: this means
+	 * that this is the first time we power up the SRAM regulator, which
+	 * implies that the target device has yet to perform initialization
+	 * and setting a voltage at that time is harmless.
+	 */
+	if (rdev == mrc->vsram_rdev) {
+		if (rdev->use_count == 0)
+			return regulator_do_balance_voltage(rdev, state, true);
+
+		return -EPERM;
+	}
+
+	ret = regulator_check_consumers(rdev, &min_uV, &max_uV, state);
+	if (ret < 0)
+		return ret;
+
+	if (min_uV == 0) {
+		ret = regulator_get_voltage_rdev(rdev);
+		if (ret < 0)
+			return ret;
+		min_uV = ret;
+	}
+
+	ret = regulator_check_voltage(rdev, &min_uV, &max_uV);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * If we're asked to set a voltage less than VSRAM min_uV, set
+	 * the minimum allowed voltage on VSRAM, as in this case it is
+	 * safe to ignore the max_spread parameter.
+	 */
+	vsram_target_min_uV = max(vsram_min_uV, min_uV + max_spread);
+	vsram_target_max_uV = min(vsram_max_uV, vsram_target_min_uV + max_spread);
+
+	/* Make sure we're not out of range */
+	vsram_target_min_uV = min(vsram_target_min_uV, vsram_max_uV);
+
+	pr_debug("Setting voltage %d-%duV on %s (minuV %d)\n",
+		 vsram_target_min_uV, vsram_target_max_uV,
+		 rdev_get_name(mrc->vsram_rdev), min_uV);
+
+	ret = regulator_set_voltage_rdev(mrc->vsram_rdev, vsram_target_min_uV,
+					 vsram_target_max_uV, state);
+	if (ret)
+		return ret;
+
+	/* The sram voltage is now balanced: update the target vreg voltage */
+	return regulator_do_balance_voltage(rdev, state, true);
+}
+
+static int mediatek_regulator_attach(struct regulator_coupler *coupler,
+				     struct regulator_dev *rdev)
+{
+	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
+	const char *rdev_name = rdev_get_name(rdev);
+
+	if (strstr(rdev_name, "sram")) {
+		if (mrc->vsram_rdev)
+			return -EINVAL;
+		mrc->vsram_rdev = rdev;
+	}
+
+	return 0;
+}
+
+static int mediatek_regulator_detach(struct regulator_coupler *coupler,
+				     struct regulator_dev *rdev)
+{
+	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
+
+	if (rdev == mrc->vsram_rdev) {
+		mrc->vsram_rdev = NULL;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static struct mediatek_regulator_coupler mediatek_coupler = {
+	.coupler = {
+		.attach_regulator = mediatek_regulator_attach,
+		.detach_regulator = mediatek_regulator_detach,
+		.balance_voltage = mediatek_regulator_balance_voltage,
+	},
+};
+
+static int mediatek_regulator_coupler_init(void)
+{
+	if (!of_machine_is_compatible("mediatek,mt8183") &&
+	    !of_machine_is_compatible("mediatek,mt8186") &&
+	    !of_machine_is_compatible("mediatek,mt8192"))
+		return 0;
+
+	return regulator_coupler_register(&mediatek_coupler.coupler);
+}
+arch_initcall(mediatek_regulator_coupler_init);
+
+MODULE_DESCRIPTION("MediaTek Regulator Coupler driver");
+MODULE_LICENSE("GPL");
-- 
2.35.1


