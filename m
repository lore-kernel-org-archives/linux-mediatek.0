Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A21C83006
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665732087E
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 13:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QNfvPfH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 665732087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aQQLiInroiC/9haUgJ78hNOv5Z/QkWSqzNrtk1FWYiQ=; b=QNfvPfH2r4to4ZM9l2ak9Y3zXu
	9KkcLuMfJ6Ws1bZkG6n9seVdrNCk/j/LLPi7kF5fAx/T9+8bm7CkbWo34RjAyf4gWUdGrcgBIyKz4
	/yQ1klxe5PReEmO6hDz7IfNdXD3P/tFxDhWPp8/0T+7zdCPoiVlFFU1nY4LYq9JodI/usxp5F3wk5
	cb98WE91O9tCwg95s/8YECCe6xEvMjR613LIbD6DsG0yAh/wbqZtzSdedIb7zVidNHMcZh48dzZWb
	2yjmsrOLsriP4FAcQVeyMLVSvX15gzlQ//7gVXpGfC8sS3UAEt+CUmIBdRG7waTw0E/xkn/ktOFOH
	wn5jWcYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTmwE-0000bi-Kc; Wed, 29 Apr 2020 13:39:46 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTmuS-0006Rs-Cs; Wed, 29 Apr 2020 13:38:01 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E8433F15; Wed, 29 Apr 2020 15:37:41 +0200 (CEST)
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
Subject: [PATCH v3 34/34] iommu: Unexport iommu_group_get_for_dev()
Date: Wed, 29 Apr 2020 15:37:12 +0200
Message-Id: <20200429133712.31431-35-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429133712.31431-1-joro@8bytes.org>
References: <20200429133712.31431-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_063756_676571_DC6B20BC 
X-CRM114-Status: GOOD (  13.23  )
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

The function is now only used in IOMMU core code and shouldn't be used
outside of it anyway, so remove the export for it.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 4 ++--
 include/linux/iommu.h | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 48a95f7d7999..a9e5618cde80 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -91,6 +91,7 @@ static void __iommu_detach_group(struct iommu_domain *domain,
 				 struct iommu_group *group);
 static int iommu_create_device_direct_mappings(struct iommu_group *group,
 					       struct device *dev);
+static struct iommu_group *iommu_group_get_for_dev(struct device *dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -1500,7 +1501,7 @@ static int iommu_alloc_default_domain(struct device *dev)
  * to the returned IOMMU group, which will already include the provided
  * device.  The reference should be released with iommu_group_put().
  */
-struct iommu_group *iommu_group_get_for_dev(struct device *dev)
+static struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	struct iommu_group *group;
@@ -1531,7 +1532,6 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL(iommu_group_get_for_dev);
 
 struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
 {
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index dd076366383f..7cfd2dddb49d 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -527,7 +527,6 @@ extern int iommu_page_response(struct device *dev,
 			       struct iommu_page_response *msg);
 
 extern int iommu_group_id(struct iommu_group *group);
-extern struct iommu_group *iommu_group_get_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_group_default_domain(struct iommu_group *);
 
 extern int iommu_domain_get_attr(struct iommu_domain *domain, enum iommu_attr,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
