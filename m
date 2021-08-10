Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EBBC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 19:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4355F60C3E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 19:43:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4355F60C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=TU0m79/3M+zq5pTIYWn2PUY/BVL4mAKlDoKKjQ3HaX8=; b=Pmac3o0GawlQOT
	PzwYH1dS+C3DblA0t9YhEvhPe4LZB0aQS3iQSII37LQAwN4iSTu4q3NJlZE5luDnlpGuOkK1YaGo4
	4wzysLB8IWC2BxE/cjny97/YgQNdNVH0Pb5w0yjdPU+R2sEmR9KbZRqyKkHpnLDKxTnQWJ27UPqeZ
	X6jE3t77pxQjacOUH1690FLM/bnU5eKtF9D4pn0zdKRQ3NwkRzzpbjBPNjuxxOHTUtCY1UJmTaQyM
	zSm8ERJPlK2j0C9QHw1HDYyr+pRqOBEJokdLqu1Epw1vEfB1EbndsB0Qtmmozq5Ht1nLmgfYAsy2j
	Y4pKiYeN183JqP2ffL9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDXeT-004oiE-Ci; Tue, 10 Aug 2021 19:43:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDXeH-004ohD-5U; Tue, 10 Aug 2021 19:42:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00EE560F38;
 Tue, 10 Aug 2021 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628624572;
 bh=vLtJ1EiYM+s1L8PUym60/lK3H9ghJQRAHr0pTCwBfzQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uVtpsTg7/8Q2vqjZBe8ZJR4eqSalmV+AVT+gjGm3bWvEDeLHdqcJwriS6O1+4BvA3
 9QeA46gVn31VPPT32d2rwDgzIO7uEudm/M2CDqGnIe4I3EKBJ7h2MV/75hBvMg620L
 aT9+dGjt1wXxLTuEbqMkr0Nf9CZphhWdYyPcWc7Jk16BqwcReZ7xaqZbfQzkgqZOV9
 KQax/Ovo7ZxfUjLOs3lwHMJs5ltp6XESiJ1NABPLN1OV8qyWq7wM29/xbo7F2yqqh8
 1vrpDvB8Da4YoEGjBYHZQEhlkPIjrnwOWdjAfTNElEc2uZSFaggx0/hrHrGwTrBqt0
 WAao3f3Hfk0FA==
Date: Tue, 10 Aug 2021 14:42:50 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: robh+dt@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 lorenzo.pieralisi@arm.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, yong.wu@mediatek.com,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 2/4] PCI: mediatek: Add new method to get shared
 pcie-cfg base address and parse node
Message-ID: <20210810194250.GA2276275@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210719073456.28666-3-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_124253_288072_D65AF214 
X-CRM114-Status: GOOD (  27.90  )
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

On Mon, Jul 19, 2021 at 03:34:54PM +0800, Chuanjia Liu wrote:
> For the new dts format, add a new method to get
> shared pcie-cfg base address and parse node.

This commit log doesn't seem to really cover what's going on here.  It
looks like:

  - You added a check for "mediatek,generic-pciecfg" (I guess this is
    the "shared pcie-cfg base address" part).  Probably could have
    been its own patch.

  - You added checks for "interrupt-names" and "pcie_irq".  Not
    explained in commit log; probably could have been its own patch,
    too.

  - You now look for "linux,pci-domain" (via of_get_pci_domain_nr()).
    If present, you parse only one port instead of looking for all the
    children of the node.

    That's sort of weird behavior -- why should the presence of
    "linux,pci-domain" determine whether the node can have children?
    Is that really what you intend?

    Should be explained in the commit log and could have been its own
    patch, too.

> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 52 +++++++++++++++++++-------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 25bee693834f..928e0983a900 100644
> --- a/drivers/pci/controller/pcie-mediatek.c
> +++ b/drivers/pci/controller/pcie-mediatek.c
> @@ -14,6 +14,7 @@
>  #include <linux/irqchip/chained_irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/msi.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> @@ -23,6 +24,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>  
>  #include "../pci.h"
> @@ -207,6 +209,7 @@ struct mtk_pcie_port {
>   * struct mtk_pcie - PCIe host information
>   * @dev: pointer to PCIe device
>   * @base: IO mapped register base
> + * @cfg: IO mapped register map for PCIe config
>   * @free_ck: free-run reference clock
>   * @mem: non-prefetchable memory resource
>   * @ports: pointer to PCIe port information
> @@ -215,6 +218,7 @@ struct mtk_pcie_port {
>  struct mtk_pcie {
>  	struct device *dev;
>  	void __iomem *base;
> +	struct regmap *cfg;
>  	struct clk *free_ck;
>  
>  	struct list_head ports;
> @@ -650,7 +654,11 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
>  		return err;
>  	}
>  
> -	port->irq = platform_get_irq(pdev, port->slot);
> +	if (of_find_property(dev->of_node, "interrupt-names", NULL))
> +		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
> +	else
> +		port->irq = platform_get_irq(pdev, port->slot);
> +
>  	if (port->irq < 0)
>  		return port->irq;
>  
> @@ -682,6 +690,10 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
>  		val |= PCIE_CSR_LTSSM_EN(port->slot) |
>  		       PCIE_CSR_ASPM_L1_EN(port->slot);
>  		writel(val, pcie->base + PCIE_SYS_CFG_V2);
> +	} else if (pcie->cfg) {
> +		val = PCIE_CSR_LTSSM_EN(port->slot) |
> +		      PCIE_CSR_ASPM_L1_EN(port->slot);
> +		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
>  	}
>  
>  	/* Assert all reset signals */
> @@ -985,6 +997,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct resource *regs;
> +	struct device_node *cfg_node;
>  	int err;
>  
>  	/* get shared registers, which are optional */
> @@ -995,6 +1008,14 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>  			return PTR_ERR(pcie->base);
>  	}
>  
> +	cfg_node = of_find_compatible_node(NULL, NULL,
> +					   "mediatek,generic-pciecfg");
> +	if (cfg_node) {
> +		pcie->cfg = syscon_node_to_regmap(cfg_node);
> +		if (IS_ERR(pcie->cfg))
> +			return PTR_ERR(pcie->cfg);
> +	}
> +
>  	pcie->free_ck = devm_clk_get(dev, "free_ck");
>  	if (IS_ERR(pcie->free_ck)) {
>  		if (PTR_ERR(pcie->free_ck) == -EPROBE_DEFER)
> @@ -1027,22 +1048,27 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	struct device_node *node = dev->of_node, *child;
>  	struct mtk_pcie_port *port, *tmp;
> -	int err;
> +	int err, slot;
> +
> +	slot = of_get_pci_domain_nr(dev->of_node);
> +	if (slot < 0) {
> +		for_each_available_child_of_node(node, child) {
> +			err = of_pci_get_devfn(child);
> +			if (err < 0) {
> +				dev_err(dev, "failed to get devfn: %d\n", err);
> +				goto error_put_node;
> +			}
>  
> -	for_each_available_child_of_node(node, child) {
> -		int slot;
> +			slot = PCI_SLOT(err);
>  
> -		err = of_pci_get_devfn(child);
> -		if (err < 0) {
> -			dev_err(dev, "failed to parse devfn: %d\n", err);
> -			goto error_put_node;
> +			err = mtk_pcie_parse_port(pcie, child, slot);
> +			if (err)
> +				goto error_put_node;
>  		}
> -
> -		slot = PCI_SLOT(err);
> -
> -		err = mtk_pcie_parse_port(pcie, child, slot);
> +	} else {
> +		err = mtk_pcie_parse_port(pcie, node, slot);
>  		if (err)
> -			goto error_put_node;
> +			return err;
>  	}
>  
>  	err = mtk_pcie_subsys_powerup(pcie);
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
