Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36975C3815B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAD682076E
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hp4Lb5yU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAD682076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HCwTKIqnKWldGjqaaWmXRNh6CCft8DVWVjdW6n54ICo=; b=hp4Lb5yUpOc0HpQDX9kFUM2tDw
	QPgTZY8QOvziBIWNexHi4v4rUpU3zYXMGn4VvPuUPMkQPgjBpHSjSTxL4Kf1WiLLMeQoP7YKpAgyv
	JP23BEdaCZzN/zWVYr5PpCzhxuoO89an6dZXIApVw2KDjxuuVyC9cPTKXfDudKJTMbAdJ7gSqV3uz
	w9y5p/MN5f7SnOpDF7HNs26x0GCHmTvBOYNT7RgJBh2uBGq2GGHmt0oMNZCyhndKSs5kg2Jli6+NC
	N84DFzWdk/DoHb97Ev9oF/bHMhwXsXNziXHbYjl2k6xGTxp3kP+9g5yPKcS3UnMVD8rCo3oGpyuym
	ka//gzhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLt8A-0008RO-TU; Tue, 07 Apr 2020 18:39:26 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt6t-0006oe-IR; Tue, 07 Apr 2020 18:38:13 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CC628491; Tue,  7 Apr 2020 20:37:51 +0200 (CEST)
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
Subject: [RFC PATCH 18/34] iommu/arm-smmu: Convert to probe/release_device()
 call-backs
Date: Tue,  7 Apr 2020 20:37:26 +0200
Message-Id: <20200407183742.4344-19-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_113807_949844_0CABC8AC 
X-CRM114-Status: GOOD (  16.46  )
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
 virtualization@lists.linux-foundation.org, linux-rockchip@lists.infradead.org,
 iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

Convert the arm-smmu and arm-smmu-v3 drivers to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code does the
group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/arm-smmu-v3.c | 42 +++++++++----------------------------
 drivers/iommu/arm-smmu.c    | 30 ++++++++------------------
 2 files changed, 19 insertions(+), 53 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 82508730feb7..7d3c38e088d7 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2914,27 +2914,26 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 
 static struct iommu_ops arm_smmu_ops;
 
-static int arm_smmu_add_device(struct device *dev)
+static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	int i, ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct iommu_group *group;
 
 	if (!fwspec || fwspec->ops != &arm_smmu_ops)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
-		return -EBUSY;
+		return ERR_PTR(-EBUSY);
 
 	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
 	if (!smmu)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	master = kzalloc(sizeof(*master), GFP_KERNEL);
 	if (!master)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	master->dev = dev;
 	master->smmu = smmu;
@@ -2971,34 +2970,15 @@ static int arm_smmu_add_device(struct device *dev)
 	 */
 	arm_smmu_enable_pasid(master);
 
-	if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
-		master->ssid_bits = min_t(u8, master->ssid_bits,
-					  CTXDESC_LINEAR_CDMAX);
-
-	ret = iommu_device_link(&smmu->iommu, dev);
-	if (ret)
-		goto err_disable_pasid;
-
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto err_unlink;
-	}
-
-	iommu_group_put(group);
-	return 0;
+	return &smmu->iommu;
 
-err_unlink:
-	iommu_device_unlink(&smmu->iommu, dev);
-err_disable_pasid:
-	arm_smmu_disable_pasid(master);
 err_free_master:
 	kfree(master);
 	dev_iommu_priv_set(dev, NULL);
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static void arm_smmu_remove_device(struct device *dev)
+static void arm_smmu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_master *master;
@@ -3010,8 +2990,6 @@ static void arm_smmu_remove_device(struct device *dev)
 	master = dev_iommu_priv_get(dev);
 	smmu = master->smmu;
 	arm_smmu_detach_dev(master);
-	iommu_group_remove_device(dev);
-	iommu_device_unlink(&smmu->iommu, dev);
 	arm_smmu_disable_pasid(master);
 	kfree(master);
 	iommu_fwspec_free(dev);
