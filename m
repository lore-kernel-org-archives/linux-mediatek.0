Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E132CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 08:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtIOVf1rotc7qT6YXyN4sWtlD+Ch2pqysqbAwdwLVl4=; b=qgj+RPffkSLNoI
	QQay18j4qZy+6kUR/UH2ErSK2mS974S6yX9YEK5v0tkf4/k4Rh470FWTIyIbpOIsWGyPpvE60pkwH
	TslmCOvHvkzpOchRmSkqmJBQ5/O2Msqo2uCIbWdnBehSMJ44nGC5dXm2+79onH6vSJ5hzdsXSdFD4
	2d0oUPzflH3EsMXuezURzU1Pp6NkSG9ZGrRT/7WywrlX13uLhB7EUa4MYFx1P3GjjLn11U7l73nfH
	9QxwHgsE/9C2mqZA1Qxn9KG1p+1qvzVlLAWwZoAIgv0xezIgP4rBqFHvg2PrtOAWTth/vsRESW4xi
	LWOh2+t05wFt6X89R+/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDMCw-000w2F-MK; Fri, 28 Jan 2022 08:02:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDMCr-000vzj-O0; Fri, 28 Jan 2022 08:02:08 +0000
X-UUID: 67543e7ef4eb4bbda9585ad9bcc00171-20220128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HDnU0wb86vZKOTWmqGB8jRx/BcufaTJRglZ6nyCe9L0=; 
 b=ih+zP761n13SgEBjRXVsrwcqWvb1w55iNGnbg7v+yUq6Vk2ItbwOUkcF3zLuk176on+UC/9paWA8KXCLbNbXNsVFaoTISXu15ypqZDSH9EBo0U+klxWGD9rxsZcz8KHqJsjQUcuxxNCPIpSE0azBLj7P9Gyrg2ngtJbXvH3bEd4=;
X-UUID: 67543e7ef4eb4bbda9585ad9bcc00171-20220128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1630186744; Fri, 28 Jan 2022 01:01:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 23:58:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 28 Jan 2022 15:58:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 15:58:25 +0800
Message-ID: <06cfb0231f084936ede1b252101861c1787de25f.camel@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>, qizhong.cheng
 <qizhong.cheng@mediatek.com>
CC: Marc Zyngier <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Lorenzo
 Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <chuanjia.liu@mediatek.com>, "Srikanth Thokala" <srikanth.thokala@intel.com>, 
 Pratyush Anand <pratyush.anand@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Pali =?ISO-8859-1?Q?Roh=E1r?=
 <pali@kernel.org>
Date: Fri, 28 Jan 2022 15:58:25 +0800
In-Reply-To: <20220127212100.GA102267@bhelgaas>
References: <20220127212100.GA102267@bhelgaas>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_000207_193622_9821D8A8 
X-CRM114-Status: GOOD (  37.36  )
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

Hi Bjorn,

