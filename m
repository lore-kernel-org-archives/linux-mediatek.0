Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2DD9C3F2D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92FA246AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IML/BDTW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92FA246AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tPJZNcfBw0f+Rlucmq4hiPhOtI1fcFjyfQhHFjqrJzc=; b=IML/BDTW14KuWQqd36IiuEAOYP
	wdgdtkmy38Jeh7c26n6vnfNVyPduHE3YT0eON/L3sKvVnvQwHAXPTegeZt1xBioYPhjUvdN4fVeb+
	Rkg96MrSEn1rptdeiJyIkYOiVKGFK+ypZxs5OqqGBHxbdmKXM09amDz2Xk6fxexn4amEbTkj/iM8y
	VlO0mW8+o7miG+EqjSYwuZ9nw2Ro5JbLMCoJyqZCESlKkcXlX52ZicsCc7RinQjCE8g77NSTIF76T
	bXzI951iaY8WUnf1DrLl+0Rz+Q+/KtnxbuWOSnU4HaIMnYW5GupypXVk+7dxMHOhhI1V7RKvtwdKu
	yRmXr2TQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7hGI-0006oP-1O; Fri, 28 Feb 2020 15:09:10 +0000
Received: from 8bytes.org ([2a01:238:4383:600:38bc:a715:4b6d:a889]
 helo=theia.8bytes.org)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7hFy-0006Lu-8Q
 for linux-mediatek@lists.infradead.org; Fri, 28 Feb 2020 15:08:53 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 27BC45BC; Fri, 28 Feb 2020 16:08:30 +0100 (CET)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 09/14] iommu/arm-smmu: Use accessor functions for iommu
 private data
Date: Fri, 28 Feb 2020 16:08:15 +0100
Message-Id: <20200228150820.15340-10-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200228150820.15340-1-joro@8bytes.org>
References: <20200228150820.15340-1-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_070850_600286_226BF7C8 
X-CRM114-Status: GOOD (  12.27  )
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

Make use of dev_iommu_priv_set/get() functions and simplify the code
where possible with this change.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/arm-smmu.c | 56 +++++++++++++++++++++-------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 980aae73b45b..8276fff5f7dc 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -98,12 +98,15 @@ struct arm_smmu_master_cfg {
 	s16				smendx[];
 };
 #define INVALID_SMENDX			-1
-#define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
-#define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
-#define fwspec_smendx(fw, i) \
-	(i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
-#define for_each_cfg_sme(fw, i, idx) \
-	for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
+#define __fwspec_cfg(dev) ((struct arm_smmu_master_cfg *)dev_iommu_priv_get(dev))
+#define fwspec_smmu(dev)  (__fwspec_cfg(dev)->smmu)
+#define fwspec_smendx(dev, i)				\
+	(i >= dev_iommu_fwspec_get(dev)->num_ids ?	\
+		INVALID_SMENDX :			\
+		__fwspec_cfg(dev)->smendx[i])
+#define for_each_cfg_sme(dev, i, idx) \
+	for (i = 0; idx = fwspec_smendx(dev, i), \
+	     i < dev_iommu_fwspec_get(dev)->num_ids; ++i)
 
 static bool using_legacy_binding, using_generic_binding;
 
@@ -1061,7 +1064,7 @@ static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
 static int arm_smmu_master_alloc_smes(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
 	struct arm_smmu_device *smmu = cfg->smmu;
 	struct arm_smmu_smr *smrs = smmu->smrs;
 	struct iommu_group *group;
@@ -1069,7 +1072,7 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 
 	mutex_lock(&smmu->stream_map_mutex);
 	/* Figure out a viable stream map entry allocation */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
 		u16 mask = FIELD_GET(ARM_SMMU_SMR_MASK, fwspec->ids[i]);
 
@@ -1100,7 +1103,7 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	iommu_group_put(group);
 
 	/* It worked! Now, poke the actual hardware */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		arm_smmu_write_sme(smmu, idx);
 		smmu->s2crs[idx].group = group;
 	}
@@ -1117,14 +1120,14 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	return ret;
 }
 
-static void arm_smmu_master_free_smes(struct iommu_fwspec *fwspec)
+static void arm_smmu_master_free_smes(struct device *dev)
 {
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
-	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
+	struct arm_smmu_device *smmu = fwspec_smmu(dev);
 	int i, idx;
 
 	mutex_lock(&smmu->stream_map_mutex);
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		if (arm_smmu_free_sme(smmu, idx))
 			arm_smmu_write_sme(smmu, idx);
 		cfg->smendx[i] = INVALID_SMENDX;
@@ -1133,7 +1136,7 @@ static void arm_smmu_master_free_smes(struct iommu_fwspec *fwspec)
 }
 
 static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
-				      struct iommu_fwspec *fwspec)
+				      struct device *dev)
 {
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
@@ -1146,7 +1149,7 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	else
 		type = S2CR_TYPE_TRANS;
 
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
 			continue;
 
@@ -1160,10 +1163,10 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
-	int ret;
+	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct arm_smmu_device *smmu;
-	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	int ret;
 
 	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
 		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
@@ -1177,10 +1180,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	 * domains, just say no (but more politely than by dereferencing NULL).
 	 * This should be at least a WARN_ON once that's sorted.
 	 */
-	if (!fwspec->iommu_priv)
+	if (!dev_iommu_priv_get(dev))
 		return -ENODEV;
 
-	smmu = fwspec_smmu(fwspec);
+	smmu = fwspec_smmu(dev);
 
 	ret = arm_smmu_rpm_get(smmu);
 	if (ret < 0)
@@ -1204,7 +1207,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	}
 
 	/* Looks ok, so add the device to the domain */
-	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
+	ret = arm_smmu_domain_add_master(smmu_domain, dev);
 
 	/*
 	 * Setup an autosuspend delay to avoid bouncing runpm state.
@@ -1429,7 +1432,7 @@ static int arm_smmu_add_device(struct device *dev)
 		goto out_free;
 
 	cfg->smmu = smmu;
-	fwspec->iommu_priv = cfg;
+	dev_iommu_priv_set(dev, cfg);
 	while (i--)
 		cfg->smendx[i] = INVALID_SMENDX;
 
@@ -1467,7 +1470,7 @@ static void arm_smmu_remove_device(struct device *dev)
 	if (!fwspec || fwspec->ops != &arm_smmu_ops)
 		return;
 
-	cfg  = fwspec->iommu_priv;
+	cfg  = dev_iommu_priv_get(dev);
 	smmu = cfg->smmu;
 
 	ret = arm_smmu_rpm_get(smmu);
@@ -1475,23 +1478,22 @@ static void arm_smmu_remove_device(struct device *dev)
 		return;
 
 	iommu_device_unlink(&smmu->iommu, dev);
-	arm_smmu_master_free_smes(fwspec);
+	arm_smmu_master_free_smes(dev);
 
 	arm_smmu_rpm_put(smmu);
 
 	iommu_group_remove_device(dev);
-	kfree(fwspec->iommu_priv);
 	iommu_fwspec_free(dev);
+	kfree(cfg);
 }
 
 static struct iommu_group *arm_smmu_device_group(struct device *dev)
 {
-	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
+	struct arm_smmu_device *smmu = fwspec_smmu(dev);
 	struct iommu_group *group = NULL;
 	int i, idx;
 
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(dev, i, idx) {
 		if (group && smmu->s2crs[idx].group &&
 		    group != smmu->s2crs[idx].group)
 			return ERR_PTR(-EINVAL);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
