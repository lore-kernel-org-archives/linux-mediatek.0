Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65A85EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Aug 2023 02:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d1ObxlCgrF33qnRpQ/1wUuT6tTDMvprT6kZoh0YZiz0=; b=k3lSq1LL4vTmT0IOlU8Y3S6S78
	KM4cvqVzdnKytjiBqCiOPLRVYgN3jA5+TySstcwT9meX4lwHcpkrIAQYoaPrEaAwoD5l0ECsVwDX8
	85a3boQdO59yAhLlS0KdjfFViSfHKxfqKOEvFl78QP1pGkKmQpAknmZw7lG80tMczTeRTEc++1QKj
	amUQA0D54Dml5+qcbJ8ETyApGCZ3H1+6T7cyJtqRjtWogGHFty72MPD4sKxUtb2lKOTxAM/ELkIpa
	X8B1XL9Vfdb2P/RUJaEftbpmdD/9m8m2vKCyO4dgTw1TIVmcQ5QIxg8Jk4tyl+F1Q3HqwAFaz989I
	ZBzq3YPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUeAg-00CSmX-2m;
	Sat, 12 Aug 2023 02:16:06 +0000
Received: from mgamail.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUeAb-00CSlC-0C;
	Sat, 12 Aug 2023 02:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691806561; x=1723342561;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sbxhrY1MVdB36V2CNTZkugKnmcToq8EzXXuZlM20LSI=;
  b=iboib7AyC7I0SuPpICZB+Hpj1+TUZL8LEzHpu+ZKnJDrW7JjtFzniZFF
   8YaaaIvA62wZ0F1j9IewqpRXZEXQntNteY4eB8svKtmqOx0EyAO0mim6A
   x/w4cHxcyl106xoMsyNmCh8mfdlUxhJfYxTlzUGqCY/2vQM/JHaAZFXQb
   q1Vd1Q4b/38HiaZnlzMcsGCkuI68EHSDv9a+TTdd3Nl+h3HfFWYYaSOmF
   q3mg4UhqLFGNq/Tl3Y84+cUUewuk2Ugu0Sp6JGlCwGTym9A18WFgd4MUr
   1DYrmRchrUvPPcknrNOpnN7J7hG/Ioznm56ayI8s7F0tcAXmjPPt5brfl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="375507200"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="375507200"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:15:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="979386282"
X-IronPort-AV: E=Sophos;i="6.01,167,1684825200"; 
   d="scan'208";a="979386282"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.254.215.79]) ([10.254.215.79])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 19:15:45 -0700
Message-ID: <b50a464a-fa28-e359-1bc5-4f2b105326ad@linux.intel.com>
Date: Sat, 12 Aug 2023 10:15:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 08/25] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bjorn Andersson
 <andersson@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>,
 Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
 <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
References: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <8-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_191601_178556_1DAEE58A 
X-CRM114-Status: GOOD (  31.46  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2023/8/3 8:07, Jason Gunthorpe wrote:
> Except for dart every driver returns 0 or IDENTITY from def_domain_type().
> 
> The drivers that return IDENTITY have some kind of good reason, typically
> that quirky hardware really can't support anything other than IDENTITY.
> 
> Arrange things so that if the driver says it needs IDENTITY then
> iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
> never reject the driver's override to IDENTITY.
> 
> The only real functional difference is that the PCI untrusted flag is now
> ignored for quirky HW instead of overriding the IOMMU driver.
> 
> This makes the next patch cleaner that wants to force IDENTITY always for
> ARM_IOMMU because there is no support for DMA.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>   drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
>   1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index c64365169b678d..53174179102d17 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1669,19 +1669,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
>   }
>   EXPORT_SYMBOL_GPL(fsl_mc_device_group);
>   
> -static int iommu_get_def_domain_type(struct device *dev)
> -{
> -	const struct iommu_ops *ops = dev_iommu_ops(dev);
> -
> -	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
> -		return IOMMU_DOMAIN_DMA;
> -
> -	if (ops->def_domain_type)
> -		return ops->def_domain_type(dev);
> -
> -	return 0;
> -}
> -
>   static struct iommu_domain *
>   __iommu_group_alloc_default_domain(const struct bus_type *bus,
>   				   struct iommu_group *group, int req_type)
> @@ -1775,36 +1762,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
>   static int iommu_get_default_domain_type(struct iommu_group *group,
>   					 int target_type)
>   {
> +	const struct iommu_ops *ops = dev_iommu_ops(
> +		list_first_entry(&group->devices, struct group_device, list)
> +			->dev);

How about consolidating above into a single helper?

--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1787,6 +1787,21 @@ __iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  	return __iommu_group_domain_alloc(group, req_type);
  }

