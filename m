Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE14C83006
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41AB7206D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dbqLbr3b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41AB7206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=IR1132cTu1CyzUq6lOdciJbI6KsSV1kCIm7RelS5nv8=; b=dbqLbr3bbz7ShLvjnVRJGgixdf
	cmtFR1aBOm7isMn31Z/Ubp8JyAn6Y025aKBixNbivrvui1CC0prmw+gb7FJd55rwkWi/b261ePLsE
	6khS7aVBjr4BS3ZZCw0/+Ch/CJNzzLhMSTIl/f16rNR4JpnCkf7ABf51jqBu0IDGlbg2Uot0ijc/n
	qFP0FiafyEwUgb5V1yRDaxjBg3dtwGM/+LpW/CjTLWn6mRTLt0yfoO2rHZo1GDNQiM5i2Nd6h6D7V
	vEIBRt8bLZCwODiYl12dJ3FttPGmmqhWr9gMEGUHoo80Jz0APm9qIVuGwJbDbT5xEqpIi/GHqGozE
	afiA8KtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmvL-0007pP-Tf; Wed, 29 Apr 2020 13:38:51 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuK-0006H3-4h; Wed, 29 Apr 2020 13:37:53 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 180F1E92; Wed, 29 Apr 2020 15:37:38 +0200 (CEST)
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
Subject: [PATCH v3 15/34] iommu/amd: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:36:53 +0200
Message-Id: <20200429133712.31431-16-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063748_343321_11479E9F 
X-CRM114-Status: GOOD (  17.35  )
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

Convert the AMD IOMMU Driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd_iommu.c | 71 ++++++++++++---------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 0b4b4faa876d..c30367413683 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -343,21 +343,9 @@ static bool check_device(struct device *dev)
 	return true;
 }
 
-static void init_iommu_group(struct device *dev)
-{
-	struct iommu_group *group;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return;
-
-	iommu_group_put(group);
-}
-
 static int iommu_init_device(struct device *dev)
 {
 	struct iommu_dev_data *dev_data;
-	struct amd_iommu *iommu;
 	int devid;
 
 	if (dev->archdata.iommu)
@@ -367,8 +355,6 @@ static int iommu_init_device(struct device *dev)
 	if (devid < 0)
 		return devid;
 
-	iommu = amd_iommu_rlookup_table[devid];
-
 	dev_data = find_dev_data(devid);
 	if (!dev_data)
 		return -ENOMEM;
@@ -391,8 +377,6 @@ static int iommu_init_device(struct device *dev)
 
 	dev->archdata.iommu = dev_data;
 
-	iommu_device_link(&iommu->iommu, dev);
-
 	return 0;
 }
 
@@ -410,7 +394,7 @@ static void iommu_ignore_device(struct device *dev)
 	setup_aliases(dev);
 }
 
-static void iommu_uninit_device(struct device *dev)
+static void amd_iommu_uninit_device(struct device *dev)
 {
 	struct iommu_dev_data *dev_data;
 	struct amd_iommu *iommu;
@@ -429,13 +413,6 @@ static void iommu_uninit_device(struct device *dev)
 	if (dev_data->domain)
 		detach_device(dev);
 
-	iommu_device_unlink(&iommu->iommu, dev);
-
-	iommu_group_remove_device(dev);
-
-	/* Remove dma-ops */
-	dev->dma_ops = NULL;
-
 	/*
 	 * We keep dev_data around for unplugged devices and reuse it when the
 	 * device is re-plugged - not doing so would introduce a ton of races.
@@ -2152,55 +2129,50 @@ static void detach_device(struct device *dev)
 	spin_unlock_irqrestore(&domain->lock, flags);
 }
 
-static int amd_iommu_add_device(struct device *dev)
+static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 {
-	struct iommu_dev_data *dev_data;
-	struct iommu_domain *domain;
+	struct iommu_device *iommu_dev;
 	struct amd_iommu *iommu;
 	int ret, devid;
 
-	if (get_dev_data(dev))
-		return 0;
-
 	if (!check_device(dev))
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	devid = get_device_id(dev);
 	if (devid < 0)
-		return devid;
+		return ERR_PTR(devid);
 
 	iommu = amd_iommu_rlookup_table[devid];
 
+	if (get_dev_data(dev))
+		return &iommu->iommu;
+
 	ret = iommu_init_device(dev);
 	if (ret) {
 		if (ret != -ENOTSUPP)
 			dev_err(dev, "Failed to initialize - trying to proceed anyway\n");
-
+		iommu_dev = ERR_PTR(ret);
 		iommu_ignore_device(dev);
-		dev->dma_ops = NULL;
-		goto out;
+	} else {
+		iommu_dev = &iommu->iommu;
 	}
-	init_iommu_group(dev);
 
-	dev_data = get_dev_data(dev);
+	iommu_completion_wait(iommu);
 
-	BUG_ON(!dev_data);
+	return iommu_dev;
+}
 
-	if (dev_data->iommu_v2)
-		iommu_request_dm_for_dev(dev);
+static void amd_iommu_probe_finalize(struct device *dev)
+{
+	struct iommu_domain *domain;
 
 	/* Domains are initialized for this device - have a look what we ended up with */
 	domain = iommu_get_domain_for_dev(dev);
 	if (domain->type == IOMMU_DOMAIN_DMA)
 		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, 0);
-
-out:
-	iommu_completion_wait(iommu);
-
-	return 0;
 }
 
-static void amd_iommu_remove_device(struct device *dev)
+static void amd_iommu_release_device(struct device *dev)
 {
 	struct amd_iommu *iommu;
 	int devid;
@@ -2214,7 +2186,7 @@ static void amd_iommu_remove_device(struct device *dev)
 
 	iommu = amd_iommu_rlookup_table[devid];
 
-	iommu_uninit_device(dev);
+	amd_iommu_uninit_device(dev);
 	iommu_completion_wait(iommu);
 }
 
@@ -2687,8 +2659,9 @@ const struct iommu_ops amd_iommu_ops = {
 	.map = amd_iommu_map,
 	.unmap = amd_iommu_unmap,
 	.iova_to_phys = amd_iommu_iova_to_phys,
-	.add_device = amd_iommu_add_device,
-	.remove_device = amd_iommu_remove_device,
+	.probe_device = amd_iommu_probe_device,
+	.release_device = amd_iommu_release_device,
+	.probe_finalize = amd_iommu_probe_finalize,
 	.device_group = amd_iommu_device_group,
 	.domain_get_attr = amd_iommu_domain_get_attr,
 	.get_resv_regions = amd_iommu_get_resv_regions,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
