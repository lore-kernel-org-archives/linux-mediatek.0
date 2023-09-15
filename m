Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E9EEED60B
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Sep 2023 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utkzDn10EYvwp9e6WhYM1iztZKUB3fFaNCYAgHIa5iU=; b=0+1U3v9oCyJOYWRz48dUADtwEa
	itxwzx0Xoui3ayoM+aMyAm5VcxGhQ2hpQPx5WwslGtUJ596ctc8pqquXtocxmX4r7QqJsl0akSci8
	f8nHRVbcJOl02nj52KzlVbWyU6kGb6/yhHy3gXxlsHDruBN/Fg4P89n5YNSk3hdQQYZCh8yDjeYZh
	9SbVj3M9Ak0x49gdRJC9XVy8zDISPS1WMOb/ta6pPl9EClLF7wmebeJVlZBazawGZMOoFbaVDZvMV
	TKblCleoM4jgzf2iphmJyf5G/o/Z4TXLQrg2tRLP36lp5nxH4Vrlr98Vh5Cb9CsPTvQ+rIvbfKvyh
	roU0OyzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAiL-00Ayu4-30;
	Fri, 15 Sep 2023 15:26:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAiJ-00Ays9-0E;
	Fri, 15 Sep 2023 15:26:36 +0000
X-UUID: 3c92b4d453dc11ee9b7791016c24628a-20230915
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=utkzDn10EYvwp9e6WhYM1iztZKUB3fFaNCYAgHIa5iU=;
	b=gzpun3vFjJ2TMfOFB07xwNwvKP/9mlg2PW6WCzdIhqJh9/XRf8aYJQyQNHywK/ealPKgsKkOVpFSwApoFoPeRtIvfYzIzwDIj0i1asMnmDlR6+tnhfKN13sKB7bVZVMtjj7r2R01iPS+WPMVOYKTFJtamRz6XQ9XUSx2SiET4cE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:845a7ae8-869e-43d8-a2c6-fc22542d58dd,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:0ad78a4,CLOUDID:7ae313c3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3c92b4d453dc11ee9b7791016c24628a-20230915
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <william-tw.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 658879013; Fri, 15 Sep 2023 08:26:26 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 15 Sep 2023 23:26:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 15 Sep 2023 23:26:23 +0800
From: William-tw Lin <william-tw.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kevin Hilman <khilman@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	William-tw Lin <william-tw.lin@mediatek.com>
Subject: [PATCH v2 2/3] soc: mediatek: mtk-socinfo: Add driver for getting chip information
Date: Fri, 15 Sep 2023 23:26:06 +0800
Message-ID: <20230915152607.18116-3-william-tw.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230915152607.18116-1-william-tw.lin@mediatek.com>
References: <20230915152607.18116-1-william-tw.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_082635_115885_1A2D3105 
X-CRM114-Status: GOOD (  22.93  )
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

Add driver for socinfo retrieval. This patch includes the following:
1. mtk-socinfo driver for chip info retrieval
2. Related changes to Makefile and Kconfig

Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
---
 drivers/soc/mediatek/Kconfig       |   9 ++
 drivers/soc/mediatek/Makefile      |   1 +
 drivers/soc/mediatek/mtk-socinfo.c | 166 +++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-socinfo.c

diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
index a88cf04fc803..5746d3b4c67d 100644
--- a/drivers/soc/mediatek/Kconfig
+++ b/drivers/soc/mediatek/Kconfig
@@ -91,4 +91,13 @@ config MTK_SVS
 	  chip process corner, temperatures and other factors. Then DVFS
 	  driver could apply SVS bank voltage to PMIC/Buck.
 
+config MTK_SOCINFO
+	tristate "MediaTek SOCINFO"
+	depends on MTK_EFUSE && NVMEM
+	help
+	  Say y here to enable mtk socinfo information.
+	  This enables a sysfs node which shows attributes of MTK soc info.
+	  Information of soc info includes the manufacturer, the marketing
+	  name, and the soc used.
+
 endmenu
diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
index 9d3ce7878c5c..6830512848fd 100644
--- a/drivers/soc/mediatek/Makefile
+++ b/drivers/soc/mediatek/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
 obj-$(CONFIG_MTK_MMSYS) += mtk-mutex.o
 obj-$(CONFIG_MTK_SVS) += mtk-svs.o
