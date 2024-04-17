Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A143AC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 09:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIJZb0mRb8kf0FsO1Q8HY8rShV/Ypv5YgZpIeG2OjXc=; b=lnLiqN18SBjeMgJ1D6mrGlwl7y
	aArsV6bdDgc7CgD61oeCqSU0For8vc9ZkUTTO7BPhWpONR7NcSNrsLHO8X/Kq2hcVEXatYXORvyB8
	463ydd3ROaNUbHuXGidPEGPyxOkjvch/YAH91fDl7D/HXeaa1CyYbxEDuRGPbUVGvEM5mYEjav5Kj
	UwFj7s3QrIxrGuDXzXOfvZoapLX/J79/8WvkQDSbhRDBsbTYstt0W2bZ70PhlLCSdWF+1RAB3E3Us
	XhMyvfNsYh3U3mN3gPPzNaFGJvoe6RlSi5rn6OmrIJdRI1WnnXVmyoHYXZOZmUiE6X0hqkSBETBI7
	bGYYDFYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1OE-0000000FN2L-0GTs;
	Wed, 17 Apr 2024 09:15:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx1NW-0000000FMaN-0PmS;
	Wed, 17 Apr 2024 09:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713345292;
	bh=HutkkugHrqMd2uUFtowMQxRDssuoDexqUjYh9nxhXJc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oneBv670Dm5LjpNu/1bv6d9mSTfYb3uoOwmJQ1U/u29N9ULfz5i3cdRR4BoVQwg9H
	 anYBCKvgeSNdAFxOzh1RQQ/Z1tIbRhhbZcO0K+/N2K1AkJjZBDPyPU//PEnJx4AguN
	 1uR9Q+1PhQulavVNLpfJJ9xbPqTT9IHa+B9tsHTm0m0doXmZa3lf5gKuUQDCCXQsOc
	 ULFd2NKj6Iad6QopUHgGqDkZkH8AIGOna5IN1lSKG6c3V8XnJZWLCJ8zb2ehUeSwyj
	 Qx4jXrEfnaRo5ymF9kNIyn5+o91yk5LHIV8XYMelVVonWWC0X9AeBnXXd8+KALpKgQ
	 C5HlIVU8TOOkA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D5ED137813C4;
	Wed, 17 Apr 2024 09:14:51 +0000 (UTC)
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
Subject: [PATCH v2 5/7] regulator: Remove mtk-dvfsrc-regulator.c
Date: Wed, 17 Apr 2024 11:14:40 +0200
Message-ID: <20240417091442.170505-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_021454_295542_0A971E6A 
X-CRM114-Status: GOOD (  15.84  )
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

This driver never worked, and never got even compiled, because it was
missing the DVFSRC driver entirely, including headers it relies on!

In preparation of a full refactoring of this driver, remove it.

