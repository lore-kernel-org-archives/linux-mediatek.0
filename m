Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1DAC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 07:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HE4q8/2va5gewGAL9bPCsqG39tVkQ2HLB6V8/Ksg20I=; b=CwuYQh8WInFJK0
	6dJzLIc1tGtbbkksvVWgj/+GhPZ4Dzrit1XcoX1Ix4JNhMsQnBelU7bLIrH2YS4NiKc+f/NFV7BgB
	UuXa0NXuldt9mt9n2E+WXMNdih4nlm3OUPxc39YDXdaZguu2e/5J6HSchnJqSOO6KCm8/irl6EnjA
	ujFMxUC3Xdgi3SQkd8/Kv6AayWbWgAXSMM/j458t59uTDPGmskr4PmsM5ov2QOVVhCrTbmuJTUMIT
	42EU2q7pf9rJAaV9g/5uzA+qwngV+CwgrWtI5W2gqzkqCKSt918DLAqv3SDiv/GREl5hob+vPOQgN
	375p7X6o73hGdHuQc/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq9Ih-006bEh-IV; Thu, 25 Nov 2021 07:36:11 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq9Id-006bDq-Ub
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 07:36:09 +0000
Received: by mail-qk1-x72e.google.com with SMTP id m186so9884759qkb.4
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 23:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KNC33UOfOEobGSH4D2BAGe1O2xKscv36EvgOg4IHB58=;
 b=Rpw/69UAWSNd8StTv2nscHlaIMcTUiobMTp+ftwkGCsaQtyLxOr7gGSWKoYZgshUWk
 ewf72wr6GPbS5wtHpXlTgrhNhl+T97U/m5QPSD6tac5ZJR/aUUYbszs5FGZgW4ncfiBa
 +MrtrH9UwcSQcT3C6GtR9iK8GlmmoOJ45yoDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KNC33UOfOEobGSH4D2BAGe1O2xKscv36EvgOg4IHB58=;
 b=Pd1XW0ZaTxOOCsF2SVdKzMSXrId//gILf7fZUK72a5XzThCtbEZwjRRx0VRkNIaz2i
 RiDlQKh+UlqVTgptMH2rc4X9EvPM9VA8mLtG0cmGkGxDK6M4h4psW2G61nhJ70PR0qWB
 p538Y/S6clzFECU3F5evHSWkioBvPfSQ/i75OgRf9QVzFew8eqIDwQxEpHIEygho+RDQ
 k6jGXSrA2b5tXqfsVJv8FbaQrn6e3C4SULBZyUx+NESffuULRE7A659bDMbHNO58u094
 ijxdboJOk1D7a5n0VrQJi4WdLo3LSirBT14waizr8aJtDfbuRwmQ1BMaGePgH1UCTDNf
 4H/A==
X-Gm-Message-State: AOAM533aqbU0KuayHFzhsWc7LV/SY8apmIyyBGJ0oeh53CTSj8CXeA1G
 BxBD9aZeJIZ4NfdSqi/SSLovLDDlgaOEz3lx
X-Google-Smtp-Source: ABdhPJw6908U/tVlNVIF54aIPLWeNpPpHaftOKJBsrplEoRgIwa0USZkajrmpvKMH+6c0nJ71fdamg==
X-Received: by 2002:a05:620a:27c3:: with SMTP id
 i3mr12803315qkp.442.1637825766656; 
 Wed, 24 Nov 2021 23:36:06 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181])
 by smtp.gmail.com with ESMTPSA id b6sm1118445qtk.91.2021.11.24.23.36.06
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 23:36:06 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id b67so9862158qkg.6
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 23:36:06 -0800 (PST)
X-Received: by 2002:a25:ccd0:: with SMTP id l199mr4122013ybf.39.1637825755668; 
 Wed, 24 Nov 2021 23:35:55 -0800 (PST)
MIME-Version: 1.0
References: <20211123112104.3530135-1-hsinyi@chromium.org>
 <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
In-Reply-To: <75ea1026-63e5-165a-9e07-27b5ac4c7579@arm.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 25 Nov 2021 16:35:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AA3XCqxOSdQOOCMEdByDKRz5J9vWB0QghO2SSCqOvQBQ@mail.gmail.com>
Message-ID: <CAAFQd5AA3XCqxOSdQOOCMEdByDKRz5J9vWB0QghO2SSCqOvQBQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Allow restricted-dma-pool to customize IO_TLB_SEGSIZE
To: Robin Murphy <robin.murphy@arm.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Christoph Hellwig <hch@infradead.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 iommu@lists.linux-foundation.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Maxime Ripard <maxime@cerno.tech>, - <devicetree-spec@vger.kernel.org>, 
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 senozhatsky@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_233608_000052_5BCBC131 
X-CRM114-Status: GOOD (  25.63  )
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

Hi Robin,

On Tue, Nov 23, 2021 at 8:59 PM Robin Murphy <robin.murphy@arm.com> wrote:
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

First, thanks a lot for taking a look at this patch series.

The drivers would do streaming DMA within a reserved region that is
the only memory accessible to them for security reasons. This seems to
exactly match the definition of the restricted pool as merged
recently.

The new dma_alloc_noncontiguous() API would allow allocating suitable
memory directly from the pool, which would eliminate the need to copy.
However, for a restricted pool, this would exercise the SWIOTLB
allocator, which currently suffers from the limitation as described by
Hsin-Yi. Since the allocator in general is quite general purpose and
already used for coherent allocations as per the current restricted
pool implementation, I think it indeed makes sense to lift the
limitation, rather than trying to come up with yet another thing.

Best regards,
Tomasz

>
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