+obj-$(CONFIG_MTK_SOCINFO) += mtk-socinfo.o
diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
new file mode 100644
index 000000000000..fe5a68925f58
--- /dev/null
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 MediaTek Inc.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
+#include <linux/nvmem-consumer.h>
+#include <linux/device.h>
+#include <linux/debugfs.h>
+#include <linux/seq_file.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+#include <linux/slab.h>
+
+#define MTK_SOCINFO_ENTRY(_soc_name, _segment_name, _marketing_name, _cell_data1, _cell_data2) {\
+	.soc_name = _soc_name,	\
+	.segment_name = _segment_name,	\
+	.marketing_name = _marketing_name,	\
+	.cell_data = {_cell_data1, _cell_data2}	\
+}
+#define CELL_NOT_USED (0xFFFFFFFF)
+#define MAX_CELLS (2)
+
+struct mtk_socinfo {
+	struct device *dev;
+	struct name_data *name_data;
+	struct socinfo_data *socinfo_data;
+};
+
+struct socinfo_data {
+	char *soc_name;
+	char *segment_name;
+	char *marketing_name;
+	u32 cell_data[MAX_CELLS];
+};
+
+const char *soc_manufacturer = "MediaTek";
+struct soc_device *soc_dev;
+char *cell_names[MAX_CELLS] = {"socinfo-data1", "socinfo-data2"};
+
+static struct socinfo_data socinfo_data_table[] = {
+	MTK_SOCINFO_ENTRY("MT8173", "MT8173V/AC", "MT8173", 0x6CA20004, 0x10000000),
+	MTK_SOCINFO_ENTRY("MT8183", "MT8183V/AZA", "Kompanio 500", 0x00010043, 0x00000840),
+	MTK_SOCINFO_ENTRY("MT8186", "MT8186GV/AZA", "Kompanio 520", 0x81861001, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8186T", "MT8186TV/AZA", "Kompanio 528", 0x81862001, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/AZA", "Kompanio 830", 0x81880000, 0x00000010),
+	MTK_SOCINFO_ENTRY("MT8188", "MT8188GV/HZA", "Kompanio 830", 0x81880000, 0x00000011),
+	MTK_SOCINFO_ENTRY("MT8192", "MT8192V/AZA", "Kompanio 820", 0x00001100, 0x00040080),
+	MTK_SOCINFO_ENTRY("MT8192T", "MT8192V/ATZA", "Kompanio 828", 0x00000100, 0x000400C0),
+	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EZA", "Kompanio 1200", 0x81950300, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8195", "MT8195GV/EHZA", "Kompanio 1200", 0x81950304, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EZA", "Kompanio 1380", 0x81950400, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8195", "MT8195TV/EHZA", "Kompanio 1380", 0x81950404, CELL_NOT_USED),
+};
+
+static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)
+{
+	struct soc_device_attribute *attrs;
+	static char machine[30] = {0};
+
+	attrs = devm_kzalloc(mtk_socinfop->dev, sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	snprintf(machine, 30, "%s (%s)", mtk_socinfop->socinfo_data->marketing_name,
+		mtk_socinfop->socinfo_data->soc_name);
+	attrs->family = soc_manufacturer;
+	attrs->machine = machine;
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev))
+		return PTR_ERR(soc_dev);
+
+	dev_info(mtk_socinfop->dev, "%s SoC detected.\n", attrs->machine);
+	return 0;
+}
+
+static int mtk_socinfo_get_socinfo_data(struct mtk_socinfo *mtk_socinfop)
+{
+	unsigned int i = 0, j = 0;
+	unsigned int num_cell_data = 0;
+	u32 *cell_datap[MAX_CELLS] = { NULL };
+	size_t efuse_bytes;
+	struct nvmem_cell *cell;
+	bool match_socinfo = true;
+	int match_socinfo_index = -1;
+
+	for (i = 0; i < MAX_CELLS; i++) {
+		cell = nvmem_cell_get(mtk_socinfop->dev, cell_names[i]);
+		if (IS_ERR_OR_NULL(cell))
+			break;
+		cell_datap[i] = (u32 *)nvmem_cell_read(cell, &efuse_bytes);
+		nvmem_cell_put(cell);
+		num_cell_data++;
+	}
+
+	if (!num_cell_data)
+		return -ENOENT;
+
+	for (i = 0; i < ARRAY_SIZE(socinfo_data_table); i++) {
+		match_socinfo = true;
+		for (j = 0; j < num_cell_data; j++) {
+			if (*(cell_datap[j]) != socinfo_data_table[i].cell_data[j])
+				match_socinfo = false;
+		}
+		if (num_cell_data > 0 && match_socinfo) {
+			mtk_socinfop->socinfo_data = &(socinfo_data_table[i]);
+			match_socinfo_index = i;
+			break;
+		}
+	}
+
+	return match_socinfo_index >= 0 ? match_socinfo_index : -ENOENT;
+}
+
+static const struct of_device_id mtk_socinfo_id_table[] = {
+	{ .compatible = "mediatek,socinfo" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mtk_socinfo_id_table);
+
+static int mtk_socinfo_probe(struct platform_device *pdev)
+{
+	struct mtk_socinfo *mtk_socinfop;
+	int ret = 0;
+
+	mtk_socinfop = devm_kzalloc(&pdev->dev, sizeof(*mtk_socinfop), GFP_KERNEL);
+	if (!mtk_socinfop)
+		return -ENOMEM;
+
+	mtk_socinfop->dev = &pdev->dev;
+
+	ret = mtk_socinfo_get_socinfo_data(mtk_socinfop);
+	if (ret < 0)
+		return dev_err_probe(mtk_socinfop->dev, ret, "Failed to get socinfo data\n");
+
+	ret = mtk_socinfo_create_socinfo_node(mtk_socinfop);
+	if (ret != 0)
+		return dev_err_probe(mtk_socinfop->dev, -EINVAL, "Failed to create socinfo node\n");
+
+	return 0;
+}
+
+static int mtk_socinfo_remove(struct platform_device *pdev)
+{
+	if (soc_dev)
+		soc_device_unregister(soc_dev);
+	return 0;
+}
+
+static struct platform_driver mtk_socinfo = {
+	.probe          = mtk_socinfo_probe,
+	.remove         = mtk_socinfo_remove,
+	.driver         = {
+		.name   = "mtk_socinfo",
+		.owner  = THIS_MODULE,
+		.of_match_table = mtk_socinfo_id_table,
+	},
+};
+module_platform_driver(mtk_socinfo);
+MODULE_AUTHOR("William-TW LIN <william-tw.lin@mediatek.com>");
+MODULE_DESCRIPTION("Mediatek socinfo driver");
+MODULE_LICENSE("GPL");
-- 
2.18.0


