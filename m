Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5637AC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 12:14:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E08A2204EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 12:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E08A2204EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/4fH7ne/gGXzSji+jAg7XFpDUwndyJCMpBuDG80dieU=; b=QO4ZobAzhh+pV280qNHZXEJjd
	BpILCYw1V3C6vSTcWIZbOz2Y5TKJnhMbtaVp5AclHuvBFG+sWz5Ktf2U+PHaSwGINWcwuurtKBv9n
	DYqHURXkQD4m2jTSP8av1bXFGnVir9RPDLGBLMWxVPTON2akKdn8Npt+x10zYJOhVZqIfb6fvpWJu
	7orsl3LiN7GyaxuiNq2Dke8WVjzQ6+jbF2Xk/+JUpmycVJWaSToGS5AASbKcsMPbDAg/fnzFrExoS
	y9br6Vm0N+2w0ag2dBdfty2A7Ryu1VQ/OlIyAPM+0dKhwx0AvLltQBP8vuYk6ll/l7z3UdUmp8DP4
	xdY9CYi1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks31r-0007B0-Dx; Wed, 23 Dec 2020 12:14:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks31f-00075o-MI; Wed, 23 Dec 2020 12:13:59 +0000
X-UUID: 868bce460a2d42f39c156686b0fce746-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=eefmxdX9uLRRAHjEdo1qIVRZmug8cpJcxwsUEfQzsRc=; 
 b=OUuJAg/g9UnUkG4qX/LC3E6ImYd116dWGo3Vg48LKTAU2a3paT9E0SXvx9139HTaEptkAcMRHmBokqWxpYTuVavDZk8U7D4hmYGEi+wuKwujqAd+Pjo/SqLw/o1Ap0WFzJHH8lN8sZU/prw39TKUeeEE1yjQ/1rIaXGOB/x0pTA=;
X-UUID: 868bce460a2d42f39c156686b0fce746-20201223
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1278847355; Wed, 23 Dec 2020 04:13:50 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 04:13:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 20:13:45 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Dec 2020 20:13:45 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 <drinkcat@chromium.org>
Subject: [PATCH v3 2/3] regulator: mt6315: Add support for MT6315 regulator
Date: Wed, 23 Dec 2020 20:13:43 +0800
Message-ID: <1608725624-30594-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1608725624-30594-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608725624-30594-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_071356_232194_A72DA066 
X-CRM114-Status: GOOD (  27.44  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT6315 is a regulator found on boards based on MediaTek MT8192 and
probably other SoCs. It connects as a slave to SoC using SPMI.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/regulator/Kconfig                  |  10 +
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/mt6315-regulator.c       | 298 +++++++++++++++++++++
 include/linux/regulator/mt6315-regulator.h |  45 ++++
 4 files changed, 354 insertions(+)
 create mode 100644 drivers/regulator/mt6315-regulator.c
 create mode 100644 include/linux/regulator/mt6315-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 020a00d6696b..65612ba2734f 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -703,6 +703,16 @@ config REGULATOR_MT6311
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6315
+	tristate "MediaTek MT6315 PMIC"
+	depends on SPMI
+	select REGMAP_SPMI
+	help
+	  Say y here to select this option to enable the power regulator of
+	  MediaTek MT6315 PMIC.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6323
 	tristate "MediaTek MT6323 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6ebae516258e..b2f47dd67112 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -87,6 +87,7 @@ obj-$(CONFIG_REGULATOR_MP8859) += mp8859.o
 obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
+obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6358)	+= mt6358-regulator.o
 obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
