Return-Path: <SRS0=Gkfw=YL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB7B6CA9EA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 13:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E86F2089C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 13:00:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MQWrw4lO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E86F2089C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQ7lgAA5ZLJSDzfnstg8Dkl/p2zQ/jgr/9tm6HETs5U=; b=MQWrw4lO0Fi/St
	e84C3g50eJbxhXaRbNY5TOpbvmzfz6+YE5zUkciuLeRkT3HkGAf6IELXoecXfnMPN0FvGwQ/oWUXK
	Xre4taEGmFqgbvrC+9963dSR+6LqnuzKqi2TYbEftY6u1A25kG7pc5yc8Amb5MxxP+PgMa7m3Z9Eg
	VTpH6QcVmduFnQq0X5dV7TS9Buzyu8DziyQstZFH0w7Uh3N1FiRL1fI5NPYmHRn419b7bJN+chxwx
	DDVQXYBuaAgQHbE42xPUdFwRkl+g8PzsdZTnekTmQTNqdMhXtXAk/vG1yyedWw9lLIa2riTV3bfCv
	9bXo0EcDM9C8cuJEk3Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLRrv-0002ml-Lv; Fri, 18 Oct 2019 13:00:35 +0000
Received: from [217.140.110.172] (helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLRrm-0002dt-R6; Fri, 18 Oct 2019 13:00:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCE6A3BB;
 Fri, 18 Oct 2019 06:00:15 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DEC13F6C4;
 Fri, 18 Oct 2019 06:00:15 -0700 (PDT)
Date: Fri, 18 Oct 2019 14:00:13 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 07/25] PCI: iproc: Use pci_parse_request_of_pci_ranges()
Message-ID: <20191018130013.GI47056@e119886-lin.cambridge.arm.com>
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-8-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016200647.32050-8-robh@kernel.org>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_060026_963870_4A9E7E1A 
X-CRM114-Status: GOOD (  17.58  )
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

On Wed, Oct 16, 2019 at 03:06:29PM -0500, Rob Herring wrote:
> Convert the iProc host bridge to use the common
> pci_parse_request_of_pci_ranges().
> 
> There's no need to assign the resources to a temporary list, so just use
> bridge->windows directly.
> 
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Andrew Murray <andrew.murray@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - New patch

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> 
>  drivers/pci/controller/pcie-iproc-platform.c | 8 ++------
>  drivers/pci/controller/pcie-iproc.c          | 5 -----
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-iproc-platform.c b/drivers/pci/controller/pcie-iproc-platform.c
> index 9ee6200a66f4..375d815f7301 100644
> --- a/drivers/pci/controller/pcie-iproc-platform.c
> +++ b/drivers/pci/controller/pcie-iproc-platform.c
> @@ -43,8 +43,6 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>  	struct iproc_pcie *pcie;
>  	struct device_node *np = dev->of_node;
>  	struct resource reg;
> -	resource_size_t iobase = 0;
> -	LIST_HEAD(resources);
>  	struct pci_host_bridge *bridge;
>  	int ret;
> 
> @@ -97,8 +95,7 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>  	if (IS_ERR(pcie->phy))
>  		return PTR_ERR(pcie->phy);
> 
> -	ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff, &resources,
> -						    &iobase);
> +	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
>  	if (ret) {
>  		dev_err(dev, "unable to get PCI host bridge resources\n");
>  		return ret;
> @@ -113,10 +110,9 @@ static int iproc_pcie_pltfm_probe(struct platform_device *pdev)
>  		pcie->map_irq = of_irq_parse_and_map_pci;
>  	}
> 
> -	ret = iproc_pcie_setup(pcie, &resources);
> +	ret = iproc_pcie_setup(pcie, &bridge->windows);
>  	if (ret) {
>  		dev_err(dev, "PCIe controller setup failed\n");
> -		pci_free_resource_list(&resources);
>  		return ret;
>  	}
> 
> diff --git a/drivers/pci/controller/pcie-iproc.c b/drivers/pci/controller/pcie-iproc.c
> index 2d457bfdaf66..223335ee791a 100644
> --- a/drivers/pci/controller/pcie-iproc.c
> +++ b/drivers/pci/controller/pcie-iproc.c
> @@ -1498,10 +1498,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
>  		return ret;
>  	}
> 
> -	ret = devm_request_pci_bus_resources(dev, res);
> -	if (ret)
> -		return ret;
> -
>  	ret = phy_init(pcie->phy);
>  	if (ret) {
>  		dev_err(dev, "unable to initialize PCIe PHY\n");
> @@ -1543,7 +1539,6 @@ int iproc_pcie_setup(struct iproc_pcie *pcie, struct list_head *res)
>  		if (iproc_pcie_msi_enable(pcie))
>  			dev_info(dev, "not using iProc MSI\n");
> 
> -	list_splice_init(res, &host->windows);
>  	host->busnr = 0;
>  	host->dev.parent = dev;
>  	host->ops = &iproc_pcie_ops;
> --
> 2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
