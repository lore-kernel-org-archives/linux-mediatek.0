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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CA9C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:31:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8036922482
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8036922482
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lBDwPe5aRtxpwvJN2lNov05mA6sWzu5YwjH61TN7LAs=; b=pY2pwU3bVDl0tbV5bF6NdRqux
	E4Nnbx0K5uhAXWwhB/ZBObXo19iQ9KmNYb/XNeMjgNielRctM8OY8AhLfjg9NJ3qRJxILshHO9TvU
	EJBxgpxSht2PthvhzE6OB3/7i/ytHMFO2I/7PvAfBOZIwz7yEH3Vscb8LxGbyYJke8+4YgRiBcHCI
	7rgkaG46b2urkeC75lpSdI3Ldic2ABukQPjRW5oi4AJzLaVZiw8zyXT1jGy7Ml2hIRQRB1LIv2L0L
	iPJjscd1+tMMldE93kCKO6uz/OM9VvhVb3NtiHo4aJwUe6HKg1KP1rkvV9eAm9rfDf1aBHSaVrJEn
	OHVQ8T3bw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyvPP-0005Jq-PX; Mon, 11 Jan 2021 11:30:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyvOt-000551-MD; Mon, 11 Jan 2021 11:30:21 +0000
X-UUID: a8d848114ffb4e26b81107eb3f8b9f25-20210111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wyNtEnXEyNJstsjaeH1Ug7jiWK9zZEkRHis4JC8LmPo=; 
 b=aTvF+QM42tPeZB73VCjnnvt2JFJeDBy3cnT3f9m0DhIU5jeKE4T44EDoaQ/2FLfUm65rsQcQq4GPPfM8AUlNLdLiairIxUkQjH3izfJa9Gjg5Ojr4/FJMti1XR7gTl5M0HbduX/KcJCzzSPW4XZozKhd5p+pvSwChxwrHW9H0Kk=;
X-UUID: a8d848114ffb4e26b81107eb3f8b9f25-20210111
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1697440358; Mon, 11 Jan 2021 03:30:14 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 03:23:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 19:23:36 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 19:23:35 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v6 27/33] iommu/mediatek: Add get_domain_id from
 dev->dma_range_map
Date: Mon, 11 Jan 2021 19:19:08 +0800
Message-ID: <20210111111914.22211-28-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_063019_986294_51E8C655 
X-CRM114-Status: GOOD (  21.42  )
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

Add a new interface _get_domain_id from dev->dma_range_map,
The iommu consumer device will use dma-ranges in dtsi node to indicate
its dma address region requirement. In this iommu driver, we will get
the requirement and decide which iova domain it should locate.

In the lastest SoC, there will be several iova-regions(domains), we will
compare and calculate which domain is right. If the start/end of device
requirement equal some region. it is best fit of course. If it is inside
some region, it is also ok. the iova requirement of a device should not
be inside two or more regions.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 42 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6875ca1225f0..8fc17158bc28 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/device.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-iommu.h>
 #include <linux/err.h>
 #include <linux/interrupt.h>
@@ -314,6 +315,36 @@ static irqreturn_t mtk_iommu_isr(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static int mtk_iommu_get_domain_id(struct device *dev,
+				   const struct mtk_iommu_plat_data *plat_data)
+{
+	const struct mtk_iommu_iova_region *rgn = plat_data->iova_region;
+	const struct bus_dma_region *dma_rgn = dev->dma_range_map;
+	int i, candidate = -1;
+	dma_addr_t dma_end;
+
+	if (!dma_rgn || plat_data->iova_region_nr == 1)
+		return 0;
+
+	dma_end = dma_rgn->dma_start + dma_rgn->size - 1;
+	for (i = 0; i < plat_data->iova_region_nr; i++, rgn++) {
+		/* Best fit. */
+		if (dma_rgn->dma_start == rgn->iova_base &&
+		    dma_end == rgn->iova_base + rgn->size - 1)
+			return i;
+		/* ok if it is inside this region. */
+		if (dma_rgn->dma_start >= rgn->iova_base &&
+		    dma_end < rgn->iova_base + rgn->size)
+			candidate = i;
+	}
+
+	if (candidate >= 0)
+		return candidate;
+	dev_err(dev, "Can NOT find the iommu domain id(%pad 0x%llx).\n",
+		&dma_rgn->dma_start, dma_rgn->size);
+	return -EINVAL;
+}
+
 static void mtk_iommu_config(struct mtk_iommu_data *data,
 			     struct device *dev, bool enable)
 {
@@ -400,11 +431,15 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	struct device *m4udev = data->dev;
-	int ret;
+	int ret, domid;
 
 	if (!data)
 		return -ENODEV;
 
+	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
+	if (domid < 0)
+		return domid;
+
 	if (!dom->data) {
 		if (mtk_iommu_domain_finalise(dom, data))
 			return -ENODEV;
@@ -534,10 +569,15 @@ static void mtk_iommu_release_device(struct device *dev)
 static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 {
 	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	int domid;
 
 	if (!data)
 		return ERR_PTR(-ENODEV);
 
+	domid = mtk_iommu_get_domain_id(dev, data->plat_data);
+	if (domid < 0)
+		return ERR_PTR(domid);
+
 	/* All the client devices are in the same m4u iommu-group */
 	if (!data->m4u_group) {
 		data->m4u_group = iommu_group_alloc();
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
