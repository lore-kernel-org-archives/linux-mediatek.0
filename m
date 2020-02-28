Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6464EC3F2CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D45C246AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GC8xrIt7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D45C246AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MO0MSDR/23SNqyNBltwoBQ+WBM6Ew4g1SrQzgIC3Ge0=; b=GC8xrIt72LhLKyCrzUm/DwCg1N
	Yll0jSQZS5YR4cpl65e7MQDBL379cNeJC7n2RaG9W8E9SHPTj0jUJ844sfaPnMK+Da2My4mRW0/24
	cHSz8x6UoE8NH5nKDFEmtPbKZvA+yE4Ot6+eFgC7E7CRVA+poXd5Ogfid2izUtKwLSFeVbDeukuuy
	6olWo/FKYbv57YK88dRrAZlMMPRVy8o1NxKbReE2w5Y9JQzX0aYnLVPiMo92IuWX5A5bGPm7TUZ6h
	Pbbpk0hidDWzZVcP9BlyAPRMUrB78QQkvlgkPaEQmnWdNwVUyhDIS5KzSyM4p3rGL3620t6vWz+Qq
	H2LfaVJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hGO-000703-3v; Fri, 28 Feb 2020 15:09:16 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hFy-0006MM-FF
 for linux-mediatek@lists.infradead.org; Fri, 28 Feb 2020 15:08:54 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id BE227646; Fri, 28 Feb 2020 16:08:30 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 12/14] iommu/qcom: Use accessor functions for iommu private
 data
Date: Fri, 28 Feb 2020 16:08:18 +0100
Message-Id: <20200228150820.15340-13-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
References: <20200228150820.15340-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070850_817865_F8B998D1 
X-CRM114-Status: GOOD (  13.51  )
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
 drivers/iommu/qcom_iommu.c | 61 ++++++++++++++++++++++----------------
 1 file changed, 36 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 4328da0b0a9f..80147f82d427 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -74,16 +74,19 @@ static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)
 
 static const struct iommu_ops qcom_iommu_ops;
 
-static struct qcom_iommu_dev * to_iommu(struct iommu_fwspec *fwspec)
+static struct qcom_iommu_dev * to_iommu(struct device *dev)
 {
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+
 	if (!fwspec || fwspec->ops != &qcom_iommu_ops)
 		return NULL;
-	return fwspec->iommu_priv;
+
+	return dev_iommu_priv_get(dev);
 }
 
-static struct qcom_iommu_ctx * to_ctx(struct iommu_fwspec *fwspec, unsigned asid)
+static struct qcom_iommu_ctx * to_ctx(struct device *dev, unsigned asid)
 {
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	if (!qcom_iommu)
 		return NULL;
 	return qcom_iommu->ctxs[asid - 1];
@@ -115,11 +118,14 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned reg)
 
 static void qcom_iommu_tlb_sync(void *cookie)
 {
-	struct iommu_fwspec *fwspec = cookie;
+	struct iommu_fwspec *fwspec;
+	struct device *dev = cookie;
 	unsigned i;
 
+	fwspec = dev_iommu_fwspec_get(dev);
+
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 		unsigned int val, ret;
 
 		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
@@ -133,11 +139,14 @@ static void qcom_iommu_tlb_sync(void *cookie)
 
 static void qcom_iommu_tlb_inv_context(void *cookie)
 {
-	struct iommu_fwspec *fwspec = cookie;
+	struct device *dev = cookie;
+	struct iommu_fwspec *fwspec;
 	unsigned i;
 
+	fwspec = dev_iommu_fwspec_get(dev);
+
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
 	}
 
@@ -147,13 +156,16 @@ static void qcom_iommu_tlb_inv_context(void *cookie)
 static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 					    size_t granule, bool leaf, void *cookie)
 {
-	struct iommu_fwspec *fwspec = cookie;
+	struct device *dev = cookie;
+	struct iommu_fwspec *fwspec;
 	unsigned i, reg;
 
 	reg = leaf ? ARM_SMMU_CB_S1_TLBIVAL : ARM_SMMU_CB_S1_TLBIVA;
 
+	fwspec = dev_iommu_fwspec_get(dev);
+
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 		size_t s = size;
 
 		iova = (iova >> 12) << 12;
@@ -222,9 +234,10 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 
 static int qcom_iommu_init_domain(struct iommu_domain *domain,
 				  struct qcom_iommu_dev *qcom_iommu,
-				  struct iommu_fwspec *fwspec)
+				  struct device *dev)
 {
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct io_pgtable_ops *pgtbl_ops;
 	struct io_pgtable_cfg pgtbl_cfg;
 	int i, ret = 0;
@@ -243,7 +256,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	};
 
 	qcom_domain->iommu = qcom_iommu;
-	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, fwspec);
+	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, dev);
 	if (!pgtbl_ops) {
 		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
 		ret = -ENOMEM;
@@ -256,7 +269,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	domain->geometry.force_aperture = true;
 
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 
 		if (!ctx->secure_init) {
 			ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
@@ -363,8 +376,7 @@ static void qcom_iommu_domain_free(struct iommu_domain *domain)
 
 static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
 	int ret;
 
@@ -375,7 +387,7 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 
 	/* Ensure that the domain is finalized */
 	pm_runtime_get_sync(qcom_iommu->dev);
-	ret = qcom_iommu_init_domain(domain, qcom_iommu, fwspec);
+	ret = qcom_iommu_init_domain(domain, qcom_iommu, dev);
 	pm_runtime_put_sync(qcom_iommu->dev);
 	if (ret < 0)
 		return ret;
@@ -397,9 +409,9 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 
 static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	unsigned i;
 
 	if (WARN_ON(!qcom_domain->iommu))
@@ -407,7 +419,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 
 	pm_runtime_get_sync(qcom_iommu->dev);
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
 
 		/* Disable the context bank: */
 		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
@@ -514,7 +526,7 @@ static bool qcom_iommu_capable(enum iommu_cap cap)
 
 static int qcom_iommu_add_device(struct device *dev)
 {
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev_iommu_fwspec_get(dev));
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 	struct iommu_group *group;
 	struct device_link *link;
 
@@ -545,7 +557,7 @@ static int qcom_iommu_add_device(struct device *dev)
 
 static void qcom_iommu_remove_device(struct device *dev)
 {
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev_iommu_fwspec_get(dev));
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
 
 	if (!qcom_iommu)
 		return;
@@ -557,7 +569,6 @@ static void qcom_iommu_remove_device(struct device *dev)
 
 static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct qcom_iommu_dev *qcom_iommu;
 	struct platform_device *iommu_pdev;
 	unsigned asid = args->args[0];
@@ -583,14 +594,14 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	    WARN_ON(asid > qcom_iommu->num_ctxs))
 		return -EINVAL;
 
-	if (!fwspec->iommu_priv) {
-		fwspec->iommu_priv = qcom_iommu;
+	if (dev_iommu_priv_get(dev)) {
+		dev_iommu_priv_set(dev, qcom_iommu);
 	} else {
 		/* make sure devices iommus dt node isn't referring to
 		 * multiple different iommu devices.  Multiple context
 		 * banks are ok, but multiple devices are not:
 		 */
-		if (WARN_ON(qcom_iommu != fwspec->iommu_priv))
+		if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
 			return -EINVAL;
 	}
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
