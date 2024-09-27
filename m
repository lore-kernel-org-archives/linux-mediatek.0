Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A91FCEBF8E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 09:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u12Tug5k2bdyzIU9WiqUE2EObFB7IXUcT3bKNNPZCB0=; b=txsSxEctoKA7ahvOJDsacK8Enl
	qDnGPPnTomYbrRTILmGn3ejTAmGURi/8idbo+1v/ahVLKu8EV7XlZtrS0AKxmDpksONPHI3tEWUOD
	bg6p6jkCh4oIn69BdIpAIO2DD8KopSO3Ml/1Ca1YDWhZ8dnZBTYQe9P6BWS76I4ncN5dH4S2iW/bb
	kmCzBJ3jvV6zPUAipG0B+Ml/NAuEZ2dVNd+/vBfe71X0gx9F/a5cvl5u9vR7hkk3FOkaABzyU8UMT
	Cg+sEqzI2I66eL0eHyj3OXJnfXfrKoJ81J7JINlja91pd+I66WbSutnGZfXfuu74rYDndWW3gvkPS
	CBoP2bRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su7B1-0000000AdNF-0Fal;
	Fri, 27 Sep 2024 09:22:15 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su7Ax-0000000AdMX-412M
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 09:22:13 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2e0afd945d4so961218a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Sep 2024 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727428930; x=1728033730; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u12Tug5k2bdyzIU9WiqUE2EObFB7IXUcT3bKNNPZCB0=;
        b=GMdDiG+dmQNWBe0zxLAX4M4xphh6JOYEmPApA3CIOJS0NYwJoR4G1mQGtaqAgpNMhW
         gRJ5pL49n8ym47LaC4DBqM5mcbI3qYaaR0zw3TfjN0NFFvEJA52fSC9nMPa/CJK8t9qV
         6racMca2e5ZAcETCIFU3ABTPAhwPQwteNCrIrwPVkS8kPek/5sNSxh5BgeSkAoLu9VH7
         73telOcuh5i8fotgcngx0f8csfrNtsAC7qzSVnSTtOZOt/xsdlnleOEpDMZKEpjCHGcO
         0q9JYebpzaecY/sCimBAwwzlB45xQS5rAmAvnMEiXFyK53acHNX+EfE1q4E2n3UWS8cT
         bIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727428930; x=1728033730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u12Tug5k2bdyzIU9WiqUE2EObFB7IXUcT3bKNNPZCB0=;
        b=A1y0y7yWLRd880BDyzZfwznNwZ9G5x9XNdGM0OzAQKWyuVWGJrGZNJ1Okx1EYKZc2L
         uXZlwKrpL4kT5nvYpeE0Mdvnf5odiZw1gCM7LFjJLM+nMBgLl32Pmhm3IRY23TmBU6z0
         g92H6eKh17GBR2R052HF8pAmYlVMOil2SZqZlq2rFhQ1URzahPmCALU71dCZdeOXkMzo
         pSTfiOQuDuwZrlJzCk0e6q2qZO4Tx+7vKoogDOFUP3Yy1hBDTWQY/kbXSAGK09uhu9QU
         rm+iEEqJypUnnuByvOK1BvMYI+KkY8wZL8JFXO/EaX8iFeHG7dSDam7dsOQP798EDzMs
         WiAw==
X-Forwarded-Encrypted: i=1; AJvYcCVlS9LrR9++PbRGV6KKfCAN0NHtrkkx94Ehbac2H13uEnyAtGcfJQfxlYRWtnU7fCj8v/au/H5AbfwoV5HZMw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yze6j/ReuZhtWJtCMSlrTRhryHdeQy8bSw3ugAum5AM1x/nEAVI
	gu6LKXV8Pv8zvsInU7HusepdlwyH+0BWLWOFOy/kkZ2SonHJ08qXyKnjnRHewZKwajz52ZZdTai
	CvmN+h/rE4dKktWHFYqYtx793oqajSPcRq9q4tg==
X-Google-Smtp-Source: AGHT+IGhQGOutUtxLVOzhj1pZESUxIJEMnWirkI07rvkOdCYDPIQ+9U4QYWB0UPwoiObJJWrhA4Koam3DQfasHbzz4I=
X-Received: by 2002:a17:90a:4b07:b0:2e0:9147:7db5 with SMTP id
 98e67ed59e1d1-2e0b8ed4cebmr2795273a91.38.1727428930437; Fri, 27 Sep 2024
 02:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com> <CAHS8izOxugzWJDTc-4CWqaKABTj=J4OHs=Lcb=SE9r8gX0J+yg@mail.gmail.com>
 <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com>
