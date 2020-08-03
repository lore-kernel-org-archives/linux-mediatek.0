Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDAFC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:58:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0016E2070A
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 08:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3QQv8s8b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iyW5n6Kc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0016E2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XeWlYZgjprbuWgPlBAA7N7CvmFxbTi0F9z7bBEqUBao=; b=3QQv8s8bNekt3RPucMB8qQBFR
	NuecwVlBGZbamp75G2lDmogX6pYk/esxQ5KNI9VqqenILEhRuCDcS1LP/3gc3S6QzDOtp4572poVi
	jGazJqDSMfo1j6JfGwp+g+sUqYKNcIfpKMWLDYzaWQS0Iy1baRlFzmknHsRCxSGuonkeZP5+ORR6z
	VxoYHZ9XIx9ndcD30clS1F1VVYMjxtEfDeqfGL4pynBtqFA5xfd9BFzZLFmC6i/3iBK/g7PIm5++s
	p5J5qMG9DnkRbn4XvQ6LK3tY0/pAY+JKZntPHldFH85RlQufK5t7hbsAaRTDOiXVkzVn6AFSb2oGK
	6Eg/hXo6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2WI7-0003NC-IN; Mon, 03 Aug 2020 08:57:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2WHy-0003IW-UP; Mon, 03 Aug 2020 08:57:48 +0000
X-UUID: a1db9a7c6965466e8354c957c3812c92-20200803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vlSnqNYVUdN0Y8lMTdV2j8H5J5FACBMGLKH3hNfgXKQ=; 
 b=iyW5n6Kcf/4SdqrAi1VGHQyxWophO7GPquonTGnLqZKPyLkGEn8e0oC64uZLeyXCGraEBtJH06w3gXM/5xbTD8J7QyZGUheaP+8JQAhvkPHE5yDijiDJ0n1vJI60vkj/wFsxzafpx6XA/mXaeo+JCcdRc3emOxcRaRXcLn7XLn4=;
X-UUID: a1db9a7c6965466e8354c957c3812c92-20200803
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 899345280; Mon, 03 Aug 2020 00:57:34 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 01:57:36 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 16:57:35 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Aug 2020 16:57:35 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 3/3] regulator: mt6315: Add support for MT6315 regulator
Date: Mon, 3 Aug 2020 16:57:27 +0800
Message-ID: <1596445047-2975-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_045747_211596_95023A40 
X-CRM114-Status: GOOD (  26.13  )
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
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
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
 drivers/regulator/mt6315-regulator.c       | 367 +++++++++++++++++++++++++++++
 include/linux/regulator/mt6315-regulator.h |  45 ++++
 4 files changed, 423 insertions(+)
 create mode 100644 drivers/regulator/mt6315-regulator.c
 create mode 100644 include/linux/regulator/mt6315-regulator.h
 create mode 100644 include/linux/regulator/mt6315-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 8f677f5..5b8f28f7 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -673,6 +673,16 @@ config REGULATOR_MT6311
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
index e8f1633..742067e 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -84,6 +84,7 @@ obj-$(CONFIG_REGULATOR_MP8859) += mp8859.o
 obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
+obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6358)	+= mt6358-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
new file mode 100644
index 0000000..a855e70
--- /dev/null
+++ b/drivers/regulator/mt6315-regulator.c
@@ -0,0 +1,367 @@
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
+#define MT6315_BUCK_MODE_NORMAL		0
+#define MT6315_BUCK_MODE_LP		2
+
+struct mt6315_regulator_info {
+	struct regulator_desc desc;
+	u32 da_vsel_reg;
+	u32 da_reg;
+	u32 qi;
+	u32 modeset_reg;
+	u32 modeset_mask;
+	u32 lp_mode_reg;
+	u32 lp_mode_mask;
+	u32 lp_mode_shift;
+};
+};
+
+struct mt6315_init_data {
+struct mt6315_init_data {
+	u32 id;
+	u32 size;
+	u32 buck1_modeset_mask;
+};
+
+
+struct mt6315_chip {
+	struct device *dev;
+	struct regmap *regmap;
+	u32 slave_id;
+};
+
+#define MT_BUCK(match, _name, volt_ranges, _bid, _vsel, _modeset_mask)	\
+[MT6315_ID_##_name] = {					\
+	.desc = {					\
+		.name = #_name,				\
+		.of_match = of_match_ptr(match),	\
+		.ops = &mt6315_volt_range_ops,		\
+		.type = REGULATOR_VOLTAGE,		\
+		.id = MT6315_ID_##_name,		\
+		.owner = THIS_MODULE,			\
+		.n_voltages = 0xbf,			\
+		.linear_ranges = volt_ranges,		\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),	\
+		.vsel_reg = _vsel,			\
+		.vsel_mask = 0xff,			\
+		.enable_reg = MT6315_BUCK_TOP_CON0,	\
+		.enable_mask = BIT(_bid - 1),		\
+		.of_map_mode = mt6315_map_mode,		\
+	},						\
+	.da_vsel_reg = MT6315_BUCK_VBUCK##_bid##_DBG0,	\
+	.da_reg = MT6315_BUCK_VBUCK##_bid##_DBG4,	\
+	.qi = BIT(0),					\
+	.lp_mode_reg = MT6315_BUCK_TOP_CON1,		\
+	.lp_mode_mask = BIT(_bid - 1),			\
+	.lp_mode_shift = _bid - 1,			\
+	.modeset_reg = MT6315_BUCK_TOP_4PHASE_ANA_CON42,	\
+	.modeset_mask = _modeset_mask,			\
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
+static int mt6315_regulator_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct mt6315_regulator_info *info = rdev_get_drvdata(rdev);
+	int ret = 0, reg_addr = 0, reg_val = 0, reg_en = 0;
+
+	ret = regmap_read(rdev->regmap, info->da_reg, &reg_en);
+	if (ret != 0) {
+		dev_notice(&rdev->dev, "Failed to get enable reg: %d\n", ret);
+		return ret;
+	}
+
+	if (reg_en & info->qi)
+		reg_addr = info->da_vsel_reg;
+	else
+		reg_addr = rdev->desc->vsel_reg;
+
+	ret = regmap_read(rdev->regmap, reg_addr, &reg_val);
+	if (ret != 0) {
+		dev_err(&rdev->dev,
+			"Failed to get mt6315 regulator voltage: %d\n", ret);
+		return ret;
+	}
+
+	ret = reg_val & rdev->desc->vsel_mask;
+	return ret;
+}
+
+static unsigned int mt6315_regulator_get_mode(struct regulator_dev *rdev)
+{
+	struct mt6315_regulator_info *info = rdev_get_drvdata(rdev);
+	struct mt6315_init_data *pdata = dev_get_drvdata(rdev->dev.parent);
+	int ret = 0, regval = 0;
+	u32 modeset_mask;
+
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev,
+			"Failed to get mt6315 buck mode: %d\n", ret);
+		return ret;
+	}
+
+	if (rdev_get_id(rdev) == MT6315_ID_VBUCK1)
+		modeset_mask = pdata->buck1_modeset_mask;
+	else
+		modeset_mask = info->modeset_mask;
+
+	if ((regval & modeset_mask) == modeset_mask)
+		return REGULATOR_MODE_FAST;
+
+	ret = regmap_read(rdev->regmap, info->lp_mode_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev,
+			"Failed to get mt6315 buck lp mode: %d\n", ret);
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
+	struct mt6315_regulator_info *info = rdev_get_drvdata(rdev);
+	struct mt6315_init_data *pdata = dev_get_drvdata(rdev->dev.parent);
+	int ret = 0, val, curr_mode;
+	u32 modeset_mask;
+
+	if (rdev_get_id(rdev) == MT6315_ID_VBUCK1)
+		modeset_mask = pdata->buck1_modeset_mask;
+	else
+		modeset_mask = info->modeset_mask;
+
+	curr_mode = mt6315_regulator_get_mode(rdev);
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		ret = regmap_update_bits(rdev->regmap,
+					 info->modeset_reg,
+					 modeset_mask,
+					 modeset_mask);
+		break;
+	case REGULATOR_MODE_NORMAL:
+		if (curr_mode == REGULATOR_MODE_FAST) {
+			ret = regmap_update_bits(rdev->regmap,
+						 info->modeset_reg,
+						 modeset_mask,
+						 0);
+		} else if (curr_mode == REGULATOR_MODE_IDLE) {
+			ret = regmap_update_bits(rdev->regmap,
+						 info->lp_mode_reg,
+						 info->lp_mode_mask,
+						 0);
+			usleep_range(100, 110);
+		}
+		break;
+	case REGULATOR_MODE_IDLE:
+		val = MT6315_BUCK_MODE_LP >> 1;
+		val <<= info->lp_mode_shift;
+		ret = regmap_update_bits(rdev->regmap,
+					 info->lp_mode_reg,
+					 info->lp_mode_mask,
+					 val);
+		break;
+	default:
+		ret = -EINVAL;
+		goto err_mode;
+	}
+
+err_mode:
+	if (ret != 0) {
+		dev_err(&rdev->dev,
+			"Failed to set mt6315 buck mode: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt6315_get_status(struct regulator_dev *rdev)
+{
+	int ret = 0;
+	u32 regval = 0;
+	struct mt6315_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->da_reg, &regval);
+	if (ret != 0) {
+		dev_notice(&rdev->dev, "Failed to get enable reg: %d\n", ret);
+		return ret;
+	}
+
+	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static const struct regulator_ops mt6315_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = mt6315_regulator_get_voltage_sel,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6315_get_status,
+	.set_mode = mt6315_regulator_set_mode,
+	.get_mode = mt6315_regulator_get_mode,
+};
+
+static struct mt6315_regulator_info mt6315_regulators[] = {
+	MT_BUCK("vbuck1", VBUCK1, mt_volt_range1, 1,
+		MT6315_BUCK_TOP_ELR0, 0),
+	MT_BUCK("vbuck3", VBUCK3, mt_volt_range1, 3,
+		MT6315_BUCK_TOP_ELR4, 0x4),
+	MT_BUCK("vbuck4", VBUCK4, mt_volt_range1, 4,
+		MT6315_BUCK_TOP_ELR6, 0x8),
+};
+
+static const struct mt6315_init_data mt6315_3_init_data = {
+	.id = MT6315_SLAVE_ID_3,
+	.size = MT6315_ID_3_MAX,
+	.buck1_modeset_mask = 0x3,
+};
+
+static const struct mt6315_init_data mt6315_6_init_data = {
+	.id = MT6315_SLAVE_ID_6,
+	.size = MT6315_ID_6_MAX,
+	.buck1_modeset_mask = 0xB,
+};
+
+static const struct mt6315_init_data mt6315_7_init_data = {
+	.id = MT6315_SLAVE_ID_7,
+	.size = MT6315_ID_7_MAX,
+	.buck1_modeset_mask = 0x3,
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
+		.compatible = "mediatek,mt6315_3-regulator",
+		.data = &mt6315_3_init_data,
+	}, {
+		.compatible = "mediatek,mt6315_6-regulator",
+		.data = &mt6315_6_init_data,
+	}, {
+		.compatible = "mediatek,mt6315_7-regulator",
+		.data = &mt6315_7_init_data,
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, mt6315_of_match);
+
+static int mt6315_regulator_probe(struct spmi_device *pdev)
+{
+	const struct of_device_id *of_id;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	struct mt6315_init_data *pdata;
+	struct mt6315_chip *chip;
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
+	of_id = of_match_device(mt6315_of_match, dev);
+	if (!of_id || !of_id->data)
+		return -ENODEV;
+
+	pdata = (struct mt6315_init_data *)of_id->data;
+	chip->slave_id = pdata->id;
+	chip->dev = dev;
+	chip->regmap = regmap;
+	dev_set_drvdata(dev, chip);
+
+	for (i = 0; i < pdata->size; i++) {
+		config.dev = dev;
+		config.driver_data = (mt6315_regulators + i);
+		config.regmap = regmap;
+		rdev = devm_regulator_register(dev,
+					       &(mt6315_regulators + i)->desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "failed to register %s\n",
+				(mt6315_regulators + i)->desc.name);
+			continue;
+		}
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
+	ret |= regmap_write(chip->regmap,
+				MT6315_TOP_TMA_KEY_H, PROTECTION_KEY_H);
+	ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY, PROTECTION_KEY);
+	ret |= regmap_update_bits(chip->regmap, MT6315_TOP2_ELR7, 1, 1);
+	ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY, 0);
+	ret |= regmap_write(chip->regmap, MT6315_TOP_TMA_KEY_H, 0);
+	if (ret < 0)
+		dev_err(&pdev->dev, "%s: SLV_%d enable power off sequence failed.\n",
+			__func__, chip->slave_id);
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
index 0000000..180049b0
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
+#define MT6315_SLAVE_ID_3	3
+#define MT6315_SLAVE_ID_6	6
+#define MT6315_SLAVE_ID_7	7
+
+#define MT6315_ID_3_MAX	3
+#define MT6315_ID_6_MAX	2
+#define MT6315_ID_7_MAX	2
+
+enum {
+	MT6315_ID_VBUCK1 = 0,
+	MT6315_ID_VBUCK3,
+	MT6315_ID_VBUCK4,
+	MT6315_ID_MAX,
+};
+
+/* Register */
+#define MT6315_SWCID_H	0xb
+#define MT6315_TOP2_ELR7	0x139
+#define MT6315_TOP_TMA_KEY	0x39f
+#define MT6315_TOP_TMA_KEY_H	0x3a0
+#define MT6315_BUCK_TOP_CON0	0x1440
+#define MT6315_BUCK_TOP_CON1	0x1443
+#define MT6315_BUCK_TOP_ELR0	0x1449
+#define MT6315_BUCK_TOP_ELR4	0x144d
+#define MT6315_BUCK_TOP_ELR6	0x144f
+#define MT6315_BUCK_VBUCK1_DBG0	0x1499
+#define MT6315_BUCK_VBUCK1_DBG4	0x149d
+#define MT6315_BUCK_VBUCK3_DBG0	0x1599
+#define MT6315_BUCK_VBUCK3_DBG4	0x159d
+#define MT6315_BUCK_VBUCK4_DBG0	0x1619
+#define MT6315_BUCK_VBUCK4_DBG4	0x161d
+#define MT6315_BUCK_TOP_4PHASE_ANA_CON42	0x16b1
+
+#define PROTECTION_KEY_H 0x9C
+#define PROTECTION_KEY 0xEA
+
+#endif /* __LINUX_REGULATOR_MT6315_H */
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
