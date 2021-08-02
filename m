Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C367CC4320A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 07:09:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8145F60F58
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8145F60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9v638aesdvlsRd5hlQqcT1cQBlKJMlgArDtuB0JE2w=; b=ESMMQKrynE6aq7
	nAjHKMtRyYDAh4f8i4jdvYCLlvhRlSnH2ZiF5grhjjs+jWUtKYpM50dbh8zqtGGQy0q2Uhv2HB2Mm
	2Bn42UCRPltS3SbKsqrGM8D3qhnzAIkw6JS2LHyxz1wB/jURFF59QPaAdF/BUZQY89HjEyaKorBF6
	nFk1QfFJpWqw1EB2U7Sb0n4msA235WkTWk6n6XJxwjGQwUwFLI4PN19CY5TyZpHXLZ/QcIEmJ6K34
	edcXBT7M+6DLYrfU2DNQ5V9ixISIdCx0PPUQf+qCmN1q8awTjB78hEwBo23K2qb8DFqUNxMhiFgiv
	lAmrJ7PBA/cTWbqxQuFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAS44-00FEje-IN; Mon, 02 Aug 2021 07:08:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAS40-00FEic-QA; Mon, 02 Aug 2021 07:08:43 +0000
X-UUID: d3d95e50291e414bbe719599a538be74-20210802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=21ZQL0O+AYNYOVFc0STZ7qW2KMKVaTPFPt6AU1g4ZHY=; 
 b=WX6FnVSFJdUXjVhxXqOCRqwFQMaxZI7xH8q6uVRPDecNMKc8lNp+iGETgUqb/ZyFIE/O1EIFMttw7fS6uLyrQ2EcmRuLfnSrXhc3C2TfcQ6/C3ogCIisvzPSISmKORffyO0id1ZmeqbF8/dl3sRb3MOGcKzSdHF5FEfLtS8jHqE=;
X-UUID: d3d95e50291e414bbe719599a538be74-20210802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 20501569; Mon, 02 Aug 2021 00:08:30 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 00:07:24 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Aug 2021 15:07:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 2 Aug 2021 15:07:22 +0800
Message-ID: <1627888042.1118.2.camel@mhfsdcap03>
Subject: Re: [PATCH v11 2/4] PCI: mediatek: Add new method to get shared
 pcie-cfg base address and parse node
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <chuanjia.liu@mediatek.com>
Date: Mon, 2 Aug 2021 15:07:22 +0800
In-Reply-To: <20210719073456.28666-3-chuanjia.liu@mediatek.com>
References: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
 <20210719073456.28666-3-chuanjia.liu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_000840_895305_93B83FC2 
X-CRM114-Status: GOOD (  24.14  )
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

On Mon, 2021-07-19 at 15:34 +0800, Chuanjia Liu wrote:

Gently ping...
> For the new dts format, add a new method to get
> shared pcie-cfg base address and parse node.
> 
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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
