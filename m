Return-Path: <SRS0=hrCJ=5I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F209C54EEB
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 16:02:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D552920637
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Mar 2020 16:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jhvieANi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D552920637
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YRv4xpIkH4kOoXP+lM6AbQIVxZGaPieoVz5jTTb0JCI=; b=jhvieANiyLVm+/Da1cCZii1ww
	pTPo0XhJ6GJCWN6G2AneMqPcJo81waSRbRym7sdUuP25ELf9uRJQfOMtMGsL+9lAXXS5lSTJLrSm9
	iKfr/I8p74ScoZrRFN96q/p9gM0lp3m4pmTLI1ghWyFbvmPjLUxOaHbK4eXMAst2PEcZ2TQNyqTHS
	mqcp+N+DNE/eF4iWM9/8olrzFUiOT7aZ77jfretatjEJJ2drpUuwLVqMmregCT845jAkbsv8YNEsZ
	bNNvA0t2dn7ihzzGxIP5kw6x4Q5hjLc2pB0KyWkacrPvAvBeBrigEYI+a7ybvx7nyBXk7W2oMrbey
	Dmsg02GLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGPXH-0005Dk-CG; Mon, 23 Mar 2020 16:02:43 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGPXE-0005Cr-Bh
 for linux-mediatek@lists.infradead.org; Mon, 23 Mar 2020 16:02:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393571FB;
 Mon, 23 Mar 2020 09:02:37 -0700 (PDT)
Received: from [192.168.1.123] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C95033F7C3;
 Mon, 23 Mar 2020 09:02:34 -0700 (PDT)
Subject: Re: [PATCH v3 10/15] iommu/arm-smmu: Use accessor functions for iommu
 private data
To: Joerg Roedel <joro@8bytes.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <20200320091414.3941-1-joro@8bytes.org>
 <20200320091414.3941-11-joro@8bytes.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <09ed4676-449e-c6eb-8c51-c15b326c206c@arm.com>
Date: Mon, 23 Mar 2020 16:02:33 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200320091414.3941-11-joro@8bytes.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_090240_485300_27B4D3DE 
X-CRM114-Status: GOOD (  24.68  )
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
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "guohanjun@huawei.com" <guohanjun@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Sudeep Holla <Sudeep.Holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Joerg,

Thanks for tackling this!

On 2020-03-20 9:14 am, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions and simplify the code
> where possible with this change.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>   drivers/iommu/arm-smmu.c | 57 +++++++++++++++++++++-------------------
>   1 file changed, 30 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 980aae73b45b..7aa36e6c19c0 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -98,12 +98,15 @@ struct arm_smmu_master_cfg {
>   	s16				smendx[];
>   };
>   #define INVALID_SMENDX			-1
> -#define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
> -#define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
> -#define fwspec_smendx(fw, i) \
> -	(i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
> -#define for_each_cfg_sme(fw, i, idx) \
> -	for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
> +#define __fwspec_cfg(dev) ((struct arm_smmu_master_cfg *)dev_iommu_priv_get(dev))
> +#define fwspec_smmu(dev)  (__fwspec_cfg(dev)->smmu)
> +#define fwspec_smendx(dev, i)				\
> +	(i >= dev_iommu_fwspec_get(dev)->num_ids ?	\
> +		INVALID_SMENDX :			\
> +		__fwspec_cfg(dev)->smendx[i])
> +#define for_each_cfg_sme(dev, i, idx) \
> +	for (i = 0; idx = fwspec_smendx(dev, i), \
> +	     i < dev_iommu_fwspec_get(dev)->num_ids; ++i)

Yikes, this ends up pretty ugly, and I'd prefer not have this much 
complexity hidden in macros that were intended just to be convenient 
shorthand. Would you mind pulling in the patch below as a precursor?

Other than that, the rest of the series looks OK at a glance. We should 
also move fwspec->ops to dev_iommu, as those are "IOMMU API" data rather 
than "firmware" data, but let's consider that separately as this series 
is already long enough.

Thanks,
Robin.

----->8-----
Subject: [PATCH] iommu/arm-smmu: Refactor master_cfg/fwspec usage

In preparation for restructuring iommu_fwspec, refactor the way we
access the arm_smmu_master_cfg private data to be less dependent on
the current layout.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
  drivers/iommu/arm-smmu.c | 42 +++++++++++++++++++++-------------------
  1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 16c4b87af42b..b4978f45a7f2 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -98,12 +98,10 @@ struct arm_smmu_master_cfg {
  	s16				smendx[];
  };
  #define INVALID_SMENDX			-1
-#define __fwspec_cfg(fw) ((struct arm_smmu_master_cfg *)fw->iommu_priv)
-#define fwspec_smmu(fw)  (__fwspec_cfg(fw)->smmu)
-#define fwspec_smendx(fw, i) \
-	(i >= fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[i])
-#define for_each_cfg_sme(fw, i, idx) \
-	for (i = 0; idx = fwspec_smendx(fw, i), i < fw->num_ids; ++i)
+#define cfg_smendx(cfg, fw, i) \
+	(i >= fw->num_ids ? INVALID_SMENDX : cfg->smendx[i])
+#define for_each_cfg_sme(cfg, fw, i, idx) \
+	for (i = 0; idx = cfg_smendx(cfg, fw, i), i < fw->num_ids; ++i)

  static bool using_legacy_binding, using_generic_binding;

@@ -1069,7 +1067,7 @@ static int arm_smmu_master_alloc_smes(struct 
device *dev)

  	mutex_lock(&smmu->stream_map_mutex);
  	/* Figure out a viable stream map entry allocation */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		u16 sid = FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
  		u16 mask = FIELD_GET(ARM_SMMU_SMR_MASK, fwspec->ids[i]);

@@ -1100,7 +1098,7 @@ static int arm_smmu_master_alloc_smes(struct 
device *dev)
  	iommu_group_put(group);

  	/* It worked! Now, poke the actual hardware */
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		arm_smmu_write_sme(smmu, idx);
  		smmu->s2crs[idx].group = group;
  	}
