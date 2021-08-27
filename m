Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 625DCC432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 16:47:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CC260FD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 16:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 21CC260FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=AnIxvrS0XtyV7KQfCXbpxSnWZeSC5j+6Bt3eGrnAN70=; b=eZuFZ6+Y/MtQfI
	T7ybG8CX14yU1TV+eCOzyWkCYiuE3gafzOmPdpVbO3cqwSdjQquUggWGUcjGprTNvXTi1QUTrS7h3
	0z2zgYGC/asDrTM9SVT7Dzmu7lCtSbJec97QaqoNiY4HT5kw6qtIRDTyet8igqWSfNmgxcCXZO2J1
	zsCwe32QuFiwPxitXgQ/CWmltLYVXUYcKef8x7IfHVqlWvUWAo63uz4KcCo4t/ER++cngWiBcditF
	1NoulrRbwkqja8gELPfVXLjNv0HLAUXZ5tw6EDx+sQx+p2rUyXvmIBofLRroG25/0DpxBYOt0qdy2
	lqAE/Qznc3Oj8f1BAFDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJf0D-00Cmav-Q0; Fri, 27 Aug 2021 16:46:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJf00-00CmZf-HT; Fri, 27 Aug 2021 16:46:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D0960FD8;
 Fri, 27 Aug 2021 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630082795;
 bh=hMhFii5SEnyesU+J3DnJAqd9NcCDRrvpJCnbR/n6FBY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=B/tcAg/jio1dncVSKclmFp0GAyYR0lBls+lVdKbgBAHYy6xLf3QSrst94KvbUbKbO
 zgffjO0KvcZAqS1BibHrhskCc5wjfo2WbZvu7Y8k2NGzc6Yw+H2FuttJv7R23dLrZ4
 EZfmEODkqHx/Xre09qo7Wf2QpY7rZLiQoV/S5hsmrIoRu4L+7xI1N3Sx/toGLRHEK9
 btPWBH1NcHlU8uOiLkFLWxkGud9ccL/h0H4fAXwpBETCrcbcn921HenLA02jFjyYYa
 IQgkiSunEAQGswpfPzZUD4RcN1oIMHls85ag4dybbvQmWQHWJXw4pqRPDAu1J1UrwZ
 iEky6AUjHTZvw==
Date: Fri, 27 Aug 2021 11:46:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Chuanjia Liu <chuanjia.liu@mediatek.com>
Cc: robh+dt@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 lorenzo.pieralisi@arm.com, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, yong.wu@mediatek.com,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 2/6] PCI: mediatek: Add new method to get shared
 pcie-cfg base address
Message-ID: <20210827164634.GA3779223@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210823032800.1660-3-chuanjia.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_094636_663456_94AB8E1A 
X-CRM114-Status: GOOD (  25.52  )
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

On Mon, Aug 23, 2021 at 11:27:56AM +0800, Chuanjia Liu wrote:
> For the new dts format, add a new method to get
> shared pcie-cfg base address and use it to configure
> the PCIECFG controller

Rewrap this to fill 75 columns.

> Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  drivers/pci/controller/pcie-mediatek.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> index 25bee693834f..4296d9e04240 100644
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
> @@ -682,6 +686,10 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
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
> @@ -985,6 +993,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct resource *regs;
> +	struct device_node *cfg_node;
>  	int err;
>  
>  	/* get shared registers, which are optional */
> @@ -995,6 +1004,14 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>  			return PTR_ERR(pcie->base);
>  	}
>  
> +	cfg_node = of_find_compatible_node(NULL, NULL,
> +					   "mediatek,generic-pciecfg");

This looks wrong to me.  IIUC, since we start at NULL, this searches
the entire device tree for any node with

  compatible = "mediatek,generic-pciecfg"

but we should only care about the specific device/node this driver
claimed.

Should this be part of the match data, i.e., struct mtk_pcie_soc?

> +	if (cfg_node) {
> +		pcie->cfg = syscon_node_to_regmap(cfg_node);

Other drivers in drivers/pci/controller/ use
syscon_regmap_lookup_by_phandle() (j721e, dra7xx, keystone,
layerscape, artpec6) or syscon_regmap_lookup_by_compatible() (imx6,
kirin, v3-semi).

You should do it the same way unless there's a need to be different.
It's also nice if you can use the same struct member name
("mtk_pcie.cfg") as other drivers.  They're not all consistent, but I
don't see any other "cfg".

> +		if (IS_ERR(pcie->cfg))
> +			return PTR_ERR(pcie->cfg);
> +	}
> +
>  	pcie->free_ck = devm_clk_get(dev, "free_ck");
>  	if (IS_ERR(pcie->free_ck)) {
>  		if (PTR_ERR(pcie->free_ck) == -EPROBE_DEFER)
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
