Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7837FCF3971
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 21:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pxg58DPzXB9acbZyYMxUEK4m0+lTrXC3I0bp/sxqe7g=; b=VLn8W3VJ8Zs8OQn5zak6uPXw60
	a5sWe2wwTv+1/a5Ay+3tT4cMCcHSrFK19RUlhdle+7fx83Gp+aaCZlDeH6CvwO3hnCfl6QJuI3PDd
	K7REk7NVjyIT919k2ISeUkFh+UDuHzscFrX2G3RiNSO2pQqdEoeFCWgxteMzBQBrUdQ8qQy5CWVHB
	fD2JxV+x5yPSENu5agPwZCYqj8Jw+0Qu0e00eKWBCmlPlE2Souvq6pGs1FpIdcgval+c6LPwWodUa
	4Cg2SdTeNWnbXPwBsBk9gwfWyjq6UjNnHCZxpiyILPB1D16Q6Zyz0Xi7U10dgVQ9ccZ6ht0bxl9PE
	hK42UxOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srOLm-0000000B0x6-1rur;
	Thu, 19 Sep 2024 21:06:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srOKd-0000000B0oB-0C8N;
	Thu, 19 Sep 2024 21:04:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C32F2A4402D;
	Thu, 19 Sep 2024 21:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DAEC4CEC4;
	Thu, 19 Sep 2024 21:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726779893;
	bh=8rmdkhy7mle9GnzKV59Fez0ZiYJ5ItopN5knD5heul0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tMIiZugOhjzqgyUpW7HkIMb94kB3G/IoEOWJvEfIibHaCL2W6lxj/6dAy50ww3Upd
	 5BuV7yd7+xf0LnJlLA6shnOsl4ybtmmnw4qRRAcxcVdTlQQO8CjzRoHuaAPl0cnLci
	 KyO838TcaL8c8mfnqC3Fcz2LQ0BjvUfx2U9ux0XAeez0raNOeRSjsGu9186hqHSozD
	 ekcF76hWo/vt3sl8iQ7tBHFkSTET2nmVrmZCljeeCkxJkkq5cSQY3mp+XWQ6e0oYMf
	 Qo62AxytxEW4fp+yzCDxcmUUB+Wme/iNSXIqef4vFQ/XRD6jqsRg+/Yl4tOtEC8q6k
	 c8Ol4+tfmgDUA==
Message-ID: <0e8c7a7a-0e2a-42ec-adbc-b29f6a514517@kernel.org>
Date: Thu, 19 Sep 2024 23:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Yunsheng Lin <linyunsheng@huawei.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
 liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org
References: <20240918111826.863596-1-linyunsheng@huawei.com>
 <20240918111826.863596-3-linyunsheng@huawei.com>
 <CAC_iWjK=G7Oo5=pN2QunhasgDC6NyC1L+96jigX7u9ad+PbYng@mail.gmail.com>
 <894a3c2c-22f9-45b9-a82b-de7320066b42@kernel.org>
 <cdfecd37-31d7-42d2-a8d8-92008285b42e@huawei.com>
Content-Language: en-US
From: Jesper Dangaard Brouer <hawk@kernel.org>
In-Reply-To: <cdfecd37-31d7-42d2-a8d8-92008285b42e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_140455_235034_2DBA62A9 
X-CRM114-Status: GOOD (  19.16  )
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



On 19/09/2024 13.15, Yunsheng Lin wrote:
> On 2024/9/19 17:42, Jesper Dangaard Brouer wrote:
>>
>> On 18/09/2024 19.06, Ilias Apalodimas wrote:
>>>> In order not to do the dma unmmapping after driver has already
>>>> unbound and stall the unloading of the networking driver, add
>>>> the pool->items array to record all the pages including the ones
>>>> which are handed over to network stack, so the page_pool can
>>>> do the dma unmmapping for those pages when page_pool_destroy()
>>>> is called.
>>>
>>> So, I was thinking of a very similar idea. But what do you mean by
>>> "all"? The pages that are still in caches (slow or fast) of the pool
>>> will be unmapped during page_pool_destroy().
>>
>> I really dislike this idea of having to keep track of all outstanding pages.
>>
>> I liked Jakub's idea of keeping the netdev around for longer.
>>
>> This is all related to destroying the struct device that have points to
>> the DMA engine, right?
> 
> Yes, the problem seems to be that when device_del() is called, there is
> no guarantee hw behind the 'struct device ' will be usable even if we
> call get_device() on it.
> 
>>
>> Why don't we add an API that allow netdev to "give" struct device to
>> page_pool.  And then the page_poll will take over when we can safely
>> free the stuct device?
> 
> By 'allow netdev to "give" struct device to page_pool', does it mean
> page_pool become the driver for the device?
> If yes, it seems that is similar to jakub's idea, as both seems to stall
> the calling of device_del() by not returning when the driver unloading.

Yes, this is what I mean. (That is why I mentioned Jakub's idea).


> If no, it seems that the problem is still existed when the driver for
> the device has unbound after device_del() is called.

