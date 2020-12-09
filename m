Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F085C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:15:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCDBB23B87
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCDBB23B87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tIX7GbTPCgAn8b6iQ0oy/JLvN+eZ9AGtgb9o7cklU10=; b=n06TF2zbWnI6ASx20mGfzJa8Z
	EyAY7lLjQHtVTLd/Jpji2kzZM3COHa8zzo9WPF708MnQoSQ2vd6Vofd4K8FNP19fpqCYpLKYo5uNm
	RAU3vspvMY56ue70LrOnXH6lTLXYz3Hxxy2TeMJng7f5O4GGtpRpJSr6GTdP4nqd6U5TRsi/x0LKZ
	R5dcZOZncGJEbiUQKdzMB7L1EnoBi7LMP7hpKa2vSTRkmvtbLXpTwlewworqtvxofbDnvBxsq/nyP
	Mq5Z1BdPEIm3WcwVRFYryMbTn8ZY1//waxJxkfMLZtLK6TloH8HOkLTfBLySiLUuvVa7uUuV95d4A
	5G3LIv1+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmudC-00005X-6Z; Wed, 09 Dec 2020 08:15:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuav-00072X-9z; Wed, 09 Dec 2020 08:13:06 +0000
X-UUID: 76efdd70c9274313846a5ad7e42b902e-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fYuur0G1K18nqSyOIr0jvLFb+rgNqxrVzLe74Ybwcig=; 
 b=b4SfSJgwTBaTH5XIOciGwCEjZwfRZlfili7btSgiZf6rdP76A31i1WSwvfsyjo2ol5DyL4hBKbQB7TjL50lKzFEOL71LvLk6tNde68/a/Y6ZuATTuUzdBbDCx3eaPnzgvy9Y5yd/sFBHgqaR/XSYUTpzfcwU9MZIEuc7ZcJF1TY=;
X-UUID: 76efdd70c9274313846a5ad7e42b902e-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 545922640; Wed, 09 Dec 2020 00:13:01 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:03:50 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:03:45 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:03:48 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 16/27] iommu/mediatek: Add device link for smi-common and
 m4u
Date: Wed, 9 Dec 2020 16:00:51 +0800
Message-ID: <20201209080102.26626-17-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_031305_628060_4D3511FA 
X-CRM114-Status: GOOD (  20.96  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the lastest SoC, M4U has its special power domain. thus, If the engine
begin to work, it should help enable the power for M4U firstly.
Currently if the engine work, it always enable the power/clocks for
smi-larbs/smi-common. This patch adds device_link for smi-common and M4U.
then, if smi-common power is enabled, the M4U power also is powered on
automatically.

Normally M4U connect with several smi-larbs and their smi-common always
are the same, In this patch it get smi-common dev from the first smi-larb
device(i==0), then add the device_link only while m4u has power-domain.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 30 ++++++++++++++++++++++++++++--
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 09c8c58feb78..5614015e5b96 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -20,6 +20,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
@@ -706,7 +707,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return larb_nr;
 
 	for (i = 0; i < larb_nr; i++) {
-		struct device_node *larbnode;
+		struct device_node *larbnode, *smicomm_node;
 		struct platform_device *plarbdev;
 		u32 id;
 
@@ -732,6 +733,26 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 
 		component_match_add_release(dev, &match, release_of,
 					    compare_of, larbnode);
+		if (i != 0)
+			continue;
+		smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+		if (!smicomm_node)
+			return -EINVAL;
+
+		plarbdev = of_find_device_by_node(smicomm_node);
+		of_node_put(smicomm_node);
+		data->smicomm_dev = &plarbdev->dev;
+	}
+
+	if (dev->pm_domain) {
+		struct device_link *link;
+
+		link = device_link_add(data->smicomm_dev, dev,
+				       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+		if (!link) {
+			dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+			return -EINVAL;
+		}
 	}
 
 	platform_set_drvdata(pdev, data);
@@ -739,7 +760,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
 				     "mtk-iommu.%pa", &ioaddr);
 	if (ret)
-		return ret;
+		goto out_link_remove;
 
 	iommu_device_set_ops(&data->iommu, &mtk_iommu_ops);
 	iommu_device_set_fwnode(&data->iommu, &pdev->dev.of_node->fwnode);
@@ -763,6 +784,9 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	iommu_device_unregister(&data->iommu);
 out_sysfs_remove:
 	iommu_device_sysfs_remove(&data->iommu);
+out_link_remove:
+	if (dev->pm_domain)
+		device_link_remove(data->smicomm_dev, dev);
 	return ret;
 }
 
@@ -777,6 +801,8 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 		bus_set_iommu(&platform_bus_type, NULL);
 
 	clk_disable_unprepare(data->bclk);
+	if (pdev->dev.pm_domain)
+		device_link_remove(data->smicomm_dev, &pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
 	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
 	return 0;
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index d0c93652bdbe..5e03a029c4dc 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -68,6 +68,7 @@ struct mtk_iommu_data {
 
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
+	struct device			*smicomm_dev;
 
 	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
