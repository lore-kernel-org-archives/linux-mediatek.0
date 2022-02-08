Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ECDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W6BDwICBaiu1mmyVwuoHYLAracnoGR/KEfJFq3b88Us=; b=RgJhE3A53+pUzP
	444WHDYdOPNDD56I4FZV/GyzKavYDh+4/EGU54JyNIcvbw1GNacG4CmLy7WLEm2FPi/6SwLHMo/S4
	LuTYhJeYwiACTPGTFnnAy/6QCfTPBWwXuMMD8URaVGOayidQrKvub1x84vXxw+icVVo+tz04Npgeb
	rGPiJu0cKqeovcbZTaGgjz7MlBky/o1u0qxYcD8epdrHyn2cVRLS+0jUzUCtJRh4j0GFWzuTQgtnh
	VYbw4lSEon2JSyKavO9CImx+m4vHlkYayj/tHQJXx/tQuSycuEdqJ0D5JTZuMfTtuGfvnXqrbshPK
	pxXkouBa+ZvnUii7JSiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHKi9-00Ck65-UX; Tue, 08 Feb 2022 07:14:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHKhx-00Ck2I-96; Tue, 08 Feb 2022 07:14:39 +0000
X-UUID: 4677251039f54d3da5ebfe67a8cecc4e-20220208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=c9MIAl2/vPy7BL2Lu5Lsf4i38POmukOcKOfbj1glrCA=; 
 b=MpUFydl4Z2ZdWDVqWzhRnkMzUhZr2nSpJ7TtB0k1fGXrxbaRcnLmDvV43UKKjlDW8hTwAPLzerLRsr7XQJA/BCyhShxxNW2xNWlnvtUcSPnGbr2uJey5KrGfOBuwz6QRNRodsyL6rXQSDFe9iGueeIBJ82e4dHrv/sdweoBdO9o=;
X-UUID: 4677251039f54d3da5ebfe67a8cecc4e-20220208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qizhong.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1022747745; Tue, 08 Feb 2022 00:14:28 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 23:08:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Feb 2022 15:08:48 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Feb 2022 15:08:47 +0800
Message-ID: <27529bea92fed181d5b47b29143f5cf1ee95735d.camel@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
From: qizhong.cheng <qizhong.cheng@mediatek.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>, Bjorn Helgaas
 <helgaas@kernel.org>
CC: Marc Zyngier <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>, Krzysztof
 =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
 <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <chuanjia.liu@mediatek.com>, Srikanth
 Thokala <srikanth.thokala@intel.com>, Pratyush Anand
 <pratyush.anand@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>, qizhong cheng
 <qizhong.cheng@mediatek.com>
Date: Tue, 8 Feb 2022 15:08:47 +0800
In-Reply-To: <06cfb0231f084936ede1b252101861c1787de25f.camel@mediatek.com>
References: <20220127212100.GA102267@bhelgaas>
 <06cfb0231f084936ede1b252101861c1787de25f.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_231437_352810_265B0F7A 
X-CRM114-Status: GOOD (  43.36  )
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

