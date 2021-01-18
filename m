Return-Path: <SRS0=/Mgn=GV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3999C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 17:14:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65385222BB
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jan 2021 17:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65385222BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JHCBHdXNSCJqKg5+3wDma+ngcB1U0LQw1jWVVLzqSFY=; b=1legIsncrk/Vrw6Dre3T3hYtk
	i8DEG8SXKpwMMTmcma/dVbuAA/IInLRdY9CjDXwUbCBuanfI0T6yFP3p+fy5Mux+nFYatfbVvTXlg
	PM2d4/bp9mzDl8C5mXtLyNCqkthSCXxbGM5qeAs+JxYRTvOxCPhY3KOBBw87FANVvlzjXpSQp+r2j
	CAgT9UdBA3HE94fK+ZpJ2BXnuaOOIre/PV+b3pUmpuwgccv6qsoHm0EXbBnZe/bSXfXlpIPhWjSm2
	FFhx3dLbimxESCI8bn659JzzGj7iZEvn8qJQ9AJNtxlhgja38o1y3phLYDFtSJXR77ijv97e98X9C
	65xcRK3Cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Y6s-0001GI-Q1; Mon, 18 Jan 2021 17:14:34 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Y6p-0001FL-2H; Mon, 18 Jan 2021 17:14:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D4E731B;
 Mon, 18 Jan 2021 09:14:24 -0800 (PST)
Received: from [10.57.39.58] (unknown [10.57.39.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 403C83F719;
 Mon, 18 Jan 2021 09:14:22 -0800 (PST)
Subject: Re: [PATCH v3 6/7] iommu/mediatek: Gather iova in iommu_unmap to
 achieve tlb sync once
To: Will Deacon <will@kernel.org>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
 <20201216103607.23050-7-yong.wu@mediatek.com>
 <e1e17782-a9f3-6b64-1630-bf29af5241cf@arm.com>
 <20210118165833.GA17722@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5043519d-fa2b-b066-8d6d-aa7a55a14b69@arm.com>
Date: Mon, 18 Jan 2021 17:14:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118165833.GA17722@willie-the-truck>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_121431_171861_A9647B00 
X-CRM114-Status: GOOD (  13.06  )
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
 Tomasz Figa <tfiga@google.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-01-18 16:58, Will Deacon wrote:
> On Mon, Jan 18, 2021 at 04:35:22PM +0000, Robin Murphy wrote:
>> On 2020-12-16 10:36, Yong Wu wrote:
>>> In current iommu_unmap, this code is:
>>>
>>> 	iommu_iotlb_gather_init(&iotlb_gather);
>>> 	ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
>>> 	iommu_iotlb_sync(domain, &iotlb_gather);
>>>
>>> We could gather the whole iova range in __iommu_unmap, and then do tlb
>>> synchronization in the iommu_iotlb_sync.
>>>
>>> This patch implement this, Gather the range in mtk_iommu_unmap.
>>> then iommu_iotlb_sync call tlb synchronization for the gathered iova range.
>>> we don't call iommu_iotlb_gather_add_page since our tlb synchronization
>>> could be regardless of granule size.
>>>
>>> In this way, gather->start is impossible ULONG_MAX, remove the checking.
>>>
>>> This patch aims to do tlb synchronization *once* in the iommu_unmap.
>>
>> Assuming the update to patch #4 simply results in "unsigned long end = iova
>> + size - 1;" here,
>>
>> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> 
> There's a v4 here:
> 
> https://lore.kernel.org/r/20210107122909.16317-1-yong.wu@mediatek.com

Ha, so there is! Apparently I missed that in my post-holiday sweep last 
week and leant too heavily on the inbox-in-date-order assumption. Lemme 
just go catch up...

Thanks,
Robin.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
