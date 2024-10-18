Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF91D2F7E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 08:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqUOVhxdzllVLNlxhGKe5NvpOTem/doj2222rVZAilg=; b=vA+gGtxBrRwDN+mYrmV+CvPvx1
	2O21h1a51QPaR5yKi29F89oIvDbBPSM8lenD9+m6x3u1BaAsYJOXi2opWNnroyfkve4rs6YZA/5xe
	QS3sOzzXawkPrk+JqH+W25HE9qx24S/gAg9w4JjezD6UCHO/b82Cr8u6uWcgU4nnbyalTqEJM9PjE
	n6KPdUVdW/aVMKRKTLX1uhnC2q9Xwc6DptpjcOXskn2FttD0MNPB1kkruyQ80r9wUZU1mcaXkMJYv
	jtd3K//RnPRxjOkIhA3+9K7T/v5fNQlBlyjNxqPeSKygyjs8RZoaDvIEsZC0sUU6r6eSDn3lY9GFN
	0tiQ1RSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1iHx-0000000HVps-0QRw;
	Fri, 18 Oct 2024 08:24:49 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1i5X-0000000HSVP-2b6Y;
	Fri, 18 Oct 2024 08:12:02 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5c9404c0d50so1889067a12.3;
        Fri, 18 Oct 2024 01:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729239118; x=1729843918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqUOVhxdzllVLNlxhGKe5NvpOTem/doj2222rVZAilg=;
        b=lrc7yi90KrjqR4t76p9DN32zDL0bzh94yp+phbusZEQmQHzsiYqYR2q0/lBMffqy6B
         6/IOrrI51uWF/xwbKn7a5caWY+fYiqo9P2f6FYRGA1JrNroT5tY3W7NSXmdzn+UR44y5
         Nfhtf332+JMNgyG5LUkFWzFwxo65YmTEf2g7EcgbdGBpn4HzwjOr/qmibnc2mJjAf8zA
         YFWEuqLBpDhMhZCw0WjjDZddkobOXNAh/ikk8UbLpPdFMQE3fpGYH3ZU5fUuZlTf5o+J
         JUF7jRJae60lLCfsNCVouCTg6iQWwynsS2K1xH5ub72+1oQ26MfRs6zR7RsXp7XEN3g/
         iw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729239118; x=1729843918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqUOVhxdzllVLNlxhGKe5NvpOTem/doj2222rVZAilg=;
        b=SoiiL1WW8VOh2wZixnwUtoBCoZQKgYTKKULY/UrdseHYg8Yl73J9/ANKGuM+NGmqV/
         NuEE6LWEGeSTVfv7k/dow387grrQxicqqa9FlJHG5DfDrqCMg7brZzH0PijZcF2Muy1J
         qsjRzQjOERh2RQfidERushSnEhUE5BNSc59RpSdhfQqZvR46SqnieeDmsDwZb0hM7viI
         Hq5k2sgRLls/N9obZFeXDURpdORFYIVNYhmvoQBu1SVxHA7myycj9rcR23jEoudyqr3W
         qWThGgxIiXa4B63VVph4yl1OuZ9LGYzB2kMwp9BS4K7jMmnyM3182sHVaxNZjovZ+EQP
         U1fg==
X-Forwarded-Encrypted: i=1; AJvYcCWLibAiOqIdu10/0jXDhHNs02g8bUAr9a+mf5zzBZ3gSTluzuFKhG7AWuuad8kMjZIOqxumE5ENVXWZKk/Bmmw=@lists.infradead.org, AJvYcCWbVp16xog6OOtG8FOta0w0QzVMhIKz14UaiLyC9V7d/vo1b/f+Up/LCxBOqK7DB+mbPn+ZyiPUYL9mTjJk2Eav@lists.infradead.org
X-Gm-Message-State: AOJu0YzeCUM2MzOB0Fh4QMyYgbQ6SeGf2q/QJJxDCdGDr7YcYwPgEewm
	x73pmZ1CkWx5bN4dVW6gb9Y8AHeboMXXwMfPRdw3tuhlUZwpSYH9
X-Google-Smtp-Source: AGHT+IGlE2pfYKfWkF98FM42wnyiPpH6Hq45Vtmhwx5ec0LK9w0F5Rmvp/XllrhbhJ0dPL2xO1aVLA==
X-Received: by 2002:a17:907:3f23:b0:a99:eb94:3e37 with SMTP id a640c23a62f3a-a9a69ca058bmr120384566b.58.1729239117450;
        Fri, 18 Oct 2024 01:11:57 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68a8e734sm61129666b.24.2024.10.18.01.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 01:11:56 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Flora Fu <flora.fu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 5/6] regulator: Add driver for MediaTek MT6328 PMIC regulators
