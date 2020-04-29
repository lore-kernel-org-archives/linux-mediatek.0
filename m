Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422CBC83003
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15240206D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOgx+7a4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15240206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3X0SGjmEMVXZIyHVYfiuKkBDCzdpE3Xmjlb+JLewgh4=; b=XOgx+7a4xIzX02HHzzQ1Px7Mjf
	Tvs8lUmByor8F4njAN97/yhV5+Tlaabq/TTSdMPREgkjkD390J9ZnunVbOuOsPYr487Nmsad92kjy
	tNBvdWxlfzEP0VzTdktQw0dOXErh9szelI0iZbZkVJMJCag4dm4habP997Ma+dqbL8oxD2KqnzncH
	XdJsDscBsbPf84vqSoma4yNQSftRzzLyQG9lqPzdwreYO34R/OKju1/5v67JoTyqsKiWjZzJCl4cg
	HZnuwif3UuRc1XpwkbRtWMV/l1YaYpqS42cDvSBrW/L6aLgSfo8xF7rvSQp1sA3ULni2xxgks6OBP
	PLOYs0Fg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmvg-0008Hh-Em; Wed, 29 Apr 2020 13:39:12 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuS-0006Rt-DK; Wed, 29 Apr 2020 13:38:01 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A52A0F14; Wed, 29 Apr 2020 15:37:41 +0200 (CEST)
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
Subject: [PATCH v3 33/34] iommu: Move more initialization to
 __iommu_probe_device()
Date: Wed, 29 Apr 2020 15:37:11 +0200
Message-Id: <20200429133712.31431-34-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063756_674222_0FD657FD 
X-CRM114-Status: GOOD (  15.56  )
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

Move the calls to dev_iommu_get() and try_module_get() into
__iommu_probe_device(), so that the callers don't have to do it on
their own.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 47 +++++++++++++++++--------------------------
 1 file changed, 18 insertions(+), 29 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7f99e5ae432c..48a95f7d7999 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -194,9 +194,19 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	struct iommu_group *group;
 	int ret;
 
+	if (!dev_iommu_get(dev))
+		return -ENOMEM;
+
+	if (!try_module_get(ops->owner)) {
+		ret = -EINVAL;
+		goto err_free;
+	}
+
 	iommu_dev = ops->probe_device(dev);
-	if (IS_ERR(iommu_dev))
-		return PTR_ERR(iommu_dev);
+	if (IS_ERR(iommu_dev)) {
+		ret = PTR_ERR(iommu_dev);
+		goto out_module_put;
+	}
 
 	dev->iommu->iommu_dev = iommu_dev;
 
@@ -217,6 +227,12 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 out_release:
 	ops->release_device(dev);
 
+out_module_put:
+	module_put(ops->owner);
+
+err_free:
+	dev_iommu_free(dev);
+
 	return ret;
 }
 
@@ -226,14 +242,6 @@ int iommu_probe_device(struct device *dev)
 	struct iommu_group *group;
 	int ret;
 
-	if (!dev_iommu_get(dev))
-		return -ENOMEM;
-
-	if (!try_module_get(ops->owner)) {
-		ret = -EINVAL;
-		goto err_out;
-	}
-
 	ret = __iommu_probe_device(dev, NULL);
 	if (ret)
 		goto err_out;
@@ -1532,14 +1540,10 @@ struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
 
 static int probe_iommu_group(struct device *dev, void *data)
 {
-	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	struct list_head *group_list = data;
 	struct iommu_group *group;
 	int ret;
 
-	if (!dev_iommu_get(dev))
-		return -ENOMEM;
-
 	/* Device is probed already if in a group */
 	group = iommu_group_get(dev);
 	if (group) {
@@ -1547,22 +1551,7 @@ static int probe_iommu_group(struct device *dev, void *data)
 		return 0;
 	}
 
-	if (!try_module_get(ops->owner)) {
-		ret = -EINVAL;
-		goto err_free_dev_iommu;
-	}
-
 	ret = __iommu_probe_device(dev, group_list);
-	if (ret)
-		goto err_module_put;
-
-	return 0;
-
-err_module_put:
-	module_put(ops->owner);
-err_free_dev_iommu:
-	dev_iommu_free(dev);
-
 	if (ret == -ENODEV)
 		ret = 0;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
