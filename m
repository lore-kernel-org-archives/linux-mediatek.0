Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C14BFF6E86
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 21:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=DODtmRDCwQbpqYyZIoeaGL3yi3GSc6Nf90VRx21d7ic=; b=NScX7x5++o2ENX
	mM3R/Zw64uGCrFrKhXwDUOXufIqNkpJ4fX/+daCpr1XbhTBQwLWhDLspUV5uMfrJPqEisXLCIrhPy
	L821lVfpPnRaQs9Aey6PqYjiK9A3KPg5Uz/WTmbdkARRI261LLdd/m+R6lJHwhRQ2gco+/j7P38D/
	vqKtC5R5rTTjjFtsc5IP2y50nzF6oIW05V1li00gXM0CQuyQGezB0lXsBrrtyHgWye0bx25GswcPq
	TyYRjBi2OsXOhTS21EaAkI2CY+8e1R5UlYwlgKWMi6kPko3bHegfimxy2kM8s2OaSp4biWNuX3fyj
	ExTGmu5P0VAOyB93XwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2byT-00000007FzS-2lrr;
	Tue, 17 Mar 2026 21:29:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2byR-00000007Fyr-0eW7
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 21:29:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC9B240106;
	Tue, 17 Mar 2026 21:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C6EC4CEF7;
	Tue, 17 Mar 2026 21:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773782949;
	bh=EEPcdwfYA2i1wDNKfSw099Z5veH/DJsStfCV0MN+hNM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=mNngK0/Fs/0IBKQ6aMEbV8XD37uWZwqxk9Xp1x3CSxJsS/UYuc7J+7WpeXQjIv9ec
	 X8EcEeWKHBjvgKMyu88CqnlBxL2FAWqBgqJ4ozol6/VeGTI5aw1QFR1zLgeXFDVjMj
	 Vh6uui+Fy6IJVUmetrS8GwD0rBJEg8lPlnZn8e78rGdrnEcwsHeuy895dwjCKj/iZe
	 dJo+fNqA/n+fe+zuUf5P+uyUVtuF5G2F5N53qMXibkbEQPNAYVaY1EcNuLb40V7IK+
	 bTXVtpbv+vjN6Jcthvxlff79woq7ce2WQMs/ChrloY0QQo6VedrOb7moFEJyJlBC9E
	 IM6wbxpicP85A==
Date: Tue, 17 Mar 2026 16:29:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, ryder.lee@mediatek.com, bhelgaas@google.com,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] PCI: Skip bridge window reads when window is not
 supported
Message-ID: <20260317212908.GA109023@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316155157.679533-4-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_142911_232916_C8C71113 
X-CRM114-Status: GOOD (  18.64  )
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

On Mon, Mar 16, 2026 at 03:51:57PM +0000, Caleb James DeLisle wrote:
> pci_read_bridge_io() and pci_read_bridge_mmio_pref() read bridge window
> registers unconditionally. If the registers are hardwired to zero
> (not implemented), both base and limit will be 0. Since (0 <= 0) is
> true, a bogus window [mem 0x00000000-0x000fffff] or [io 0x0000-0x0fff]
> gets created.
> 
> pci_read_bridge_windows() already detects unsupported windows by
> testing register writability and sets io_window/pref_window flags
> accordingly. Check these flags at the start of pci_read_bridge_io()
> and pci_read_bridge_mmio_pref() to skip reading registers when the
> window is not supported.

The fundamental problem here is that assigned space to a bridge window
that isn't implemented.  I wish we understood the connection between
this "read window" path and the assignment path.

Maybe this patch fixes it because we enter pci_read_bridge_mmio_pref()
with res->flags being NULL, and we set IORESOURCE_MEM |
IORESOURCE_PREFETCH again, which makes it look like we can assign
space for it?

If that's the case, I think it would improve the commit log to mention
the actual mechanism by which we avoid assigning space.

> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Link: https://lore.kernel.org/all/20260113210259.GA715789@bhelgaas/
> Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>  drivers/pci/probe.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index bccc7a4bdd79..4eacb741b4ec 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -395,6 +395,9 @@ static void pci_read_bridge_io(struct pci_dev *dev, struct resource *res,
>  	unsigned long io_mask, io_granularity, base, limit;
>  	struct pci_bus_region region;
>  
> +	if (!dev->io_window)
> +		return;
> +
>  	io_mask = PCI_IO_RANGE_MASK;
>  	io_granularity = 0x1000;
>  	if (dev->io_window_1k) {
> @@ -465,6 +468,9 @@ static void pci_read_bridge_mmio_pref(struct pci_dev *dev, struct resource *res,
>  	pci_bus_addr_t base, limit;
>  	struct pci_bus_region region;
>  
> +	if (!dev->pref_window)
> +		return;
> +
>  	pci_read_config_word(dev, PCI_PREF_MEMORY_BASE, &mem_base_lo);
>  	pci_read_config_word(dev, PCI_PREF_MEMORY_LIMIT, &mem_limit_lo);
>  	base64 = (mem_base_lo & PCI_PREF_RANGE_MASK) << 16;
> -- 
> 2.39.5
> 

