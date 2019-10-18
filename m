Return-Path: <SRS0=Gkfw=YL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5FECA9EA0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 12:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACC52067B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 12:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eUBL6dnX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ACC52067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDAcrod04tDLYVy7Vr0oIn40Atme2ymoCWIbEQkFzo0=; b=eUBL6dnXENBm7U
	Dk+4WwF/4JuW6++Lw7RvZengZ+FwaoEx45EI//AH4LUPksQowOqAKkczwQmtmJHX8jKk/SsmczXl8
	ot9R4Bme00ZWVnntivd+mzqGfIoMz+/LbEc76TaHl/Oo+NIG+Vl/zfVpoy2q+8D7vU6EvHZu0awKW
	6cGlBucUXKix3b3oC84xQzNJz0RfIXCBEIt+n8LtG9HvdsRuBPD+0ixysrrpx+dq6/zqF20LvR6is
	wpf0YNTXYcZBAISpC0+Nh0rsYjWVp/MLalFZS/50BJtpd8CNaXKYsjY+e29tzcNFydWtZ3z9mE9aS
	8RBFDomzml2CVPpl5y3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLRUD-0007SN-7B; Fri, 18 Oct 2019 12:36:05 +0000
Received: from [217.140.110.172] (helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLRTy-0007Bq-QV; Fri, 18 Oct 2019 12:35:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29BDF3BB;
 Fri, 18 Oct 2019 05:35:40 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7FE553F6C4;
 Fri, 18 Oct 2019 05:35:39 -0700 (PDT)
Date: Fri, 18 Oct 2019 13:35:38 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 05/25] PCI: dwc: Use pci_parse_request_of_pci_ranges()
Message-ID: <20191018123537.GG47056@e119886-lin.cambridge.arm.com>
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-6-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016200647.32050-6-robh@kernel.org>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_053550_949794_22F1058B 
X-CRM114-Status: GOOD (  17.22  )
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

On Wed, Oct 16, 2019 at 03:06:27PM -0500, Rob Herring wrote:
> Convert the Designware host bridge to use the common
> pci_parse_request_of_pci_ranges().
> 
> Cc: Jingoo Han <jingoohan1@gmail.com>
> Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Andrew Murray <andrew.murray@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
> - New patch
> 
>  .../pci/controller/dwc/pcie-designware-host.c | 28 ++++++-------------
>  1 file changed, 8 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 0f36a926059a..aeec8b65eb97 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -319,7 +319,7 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  	struct device *dev = pci->dev;
>  	struct device_node *np = dev->of_node;
>  	struct platform_device *pdev = to_platform_device(dev);
> -	struct resource_entry *win, *tmp;
> +	struct resource_entry *win;
>  	struct pci_bus *child;
>  	struct pci_host_bridge *bridge;
>  	struct resource *cfg_res;
> @@ -342,31 +342,19 @@ int dw_pcie_host_init(struct pcie_port *pp)
>  	if (!bridge)
>  		return -ENOMEM;
> 
> -	ret = devm_of_pci_get_host_bridge_resources(dev, 0, 0xff,
> -					&bridge->windows, &pp->io_base);
> -	if (ret)
> -		return ret;
> -
> -	ret = devm_request_pci_bus_resources(dev, &bridge->windows);
> +	ret = pci_parse_request_of_pci_ranges(dev, &bridge->windows, NULL);
>  	if (ret)
>  		return ret;
> 
>  	/* Get the I/O and memory ranges from DT */
> -	resource_list_for_each_entry_safe(win, tmp, &bridge->windows) {
> +	resource_list_for_each_entry(win, &bridge->windows) {
>  		switch (resource_type(win->res)) {
>  		case IORESOURCE_IO:
> -			ret = devm_pci_remap_iospace(dev, win->res,
> -						     pp->io_base);
> -			if (ret) {
> -				dev_warn(dev, "Error %d: failed to map resource %pR\n",
> -					 ret, win->res);
> -				resource_list_destroy_entry(win);
> -			} else {
> -				pp->io = win->res;
> -				pp->io->name = "I/O";
> -				pp->io_size = resource_size(pp->io);
> -				pp->io_bus_addr = pp->io->start - win->offset;
> -			}
> +			pp->io = win->res;
> +			pp->io->name = "I/O";
> +			pp->io_size = resource_size(pp->io);
> +			pp->io_bus_addr = pp->io->start - win->offset;
> +			pp->io_base = pci_pio_to_address(pp->io->start);

Where did io_base come from? This wasn't here before, so why are we setting it
now?

Does this fix any issue?

Thanks,

Andrew Murray

>  			break;
>  		case IORESOURCE_MEM:
>  			pp->mem = win->res;
> --
> 2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
