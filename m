Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A4CCEBF78
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Sep 2024 05:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fbg8QJSSUgH7Q4nHSRemybsPSlB855qz0uznqiadyvc=; b=uTE7yXZj71nAeHvRihrJ+fq4Zo
	pxGCNwznkyCScwENrCr4adSw3FYdkoXLn6nzoYj6SOGynVjIJy+l+WSvCkrfzt0Ghx6jIWMrjJ6V7
	jr7ymSMbp3Ee2PZomiCz7ZNl9L0I7LeE+9AvlYcPl9X9eWeD2YuJ0GZa/99KhU2N7PZ/EXGhgG1m8
	Keg4Y7pHkZPHykWWJS6O43YJG414P9VS3cF3Bd0R0w6rJxIh9hC6MtyWx2MZvzUZaPKd+3iq9Urf2
	n8xwxyva/IVYkEV2loeSw40AGLFnWMC8IP9onXSy7JHIHeGsaTdyDfZLMhtiEvsM01CXVbewlLzAv
	G2hIo50g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1su3x7-0000000A7ZH-2sVO;
	Fri, 27 Sep 2024 05:55:41 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1su3vm-0000000A7HC-05vW
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Sep 2024 05:54:20 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-4582fa01090so166291cf.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Sep 2024 22:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727416455; x=1728021255; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fbg8QJSSUgH7Q4nHSRemybsPSlB855qz0uznqiadyvc=;
        b=LQ77/jTfyVOViEZNMhjPigsmzWenBkcUzyHfuKjlBH0J9nQM2z4jT/Mp8RmxGJnKyb
         VNUH16DYwLDbS7qqWt3y9R+E6Xhnqsvk2rMHlbr4/ynI4eqf3J3M+LbKyoMNTLigZaEp
         BGuLrt0RC33R265NmXAEjmt7Awxq2lYIcGOb0YkQpn6FFWSg98TP/ocZnUWMIa3sp8w2
         YKITWP5KZaT/DNWXyTqVQsxyXsPeNduq99WUf13++FYgRg6tQMgaBI0zd9a75z4IkvWC
         hWzN0afOSR/IkGNwIi2+LaEzY81g/2IqtywriuOZhzoVg+Oe1nbe3lc648xf2jIPRai7
         lyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727416455; x=1728021255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fbg8QJSSUgH7Q4nHSRemybsPSlB855qz0uznqiadyvc=;
        b=PpuZPzjq4xAC9a12JKCtVmSAsCeC901FXeW6mcHZE00bejFJHmQPfrUqrERU82G/cz
         qkLy39CBhFj9pH40hlyST8Ag3NG6jvA+mvXGe4YqaKhUuEXLbcVuD3Dx/6T45wQDg4ft
         th6zsw/s5affWjW3i6Aj2iN20CXJOigTfUr7fxuDpqST5h3n9vkj/hxIlvG4Lmh9Lp0J
         OAVxlsHh18QjRDU951FSuCuDV/W0ka7LRkReNnZocOl6vNEZ0fGnHIMuG9HELWfhmMdx
         iGpsYTaCaFulvIix0NE1j6aLU/Q1owaUaFXbZTQoB9kqvi8BDT+NqKchtdJiZtKCmt6p
         7HuA==
X-Forwarded-Encrypted: i=1; AJvYcCUv8K7+jaX58g5BsYN68QaJZN/7ht/bOtlSNMg+UH6YebwjYxG0Y0AQ0B95LPKoeAKww0HyJRlBVd5Z20UM6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLOKkp6KgfPcZGzsqp6hK5Ka1O7RQh0LSB+IMIqs8iLWs7p24d
	8wjCvAakaB1be52b7+vnhkdpqJKHvptzr5CEpO9z3hj2SzYKSLbfwPHqycz0DD3gDYGXXf6Y75Y
	1dnmk7oC1dzfSHzDP+ejgaHDtQ5h9v145063d
