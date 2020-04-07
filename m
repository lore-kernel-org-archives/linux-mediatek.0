Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D418BC2D0EC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9206F20730
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 18:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s7o9OyrC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="S6G0unIv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9206F20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DzHux1yc6kbt1q1noOGtFaf65SAEdiC3g0m4maXP5Ds=; b=s7o9OyrCViJmO+qSSz3p7dEdNe
	wAoyl02RSHIFL9yc3bnkhcE7trBiPQpRnztfJFnkyD/fAMZvwDJ/bD6YGI+x9upA/MLg3tDyOAbt/
	3Py2mZSUBHlpT/Sc8eNCtfmvYhKtLfh+H1fvle9Gd22NN0CWOrFQ7/Kr2d4IgReeojooY2Yom3Qtq
	pRTVTSACeom0nt8yS3EuZYQiIWUZb0RVUuzcwWNT5G4aPg4ysqvwPUFHzvknRGBc+ms9hIrA6icQH
	GvI1aOQwq2jeI7r9K6m8G68QmdyK1p7XU+eiJwp/qjoMtkE0e1dt9KUJyahuSPbeJPRI3ElkNDGEZ
	jIAvUerg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLt9Y-0004CR-DM; Tue, 07 Apr 2020 18:40:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt7S-0007QK-QB; Tue, 07 Apr 2020 18:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=References:In-Reply-To:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WqzNdBJqYcA6yrtHpffvmfnUkZuNrXxFlMU+5xZLHc4=; b=S6G0unIvQis21CFpWF9TsoDmSL
 JFdYzX2cPBd+3SI4E3x4mcY7PqzXKX5EhrQmv1+XaWWHLuiX/WSmGpbCmntsqvTTo8wVGisJaaDf9
 eUxCeSQNsZa2v2pJi47WItxiRigIxUdPV0eRiYoFVtK6SQlXfn4lzL/X53Yqj+fAWbFJp5dgsRSED
 STvOnDTVOdH8nWWYUDzFaiCcduj7gtQjW9IJwuSwe8HLmRl2+s38DYHC8L1tHk1eBV9QV3MXKA1tQ
 cYaEu9qFmBNE9w/KEgKk2nPAX1fGYR0tdwKDqNOTXg/svFRMPl07ji8oipRciKPVMD9POEMz5H2lx
 /Ik9oBLw==;
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLt78-0004pr-21; Tue, 07 Apr 2020 18:38:41 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 667F868C; Tue,  7 Apr 2020 20:37:54 +0200 (CEST)
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
Subject: [RFC PATCH 31/34] iommu/exynos: Create iommu_device in struct
 exynos_iommu_owner
Date: Tue,  7 Apr 2020 20:37:39 +0200
Message-Id: <20200407183742.4344-32-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200407183742.4344-1-joro@8bytes.org>
References: <20200407183742.4344-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_193823_685281_0C3681DB 
X-CRM114-Status: GOOD (  22.77  )
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

The 'struct exynos_iommu_owner' is an umbrella for multiple SYSMMU
instances attached to one master. As such all these instances are
handled the same, they are all configured with the same iommu_domain,
for example.

The IOMMU core code expects each device to have only one IOMMU
attached, so create the IOMMU-device for the umbrella instead of each
hardware SYSMMU.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/exynos-iommu.c | 96 +++++++++++++++++++++++++++---------
 1 file changed, 73 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 186ff5cc975c..86ecccbf0438 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -235,6 +235,8 @@ struct exynos_iommu_owner {
 	struct list_head controllers;	/* list of sysmmu_drvdata.owner_node */
 	struct iommu_domain *domain;	/* domain this device is attached */
 	struct mutex rpm_lock;		/* for runtime pm of all sysmmus */
+
+	struct iommu_device iommu;	/* IOMMU core handle */
 };
 
 /*
@@ -274,8 +276,6 @@ struct sysmmu_drvdata {
 	struct list_head owner_node;	/* node for owner controllers list */
 	phys_addr_t pgtable;		/* assigned page table structure */
 	unsigned int version;		/* our version */
-
-	struct iommu_device iommu;	/* IOMMU core handle */
 };
 
 static struct exynos_iommu_domain *to_exynos_domain(struct iommu_domain *dom)
