Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E458EC3F2D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAABC2469F
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iOkzCFVH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAABC2469F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5x8POtwuXKtgxpuVRvr43pvd+HPYioP1XzCr/E3+FFY=; b=iOkzCFVHx1hqvkLgTkzVsrHqSi
	Bi+7xJ/PA3RxB0cLkFJoOdG5dI7bxkYHr7UX1HBOismaIFyyeOujN9vD8jybIk3ovC+i0igCroVMq
	PWADMSKkfGSyZUqIeZ8UQ4XmAm3lZDw3Uw4Ps0q3KZddawBDPAY1umW0/vh3FVse9BcI79roCbiKU
	a75i7aQn0JXzf7rR9N+s0BbM8fbKrlJUHrZxL9fPae8jLdyoBnf2OE0w5P775QwMW5AUj67e8GJDT
	uf8FHvkrZphEWdioMejL586GKrsfwub6rYzAQeYYh2kkrqv9TdEYUtUmzALAJ7lbyAQYve4M1HRHy
	9XHUhIYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hGJ-0006rm-Up; Fri, 28 Feb 2020 15:09:11 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hFy-0006Mm-I7
 for linux-mediatek@lists.infradead.org; Fri, 28 Feb 2020 15:08:53 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4B972680; Fri, 28 Feb 2020 16:08:31 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 14/14] iommu: Move fwspec->iommu_priv to struct dev_iommu
Date: Fri, 28 Feb 2020 16:08:20 +0100
Message-Id: <20200228150820.15340-15-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
References: <20200228150820.15340-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070850_750909_816CDA01 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Move the pointer for iommu private data from struct iommu_fwspec to
struct dev_iommu.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 include/linux/iommu.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 904fb24418e5..77fc6bb35fe9 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -369,6 +369,7 @@ struct iommu_fault_param {
  *
  * @fault_param: IOMMU detected device fault reporting data
  * @fwspec:	 IOMMU fwspec data
+ * @priv:	 IOMMU Driver private data
  *
  * TODO: migrate other per device data pointers under iommu_dev_data, e.g.
  *	struct iommu_group	*iommu_group;
@@ -377,6 +378,7 @@ struct dev_iommu {
 	struct mutex lock;
 	struct iommu_fault_param	*fault_param;
 	struct iommu_fwspec		*fwspec;
+	void				*priv;
 };
 
 int  iommu_device_register(struct iommu_device *iommu);
@@ -589,7 +591,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev);
 struct iommu_fwspec {
 	const struct iommu_ops	*ops;
 	struct fwnode_handle	*iommu_fwnode;
-	void			*iommu_priv;
 	u32			flags;
 	u32			num_pasid_bits;
 	unsigned int		num_ids;
@@ -629,12 +630,12 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
 
 static inline void *dev_iommu_priv_get(struct device *dev)
 {
-	return dev->iommu->fwspec->iommu_priv;
+	return dev->iommu->priv;
 }
 
 static inline void dev_iommu_priv_set(struct device *dev, void *priv)
 {
-	dev->iommu->fwspec->iommu_priv = priv;
+	dev->iommu->priv = priv;
 }
 
 int iommu_probe_device(struct device *dev);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
