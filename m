Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C3DCD4851
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 07:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjJMZHu/Uo6LrYhVeGtJFtcPCe40cgf2kNbBkwIOrqw=; b=a9LkR33nhv42M3bIZ4JCuHxmGo
	JZPZlEKVZCu/3iW+LVPbKrIc/b9NbSL2AqvcqTg0lLVTfGX+LIvnuIzNKHQfTbmDz+ykXc90Iskix
	ZVvt68ioDCDGy740YUQJtSn5rYf3GLuNdo3jlOf4mTY3egomRl3opiTlIcJrf8kZBYyH8Yf5/S7Zm
	oz6sxaU7+l0aNmAWLpVZWMl/DdtEJR/jT0NSWv02UBo9Ndrpo7Tv9AwJ6IEQRiqAuaqYQHMsZuofe
	wz/V3rdEJEovEEe4S7A1dSMUuWf8IyXBDHI6LPc20W6bAQMXmHBsF6lsIuSbcc1OyvZzM8JsWx05W
	5skjruag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEm8-00000000TX3-1mv5;
	Tue, 19 May 2026 07:22:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPEm6-00000000TWV-3COI
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 07:21:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E30C60052;
	Tue, 19 May 2026 07:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1EFC2BCC6;
	Tue, 19 May 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779175317;
	bh=/sqDR+DAm77iAdHtKSPJrjJ/DUFVxpoRznwkUPqzbvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L89bXobsAp2zYYvGxZx9Xi60sTPBm6auqQlqdg2AjCN43HBANRrT/DU8OPXp60EeV
	 9Jpq/aKhILIqh4rgK9OqbAVpVTqjicHoUm/PCrFtzJpkjwhd1OJeFxJe/n5M577dsN
	 ++CTfsUp9tFSRoD62GgzC/zl62RVAoe35aqCq+n/YbUKbMP4IlKSmeh63FGCZQkJFr
	 vZq60ZuM+Ox9EVC/lszFEf/gIxxz6WYW9bjmj4NtoDoMK7TwDzrVn6NFdaPUEn5/Mw
	 QeKaKxK1+Hld00KSlHVRS0ud12icsY27FiJdyxSegquqHjzrYaONobmwfh0zvXI5c3
	 3wXiBEAYyKvgw==
Date: Tue, 19 May 2026 12:51:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
Message-ID: <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
References: <20260508063633.3894348-1-wenst@chromium.org>
 <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
 <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
 <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
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

On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> On Fri, May 15, 2026 at 8:34 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, May 14, 2026 at 7:48 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >
> > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > On Thu, May 14, 2026 at 1:23 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > > >
> > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > > > > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > > > > > > controller memory access could be limited to a small region by the
> > > > > > > firmware configuring a memory protection unit. This memory region
> > > > > > > must be assigned to the PCIe controller so that the OS knows to
> > > > > > > use that region. Otherwise PCIe devices would not work properly.
> > > > > > >
> > > > > >
> > > > > > So this means, the PCIe devices can only access a specific carveout memory
> > > > > > configured by MPU for DMA? If so, you should use 'dma-ranges' as suggested by
> > > > > > Rob.
> > > > > >
> > > > > > 'memory-region' also serves the purpose, but for PCI, we have the dedicated
> > > > > > 'dma-ranges' property.
> > > > >
> > > > > I think I need some sort of guide on writing the 'dma-ranges' property,
> > > > > because it is not working for me.
> > > > >
> > > > > I'm adding
> > > > >
> > > > >     dma-ranges = <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;
> > > > >
> > > >
> > > > So the device DMA address start from 0x0? Isn't it a 1:1 mapping?
> > >
> > > I actually don't know. But
> > >
> > > >         dma-ranges = <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000000>;
> > >
> > > this didn't work either.
> >
> >
> > Hmm. Can you print the DMA address programmed to the device? i.e., the address
> > returned by dma_map_single() in the driver.
> 
> On a working system still using the restricted-dma-pool memory region,
> it gives something like 0x00000000c0009000, so indeed it is 1:1 mapping?

It has to be 1:1 mapping.

