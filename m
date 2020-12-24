Return-Path: <SRS0=bfHw=F4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7621EC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:20:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 276D522571
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Dec 2020 06:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 276D522571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zWQQC8QjkbTRy6pgMSpju81OvpuHHNedE6Cn37sv3ek=; b=vLXxk0ghKjcqrdNAwfEhkiv7Y
	MpdIr6szU2bnWYFr0x+BR0AfHI2zEjjCy39idwWUw9DuBIZaoCs8H4KJeOxf6Xsj2NH8tPMwhudg+
	vU/pyO5Ia+QjixmLqxTerYQl2/6Fsj8lvE9/1QkSHUE0k79QuSSMovItFMsw5PVdxSo/iRC0gPdIN
	MPpGBrlSIZHxppEUnE/vFo3l0V6dZDaW0nUk/mC2u9yOsCnY5AOqPutRlTpm+CIH2wdQS7EVFXG23
	HcmMsYzMLDsXVnOcvDJnkHZTJkexXlBN2P7t51XHFKIjCy59Sr2FUW+Pioz4rHJGUtTJEKStIJEHM
	mbVV6O5Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksJyg-0008D3-Al; Thu, 24 Dec 2020 06:19:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksJxy-0007kU-Kv; Thu, 24 Dec 2020 06:19:16 +0000
X-UUID: 663cfc91c7ee4001a047bd655944a053-20201223
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0kbw/iH+hJVJZgtO539P7eZ44ImON5hhbqy9c5eOMro=; 
 b=p63gvXC0GtOKKaPX4DQ0MiuDbMXng+QwZvJqMvZ5qZ7GhTdwCgkEDY7maIYZpiac6nlMnIMzbaNV5pHv2w5po8h/kBIeQt4ZhutqVHA0p2ckXdGygp3oxNfwozQYWO/8Q56oatRSt01NkUtYb9d/WWCyQAEcwPSlgkS0FgP8oUg=;
X-UUID: 663cfc91c7ee4001a047bd655944a053-20201223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 883203248; Wed, 23 Dec 2020 22:19:09 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 22:09:07 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 14:08:58 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 24 Dec 2020 14:08:58 +0800
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>, Mark Brown
 <broonie@kernel.org>
Subject: [PATCH V6 11/13] regulator: Regulator driver for the Mediatek DVFSRC
Date: Thu, 24 Dec 2020 14:08:52 +0800
Message-ID: <1608790134-27425-12-git-send-email-henryc.chen@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201224_011914_953185_1ECC33B8 
X-CRM114-Status: GOOD (  25.96  )
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
 linux-kernel@vger.kernel.org, "henryc.chen" <henryc.chen@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao <jamesjj.liao@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "henryc.chen" <henryc.chen@mediatek.com>

Driver for regulators exposed by the DVFSRC (dynamic voltage and
frequency scaling resource collector) found in devices based on
mt8183 and newer platforms.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/regulator/Kconfig                |  10 ++
 drivers/regulator/Makefile               |   1 +
 drivers/regulator/mtk-dvfsrc-regulator.c | 215 +++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 drivers/regulator/mtk-dvfsrc-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 020a00d..dd91e62 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -748,6 +748,16 @@ config REGULATOR_MT6397
 	  This driver supports the control of different power rails of device
 	  through regulator interface.
 
+config REGULATOR_MTK_DVFSRC
+	tristate "MediaTek DVFSRC regulator driver"
+	depends on MTK_DVFSRC
+	help
+	  Say y here to control regulator by DVFSRC (dynamic voltage
+	  and frequency scaling resource collector).
+	  This driver supports to control regulators via the DVFSRC
+	  of Mediatek. It allows for voting on regulator state
+	  between multiple users.
+
 config REGULATOR_PALMAS
 	tristate "TI Palmas PMIC Regulators"
 	depends on MFD_PALMAS
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 6ebae51..7375961b 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -92,6 +92,7 @@ obj-$(CONFIG_REGULATOR_MT6358)	+= mt6358-regulator.o
 obj-$(CONFIG_REGULATOR_MT6360) += mt6360-regulator.o
 obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
+obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
new file mode 100644
index 0000000..d3d8761
--- /dev/null
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 MediaTek Inc.
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/soc/mediatek/mtk_dvfsrc.h>
+
+#define DVFSRC_ID_VCORE		0
+#define DVFSRC_ID_VSCP		1
+
+#define MT_DVFSRC_REGULAR(match, _name,	_volt_table)	\
+[DVFSRC_ID_##_name] = {					\
+	.desc = {					\
+		.name = match,				\
+		.of_match = of_match_ptr(match),	\
+		.ops = &dvfsrc_vcore_ops,		\
+		.type = REGULATOR_VOLTAGE,		\
+		.id = DVFSRC_ID_##_name,		\
+		.owner = THIS_MODULE,			\
+		.n_voltages = ARRAY_SIZE(_volt_table),	\
+		.volt_table = _volt_table,		\
+	},	\
+}
+
+/*
+ * DVFSRC regulators' information
+ *
+ * @desc: standard fields of regulator description.
+ * @voltage_selector:  Selector used for get_voltage_sel() and
+ *			   set_voltage_sel() callbacks
+ */
+
+struct dvfsrc_regulator {
+	struct regulator_desc	desc;
+};
+
+/*
+ * MTK DVFSRC regulators' init data
+ *
+ * @size: num of regulators
+ * @regulator_info: regulator info.
+ */
+struct dvfsrc_regulator_init_data {
+	u32 size;
+	struct dvfsrc_regulator *regulator_info;
+};
+
+static inline struct device *to_dvfsrc_dev(struct regulator_dev *rdev)
+{
+	return rdev_get_dev(rdev)->parent;
+}
+
+static int dvfsrc_set_voltage_sel(struct regulator_dev *rdev,
+				  unsigned int selector)
+{
+	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
+	int id = rdev_get_id(rdev);
+
+	if (id == DVFSRC_ID_VCORE)
+		mtk_dvfsrc_send_request(dvfsrc_dev,
+					MTK_DVFSRC_CMD_VCORE_REQUEST,
+					selector);
+	else if (id == DVFSRC_ID_VSCP)
+		mtk_dvfsrc_send_request(dvfsrc_dev,
+					MTK_DVFSRC_CMD_VSCP_REQUEST,
+					selector);
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
+static int dvfsrc_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
+	int id = rdev_get_id(rdev);
+	int val, ret;
+
+	if (id == DVFSRC_ID_VCORE)
+		ret = mtk_dvfsrc_query_info(dvfsrc_dev,
+					    MTK_DVFSRC_CMD_VCORE_LEVEL_QUERY,
+					    &val);
+	else if (id == DVFSRC_ID_VSCP)
+		ret = mtk_dvfsrc_query_info(dvfsrc_dev,
+					    MTK_DVFSRC_CMD_VSCP_LEVEL_QUERY,
+					    &val);
+	else
+		return -EINVAL;
+
+	if (ret != 0)
+		return ret;
+
+	return val;
+}
+
+static const struct regulator_ops dvfsrc_vcore_ops = {
+	.list_voltage = regulator_list_voltage_table,
+	.get_voltage_sel = dvfsrc_get_voltage_sel,
+	.set_voltage_sel = dvfsrc_set_voltage_sel,
+};
+
+static const unsigned int mt8183_voltages[] = {
+	725000,
+	800000,
+};
+
+static struct dvfsrc_regulator mt8183_regulators[] = {
+	MT_DVFSRC_REGULAR("dvfsrc-vcore", VCORE,
+			  mt8183_voltages),
+};
+
+static const struct dvfsrc_regulator_init_data regulator_mt8183_data = {
+	.size = ARRAY_SIZE(mt8183_regulators),
+	.regulator_info = &mt8183_regulators[0],
+};
+
+static const unsigned int mt6873_voltages[] = {
+	575000,
+	600000,
+	650000,
+	725000,
+};
+
+static struct dvfsrc_regulator mt6873_regulators[] = {
+	MT_DVFSRC_REGULAR("dvfsrc-vcore", VCORE,
+			  mt6873_voltages),
+	MT_DVFSRC_REGULAR("dvfsrc-vscp", VSCP,
+			  mt6873_voltages),
+};
+
+static const struct dvfsrc_regulator_init_data regulator_mt6873_data = {
+	.size = ARRAY_SIZE(mt6873_regulators),
+	.regulator_info = &mt6873_regulators[0],
+};
+
+static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
+	{
+		.compatible = "mediatek,mt8183-dvfsrc",
+		.data = &regulator_mt8183_data,
+	}, {
+		.compatible = "mediatek,mt8192-dvfsrc",
+		.data = &regulator_mt6873_data,
+	}, {
+		.compatible = "mediatek,mt6873-dvfsrc",
+		.data = &regulator_mt6873_data,
+	}, {
+		/* sentinel */
+	},
+};
+MODULE_DEVICE_TABLE(of, mtk_dvfsrc_regulator_match);
+
+static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
+{
+	const struct of_device_id *match;
+	struct device *dev = &pdev->dev;
+	struct regulator_config config = { };
+	struct regulator_dev *rdev;
+	const struct dvfsrc_regulator_init_data *regulator_init_data;
+	struct dvfsrc_regulator *mt_regulators;
+	int i;
+
+	match = of_match_node(mtk_dvfsrc_regulator_match, dev->parent->of_node);
+
+	if (!match) {
+		dev_err(dev, "invalid compatible string\n");
+		return -ENODEV;
+	}
+
+	regulator_init_data = match->data;
+
+	mt_regulators = regulator_init_data->regulator_info;
+	for (i = 0; i < regulator_init_data->size; i++) {
+		config.dev = dev->parent;
+		config.driver_data = (mt_regulators + i);
+		rdev = devm_regulator_register(dev->parent,
+					       &(mt_regulators + i)->desc,
+					       &config);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "failed to register %s\n",
+				(mt_regulators + i)->desc.name);
+			return PTR_ERR(rdev);
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver mtk_dvfsrc_regulator_driver = {
+	.driver = {
+		.name  = "mtk-dvfsrc-regulator",
+	},
+	.probe = dvfsrc_vcore_regulator_probe,
+};
+
+static int __init mtk_dvfsrc_regulator_init(void)
+{
+	return platform_driver_register(&mtk_dvfsrc_regulator_driver);
+}
+subsys_initcall(mtk_dvfsrc_regulator_init);
+
+static void __exit mtk_dvfsrc_regulator_exit(void)
+{
+	platform_driver_unregister(&mtk_dvfsrc_regulator_driver);
+}
+module_exit(mtk_dvfsrc_regulator_exit);
+
+MODULE_AUTHOR("Arvin wang <arvin.wang@mediatek.com>");
+MODULE_LICENSE("GPL v2");
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