@@ -3138,8 +3116,8 @@ static struct iommu_ops arm_smmu_ops = {
 	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 	.iotlb_sync		= arm_smmu_iotlb_sync,
 	.iova_to_phys		= arm_smmu_iova_to_phys,
-	.add_device		= arm_smmu_add_device,
-	.remove_device		= arm_smmu_remove_device,
+	.probe_device		= arm_smmu_probe_device,
+	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
 	.domain_get_attr	= arm_smmu_domain_get_attr,
 	.domain_set_attr	= arm_smmu_domain_set_attr,
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 3493501d8b2c..7b13b2371ad2 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -220,7 +220,7 @@ static int arm_smmu_register_legacy_master(struct device *dev,
  * With the legacy DT binding in play, we have no guarantees about
  * probe order, but then we're also not doing default domains, so we can
  * delay setting bus ops until we're sure every possible SMMU is ready,
- * and that way ensure that no add_device() calls get missed.
+ * and that way ensure that no probe_device() calls get missed.
  */
 static int arm_smmu_legacy_bus_init(void)
 {
@@ -1062,7 +1062,6 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct arm_smmu_device *smmu = cfg->smmu;
 	struct arm_smmu_smr *smrs = smmu->smrs;
-	struct iommu_group *group;
 	int i, idx, ret;
 
 	mutex_lock(&smmu->stream_map_mutex);
@@ -1090,13 +1089,6 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 		cfg->smendx[i] = (s16)idx;
 	}
 
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto out_err;
-	}
-	iommu_group_put(group);
-
 	/* It worked! Now, poke the actual hardware */
 	for_each_cfg_sme(cfg, fwspec, i, idx) {
 		arm_smmu_write_sme(smmu, idx);
@@ -1172,7 +1164,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 
 	/*
 	 * FIXME: The arch/arm DMA API code tries to attach devices to its own
-	 * domains between of_xlate() and add_device() - we have no way to cope
+	 * domains between of_xlate() and probe_device() - we have no way to cope
 	 * with that, so until ARM gets converted to rely on groups and default
 	 * domains, just say no (but more politely than by dereferencing NULL).
 	 * This should be at least a WARN_ON once that's sorted.
@@ -1382,7 +1374,7 @@ struct arm_smmu_device *arm_smmu_get_by_fwnode(struct fwnode_handle *fwnode)
 	return dev ? dev_get_drvdata(dev) : NULL;
 }
 
-static int arm_smmu_add_device(struct device *dev)
+static struct iommu_device *arm_smmu_probe_device(struct device *dev)
 {
 	struct arm_smmu_device *smmu = NULL;
 	struct arm_smmu_master_cfg *cfg;
@@ -1403,7 +1395,7 @@ static int arm_smmu_add_device(struct device *dev)
 	} else if (fwspec && fwspec->ops == &arm_smmu_ops) {
 		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
 	} else {
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 	}
 
 	ret = -EINVAL;
@@ -1444,21 +1436,19 @@ static int arm_smmu_add_device(struct device *dev)
 	if (ret)
 		goto out_cfg_free;
 
-	iommu_device_link(&smmu->iommu, dev);
-
 	device_link_add(dev, smmu->dev,
 			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
 
-	return 0;
+	return &smmu->iommu;
 
 out_cfg_free:
 	kfree(cfg);
 out_free:
 	iommu_fwspec_free(dev);
-	return ret;
+	return ERR_PTR(ret);
 }
 
-static void arm_smmu_remove_device(struct device *dev)
+static void arm_smmu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_master_cfg *cfg;
@@ -1475,13 +1465,11 @@ static void arm_smmu_remove_device(struct device *dev)
 	if (ret < 0)
 		return;
 
-	iommu_device_unlink(&smmu->iommu, dev);
 	arm_smmu_master_free_smes(cfg, fwspec);
 
 	arm_smmu_rpm_put(smmu);
 
 	dev_iommu_priv_set(dev, NULL);
-	iommu_group_remove_device(dev);
 	kfree(cfg);
 	iommu_fwspec_free(dev);
 }
@@ -1632,8 +1620,8 @@ static struct iommu_ops arm_smmu_ops = {
 	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 	.iotlb_sync		= arm_smmu_iotlb_sync,
 	.iova_to_phys		= arm_smmu_iova_to_phys,
-	.add_device		= arm_smmu_add_device,
-	.remove_device		= arm_smmu_remove_device,
+	.probe_device		= arm_smmu_probe_device,
+	.release_device		= arm_smmu_release_device,
 	.device_group		= arm_smmu_device_group,
 	.domain_get_attr	= arm_smmu_domain_get_attr,
 	.domain_set_attr	= arm_smmu_domain_set_attr,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
