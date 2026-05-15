Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E94CD4851
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 12:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZhjnMsDftc2LX6yp09ixuLmbbm98+td5Ofkkn/NpX0=; b=MTsaoSOntbBXQKLVevdl61gDoM
	bl1ZoO0upmWDTav4d/EHAfVw7WBU+e6VupYfNGIhp6DHDz0nXMlYZJqo6k/+FGDocnT+wQjjsOTTn
	z32a9rJrqYr2kbCXg3HmezB6nafaMs/ZWxo2owipnYe8J98yPwcjAqwEicIEpGNAOUJ3C50JooZdm
	3Pa3RvLmlbrCLOvq4in630pu/bfNF12DhFaaz47wtGCLHatb49BX5qfouwV7sN1MMea3ZJQjLWwDz
	NK0SCIZXt5DUvjourUCme7WWeqMf8mtS79WQBKQU8+IY3uuQlQtQw3Us5c21UOAeUodSrt9JAieNj
	JbeW22ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrkW-00000008LHb-0dcF;
	Fri, 15 May 2026 12:34:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrkU-00000008LH9-1sRS
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 12:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9142660018;
	Fri, 15 May 2026 12:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A907C2BCB0;
	Fri, 15 May 2026 12:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778848477;
	bh=JbXnvVyBQOQm3POKkCXAnCMirmd5M25Arn9QV67e5KY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khL1kYnxGQq5eSnbqjbwdr/JJ1zAxr2qRthtVT3dNo1OtwC3Zpr2b/hkfWfyZkw7q
	 XzibwMOjiMYRkgjBCVrJgxS1L9ItMrsL+Sv4L+rkDOx1K8gQeG8kExobc/b6mFaPb+
	 9Po/gxOjJH7MpII79MKJN/bb25dNvh7aQtq0OeT0jdbpent7uyCHWE7zazApElnMEB
	 Vb7xOgeUcDNAtklcn88V3LDgq9G/WanrwPtzG0qeraRf2rpoNW8EESmPRbffykltJK
	 flKIn2VP8ot2i3W15LvUX0+BYj3nxV50Zjy65sdUhUThQbb8SyxHP0O++O6z+kl1Xc
	 /WOLrBa8UnnVg==
Date: Fri, 15 May 2026 18:04:29 +0530
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
Message-ID: <2tq4zy3zhcrz25rl2qhdsxvoedcry4z3v2lmmropesxqgzhtlp@fn6htdl74ogu>
References: <20260508063633.3894348-1-wenst@chromium.org>
 <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
 <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
 <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GBraoTrQatQdrM5b+dOteL_Y5K7_UQBUt-2L1x=c94KA@mail.gmail.com>
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

On Fri, May 15, 2026 at 05:16:19PM +0800, Chen-Yu Tsai wrote:
> On Thu, May 14, 2026 at 7:48 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> > > On Thu, May 14, 2026 at 1:23 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >
> > > > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > > > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > > > > controller memory access could be limited to a small region by the
> > > > > firmware configuring a memory protection unit. This memory region
> > > > > must be assigned to the PCIe controller so that the OS knows to
> > > > > use that region. Otherwise PCIe devices would not work properly.
> > > > >
> > > >
> > > > So this means, the PCIe devices can only access a specific carveout memory
> > > > configured by MPU for DMA? If so, you should use 'dma-ranges' as suggested by
> > > > Rob.
> > > >
> > > > 'memory-region' also serves the purpose, but for PCI, we have the dedicated
> > > > 'dma-ranges' property.
> > >
> > > I think I need some sort of guide on writing the 'dma-ranges' property,
> > > because it is not working for me.
> > >
> > > I'm adding
> > >
> > >     dma-ranges = <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;
> > >
> >
> > So the device DMA address start from 0x0? Isn't it a 1:1 mapping?
> 
> I actually don't know. But
> 
> >         dma-ranges = <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000000>;
> 
> this didn't work either.


Hmm. Can you print the DMA address programmed to the device? i.e., the address
returned by dma_map_single() in the driver.

Also, using prefetchable flag is not correct for DMA memory. You should use:

	dma-ranges = <0x02000000 0 0xc0000000 0 0xc0000000 0 0x4000000>;

- Mani

-- 
மணிவண்ணன் சதாசிவம்