@@ -1117,14 +1115,14 @@ static int arm_smmu_master_alloc_smes(struct 
device *dev)
  	return ret;
  }

-static void arm_smmu_master_free_smes(struct iommu_fwspec *fwspec)
+static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg,
+				      struct iommu_fwspec *fwspec)
  {
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
-	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_device *smmu = cfg->smmu;
  	int i, idx;

  	mutex_lock(&smmu->stream_map_mutex);
-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		if (arm_smmu_free_sme(smmu, idx))
  			arm_smmu_write_sme(smmu, idx);
  		cfg->smendx[i] = INVALID_SMENDX;
@@ -1133,6 +1131,7 @@ static void arm_smmu_master_free_smes(struct 
iommu_fwspec *fwspec)
  }

  static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
+				      struct arm_smmu_master_cfg *cfg,
  				      struct iommu_fwspec *fwspec)
  {
  	struct arm_smmu_device *smmu = smmu_domain->smmu;
@@ -1146,7 +1145,7 @@ static int arm_smmu_domain_add_master(struct 
arm_smmu_domain *smmu_domain,
  	else
  		type = S2CR_TYPE_TRANS;

-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
  			continue;

@@ -1162,8 +1161,9 @@ static int arm_smmu_attach_dev(struct iommu_domain 
*domain, struct device *dev)
  {
  	int ret;
  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_device *smmu;
  	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_master_cfg *cfg;
+	struct arm_smmu_device *smmu;

  	if (!fwspec || fwspec->ops != &arm_smmu_ops) {
  		dev_err(dev, "cannot attach to SMMU, is it on the same bus?\n");
@@ -1177,10 +1177,11 @@ static int arm_smmu_attach_dev(struct 
iommu_domain *domain, struct device *dev)
  	 * domains, just say no (but more politely than by dereferencing NULL).
  	 * This should be at least a WARN_ON once that's sorted.
  	 */
-	if (!fwspec->iommu_priv)
+	cfg = fwspec->iommu_priv;
+	if (!cfg)
  		return -ENODEV;

-	smmu = fwspec_smmu(fwspec);
+	smmu = cfg->smmu;

  	ret = arm_smmu_rpm_get(smmu);
  	if (ret < 0)
@@ -1204,7 +1205,7 @@ static int arm_smmu_attach_dev(struct iommu_domain 
*domain, struct device *dev)
  	}

  	/* Looks ok, so add the device to the domain */
-	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
+	ret = arm_smmu_domain_add_master(smmu_domain, cfg, fwspec);

  	/*
  	 * Setup an autosuspend delay to avoid bouncing runpm state.
@@ -1475,7 +1476,7 @@ static void arm_smmu_remove_device(struct device *dev)
  		return;

  	iommu_device_unlink(&smmu->iommu, dev);
-	arm_smmu_master_free_smes(fwspec);
+	arm_smmu_master_free_smes(cfg, fwspec);

  	arm_smmu_rpm_put(smmu);

@@ -1487,11 +1488,12 @@ static void arm_smmu_remove_device(struct device 
*dev)
  static struct iommu_group *arm_smmu_device_group(struct device *dev)
  {
  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct arm_smmu_device *smmu = fwspec_smmu(fwspec);
+	struct arm_smmu_master_cfg *cfg = fwspec->iommu_priv;
+	struct arm_smmu_device *smmu = cfg->smmu;
  	struct iommu_group *group = NULL;
  	int i, idx;

-	for_each_cfg_sme(fwspec, i, idx) {
+	for_each_cfg_sme(cfg, fwspec, i, idx) {
  		if (group && smmu->s2crs[idx].group &&
  		    group != smmu->s2crs[idx].group)
  			return ERR_PTR(-EINVAL);
-- 
2.17.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