X-Google-Smtp-Source: AGHT+IFlWAzqms00GpX5qYW9TQZFSIQORw0rsVCeZaOGfdUcQ3vPP90oLkUJ8sEZ5IgWc6qBEG83z217FGnc5KOy/AE=
X-Received: by 2002:a05:622a:7d0e:b0:453:58b6:e022 with SMTP id
 d75a77b69052e-45ca02b0365mr2089571cf.28.1727416455179; Thu, 26 Sep 2024
 22:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240925075707.3970187-1-linyunsheng@huawei.com>
 <20240925075707.3970187-3-linyunsheng@huawei.com> <CAHS8izOxugzWJDTc-4CWqaKABTj=J4OHs=Lcb=SE9r8gX0J+yg@mail.gmail.com>
 <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com>
In-Reply-To: <842c8cc6-f716-437a-bc98-70bc26d6fd38@huawei.com>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 26 Sep 2024 22:54:01 -0700
Message-ID: <CAHS8izN-3Ooiexsr+Xp2234=GqMUy0sTTMqExKVkXAgmjeWQ6w@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] page_pool: fix IOMMU crash when driver has
 already unbound
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	liuyonglong@huawei.com, fanghaiqing@huawei.com, zhangkun09@huawei.com, 
	Robin Murphy <robin.murphy@arm.com>, Alexander Duyck <alexander.duyck@gmail.com>, 
	IOMMU <iommu@lists.linux.dev>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_225418_128940_B602739D 
X-CRM114-Status: GOOD (  46.89  )
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

On Thu, Sep 26, 2024 at 8:58=E2=80=AFPM Yunsheng Lin <linyunsheng@huawei.co=
m> wrote:
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
>
> As we still need pp for "struct page_pool" for page_pool_put_page()
> related API, the container_of() trick is used to get the pp from the
> pp_item.
>
> As you had changed 'struct net_iov' to be mirroring the 'struct page',
> so change 'struct net_iov' part accordingly.
>
> 1. https://lore.kernel.org/all/50a463d5-a5a1-422f-a4f7-d3587b12c265@huawe=
i.com/
>

I'm not sure we need the pages themselves to have the list of pages
that need to be dma unmapped on page_pool_destroy. The pool can have
the list of pages that need to be unmapped on page_pool_destroy, and
the individual pages need not track them, unless I'm missing
something.

> >
> >> As the pool->items need to be large enough to avoid
> >> performance degradation, add a 'item_full' stat to indicate the
> >> allocation failure due to unavailability of pool->items.
> >>
> >
> > I'm not sure there is any way to size the pool->items array correctly.
>
> Currently the size of pool->items is calculated in page_pool_create_percp=
u()
> as below, to make sure the size of pool->items is somewhat twice of the
> size of pool->ring so that the number of page sitting in the driver's rx
> ring waiting for the new packet is the similar to the number of page that=
 is
> still being handled in the network stack as most drivers seems to set the
> pool->pool_size according to their rx ring size:
>
> +#define PAGE_POOL_MIN_INFLIGHT_ITEMS           512
> +       unsigned int item_cnt =3D (params->pool_size ? : 1024) +
> +                               PP_ALLOC_CACHE_SIZE + PAGE_POOL_MIN_INFLI=
GHT_ITEMS;
> +       item_cnt =3D roundup_pow_of_two(item_cnt);
>

I'm not sure it's OK to add a limitation to the page_pool that it can
only allocate N pages. At the moment, AFAIU, N is unlimited and it may
become a regression if we add a limitation.

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
> 2. https://lore.kernel.org/all/2fb8d278-62e0-4a81-a537-8f601f61e81d@huawe=
i.com/
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
> https://elixir.bootlin.com/linux/v6.7-rc8/source/drivers/gpu/drm/amd/amdg=
pu/amdgpu_dma_buf.c#L215
>
> Or am I missing something obvious here?
>

I mean currently net_iovs don't hit the __page_pool_release_page_dma
function that causes the crash in the stack trace. The dmabuf layer
handles the unmapping when the dmabuf dies (I assume correctly).

--=20
Thanks,
Mina