> These are for the RX/TX descriptors [1][2].
> 
> When using dma-ranges, the failure is from dma_alloc_coherent() [3][4],
> which is the descriptor ring. On a working system, this is something
> like 0x00000000c0c9d000, so again 1:1.
> 
> [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L221
> [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L829
> [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L192
> [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L265
> 
> > Also, using prefetchable flag is not correct for DMA memory. You should use:
> >
> >         dma-ranges = <0x02000000 0 0xc0000000 0 0xc0000000 0 0x4000000>;
> 
> This didn't work either. What exactly is supposed to handle dma-ranges?
> I see some code parsing it in the PCI core, but it just saves it to a list.
> 

I think the failure is due to marking the memory as 'reserved' in DT. With
'dma-ranges', the allocator will only ensure that the allocated memory stays
within this limit. But the allocator itself will not use this property to
allocate from the reserved region.

Now, I'm not sure if you can reliably get dma-ranges to work for this usecase
of forcing the dma_alloc_coherent() to use the reserved memory.

So looks like 'memory-region' is your only option here.

- Mani

> 
> Here's a function graph trace for the dma_alloc_coherent() call:
> 
> funcgraph_entry:                   |  dma_alloc_attrs() {
> funcgraph_entry:        6.538 us   |    dma_alloc_from_dev_coherent(); (ret=0x0)
> funcgraph_entry:                   |    dma_direct_alloc() {
> funcgraph_entry:                   |      __dma_direct_alloc_pages.isra.0() {
> funcgraph_entry:        4.846 us   |        dma_alloc_contiguous(); (ret=0x0)
> funcgraph_entry:                   |        __alloc_pages_noprof() {
> funcgraph_entry:                   |          __alloc_frozen_pages_noprof() {
> funcgraph_entry:        5.539 us   |            fs_reclaim_acquire();
> (ret=0xffffff80c7dcd580)
> funcgraph_entry:        5.077 us   |            fs_reclaim_release();
> (ret=0xffffff80c7dcd580)
> funcgraph_entry:                   |            __might_sleep() {
> funcgraph_entry:        5.153 us   |              __might_resched(); (ret=0x0)
> funcgraph_exit:       + 16.230 us  |            } (ret=0x0)
> funcgraph_entry:        5.077 us   |
> __next_zones_zonelist(); (ret=0xffffffd055d598e0)
> funcgraph_entry:                   |            get_page_from_freelist() {
> funcgraph_entry:                   |              _raw_spin_trylock() {
> funcgraph_entry:        5.385 us   |
> do_raw_spin_trylock(); (ret=0x1)
> funcgraph_exit:       + 16.923 us  |              } (ret=0x1)
> funcgraph_entry:                   |              _raw_spin_unlock() {
> funcgraph_entry:        5.077 us   |
> do_raw_spin_unlock(); (ret=0x1)
> funcgraph_exit:       + 16.538 us  |              } (ret=0x100000001)
> funcgraph_exit:       + 54.231 us  |            } (ret=0xfffffffec051c540)
> funcgraph_exit:       ! 123.462 us |          } (ret=0xfffffffec051c540)
> funcgraph_exit:       ! 134.692 us |        } (ret=0xfffffffec051c540)
> funcgraph_entry:                   |        __free_pages() {
> funcgraph_entry:                   |          ___free_pages() {
> funcgraph_entry:                   |            __free_frozen_pages() {
> funcgraph_entry:        5.538 us   |
> __get_pfnblock_flags_mask.isra.0(); (ret=0x0)
> funcgraph_entry:                   |              _raw_spin_trylock() {
> funcgraph_entry:        5.077 us   |
> do_raw_spin_trylock(); (ret=0x1)
> funcgraph_exit:       + 16.538 us  |              } (ret=0x1)
> funcgraph_entry:        5.385 us   |
> free_frozen_page_commit(); (ret=0x1)
> funcgraph_entry:                   |              _raw_spin_unlock() {
> funcgraph_entry:        5.077 us   |
> do_raw_spin_unlock(); (ret=0x1)
> funcgraph_exit:       + 16.385 us  |              } (ret=0x100000001)
> funcgraph_exit:       + 75.000 us  |            } (ret=0x0)
> funcgraph_exit:       + 86.230 us  |          } (ret=0x0)
> funcgraph_exit:       + 97.384 us  |        } (ret=0x0)
> funcgraph_exit:       ! 262.846 us |      } (ret=0x0)
> funcgraph_exit:       ! 274.538 us |    } (ret=0x0)
> funcgraph_exit:       ! 309.077 us |  } (ret=0x0)
> 
> 
> And here are kernel logs for all the system's memory regions:
> 
> Reserved memory: created DMA memory pool at 0x000000013ff00000, size 1 MiB
> OF: reserved mem: initialized node audio-dma-pool, compatible id shared-dma-pool
> OF: reserved mem: 0x000000013ff00000..0x000000013fffffff (1024 KiB)
> nomap non-reusable audio-dma-pool
> OF: reserved mem: 0x00000000ffe65000..0x00000000fff64fff (1024 KiB)
> map non-reusable ramoops
> Reserved memory: created DMA memory pool at 0x0000000050000000, size 41 MiB
> OF: reserved mem: initialized node scp@50000000, compatible id shared-dma-pool
> OF: reserved mem: 0x0000000050000000..0x00000000528fffff (41984 KiB)
> nomap non-reusable scp@50000000
> cma: Reserved 16 MiB at 0x00000000c3000000
> 
> Zone ranges:
>   DMA      [mem 0x0000000040000000-0x00000000c3ffffff]
>   DMA32    [mem 0x00000000c4000000-0x00000000ffffffff]
>   Normal   [mem 0x0000000100000000-0x000000013fffffff]
> 
> Early memory node ranges
>   node   0: [mem 0x0000000040000000-0x000000004fffffff]
>   node   0: [mem 0x0000000050000000-0x00000000528fffff]
>   node   0: [mem 0x0000000052900000-0x00000000545fffff]
>   node   0: [mem 0x0000000054700000-0x00000000ffdfffff]
>   node   0: [mem 0x0000000100000000-0x000000013fefffff]
>   node   0: [mem 0x000000013ff00000-0x000000013fffffff]
> 
> software IO TLB: area num 8.
> software IO TLB: mapped [mem 0x00000000bf000000-0x00000000c3000000] (64MB)
> 
> 
> So I think it could be that the usable memory has all been given away to
> other bits? But then dma_alloc_contiguous() returned NULL.
> 
> 
> ChenYu

-- 
மணிவண்ணன் சதாசிவம்

