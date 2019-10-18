Return-Path: <SRS0=Gkfw=YL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41B5CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 15:42:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74EED222C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 15:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NPQL14TJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74EED222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7ttCLGHMZWqiSxpgmYBLKJ2v+w+WHtB+tr1OO66Ruk=; b=NPQL14TJe1Xbmk
	ai2tgM3ovGFH64Cv8k+YnhbV0CI/TSoUOFcTGz3SK6cFDzUBiaS5hcNemWcN0oee7EhnDJsxBpu7Y
	/PKqVnG0PgCa0D0+1PAmLrj54SFbuZB0qy6zC1ocT6VRrM6USpBOF6jefFZwx6tJcXE6hbG8U4BBk
	tJLZMl98O1E8t6/rypAf5ZnegdAa1ZV1R6zBLK57ssenHVnDXMFOgzZul1pkXGHBaC+uTcU1InQaI
	atPtKqQEVHok7+BSyeftk3djr0PfMKeSHr0fqDitDCbvuE0YSslv6i7usAPAU4kSs/CUHk/MffCEK
	WmnxRkJx3q5w0I5Efnlg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLUOE-0007kw-AF; Fri, 18 Oct 2019 15:42:06 +0000
Received: from [217.140.110.172] (helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLUO2-0007b7-J9; Fri, 18 Oct 2019 15:41:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84B7FC8F;
 Fri, 18 Oct 2019 08:41:43 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB5643F718;
 Fri, 18 Oct 2019 08:41:42 -0700 (PDT)
Date: Fri, 18 Oct 2019 16:41:41 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 09/25] PCI: mobiveil: Use
 pci_parse_request_of_pci_ranges()
Message-ID: <20191018154141.GJ47056@e119886-lin.cambridge.arm.com>
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-10-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016200647.32050-10-robh@kernel.org>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_084154_724772_A92F6CF6 
X-CRM114-Status: GOOD (  21.13  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Jingoo Han <jingoohan1@gmail.com>, rfi@lists.rocketboards.org,
 linux-renesas-soc@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>,
 Simon Horman <horms@verge.net.au>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 03:06:31PM -0500, Rob Herring wrote:
> Convert the Mobiveil host bridge to use the common
> pci_parse_request_of_pci_ranges().
> 
> There's no need to assign the resources to a temporary list first. Just
> use bridge->windows directly and remove all the temporary list handling.
> 
> Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
> Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Andrew Murray <andrew.murray@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> v2:
> - New patch
> 
>  drivers/pci/controller/pcie-mobiveil.c | 26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mobiveil.c b/drivers/pci/controller/pcie-mobiveil.c
> index a45a6447b01d..4eab8624ce4d 100644
> --- a/drivers/pci/controller/pcie-mobiveil.c
> +++ b/drivers/pci/controller/pcie-mobiveil.c
> @@ -140,7 +140,6 @@ struct mobiveil_msi {			/* MSI information */
> 
>  struct mobiveil_pcie {
>  	struct platform_device *pdev;
> -	struct list_head resources;
>  	void __iomem *config_axi_slave_base;	/* endpoint config base */
>  	void __iomem *csr_axi_slave_base;	/* root port config base */
>  	void __iomem *apb_csr_base;	/* MSI register base */
> @@ -575,6 +574,7 @@ static void mobiveil_pcie_enable_msi(struct mobiveil_pcie *pcie)
> 
>  static int mobiveil_host_init(struct mobiveil_pcie *pcie)
>  {
> +	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(pcie);
>  	u32 value, pab_ctrl, type;
>  	struct resource_entry *win;
> 
> @@ -631,7 +631,7 @@ static int mobiveil_host_init(struct mobiveil_pcie *pcie)
>  	program_ib_windows(pcie, WIN_NUM_0, 0, 0, MEM_WINDOW_TYPE, IB_WIN_SIZE);
> 
>  	/* Get the I/O and memory ranges from DT */
> -	resource_list_for_each_entry(win, &pcie->resources) {
> +	resource_list_for_each_entry(win, &bridge->windows) {
>  		if (resource_type(win->res) == IORESOURCE_MEM)
>  			type = MEM_WINDOW_TYPE;
>  		else if (resource_type(win->res) == IORESOURCE_IO)
> @@ -857,7 +857,6 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  	struct pci_bus *child;
>  	struct pci_host_bridge *bridge;
>  	struct device *dev = &pdev->dev;
> -	resource_size_t iobase;
>  	int ret;
> 
>  	/* allocate the PCIe port */
> @@ -875,11 +874,8 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  		return ret;
>  	}
> 
> -	INIT_LIST_HEAD(&pcie->resources);
> -
>  	/* parse the host bridge base addresses from the device tree file */
> -	ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
> -						    &pcie->resources, &iobase);
> +	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
>  	if (ret) {
>  		dev_err(dev, "Getting bridge resources failed\n");
>  		return ret;
> @@ -892,24 +888,19 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  	ret = mobiveil_host_init(pcie);
>  	if (ret) {
>  		dev_err(dev, "Failed to initialize host\n");
> -		goto error;
> +		return ret;
>  	}
> 
>  	/* initialize the IRQ domains */
>  	ret = mobiveil_pcie_init_irq_domain(pcie);
>  	if (ret) {
>  		dev_err(dev, "Failed creating IRQ Domain\n");
> -		goto error;
> +		return ret;
>  	}
> 
>  	irq_set_chained_handler_and_data(pcie->irq, mobiveil_pcie_isr, pcie);
> 
> -	ret = devm_request_pci_bus_resources(dev, &pcie->resources);
> -	if (ret)
> -		goto error;
> -
>  	/* Initialize bridge */
> -	list_splice_init(&pcie->resources, &bridge->windows);
>  	bridge->dev.parent = dev;
>  	bridge->sysdata = pcie;
>  	bridge->busnr = pcie->root_bus_nr;
> @@ -920,13 +911,13 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  	ret = mobiveil_bringup_link(pcie);
>  	if (ret) {
>  		dev_info(dev, "link bring-up failed\n");
> -		goto error;
> +		return ret;
>  	}
> 
>  	/* setup the kernel resources for the newly added PCIe root bus */
>  	ret = pci_scan_root_bus_bridge(bridge);
>  	if (ret)
> -		goto error;
> +		return ret;
> 
>  	bus = bridge->bus;
> 
> @@ -936,9 +927,6 @@ static int mobiveil_pcie_probe(struct platform_device *pdev)
>  	pci_bus_add_devices(bus);
> 
>  	return 0;
> -error:
> -	pci_free_resource_list(&pcie->resources);
> -	return ret;
>  }
> 
>  static const struct of_device_id mobiveil_pcie_of_match[] = {
> --
> 2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
