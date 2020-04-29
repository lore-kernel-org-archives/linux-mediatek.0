Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59584C8300C
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C93B2184D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:38:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iq+bQLDm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C93B2184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UMiesCKwLxO4TjcItwkQNveD6Nmiht58T7C3vOT5Y5E=; b=iq+bQLDmn7kdR3aha8KXjv1O9S
	ou54glnlTQV+uH5QW8But88SRX6eaEc1IWDOAXAUZoUnhjtodUsm0psa08PE/mSHtO5SXWoAwoXUp
	ULFHBJJwX270OtOo4jTkBz93Em6F1G0Juexmy4x19lE1FssdrJKbRaQ7DY0lR058XjCbcKTtHNbOl
	sO7u/ZJvnhSFJA/wdXzTWSKMuj9LlOjhy71ljLm8V/pNGpyBPjkBhs735HZUR7Z8Hn2/amXuKNLik
	rQUGuOqjT0iLRzE/LbLKhaMxLsUQeOz2EYdKD3egqy8JhBKVx9uG4MwP60krTU36G7QaZXoy8jCdo
	f71bugOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmux-000756-57; Wed, 29 Apr 2020 13:38:27 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuI-0006FT-OH; Wed, 29 Apr 2020 13:37:51 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 85A05CD1; Wed, 29 Apr 2020 15:37:37 +0200 (CEST)
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
Subject: [PATCH v3 12/34] iommu: Move iommu_group_create_direct_mappings() out
 of iommu_group_add_device()
Date: Wed, 29 Apr 2020 15:36:50 +0200
Message-Id: <20200429133712.31431-13-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063747_115791_8622B000 
X-CRM114-Status: GOOD (  14.29  )
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

After the previous changes the iommu group may not have a default
domain when iommu_group_add_device() is called. With no default domain
iommu_group_create_direct_mappings() will do nothing and no direct
mappings will be created.

Rename iommu_group_create_direct_mappings() to
iommu_create_device_direct_mappings() to better reflect that the
function creates direct mappings only for one device and not for all
devices in the group. Then move the call to the places where a default
domain actually exists.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 35 ++++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7de0e29db333..834a45da0ed0 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -89,6 +89,8 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 				struct iommu_group *group);
 static void __iommu_detach_group(struct iommu_domain *domain,
 				 struct iommu_group *group);
+static int iommu_create_device_direct_mappings(struct iommu_group *group,
+					       struct device *dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -243,6 +245,8 @@ static int __iommu_probe_device_helper(struct device *dev)
 	if (group->default_domain)
 		ret = __iommu_attach_device(group->default_domain, dev);
 
+	iommu_create_device_direct_mappings(group, dev);
+
 	iommu_group_put(group);
 
 	if (ret)
@@ -263,6 +267,7 @@ static int __iommu_probe_device_helper(struct device *dev)
 int iommu_probe_device(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
+	struct iommu_group *group;
 	int ret;
 
 	WARN_ON(dev->iommu_group);
@@ -285,6 +290,10 @@ int iommu_probe_device(struct device *dev)
 	if (ret)
 		goto err_module_put;
 
+	group = iommu_group_get(dev);
+	iommu_create_device_direct_mappings(group, dev);
+	iommu_group_put(group);
+
 	if (ops->probe_finalize)
 		ops->probe_finalize(dev);
 
@@ -736,8 +745,8 @@ int iommu_group_set_name(struct iommu_group *group, const char *name)
 }
 EXPORT_SYMBOL_GPL(iommu_group_set_name);
 
-static int iommu_group_create_direct_mappings(struct iommu_group *group,
-					      struct device *dev)
+static int iommu_create_device_direct_mappings(struct iommu_group *group,
+					       struct device *dev)
 {
 	struct iommu_domain *domain = group->default_domain;
 	struct iommu_resv_region *entry;
@@ -841,8 +850,6 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 
 	dev->iommu_group = group;
 
-	iommu_group_create_direct_mappings(group, dev);
-
 	mutex_lock(&group->mutex);
 	list_add_tail(&device->list, &group->devices);
 	if (group->domain)
@@ -1736,6 +1743,7 @@ static void probe_alloc_default_domain(struct bus_type *bus,
 		gtype.type = iommu_def_domain_type;
 
 	iommu_group_alloc_default_domain(bus, group, gtype.type);
+
 }
 
 static int iommu_group_do_dma_attach(struct device *dev, void *data)
@@ -1760,6 +1768,21 @@ static int __iommu_group_dma_attach(struct iommu_group *group)
 					  iommu_group_do_dma_attach);
 }
 
+static int iommu_do_create_direct_mappings(struct device *dev, void *data)
+{
+	struct iommu_group *group = data;
+
+	iommu_create_device_direct_mappings(group, dev);
+
+	return 0;
+}
+
+static int iommu_group_create_direct_mappings(struct iommu_group *group)
+{
+	return __iommu_group_for_each_dev(group, group,
+					  iommu_do_create_direct_mappings);
+}
+
 static int bus_iommu_probe(struct bus_type *bus)
 {
 	const struct iommu_ops *ops = bus->iommu_ops;
@@ -1792,6 +1815,8 @@ static int bus_iommu_probe(struct bus_type *bus)
 				continue;
 			}
 
+			iommu_group_create_direct_mappings(group);
+
 			ret = __iommu_group_dma_attach(group);
 
 			mutex_unlock(&group->mutex);
@@ -2632,7 +2657,7 @@ request_default_domain_for_dev(struct device *dev, unsigned long type)
 		iommu_domain_free(group->default_domain);
 	group->default_domain = domain;
 
-	iommu_group_create_direct_mappings(group, dev);
+	iommu_create_device_direct_mappings(group, dev);
 
 	dev_info(dev, "Using iommu %s mapping\n",
 		 type == IOMMU_DOMAIN_DMA ? "dma" : "direct");
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
