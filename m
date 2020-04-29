Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 695D7C8300A
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E78F206D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cOuJcq9Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E78F206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IxQuH351XsZ0LC9aZFKz8KMSea4W9ho4QcAHSJUeB/Y=; b=cOuJcq9Q7mi2bEJxIsrhym56TV
	2KO45g56erqmJO3tgEs1acLNvzAzc/WhDA01X1Ce7FGGi9mKMLh3Ql6CbH6ClYV34dMviP9H/Yu+Y
	TlSu0I/OsnOk3kh9MObZGwIeLw6btPpLkuXis1KukKgabDy2ItjQL4XGBsd1XkLUEAHxeDYjdwErv
	bBrtx/coJIHguR101XXt+dFbBtRmrx2blw8B7HaZZSSQcrIsacbsuX1lU6IWxtMY1UTOsf0SiKuMs
	9YW7mVsEs2UjPmbCerJ8Jefd3Enyd5cjM+vjGyqSupc+rSWHBsAGzhi5UthwjcJCcyyuu4C+k4x59
	3dRsQCRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmw0-0000Ho-38; Wed, 29 Apr 2020 13:39:32 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuQ-0006OA-2A; Wed, 29 Apr 2020 13:37:59 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D7F8BF09; Wed, 29 Apr 2020 15:37:40 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH v3 29/34] iommu/omap: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:37:07 +0200
Message-Id: <20200429133712.31431-30-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063754_531481_7E79D11F 
X-CRM114-Status: GOOD (  15.39  )
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

Convert the OMAP IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/omap-iommu.c | 49 ++++++++++----------------------------
 1 file changed, 13 insertions(+), 36 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index ecc9d0829a91..6699fe6d9e06 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1640,15 +1640,13 @@ static phys_addr_t omap_iommu_iova_to_phys(struct iommu_domain *domain,
 	return ret;
 }
 
-static int omap_iommu_add_device(struct device *dev)
+static struct iommu_device *omap_iommu_probe_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data, *tmp;
+	struct platform_device *pdev;
 	struct omap_iommu *oiommu;
-	struct iommu_group *group;
 	struct device_node *np;
-	struct platform_device *pdev;
 	int num_iommus, i;
-	int ret;
 
 	/*
 	 * Allocate the archdata iommu structure for DT-based devices.
@@ -1657,7 +1655,7 @@ static int omap_iommu_add_device(struct device *dev)
 	 * IOMMU users.
 	 */
 	if (!dev->of_node)
-		return 0;
+		return ERR_PTR(-ENODEV);
 
 	/*
 	 * retrieve the count of IOMMU nodes using phandle size as element size
@@ -1670,27 +1668,27 @@ static int omap_iommu_add_device(struct device *dev)
 
 	arch_data = kcalloc(num_iommus + 1, sizeof(*arch_data), GFP_KERNEL);
 	if (!arch_data)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	for (i = 0, tmp = arch_data; i < num_iommus; i++, tmp++) {
 		np = of_parse_phandle(dev->of_node, "iommus", i);
 		if (!np) {
 			kfree(arch_data);
-			return -EINVAL;
+			return ERR_PTR(-EINVAL);
 		}
 
 		pdev = of_find_device_by_node(np);
 		if (!pdev) {
 			of_node_put(np);
 			kfree(arch_data);
-			return -ENODEV;
+			return ERR_PTR(-ENODEV);
 		}
 
 		oiommu = platform_get_drvdata(pdev);
 		if (!oiommu) {
 			of_node_put(np);
 			kfree(arch_data);
-			return -EINVAL;
+			return ERR_PTR(-EINVAL);
 		}
 
 		tmp->iommu_dev = oiommu;
@@ -1699,46 +1697,25 @@ static int omap_iommu_add_device(struct device *dev)
 		of_node_put(np);
 	}
 
+	dev->archdata.iommu = arch_data;
+
 	/*
 	 * use the first IOMMU alone for the sysfs device linking.
 	 * TODO: Evaluate if a single iommu_group needs to be
 	 * maintained for both IOMMUs
 	 */
 	oiommu = arch_data->iommu_dev;
-	ret = iommu_device_link(&oiommu->iommu, dev);
-	if (ret) {
-		kfree(arch_data);
-		return ret;
-	}
-
-	dev->archdata.iommu = arch_data;
-
-	/*
-	 * IOMMU group initialization calls into omap_iommu_device_group, which
-	 * needs a valid dev->archdata.iommu pointer
-	 */
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		iommu_device_unlink(&oiommu->iommu, dev);
-		dev->archdata.iommu = NULL;
-		kfree(arch_data);
-		return PTR_ERR(group);
-	}
-	iommu_group_put(group);
 
-	return 0;
+	return &oiommu->iommu;
 }
 
-static void omap_iommu_remove_device(struct device *dev)
+static void omap_iommu_release_device(struct device *dev)
 {
 	struct omap_iommu_arch_data *arch_data = dev->archdata.iommu;
 
 	if (!dev->of_node || !arch_data)
 		return;
 
-	iommu_device_unlink(&arch_data->iommu_dev->iommu, dev);
-	iommu_group_remove_device(dev);
-
 	dev->archdata.iommu = NULL;
 	kfree(arch_data);
 
@@ -1763,8 +1740,8 @@ static const struct iommu_ops omap_iommu_ops = {
 	.map		= omap_iommu_map,
 	.unmap		= omap_iommu_unmap,
 	.iova_to_phys	= omap_iommu_iova_to_phys,
-	.add_device	= omap_iommu_add_device,
-	.remove_device	= omap_iommu_remove_device,
+	.probe_device	= omap_iommu_probe_device,
+	.release_device	= omap_iommu_release_device,
 	.device_group	= omap_iommu_device_group,
 	.pgsize_bitmap	= OMAP_IOMMU_PGSIZES,
 };
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
