Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08ADC352B6
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 13:24:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71FB720732
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 13:24:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="csoo7HRE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71FB720732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GgRvJakt6doscvL+lccOiejK5G+S+kKbppqt7r0bmu8=; b=csoo7HREom3uS4yjlC+vvJdFTn
	zhJMtfj75N18cTYeXO4rM9W9TXkRguqWVhX7Xu0YP9NYF61VSHy5fZc0YVB7FBUHMOSBTL77Dw9RP
	2JSEEVn78IEvfNd1+FQ5wVYLjXPwRxyO0Gu2CjmIMCHGAqVly/D8TIm4nV9mAyzoXdgqSByuTTi51
	Bm0YbiWV4J/g+9AYxDshJRO5H3TGqoU+X0NWnOUmXM55xkHMWWen08L+sOFqmhZmM9/7sdU/RJ4UB
	oue0ipL8x9TU5TiBSjSG8wiLWhrsy2OD5JTEPN+9egAe6+rfEv6Ka0ZzciNZXhVpkyjj3CCuYqluK
	jcyxndQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOLYK-0005NI-44; Tue, 14 Apr 2020 13:24:36 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLQF-0002kI-HP; Tue, 14 Apr 2020 13:16:21 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3FB4A736; Tue, 14 Apr 2020 15:15:56 +0200 (CEST)
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
Subject: [PATCH v2 25/33] iommu/rockchip: Convert to probe/release_device()
 call-backs
Date: Tue, 14 Apr 2020 15:15:34 +0200
Message-Id: <20200414131542.25608-26-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200414131542.25608-1-joro@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_061615_897979_C509B411 
X-CRM114-Status: GOOD (  12.62  )
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

Convert the Rockchip IOMMU driver to use the probe_device() and
release_device() call-backs of iommu_ops, so that the iommu core code
does the group and sysfs setup.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/rockchip-iommu.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index b33cdd5aad81..d25c2486ca07 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1054,40 +1054,28 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 	kfree(rk_domain);
 }
 
-static int rk_iommu_add_device(struct device *dev)
+static struct iommu_device *rk_iommu_probe_device(struct device *dev)
 {
-	struct iommu_group *group;
-	struct rk_iommu *iommu;
 	struct rk_iommudata *data;
+	struct rk_iommu *iommu;
 
 	data = dev->archdata.iommu;
 	if (!data)
-		return -ENODEV;
+		return ERR_PTR(-ENODEV);
 
 	iommu = rk_iommu_from_dev(dev);
 
-	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR(group))
-		return PTR_ERR(group);
-	iommu_group_put(group);
-
-	iommu_device_link(&iommu->iommu, dev);
 	data->link = device_link_add(dev, iommu->dev,
 				     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
 
-	return 0;
+	return &iommu->iommu;
 }
 
-static void rk_iommu_remove_device(struct device *dev)
+static void rk_iommu_release_device(struct device *dev)
 {
-	struct rk_iommu *iommu;
 	struct rk_iommudata *data = dev->archdata.iommu;
 
-	iommu = rk_iommu_from_dev(dev);
-
 	device_link_del(data->link);
-	iommu_device_unlink(&iommu->iommu, dev);
-	iommu_group_remove_device(dev);
 }
 
 static struct iommu_group *rk_iommu_device_group(struct device *dev)
@@ -1126,8 +1114,8 @@ static const struct iommu_ops rk_iommu_ops = {
 	.detach_dev = rk_iommu_detach_device,
 	.map = rk_iommu_map,
 	.unmap = rk_iommu_unmap,
-	.add_device = rk_iommu_add_device,
-	.remove_device = rk_iommu_remove_device,
+	.probe_device = rk_iommu_probe_device,
+	.release_device = rk_iommu_release_device,
 	.iova_to_phys = rk_iommu_iova_to_phys,
 	.device_group = rk_iommu_device_group,
 	.pgsize_bitmap = RK_IOMMU_PGSIZE_BITMAP,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