In-Reply-To: <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 27 Sep 2024 12:21:33 +0300
Message-ID: <CAC_iWjLgNOtsbhqrhvvEz2C3S668qB8KatL_W+tPHMSkDrNS=w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240927_022212_029804_2192637D 
X-CRM114-Status: GOOD (  48.22  )
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

Hi Yunsheng

On Fri, 27 Sept 2024 at 06:58, Yunsheng Lin <linyunsheng@huawei.com> wrote:
>
> On 2024/9/27 2:15, Mina Almasry wrote:
> >
> >> In order not to do the dma unmmapping after driver has already
> >> unbound and stall the unloading of the networking driver, add
> >> the pool->items array to record all the pages including the ones
> >> which are handed over to network stack, so the page_pool can
> >> do the dma unmmapping for those pages when page_pool_destroy()
> >> is called.
> >
> > One thing I could not understand from looking at the code: if the
> > items array is in the struct page_pool, why do you need to modify the
> > page_pool entry in the struct page and in the struct net_iov? I think
> > the code could be made much simpler if you can remove these changes,
> > and you wouldn't need to modify the public api of the page_pool.
>
> As mentioned in [1]:
> "There is no space in 'struct page' to track the inflight pages, so
> 'pp' in 'struct page' is renamed to 'pp_item' to enable the tracking
> of inflight page"

I have the same feeling as Mina here. First of all, we do have an
unsigned long in struct page we use for padding IIRC. More
importantly, though, why does struct page need to know about this?
Can't we have the same information in page pool?
When the driver allocates pages it does via page_pool_dev_alloc_XXXXX
or something similar. Cant we do what you suggest here ? IOW when we
allocate a page we put it in a list, and when that page returns to
page_pool (and it's mapped) we remove it.

Thanks
/Ilias
>
> As we still need pp for "struct page_pool" for page_pool_put_page()
> related API, the container_of() trick is used to get the pp from the
> pp_item.
>
> As you had changed 'struct net_iov' to be mirroring the 'struct page',
> so change 'struct net_iov' part accordingly.
>
> 1. https://lore.kernel.org/all/50a463d5-a5a1-422f-a4f7-d3587b12c265@huawei.com/
>
> >
> >> As the pool->items need to be large enough to avoid
> >> performance degradation, add a 'item_full' stat to indicate the
> >> allocation failure due to unavailability of pool->items.
> >>
> >
> > I'm not sure there is any way to size the pool->items array correctly.
>
> Currently the size of pool->items is calculated in page_pool_create_percpu()
> as below, to make sure the size of pool->items is somewhat twice of the
> size of pool->ring so that the number of page sitting in the driver's rx
> ring waiting for the new packet is the similar to the number of page that is
> still being handled in the network stack as most drivers seems to set the
> pool->pool_size according to their rx ring size:
>
> +#define PAGE_POOL_MIN_INFLIGHT_ITEMS           512
> +       unsigned int item_cnt = (params->pool_size ? : 1024) +
> +                               PP_ALLOC_CACHE_SIZE + PAGE_POOL_MIN_INFLIGHT_ITEMS;
> +       item_cnt = roundup_pow_of_two(item_cnt);
>
> > Can you use a data structure here that can grow? Linked list or
> > xarray?
> >
> > AFAIU what we want is when the page pool allocates a netmem it will
> > add the netmem to the items array, and when the pp releases a netmem
> > it will remove it from the array. Both of these operations are slow
> > paths, right? So the performance of a data structure more complicated
> > than an array may be ok. bench_page_pool_simple will tell for sure.
>
> The question would be why do we need the pool->items to grow with the
> additional overhead and complication by dynamic allocation of item, using
> complicated data structure and concurrent handling?
>
> As mentioned in [2], it was the existing semantics, but it does not means
> we need to keep it. The changing of semantics seems like an advantage
> to me, as we are able to limit how many pages is allowed to be used by
> a page_pool instance.
>
> 2. https://lore.kernel.org/all/2fb8d278-62e0-4a81-a537-8f601f61e81d@huawei.com/
>
> >
> >> Note, the devmem patchset seems to make the bug harder to fix,
> >> and may make backporting harder too. As there is no actual user
> >> for the devmem and the fixing for devmem is unclear for now,
> >> this patch does not consider fixing the case for devmem yet.
> >>
> >
> > net_iovs don't hit this bug, dma_unmap_page_attrs() is never called on
> > them, so no special handling is needed really. However for code
>
> I am really doubtful about your above claim. As at least the below
> implementaion of dma_buf_unmap_attachment_unlocked() called in
> __net_devmem_dmabuf_binding_free() seems be using the DMA API directly:
>
> https://elixir.bootlin.com/linux/v6.7-rc8/source/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c#L215
>
> Or am I missing something obvious here?
>
> > quality reasons lets try to minimize the number of devmem or memory
> > provider checks in the code, if possible.
> >

