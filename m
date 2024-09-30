Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6698CCF6497
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 08:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xx414iMLuxALXKs+wO5vcFTmabes1w6H5Py+TNbMyPA=; b=hxaeGSfhOzHnNx/14cYTTFc1Lh
	izwBT8Ofe/mpXz7XEzAvSMQanRdXztlfG/dBxTZpi3sKj/M6YMlzJ+3vRMros/KppNMMTE1PziluU
	1E6sNGMNVOBVnQ7rQhL1jSlDDTAVBYRtBPn318Bs8R6dyqJBrEMvM+9zkzcps3qDizZAW6DUXLZ1o
	7ZfyRxK2HjqenWseQ9+fULyTvo59XCZnVv9gj/d8ADP64CotHo3zXCKyUbcOzK67GhXFRj1Sc6vTW
	h/COFQ95P4eb/8aSFgNhb3q/MI3iP7gStpqMf7tfiezpKZDI8eGNz8zR++oeT6oBlTl6ITfbCKUMS
	Ynh6RYuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svBTd-0000000GHCg-1Zln;
	Mon, 30 Sep 2024 08:09:53 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svBTZ-0000000GHBv-2TE6
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Sep 2024 08:09:51 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20b4a0940e3so24321915ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Sep 2024 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727683788; x=1728288588; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Xx414iMLuxALXKs+wO5vcFTmabes1w6H5Py+TNbMyPA=;
        b=e0IPaSCafnQ4hYdA+Rc0qxbbCeLTYhXETAy4PVveXI+KtIC2FT1WDBGCsembPqYFd6
         cJZM+G42QXMcAX6dXP7MgmfkhNE9kJJksTLCEOD/mZhNCOy8HXXt4pHltcnGeE1GO+AS
         Sef/aMeHO+lXhPTHg53UlU5g4A7zmed2lMvycIjDeeIrLvifLq3T7ErvMKmCUzo4YlbI
         PVhNLTsg5ncLeUl2vfUS8J3H0pNnYP6dZ+9c/cR0gEJg8kKHXJjo47ypLShBe8DkootX
         ldHgbjwpFRxILWk5ypghBUvivCNBIyQ7VTwCO4modIhQcSdsDN9Xjm+f/ihjK8ZUGF21
         oARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727683788; x=1728288588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xx414iMLuxALXKs+wO5vcFTmabes1w6H5Py+TNbMyPA=;
        b=EgNHbdhhH4ggLiTt317b4o5QnqhFzTJ/wK0hdFqJSsArSOFJ2D6kYM4aJXLan9fKzm
         BVv6Wo+qI96koLkjFZ3aiC2lzCPKGcuKeBzpmVsEFTYLS3Lx1TsgVFytsMulOVfHNOBT
         1+o5xfjPysn7jKyaAdnERtfo2Ag5WAepKaJrn6qOU0/PIl6a52ImV7JgNXXJOMzZ3Z58
         PQ1EuRaOSZUZfb0F0KY+2DAdbFi8Nigr6C4Ll02zj9O39TUo0O7ztTgEhkZty2OpIJxQ
         h81bZQ6TVkHbTCwCVsFymianKQTpdmzVvZ4NUcpDaA/RAbKqajArnwEKxqmBeui5HbeF
         Eu7A==
X-Forwarded-Encrypted: i=1; AJvYcCVrZi3dbfR09F/cW56r4YcVAjN8addKz/am8ZIxOb6ABAHzNkKeLeMT/sMYqCbeurFHNPS/LAnj2uM3uT9Oyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMT6vmVVJo4PnzW/hE6sL5w/dqZAQoJOJpXjYFGMqHJ16WJYUB
	DeQlHsaL62+9hfVnAoW2QG+zw7HFiHWd94On9kl0XjxGyleRpcE3EQY+RXCwlbMIrteseeLTPrL
	TYnqUVONBWjTUy0vRnPcSfjOIm1OEaSpmP0h92w==
X-Google-Smtp-Source: AGHT+IHL79vWrV1UbQW2i+UC3FcnuUEn4RoHxDXgrgsEhFXFX4vbKat3GD+mMJkdcENWj5dVp6Y7ppyyQzgjgk1yEE8=
X-Received: by 2002:a17:902:ce91:b0:20b:6d8c:461 with SMTP id
 d9443c01a7336-20b6d8c0791mr75062715ad.5.1727683788157; Mon, 30 Sep 2024
 01:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com> <CAHS8izOxugzWJDTc-4CWqaKABTj=J4OHs=Lcb=SE9r8gX0J+yg@mail.gmail.com>
 <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com> <CAC_iWjLgNOtsbhqrhvvEz2C3S668qB8KatL_W+tPHMSkDrNS=w@mail.gmail.com>
 <0ef315df-e8e9-41e8-9ba8-dcb69492c616@huawei.com> <CAC_iWjKeajwn3otjdEekE6VDLHGEvqmnQRwpN5R3yHj8UpEiDw@mail.gmail.com>
 <934d601f-be43-4e04-b126-dc86890a4bfa@huawei.com> <CAC_iWjL7m4ZL2W2OZM5F22dLvZhxU6fyCXV_xjyGf+W7UP43EQ@mail.gmail.com>
 <ac2eec69-8f44-4adb-8182-02c78625851d@huawei.com>