+/*
+ * Returns the iommu_ops for the devices in an iommu group.
+ *
+ * It is assumed that all devices in an iommu group are managed by a single
+ * IOMMU unit. Therefore, this returns the dev_iommu_ops of the first 
device
+ * in the group.
+ */
+static const struct iommu_ops *group_iommu_ops(struct iommu_group *group)
+{
+	struct group_device *device;
+
+	device = list_first_entry(&group->devices, struct group_device, list);
+	return dev_iommu_ops(device->dev);
+}
+
  /*
   * req_type of 0 means "auto" which means to select a domain based on
   * iommu_def_domain_type or what the driver actually supports.
@@ -1794,10 +1809,7 @@ __iommu_group_alloc_default_domain(struct 
iommu_group *group, int req_type)
  static struct iommu_domain *
  iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
  {
-	struct device *dev =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev;
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
+	const struct iommu_ops *ops = group_iommu_ops(group);
  	struct iommu_domain *dom;

  	lockdep_assert_held(&group->mutex);
@@ -1888,9 +1900,7 @@ static int iommu_bus_notifier(struct 
notifier_block *nb,
  static int iommu_get_default_domain_type(struct iommu_group *group,
  					 int target_type)
  {
-	const struct iommu_ops *ops = dev_iommu_ops(
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev);
+	const struct iommu_ops *ops = group_iommu_ops(group);
  	int best_type = target_type;
  	struct group_device *gdev;
  	struct device *last_dev;
@@ -2124,13 +2134,9 @@ static struct iommu_domain 
*__iommu_domain_alloc(const struct iommu_ops *ops,
  static struct iommu_domain *
  __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
  {
-	struct device *dev =
-		list_first_entry(&group->devices, struct group_device, list)
-			->dev;
-
  	lockdep_assert_held(&group->mutex);

-	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, type);
+	return __iommu_domain_alloc(group_iommu_ops(group), dev, type);
  }

  struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)

>   	int best_type = target_type;
>   	struct group_device *gdev;
>   	struct device *last_dev;
> +	int type;
>   
>   	lockdep_assert_held(&group->mutex);
> -
>   	for_each_group_device(group, gdev) {
> -		unsigned int type = iommu_get_def_domain_type(gdev->dev);
> -
> -		if (best_type && type && best_type != type) {
> -			if (target_type) {
> -				dev_err_ratelimited(
> -					gdev->dev,
> -					"Device cannot be in %s domain\n",
> -					iommu_domain_type_str(target_type));
> -				return -1;
> -			}
> -
> -			dev_warn(
> -				gdev->dev,
> -				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
> -				iommu_domain_type_str(type), dev_name(last_dev),
> -				iommu_domain_type_str(best_type));
> -			return 0;
> +		type = best_type;
> +		if (ops->def_domain_type) {
> +			type = ops->def_domain_type(gdev->dev);
> +			if (best_type && type && best_type != type)
> +				goto err;
>   		}
> -		if (!best_type)
> -			best_type = type;
> +
> +		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> +			type = IOMMU_DOMAIN_DMA;
> +			if (best_type && type && best_type != type)
> +				goto err;
> +		}
> +		best_type = type;
>   		last_dev = gdev->dev;
>   	}
>   	return best_type;
> +
> +err:
> +	if (target_type) {
> +		dev_err_ratelimited(
> +			gdev->dev,
> +			"Device cannot be in %s domain - it is forcing %s\n",
> +			iommu_domain_type_str(target_type),
> +			iommu_domain_type_str(type));
> +		return -1;
> +	}
> +
> +	dev_warn(
> +		gdev->dev,
> +		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
> +		iommu_domain_type_str(type), dev_name(last_dev),
> +		iommu_domain_type_str(best_type));
> +	return 0;

This doesn't match the commit message, where it states:

"Arrange things so that if the driver says it needs IDENTITY then
  iommu_get_default_domain_type() either fails or returns IDENTITY.
"

I saw that this change was made in the sequential patch. It is probably
better to put that here?

>   }
>   
>   static void iommu_group_do_probe_finalize(struct device *dev)

Best regards,
baolu

