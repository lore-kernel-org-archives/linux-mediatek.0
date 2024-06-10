Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81180C27C6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvWaEgEro7zNT7OUmoZvEDK5bQRazlyTVnB+qCVAuZU=; b=a+dt+MeqQc7cZ12wTHf6bXx/JY
	xjVUblrp3xkSi9t5yhTPcxdFB0581ieYMyik5VJCja/JIs0cJ3HAK6avDA/mCKiQjqL5LWmNXNOE0
	c1FN8NvDYE3oio0/2QbkcEIPadgX0vIBp4y5WZqYFThBXWv591006KCn7lp5mgFnjHIyUaIOIPjK6
	0XwI+8UIze3Er6AG7KKhyEGVNgrIzifWzwcRKOrvvqOmQePBDbrDNyRrB6uSzxz173nwlbHfZOcUy
	38Gsy3RXzmzFIZZjdrm0UxbhUgSHzrAjhQurqhbXYcJ1KinNkwLC3fP1M6lA8ccG0qiI+EtGa2srF
	qBZ6ObMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGar6-00000004KoN-2cy6;
	Mon, 10 Jun 2024 08:58:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGaqb-00000004KQR-4A6u;
	Mon, 10 Jun 2024 08:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718009868;
	bh=e99sQb31EtqbM5DnQ+9bWzfSy0+td1CVrCQrtj0hb0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a7uYwqwGOuzzkT7fdrlnC2PJ3n4nDqEH8sGvrLMfPlobFxku4EScL9vGKbhTa/KvC
	 B1FMocpVMNiDfXABJ/oB5B1NXv2XXRVlRxESQxEYS5vVPs5kxIY7qvA7cyhg0E9hs/
	 opZEW7acErsNepoMqN+X52896nuu+AwkgbLeObro7vlqhedJktZa2aQMoNCQLMDj4a
	 MkLoHABYa/MGBa0yF4Aidz0ymeHgZXwgr/0K4ryCAQPJoJRCNatMH/CtQRMojpYWPe
	 4vYMMPNFq2BAseNJekjO7X7v9Kz+VhXbKkY+2VSUQhe4EynksqrJ9m3bXvYgYv8rbU
	 vT4q2ni3ZDRtA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 980BD3782159;
	Mon, 10 Jun 2024 08:57:47 +0000 (UTC)
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
Subject: [PATCH v6 6/7] regulator: Add refactored mtk-dvfsrc-regulator driver
Date: Mon, 10 Jun 2024 10:57:34 +0200
Message-ID: <20240610085735.147134-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
References: <20240610085735.147134-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_015750_279458_D9BFA53A 
X-CRM114-Status: GOOD (  18.95  )
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

The previous driver never worked, and never got even compiled because
it was missing the DVFSRC driver entirely, including needed neaders.

This is a full (or nearly full) refactoring of the MediaTek DVFSRC
controlled Regulators driver, retaining support for the MT6873, MT8183
and MT8192 SoC, and adding MT8195.

As part of the refactoring, this driver is now probed using its own
devicetree compatible, as this is a child of the main DVFSRC driver
and gets probed as a subnode of that.

Reviewed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/regulator/mtk-dvfsrc-regulator.c | 196 +++++++++++++++++++++++
 1 file changed, 196 insertions(+)
 create mode 100644 drivers/regulator/mtk-dvfsrc-regulator.c

diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
new file mode 100644
index 000000000000..558efd8124b6
--- /dev/null
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/soc/mediatek/dvfsrc.h>
+
+enum dvfsrc_regulator_id {
+	DVFSRC_ID_VCORE,
+	DVFSRC_ID_VSCP,
+	DVFSRC_ID_MAX
+};
+
+struct dvfsrc_regulator_pdata {
+	struct regulator_desc *descs;
+	u32 size;
+};
+
+#define MTK_DVFSRC_VREG(match, _name, _volt_table)	\
+{							\
+	.name = match,					\
+	.of_match = match,				\
+	.ops = &dvfsrc_vcore_ops,			\
+	.type = REGULATOR_VOLTAGE,			\
+	.id = DVFSRC_ID_##_name,			\
+	.owner = THIS_MODULE,				\
+	.n_voltages = ARRAY_SIZE(_volt_table),		\
+	.volt_table = _volt_table,			\
+}
+
+static inline struct device *to_dvfs_regulator_dev(struct regulator_dev *rdev)
+{
+	return rdev_get_dev(rdev)->parent;
+}
+
+static inline struct device *to_dvfsrc_dev(struct regulator_dev *rdev)
+{
+	return to_dvfs_regulator_dev(rdev)->parent;
+}
+
+static int dvfsrc_get_cmd(int rdev_id, enum mtk_dvfsrc_cmd *cmd)
+{
+	switch (rdev_id) {
+	case DVFSRC_ID_VCORE:
+		*cmd = MTK_DVFSRC_CMD_VCORE_LEVEL;
+		break;
+	case DVFSRC_ID_VSCP:
+		*cmd = MTK_DVFSRC_CMD_VSCP_LEVEL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dvfsrc_set_voltage_sel(struct regulator_dev *rdev,
+				  unsigned int selector)
+{
+	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
+	enum mtk_dvfsrc_cmd req_cmd;
+	int id = rdev_get_id(rdev);
+	int ret;
+
+	ret = dvfsrc_get_cmd(id, &req_cmd);
+	if (ret)
+		return ret;
+
+	return mtk_dvfsrc_send_request(dvfsrc_dev, req_cmd, selector);
+}
+
+static int dvfsrc_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct device *dvfsrc_dev = to_dvfsrc_dev(rdev);
+	enum mtk_dvfsrc_cmd query_cmd;
+	int id = rdev_get_id(rdev);
+	int val, ret;
+
+	ret = dvfsrc_get_cmd(id, &query_cmd);
+	if (ret)
+		return ret;
+
+	ret = mtk_dvfsrc_query_info(dvfsrc_dev, query_cmd, &val);
+	if (ret)
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
+static const unsigned int mt6873_voltages[] = {
+	575000,
+	600000,
+	650000,
+	725000,
+};
+
+static struct regulator_desc mt6873_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt6873_voltages),
+	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt6873_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt6873_data = {
+	.descs = mt6873_regulators,
+	.size = ARRAY_SIZE(mt6873_regulators),
+};
+
+static const unsigned int mt8183_voltages[] = {
+	725000,
+	800000,
+};
+
+static struct regulator_desc mt8183_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8183_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt8183_data = {
+	.descs = mt8183_regulators,
+	.size = ARRAY_SIZE(mt8183_regulators),
+};
+
+static const unsigned int mt8195_voltages[] = {
+	550000,
+	600000,
+	650000,
+	750000,
+};
+
+static struct regulator_desc mt8195_regulators[] = {
+	MTK_DVFSRC_VREG("dvfsrc-vcore", VCORE, mt8195_voltages),
+	MTK_DVFSRC_VREG("dvfsrc-vscp", VSCP, mt8195_voltages),
+};
+
+static const struct dvfsrc_regulator_pdata mt8195_data = {
+	.descs = mt8195_regulators,
+	.size = ARRAY_SIZE(mt8195_regulators),
+};
+
+static int dvfsrc_vcore_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config config = { .dev = &pdev->dev };
+	const struct dvfsrc_regulator_pdata *pdata;
+	int i;
+
+	pdata = device_get_match_data(&pdev->dev);
+	if (!pdata)
+		return -EINVAL;
+
+	for (i = 0; i < pdata->size; i++) {
+		struct regulator_desc *vrdesc = &pdata->descs[i];
+		struct regulator_dev *rdev;
+
+		rdev = devm_regulator_register(&pdev->dev, vrdesc, &config);
+		if (IS_ERR(rdev))
+			return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
+					     "failed to register %s\n", vrdesc->name);
+	}
+
+	return 0;
+}
+
+static const struct of_device_id mtk_dvfsrc_regulator_match[] = {
+	{ .compatible = "mediatek,mt6873-dvfsrc-regulator", .data = &mt6873_data },
+	{ .compatible = "mediatek,mt8183-dvfsrc-regulator", .data = &mt8183_data },
+	{ .compatible = "mediatek,mt8192-dvfsrc-regulator", .data = &mt6873_data },
+	{ .compatible = "mediatek,mt8195-dvfsrc-regulator", .data = &mt8195_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_dvfsrc_regulator_match);
+
+static struct platform_driver mtk_dvfsrc_regulator_driver = {
+	.driver = {
+		.name  = "mtk-dvfsrc-regulator",
+		.of_match_table = mtk_dvfsrc_regulator_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+	.probe = dvfsrc_vcore_regulator_probe,
+};
+module_platform_driver(mtk_dvfsrc_regulator_driver);
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_AUTHOR("Arvin wang <arvin.wang@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DVFS Resource Collector Regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.45.2