In-Reply-To: <ac2eec69-8f44-4adb-8182-02c78625851d@huawei.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Mon, 30 Sep 2024 11:09:11 +0300
Message-ID: <CAC_iWj+Shb6buVf+wZaWe-NZ+UVxmW9DYqsTiL27U+V_Ko_65w@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Mina Almasry <almasrymina@google.com>, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, liuyonglong@huawei.com, fanghaiqing@huawei.com, 
	zhangkun09@huawei.com, Robin Murphy <robin.murphy@arm.com>, 
	Alexander Duyck <alexander.duyck@gmail.com>, IOMMU <iommu@lists.linux.dev>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet <edumazet@google.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	bpf@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_010949_653473_0E707202 
X-CRM114-Status: GOOD (  37.86  )
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

On Sun, 29 Sept 2024 at 05:44, Yunsheng Lin <linyunsheng@huawei.com> wrote:
>
> On 2024/9/28 15:34, Ilias Apalodimas wrote:
>
> ...
>
> >
> > Yes, that wasn't very clear indeed, apologies for any confusion. I was
> > trying to ask on a linked list that only lives in struct page_pool.
> > But I now realize this was a bad idea since the lookup would be way
> > slower.
> >
> >> If I understand question correctly, the single/doubly linked list
> >> is more costly than array as the page_pool case as my understanding.
> >>
> >> For single linked list, it doesn't allow deleting a specific entry but
> >> only support deleting the first entry and all the entries. It does support
> >> lockless operation using llist, but have limitation as below:
> >> https://elixir.bootlin.com/linux/v6.7-rc8/source/include/linux/llist.h#L13
> >>
> >> For doubly linked list, it needs two pointer to support deleting a specific
> >> entry and it does not support lockless operation.
> >
> > I didn't look at the patch too carefully at first. Looking a bit
> > closer now, the array is indeed better, since the lookup is faster.
> > You just need the stored index in struct page to find the page we need
> > to unmap. Do you remember if we can reduce the atomic pp_ref_count to
> > 32bits? If so we can reuse that space for the index. Looking at it
>
> For 64 bits system, yes, we can reuse that.
> But for 32 bits system, we may have only 16 bits for each of them, and it
> seems that there is no atomic operation for variable that is less than 32
> bits.
>
> > requires a bit more work in netmem, but that's mostly swapping all the
> > atomic64 calls to atomic ones.
> >
> >>
> >> For pool->items, as the alloc side is protected by NAPI context, and the
> >> free side use item->pp_idx to ensure there is only one producer for each
> >> item, which means for each item in pool->items, there is only one consumer
> >> and one producer, which seems much like the case when the page is not
> >> recyclable in __page_pool_put_page, we don't need a lock protection when
> >> calling page_pool_return_page(), the 'struct page' is also one consumer
> >> and one producer as the pool->items[item->pp_idx] does:
> >> https://elixir.bootlin.com/linux/v6.7-rc8/source/net/core/page_pool.c#L645
> >>
> >> We only need a lock protection when page_pool_destroy() is called to
> >> check if there is inflight page to be unmapped as a consumer, and the
> >> __page_pool_put_page() may also called to unmapped the inflight page as
> >> another consumer,
> >
> > Thanks for the explanation. On the locking side, page_pool_destroy is
> > called once from the driver and then it's either the workqueue for
> > inflight packets or an SKB that got freed and tried to recycle right?
> > But do we still need to do all the unmapping etc from the delayed
> > work? Since the new function will unmap all packets in
> > page_pool_destroy, we can just skip unmapping when the delayed work
> > runs
>
> Yes, the pool->dma_map is clear in page_pool_item_uninit() after it does
> the unmapping for all inflight pages with the protection of pool->destroy_lock,
> so that the unmapping is skipped in page_pool_return_page() when those inflight
> pages are returned back to page_pool.

Ah yes, the entire destruction path is protected which seems correct.
Instead of that WARN_ONCE in page_pool_item_uninit() can we instead
check the number of inflight packets vs what we just unmapped? IOW
check 'mask' against what page_pool_inflight() gives you and warn if
those aren't equal.


Thanks
/Ilias
>
> >

