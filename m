Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35F5CF8862
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Oct 2024 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbmQWqwf8KLWBh53BpLjJjepp8M5DqLAMepSsUrr8/A=; b=4eTItJmAEnrUUxFJIYBp5nxtdP
	MqTJmw1FsM/F1wlANRatCy55FB7lPyjZ8AtD1HZEcL6XEaRXPVaX+3oJSQuHPHbIVQHbpFEToufjh
	BmCFUreWkFGGBE9n86yif8hxd59TjRws02Wl81J/0x7yrSkKqoqWwvsI+G858/X4xaNjSfOigutCr
	ShPKkcn5qdu74cE9I1x/9wVtS8cBebGza8Qs7Vxy9b62UeJ/paePiTer6z/apPSwEJ8ekhs6MdWkB
	8BBszqpn3BQbPDtdHgyF0WRmwPaF7y12u/0B4erLTh07kBvWoFJ1nB4HHtB6dDYvlOdMhvCslDOsq
	2tXQBBGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx4C8-0000000FMQx-3QZn;
	Sat, 05 Oct 2024 12:47:36 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx43z-0000000FLcg-1FmZ;
	Sat, 05 Oct 2024 12:39:12 +0000
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-71de776bc69so1082794b3a.1;
        Sat, 05 Oct 2024 05:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728131950; x=1728736750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbmQWqwf8KLWBh53BpLjJjepp8M5DqLAMepSsUrr8/A=;
        b=DWMhWe7HXqljD9gBvig0Y+Jcp94irIyd3/MqS6TFn/H/BxuXFYILNU5lHGLK+w94P6
         qfe6gVFWPp+YAlvBM7/oPJMfPn+2rtClu7bxGLSqQNDjlrhr+Vr5FLwudmUbfKzh/V3x
         TrMKZWSmuuyFaoTnrSIfQMRaIgDQ6B8od9qpxHx0x7DdxTdczX3DuMRDKWWArWnfpcgS
         0jNXwgq7hq0Jkm7ImCQYhZh035ehd2kQxBX12MGg6zFNXw7L8+3M7qa4eJhhEWUK6jE0
         cKZQPMfBV4GKiYKhylDDHU8y8BaIn45aHZogpUrVVlpwzLPtT1q1jG9xt2fimhKOaAPI
         7dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728131950; x=1728736750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbmQWqwf8KLWBh53BpLjJjepp8M5DqLAMepSsUrr8/A=;
        b=tq7C0TATiGJwcoNTUGI8NuNG6rlWqwHfWIyOIFJy+OHKBc7n8xoWjXH9BxG5fitTBn
         Ec6M70GRGRA1qEjTI1WDcBbujIR5PPUOTcZ2/hJ/9CFJQFYUgdC5vzoARQTbqkaV9N2v
         AcsIKw98hZDGdqyGJfv+ZjNGl2MskO1D2UZobAbaBj9HRaD51NEmohRJOZN/r5zd0wzX
         Gv3KuGN5uDsxvvlYFUQdOfSNeQMRYfzTMO576mQ7KJX2y0I+U88lAdDzZkI+OBDTn+iE
         +8SZ2ZSQSyOwCp7IJqbb+ZES6LTYg+YBkXHx1XbNnSjyhgcvAQDYExLhvXZLa+mhYbiG
         lFUA==
X-Forwarded-Encrypted: i=1; AJvYcCUU4gErcbePkttIek5esr1HJ4kG5oQGZcMrGgDgm/9T4XdhnV1siwN7ZQBtjys3I1LBKi8MJLII81fVFR7Nf65A@lists.infradead.org, AJvYcCWZYR9AcNuDsziJXPrs4Okbg5ZaqQIPxg89COL6YktoDRxFz+jXl0iqCcaF86mTZdJPyuqJ95EDkbZRbIsc/K4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjFPWHrjvlSkNTadCmmDk2FUE64Ci4Q4JvXAk6wa8dh5lkBaqL
	bqfoRj+ebhhZN3l1DNsDBwtlxG1axYA6VO4awBnNGeXpqSRlSS/R
