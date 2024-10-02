Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635D6CF318C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 02:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94naYpv079to4aDULVCz9OCsch+/fu1zXqCOaX8AqZQ=; b=v9LU5JWOSANRgiurRynIV4WgEz
	Xc30FJsHAue3U56q1woruk3NvYgzMYthOWceedjEZc+afNpDo9bjF6t/FfoUAiUhvgeBF37SkYoax
	mCKDp3s/lPVl1UOcNDO03gEVHH9Vg6/WdwrQ9jYAT6tbgV3a6RaD0rDUToJTut4MoEPmadplLdTOt
	2ud42cp1UuVlz+xqtuPUXCPQmm7IwsSPRNaugHJeyZvX4XNxL2wz3AHIlgVoZSFpvXis5B8otXUTO
	XtYdihl+I76pOMahdnMqN7+1y/Eh/bbmi1ru/q0CKSWM7iB01p8hmgAnKiVgqYKZ/D083MLImTYeb
	V+vs1wcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svpDh-00000004dX4-1lXF;
	Wed, 02 Oct 2024 02:36:05 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svpCS-00000004dPK-0Wdl;
	Wed, 02 Oct 2024 02:34:49 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-20bc2970df5so6795255ad.3;
        Tue, 01 Oct 2024 19:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727836487; x=1728441287; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94naYpv079to4aDULVCz9OCsch+/fu1zXqCOaX8AqZQ=;
        b=nTahsYCzqkzjRLCT/+CbOYYWiWtCTVKxUYVW21vI1iRngNN9S0nQHglBnuC7EZuf+R
         j+qRwPZnGtPtYfbIoD9raDowA1ONzg31Kij57o4yEJ4GMw4rVVV0SRMQ19W8JL2GAU1V
         IxlRs5CdpQ6hbL2l8/SNKQwzV+2S0gKxSn2x9QPia/jY3B0Dzryfxy0hW5xFgVJQVcBm
         NjLtGYAZ85drvtDD32VciVq0BI5sims/lczVlirGuY/2o3VqZoSmJ1dvEyGaRwn6OoJh
         omEDyd2Sutp7pNYSovhF369iDNiod/S9UaX2r/hfL+1Uq3kKwd+tLlqWvMZNGQu4YHHX
         olXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727836487; x=1728441287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94naYpv079to4aDULVCz9OCsch+/fu1zXqCOaX8AqZQ=;
        b=bJ6/n3ofCr3sPSqdESUrxLJwoUTVbrJEsJU6EjFxeVPQyR0nxpjlbOuNSORjDSEbb0
         mcFIS1Hv0YPwD79gLuHvpIeSk4U0/kYGu2UAY9mR2BIlxz/jZyAqErX8JZ9BQyahugel
         rZBsjKX+wvBDmX4SDm9NqP+rIV6RKupzy6kaFXlZEUeFgzYdVSHTE36mUouPcvPSTz4f
         iTW3EbUfXJ9bs1yyxR7uEHrTEpj2W6fWU79qGvRhoQwKY0Vv2t0MNOWpqDq9hx0ntciO
         Jp4OKBYM3KaQX+LixR2f3HxV0NQ6FPrvTKwZM20sRScFtNvv1iU0fiCN+XjlrE0zr0Xw
         eShQ==
X-Forwarded-Encrypted: i=1; AJvYcCUORuc+SnSO8XFyI/rNn/yJ1D9//G1BJr5ciRvbyt0bMOQhL2O9B/vdppBueKFuOVWG1B2IP8SbpS7bfeBOZGIr@lists.infradead.org, AJvYcCUpKJPeCeho3ZtUgIlWGDhgwAE5K97VQauqZkl5l9yFAObDZ6OgvanF/sWsWH6gBTooE+IdHDTENvPO1OGdq3Q=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8Q2C3q8XzsU8XizvKfFO/1ZoadyQRIkoWCy0H7oYQ53mK58gk
	kptvafNehsw6mbnQRIVS/xVYpWsOGlCghf43a9lhQ1daD1gTsHxU