Date: Fri, 18 Oct 2024 11:10:47 +0300
Message-ID: <20241018081050.23592-6-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018081050.23592-1-y.oudjana@protonmail.com>
References: <20241018081050.23592-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_011159_759977_7289128C 
X-CRM114-Status: GOOD (  23.33  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add a driver for the regulators on the MT6328 PMIC.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 drivers/regulator/Kconfig                  |   9 +
 drivers/regulator/Makefile                 |   1 +
 drivers/regulator/mt6328-regulator.c       | 479 +++++++++++++++++++++
 include/linux/regulator/mt6328-regulator.h |  49 +++
 4 files changed, 538 insertions(+)
 create mode 100644 drivers/regulator/mt6328-regulator.c
 create mode 100644 include/linux/regulator/mt6328-regulator.h

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 249933d6388dd..e9b9faff67f3a 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -862,6 +862,15 @@ config REGULATOR_MT6323
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MT6328
+	tristate "MediaTek MT6328 PMIC"
+	depends on MFD_MT6397
+	help
+	  Say y here to select this option to enable the power regulator of
+	  MediaTek MT6328 PMIC.
+	  This driver supports the control of different power rails of device
+	  through regulator interface.
+
 config REGULATOR_MT6331
 	tristate "MediaTek MT6331 PMIC"
 	depends on MFD_MT6397
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 9b69546fb3f65..c1a5a44413198 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -103,6 +103,7 @@ obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
+obj-$(CONFIG_REGULATOR_MT6328)	+= mt6328-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
 obj-$(CONFIG_REGULATOR_MT6357)	+= mt6357-regulator.o
diff --git a/drivers/regulator/mt6328-regulator.c b/drivers/regulator/mt6328-regulator.c
new file mode 100644
index 0000000000000..e15a64404f494
--- /dev/null
+++ b/drivers/regulator/mt6328-regulator.c
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * MediaTek MT6328 regulator driver
+ * Based on MT6323 driver.
+ *
+ * Copyright (c) 2016 MediaTek Inc.
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/mt6397/core.h>
+#include <linux/mfd/mt6328/registers.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/mt6328-regulator.h>
+#include <linux/regulator/of_regulator.h>
+
+#define MT6328_LDO_TABLE_MODE_NORMAL	0
+#define MT6328_LDO_TABLE_MODE_LP	1
+
+/*
+ * MT6328 regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @qi: Mask for query enable signal status of regulators
+ * @vselon_reg: Register sections for hardware control mode of bucks
+ * @vselctrl_reg: Register for controlling the buck control mode.
+ * @vselctrl_mask: Mask for query buck's voltage control mode.
+ */
+struct mt6328_regulator_info {
+	struct regulator_desc desc;
+	u32 qi;
+	u32 vselon_reg;
+	u32 vselctrl_reg;
+	u32 vselctrl_mask;
+	u32 modeset_reg;
+	u32 modeset_mask;
+};
+
+#define MT6328_BUCK(match, vreg, min, max, step, volt_ranges, enreg,	\
+		    vosel, vosel_mask, voselon, vosel_ctrl)		\
+[MT6328_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6328_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6328_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = (max - min)/step + 1,			\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(0),					\
+	},								\
+	.qi = BIT(13),							\
+	.vselon_reg = voselon,						\
+	.vselctrl_reg = vosel_ctrl,					\
+	.vselctrl_mask = BIT(1),					\
+}
+
+#define MT6328_LDO_RANGE(match, vreg, min, max, step, volt_ranges,	\
+			 enreg, enbit, vosel, vosel_mask, _modeset_reg,	\
+			 _modeset_mask)					\
+[MT6328_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6328_volt_range_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6328_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = (max - min)/step + 1,			\
+		.linear_ranges = volt_ranges,				\
+		.n_linear_ranges = ARRAY_SIZE(volt_ranges),		\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6328_LDO_TABLE(match, vreg, ldo_volt_table, enreg, enbit,	\
+			 vosel, vosel_mask, _modeset_reg, _modeset_mask)\
+[MT6328_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6328_volt_table_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6328_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = ARRAY_SIZE(ldo_volt_table),		\
+		.volt_table = ldo_volt_table,				\
+		.vsel_reg = vosel,					\
+		.vsel_mask = vosel_mask,				\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+#define MT6328_REG_FIXED(match, vreg, enreg, enbit, volt,		\
+		_modeset_reg, _modeset_mask)				\
+[MT6328_ID_##vreg] = {							\
+	.desc = {							\
+		.name = #vreg,						\
+		.of_match = of_match_ptr(match),			\
+		.ops = &mt6328_volt_fixed_ops,				\
+		.type = REGULATOR_VOLTAGE,				\
+		.id = MT6328_ID_##vreg,					\
+		.owner = THIS_MODULE,					\
+		.n_voltages = 1,					\
+		.enable_reg = enreg,					\
+		.enable_mask = BIT(enbit),				\
+		.min_uV = volt,						\
+	},								\
+	.qi = BIT(15),							\
+	.modeset_reg = _modeset_reg,					\
+	.modeset_mask = _modeset_mask,					\
+}
+
+static const struct linear_range buck_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0, 0x3f, 50000)
+};
+
+static const struct linear_range buck_volt_range2[] = {
+	REGULATOR_LINEAR_RANGE(600000, 0, 0x7f, 6250)
+};
+
+static const struct linear_range buck_volt_range3[] = {
+	REGULATOR_LINEAR_RANGE(1200000, 0, 0x7f, 6250)
+};
+
+static const unsigned int ldo_volt_table1[] = {
+	1500000, 1800000, 2500000, 2800000
+};
+
+static const unsigned int ldo_volt_table2[] = {
+	3300000, 3400000, 3500000, 3600000
+};
+
+static const unsigned int ldo_volt_table3[] = {
+	0, 0, 0, 1800000, 1900000, 2000000, 2100000, 2200000
+};
+
+static const unsigned int ldo_volt_table4[] = {
+	1700000, 1800000, 1860000, 2760000, 3000000, 3100000
+};
+
+static const unsigned int ldo_volt_table5[] = {
+	1800000, 2900000, 3000000, 3300000
+};
+
+static const unsigned int ldo_volt_table6[] = {
+	2900000, 3000000, 3300000
+};
+
+static const unsigned int ldo_volt_table7[] = {
+	2500000, 2900000, 3000000, 3300000
+};
+
+static const unsigned int ldo_volt_table8[] = {
+	1300000, 1800000, 2900000, 3300000
+};
+
+static const unsigned int ldo_volt_table9[] = {
+	1200000, 1300000, 1500000, 1800000, 2000000, 2800000, 3000000, 3300000
+};
+
+static const unsigned int ldo_volt_table10[] = {
+	1200000, 1300000, 1500000, 1800000, 2500000, 2800000, 3000000, 3300000
+};
+
+static const unsigned int ldo_volt_table11[] = {
+	900000, 1000000, 1100000, 1200000, 1300000, 1500000
+};
+
+static const unsigned int ldo_volt_table12[] = {
+	1200000, 1300000, 1500000, 1800000, 1825000
+};
+
+static const unsigned int ldo_volt_table13[] = {
+	1200000, 1300000, 1500000, 1800000
+};
+
+static const unsigned int ldo_volt_table14[] = {
+	1240000, 1390000, 1540000
+};
+
+static const struct linear_range ldo_volt_range1[] = {
+	REGULATOR_LINEAR_RANGE(700000, 0, 0x7f, 6250)
+};
+
+static int mt6328_get_status(struct regulator_dev *rdev)
+{
+	int ret;
+	u32 regval;
+	struct mt6328_regulator_info *info = rdev_get_drvdata(rdev);
+
+	ret = regmap_read(rdev->regmap, info->desc.enable_reg, &regval);
+	if (ret != 0) {
+		dev_err(&rdev->dev, "Failed to get enable reg: %d\n", ret);
+		return ret;
+	}
+
+	return (regval & info->qi) ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+}
+
+static int mt6328_ldo_table_set_mode(struct regulator_dev *rdev, unsigned int mode)
+{
+	int ret, val = 0;
+	struct mt6328_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support set_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	switch (mode) {
+	case REGULATOR_MODE_STANDBY:
+		val = MT6328_LDO_TABLE_MODE_LP;
+		break;
+	case REGULATOR_MODE_NORMAL:
+		val = MT6328_LDO_TABLE_MODE_NORMAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	val <<= ffs(info->modeset_mask) - 1;
+
+	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+				  info->modeset_mask, val);
+
+	return ret;
+}
+
+static unsigned int mt6328_ldo_table_get_mode(struct regulator_dev *rdev)
+{
+	unsigned int val;
+	unsigned int mode;
+	int ret;
+	struct mt6328_regulator_info *info = rdev_get_drvdata(rdev);
+
+	if (!info->modeset_mask) {
+		dev_err(&rdev->dev, "regulator %s doesn't support get_mode\n",
+			info->desc.name);
+		return -EINVAL;
+	}
+
+	ret = regmap_read(rdev->regmap, info->modeset_reg, &val);
+	if (ret < 0)
+		return ret;
+
+	val &= info->modeset_mask;
+	val >>= ffs(info->modeset_mask) - 1;
+
+	if (val & 0x1)
+		mode = REGULATOR_MODE_STANDBY;
+	else
+		mode = REGULATOR_MODE_NORMAL;
+
+	return mode;
+}
+
+static const struct regulator_ops mt6328_volt_range_ops = {
+	.list_voltage = regulator_list_voltage_linear_range,
+	.map_voltage = regulator_map_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6328_get_status,
+};
+
+static const struct regulator_ops mt6328_volt_table_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.map_voltage = regulator_map_voltage_iterate,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6328_get_status,
+	.set_mode = mt6328_ldo_table_set_mode,
+	.get_mode = mt6328_ldo_table_get_mode,
+};
+
+static const struct regulator_ops mt6328_volt_fixed_ops = {
+	.list_voltage = regulator_list_voltage_linear,
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.get_status = mt6328_get_status,
+	.set_mode = mt6328_ldo_table_set_mode,
+	.get_mode = mt6328_ldo_table_get_mode,
+};
+
+/* The array is indexed by id(MT6328_ID_XXX) */
+static struct mt6328_regulator_info mt6328_regulators[] = {
+	MT6328_BUCK("buck_vpa", VPA, 500000, 3650000, 50000,
+		buck_volt_range1, MT6328_VPA_CON9, MT6328_VPA_CON11, 0x3f,
+		MT6328_VPA_CON12, MT6328_VPA_CON7),
+	MT6328_BUCK("buck_vproc", VPROC, 600000, 1393750, 6250,
+		buck_volt_range2, MT6328_VPROC_CON9, MT6328_VPA_CON11, 0x7f,
+		MT6328_VPROC_CON12, MT6328_VPROC_CON7),
+	MT6328_BUCK("buck_vcore1", VCORE1, 600000, 1393750, 6250,
+		buck_volt_range2, MT6328_VCORE1_CON9, MT6328_VCORE1_CON11, 0x7f,
+		MT6328_VCORE1_CON12, MT6328_VCORE1_CON7),
+	MT6328_BUCK("buck_vsys22", VSYS22, 1200000, 1993750, 6250,
+		buck_volt_range3, MT6328_VSYS22_CON9, MT6328_VSYS22_CON11, 0x7f,
+		MT6328_VSYS22_CON12, MT6328_VSYS22_CON7),
+	MT6328_BUCK("buck_vlte", VLTE, 600000, 1393750, 6250,
+		buck_volt_range2, MT6328_VLTE_CON9, MT6328_VLTE_CON11, 0x7f,
+		MT6328_VLTE_CON12, MT6328_VLTE_CON7),
+	MT6328_REG_FIXED("ldo_vaux18", VAUX18, MT6328_VAUX18_CON0, 1, 1800000,
+		MT6328_VAUX18_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vtcxo_0", VTCXO_0, MT6328_VTCXO_0_CON0, 1, 2800000,
+		MT6328_VTCXO_0_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vtcxo_1", VTCXO_1, MT6328_VTCXO_1_CON0, 1, 2800000,
+		MT6328_VTCXO_1_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vaud28", VAUD28, MT6328_VAUD28_CON0, 1, 2800000,
+		MT6328_VAUD28_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vcn28", VCN28, MT6328_VCN28_CON0, 1, 2800000,
+		MT6328_VCN28_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vcama", VCAMA, ldo_volt_table1,
+		MT6328_VCAMA_CON0, 1, MT6328_ADLDO_ANA_CON5, 0x30,
+		0, 0),
+	MT6328_LDO_TABLE("ldo_vcn33_bt", VCN33_BT, ldo_volt_table2,
+		MT6328_VCN33_CON2, 1, MT6328_ADLDO_ANA_CON6, 0x70,
+		MT6328_VCN33_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vcn33_wifi", VCN33_WIFI, ldo_volt_table2,
+		MT6328_VCN33_CON1, 1, MT6328_ADLDO_ANA_CON6, 0x70,
+		MT6328_VCN33_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vusb33", VUSB33, MT6328_VUSB33_CON0, 1, 3300000,
+		MT6328_VUSB33_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vefuse", VEFUSE, ldo_volt_table3,
+		MT6328_VEFUSE_CON0, 1, MT6328_ADLDO_ANA_CON8, 0x70,
+		MT6328_VEFUSE_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vsim1", VSIM1, ldo_volt_table4,
+		MT6328_VSIM1_CON0, 1, MT6328_ADLDO_ANA_CON9, 0x70,
+		MT6328_VSIM1_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vsim2", VSIM2, ldo_volt_table4,
+		MT6328_VSIM2_CON0, 1, MT6328_ADLDO_ANA_CON10, 0x70,
+		MT6328_VSIM2_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vemc_3v3", VEMC_3V3, ldo_volt_table5,
+		MT6328_VEMC_3V3_CON0, 1, MT6328_ADLDO_ANA_CON11, 0x30,
+		MT6328_VEMC_3V3_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vmch", VMCH, ldo_volt_table6,
+		MT6328_VMCH_CON0, 1, MT6328_ADLDO_ANA_CON12, 0x30,
+		MT6328_VMCH_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vtref", VTREF, MT6328_VTREF_CON0, 1, 1800000,
+		0, 0),
+	MT6328_LDO_TABLE("ldo_vmc", VMC, ldo_volt_table5,
+		MT6328_VMC_CON0, 1, MT6328_DLDO_ANA_CON0, 0x30,
+		MT6328_VMC_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vcamaf", VCAMAF, ldo_volt_table9,
+		MT6328_VCAMAF_CON0, 1, MT6328_DLDO_ANA_CON1, 0x70,
+		MT6328_VCAMAF_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vibr", VIBR, ldo_volt_table9,
+		MT6328_VIBR_CON0, 1, MT6328_DLDO_ANA_CON2, 0x70,
+		MT6328_VIBR_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vio28", VIO28, MT6328_VIO28_CON0, 1, 2800000,
+		MT6328_VIO28_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vgp1", VGP1, ldo_volt_table10,
+		MT6328_VGP1_CON0, 1, MT6328_DLDO_ANA_CON4, 0x70,
+		MT6328_VGP1_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vcamd", VCAMD, ldo_volt_table11,
+		MT6328_VCAM_CON0, 1, MT6328_SLDO_ANA_CON2, 0x70,
+		MT6328_VCAM_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vrf18_0", VRF18_0, MT6328_VRF18_0_CON0, 1, 1825000,
+		MT6328_VRF18_0_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vrf18_1", VRF18_1, ldo_volt_table12,
+		MT6328_VRF18_1_CON0, 1, MT6328_SLDO_ANA_CON4, 0x30,
+		MT6328_VRF18_1_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vio18", VIO18, MT6328_VIO18_CON0, 1, 1800000,
+		MT6328_VIO18_CON0, BIT(0)),
+	MT6328_REG_FIXED("ldo_vcn18", VCN18, MT6328_VCN18_CON0, 1, 1800000,
+		MT6328_VCN18_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vcamio", VCAMIO, ldo_volt_table13,
+		MT6328_VCAMIO_CON0, 1, MT6328_SLDO_ANA_CON7, 0x30,
+		MT6328_VCAMIO_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vcamio", VCAMIO, ldo_volt_table13,
+		MT6328_VCAMIO_CON0, 1, MT6328_SLDO_ANA_CON7, 0x30,
+		MT6328_VCAMIO_CON0, BIT(0)),
+	MT6328_LDO_RANGE("ldo_vsram", VSRAM, 700000, 1493750, 6250,
+		ldo_volt_range1, MT6328_VSRAM_CON9, 1, MT6328_SLDO_ANA_CON9,
+		0x7f, MT6328_LDO_VSRAM_CON0, BIT(0)),
+	MT6328_LDO_TABLE("ldo_vm", VM, ldo_volt_table14,
+		MT6328_VM_CON0, 1, MT6328_SLDO_ANA_CON0, 0x3,
+		MT6328_VM_CON0, BIT(0)),
+};
+
+static int mt6328_set_buck_vosel_reg(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6328 = dev_get_drvdata(pdev->dev.parent);
+	int i;
+	u32 regval;
+
+	for (i = 0; i < MT6328_MAX_REGULATOR; i++) {
+		if (mt6328_regulators[i].vselctrl_reg) {
+			if (regmap_read(mt6328->regmap,
+				mt6328_regulators[i].vselctrl_reg,
+				&regval) < 0) {
+				dev_err(&pdev->dev,
+					"Failed to read buck ctrl\n");
+				return -EIO;
+			}
+
+			if (regval & mt6328_regulators[i].vselctrl_mask) {
+				mt6328_regulators[i].desc.vsel_reg =
+				mt6328_regulators[i].vselon_reg;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int mt6328_regulator_probe(struct platform_device *pdev)
+{
+	struct mt6397_chip *mt6328 = dev_get_drvdata(pdev->dev.parent);
+	struct regulator_config config = {};
+	struct regulator_dev *rdev;
+	int i;
+
+	/* Query buck controller to select activated voltage register part */
+	if (mt6328_set_buck_vosel_reg(pdev))
+		return -EIO;
+
+	for (i = 0; i < MT6328_MAX_REGULATOR; i++) {
+		config.dev = &pdev->dev;
+		config.driver_data = &mt6328_regulators[i];
+		config.regmap = mt6328->regmap;
+		rdev = devm_regulator_register(&pdev->dev,
+				&mt6328_regulators[i].desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev, "failed to register %s\n",
+				mt6328_regulators[i].desc.name);
+			return PTR_ERR(rdev);
+		}
+	}
+	return 0;
+}
+
+static const struct platform_device_id mt6328_platform_ids[] = {
+	{ "mt6328-regulator" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(platform, mt6328_platform_ids);
+
+static struct platform_driver mt6328_regulator_driver = {
+	.driver = {
+		.name = "mt6328-regulator",
+	},
+	.probe = mt6328_regulator_probe,
+	.id_table = mt6328_platform_ids,
+};
+
+module_platform_driver(mt6328_regulator_driver);
+
+MODULE_AUTHOR("Yassine Oudjana <y.oudjana@protonmail.com>");
+MODULE_DESCRIPTION("Regulator Driver for MediaTek MT6328 PMIC");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regulator/mt6328-regulator.h b/include/linux/regulator/mt6328-regulator.h
new file mode 100644
index 0000000000000..0f82aa88493b0
--- /dev/null
+++ b/include/linux/regulator/mt6328-regulator.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2016 MediaTek Inc.
+ * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
+ */
+
+#ifndef __LINUX_REGULATOR_MT6328_H
+#define __LINUX_REGULATOR_MT6328_H
+
+enum {
+	MT6328_ID_VPA = 0,
+	MT6328_ID_VPROC,
+	MT6328_ID_VCORE1,
+	MT6328_ID_VSYS22,
+	MT6328_ID_VLTE,
+	MT6328_ID_VAUX18,
+	MT6328_ID_VTCXO_0,
+	MT6328_ID_VTCXO_1,
+	MT6328_ID_VAUD28,
+	MT6328_ID_VCN28,
+	MT6328_ID_VCAMA,
+	MT6328_ID_VCN33_BT,
+	MT6328_ID_VCN33_WIFI,
+	MT6328_ID_VUSB33,
+	MT6328_ID_VEFUSE,
+	MT6328_ID_VSIM1,
+	MT6328_ID_VSIM2,
+	MT6328_ID_VEMC_3V3,
+	MT6328_ID_VMCH,
+	MT6328_ID_VTREF,
+	MT6328_ID_VMC,
+	MT6328_ID_VCAMAF,
+	MT6328_ID_VIBR,
+	MT6328_ID_VIO28,
+	MT6328_ID_VGP1,
+	MT6328_ID_VCAMD,
+	MT6328_ID_VRF18_0,
+	MT6328_ID_VRF18_1,
+	MT6328_ID_VIO18,
+	MT6328_ID_VCN18,
+	MT6328_ID_VCAMIO,
+	MT6328_ID_VSRAM,
+	MT6328_ID_VM,
+	MT6328_ID_RG_MAX,
+};
+
+#define MT6328_MAX_REGULATOR	MT6328_ID_RG_MAX
+
+#endif /* __LINUX_REGULATOR_MT6328_H */
-- 
2.47.0


