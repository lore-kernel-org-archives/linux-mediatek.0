Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D428DC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 11:01:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE2E22240
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 11:01:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AE2E22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NjCOJJba70TOGeV5pcOdrIifeSq/EPkAt/8t8LGYwlU=; b=vS6O/CcnwB1KyGvD+bPucXrEi
	Ky2harzY8xDfOCiVMiIxKmwqrBwxVbywhKrT4asqZ17fOBm36BZ0pFozoSH9XiUmxv5tmbJdTjUCk
	YC7tXHYtxTqQiK1dwDyK/W9TbikeM6gaClanbdndDCNY8PvWD+qVjngb5AltO3cXOwYFizSJwdEBo
	t2JBdWG6J8r/ECLMQLo19XyT58U32Q2x2WsnlQWgrnjcCxFqtzarlEe+zotE8Q1kX3DuPLt58+ysm
	SdgKX3Dk+NUSjKpAAvNSrs2dwwl+g/AIVZNyZ2d8hbsQdbPbKN3jEbd526E2852QAGGI/wI5qC53p
	djz7846cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks1sw-0007yr-QZ; Wed, 23 Dec 2020 11:00:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks1st-0007xv-91; Wed, 23 Dec 2020 11:00:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C09CE101E;
 Wed, 23 Dec 2020 03:00:40 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3889E3F6CF;
 Wed, 23 Dec 2020 03:00:38 -0800 (PST)
Subject: Re: [PATCH v3 6/7] iommu/mediatek: Gather iova in iommu_unmap to
 achieve tlb sync once
To: Tomasz Figa <tfiga@chromium.org>, Yong Wu <yong.wu@mediatek.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-7-yong.wu@mediatek.com> <X+MGKBYKdmPNz7VL@chromium.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <1de76b46-d9c1-4011-c087-1df236f442c3@arm.com>
Date: Wed, 23 Dec 2020 11:00:37 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <X+MGKBYKdmPNz7VL@chromium.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_060047_445867_87C3BCC2 
X-CRM114-Status: GOOD (  26.91  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Tomasz Figa <tfiga@google.com>, kernel-team@android.com,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-12-23 08:56, Tomasz Figa wrote:
> On Wed, Dec 16, 2020 at 06:36:06PM +0800, Yong Wu wrote:
>> In current iommu_unmap, this code is:
>>
>> 	iommu_iotlb_gather_init(&iotlb_gather);
>> 	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
>> 	iommu_iotlb_sync(domain, &iotlb_gather);
>>
>> We could gather the whole iova range in __iommu_unmap, and then do tlb
>> synchronization in the iommu_iotlb_sync.
>>
>> This patch implement this, Gather the range in mtk_iommu_unmap.
>> then iommu_iotlb_sync call tlb synchronization for the gathered iova range.
>> we don't call iommu_iotlb_gather_add_page since our tlb synchronization
>> could be regardless of granule size.
>>
>> In this way, gather->start is impossible ULONG_MAX, remove the checking.
>>
>> This patch aims to do tlb synchronization *once* in the iommu_unmap.
>>
>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>> ---
>>   drivers/iommu/mtk_iommu.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index db7d43adb06b..89cec51405cd 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -506,7 +506,12 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
>>   			      struct iommu_iotlb_gather *gather)
>>   {
>>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>> +	unsigned long long end = iova + size;
>>   
>> +	if (gather->start > iova)
>> +		gather->start = iova;
>> +	if (gather->end < end)
>> +		gather->end = end;
> 
> I don't know how common the case is, but what happens if
> gather->start...gather->end is a disjoint range from iova...end? E.g.
> 
>   | gather      | ..XXX... | iova |
>   |             |          |      |
>   gather->start |          iova   |
>                 gather->end       end
> 
> We would also end up invalidating the TLB for the XXX area, which could
> affect the performance.

Take a closer look at iommu_unmap() - the gather data is scoped to each 
individual call, so that can't possibly happen.

> Also, why is the existing code in __arm_v7s_unmap() not enough? It seems
> to call io_pgtable_tlb_add_page() already, so it should be batching the
> flushes.

Because if we leave io-pgtable in charge of maintenance it will also 
inject additional invalidations and syncs for the sake of strictly 
correct walk cache maintenance. Apparently we can get away without that 
on this hardware, so the fundamental purpose of this series is to 
sidestep it.

It's proven to be cleaner overall to devolve this kind of "non-standard" 
TLB maintenance back to drivers rather than try to cram yet more 
special-case complexity into io-pgtable itself. I'm planning to clean up 
the remains of the TLBI_ON_MAP quirk entirely after this.

Robin.

>>   	return dom->iop->unmap(dom->iop, iova, size, gather);
>>   }
>>   
>> @@ -523,9 +528,6 @@ static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
>>   	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>>   	size_t length = gather->end - gather->start;
>>   
>> -	if (gather->start == ULONG_MAX)
>> -		return;
>> -
>>   	mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
>>   				       dom->data);
>>   }
>> -- 
>> 2.18.0
>>
>> _______________________________________________
>> iommu mailing list
>> iommu@lists.linux-foundation.org
>> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