On Thu, 2022-01-27 at 15:21 -0600, Bjorn Helgaas wrote:
> [+cc Srikanth, Pratyush, Thomas, Pali, Ryder, Jianjun]
> 
> On Wed, Jan 26, 2022 at 11:37:58AM +0800, qizhong.cheng wrote:
> > On Tue, 2022-01-25 at 17:21 +0000, Marc Zyngier wrote:
> > > On 2022-01-25 16:57, Bjorn Helgaas wrote:
> > > > On Sun, Jan 23, 2022 at 11:33:06AM +0800, qizhong cheng wrote:
> > > > > As an edge-triggered interrupts, its interrupt status should
> > > > > be cleared before dispatch to the handler of device.
> > > > 
> > > > I'm not an IRQ expert, but the reasoning that "we should clear
> > > > the MSI interrupt status before dispatching the handler because
> > > > MSI is an edge-triggered interrupt" doesn't seem completely
> > > > convincing because your code will now look like this:
> > > > 
> > > >   /* Clear the INTx */
> > > >   writel(1 << bit, port->base + PCIE_INT_STATUS);
> > > >   generic_handle_domain_irq(port->irq_domain, bit -
> > > > INTX_SHIFT);
> > > >   ...
> > > > 
> > > >   /* Clear MSI interrupt status */
> > > >   writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
> > > >   generic_handle_domain_irq(port->inner_domain, bit);
> > > > 
> > > > You clear interrupt status before dispatching the handler for
> > > > *both* level-triggered INTx interrupts and edge-triggered MSI
> > > > interrupts.
> > > > 
> > > > So it doesn't seem that simply being edge-triggered is the
> > > > critical factor here.
> > > 
> > > This is the usual problem with these half-baked implementations.
> > > The signalling to the primary interrupt controller is level, as
> > > they take a multitude of input and (crucially) latch the MSI
> > > edges. Effectively, this is an edge-to-level converter, with all
> > > the problems that this creates.
> > > 
> > > By clearing the status *after* the handling, you lose edges that
> > > have been received and coalesced after the read of the status
> > > register. By clearing it *before*, you are acknowledging the
> > > interrupts early, and allowing them to be coalesced independently
> > > of the ones that have been received earlier.
> > > 
> > > This is however mostly an educated guess. Someone with access to
> > > the TRM should verify this.
> > 
> > Yes, as Maz said, we save the edge-interrupt status so that it
> > becomes a level-interrupt. This is similar to an edge-to-level
> > converter, so we need to clear it *before*. We found this problem
> > through a lot of experiments and tested this patch.
> 
> I thought there might be other host controllers with similar design,
> so I looked at all the other drivers and tried to figure out whether
> any others had similar problems.
> 
> The ones below look suspicious to me because they all clear some sort
> of status register *after* handling an MSI.  Can you guys take a look
> and make sure they are working correctly?
> 
>   keembay_pcie_msi_irq_handler
>     status = readl(pcie->apb_base + PCIE_REGS_INTERRUPT_STATUS)
>     if (status & MSI_CTRL_INT)
>       dw_handle_msi_irq
> 	generic_handle_domain_irq
>       writel(status, pcie->apb_base + PCIE_REGS_INTERRUPT_STATUS)
> 
>   spear13xx_pcie_irq_handler
>     status = readl(&app_reg->int_sts)
>     if (status & MSI_CTRL_INT)
>       dw_handle_msi_irq
> 	generic_handle_domain_irq
>     writel(status, &app_reg->int_clr)
> 
>   advk_pcie_handle_int
>     isr0_status = advk_readl(pcie, PCIE_ISR0_REG)
>     if (isr0_status & PCIE_ISR0_MSI_INT_PENDING)
>       advk_pcie_handle_msi
>         advk_readl(pcie, PCIE_MSI_STATUS_REG)
> 	advk_writel(pcie, BIT(msi_idx), PCIE_MSI_STATUS_REG)
> 	generic_handle_irq
> 	advk_writel(pcie, PCIE_ISR0_MSI_INT_PENDING, PCIE_ISR0_REG)
> 
>   mtk_pcie_irq_handler
>     status = readl_relaxed(pcie->base + PCIE_INT_STATUS_REG)
>     for_each_set_bit_from(irq_bit, &status, ...)
>       mtk_pcie_msi_handler
>         generic_handle_domain_irq
>       writel_relaxed(BIT(irq_bit), pcie->base + PCIE_INT_STATUS_REG)

Thanks for mention that. In the hardware corresponding to pcie-
mediatek-gen3.c, the interrupt status in PCIE_INT_STATUS_REG cannot be
cleared if the MSI status remaining in the register of msi_set, so we
have to clear it after handling the MSI.

I guess the root cause of this patch is the interrupt status can be
cleared even the MSI status still remaining, hence that if there are
some MSIs received while clearing the interrupt status, these MSIs
cannot be serviced.

We will discuss and test internally and update the results later,
thanks for your review.

Thanks.

> 
> Bjorn
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
