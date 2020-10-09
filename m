Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E7FCC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 13:01:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8F9322248
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 13:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gk5pMlZF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="udTpYlCA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8F9322248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9wnVfXZAX8rGJiFIfqH66eln0fTU6NrxshTApuQAndI=; b=Gk5pMlZFSlImT85nRcrVRGO6J
	SynTOJhcWYU3geH8RiE95zk/IIksAMZuIOKG0Gcf0D8zlHPG94SRkraWkxeKQ+k5gKpqiFf+3g7XC
	plgTc1iTn0CGChe0flyctYChqXFDBIxYzDxbIRwY5SB4PoeQybhPkvU5dLB0j+Kerc4bCiVmTHRPm
	kMwUmlb6KpbtRj254d7JQx0zsbVeHLoa7RzdsxgAQhTNZONcxYQqjHq5Nw9vxp7Fw94CfkeC0E1Lg
	HmWnc8HH2bcEcapG6EawYCG+EHMNolbNUbDkr5P+OcLMrCaqXxhGNdqZQN8wa5qAmomokxzJC2cc0
	en+mpm4Qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQs1f-00025c-Ky; Fri, 09 Oct 2020 13:01:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQs1b-00023a-8R; Fri, 09 Oct 2020 13:01:34 +0000
X-UUID: 88409e3afb77450096cb1f61cb9ad234-20201009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=T0Q1hS1atV6ZgjZZgJ8HAejic+x9fuXgQyfpLTiToJ0=; 
 b=udTpYlCAxRu1ZXH9avMz0tCdhfuip4oF76AtWAWYp3Uy1VX7wq2/e1QBIMoswzmEI+0yUhH732CdaukDapLTuLCl7OwmevUgEnVrz5eyVaoSo0Gf77BAM7OUV0NCmS17HI+9RBi9jHJz1mOc41KZexaS7LGv3HyqAERPDND9qmk=;
X-UUID: 88409e3afb77450096cb1f61cb9ad234-20201009
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1518434297; Fri, 09 Oct 2020 05:01:18 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Oct 2020 05:53:08 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Oct 2020 20:53:04 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Oct 2020 20:53:04 +0800
Message-ID: <1602247986.31946.7.camel@mhfsdcap03>
Subject: Re: [PATCH v6 2/4] PCI: mediatek: Add new method to get shared
 pcie-cfg base and irq
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Fri, 9 Oct 2020 20:53:06 +0800
In-Reply-To: <20200930152317.GA2891120@bogus>
References: <20200914112659.7091-1-chuanjia.liu@mediatek.com>
 <20200914112659.7091-3-chuanjia.liu@mediatek.com>
 <20200930152317.GA2891120@bogus>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3F21F7E52E8679CF364EFB6F4570F032D594BEA8EFFEA4739B3B03C72BF09E392000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_090131_739452_B031908A 
X-CRM114-Status: GOOD (  26.86  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-09-30 at 10:23 -0500, Rob Herring wrote:
> On Mon, Sep 14, 2020 at 07:26:57PM +0800, Chuanjia Liu wrote:
> > Add new method to get shared pcie-cfg base and pcie irq for
> > new dts format.
> > 
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
> >  drivers/pci/controller/pcie-mediatek.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index cf4c18f0c25a..5b915eb0cf1e 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -14,6 +14,7 @@
> >  #include <linux/irqchip/chained_irq.h>
> >  #include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/msi.h>
> >  #include <linux/module.h>
> >  #include <linux/of_address.h>
> > @@ -23,6 +24,7 @@
> >  #include <linux/phy/phy.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >  #include <linux/reset.h>
> >  
> >  #include "../pci.h"
> > @@ -205,6 +207,7 @@ struct mtk_pcie_port {
> >   * struct mtk_pcie - PCIe host information
> >   * @dev: pointer to PCIe device
> >   * @base: IO mapped register base
> > + * @cfg: IO mapped register map for PCIe config
> >   * @free_ck: free-run reference clock
> >   * @mem: non-prefetchable memory resource
> >   * @ports: pointer to PCIe port information
> > @@ -213,6 +216,7 @@ struct mtk_pcie_port {
> >  struct mtk_pcie {
> >  	struct device *dev;
> >  	void __iomem *base;
> > +	struct regmap *cfg;
> >  	struct clk *free_ck;
> >  
> >  	struct list_head ports;
> > @@ -648,7 +652,11 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
> >  		return err;
> >  	}
> >  
> > -	port->irq = platform_get_irq(pdev, port->slot);
> > +	if (of_find_property(dev->of_node, "interrupt-names", NULL))
> > +		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
> 
> Not really any point in having a name with a single interrupt.
> 
> > +	else
> > +		port->irq = platform_get_irq(pdev, port->slot);
> 
> With the new binding, slot is always 0, right? Then you don't need any 
> change here.
In the new binding, PCIe1 slot number is 1.
Because some setting in the driver is based on slot number to determine
offset, this is to reduce driver changes and be compatible with new and
old DTS format.
> 
> > +
> >  	if (port->irq < 0)
> >  		return port->irq;
> >  
> > @@ -680,6 +688,10 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >  		val |= PCIE_CSR_LTSSM_EN(port->slot) |
> >  		       PCIE_CSR_ASPM_L1_EN(port->slot);
> >  		writel(val, pcie->base + PCIE_SYS_CFG_V2);
> > +	} else if (pcie->cfg) {
> > +		val = PCIE_CSR_LTSSM_EN(port->slot) |
> > +		      PCIE_CSR_ASPM_L1_EN(port->slot);
> > +		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
> >  	}
> >  
> >  	/* Assert all reset signals */
> > @@ -983,6 +995,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> >  	struct device *dev = pcie->dev;
> >  	struct platform_device *pdev = to_platform_device(dev);
> >  	struct resource *regs;
> > +	struct device_node *cfg_node;
> >  	int err;
> >  
> >  	/* get shared registers, which are optional */
> > @@ -995,6 +1008,14 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> >  		}
> >  	}
> >  
> > +	cfg_node = of_find_compatible_node(NULL, NULL,
> > +					   "mediatek,generic-pciecfg");
> > +	if (cfg_node) {
> > +		pcie->cfg = syscon_node_to_regmap(cfg_node);
> > +		if (IS_ERR(pcie->cfg))
> > +			return PTR_ERR(pcie->cfg);
> > +	}
> > +
> >  	pcie->free_ck = devm_clk_get(dev, "free_ck");
> >  	if (IS_ERR(pcie->free_ck)) {
> >  		if (PTR_ERR(pcie->free_ck) == -EPROBE_DEFER)
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
