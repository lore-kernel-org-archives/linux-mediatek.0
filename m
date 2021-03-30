Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A9BC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:29:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08ED619B9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 15:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A08ED619B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=v/WgaNXGKmLxIkuRkKvU5kn79xHzZr0hRmgTRZeqF18=; b=qMG5BVxb8FgCqCL7Iqw5EMGD4
	ZyN0nr348chx+AD0UJkNf1ZUTRmztG1KCSxMFgXb1DqB1a/iBFdG2PMgs8Gwt0T2QV337R2L9YxFw
	7Hw54OYL7W1pYCTl2MwlsNUVNB/Cud9fp6sbVWilrKJSoOLSJiclahVr7UXX/WC28+oV/pJ7JD8r3
	O3s1oU3dAIfUaamG6vH5Kfy1ZvxaEAIup8DThCKnlAkNMl6ejm+GtldC8u9rh9KQKN9aAI434SriS
	VjYSteLneXt10iK4je+2fZfdHW/WhB7G/poqq3gdrEhKaQyz72cEJrXZ9TRd4/Mm1AHMK1CoXOyul
	FYFuuRj1Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRGJ1-004BuX-Nl; Tue, 30 Mar 2021 15:29:23 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRGIo-004Bqz-3N; Tue, 30 Mar 2021 15:29:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A653C31B;
 Tue, 30 Mar 2021 08:29:05 -0700 (PDT)
Received: from lpieralisi (e121166-lin.cambridge.arm.com [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 263A73F719;
 Tue, 30 Mar 2021 08:29:02 -0700 (PDT)
Date: Tue, 30 Mar 2021 16:28:57 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Marc Zyngier <maz@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thierry Reding <treding@nvidia.com>,
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
 Will Deacon <will@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bharat Kumar Gogada <bharatku@xilinx.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 02/14] PCI: rcar: Don't allocate extra memory for the
 MSI capture address
Message-ID: <20210330152857.GA27749@lpieralisi>
References: <20210330151145.997953-1-maz@kernel.org>
 <20210330151145.997953-3-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210330151145.997953-3-maz@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_162910_439755_534F2758 
X-CRM114-Status: GOOD (  27.49  )
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

On Tue, Mar 30, 2021 at 04:11:33PM +0100, Marc Zyngier wrote:
> A long cargo-culted behaviour of PCI drivers is to allocate memory
> to obtain an address that is fed to the controller as the MSI
> capture address (i.e. the MSI doorbell).
> 
> But there is no actual requirement for this address to be RAM.
> All it needs to be is a suitable aligned address that will
> *not* be DMA'd to.
> 
> Since the rcar platform already has a requirement that this
> address should be in the first 4GB of the physical address space,
> use the controller's own base address as the capture address.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/pci/controller/pcie-rcar-host.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Marek, Yoshihiro,

can you test this patch please and report back ? It is not fundamental
for the rest of the series (ie the rest of the series does not depend on
it) and we can still merge the series without it but it would be good if
you can review and test anyway.

I'd like to merge this series into -next shortly.

Thanks,
Lorenzo

> diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
> index a728e8f9ad3c..ce952403e22c 100644
> --- a/drivers/pci/controller/pcie-rcar-host.c
> +++ b/drivers/pci/controller/pcie-rcar-host.c
> @@ -36,7 +36,6 @@ struct rcar_msi {
>  	DECLARE_BITMAP(used, INT_PCI_MSI_NR);
>  	struct irq_domain *domain;
>  	struct msi_controller chip;
> -	unsigned long pages;
>  	struct mutex lock;
>  	int irq1;
>  	int irq2;
> @@ -680,14 +679,15 @@ static void rcar_pcie_unmap_msi(struct rcar_pcie_host *host)
>  static void rcar_pcie_hw_enable_msi(struct rcar_pcie_host *host)
>  {
>  	struct rcar_pcie *pcie = &host->pcie;
> -	struct rcar_msi *msi = &host->msi;
> -	unsigned long base;
> +	struct device *dev = pcie->dev;
> +	struct resource res;
>  
> -	/* setup MSI data target */
> -	base = virt_to_phys((void *)msi->pages);
> +	if (WARN_ON(of_address_to_resource(dev->of_node, 0, &res)))
> +		return;
>  
> -	rcar_pci_write_reg(pcie, lower_32_bits(base) | MSIFE, PCIEMSIALR);
> -	rcar_pci_write_reg(pcie, upper_32_bits(base), PCIEMSIAUR);
> +	/* setup MSI data target */
> +	rcar_pci_write_reg(pcie, lower_32_bits(res.start) | MSIFE, PCIEMSIALR);
> +	rcar_pci_write_reg(pcie, upper_32_bits(res.start), PCIEMSIAUR);
>  
>  	/* enable all MSI interrupts */
>  	rcar_pci_write_reg(pcie, 0xffffffff, PCIEMSIIER);
> @@ -735,7 +735,6 @@ static int rcar_pcie_enable_msi(struct rcar_pcie_host *host)
>  	}
>  
>  	/* setup MSI data target */
> -	msi->pages = __get_free_pages(GFP_KERNEL | GFP_DMA32, 0);
>  	rcar_pcie_hw_enable_msi(host);
>  
>  	return 0;
> @@ -748,7 +747,6 @@ static int rcar_pcie_enable_msi(struct rcar_pcie_host *host)
>  static void rcar_pcie_teardown_msi(struct rcar_pcie_host *host)
>  {
>  	struct rcar_pcie *pcie = &host->pcie;
> -	struct rcar_msi *msi = &host->msi;
>  
>  	/* Disable all MSI interrupts */
>  	rcar_pci_write_reg(pcie, 0, PCIEMSIIER);
> @@ -756,8 +754,6 @@ static void rcar_pcie_teardown_msi(struct rcar_pcie_host *host)
>  	/* Disable address decoding of the MSI interrupt, MSIFE */
>  	rcar_pci_write_reg(pcie, 0, PCIEMSIALR);
>  
> -	free_pages(msi->pages, 0);
> -
>  	rcar_pcie_unmap_msi(host);
>  }
>  
> -- 
> 2.29.2
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