new file mode 100644
index 000000000000..57ef628d48b4
--- /dev/null
+++ b/drivers/regulator/mt6315-regulator.c
@@ -0,0 +1,298 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 MediaTek Inc.
+
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/mt6315-regulator.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/spmi.h>
+
+#define MT6315_REG_WIDTH	8
+
+#define MT6315_BUCK_MODE_AUTO		0
+#define MT6315_BUCK_MODE_FORCE_PWM	1
+#define MT6315_BUCK_MODE_LP		2
+
+struct mt6315_regulator_info {
+	struct regulator_desc desc;
+	u32 status_reg;
+	u32 lp_mode_mask;
+	u32 lp_mode_shift;
+};
+
+struct mt_regulator_init_data {
+	u32 slvid;
+	u32 modeset_mask[MT6315_VBUCK_MAX];
+};
+
+struct mt6315_chip {
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+#define MT_BUCK(_name, _bid, _vsel)				\
+[_bid] = {							\
+	.desc = {						\
+		.name = _name,					\
+		.of_match = of_match_ptr(_name),		\
+		.regulators_node = "regulators",		\
+		.ops = &mt6315_volt_range_ops,			\
+		.type = REGULATOR_VOLTAGE,			\
+		.id = _bid,					\
+		.owner = THIS_MODULE,				\
+		.n_voltages = 0xbf,				\
+		.linear_ranges = mt_volt_range1,		\
+		.n_linear_ranges = ARRAY_SIZE(mt_volt_range1),	\
+		.vsel_reg = _vsel,				\
+		.vsel_mask = 0xff,				\
+		.enable_reg = MT6315_BUCK_TOP_CON0,		\
+		.enable_mask = BIT(_bid),			\
+		.of_map_mode = mt6315_map_mode,			\
+	},							\
+	.status_reg = _bid##_DBG4,					\
+	.lp_mode_mask = BIT(_bid),				\
+	.lp_mode_shift = _bid,				\
+}
+
+static const struct linear_range mt_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(0, 0, 0xbf, 6250),
+};
+
+static unsigned int mt6315_map_mode(u32 mode)
+{
+	switch (mode) {
+	case MT6315_BUCK_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	case MT6315_BUCK_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	case MT6315_BUCK_MODE_LP:
+		return REGULATOR_MODE_IDLE;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned int mt6315_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct mt_regulator_init_data *init = rdev_get_drvdata(rdev);
+	const struct mt6315_regulator_info *info = (struct mt6315_regulator_info *)rdev->desc;
+	int ret, regval;
+	u32 modeset_mask;
+
+	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
+	ret = regmap_read(rdev->regmap, MT6315_BUCK_TOP_4PHASE_ANA_CON42, &regval);
+	if (ret != 0) {
+		dev_notice(&rdev->dev, "Failed to get mode: %d\n", ret);
+		return ret;
+	}
+
+	if ((regval & modeset_mask) == modeset_mask)
+		return REGULATOR_MODE_FAST;
+
+	ret = regmap_read(rdev->regmap, MT6315_BUCK_TOP_CON1, &regval);
+	if (ret != 0) {
+		dev_notice(&rdev->dev, "Failed to get lp mode: %d\n", ret);
+		return ret;
+	}
+
+	if (regval & info->lp_mode_mask)
+		return REGULATOR_MODE_IDLE;
+	else
+		return REGULATOR_MODE_NORMAL;
+}
+
+static int mt6315_regulator_set_mode(struct regulator_dev *rdev,
+				     u32 mode)
+{
+	struct mt_regulator_init_data *init = rdev_get_drvdata(rdev);
+	const struct mt6315_regulator_info *info = (struct mt6315_regulator_info *)rdev->desc;
+	int ret, val, curr_mode;
+	u32 modeset_mask;
+
+	modeset_mask = init->modeset_mask[rdev_get_id(rdev)];
+	curr_mode = mt6315_regulator_get_mode(rdev);
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		ret = regmap_update_bits(rdev->regmap,
+					 MT6315_BUCK_TOP_4PHASE_ANA_CON42,
+					 modeset_mask,
+					 modeset_mask);
+		break;
+	case REGULATOR_MODE_NORMAL:
+		if (curr_mode == REGULATOR_MODE_FAST) {
+			ret = regmap_update_bits(rdev->regmap,
+						 MT6315_BUCK_TOP_4PHASE_ANA_CON42,
+						 modeset_mask,
+						 0);
+		} else if (curr_mode == REGULATOR_MODE_IDLE) {
+			ret = regmap_update_bits(rdev->regmap,
+						 MT6315_BUCK_TOP_CON1,
+						 info->lp_mode_mask,
+						 0);
+			usleep_range(100, 110);
+		}
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = MT6315_BUCK_MODE_LP >> 1;
+		val <<= info->lp_mode_shift;
+		ret = regmap_update_bits(rdev->regmap,
+					 MT6315_BUCK_TOP_CON1,
+					 info->lp_mode_mask,
+					 val);
+		break;
+	default:
+		ret = -EINVAL;
+		dev_notice(&rdev->dev, "Not support (%d)\n", mode);
+		break;
+	}
+
+	if (ret != 0) {
+		dev_notice(&rdev->dev, "Failed to set mode: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt6315_get_status(struct regulator_dev *rdev)
+{
+	const struct mt6315_regulator_info *info = (struct mt6315_regulator_info *)rdev->desc;
+	int ret;
+	u32 regval;
+
+	ret = regmap_read(rdev->regmap, info->status_reg, &regval);
+	if (ret < 0) {
+		dev_notice(&rdev->dev, "Failed to get enable reg: %d\n", ret);
+		return ret;
+	}
+
+	return (regval & BIT(0)) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static const struct regulator_ops mt6315_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6315_get_status,
+	.set_mode = mt6315_regulator_set_mode,
+	.get_mode = mt6315_regulator_get_mode,
+};
+
+static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
+	MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
+	MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
+	MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
+	MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
+};
+
+static const struct regmap_config mt6315_regmap_config = {
+	.reg_bits	= 16,
+	.val_bits	= 8,
+	.max_register	= 0x16d0,
+	.fast_io	= true,
+};
+
+static const struct of_device_id mt6315_of_match[] = {
+	{
+		.compatible = "mediatek,mt6315-regulator",
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, mt6315_of_match);
+
+static int mt6315_regulator_probe(struct spmi_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	struct mt6315_chip *chip;
+	struct mt_regulator_init_data *init_data;
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	int i;
+
+	regmap = devm_regmap_init_spmi_ext(pdev, &mt6315_regmap_config);
+	if (!regmap)
+		return -ENODEV;
+
+	chip = devm_kzalloc(dev, sizeof(struct mt6315_chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	init_data = devm_kzalloc(dev, sizeof(struct mt_regulator_init_data), GFP_KERNEL);
+	if (!init_data)
+		return -ENOMEM;
+
+	chip->dev = dev;
+	chip->regmap = regmap;
+	dev_set_drvdata(dev, chip);
+
+	config.dev = dev;
+	config.regmap = regmap;
+	for (i = MT6315_VBUCK1; i < MT6315_VBUCK_MAX; i++) {
+		init_data->modeset_mask[i] = 1 << (i - 1);
+		config.driver_data = init_data;
+		rdev = devm_regulator_register(dev, &mt6315_regulators[i].desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_notice(dev, "Failed to register %s\n", mt6315_regulators[i].desc.name);
+			continue;
+		}
+	}
+
+	init_data->slvid = pdev->usid;
+	switch (init_data->slvid) {
+	case MT6315_CPU:
+		init_data->modeset_mask[MT6315_VBUCK1] = 0xB;
+		break;
+	case MT6315_GPU:
+	case MT6315_MD:
+		init_data->modeset_mask[MT6315_VBUCK1] = 0x3;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void mt6315_regulator_shutdown(struct spmi_device *pdev)
+{
+	struct mt6315_chip *chip = dev_get_drvdata(&pdev->dev);
+	int ret = 0;
+
+	ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY_H, PROTECTION_KEY_H);
+	ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY, PROTECTION_KEY);
+	ret |= regmap_update_bits(chip->regmap, MT6315_TOP2_ELR7, 1, 1);
+	ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY, 0);
+	ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY_H, 0);
+	if (ret < 0)
+		dev_notice(&pdev->dev, "[%#x] Failed to enable power off sequence. %d\n",
+			   pdev->usid, ret);
+}
+
+static struct spmi_driver mt6315_regulator_driver = {
+	.driver		= {
+		.name	= "mt6315-regulator",
+		.of_match_table = mt6315_of_match,
+	},
+	.probe = mt6315_regulator_probe,
+	.shutdown = mt6315_regulator_shutdown,
+};
+
+module_spmi_driver(mt6315_regulator_driver);
+
+MODULE_AUTHOR("Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6315 PMIC");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regulator/mt6315-regulator.h b/include/linux/regulator/mt6315-regulator.h
new file mode 100644
index 000000000000..38bf365de24d
--- /dev/null
+++ b/include/linux/regulator/mt6315-regulator.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ */
+
+#ifndef __LINUX_REGULATOR_MT6315_H
+#define __LINUX_REGULATOR_MT6315_H
+
+#define MT6315_MD	3
+#define MT6315_CPU	6
+#define MT6315_GPU	7
+
+enum {
+	MT6315_VBUCK1 = 0,
+	MT6315_VBUCK2,
+	MT6315_VBUCK3,
+	MT6315_VBUCK4,
+	MT6315_VBUCK_MAX,
+};
+
+/* Register */
+#define MT6315_SWCID_H				0xC
+#define MT6315_TOP2_ELR7			0x139
+#define MT6315_TOP_TMA_KEY			0x39F
+#define MT6315_TOP_TMA_KEY_H			0x3A0
+#define MT6315_BUCK_TOP_CON0			0x1440
+#define MT6315_BUCK_TOP_CON1			0x1443
+#define MT6315_BUCK_TOP_ELR0			0x1449
+#define MT6315_BUCK_TOP_ELR2			0x144B
+#define MT6315_BUCK_TOP_ELR4			0x144D
+#define MT6315_BUCK_TOP_ELR6			0x144F
+#define MT6315_VBUCK1_DBG0			0x1499
+#define MT6315_VBUCK1_DBG4			0x149D
+#define MT6315_VBUCK2_DBG0			0x1519
+#define MT6315_VBUCK2_DBG4			0x151D
+#define MT6315_VBUCK3_DBG0			0x1599
+#define MT6315_VBUCK3_DBG4			0x159D
+#define MT6315_VBUCK4_DBG0			0x1619
+#define MT6315_VBUCK4_DBG4			0x161D
+#define MT6315_BUCK_TOP_4PHASE_ANA_CON42	0x16B1
+
+#define PROTECTION_KEY_H			0x9C
+#define PROTECTION_KEY				0xEA
+
+#endif /* __LINUX_REGULATOR_MT6315_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
