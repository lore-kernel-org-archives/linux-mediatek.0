Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DF8CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4U2yVirZlPUY4JSnDa9/g9eGeYV+d8Th1oxF5s9EPo=; b=ZPxoe68CvNz9/h
	LxR4inyiq5aozvWy5g739tGOuDUGuzKVlrgXA0CiOlMsglg7bKqzXq7hBDB8Y+Lf/9wRak/BO93LC
	5PLXIBx078AMP+cqFpZj2H+vTufmINlZR9BixQykKhrHByU8ylG0t7itWfNBLVq0K7aFUBIJL4wac
	ehwRyuSdOhLjYSb+uCSo80XPb4FdrkHM15r2iD4U8kQBiQ5i6AgrHG9R0ZA41N123FQ+Jn8m78C59
	SRT/kDCa1EjI3BiXJ3RDaFKc+C8v91WZUIh0PtahWBFMqd9HEcMPltURapGqMWO7P229CMrD+PU/q
	QbYAPXmV8iZRM0IxoZfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMbY-00Fdqf-LM; Wed, 01 Jun 2022 11:33:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaE-00FdCB-Gd; Wed, 01 Jun 2022 11:32:16 +0000
X-UUID: 5d8642c37fd94775821333b786cbbe00-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c3512885-2682-4038-944e-847a7ac2d61d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:9eac8f14-f88c-475e-badf-d9ee54230b8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 5d8642c37fd94775821333b786cbbe00-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 653609552; Wed, 01 Jun 2022 04:32:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:10 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:06 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 12/15] remoteproc: mediatek: Add SCP core 1 as a rproc subdevice
Date: Wed, 1 Jun 2022 19:21:58 +0800
Message-ID: <20220601112201.15510-13-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043214_587366_0BD4F126 
X-CRM114-Status: GOOD (  23.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Because the clock and SRAM power is controlled by SCP core 0, SCP core 1
has to be boot after SCP core 0. We use the rproc subdev to achieve this
purpose.

The watchdog timeout handler of SCP core 1 is added as part of the rproc
subdevice. This allows SCP core 0 to handle watchdog timeout coming from
SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/Makefile         |   2 +-
 drivers/remoteproc/mtk_common.h     |  12 +++
 drivers/remoteproc/mtk_scp.c        |  32 +++++++
 drivers/remoteproc/mtk_scp_dual.c   |   8 ++
 drivers/remoteproc/mtk_scp_subdev.c | 130 ++++++++++++++++++++++++++++
 5 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 drivers/remoteproc/mtk_scp_subdev.c

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 84cb687d28da..97f729f7c4ae 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -15,7 +15,7 @@ obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
-obj-$(CONFIG_MTK_SCP_DUALCORE)		+= mtk_scp_dual.o
+obj-$(CONFIG_MTK_SCP_DUALCORE)		+= mtk_scp_dual.o mtk_scp_subdev.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 7b363411ec99..a5c26e56277d 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -99,6 +99,14 @@ struct scp_ipi_desc {
 	void *priv;
 };
 
+struct scp_subdev_core {
+	struct rproc_subdev subdev;
+	struct mtk_scp *main_scp;
+	void (*scp_dual_wdt_timeout)(struct mtk_scp *scp, u32 scp_to_host);
+};
+
+#define to_subdev_core(d) container_of(d, struct scp_subdev_core, subdev)
+
 struct mtk_scp;
 
 struct mtk_scp_of_data {
@@ -144,6 +152,7 @@ struct mtk_scp {
 	size_t dram_size;
 
 	struct rproc_subdev *rpmsg_subdev;
+	struct rproc_subdev *dual_subdev;
 };
 
 /**
@@ -172,4 +181,7 @@ int scp_map_memory_region(struct mtk_scp *scp);
 void scp_unmap_memory_region(struct mtk_scp *scp);
 irqreturn_t scp_irq_handler(int irq, void *priv);
 void scp_ipi_handler(struct mtk_scp *scp);
+
+struct rproc_subdev *scp_dual_create_subdev(struct mtk_scp *scp);
+void scp_dual_destroy_subdev(struct rproc_subdev *subdev);
 #endif
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 55bc4e9d1a6f..c7bf0a44ba0d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -231,6 +231,13 @@ static void mt8195_scp_irq_handler(struct mtk_scp *scp)
 	} else {
 		if (readl(scp->reg_base + MT8195_SYS_STATUS) & MT8195_CORE1_WDT) {
 			writel(1, scp->reg_base + MT8195_CORE1_WDT_IRQ);
+
+			if (scp->dual_subdev) {
+				struct scp_subdev_core *subdev_core;
+
+				subdev_core = to_subdev_core(scp->dual_subdev);
+				subdev_core->scp_dual_wdt_timeout(scp, scp_to_host);
+			}
 		} else {
 			writel(1, scp->reg_base + MT8192_CORE0_WDT_IRQ);
 			scp_wdt_handler(scp, scp_to_host);
@@ -836,6 +843,27 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 	}
 }
 
+static void scp_add_dual_subdev(struct mtk_scp *scp)
+{
+#if IS_ENABLED(CONFIG_MTK_SCP_DUALCORE)
+	scp->dual_subdev = scp_dual_create_subdev(scp);
+
+	if (scp->dual_subdev)
+		rproc_add_subdev(scp->rproc, scp->dual_subdev);
+#endif
+}
+
+static void scp_remove_dual_subdev(struct mtk_scp *scp)
+{
+#if IS_ENABLED(CONFIG_MTK_SCP_DUALCORE)
+	if (scp->dual_subdev) {
+		rproc_remove_subdev(scp->rproc, scp->dual_subdev);
+		scp_dual_destroy_subdev(scp->dual_subdev);
+		scp->dual_subdev = NULL;
+	}
+#endif
+}
+
 static int scp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -911,6 +939,8 @@ static int scp_probe(struct platform_device *pdev)
 
 	scp_add_rpmsg_subdev(scp);
 
+	scp_add_dual_subdev(scp);
+
 	ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0), NULL,
 					scp_irq_handler, IRQF_ONESHOT,
 					pdev->name, scp);
@@ -927,6 +957,7 @@ static int scp_probe(struct platform_device *pdev)
 	return 0;
 
 remove_subdev:
+	scp_remove_dual_subdev(scp);
 	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 release_dev_mem:
@@ -944,6 +975,7 @@ static int scp_remove(struct platform_device *pdev)
 	int i;
 
 	rproc_del(scp->rproc);
+	scp_remove_dual_subdev(scp);
 	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 	scp_unmap_memory_region(scp);
diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
index 4e8d7f5cdad6..90c49716dd39 100644
--- a/drivers/remoteproc/mtk_scp_dual.c
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -258,6 +258,14 @@ static int scp_dual_probe(struct platform_device *pdev)
 		goto remove_ipi;
 	}
 
+	/* disable auto boot before register rproc.
+	 * it's booted as a subdevice of scp core 0.
+	 */
+	rproc->auto_boot = false;
+	ret = devm_rproc_add(dev, rproc);
+	if (ret)
+		goto remove_ipi;
+
 	return 0;
 
 remove_ipi:
diff --git a/drivers/remoteproc/mtk_scp_subdev.c b/drivers/remoteproc/mtk_scp_subdev.c
new file mode 100644
index 000000000000..197fb207c756
--- /dev/null
+++ b/drivers/remoteproc/mtk_scp_subdev.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "mtk_common.h"
+
+#define SCP_MAIN_CORE 0
+#define SCP_DTS_CORE_ID 0
+#define SCP_DTS_CORE_REF 1
+
+static struct mtk_scp *scp_dual_get(struct mtk_scp *scp)
+{
+	struct device *dev = scp->dev;
+	struct device_node *np;
+	struct platform_device *dual_pdev;
+
+	np = of_parse_phandle(dev->of_node, "mediatek,scp-core", SCP_DTS_CORE_REF);
+	dual_pdev = of_find_device_by_node(np);
+	of_node_put(np);
+
+	if (!dual_pdev) {
+		dev_err(dev, "No scp-dual pdev\n");
+		return NULL;
+	}
+
+	return platform_get_drvdata(dual_pdev);
+}
+
+static void scp_dual_put(struct mtk_scp *scp)
+{
+	put_device(scp->dev);
+}
+
+static int scp_dual_rproc_start(struct rproc_subdev *subdev)
+{
+	struct scp_subdev_core *subdev_core = to_subdev_core(subdev);
+	struct mtk_scp *scp_dual;
+
+	scp_dual = scp_dual_get(subdev_core->main_scp);
+	if (!scp_dual)
+		return -ENODEV;
+
+	rproc_boot(scp_dual->rproc);
+	scp_dual_put(scp_dual);
+
+	return 0;
+}
+
+static void scp_dual_rproc_stop(struct rproc_subdev *subdev, bool crashed)
+{
+	struct scp_subdev_core *subdev_core = to_subdev_core(subdev);
+	struct mtk_scp *scp_dual;
+
+	scp_dual = scp_dual_get(subdev_core->main_scp);
+	if (!scp_dual)
+		return;
+
+	rproc_shutdown(scp_dual->rproc);
+	scp_dual_put(scp_dual);
+}
+
+static void scp_dual_wdt_handler(struct mtk_scp *scp, u32 scp_to_host)
+{
+	struct mtk_scp *scp_dual;
+
+	scp_dual = scp_dual_get(scp);
+	if (!scp_dual)
+		return;
+
+	dev_err(scp_dual->dev, "SCP watchdog timeout! 0x%x\n", scp_to_host);
+	rproc_report_crash(scp_dual->rproc, RPROC_WATCHDOG);
+	scp_dual_put(scp_dual);
+}
+
+struct rproc_subdev *scp_dual_create_subdev(struct mtk_scp *scp)
+{
+	struct device *dev = scp->dev;
+	struct scp_subdev_core *subdev_core;
+	struct device_node *np;
+	int ret, core_id;
+
+	ret = of_property_read_u32_index(dev->of_node, "mediatek,scp-core", SCP_DTS_CORE_ID,
+					 &core_id);
+	if (ret < 0) {
+		dev_warn(dev, "No SCP core id\n");
+		return NULL;
+	}
+
+	if (core_id != SCP_MAIN_CORE) {
+		dev_dbg(dev, "SCP core id %d\n", core_id);
+		return NULL;
+	}
+
+	np = of_parse_phandle(dev->of_node, "mediatek,scp-core", SCP_DTS_CORE_REF);
+	if (!np) {
+		dev_err(dev, "Invalid mediatek,scp-core phandle\n");
+		return NULL;
+	}
+	of_node_put(np);
+
+	subdev_core = devm_kzalloc(dev, sizeof(*subdev_core), GFP_KERNEL);
+	if (!subdev_core)
+		return NULL;
+
+	subdev_core->main_scp = scp;
+	subdev_core->scp_dual_wdt_timeout = scp_dual_wdt_handler;
+	subdev_core->subdev.start = scp_dual_rproc_start;
+	subdev_core->subdev.stop = scp_dual_rproc_stop;
+
+	return &subdev_core->subdev;
+}
+EXPORT_SYMBOL_GPL(scp_dual_create_subdev);
+
+void scp_dual_destroy_subdev(struct rproc_subdev *subdev)
+{
+	struct scp_subdev_core *subdev_core = to_subdev_core(subdev);
+
+	devm_kfree(subdev_core->main_scp->dev, subdev_core);
+}
+EXPORT_SYMBOL_GPL(scp_dual_destroy_subdev);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek scp dual core subdev interface");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
