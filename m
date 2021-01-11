Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF72C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:31:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AB6C22482
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AB6C22482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XE7FyW4kjw2PdZqM6j+6f9dvLEbjMW09G4Vn8CNOGyI=; b=yasFbY5qsbTLBjtSKzT/SeAeV
	8AZ0Jav8cRpsfo7cdobDjwVlD3OjBoa7/8VD0dYO1xIEIV7zIX90oseZovx2ZdfIeGnitHfpp638A
	UrS2OGpDTuWnR6UFPeNSk1cPmqeOjEGvjdrEAxTwWJhMJiujIk6ZBc2SiRqN2JvQGn+8zrmBpmf9k
	z8Pw3Wz8NeuYccdg3OV8fptH2r1kblv9arWzz5xg87UFY83IhhieU1+I9ZjwYLR5SnTNJYrL42lvB
	+gfaUxP1O6ca4/hq1i6pP63hDNWvbnz5/cgAIG7savTRDGvo7KDfQWwWQ4OKARklcDdDlHEjRw7Uu
	O1Ymy0tuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvPm-0005Sh-0P; Mon, 11 Jan 2021 11:31:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvOv-000558-Jc; Mon, 11 Jan 2021 11:30:23 +0000
X-UUID: eb69fc9b74194e6b809e46e6ebd97dc3-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=2mqWjbKb2tO4U1smB/Jjm6F3zTI81Tjkixif5v1IMX4=; 
 b=dR7TSepZ+bsERBQktQj8kvRB6SJHbVdYzGDiWSqIXbarDxjkIio1beM8aHxVPtHXDvcjbF3EUg7K1xYo5J+vTWj6IxqqG0tGDix5PMAPM9sF5FfBlr4eDbUuPkFovtkOnp3BVDZQsXiddJ5qJdZzZwxHLU9uyHHI6d6YGEiU9cQ=;
X-UUID: eb69fc9b74194e6b809e46e6ebd97dc3-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 539126712; Mon, 11 Jan 2021 03:30:14 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:22:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:22:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:22:17 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 18/33] iommu/mediatek: Add device link for smi-common and
 m4u
Date: Mon, 11 Jan 2021 19:18:59 +0800
Message-ID: <20210111111914.22211-19-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063021_814462_B69B6987 
X-CRM114-Status: GOOD (  19.46  )
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
are the same, In this patch it get smi-common dev from the last smi-larb
device, then add the device_link.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 27 ++++++++++++++++++++++++---
 drivers/iommu/mtk_iommu.h |  1 +
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 189165e7a2ab..0fe7c1617dc3 100644
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
@@ -633,6 +634,9 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 {
 	struct mtk_iommu_data   *data;
 	struct device           *dev = &pdev->dev;
+	struct device_node	*larbnode, *smicomm_node;
+	struct platform_device	*plarbdev;
+	struct device_link	*link;
 	struct resource         *res;
 	resource_size_t		ioaddr;
 	struct component_match  *match = NULL;
@@ -699,8 +703,6 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		return larb_nr;
 
 	for (i = 0; i < larb_nr; i++) {
-		struct device_node *larbnode;
-		struct platform_device *plarbdev;
 		u32 id;
 
 		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
@@ -727,12 +729,28 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 					    compare_of, larbnode);
 	}
 
+	/* Get smi-common dev from the last larb. */
+	smicomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
+	if (!smicomm_node)
+		return -EINVAL;
+
+	plarbdev = of_find_device_by_node(smicomm_node);
+	of_node_put(smicomm_node);
+	data->smicomm_dev = &plarbdev->dev;
+
+	link = device_link_add(data->smicomm_dev, dev,
+			DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
+	if (!link) {
+		dev_err(dev, "Unable link %s.\n", dev_name(data->smicomm_dev));
+		return -EINVAL;
+	}
+
 	platform_set_drvdata(pdev, data);
 
 	ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
 				     "mtk-iommu.%pa", &ioaddr);
 	if (ret)
-		return ret;
+		goto out_link_remove;
 
 	iommu_device_set_ops(&data->iommu, &mtk_iommu_ops);
 	iommu_device_set_fwnode(&data->iommu, &pdev->dev.of_node->fwnode);
@@ -762,6 +780,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 	iommu_device_unregister(&data->iommu);
 out_sysfs_remove:
 	iommu_device_sysfs_remove(&data->iommu);
+out_link_remove:
+	device_link_remove(data->smicomm_dev, dev);
 	return ret;
 }
 
@@ -776,6 +796,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 		bus_set_iommu(&platform_bus_type, NULL);
 
 	clk_disable_unprepare(data->bclk);
+	device_link_remove(data->smicomm_dev, &pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
 	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
 	return 0;
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index c1584dea66cb..a9b79e118f02 100644
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