X-Google-Smtp-Source: AGHT+IF9UFJBsbcmQi++iX6HKeBG+ku6eNZRFQc3F4zkIg3OMASXuELxeSEfBVyfvWUc3NyPSynvqg==
X-Received: by 2002:a17:902:e844:b0:20b:b132:4df9 with SMTP id d9443c01a7336-20bc5a01fa5mr17029495ad.34.1727836487138;
        Tue, 01 Oct 2024 19:34:47 -0700 (PDT)
Received: from ?IPV6:2409:8a55:301b:e120:50d1:daaf:4d8b:70e8? ([2409:8a55:301b:e120:50d1:daaf:4d8b:70e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b5b167128sm58750135ad.283.2024.10.01.19.34.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 19:34:46 -0700 (PDT)
Message-ID: <33f23809-abec-4d39-ab80-839dc525a2e6@gmail.com>
Date: Wed, 2 Oct 2024 10:34:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Paolo Abeni <pabeni@redhat.com>, Yunsheng Lin <linyunsheng@huawei.com>,
 davem@davemloft.net, kuba@kernel.org
Cc: liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com,
 Robin Murphy <robin.murphy@arm.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>,
 Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com>
 <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
Content-Language: en-US
From: Yunsheng Lin <yunshenglin0825@gmail.com>
In-Reply-To: <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_193448_190153_733570D3 
X-CRM114-Status: GOOD (  23.06  )
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

On 10/1/2024 9:32 PM, Paolo Abeni wrote:
> On 9/25/24 09:57, Yunsheng Lin wrote:
>> Networking driver with page_pool support may hand over page
>> still with dma mapping to network stack and try to reuse that
>> page after network stack is done with it and passes it back
>> to page_pool to avoid the penalty of dma mapping/unmapping.
>> With all the caching in the network stack, some pages may be
>> held in the network stack without returning to the page_pool
>> soon enough, and with VF disable causing the driver unbound,
>> the page_pool does not stop the driver from doing it's
>> unbounding work, instead page_pool uses workqueue to check
>> if there is some pages coming back from the network stack
>> periodically, if there is any, it will do the dma unmmapping
>> related cleanup work.
>>
>> As mentioned in [1], attempting DMA unmaps after the driver
>> has already unbound may leak resources or at worst corrupt
>> memory. Fundamentally, the page pool code cannot allow DMA
>> mappings to outlive the driver they belong to.
>>
>> Currently it seems there are at least two cases that the page
>> is not released fast enough causing dma unmmapping done after
>> driver has already unbound:
>> 1. ipv4 packet defragmentation timeout: this seems to cause
>>     delay up to 30 secs.
>> 2. skb_defer_free_flush(): this may cause infinite delay if
>>     there is no triggering for net_rx_action().
>>
>> In order not to do the dma unmmapping after driver has already
>> unbound and stall the unloading of the networking driver, add
>> the pool->items array to record all the pages including the ones
>> which are handed over to network stack, so the page_pool can
>> do the dma unmmapping for those pages when page_pool_destroy()
>> is called. As the pool->items need to be large enough to avoid
>> performance degradation, add a 'item_full' stat to indicate the
>> allocation failure due to unavailability of pool->items.
> 
> This looks really invasive, with room for potentially large performance 
> regressions or worse. At very least it does not look suitable for net.

I am open to targetting this to net-next, it can be backported when some
testing is done through one or two kernel versions and there is still
some interest to backport it too.

Or if there is some non-invasive way to fix this.

> 
> Is the problem only tied to VFs drivers? It's a pity all the page_pool 
> users will have to pay a bill for it...

I am afraid it is not only tied to VFs drivers, as:
attempting DMA unmaps after the driver has already unbound may leak
resources or at worst corrupt memory.

Unloading PFs driver might cause the above problems too, I guess the
probability of crashing is low for the PF as PF can not be disable
unless it can be hot-unplug'ed, but the probability of leaking resources
behind the dma mapping might be similar.

> 
> /P
> 
> 


