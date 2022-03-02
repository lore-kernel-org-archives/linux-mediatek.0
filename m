Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF73AC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 11:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39NOYhgCtxI4B1fnQj+eFCpgzV8hoZnSn8TN0Szao6A=; b=y1k8+J/NIAsHCB
	73esTqHqcHyGLQ52Hq2h0wICW6azXJm5Xm81WHgVekIKZ/Nw/KKWlGw51GixDH2CI1mxlMbY39Wag
	oTQ7i2CIPt5nHmpTd2oOFqwaYJTHfLHc8to3IRN1Z/J/X9dWbax2dFo4q3mIae17hCAOLnNqhOK1x
	pwfWK+cVnDiJnh19KmCRiSRb8F2/DecHW1CCwioTAQwipr/TeXfxlyp7ZZrxD1CY8rNlBPwo50Fwc
	empmFmuevHb+WSvAF+YBO8/wo81N8qffUdL6gH8m2QVqxh+57XdPgfgu7Fln1TOhapLX/Ga8zvh9R
	uICRGcnPIjAH1cmsc+HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPN81-002T3Y-Lk; Wed, 02 Mar 2022 11:26:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPN7n-002Sxw-Ch; Wed, 02 Mar 2022 11:26:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 925091424;
 Wed,  2 Mar 2022 03:26:30 -0800 (PST)
Received: from [10.57.39.47] (unknown [10.57.39.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC3ED3F70D;
 Wed,  2 Mar 2022 03:26:28 -0800 (PST)
Message-ID: <ca208635-449b-2c94-7317-09ed8eb86a2c@arm.com>
Date: Wed, 2 Mar 2022 11:26:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2] iommu/iova: Reset max32_alloc_size after cleaning
Content-Language: en-GB
To: Miles Chen <miles.chen@mediatek.com>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Libo.Kang@mediatek.com, yf.wang@mediatek.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Ning.Li@mediatek.com, matthias.bgg@gmail.com, stable@vger.kernel.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
References: <b10031aa-8e49-70b3-b498-8aa6b7021fbb@arm.com>
 <20220301232953.17331-1-miles.chen@mediatek.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220301232953.17331-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_032631_530844_A8EE9DCC 
X-CRM114-Status: GOOD (  13.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2022-03-01 23:29, Miles Chen via iommu wrote:
> Hi Yunfei,
> 
>>> Since __alloc_and_insert_iova_range fail will set the current alloc
>>> iova size to max32_alloc_size (iovad->max32_alloc_size = size),
>>> when the retry is executed into the __alloc_and_insert_iova_range
>>> function, the retry action will be blocked by the check condition
>>> (size >= iovad->max32_alloc_size) and goto iova32_full directly,
>>> causes the action of retry regular alloc iova in
>>> __alloc_and_insert_iova_range to not actually be executed.
>>>
>>> Based on the above, so need reset max32_alloc_size before retry alloc
>>> iova when alloc iova fail, that is set the initial dma_32bit_pfn value
>>> of iovad to max32_alloc_size, so that the action of retry alloc iova
>>> in __alloc_and_insert_iova_range can be executed.
>>
>> Have you observed this making any difference in practice?
>>
>> Given that both free_cpu_cached_iovas() and free_global_cached_iovas()
>> call iova_magazine_free_pfns(), which calls remove_iova(), which calls
>> __cached_rbnode_delete_update(), I'm thinking no...
>>
>> Robin.
>>
> 
> Like Robin pointed out, if some cached iovas are freed by
> free_global_cached_iovas()/free_cpu_cached_iovas(),
> the max32_alloc_size should be reset to iovad->dma_32bit_pfn.
> 
> If no cached iova is freed, resetting max32_alloc_size before
> the retry allocation only give us a retry. Is it possible that
> other users free their iovas during the additional retry?

No, it's not possible, since everyone's serialised by iova_rbtree_lock. 
If the caches were already empty and the retry gets the lock first, it 
will still fail again - forcing a reset of max32_alloc_size only means 
it has to take the slow path to that failure. If another caller *did* 
manage to get in and free something between free_global_cached_iovas() 
dropping the lock and alloc_iova() re-taking it, then that would have 
legitimately reset max32_alloc_size anyway.

Thanks,
Robin.

> alloc_iova_fast()
>    retry:
>      alloc_iova() // failed, iovad->max32_alloc_size = size
>      free_cpu_cached_iovas()
>        iova_magazine_free_pfns()
>          remove_iova()
> 	  __cached_rbnode_delete_update()
> 	    iovad->max32_alloc_size = iovad->dma_32bit_pfn // reset
>      free_global_cached_iovas()
>        iova_magazine_free_pfns()
>          remove_iova()
> 	  __cached_rbnode_delete_update()
> 	    iovad->max32_alloc_size = iovad->dma_32bit_pfn // reset
>      goto retry;
> 
> thanks,
> Miles
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
