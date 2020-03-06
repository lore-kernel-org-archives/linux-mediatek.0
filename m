Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC972C3F2D6
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 11:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FFFD20848
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 11:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ngsVFx4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FFFD20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hI/SS4s/bNRMnvmpYVmKoMLjpTnubxXDTgitwojzpDw=; b=ngsVFx4b+DkshE
	J5dUUSWyyGMuWh6wBYgyvL/r1Z15F0nkOvgbf0gGZB90AoT25qCeOa5jMGbsMy+LS8o8OhLK8OJ0P
	KD/e1MEsXbzuSG/hYH6bTV84eJxgLNFOetYuIjjBByCOKkx+nr+Um5kmHyNrXLFNBmfS0QMje0ZpB
	9VKX+NlScu5u82PPIQZU4wu9OngTCuNymyD4rPzeCfb6KbR9LV0+y0c5hFEp2BHGksTtWF5tS23IS
	WozJP+vikUQpPEN6WH+gDpXlHKeOkXNhBFIUxzgJPlpFCnHBrCIygC0zchuFpWKkh7cNt9d8uZ52H
	sbRMyWjB2DRwjg3gMw6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jAAmV-0005Ja-6W; Fri, 06 Mar 2020 11:04:39 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jAAmS-0005DQ-Ck
 for linux-mediatek@lists.infradead.org; Fri, 06 Mar 2020 11:04:38 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6BC413F04F0A13261840;
 Fri,  6 Mar 2020 19:04:28 +0800 (CST)
Received: from [127.0.0.1] (10.177.223.23) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Mar 2020
 19:04:17 +0800
Subject: Re: [PATCH 00/14] iommu: Move iommu_fwspec out of 'struct device'
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200228150820.15340-1-joro@8bytes.org>
 <ea839f32-194a-29ea-57fc-22caea40b981@huawei.com>
 <20200306100955.GB50020@myrica>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <c1a0d107-39a2-a25d-ec41-1e5aec68c5ec@huawei.com>
Date: Fri, 6 Mar 2020 19:04:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20200306100955.GB50020@myrica>
Content-Language: en-US
X-Originating-IP: [10.177.223.23]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200306_030436_607145_70D751EF 
X-CRM114-Status: GOOD (  17.64  )
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
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Linuxarm <linuxarm@huawei.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020/3/6 18:09, Jean-Philippe Brucker wrote:
> On Fri, Mar 06, 2020 at 04:39:37PM +0800, Hanjun Guo wrote:
>> Hi Joerg,
>>
>> On 2020/2/28 23:08, Joerg Roedel wrote:
>>> Hi,
>>>
>>> here is a patch-set to rename iommu_param to dev_iommu and
>>> establish it as a struct for generic per-device iommu-data.
>>> Also move the iommu_fwspec pointer from struct device into
>>> dev_iommu to have less iommu-related pointers in struct
>>> device.
>>>
>>> The bigger part of this patch-set moves the iommu_priv
>>> pointer from struct iommu_fwspec to dev_iommu, making is
>>> usable for iommu-drivers which do not use fwspecs.
>>>
>>> The changes for that were mostly straightforward, except for
>>> the arm-smmu (_not_ arm-smmu-v3) and the qcom iommu driver.
>>> Unfortunatly I don't have the hardware for those, so any
>>> testing of these drivers is greatly appreciated.
>>
>> I tested this patch set on Kunpeng 920 ARM64 server which
>> using smmu-v3 with ACPI booting, but triggered a NULL
>> pointer dereference and panic at boot:
> 
> I think that's because patch 01/14 move the fwspec access too early. In 
> 
>                 err = pci_for_each_dma_alias(to_pci_dev(dev),
>                                              iort_pci_iommu_init, &info);
> 
>                 if (!err && iort_pci_rc_supports_ats(node))
>                         dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> 
> the iommu_fwspec is only valid if iort_pci_iommu_init() initialized it
> successfully, if err == 0. The following might fix it:

Good catch :)

> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index 0e981d7f3c7d..7d04424189df 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1015,7 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		return ops;
> 
>  	if (dev_is_pci(dev)) {
> -		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +		struct iommu_fwspec *fwspec;
>  		struct pci_bus *bus = to_pci_dev(dev)->bus;
>  		struct iort_pci_alias_info info = { .dev = dev };
> 
> @@ -1028,7 +1028,8 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		err = pci_for_each_dma_alias(to_pci_dev(dev),
>  					     iort_pci_iommu_init, &info);
> 
> -		if (!err && iort_pci_rc_supports_ats(node))
> +		fwspec = dev_iommu_fwspec_get(dev);
> +		if (fwspec && iort_pci_rc_supports_ats(node))
>  			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
>  	} else {
>  		int i = 0;

And the panic disappeared. Joerg, please feel free to add my Tested-by
for smmu-v3 and IORT ACPI patches with above changes.

> 
> 
> Note that this use of iommu_fwspec will be removed by the ATS cleanup
> series [1], but this change should work as a temporary fix.

Yes, as your patch set will set the ats_supported flag in the
host bridge level, not per device, nice cleanup.

Thanks
Hanjun


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
