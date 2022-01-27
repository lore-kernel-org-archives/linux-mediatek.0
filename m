Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D3D5C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=T2daFXGuw9W2a56IiVeJL2LYv+IH9aBj+0ROmRZoemw=; b=B+QIjok8OPStd3
	WAYRyfTiBQuy+h0ZXTJD8AmaQIl69NhxymyqIYcHur95JgFzfT/potJLHh3HbuiiqntcojLlVptp4
	2si2RZqbeQgy35VPPny34xMJnOY0UWYKdizQp1TMAcl6QB4GQfP/pPFxkTOu8e8u9hwnDE9HXophR
	hUDe04zVNw+V5BOccyk/0346aWdlAZ4zLrLt4jL5l7+qaDk9vdkrw0uZmS8H/qaq1hGvFG1vKiv+W
	0M1GrCySTZohmNZWlBJASP3Fj3Dg0wwf/HQYgjQXPoDeKXu+uZtw01NAl4ejBDu0wHOzOml2nNF+g
	jkMM7x52EX71lhYL4lTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDCCh-00H9Qf-QV; Thu, 27 Jan 2022 21:21:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDCCW-00H9PG-0m; Thu, 27 Jan 2022 21:21:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5942761ABD;
 Thu, 27 Jan 2022 21:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F2AC340E4;
 Thu, 27 Jan 2022 21:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643318461;
 bh=vEhS+uNe9MbUR6FumfDLesP9xJaTiiHWcuhhBI9N7ng=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=IQmm35PUiDv2We4J7ZGC4FxPaSSCGo58PxoDdwdSL0UveVkGmu+yWA/vovPZkqzfZ
 7JsY/0uKSSAhZxpoi8HO5CAVE2lQkfp49fgLqfDLELm1iOm+AzWBjDolNRFBwNPH1i
 UQzMNPyE+q5yEzzHh4eFC94y4Dt6Gf1xCdCQlq9BhzLxcIMMRChsOXBoCmRl5ov3zp
 S0yhkIMouP8saTG2EerbZ+O0XPx4PA5iIjncsOvIJKDW1ZoeYZSgrucqGCZvyJbRy4
 SDqUAhQaJ9w/SFmZIXbpRl9q6N6Ir++gvJmKBw9O5ygLhJIx0y87ow95C34w8F7Jao
 i0RRrNzKjWHDA==
Date: Thu, 27 Jan 2022 15:21:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: "qizhong.cheng" <qizhong.cheng@mediatek.com>
Cc: Marc Zyngier <maz@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chuanjia.liu@mediatek.com,
 Srikanth Thokala <srikanth.thokala@intel.com>,
 Pratyush Anand <pratyush.anand@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
Message-ID: <20220127212100.GA102267@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d78b45e461b204d375830217d0d27ffdd97cedd3.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_132104_172889_1F67A689 
X-CRM114-Status: GOOD (  30.90  )
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

[+cc Srikanth, Pratyush, Thomas, Pali, Ryder, Jianjun]

On Wed, Jan 26, 2022 at 11:37:58AM +0800, qizhong.cheng wrote:
> On Tue, 2022-01-25 at 17:21 +0000, Marc Zyngier wrote:
> > On 2022-01-25 16:57, Bjorn Helgaas wrote:
> > > On Sun, Jan 23, 2022 at 11:33:06AM +0800, qizhong cheng wrote:
> > > > As an edge-triggered interrupts, its interrupt status should
> > > > be cleared before dispatch to the handler of device.
> > > 
> > > I'm not an IRQ expert, but the reasoning that "we should clear
> > > the MSI interrupt status before dispatching the handler because
> > > MSI is an edge-triggered interrupt" doesn't seem completely
> > > convincing because your code will now look like this:
> > > 
> > >   /* Clear the INTx */
> > >   writel(1 << bit, port->base + PCIE_INT_STATUS);
> > >   generic_handle_domain_irq(port->irq_domain, bit - INTX_SHIFT);
> > >   ...
> > > 
> > >   /* Clear MSI interrupt status */
> > >   writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
> > >   generic_handle_domain_irq(port->inner_domain, bit);
> > > 
> > > You clear interrupt status before dispatching the handler for
> > > *both* level-triggered INTx interrupts and edge-triggered MSI
> > > interrupts.
> > > 
> > > So it doesn't seem that simply being edge-triggered is the
> > > critical factor here.
> > 
> > This is the usual problem with these half-baked implementations.
> > The signalling to the primary interrupt controller is level, as
> > they take a multitude of input and (crucially) latch the MSI
> > edges. Effectively, this is an edge-to-level converter, with all
> > the problems that this creates.
> > 
> > By clearing the status *after* the handling, you lose edges that
> > have been received and coalesced after the read of the status
> > register. By clearing it *before*, you are acknowledging the
> > interrupts early, and allowing them to be coalesced independently
> > of the ones that have been received earlier.
> > 
> > This is however mostly an educated guess. Someone with access to
> > the TRM should verify this.
> 
> Yes, as Maz said, we save the edge-interrupt status so that it
> becomes a level-interrupt. This is similar to an edge-to-level
> converter, so we need to clear it *before*. We found this problem
> through a lot of experiments and tested this patch.

I thought there might be other host controllers with similar design,
so I looked at all the other drivers and tried to figure out whether
any others had similar problems.

The ones below look suspicious to me because they all clear some sort
of status register *after* handling an MSI.  Can you guys take a look
and make sure they are working correctly?

  keembay_pcie_msi_irq_handler
    status = readl(pcie->apb_base + PCIE_REGS_INTERRUPT_STATUS)
    if (status & MSI_CTRL_INT)
      dw_handle_msi_irq
	generic_handle_domain_irq
      writel(status, pcie->apb_base + PCIE_REGS_INTERRUPT_STATUS)

  spear13xx_pcie_irq_handler
    status = readl(&app_reg->int_sts)
    if (status & MSI_CTRL_INT)
      dw_handle_msi_irq
	generic_handle_domain_irq
    writel(status, &app_reg->int_clr)

  advk_pcie_handle_int
    isr0_status = advk_readl(pcie, PCIE_ISR0_REG)
    if (isr0_status & PCIE_ISR0_MSI_INT_PENDING)
      advk_pcie_handle_msi
        advk_readl(pcie, PCIE_MSI_STATUS_REG)
	advk_writel(pcie, BIT(msi_idx), PCIE_MSI_STATUS_REG)
	generic_handle_irq
	advk_writel(pcie, PCIE_ISR0_MSI_INT_PENDING, PCIE_ISR0_REG)

  mtk_pcie_irq_handler
    status = readl_relaxed(pcie->base + PCIE_INT_STATUS_REG)
    for_each_set_bit_from(irq_bit, &status, ...)
      mtk_pcie_msi_handler
        generic_handle_domain_irq
      writel_relaxed(BIT(irq_bit), pcie->base + PCIE_INT_STATUS_REG)

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