X-Google-Smtp-Source: AGHT+IH7TZfPKkqMhF7jhMgZXtf7Pauw1fuqlg17S6ZMnwvz+3KYrvO5e1eqHcfYjc/CJowJUAwQhQ==
X-Received: by 2002:a05:6a00:9a1:b0:70d:3337:7820 with SMTP id d2e1a72fcca58-71de23c72ecmr10006756b3a.8.1728131949813;
        Sat, 05 Oct 2024 05:39:09 -0700 (PDT)
Received: from ?IPV6:2409:8a55:301b:e120:3c3f:d401:ec20:dbc7? ([2409:8a55:301b:e120:3c3f:d401:ec20:dbc7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd3983sm1408702b3a.87.2024.10.05.05.38.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2024 05:39:09 -0700 (PDT)
Message-ID: <6cb0a740-f597-4a13-8fe5-43f94d222c70@gmail.com>
Date: Sat, 5 Oct 2024 20:38:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Paolo Abeni <pabeni@redhat.com>, Yunsheng Lin <linyunsheng@huawei.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
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
 Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mm@kvack.org, davem@davemloft.net, kuba@kernel.org
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com>
 <4968c2ec-5584-4a98-9782-143605117315@redhat.com>
 <33f23809-abec-4d39-ab80-839dc525a2e6@gmail.com>
 <4316fa2d-8dd8-44f2-b211-4b2ef3200d75@redhat.com>
Content-Language: en-US
From: Yunsheng Lin <yunshenglin0825@gmail.com>
In-Reply-To: <4316fa2d-8dd8-44f2-b211-4b2ef3200d75@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_053911_376051_6F0EBC8D 
X-CRM114-Status: GOOD (  21.17  )
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

On 10/2/2024 3:37 PM, Paolo Abeni wrote:
> Hi,
> 
> On 10/2/24 04:34, Yunsheng Lin wrote:
>> On 10/1/2024 9:32 PM, Paolo Abeni wrote:
>>> Is the problem only tied to VFs drivers? It's a pity all the page_pool
>>> users will have to pay a bill for it...
>>
>> I am afraid it is not only tied to VFs drivers, as:
>> attempting DMA unmaps after the driver has already unbound may leak
>> resources or at worst corrupt memory.
>>
>> Unloading PFs driver might cause the above problems too, I guess the
>> probability of crashing is low for the PF as PF can not be disable
>> unless it can be hot-unplug'ed, but the probability of leaking resources
>> behind the dma mapping might be similar.
> 
> Out of sheer ignorance, why/how the refcount acquired by the page pool 
> on the device does not prevent unloading?

I am not sure if I understand the reasoning behind that, but it seems
the driver unloading does not check on the refcount of the device from
the implementation of __device_release_driver().

> 
> I fear the performance impact could be very high: AFICS, if the item 
> array become fragmented, insertion will take linar time, with the quite 
> large item_count/pool size. If so, it looks like a no-go.

The last checked index is recorded in pool->item_idx, so the insertion
mostly will not take linear, unless pool->items is almost full and the
old item came back to page_pool is just checked. The thought is that if
it comes to this point, the page_pool is likely not the bottleneck
anymore, and adding infinite pool->items might not make any difference.

If the insertion does turn out to be a bottleneck, 'struct llist_head'
can be used to records the old items lockless for the freeing side, and
llist_del_all() can be used to refill the old items for the allocing
side from freeing side, which is kind of like the pool->ring and
pool->alloc used currently in page_pool. As this patchset is already
complicated, doing this makes it more complicated, I am not sure it is
worth the effort right now as benefit does not seem obvious yet.

> 
> I fear we should consider blocking the device removal until all the 
> pages are returned/unmapped ?!? (I hope that could be easier/faster)

As Ilias pointed out, blocking the device removal until all the pages
are returned/unmapped might cause infinite delay in our testing:

https://lore.kernel.org/netdev/d50ac1a9-f1e2-49ee-b89b-05dac9bc6ee1@huawei.com/

> 
> /P
> 