The Makefile and Kconfig entries are retained, as those are reused
as-is for the refactored code.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 214 -----------------------
 1 file changed, 214 deletions(-)
 delete mode 100644 drivers/regulator/mtk-dvfsrc-regulator.c

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
deleted file mode 100644
index f1280d45265d..000000000000
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ /dev/null
@@ -1,214 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-//
-// Copyright (c) 2020 MediaTek Inc.
-
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
-#include <linux/of_.h>
-#include <linux/regulator/driver.h>
-#include <linux/regulator/of_regulator.h>
-#include <linux/soc/mediatek/mtk_dvfsrc.h>
-
-#define DVFSRC_ID_VCORE		0
-#define DVFSRC_ID_VSCP		1
-
-#define MT_DVFSRC_REGULAR(match, _name,	_volt_table)	\
-[DVFSRC_ID_##_name] = {					\
-	.desc = {					\
-		.name = match,				\
-		.of_match = of_match_ptr(match),	\
-		.ops = &dvfsrc_vcore_ops,		\
-		.type = REGULATOR_VOLTAGE,		\
-		.id = DVFSRC_ID_##_name,		\
-		.owner = THIS_MODULE,			\
-		.n_voltages = ARRAY_SIZE(_volt_table),	\
-		.volt_table = _volt_table,		\
-	},	\
-}
-
-/*
- * DVFSRC regulators' information
- *
- * @desc: standard fields of regulator description.
- * @voltage_selector:  Selector used for get_voltage_sel() and
- *			   set_voltage_sel() callbacks
- */
-
-struct dvfsrc_regulator {
-	struct regulator_desc	desc;
-};
-
-/*
- * MTK DVFSRC regulators' init data
- *
- * @size: num of regulators
- * @regulator_info: regulator info.
- */
-struct dvfsrc_regulator_init_data {
-	u32 size;
-	struct dvfsrc_regulator *regulator_info;
-};
-
-static inline struct device *to_dvfsrc_dev(struct regulator_dev *rdev)
-{
-	return rdev_get_dev(rdev)->parent;
-}
-
-static int dvfsrc_set_voltage_sel(struct regulator_dev *rdev,
-				  unsigned int selector)
-{
-	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
-	int id = rdev_get_id(rdev);
-
-	if (id == DVFSRC_ID_VCORE)
-		mtk_dvfsrc_send_request(dvfsrc_dev,
-					MTK_DVFSRC_CMD_VCORE_REQUEST,
-					selector);
-	else if (id == DVFSRC_ID_VSCP)
-		mtk_dvfsrc_send_request(dvfsrc_dev,
-					MTK_DVFSRC_CMD_VSCP_REQUEST,
-					selector);
-	else
-		return -EINVAL;
-
-	return 0;
-}
-
-static int dvfsrc_get_voltage_sel(struct regulator_dev *rdev)
-{
-	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
-	int id = rdev_get_id(rdev);
-	int val, ret;
-
-	if (id == DVFSRC_ID_VCORE)
-		ret = mtk_dvfsrc_query_info(dvfsrc_dev,
-					    MTK_DVFSRC_CMD_VCORE_LEVEL_QUERY,
-					    &val);
-	else if (id == DVFSRC_ID_VSCP)
-		ret = mtk_dvfsrc_query_info(dvfsrc_dev,
-					    MTK_DVFSRC_CMD_VSCP_LEVEL_QUERY,
-					    &val);
-	else
-		return -EINVAL;
-
-	if (ret != 0)
-		return ret;
-
-	return val;
-}
-
-static const struct regulator_ops dvfsrc_vcore_ops = {
-	.list_voltage = regulator_list_voltage_table,
-	.get_voltage_sel = dvfsrc_get_voltage_sel,
-	.set_voltage_sel = dvfsrc_set_voltage_sel,
-};
-
-static const unsigned int mt8183_voltages[] = {
-	725000,
-	800000,
-};
-
-static struct dvfsrc_regulator mt8183_regulators[] = {
-	MT_DVFSRC_REGULAR("dvfsrc-vcore", VCORE,
-			  mt8183_voltages),
-};
-
-static const struct dvfsrc_regulator_init_data regulator_mt8183_data = {
-	.size = ARRAY_SIZE(mt8183_regulators),
-	.regulator_info = &mt8183_regulators[0],
-};
-
-static const unsigned int mt6873_voltages[] = {
-	575000,
-	600000,
-	650000,
-	725000,
-};
-
-static struct dvfsrc_regulator mt6873_regulators[] = {
-	MT_DVFSRC_REGULAR("dvfsrc-vcore", VCORE,
-			  mt6873_voltages),
-	MT_DVFSRC_REGULAR("dvfsrc-vscp", VSCP,
-			  mt6873_voltages),
-};
-
-static const struct dvfsrc_regulator_init_data regulator_mt6873_data = {
-	.size = ARRAY_SIZE(mt6873_regulators),
-	.regulator_info = &mt6873_regulators[0],
-};
-
-static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
-	{
-		.compatible = "mediatek,mt8183-dvfsrc",
-		.data = &regulator_mt8183_data,
-	}, {
-		.compatible = "mediatek,mt8192-dvfsrc",
-		.data = &regulator_mt6873_data,
-	}, {
-		.compatible = "mediatek,mt6873-dvfsrc",
-		.data = &regulator_mt6873_data,
-	}, {
-		/* sentinel */
-	},
-};
-MODULE_DEVICE_TABLE(of, mtk_dvfsrc_regulator_match);
-
-static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
-{
-	const struct of_device_id *match;
-	struct device *dev = &pdev->dev;
-	struct regulator_config config = { };
-	struct regulator_dev *rdev;
-	const struct dvfsrc_regulator_init_data *regulator_init_data;
-	struct dvfsrc_regulator *mt_regulators;
-	int i;
-
-	match = of_match_node(mtk_dvfsrc_regulator_match, dev->parent->of_node);
-
-	if (!match) {
-		dev_err(dev, "invalid compatible string\n");
-		return -ENODEV;
-	}
-
-	regulator_init_data = match->data;
-
-	mt_regulators = regulator_init_data->regulator_info;
-	for (i = 0; i < regulator_init_data->size; i++) {
-		config.dev = dev->parent;
-		config.driver_data = (mt_regulators + i);
-		rdev = devm_regulator_register(dev, &(mt_regulators + i)->desc,
-					       &config);
-		if (IS_ERR(rdev)) {
-			dev_err(dev, "failed to register %s\n",
-				(mt_regulators + i)->desc.name);
-			return PTR_ERR(rdev);
-		}
-	}
-
-	return 0;
-}
-
-static struct platform_driver mtk_dvfsrc_regulator_driver = {
-	.driver = {
-		.name  = "mtk-dvfsrc-regulator",
-		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
-	},
-	.probe = dvfsrc_vcore_regulator_probe,
-};
-
-static int __init mtk_dvfsrc_regulator_init(void)
-{
-	return platform_driver_register(&mtk_dvfsrc_regulator_driver);
-}
-subsys_initcall(mtk_dvfsrc_regulator_init);
-
-static void __exit mtk_dvfsrc_regulator_exit(void)
-{
-	platform_driver_unregister(&mtk_dvfsrc_regulator_driver);
-}
-module_exit(mtk_dvfsrc_regulator_exit);
-
-MODULE_AUTHOR("Arvin wang <arvin.wang@mediatek.com>");
-MODULE_LICENSE("GPL v2");
-- 
2.44.0


