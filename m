Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23DACD6E55
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Jun 2026 21:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ABndK8Yqocrn8l9TWmQbfauSTjrVegcC2yyvk6FSK+c=; b=mzheoftnU7K5bUjmc3sIYddzsE
	6it6lPPZzFw7X2NP316RLDQcvuvgVkyzuX9/d9YWJpqTaFEsZsgWtw8EngD2vl7+gga1kpZNaqQf4
	WzO26VT7V3kqHh8x8QvhRr7WFN9HdFNV3y9yz8MHwcNc4C3m5rbPThccGgKyxAGDAxBewWohktYk0
	/3vJn0F4pndJe53nCJpNIJkAUfwUhAjf6RYCpCgrMybj/+zaC3FkrRipsoZSfw2f4Vb3nQlfANZSq
	NElmX714cFHO1CjnX+PZoTYMNNipO8KdcdoUq0BK+PFCBOWqNSOu3zpnThpz6FAqGuY3HcVYoMK3N
	IF3aJFUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAUx-0000000Bscb-1uaz;
	Mon, 01 Jun 2026 21:48:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUAUw-0000000BscF-2UTO
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Jun 2026 21:48:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9410D600AA;
	Mon,  1 Jun 2026 21:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF281F00893;
	Mon,  1 Jun 2026 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780350517;
	bh=ABndK8Yqocrn8l9TWmQbfauSTjrVegcC2yyvk6FSK+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fRBG4Cx49F1b6mhbOr4R3eMGTorCocZ2HTlIYBNisMXOugHupg8U0f3zAZpjNQFKV
	 aEqCYE5az1enhQMtoVa3TA5HXFE5S0+7aFSWQfOlEZS2HLFDBz27KAqnc+eeALEWm9
	 iKoXXbMq4aRjFOd3kQxh1bB1b+wNx6uDm0+g6DSUANV6NUjP2DLKCGxPZG6AT0Z18Z
	 LOda1fKD6Au6hhWOVmpuwcawh0/TijzqJjWelj3GrFoPcE1yrObhItX28jdit7S4MN
	 OaEXmD8f1kJZ0HFAdAN2gfVCryUjfLlLCNwz4wGR7/6IntGW67+WCjcj4GfWV9vH3c
	 lLEJa0T71IFKg==
Date: Mon, 1 Jun 2026 16:48:36 -0500
From: Rob Herring <robh@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for
 restricted DMA buffer
Message-ID: <20260601214836.GA37779-robh@kernel.org>
References: <20260508063633.3894348-1-wenst@chromium.org>
 <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
 <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
 <CAGXv+5GRBv8+pLbb-AyFW0cAx=c45JhWd-odzJGDdWABKQLaqg@mail.gmail.com>
 <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rphuqwucr2r6gsgrkzkpzy7fn4qa7q4afzbwtzae53dtudmush@kxtzdoq426uz>
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

On Tue, May 19, 2026 at 12:51:49PM +0530, Manivannan Sadhasivam wrote:
> On Mon, May 18, 2026 at 05:02:11PM +0800, Chen-Yu Tsai wrote:
> > On Fri, May 15, 2026 at 8:34 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > >
> > > On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> > > > On Thu, May 14, 2026 at 7:48 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > >
> > > > > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > > > > On Thu, May 14, 2026 at 1:23 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > > > >
> > > > > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > > > > > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > > > > > > > controller memory access could be limited to a small region by the
> > > > > > > > firmware configuring a memory protection unit. This memory region
> > > > > > > > must be assigned to the PCIe controller so that the OS knows to
> > > > > > > > use that region. Otherwise PCIe devices would not work properly.
> > > > > > > >
> > > > > > >
> > > > > > > So this means, the PCIe devices can only access a specific carveout memory
> > > > > > > configured by MPU for DMA? If so, you should use 'dma-ranges' as suggested by
> > > > > > > Rob.
> > > > > > >
> > > > > > > 'memory-region' also serves the purpose, but for PCI, we have the dedicated
> > > > > > > 'dma-ranges' property.
> > > > > >
> > > > > > I think I need some sort of guide on writing the 'dma-ranges' property,
> > > > > > because it is not working for me.
> > > > > >
> > > > > > I'm adding
> > > > > >
> > > > > >     dma-ranges = <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;
> > > > > >
> > > > >
> > > > > So the device DMA address start from 0x0? Isn't it a 1:1 mapping?
> > > >
> > > > I actually don't know. But
> > > >
> > > > >         dma-ranges = <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000000>;
> > > >
> > > > this didn't work either.
> > >
> > >
> > > Hmm. Can you print the DMA address programmed to the device? i.e., the address
> > > returned by dma_map_single() in the driver.
> > 
> > On a working system still using the restricted-dma-pool memory region,
> > it gives something like 0x00000000c0009000, so indeed it is 1:1 mapping?
> 
> It has to be 1:1 mapping.
> 
> > These are for the RX/TX descriptors [1][2].
> > 
> > When using dma-ranges, the failure is from dma_alloc_coherent() [3][4],
> > which is the descriptor ring. On a working system, this is something
> > like 0x00000000c0c9d000, so again 1:1.
> > 
> > [1] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L221
> > [2] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L829
> > [3] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L192
> > [4] https://elixir.bootlin.com/linux/v7.0.8/source/drivers/net/wireless/realtek/rtw88/pci.c#L265
> > 
> > > Also, using prefetchable flag is not correct for DMA memory. You should use:
> > >
> > >         dma-ranges = <0x02000000 0 0xc0000000 0 0xc0000000 0 0x4000000>;
> > 
> > This didn't work either. What exactly is supposed to handle dma-ranges?
> > I see some code parsing it in the PCI core, but it just saves it to a list.
> > 
> 
> I think the failure is due to marking the memory as 'reserved' in DT. With
> 'dma-ranges', the allocator will only ensure that the allocated memory stays
> within this limit. But the allocator itself will not use this property to
> allocate from the reserved region.

So the region should not be reserved. Reserved generally means the OS 
shouldn't use the region (though maybe a specific driver/device can). It 
should just be a CMA area I think.

Rob

