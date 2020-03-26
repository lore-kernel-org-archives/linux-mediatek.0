Return-Path: <SRS0=woo5=5L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 720C2C2D0E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41457206F8
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2020 15:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVPU7ZhX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41457206F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0X6oG7toOfRiX3VCX8PFZS6MNmw/hJolLFwhiZk8SCo=; b=NVPU7ZhXO058vcmAbTF7KN8k0o
	aAsfVB8h0vEncpFSadpSUdTbIP5xchhcSUVhBh8RumvvnHUV+hL3060WhFqBY6obX911HnIs/FKhp
	WdedWUb50pB0+TTETkgJMnYR+FDhTt4wGHP3jEjjT9pFY3zvInr1+FxCDvzASOr2YaPsNZMNhToT+
	WgnXGwI0HIQaAh+nOx3xXyDnrYSwcxUeVpwg0i0rJ3bjrY0NMc6sxF4mGf3X1fGMYd1Zj6hc8Djmt
	x5xwrc+nTZySuiBTPRaIQWXfYwpZuggZxxkJpF58/Lm7deqkHO/nmdwCIPW2wBWsiP1zS0/Sbzp8w
	cpNDKv7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHU85-0004Kz-6u; Thu, 26 Mar 2020 15:09:09 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHU7p-00041O-3V
 for linux-mediatek@lists.infradead.org; Thu, 26 Mar 2020 15:08:55 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C624C694; Thu, 26 Mar 2020 16:08:46 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v4 05/16] iommu: Rename struct iommu_param to dev_iommu
Date: Thu, 26 Mar 2020 16:08:30 +0100
Message-Id: <20200326150841.10083-6-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326150841.10083-1-joro@8bytes.org>
References: <20200326150841.10083-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200326_080853_324438_766756DB 
X-CRM114-Status: GOOD (  12.93  )
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
 Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, guohanjun@huawei.com,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, Robin Murphy <robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Joerg Roedel <jroedel@suse.de>

The term dev_iommu aligns better with other existing structures and
their accessor functions.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Tested-by: Will Deacon <will@kernel.org> # arm-smmu
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c  | 28 ++++++++++++++--------------
 include/linux/device.h |  6 +++---
 include/linux/iommu.h  |  4 ++--
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3e3528436e0b..beac2ef063dd 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -152,9 +152,9 @@ void iommu_device_unregister(struct iommu_device *iommu)
 }
 EXPORT_SYMBOL_GPL(iommu_device_unregister);
 
-static struct iommu_param *iommu_get_dev_param(struct device *dev)
+static struct dev_iommu *dev_iommu_get(struct device *dev)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 
 	if (param)
 		return param;
@@ -164,14 +164,14 @@ static struct iommu_param *iommu_get_dev_param(struct device *dev)
 		return NULL;
 
 	mutex_init(&param->lock);
-	dev->iommu_param = param;
+	dev->iommu = param;
 	return param;
 }
 
-static void iommu_free_dev_param(struct device *dev)
+static void dev_iommu_free(struct device *dev)
 {
-	kfree(dev->iommu_param);
-	dev->iommu_param = NULL;
+	kfree(dev->iommu);
+	dev->iommu = NULL;
 }
 
 int iommu_probe_device(struct device *dev)
@@ -183,7 +183,7 @@ int iommu_probe_device(struct device *dev)
 	if (!ops)
 		return -EINVAL;
 
-	if (!iommu_get_dev_param(dev))
+	if (!dev_iommu_get(dev))
 		return -ENOMEM;
 
 	if (!try_module_get(ops->owner)) {
@@ -200,7 +200,7 @@ int iommu_probe_device(struct device *dev)
 err_module_put:
 	module_put(ops->owner);
 err_free_dev_param:
-	iommu_free_dev_param(dev);
+	dev_iommu_free(dev);
 	return ret;
 }
 
@@ -211,9 +211,9 @@ void iommu_release_device(struct device *dev)
 	if (dev->iommu_group)
 		ops->remove_device(dev);
 
-	if (dev->iommu_param) {
+	if (dev->iommu) {
 		module_put(ops->owner);
-		iommu_free_dev_param(dev);
+		dev_iommu_free(dev);
 	}
 }
 
@@ -972,7 +972,7 @@ int iommu_register_device_fault_handler(struct device *dev,
 					iommu_dev_fault_handler_t handler,
 					void *data)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	int ret = 0;
 
 	if (!param)
@@ -1015,7 +1015,7 @@ EXPORT_SYMBOL_GPL(iommu_register_device_fault_handler);
  */
 int iommu_unregister_device_fault_handler(struct device *dev)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	int ret = 0;
 
 	if (!param)
@@ -1055,7 +1055,7 @@ EXPORT_SYMBOL_GPL(iommu_unregister_device_fault_handler);
  */
 int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
 {
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	struct iommu_fault_event *evt_pending = NULL;
 	struct iommu_fault_param *fparam;
 	int ret = 0;
@@ -1104,7 +1104,7 @@ int iommu_page_response(struct device *dev,
 	int ret = -EINVAL;
 	struct iommu_fault_event *evt;
 	struct iommu_fault_page_request *prm;
-	struct iommu_param *param = dev->iommu_param;
+	struct dev_iommu *param = dev->iommu;
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 
 	if (!domain || !domain->ops->page_response)
diff --git a/include/linux/device.h b/include/linux/device.h
index fa04dfd22bbc..405a8f11bec1 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -44,7 +44,7 @@ struct iommu_ops;
 struct iommu_group;
 struct iommu_fwspec;
 struct dev_pin_info;
-struct iommu_param;
+struct dev_iommu;
 
 /**
  * struct subsys_interface - interfaces to device functions
@@ -514,7 +514,7 @@ struct dev_links_info {
  * 		device (i.e. the bus driver that discovered the device).
  * @iommu_group: IOMMU group the device belongs to.
  * @iommu_fwspec: IOMMU-specific properties supplied by firmware.
- * @iommu_param: Per device generic IOMMU runtime data
+ * @iommu:	Per device generic IOMMU runtime data
  *
  * @offline_disabled: If set, the device is permanently online.
  * @offline:	Set after successful invocation of bus type's .offline().
@@ -614,7 +614,7 @@ struct device {
 	void	(*release)(struct device *dev);
 	struct iommu_group	*iommu_group;
 	struct iommu_fwspec	*iommu_fwspec;
-	struct iommu_param	*iommu_param;
+	struct dev_iommu	*iommu;
 
 	bool			offline_disabled:1;
 	bool			offline:1;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 3c4ca041d7a2..1c9fa5c1174b 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -365,7 +365,7 @@ struct iommu_fault_param {
 };
 
 /**
- * struct iommu_param - collection of per-device IOMMU data
+ * struct dev_iommu - Collection of per-device IOMMU data
  *
  * @fault_param: IOMMU detected device fault reporting data
  *
@@ -373,7 +373,7 @@ struct iommu_fault_param {
  *	struct iommu_group	*iommu_group;
  *	struct iommu_fwspec	*iommu_fwspec;
  */
-struct iommu_param {
+struct dev_iommu {
 	struct mutex lock;
 	struct iommu_fault_param *fault_param;
 };
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
