Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6EEC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 03:42:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1344C613AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 03:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1344C613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HXiIMJpvK29IwWSu/zeQTLFljMDN2kcLrCnRoH8ugto=; b=qr5YJmJRjxOhUA+pXAwHjCT0X
	FsBXwMlL8mUNtZ+YGGSyk1TPHKrXeIMUXAkjOxeLxahh4SSdjthHxtxL++lgbLYbLp7XxVa7/8nTb
	H0ln7Ia73w3BXvOgzCIQuxkPW+rdrJB5LZw2WwrjJwfhe3V9tA/efJqZX8+QcEZLyGSDsl3SQs6Pj
	LVcAMQFmpEvvzDL12p9UW9ZeNe2FMouky9umoiNgyMJtbfdmS91aTZOe5qtjbZQ6OTzuSDo3he40R
	1cAYjKcrVuYYAhIuZ5Y2mknJ85mgRwJosrabyU2TZ0yg+u2VuRUNCrbAHSXnhGBJMZa4d7SrNND3p
	eIX4rnL7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYhHI-00B7JJ-QB; Tue, 20 Apr 2021 03:42:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhHH-00B7JA-D8; Tue, 20 Apr 2021 03:42:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=MiCJROun/rsttV6xwvxiZQv1L1IxFNsuoy0zUTwLry0=; b=xHXcz8HW6nBMmlSjNz2xHtzWiG
 vE4nSkuP9MJVcljNtaxJyw+bnpr6bzrtpLJNvMEtj1qahlhHNSNzj4zAR/lJLPP6J85Ot0mO45LAO
 Xkk8Uor3ur+4u14W8wyV33aNK2V/mQyCOjvdi2OwXfQd10PNbclpmTltfmU9VVLZTZHOcVlbFxDW2
 qRdKFXid25rGuXajNhqhALAQceYntDKnsx11LO0UOhDRzmKhooyi+3WdyvuVabMtC2TXGAWRf+osj
 SlXwioaqhEzeCUhwzN+NM46GaLIY5ES37nltAmClQhDsTvBwluEsTYOCv1UFJVCnH9vz3aNbsm+6a
 IPG/7YUw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhHB-00BnJN-Gz; Tue, 20 Apr 2021 03:42:17 +0000
X-UUID: 3032c8b34cb841ae8acc76f6958915b8-20210419
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MiCJROun/rsttV6xwvxiZQv1L1IxFNsuoy0zUTwLry0=; 
 b=aShDz8tMW7oFTQhrv6POinZq3zsjHD5pWflpkkL8YX9jQxljjg3xqch8JE/v2u4dd0+kKL55EHMv7Kd4kgy74nxG30rG1wCJgCC3ZynyRBkYTbNU2tpdaUDNroLK9S/YYjBD7e49R/0tLgTlwIbWTdhDwZ4e3w9OFvyVpNVNZMw=;
X-UUID: 3032c8b34cb841ae8acc76f6958915b8-20210419
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1985431141; Mon, 19 Apr 2021 20:42:07 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Apr 2021 20:42:05 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 20 Apr 2021 11:42:02 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Apr 2021 11:42:01 +0800
Message-ID: <1618890121.31169.4.camel@mhfsdcap03>
Subject: Re: [PATCH v9 2/4] PCI: mediatek: Add new method to get shared
 pcie-cfg base address and parse node
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <lorenzo.pieralisi@arm.com>, <bhelgaas@google.com>
CC: <robh+dt@kernel.org.matthias.bgg>, <ryder.lee@mediatek.com>,
 <jianjun.wang@mediatek.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <yong.wu@mediatek.com>,
 <frank-w@public-files.de>
Date: Tue, 20 Apr 2021 11:42:01 +0800
In-Reply-To: <20210406034410.24381-3-chuanjia.liu@mediatek.com>
References: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
 <20210406034410.24381-3-chuanjia.liu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 49C9D70BAE7D6D133CC15AD9F4DA50839F38EE4E8A9754DE6F163B20324B26BA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_204213_592050_3AD6C504 
X-CRM114-Status: GOOD (  25.02  )
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

Hi, Lorenzo, Bjorn,

Just a gentle ping. Please let me know your comments about this patch
set.

thanks

On Tue, 2021-04-06 at 11:44 +0800, Chuanjia Liu wrote:
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
> index 23548b517e4b..65ebcdb8ab57 100644
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
> @@ -205,6 +207,7 @@ struct mtk_pcie_port {
>   * struct mtk_pcie - PCIe host information
>   * @dev: pointer to PCIe device
>   * @base: IO mapped register base
> + * @cfg: IO mapped register map for PCIe config
>   * @free_ck: free-run reference clock
>   * @mem: non-prefetchable memory resource
>   * @ports: pointer to PCIe port information
> @@ -213,6 +216,7 @@ struct mtk_pcie_port {
>  struct mtk_pcie {
>  	struct device *dev;
>  	void __iomem *base;
> +	struct regmap *cfg;
>  	struct clk *free_ck;
>  
>  	struct list_head ports;
> @@ -648,7 +652,11 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
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
> @@ -680,6 +688,10 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
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
> @@ -983,6 +995,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>  	struct device *dev = pcie->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct resource *regs;
> +	struct device_node *cfg_node;
>  	int err;
>  
>  	/* get shared registers, which are optional */
> @@ -995,6 +1008,14 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
>  		}
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
