Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4520EC61D85
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 21:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=b1dbGgMil5GBaDD7DAt3xV9GnAiiWogXOZfKagyDTBs=; b=RCmGWc1pO+cmae
	3oNlcfL+fn+UiYC0ewdiVw96GlE6i+Q3OPgIoPtTACi/WBOFttGEMzT+4WAmW+Ix7VpdHlX3wRty3
	+fm3rY8iUg97RnHnAAcv/o2uhNPJ4z9rqYBh88U8Fop4rGhltJJALjb2Zy8S41s3u1PAG4H5MA0dI
	ktXrM3XmqQ5HSFR076YcgQeAI+h5MqmmcNde5dX1VKd/YSOuEmchL2MVKtg3oSE2mh7ZJQiJQ3/QZ
	fBGVLaRQlXLkINg83cxAGd3t6DM8UU86J/VJQJbNyltJ3Tu77J5oAEn4YilWi0yqjm0lrrI2/4zOD
	U5L2ZbWUuZJa0fgJ8Evw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YRY-0007ws-0e;
	Tue, 21 Nov 2023 21:38:04 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5YRT-0007w4-36;
	Tue, 21 Nov 2023 21:38:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5FADFB824DF;
	Tue, 21 Nov 2023 21:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A28C433C8;
	Tue, 21 Nov 2023 21:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700602677;
	bh=kK9LzfZt6D3Gt4ZliyPofIg9r8bVnd54yLxBigI3P8Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FSNOEppCFUuR8bEdizt5WFfa63bqJeeTsuMPB9YHGyagrl3KbEjJZvcyEI2ScJk8z
	 AFYqJxId27DI6YNscx8+h//NL70SSdRaYKpIt0rPiMlElci7dFUdprtbRno+eG3vR1
	 nAcGM1RtL4tUEMZ53b3jP+kpzTZSoI35ZlUefGgLW7We/QkQd5whew9Awg5cfVB6uk
	 b5YdOZiuh0jOFkHi1fmXrgANf8I2LsKjkZC9wgNk1F7vdTRh1WnNEcXpQgVM99mOcr
	 RbCwXiXqXFxWxbiPCEKFHRdnOprSqBF8kJNlCO2kyX6TpVq3mFWI7ERlb9ahlwWyxc
	 VgMFCX9qz92yA==
Date: Tue, 21 Nov 2023 15:37:55 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, skinsburskii@gmail.com
Subject: Re: [PATCH] PCI: mediatek: Fix sparse warning caused to
 virt_to_phys() prototype change
Message-ID: <20231121213755.GA258354@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <170052362584.21270.8345708191142620624.stgit@skinsburskii.>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_133800_167290_00538008 
X-CRM114-Status: GOOD (  19.51  )
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

On Mon, Nov 20, 2023 at 03:40:33PM -0800, Stanislav Kinsburskii wrote:
> Explicitly cast __iomem pointer to const void* with __force to fix the
> following warning:
> 
>   warning: incorrect type in argument 1 (different address spaces)
>      expected void const volatile *address
>      got void [noderef] __iomem *

I have two questions about this:

  1) There's no other use of __force in drivers/pci, so I don't know
  what's special about pcie-mediatek.c.  There should be a way to fix
  the types so it's not needed.

  2) virt_to_phys() is not quite right to begin with because what we
  want is a *bus* address, not the CPU physical address we get from
  virt_to_phys().  Obviously the current platforms that use this must
  not apply any offset between bus and CPU physical addresses, but
  it's not something we should rely on.

  There are only three drivers (pci-aardvark.c, pcie-xilinx.c, and
  this one) that use virt_to_phys(), and they're all slightly wrong
  here.

The *_compose_msi_msg() methods could use a little more consistency
across the board.

> Signed-off-by: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 66a8f73296fc..27f0f79810a1 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -397,7 +397,7 @@ static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  	phys_addr_t addr;
>  
>  	/* MT2712/MT7622 only support 32-bit MSI addresses */
> -	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	addr = virt_to_phys((__force const void *)port->base + PCIE_MSI_VECTOR);
>  	msg->address_hi = 0;
>  	msg->address_lo = lower_32_bits(addr);
>  
> @@ -520,7 +520,7 @@ static void mtk_pcie_enable_msi(struct mtk_pcie_port *port)
>  	u32 val;
>  	phys_addr_t msg_addr;
>  
> -	msg_addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
> +	msg_addr = virt_to_phys((__force const void *)port->base + PCIE_MSI_VECTOR);
>  	val = lower_32_bits(msg_addr);
>  	writel(val, port->base + PCIE_IMSI_ADDR);
>  
> 
> 
> 

