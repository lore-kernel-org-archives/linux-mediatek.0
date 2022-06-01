Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60D2C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sgq+2V2cePP/3l647Cp9K9TNVY0STgjzNE3ZAYRvOzg=; b=OPMfBrmSOhqYjE
	L+NZGSPIg0CuIL1G0ACEO68jn+g+SpJOAGmLP+KCVHk0dN+JdgG6HM0BXsqhRxqd8fRpqCTjrENbK
	VL8tFyYPRX0Y5Am0dMO0kcxROh2lmCqh0rvfUID6Aa3Bq3HoHBvhbqW4dQUboqAo3QVRV1RkLnSJy
	Wt8jqPpaUOyQHMc3mjDmLzuhTL39kVlPzp91klUwjxTyKUSISy60JtY37MMijZmKuxEb2Abt6Gw1M
	ZoMNF1Mry5HDfXbKUolmeRI3Tr1JJZ9f5Seh5z2g/XJnLKvY0aXC0JhK3UyDSf9BFxgjmunj56t8Y
	zmPB+N4mVOOzYvhhlCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMbw-00Fe7W-DJ; Wed, 01 Jun 2022 11:34:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaJ-00FdFA-2e; Wed, 01 Jun 2022 11:32:20 +0000
X-UUID: cf823a8fea4b4d3ea567ca7dfb78801e-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:37d7062b-bd72-48b5-ab75-694428d97f7e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:c1ac8f14-f88c-475e-badf-d9ee54230b8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: cf823a8fea4b4d3ea567ca7dfb78801e-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1791369835; Wed, 01 Jun 2022 04:32:09 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:04 +0800
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
Subject: [PATCH v1 05/15] remoteproc: mediatek: Add SCP core 1 driver for dual-core scp
Date: Wed, 1 Jun 2022 19:21:51 +0800
Message-ID: <20220601112201.15510-6-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043219_187682_041B5049 
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

MT8195 SCP is a dual-core processor. The mtk_scp.c driver only controls
SCP core 0. This patch adds a basic driver to control the another core.

Core 1 and core 0 of the SCP are housed in the same subsys.They see
registers and memory in the same way.

Core 1 of the SCP features its own set of core configuration registers,
interrupt controller, timers, and DMAs. The rest of the peripherals
in this subsystem are shared by core 0 and core 1.

As for memory, core 1 has its own cache memory, and the SCP SRAM is shared
by core 0 and core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/Makefile       |  1 +
 drivers/remoteproc/mtk_scp_dual.c | 97 +++++++++++++++++++++++++++++++
 2 files changed, 98 insertions(+)
 create mode 100644 drivers/remoteproc/mtk_scp_dual.c

diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 5478c7cb9e07..84cb687d28da 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_IMX_REMOTEPROC)		+= imx_rproc.o
 obj-$(CONFIG_IMX_DSP_REMOTEPROC)	+= imx_dsp_rproc.o
 obj-$(CONFIG_INGENIC_VPU_RPROC)		+= ingenic_rproc.o
 obj-$(CONFIG_MTK_SCP)			+= mtk_scp.o mtk_scp_ipi.o
+obj-$(CONFIG_MTK_SCP_DUALCORE)		+= mtk_scp_dual.o
 obj-$(CONFIG_OMAP_REMOTEPROC)		+= omap_remoteproc.o
 obj-$(CONFIG_WKUP_M3_RPROC)		+= wkup_m3_rproc.o
 obj-$(CONFIG_DA8XX_REMOTEPROC)		+= da8xx_remoteproc.o
diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
new file mode 100644
index 000000000000..7bc08d26f208
--- /dev/null
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+
+#include "mtk_common.h"
+#include "remoteproc_internal.h"
+
+static const struct rproc_ops scp_ops;
+
+static int scp_dual_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct mtk_scp *scp;
+	struct rproc *rproc;
+	const char *fw_name = "scp-dual.img";
+	int ret, i;
+	struct resource *res;
+
+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
+	rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
+	if (!rproc) {
+		dev_err(dev, "unable to allocate remoteproc\n");
+		return -ENOMEM;
+	}
+
+	scp = (struct mtk_scp *)rproc->priv;
+	scp->rproc = rproc;
+	scp->dev = dev;
+	platform_set_drvdata(pdev, scp);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	scp->sram_base = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(scp->sram_base))
+		return dev_err_probe(dev, PTR_ERR(scp->sram_base),
+				     "Failed to parse and map sram memory\n");
+
+	scp->sram_size = resource_size(res);
+	scp->sram_phys = res->start;
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	scp->reg_base = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(scp->reg_base))
+		return dev_err_probe(dev, PTR_ERR(scp->reg_base),
+				     "Failed to parse and map cfg memory\n");
+
+	mutex_init(&scp->send_lock);
+	for (i = 0; i < SCP_IPI_MAX; i++)
+		mutex_init(&scp->ipi_desc[i].lock);
+
+	init_waitqueue_head(&scp->run.wq);
+	init_waitqueue_head(&scp->ack_wq);
+
+	return 0;
+}
+
+static int scp_dual_remove(struct platform_device *pdev)
+{
+	struct mtk_scp *scp = platform_get_drvdata(pdev);
+	int i;
+
+	for (i = 0; i < SCP_IPI_MAX; i++)
+		mutex_destroy(&scp->ipi_desc[i].lock);
+	mutex_destroy(&scp->send_lock);
+
+	return 0;
+}
+
+static const struct of_device_id mtk_scp_dual_of_match[] = {
+	{ .compatible = "mediatek,mt8195-scp-dual" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_scp_dual_of_match);
+
+static struct platform_driver mtk_scp_dual_driver = {
+	.probe = scp_dual_probe,
+	.remove = scp_dual_remove,
+	.driver = {
+		.name = "mtk-scp-dual",
+		.of_match_table = mtk_scp_dual_of_match,
+	},
+};
+
+module_platform_driver(mtk_scp_dual_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("MediaTek SCP dualcore control driver");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
