Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2BDCD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yPffNZHe5kQWIEuxYDO8nxEoh6Y6zS0pH9BSPRfxylI=; b=wmmS+il/I2ENwC
	abisUe1yBi0IP/3LigqGGQnZjOrzMNTo+BRzvwS8WUDzT59PjnB98SxUarOxr0c0pE4o7ev1x+qGo
	Qb1fBNgmxN1SMjq1gWJyyBwziMfa8imClRfWPbY0GVw3WMVxT1Cl71IT1pJ6LguvbJlao9t/3ys09
	U2xhserlJ3LV/9kFTguChJM40rnwv0Q9Xm+emxwx2X2oDDt2HF9yxCn6UvzjUV9YrN6u/IcFhjY7i
	pMoKan1nITZzEbDyIJMotSQE2o/cm5xG42UZuKNay5Ou73a/CufpeEh/XtOa4YUYBIbBtklAp3hbq
	MKlk70oD1jsEXdMwToHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLZK-00GN5V-1W;
	Mon, 18 Sep 2023 21:14:10 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiLZG-00GN3g-1U;
	Mon, 18 Sep 2023 21:14:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 8C3B2B81110;
	Mon, 18 Sep 2023 21:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D4BC433C8;
	Mon, 18 Sep 2023 21:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695071643;
	bh=4tOam79bsmTQzdb8YxeKxMt9ug/E8wwrIxDwgg6YENk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=VxSE3duFc9Htup9Yy3e5tbU5pz5quf6oJUGYO++yGvHs8+YOooxiZwN5JkeOCaNGN
	 nhpQVmYQfIsk4LBqwYrMneOWJjcVf3BL7kMlDsMZgV7pWg4nlhKRxqey8XID6ua2r3
	 RfSVU5q2gH+74/xFjquv8Dn7CZd+YlnH2is5MclBLjHnIhLBkEQjdBFBueqpafY1zr
	 iLNlNjOWRVjkB0lvb92bnePGGK0jjTkVErUAx/Qw+uTtIAB/8HMWbvZ19MdBnEfjUB
	 6iQoV7e6RL6sxvwlgqgibUYlIwm+mjE93zkB4ksXJa49WvjEY2sZSqvShLgsLQCCKv
	 r2dggUro/aECw==
Date: Mon, 18 Sep 2023 16:14:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/1] PCI: mediatek: Correct type for virt_to_phys()
Message-ID: <20230918211400.GA208009@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQWGd/RyKaUBRhUY@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_141406_676704_F988B089 
X-CRM114-Status: GOOD (  19.06  )
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

On Sat, Sep 16, 2023 at 01:41:59PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 14, 2023 at 03:31:46PM -0500, Bjorn Helgaas wrote:
> > On Thu, Sep 14, 2023 at 10:23:24PM +0300, Andy Shevchenko wrote:
> 
> ...
> 
> > > -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> > > +	addr = virt_to_phys((__force void *)port->base + PCIE_MSI_VECTOR);
> > 
> > Lots of these drivers use either virt_to_phys() or
> > platform_get_resource_byname() to get a physical address that they
> > then use as the MSI target.
> > 
> > But I don't think that's quite right -- the MSI is a DMA transaction
> > on PCI, and in general there's no guarantee that bus addresses are
> > identical to CPU physical addresses, so shouldn't we use a dma_addr_t
> > obtained from the DMA API?
> > 
> > dw_pcie_msi_host_init() has a complicated version of this that uses
> > dmam_alloc_coherent().
> 
> Fair enough. I leave it to you then to get it fixed properly.
> Consider this as just a heads up for the old report.

Sounds good, thanks!

Bjorn

