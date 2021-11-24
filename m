Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Nov 2021 03:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L8fHsWHo7Fa4hgt8ub2QHfx841bYydnUSlyZcpdRlzs=; b=y6k88/1CX5gha0
	exeN/LnVlgcZgGcLVlYs9Bb4afeLdoFJO82r7pcyE4g/oXWPb5Qq3t+0KOD1cJdEScE+LegO2YVzD
	hd9v0QaOjCdBs6VLR3BZMcBmYy5L5yN8Z+Xp71fvqJ2bTHAOP9OToLnnHn7kCf+J2O0xszeqNrURg
	kyzC579wgq7UVF//8b0Wfd1rNTTV2GUa3qTXkQQkw7GqLGOqa9uNrRLLdP8vj8/AITrgb2WakAWJ+
	RbFjgMzqCg+IurZE9/zt+moriPY0HUOGmqf+AtmOmx5E6PjSl+zTpWlaoO/cvrQ7Gpp+RLdud2UBW
	z9lJ0Hge3TXsYsysA23g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpjNq-003smc-V3; Wed, 24 Nov 2021 03:55:46 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpjNc-003skT-I4
 for linux-mediatek@lists.infradead.org; Wed, 24 Nov 2021 03:55:35 +0000
Received: by mail-il1-x12f.google.com with SMTP id j21so1189258ila.5
 for <linux-mediatek@lists.infradead.org>; Tue, 23 Nov 2021 19:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/926FuVicfVC1nK0FVXtvbHMwYM36BbozQFkXoWswMk=;
 b=baWredfSFOMml8i0WHnqdj/WGSDAxeAgzkAmd1thTn9aNwNroqW+LAEdqtpecxvh+b
 tCXRUWrN47euOGjLHG7G3uJjFPwytNu/aK/96hIfHSB0xYg3UOLmBcTijw1YMNgbqG93
 r7Ua1tBOsOazX8ohB69fkXFcgQ1isqMA9u8bE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/926FuVicfVC1nK0FVXtvbHMwYM36BbozQFkXoWswMk=;
 b=cyz0bfhWICuJFdAeZ1kmMYqKgfwhCnM032Bs9oW2qXRM1jkqNP/LUFoR9m73S69CV3
 Oz042wkUMRx0ndLPbWCHaHC/KQtG5+XWzFWC6uPNSlbIvtF/PVnKOvUqfRvbKJreY8gm
 fZHPWXf3niVWb1/6kgD1rAksGlpYPJ3OYD8384ATySK5pgJ++0oYXIujLm4ZLsVUw2Bi
 rUToTSGDcb8FWRMRiSt56EZVzA5xVk8GZG0KkMnAEo4XT2z+KKVoT5yIOLrhN6rdnpQp
 ajCjGWe28gZY9sTLhYBiJbjkmrwJrqJwsWSRrPRpx1JxqmF4mGbiN59WevY6jBX/1mJ1
 RtlA==
X-Gm-Message-State: AOAM5337HChmxWSSNR/oC8DkDxmDGdgcg30M56Tq3qHHxxd8VOKKpGkH
 NHpAB15WMzcUqCi4635MfvHMfmyruA+axrjYPWxXtg==
X-Google-Smtp-Source: ABdhPJzWS1uYf8FWo45Cg3tq/AFpg6d/7sMCQWCP67g5+L5DT9Ag8Vsgz85lfPSTKmIcrxXnM+BisytQv2Zb2NcXTnM=
X-Received: by 2002:a05:6e02:1a63:: with SMTP id
 w3mr9334649ilv.230.1637726131600; 
 Tue, 23 Nov 2021 19:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20211123112104.3530135-1-hsinyi@chromium.org>
 <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
In-Reply-To: <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 24 Nov 2021 11:55:05 +0800
Message-ID: <CAJMQK-gHpmfedbRfR-1ZNLw0LpRDJHYoKLd-k3kvkqFf8vnD4A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime@cerno.tech>, 
 - <devicetree-spec@vger.kernel.org>, devicetree@vger.kernel.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, senozhatsky@chromium.org, 
 tfiga@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_195532_669418_E612B245 
X-CRM114-Status: GOOD (  25.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Nov 23, 2021 at 7:58 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-11-23 11:21, Hsin-Yi Wang wrote:
> > Default IO_TLB_SEGSIZE (128) slabs may be not enough for some use cases.
> > This series adds support to customize io_tlb_segsize for each
> > restricted-dma-pool.
> >
> > Example use case:
> >
> > mtk-isp drivers[1] are controlled by mtk-scp[2] and allocate memory through
> > mtk-scp. In order to use the noncontiguous DMA API[3], we need to use
> > the swiotlb pool. mtk-scp needs to allocate memory with 2560 slabs.
> > mtk-isp drivers also needs to allocate memory with 200+ slabs. Both are
> > larger than the default IO_TLB_SEGSIZE (128) slabs.
>
> Are drivers really doing streaming DMA mappings that large? If so, that
> seems like it might be worth trying to address in its own right for the
> sake of efficiency - allocating ~5MB of memory twice and copying it back
> and forth doesn't sound like the ideal thing to do.
>
> If it's really about coherent DMA buffer allocation, I thought the plan
> was that devices which expect to use a significant amount and/or size of
> coherent buffers would continue to use a shared-dma-pool for that? It's
> still what the binding implies. My understanding was that
> swiotlb_alloc() is mostly just a fallback for the sake of drivers which
> mostly do streaming DMA but may allocate a handful of pages worth of
> coherent buffers here and there. Certainly looking at the mtk_scp
> driver, that seems like it shouldn't be going anywhere near SWIOTLB at all.
>
mtk_scp on its own can use the shared-dma-pool, which it currently uses.
The reason we switched to restricted-dma-pool is that we want to use
the noncontiguous DMA API for mtk-isp. The noncontiguous DMA API is
designed for devices with iommu, and if a device doesn't have an
iommu, it will fallback using swiotlb. But currently noncontiguous DMA
API doesn't work with the shared-dma-pool.

vb2_dc_alloc() -> dma_alloc_noncontiguous() -> alloc_single_sgt() ->
__dma_alloc_pages() -> dma_direct_alloc_pages() ->
__dma_direct_alloc_pages() -> swiotlb_alloc().


> Robin.
>
> > [1] (not in upstream) https://patchwork.kernel.org/project/linux-media/cover/20190611035344.29814-1-jungo.lin@mediatek.com/
> > [2] https://elixir.bootlin.com/linux/latest/source/drivers/remoteproc/mtk_scp.c
> > [3] https://patchwork.kernel.org/project/linux-media/cover/20210909112430.61243-1-senozhatsky@chromium.org/
> >
> > Hsin-Yi Wang (3):
> >    dma: swiotlb: Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
> >    dt-bindings: Add io-tlb-segsize property for restricted-dma-pool
> >    arm64: dts: mt8183: use restricted swiotlb for scp mem
> >
> >   .../reserved-memory/shared-dma-pool.yaml      |  8 +++++
> >   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 +--
> >   include/linux/swiotlb.h                       |  1 +
> >   kernel/dma/swiotlb.c                          | 34 ++++++++++++++-----
> >   4 files changed, 37 insertions(+), 10 deletions(-)
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
