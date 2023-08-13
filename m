Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD4EEB64DD
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Aug 2023 12:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UERmI2PHehjkhAKZ/+GFHDlRMEvH2qkJ6NAeV6cdTM=; b=pxoV9BNql26lJ9tKSbESZKttbR
	ITh8HekHzjGGqmyFFGm35H8sNbl5g0Gv+3gKvcAAW9wOO9//qmUsPXngWBOwNGEBe22fQYMGuB1Y2
	LugrtaO7NBbOXmiF/sUVM0vutX93117d7/UP4BLvJ7YS4/ToAYP6SbeuElrZY91PtWOLoXta20z+c
	CJO0VkW3w3hdBF9yZG3XwXpJzoj+zTi6PHUAw/r7hQ6lX0Ytm0Gh1GoL7xHwB81+mnrcIYXGfzjYQ
	yYyyV1oQWkcCKmSz59zSIMRkZCv13uHvaW+7cRf2Y7FSZj7OxgDy7D7F4XSo/vedhQUbK9mooMmLw
	hZnVj16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qV9wl-00F512-2c;
	Sun, 13 Aug 2023 12:11:51 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qV9wi-00F50K-1R;
	Sun, 13 Aug 2023 12:11:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691928708; x=1723464708;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EPKMap/YIslWzTcA4tjCBfC0/lQThAIgVXzQUtL7nv8=;
  b=NZN+HEwLAyukKrnpi/Nv5vPG7dsLgzF/ojNOFEl8G7nGfMe6tATvVALN
   lJEx+YVqS7rUb80CJ1drOoX0d/voezr7DggUr6NVvAgss4QHwsIUJhikV
   APZ5SoL+erIjHM6E43czh3xf2uOdSmy+GJ6eYhr5ESgCyMSVJZADu073i
   Fzn3zjn+VaVJjXI8isnNjmhsF2g6jiiVwRM/U/sykiBISQunBsoAwB1+G
   AoNfnd3C1XxYAvrLUVEXNAH312P0zP6JdI4ZeC0CXGMKZRJaKOKuU5R/i
   Eq+gweARsOunJvk33mceoaRc2zsKA6Q8PWkrzWXLU/wV5XQoTCQP0TQ0F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="356852437"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="356852437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 05:11:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10800"; a="906929981"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="906929981"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.249.169.238]) ([10.249.169.238])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2023 05:11:32 -0700
Message-ID: <a9651d96-dbfb-aece-0811-2b36c4eb0a07@linux.intel.com>
Date: Sun, 13 Aug 2023 20:11:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: baolu.lu@linux.intel.com, Andy Gross <agross@kernel.org>,
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
 Chunyan Zhang <zhang.lyra@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>,
 Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v6 02/25] iommu: Add IOMMU_DOMAIN_PLATFORM
To: Jason Gunthorpe <jgg@nvidia.com>
References: <2-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <dde32ea5-2b1a-1148-c329-3c52ffcb71a7@linux.intel.com>
 <ZNds4kejneylOYBE@nvidia.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <ZNds4kejneylOYBE@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_051148_585431_8EB44F06 
X-CRM114-Status: GOOD (  20.39  )
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

On 2023/8/12 19:28, Jason Gunthorpe wrote:
> On Sat, Aug 12, 2023 at 09:36:33AM +0800, Baolu Lu wrote:
>>> @@ -290,6 +295,7 @@ struct iommu_ops {
>>>    	unsigned long pgsize_bitmap;
>>>    	struct module *owner;
>>>    	struct iommu_domain *identity_domain;
>>> +	struct iommu_domain *default_domain;
>>
>> I am imaging whether we can merge above two pointers into a single one.
>> It is either an IDENTITY or PLATFORM domain and the core will choose it
>> as the default domain of a group if iommu_group_alloc_default_domain()
>> fails to allocate one through the iommu dev_ops.
> 
> I think that would be the wrong direction..
> 
> identity_domain is a pointer that is always, ALWAYS an identity
> domain. It is the shortcut for drivers (and all drivers should do
> this) that implement a global static identity domain.

I see. I originally thought this was special for arm32.

> 
> default_domain is a shortcut to avoid implementing the entire flow
> around def_domain_type/domain_alloc for special cases. For this patch
> the specialc ase is the IOMMU_DOMAIN_PLATFORM.

I think this is special for drivers like s390. You don't want it to be
used beyond those special drivers, right?

If so, the naming of default_domain seems to be a bit generic. I can't
think of a better one, hence I am fine if you keep as it-is. After all,
the comment for this field has already explained it very clearly.

> We'll probably also get a blocking_domain pointer here too.

Yes.

> 
> All of this is removing the type multiplexor in alloc_domain so we can
> so  alloc_domain_paging()

Agreed with you. The dummy domains like identity and blocking could be
avoided from calling ops->domain_alloc.

>> Probably we could give it a more meaningful name? For example,
>> supplemental_domain or rescue_domain?
> 
> But that isn't what it is for, default_domain is the operational
> domain for attached drivers..

Best regards,
baolu

