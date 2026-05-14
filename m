Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D05DCD4F39
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2026 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ybzrhtGO/Axk+t08WnZyWDsElGPl9tsBKLrbFaSTTFs=; b=iCWHHD7Pdv6ruuHYtHBW3vAYPS
	Qq12BWPoi74hwVotjZoxOaEZMJeKKTj/5VOsO8P5OStiC6JxT6eWBPLuyWv1NF4vXs3H81/v1A9yU
	maNGXMZnWAS2yRi1LBseReoLx2DgWmNuRQiMTMtIZgAunKxRtEf8IE1eICL5l7pS9fDO+5pieRk/l
	Ms8VomjXpwA5acFS55ukgD6M4kFkxiSsj6sy/QSQnHJMHPvRuHP2p4XbgmWI8DPKVwWSqsm7TVtqD
	C0GkT/+I+uhr1j6byeJr/FVttI87PhM4kvFVM5RfOpXBym6uTUs9TDICQL4mx5z1abSOV0Gon55aL
	Po+gUGDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUYD-00000005Ng2-27ot;
	Thu, 14 May 2026 11:48:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUYC-00000005Nfw-06tm
	for linux-mediatek@lists.infradead.org;
	Thu, 14 May 2026 11:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5387660008;
	Thu, 14 May 2026 11:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C81C2BCB3;
	Thu, 14 May 2026 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778759303;
	bh=Tik/ttiPEf3boJrncLYTc95FREntdpzwwu/j1xZKytg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iD/M1vNHVKXp0H/ZB8IuDyYPotjiQCAOb3xe/kYJbrjn35JYYdNfHRF7PJaltT272
	 yf9JsfZ6If/Xw2mQpGpK+HRQsAyhCxe91Vv5R/8G50T+low5zJ5dn7iYyNo3ulUs5F
	 oxsyYObrfOdLUulzPoIgTEdGIl7WIwQ04I4x6TMXJ1zQ/3qMqEB5bjvUcCME/If49/
	 FdBzMFGrbN+W1YYgGe82cs/GNm48y7EUOsfYtg7oO62GVxiT1kwbZ3ryb6cdqYFP5t
	 9qZfcckHmZyWP6LSa3yM/pTqo80poAJtY2ylSEvDEmgv0HOlAz9o7r3znVlmCILXmx
	 EFnVAZc3zjM5A==
Date: Thu, 14 May 2026 17:18:14 +0530
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
Message-ID: <qnikqcqoiw7z2yh5wruqcli3rk56yomyymghzivlcmekp2blwc@dfhsfl3sqcla>
References: <20260508063633.3894348-1-wenst@chromium.org>
 <locoul5wdzuvvmm7mqpuntjqu4o75gmyd5npgfqrw3zuwsrse6@dhrjggs4cihh>
 <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GAaMQbaoUVr5zcwtHaofyXwHz03TxBe-QyWj_sNoQZsg@mail.gmail.com>
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

On Thu, May 14, 2026 at 03:54:29PM +0800, Chen-Yu Tsai wrote:
> On Thu, May 14, 2026 at 1:23 PM Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Fri, May 08, 2026 at 02:36:32PM +0800, Chen-Yu Tsai wrote:
> > > On some SoCs without an IOMMU behind the PCIe controller, the PCIe
> > > controller memory access could be limited to a small region by the
> > > firmware configuring a memory protection unit. This memory region
> > > must be assigned to the PCIe controller so that the OS knows to
> > > use that region. Otherwise PCIe devices would not work properly.
> > >
> >
> > So this means, the PCIe devices can only access a specific carveout memory
> > configured by MPU for DMA? If so, you should use 'dma-ranges' as suggested by
> > Rob.
> >
> > 'memory-region' also serves the purpose, but for PCI, we have the dedicated
> > 'dma-ranges' property.
> 
> I think I need some sort of guide on writing the 'dma-ranges' property,
> because it is not working for me.
> 
> I'm adding
> 
>     dma-ranges = <0x42000000 0 0x00000000 0 0xc0000000 0 0x4000000>;
> 

So the device DMA address start from 0x0? Isn't it a 1:1 mapping?

	dma-ranges = <0x42000000 0 0xc0000000 0 0xc0000000 0 0x4000000>;

- Mani

-- 
மணிவண்ணன் சதாசிவம்

