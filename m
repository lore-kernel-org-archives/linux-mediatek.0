Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A328C8300D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317832192A
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tSsDyzDi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317832192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sJ3WwBJic5+i0ow8UOw0C+3fGRVS5jH5bvizAotjao0=; b=tSsDyzDi9tCVoZ4MKlGWT2u9SR
	jFejM6ne9jEVmmzFI87ULJkRJnKmPp2dw2L2zEhyYjkqMBqibNplwaL6jhep8iJxYu0wIk/haTDwb
	C/COt0e0vdOO/NbtdYtwM4aFATStw3I861CS4/Zffvg9ahjxnZTjEIYnbPhemZZDunoEH/MnFBCjv
	JrduMbaLJmi1rR844SrCXGr92JCKjeAiqr1RpvU1+FFMtIATLmWCgipxtfBWJt/wIRpaLRBLluJl9
	cXzewa0AOZDM7CabVMZqgR2GXVin5cA5rj4C2CNsCk406xEhWpKRX8hbFL/8pyfiXo1dxS6YXQvQu
	Vjzky3gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmuy-00077G-VJ; Wed, 29 Apr 2020 13:38:28 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuJ-0006GH-HW; Wed, 29 Apr 2020 13:37:51 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C03AC947; Wed, 29 Apr 2020 15:37:36 +0200 (CEST)
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
Subject: [PATCH v3 08/34] iommu: Move default domain allocation to
 iommu_probe_device()
Date: Wed, 29 Apr 2020 15:36:46 +0200
Message-Id: <20200429133712.31431-9-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063747_853052_9AE2D29E 
X-CRM114-Status: GOOD (  19.75  )
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

Well, not really. The call to iommu_alloc_default_domain() in
iommu_group_get_for_dev() has to stay around as long as there are
IOMMU drivers using the add/remove_device() call-backs instead of
probe/release_device().

Those drivers expect that iommu_group_get_for_dev() returns the device
attached to a group and the group set up with a default domain (and
the device attached to the groups current domain).

But when all drivers are converted this compatability mess can be
removed.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 102 +++++++++++++++++++++++++++++-------------
 1 file changed, 71 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 6cfe7799dc8c..7a385c18e1a5 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -79,6 +79,16 @@ static bool iommu_cmd_line_dma_api(void)
 	return !!(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API);
 }
 
+static int iommu_alloc_default_domain(struct device *dev);
+static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
+						 unsigned type);
+static int __iommu_attach_device(struct iommu_domain *domain,
+				 struct device *dev);
+static int __iommu_attach_group(struct iommu_domain *domain,
+				struct iommu_group *group);
+static void __iommu_detach_group(struct iommu_domain *domain,
+				 struct iommu_group *group);
+
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
 	__ATTR(_name, _mode, _show, _store)
@@ -221,10 +231,29 @@ int iommu_probe_device(struct device *dev)
 		goto err_free_dev_param;
 	}
 
-	if (ops->probe_device)
+	if (ops->probe_device) {
+		struct iommu_group *group;
+
 		ret = __iommu_probe_device(dev);
-	else
+
+		/*
+		 * Try to allocate a default domain - needs support from the
+		 * IOMMU driver. There are still some drivers which don't
+		 * support default domains, so the return value is not yet
+		 * checked.
+		 */
+		if (!ret)
+			iommu_alloc_default_domain(dev);
+
+		group = iommu_group_get(dev);
+		if (group && group->default_domain) {
+			ret = __iommu_attach_device(group->default_domain, dev);
+			iommu_group_put(group);
+		}
+
+	} else {
 		ret = ops->add_device(dev);
+	}
 
 	if (ret)
 		goto err_module_put;
@@ -268,15 +297,6 @@ void iommu_release_device(struct device *dev)
 	dev_iommu_free(dev);
 }
 
-static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
-						 unsigned type);
-static int __iommu_attach_device(struct iommu_domain *domain,
-				 struct device *dev);
-static int __iommu_attach_group(struct iommu_domain *domain,
-				struct iommu_group *group);
-static void __iommu_detach_group(struct iommu_domain *domain,
-				 struct iommu_group *group);
-
 static int __init iommu_set_def_domain_type(char *str)
 {
 	bool pt;
@@ -1423,25 +1443,18 @@ static int iommu_get_def_domain_type(struct device *dev)
 	return (type == 0) ? iommu_def_domain_type : type;
 }
 
-static int iommu_alloc_default_domain(struct device *dev,
-				      struct iommu_group *group)
+static int iommu_group_alloc_default_domain(struct bus_type *bus,
+					    struct iommu_group *group,
+					    unsigned int type)
 {
 	struct iommu_domain *dom;
-	unsigned int type;
-
-	if (group->default_domain)
-		return 0;
 
-	type = iommu_get_def_domain_type(dev);
-
-	dom = __iommu_domain_alloc(dev->bus, type);
+	dom = __iommu_domain_alloc(bus, type);
 	if (!dom && type != IOMMU_DOMAIN_DMA) {
-		dom = __iommu_domain_alloc(dev->bus, IOMMU_DOMAIN_DMA);
-		if (dom) {
-			dev_warn(dev,
-				 "failed to allocate default IOMMU domain of type %u; falling back to IOMMU_DOMAIN_DMA",
-				 type);
-		}
+		dom = __iommu_domain_alloc(bus, IOMMU_DOMAIN_DMA);
+		if (dom)
+			pr_warn("Failed to allocate default IOMMU domain of type %u for group %s - Falling back to IOMMU_DOMAIN_DMA",
+				type, group->name);
 	}
 
 	if (!dom)
@@ -1461,6 +1474,23 @@ static int iommu_alloc_default_domain(struct device *dev,
 	return 0;
 }
 
+static int iommu_alloc_default_domain(struct device *dev)
+{
+	struct iommu_group *group;
+	unsigned int type;
+
+	group = iommu_group_get(dev);
+	if (!group)
+		return -ENODEV;
+
+	if (group->default_domain)
+		return 0;
+
+	type = iommu_get_def_domain_type(dev);
+
+	return iommu_group_alloc_default_domain(dev->bus, group, type);
+}
+
 /**
  * iommu_group_get_for_dev - Find or create the IOMMU group for a device
  * @dev: target device
@@ -1491,16 +1521,26 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 	if (IS_ERR(group))
 		return group;
 
+	ret = iommu_group_add_device(group, dev);
+	if (ret)
+		goto out_put_group;
+
 	/*
 	 * Try to allocate a default domain - needs support from the
 	 * IOMMU driver. There are still some drivers which don't support
-	 * default domains, so the return value is not yet checked.
+	 * default domains, so the return value is not yet checked. Only
+	 * allocate the domain here when the driver still has the
+	 * add_device/remove_device call-backs implemented.
 	 */
-	iommu_alloc_default_domain(dev, group);
+	if (!ops->probe_device) {
+		iommu_alloc_default_domain(dev);
 
-	ret = iommu_group_add_device(group, dev);
-	if (ret)
-		goto out_put_group;
+		if (group->default_domain)
+			ret = __iommu_attach_device(group->default_domain, dev);
+
+		if (ret)
+			goto out_put_group;
+	}
 
 	return group;
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