@@ -625,18 +625,6 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
 	data->sysmmu = dev;
 	spin_lock_init(&data->lock);
 
-	ret = iommu_device_sysfs_add(&data->iommu, &pdev->dev, NULL,
-				     dev_name(data->sysmmu));
-	if (ret)
-		return ret;
-
-	iommu_device_set_ops(&data->iommu, &exynos_iommu_ops);
-	iommu_device_set_fwnode(&data->iommu, &dev->of_node->fwnode);
-
-	ret = iommu_device_register(&data->iommu);
-	if (ret)
-		return ret;
-
 	platform_set_drvdata(pdev, data);
 
 	__sysmmu_get_version(data);
@@ -1261,6 +1249,8 @@ static int exynos_iommu_add_device(struct device *dev)
 	}
 	iommu_group_put(group);
 
+	iommu_device_link(&owner->iommu, dev);
+
 	return 0;
 }
 
@@ -1282,18 +1272,82 @@ static void exynos_iommu_remove_device(struct device *dev)
 			iommu_group_put(group);
 		}
 	}
+	iommu_device_unlink(&owner->iommu, dev);
 	iommu_group_remove_device(dev);
 
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
 }
 
+static int exynos_iommu_device_init(struct exynos_iommu_owner *owner)
+{
+	static u32 counter = 0;
+	int ret;
+
+	/*
+	 * Create a virtual IOMMU device. In reality it is an umbrella for a
+	 * number of SYSMMU platform devices, but that also means that any
+	 * master can have more than one real IOMMU device. This drivers handles
+	 * all the real devices for one master synchronously, so they appear as
+	 * one anyway.
+	 */
+	ret = iommu_device_sysfs_add(&owner->iommu, NULL, NULL,
+				     "sysmmu-owner-%d", counter++);
+	if (ret)
+		return ret;
+
+	iommu_device_set_ops(&owner->iommu, &exynos_iommu_ops);
+
+	return 0;
+}
+
+static void exynos_iommu_device_remove(struct exynos_iommu_owner *owner)
+{
+	iommu_device_set_ops(&owner->iommu, NULL);
+	iommu_device_sysfs_remove(&owner->iommu);
+}
+
+static int exynos_owner_init(struct device *dev)
+{
+	struct exynos_iommu_owner *owner = dev->archdata.iommu;
+	int ret;
+
+	if (owner)
+		return 0;
+
+	owner = kzalloc(sizeof(*owner), GFP_KERNEL);
+	if (!owner)
+		return -ENOMEM;
+
+	ret = exynos_iommu_device_init(owner);
+	if (ret)
+		goto out_free_owner;
+
+	ret = iommu_device_register(&owner->iommu);
+	if (ret)
+		goto out_remove_iommu_device;
+
+	INIT_LIST_HEAD(&owner->controllers);
+	mutex_init(&owner->rpm_lock);
+	dev->archdata.iommu = owner;
+
+	return 0;
+
+out_remove_iommu_device:
+	exynos_iommu_device_remove(owner);
+out_free_owner:
+	kfree(owner);
+
+	return ret;
+}
+
 static int exynos_iommu_of_xlate(struct device *dev,
 				 struct of_phandle_args *spec)
 {
-	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct platform_device *sysmmu = of_find_device_by_node(spec->np);
 	struct sysmmu_drvdata *data, *entry;
+	struct exynos_iommu_owner *owner;
+	int ret;
 
 	if (!sysmmu)
 		return -ENODEV;
@@ -1302,15 +1356,11 @@ static int exynos_iommu_of_xlate(struct device *dev,
 	if (!data)
 		return -ENODEV;
 
-	if (!owner) {
-		owner = kzalloc(sizeof(*owner), GFP_KERNEL);
-		if (!owner)
-			return -ENOMEM;
+	ret = exynos_owner_init(dev);
+	if (ret)
+		return ret;
 
-		INIT_LIST_HEAD(&owner->controllers);
-		mutex_init(&owner->rpm_lock);
-		dev->archdata.iommu = owner;
-	}
+	owner = dev->archdata.iommu;
 
 	list_for_each_entry(entry, &owner->controllers, owner_node)
 		if (entry == data)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