On Fri, 2022-01-28 at 15:58 +0800, Jianjun Wang wrote:
> Hi Bjorn,
> 
> On Thu, 2022-01-27 at 15:21 -0600, Bjorn Helgaas wrote:
> > [+cc Srikanth, Pratyush, Thomas, Pali, Ryder, Jianjun]
> > 
> > On Wed, Jan 26, 2022 at 11:37:58AM +0800, qizhong.cheng wrote:
> > > On Tue, 2022-01-25 at 17:21 +0000, Marc Zyngier wrote:
> > > > On 2022-01-25 16:57, Bjorn Helgaas wrote:
> > > > > On Sun, Jan 23, 2022 at 11:33:06AM +0800, qizhong cheng
> > > > > wrote:
> > > > > > As an edge-triggered interrupts, its interrupt status
> > > > > > should
> > > > > > be cleared before dispatch to the handler of device.
> > > > > 
> > > > > I'm not an IRQ expert, but the reasoning that "we should
> > > > > clear
> > > > > the MSI interrupt status before dispatching the handler
> > > > > because
> > > > > MSI is an edge-triggered interrupt" doesn't seem completely
> > > > > convincing because your code will now look like this:
> > > > > 
> > > > >   /* Clear the INTx */
> > > > >   writel(1 << bit, port->base + PCIE_INT_STATUS);
> > > > >   generic_handle_domain_irq(port->irq_domain, bit -
> > > > > INTX_SHIFT);
> > > > >   ...
> > > > > 
> > > > >   /* Clear MSI interrupt status */
> > > > >   writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
> > > > >   generic_handle_domain_irq(port->inner_domain, bit);
> > > > > 
> > > > > You clear interrupt status before dispatching the handler for
> > > > > *both* level-triggered INTx interrupts and edge-triggered MSI
> > > > > interrupts.
> > > > > 
> > > > > So it doesn't seem that simply being edge-triggered is the
> > > > > critical factor here.
> > > > 
> > > > This is the usual problem with these half-baked
> > > > implementations.
> > > > The signalling to the primary interrupt controller is level, as
> > > > they take a multitude of input and (crucially) latch the MSI
> > > > edges. Effectively, this is an edge-to-level converter, with
> > > > all
> > > > the problems that this creates.
> > > > 
> > > > By clearing the status *after* the handling, you lose edges
> > > > that
> > > > have been received and coalesced after the read of the status
> > > > register. By clearing it *before*, you are acknowledging the
> > > > interrupts early, and allowing them to be coalesced
> > > > independently
> > > > of the ones that have been received earlier.
> > > > 
> > > > This is however mostly an educated guess. Someone with access
> > > > to
> > > > the TRM should verify this.
> > > 
> > > Yes, as Maz said, we save the edge-interrupt status so that it
> > > becomes a level-interrupt. This is similar to an edge-to-level
> > > converter, so we need to clear it *before*. We found this problem
> > > through a lot of experiments and tested this patch.
> > 
> > I thought there might be other host controllers with similar
> > design,
> > so I looked at all the other drivers and tried to figure out
> > whether
> > any others had similar problems.
> > 
> > The ones below look suspicious to me because they all clear some
> > sort
> > of status register *after* handling an MSI.  Can you guys take a
> > look
> > and make sure they are working correctly?
> > 
> >   keembay_pcie_msi_irq_handler
> >     status = readl(pcie->apb_base + PCIE_REGS_INTERRUPT_STATUS)
> >     if (status & MSI_CTRL_INT)
> >       dw_handle_msi_irq
> > 	generic_handle_domain_irq
> >       writel(status, pcie->apb_base + PCIE_REGS_INTERRUPT_STATUS)
> > 
> >   spear13xx_pcie_irq_handler
> >     status = readl(&app_reg->int_sts)
> >     if (status & MSI_CTRL_INT)
> >       dw_handle_msi_irq
> > 	generic_handle_domain_irq
> >     writel(status, &app_reg->int_clr)
> > 
> >   advk_pcie_handle_int
> >     isr0_status = advk_readl(pcie, PCIE_ISR0_REG)
> >     if (isr0_status & PCIE_ISR0_MSI_INT_PENDING)
> >       advk_pcie_handle_msi
> >         advk_readl(pcie, PCIE_MSI_STATUS_REG)
> > 	advk_writel(pcie, BIT(msi_idx), PCIE_MSI_STATUS_REG)
> > 	generic_handle_irq
> > 	advk_writel(pcie, PCIE_ISR0_MSI_INT_PENDING, PCIE_ISR0_REG)
> > 
> >   mtk_pcie_irq_handler
> >     status = readl_relaxed(pcie->base + PCIE_INT_STATUS_REG)
> >     for_each_set_bit_from(irq_bit, &status, ...)
> >       mtk_pcie_msi_handler
> >         generic_handle_domain_irq
> >       writel_relaxed(BIT(irq_bit), pcie->base +
> > PCIE_INT_STATUS_REG)
> 
> Thanks for mention that. In the hardware corresponding to pcie-
> mediatek-gen3.c, the interrupt status in PCIE_INT_STATUS_REG cannot
> be
> cleared if the MSI status remaining in the register of msi_set, so we
> have to clear it after handling the MSI.
> 
> I guess the root cause of this patch is the interrupt status can be
> cleared even the MSI status still remaining, hence that if there are
> some MSIs received while clearing the interrupt status, these MSIs
> cannot be serviced.
> 
> We will discuss and test internally and update the results later,
> thanks for your review.
> 
> Thanks.
> 
> > 
> > Bjorn
> 
> 

Sorry for the late reply. Thanks for your comment. I will update
subject and add commit log in the next version.

The interrupt status can be cleared even the MSI status still
remaining, as an edge-triggered interrupts, its interrupt status should
be cleared before dispatching handler to capture the next interrupt.

The design of MSI hardware block diagram is as follows:
      +-----+
      | GIC |
      +-----+
         ^
         |
  +-----------------+
  | INT_STATUS |
  +-----------------+
         ^
         | (edge-triggered)
  +-----------------+
  | MSI_STATUS | 
  +-----------------+
         ^
         |
  +-----------------+
  | EP send MSI |
  +-----------------+

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
