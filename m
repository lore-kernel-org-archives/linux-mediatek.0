Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8638C83003
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C36206D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RQil4jQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C36206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1XVOELVDEskYoq/JdjBvAehuRovLwn57H0kyWGe6KC8=; b=RQil4jQmJ1+vbffmCzKPYkVnL7
	CdKuyuhqNReiZ62/gAVluPKfvGzty2aMbFqpGjgj+8AWMzL0Utj+lrlSwelruCOUYlhKCzYblvVuR
	sy9rXsTyx9qqKgK1x1FP0XH/hzbreXlELeUS8jly1BYELQPT8UUs+zd+Hvi2p14XiXRD/OcKEcYmA
	F7WCqNjsbjMo+lKv5gVgGTcHQwR4QgnShKFB1Da7MsAhHkHnmhPg1b9CIfOw+5VGXusNlQWbPeLIS
	vCE/C965StSY/YeOjwGbsBPXK5IBxDbVnH1U0ON499+kSDxwMseY5dF+MIdz19ymxVeezgkAqfiKr
	2qXv3OpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmvv-0000Bc-Q5; Wed, 29 Apr 2020 13:39:27 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuR-0006PV-Hy; Wed, 29 Apr 2020 13:38:01 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 52035F0E; Wed, 29 Apr 2020 15:37:41 +0200 (CEST)
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
Subject: [PATCH v3 31/34] iommu/exynos: Convert to probe/release_device()
 call-backs
Date: Wed, 29 Apr 2020 15:37:09 +0200
Message-Id: <20200429133712.31431-32-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063755_924784_F2C26A87 
X-CRM114-Status: GOOD (  14.13  )
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

Convert the Exynos IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/exynos-iommu.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 09cdd163560a..60c8a56e4a3f 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1235,19 +1235,13 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 	return phys;
 }
 
-static int exynos_iommu_add_device(struct device *dev)
+static struct iommu_device *exynos_iommu_probe_device(struct device *dev)
 {
 	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct sysmmu_drvdata *data;
-	struct iommu_group *group;
 
 	if (!has_sysmmu(dev))
-		return -ENODEV;
-
-	group = iommu_group_get_for_dev(dev);
-
-	if (IS_ERR(group))
-		return PTR_ERR(group);
+		return ERR_PTR(-ENODEV);
 
 	list_for_each_entry(data, &owner->controllers, owner_node) {
 		/*
@@ -1259,17 +1253,15 @@ static int exynos_iommu_add_device(struct device *dev)
 					     DL_FLAG_STATELESS |
 					     DL_FLAG_PM_RUNTIME);
 	}
-	iommu_group_put(group);
 
 	/* There is always at least one entry, see exynos_iommu_of_xlate() */
 	data = list_first_entry(&owner->controllers,
 				struct sysmmu_drvdata, owner_node);
-	iommu_device_link(&data->iommu, dev);
 
-	return 0;
+	return &data->iommu;
 }
 
-static void exynos_iommu_remove_device(struct device *dev)
+static void exynos_iommu_release_device(struct device *dev)
 {
 	struct exynos_iommu_owner *owner = dev->archdata.iommu;
 	struct sysmmu_drvdata *data;
@@ -1287,15 +1279,9 @@ static void exynos_iommu_remove_device(struct device *dev)
 			iommu_group_put(group);
 		}
 	}
-	iommu_group_remove_device(dev);
 
 	list_for_each_entry(data, &owner->controllers, owner_node)
 		device_link_del(data->link);
-
-	/* There is always at least one entry, see exynos_iommu_of_xlate() */
-	data = list_first_entry(&owner->controllers,
-				struct sysmmu_drvdata, owner_node);
-	iommu_device_unlink(&data->iommu, dev);
 }
 
 static int exynos_iommu_of_xlate(struct device *dev,
@@ -1341,8 +1327,8 @@ static const struct iommu_ops exynos_iommu_ops = {
 	.unmap = exynos_iommu_unmap,
 	.iova_to_phys = exynos_iommu_iova_to_phys,
 	.device_group = generic_device_group,
-	.add_device = exynos_iommu_add_device,
-	.remove_device = exynos_iommu_remove_device,
+	.probe_device = exynos_iommu_probe_device,
+	.release_device = exynos_iommu_release_device,
 	.pgsize_bitmap = SECT_SIZE | LPAGE_SIZE | SPAGE_SIZE,
 	.of_xlate = exynos_iommu_of_xlate,
 };
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
