Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4EBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jan 2022 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vzu7YeeRMsf+BVjOcchkW3GUoY+YcaWLIbM9HBND1qs=; b=4cDIEoUuX23vyG
	VEccEoJ5Bstka5xGCVH2e8p3KdhPhK7u0LdV/bjHE6ZRgJgaB5pyj8i8q5G2GqVvEsLSwqn5+7qjX
	GLXwJF0JQr+H9sRIEFC1E/A6KonICtBFigIw7NMWURp1iZfcG8SGeqzPeGXqy1xmzcyrM5UK4tGNu
	hMsLZyb45h/J5UAvy40sgkc9kxYNQcTPkOoXUTiCy5q/pz8ZtbjX/PjbT3TKXO3pYH4QaGyyfnvdw
	5v3Zxpte1GWy1VaxsWiIjHehTAwydOGgj4uoufkfLyWr6lAmnIF7bQPPUttB9lEba9Ebl+rx+3Zmy
	mCzAGfOzPrJDnw1tGK8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCP8y-008ogf-2M; Tue, 25 Jan 2022 16:58:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCP8i-008oc3-9v; Tue, 25 Jan 2022 16:57:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0365AB81912;
 Tue, 25 Jan 2022 16:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D488C340E0;
 Tue, 25 Jan 2022 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643129869;
 bh=6XkwXgsw19qj7USLrufn0h/tjB7gak8V19SNDIbm7V8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LJ678dooB3UE1J+39GaMMyngBcQRH9jk6vt/5V1WPObw1WTcNf87X/MvOI02+KCsk
 ZSGZbwVHwrnXd5ybU5Caxd0VIqT6wHtu7sshlroYRQHKp1zinrqKA6QIUZMONlsOrH
 jxPNE1B1lqteRYJ0ePeUInqCQs0p0uuITFc37fJlRN87P+q8s1W2GGk3UN8SgYxxkI
 S/f4p1PTvgTGq/tpMhI6MHdjFZi5QsIq3xkZKXNJ+B+yFExbGB1F3PC+AL+jJO0Nl8
 QGkStm965gjNBUgErdUUe00An9cLRjJYjawdvvi79/WnvnMXB+in8AV0A9yVPGpsVR
 hCtO/WYvAK7DQ==
Date: Tue, 25 Jan 2022 10:57:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, chuanjia.liu@mediatek.com
Subject: Re: [PATCH] PCI: mediatek: Change MSI interrupt processing sequence
Message-ID: <20220125165748.GA1458116@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220123033306.29799-1-qizhong.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_085752_512876_473CFA84 
X-CRM114-Status: GOOD (  21.14  )
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

All patches change *something*.  Can you update the subject line so it
says something specific about the change?

Maybe something like "Clear MSI status before dispatching handler"?

On Sun, Jan 23, 2022 at 11:33:06AM +0800, qizhong cheng wrote:
> As an edge-triggered interrupts, its interrupt status should be cleared
> before dispatch to the handler of device.

I'm not an IRQ expert, but the reasoning that "we should clear the MSI
interrupt status before dispatching the handler because MSI is an
edge-triggered interrupt" doesn't seem completely convincing because
your code will now look like this:

  /* Clear the INTx */
  writel(1 << bit, port->base + PCIE_INT_STATUS);
  generic_handle_domain_irq(port->irq_domain, bit - INTX_SHIFT);
  ...

  /* Clear MSI interrupt status */
  writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
  generic_handle_domain_irq(port->inner_domain, bit);

You clear interrupt status before dispatching the handler for *both*
level-triggered INTx interrupts and edge-triggered MSI interrupts.

So it doesn't seem that simply being edge-triggered is the critical
factor here.

> Signed-off-by: qizhong cheng <qizhong.cheng@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 2f3f974977a3..705ea33758b1 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -624,12 +624,12 @@ static void mtk_pcie_intr_handler(struct irq_desc *desc)
>  		if (status & MSI_STATUS){
>  			unsigned long imsi_status;
>  
> +			/* Clear MSI interrupt status */
> +			writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
>  			while ((imsi_status = readl(port->base + PCIE_IMSI_STATUS))) {
>  				for_each_set_bit(bit, &imsi_status, MTK_MSI_IRQS_NUM)
>  					generic_handle_domain_irq(port->inner_domain, bit);
>  			}
> -			/* Clear MSI interrupt status */
> -			writel(MSI_STATUS, port->base + PCIE_INT_STATUS);
>  		}
>  	}
>  
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
