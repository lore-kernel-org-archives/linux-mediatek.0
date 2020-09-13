Return-Path: <SRS0=V4X5=CW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D402C433E2
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 02:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3008207EA
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2020 02:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UZI8YRP6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G4CWgI6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3008207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B8DutKYqdhY+Ik+V5PlV/4FNBF+5w3Nw+Q8QoCDuHK0=; b=UZI8YRP6/R1W1BIYuA2o++KEk
	rRrPzrm5StpXdlMoVBeOxxqKklAjK5mhRnw6pyDF1VrTmpnwoOa6Kiwrk2qkERGj1Qns+7QvDRhp6
	d1HxPliqZYKvigzyF7EU+vaGt0BvAxITUYt4mIAC2PboB7tUr1s2AvdG0487KFgSxYcykymLAR2pu
	OIwTfQ9UM+PUU8+grDjEhQDI0WxYHZ38ZwA/WwCFdh4++pOwcp6wyvknUlz2MFP0B2QU2vQElAvdw
	UXxqp9ljL9PsvY2NNwEEYkzMKjxQA1eawaSatl7eR4XqKHytpvDtRFChsvwb0aDcLAbSo96sEdJCq
	PzgV74ZSQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHI4U-00059a-A7; Sun, 13 Sep 2020 02:48:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHI4P-00058M-8p; Sun, 13 Sep 2020 02:48:50 +0000
X-UUID: 0c7cf2bb845f4ccfaad9b1eb653e2014-20200912
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ixnwdilJm1ik+Sm2/G6gQSeRU/yl+c9RA2y6lHXtiFM=; 
 b=G4CWgI6+sQwUrvN3CNkPJzNy6Jm8nDmAtg/KRE4ctCeI0w0J6DIpjlhstq9roJlENw2lQR9DDb2ng3Et89chyfI1HC/nghVrD5DoE2UU2souXqzF5tNh+R06+Z0FXyFPwJNNEd9IcNCZGPpEk9sNYwO4bNvJMg7dFFA5L4Ra/yE=;
X-UUID: 0c7cf2bb845f4ccfaad9b1eb653e2014-20200912
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1839657866; Sat, 12 Sep 2020 18:48:39 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Sep 2020 19:48:37 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 13 Sep 2020 10:48:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 13 Sep 2020 10:48:34 +0800
Message-ID: <1599965194.7466.28.camel@mhfsdcap03>
Subject: Re: [PATCH v5 2/4] PCI: mediatek: Use regmap to get shared pcie-cfg
 base
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Sun, 13 Sep 2020 10:46:34 +0800
In-Reply-To: <b627b938-2210-16d2-1682-3c25506e30f3@gmail.com>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
 <20200910061115.909-3-chuanjia.liu@mediatek.com>
 <b627b938-2210-16d2-1682-3c25506e30f3@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B622682C64DBF4B97D327ED91874FA7AE6E2A95E360E8685FB83F62B6AA965732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_224849_522588_ED3EEBB6 
X-CRM114-Status: GOOD (  23.87  )
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
 Ryder Lee <ryder.lee@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 12:44 +0200, Matthias Brugger wrote:
> 
> On 10/09/2020 08:11, Chuanjia Liu wrote:
> > Use regmap to get shared pcie-cfg base and change
> > the method to get pcie irq.
> > 
> > Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
> > ---
> >   drivers/pci/controller/pcie-mediatek.c | 25 ++++++++++++++++++-------
> >   1 file changed, 18 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
> > index cf4c18f0c25a..987845d19982 100644
> > --- a/drivers/pci/controller/pcie-mediatek.c
> > +++ b/drivers/pci/controller/pcie-mediatek.c
> > @@ -14,6 +14,7 @@
> >   #include <linux/irqchip/chained_irq.h>
> >   #include <linux/irqdomain.h>
> >   #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >   #include <linux/msi.h>
> >   #include <linux/module.h>
> >   #include <linux/of_address.h>
> > @@ -23,6 +24,7 @@
> >   #include <linux/phy/phy.h>
> >   #include <linux/platform_device.h>
> >   #include <linux/pm_runtime.h>
> > +#include <linux/regmap.h>
> >   #include <linux/reset.h>
> >   
> >   #include "../pci.h"
> > @@ -205,6 +207,7 @@ struct mtk_pcie_port {
> >    * struct mtk_pcie - PCIe host information
> >    * @dev: pointer to PCIe device
> >    * @base: IO mapped register base
> > + * @cfg: IO mapped register map for PCIe config
> >    * @free_ck: free-run reference clock
> >    * @mem: non-prefetchable memory resource
> >    * @ports: pointer to PCIe port information
> > @@ -213,6 +216,7 @@ struct mtk_pcie_port {
> >   struct mtk_pcie {
> >   	struct device *dev;
> >   	void __iomem *base;
> > +	struct regmap *cfg;
> >   	struct clk *free_ck;
> >   
> >   	struct list_head ports;
> > @@ -648,7 +652,7 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
> >   		return err;
> >   	}
> >   
> > -	port->irq = platform_get_irq(pdev, port->slot);
> > +	port->irq = platform_get_irq_byname(pdev, "pcie_irq");
> >   	if (port->irq < 0)
> >   		return port->irq;
> 
> You will need to make sure taht the driver keeps working with the old DTS 
> format. This is not the case here.
> 
Thanks for your review, I will fix it in the next version.

Regards,
Chuanjia
> Regards,
> Matthias
> 
> >   
> > @@ -674,12 +678,11 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
> >   	if (!mem)
> >   		return -EINVAL;
> >   
> > -	/* MT7622 platforms need to enable LTSSM and ASPM from PCIe subsys */
> > -	if (pcie->base) {
> > -		val = readl(pcie->base + PCIE_SYS_CFG_V2);
> > -		val |= PCIE_CSR_LTSSM_EN(port->slot) |
> > -		       PCIE_CSR_ASPM_L1_EN(port->slot);
> > -		writel(val, pcie->base + PCIE_SYS_CFG_V2);
> > +	/* MT7622/MT7629 platforms need to enable LTSSM and ASPM. */
> > +	if (pcie->cfg) {
> > +		val = PCIE_CSR_LTSSM_EN(port->slot) |
> > +		      PCIE_CSR_ASPM_L1_EN(port->slot);
> > +		regmap_update_bits(pcie->cfg, PCIE_SYS_CFG_V2, val, val);
> >   	}
> >   
> >   	/* Assert all reset signals */
> > @@ -983,6 +986,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> >   	struct device *dev = pcie->dev;
> >   	struct platform_device *pdev = to_platform_device(dev);
> >   	struct resource *regs;
> > +	struct device_node *cfg_node;
> >   	int err;
> >   
> >   	/* get shared registers, which are optional */
> > @@ -995,6 +999,13 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
> >   		}
> >   	}
> >   
> > +	cfg_node = of_parse_phandle(dev->of_node, "mediatek,pcie-cfg", 0);
> > +	if (cfg_node) {
> > +		pcie->cfg = syscon_node_to_regmap(cfg_node);
> > +		if (IS_ERR(pcie->cfg))
> > +			return PTR_ERR(pcie->cfg);
> > +	}
> > +
> >   	pcie->free_ck = devm_clk_get(dev, "free_ck");
> >   	if (IS_ERR(pcie->free_ck)) {
> >   		if (PTR_ERR(pcie->free_ck) == -EPROBE_DEFER)
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
