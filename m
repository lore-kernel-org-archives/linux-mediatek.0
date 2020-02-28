Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B426C3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBA6246AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BoIzoo1i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DBA6246AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NLZQxVXZP24Ru0pmzCjUzEeCv0tYDWyIsOCtmBjt6UE=; b=BoIzoo1iRHDx2UqDunwb7yQDg9
	vll3LFpf0eNNqtSa0aw8lI12AVVne2pggeBN/AoEh0fudhoY4YM7t7qWTOrchRHdm/gLmnbaH9F6P
	UnFHzUO/YgpZ06QYdnxkONKHRyjdOvL8XIo6/r98emmeyjQK+eeTayjmUh81q+0HelWdSS9IwH3vp
	IKCvDMwaUHqrJs7C8lxBGknvYYnGwkErNGZWYZSXg9fawAlIxRNBSFzHIaJrareRM5SoAMvC8KD7K
	r33YJcnwmBp2cCZ4baU+QohUTszYXWcy0sivD6aB1hf31iEpRvydKQSvXZ8HQovZNaoKVY0qxXxmv
	O5GNbV/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hGM-0006xP-Ss; Fri, 28 Feb 2020 15:09:14 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hFy-0006MT-Hx
 for linux-mediatek@lists.infradead.org; Fri, 28 Feb 2020 15:08:54 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8952E63F; Fri, 28 Feb 2020 16:08:30 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 11/14] iommu/mediatek: Use accessor functions for iommu
 private data
Date: Fri, 28 Feb 2020 16:08:17 +0100
Message-Id: <20200228150820.15340-12-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
References: <20200228150820.15340-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070850_757798_E6A84EFC 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Hanjun Guo <guohanjun@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

Make use of dev_iommu_priv_set/get() functions.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/mtk_iommu.c    | 13 ++++++-------
 drivers/iommu/mtk_iommu_v1.c | 14 +++++++-------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 95945f467c03..5f4d6df59cf6 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -358,8 +358,8 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
 static int mtk_iommu_attach_device(struct iommu_domain *domain,
 				   struct device *dev)
 {
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
-	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
 
 	if (!data)
 		return -ENODEV;
@@ -378,7 +378,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 static void mtk_iommu_detach_device(struct iommu_domain *domain,
 				    struct device *dev)
 {
-	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 
 	if (!data)
 		return;
@@ -450,7 +450,7 @@ static int mtk_iommu_add_device(struct device *dev)
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return -ENODEV; /* Not a iommu client device */
 
-	data = fwspec->iommu_priv;
+	data = dev_iommu_priv_get(dev);
 	iommu_device_link(&data->iommu, dev);
 
 	group = iommu_group_get_for_dev(dev);
@@ -469,7 +469,7 @@ static void mtk_iommu_remove_device(struct device *dev)
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
 
-	data = fwspec->iommu_priv;
+	data = dev_iommu_priv_get(dev);
 	iommu_device_unlink(&data->iommu, dev);
 
 	iommu_group_remove_device(dev);
@@ -496,7 +496,6 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 
 static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct platform_device *m4updev;
 
 	if (args->args_count != 1) {
@@ -505,13 +504,13 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 		return -EINVAL;
 	}
 
-	if (!fwspec->iommu_priv) {
+	if (!dev_iommu_priv_get(dev)) {
 		/* Get the m4u device */
 		m4updev = of_find_device_by_node(args->np);
 		if (WARN_ON(!m4updev))
 			return -EINVAL;
 
-		fwspec->iommu_priv = platform_get_drvdata(m4updev);
+		dev_iommu_priv_set(dev, platform_get_drvdata(m4updev));
 	}
 
 	return iommu_fwspec_add_ids(dev, args->args, 1);
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index e93b94ecac45..9930ac7413cc 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -263,8 +263,8 @@ static void mtk_iommu_domain_free(struct iommu_domain *domain)
 static int mtk_iommu_attach_device(struct iommu_domain *domain,
 				   struct device *dev)
 {
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
-	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
 	int ret;
 
 	if (!data)
@@ -286,7 +286,7 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 static void mtk_iommu_detach_device(struct iommu_domain *domain,
 				    struct device *dev)
 {
-	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
 
 	if (!data)
 		return;
@@ -387,20 +387,20 @@ static int mtk_iommu_create_mapping(struct device *dev,
 		return -EINVAL;
 	}
 
-	if (!fwspec->iommu_priv) {
+	if (!dev_iommu_priv_get(dev)) {
 		/* Get the m4u device */
 		m4updev = of_find_device_by_node(args->np);
 		if (WARN_ON(!m4updev))
 			return -EINVAL;
 
-		fwspec->iommu_priv = platform_get_drvdata(m4updev);
+		dev_iommu_priv_set(dev, platform_get_drvdata(m4updev));
 	}
 
 	ret = iommu_fwspec_add_ids(dev, args->args, 1);
 	if (ret)
 		return ret;
 
-	data = fwspec->iommu_priv;
+	data = dev_iommu_priv_get(dev);
 	m4udev = data->dev;
 	mtk_mapping = m4udev->archdata.iommu;
 	if (!mtk_mapping) {
@@ -459,7 +459,7 @@ static int mtk_iommu_add_device(struct device *dev)
 	if (err)
 		return err;
 
-	data = fwspec->iommu_priv;
+	data = dev_iommu_priv_get(dev)
 	mtk_mapping = data->dev->archdata.iommu;
 	err = arm_iommu_attach_device(dev, mtk_mapping);
 	if (err) {
@@ -478,7 +478,7 @@ static void mtk_iommu_remove_device(struct device *dev)
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
 
-	data = fwspec->iommu_priv;
+	data = dev_iommu_priv_get(dev)
 	iommu_device_unlink(&data->iommu, dev);
 
 	iommu_group_remove_device(dev);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
