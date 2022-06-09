Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7239C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 02:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+Ixn+58zw2hZ8588pa33ImhToIMn95InE59/fTUKB0=; b=V6CMUK3SF9CFN/
	KcBbyF3AFu+1cC+ghgdOxPO74GT0L/uhf/cIowe5M31cJ63f9Y+2gO0kU6pDbiCOzjoCna15Ga98y
	oIYIpWAbrjfxCOsbY1R+FxZtNrjijy+4Z/8Vt9YEa1gmJwgeGZeWHBYq3ENCTsBQOWl75xwJSzQVi
	bXjliuIOtQPyoF36HqfqQfGPnW+b6jTX2y9Bsq5hH58T2YuYlm2VHEm4WPl7l5b+KxaBzuAg47TTW
	EJbutCLCUO+OG70dJqEBdBxl8qgm759PelPPnGS0K0BgdlZPUKouw4+n3GCPNfkReUo6+Ms2Sljwr
	NbvDSPGl2YIkzGS5YSRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz7jE-00FesJ-FZ; Thu, 09 Jun 2022 02:16:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz7jB-00Feqn-Tm; Thu, 09 Jun 2022 02:16:55 +0000
X-UUID: bf20e3f2f2334eeead22d0eee3693fc5-20220608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=M2Zjq0LgUucNP63JjBa/wEQ2aI0h55YMQa+UETqJHaI=;
	b=ebepROnyj3BQiNbhhQGbBN2sXuDruOCK52mdk5Xb03xvb8WbqWymMbblYEDZ1H1ZvzJSX2ZELiGHo68irlE+KHHZD5XpfNvloHJYjIiElwBarYzuDyF9AijZleL1G2tj5olyHAaLM6QWZcv4h79OIT/m0k+N4pxOE0bUZYSXm+c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:5c4b8500-b676-4f09-9a1e-89301bb4db4f,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:2e4c2ce5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: bf20e3f2f2334eeead22d0eee3693fc5-20220608
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1426985652; Wed, 08 Jun 2022 19:16:50 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 19:16:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Jun 2022 10:16:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 9 Jun 2022 10:16:46 +0800
Message-ID: <f3f38fe193b949956691ed788e23e3c3bd59c2da.camel@mediatek.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Fix refcount leak in
 mtk_pcie_init_irq_domains
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Miaoqian Lin <linmq006@gmail.com>
CC: <miles.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Lorenzo
 Pieralisi" <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, <linux-pci@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Date: Thu, 9 Jun 2022 10:16:46 +0800
In-Reply-To: <20220608212058.GA424368@bhelgaas>
References: <20220608212058.GA424368@bhelgaas>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_191654_010781_1F503C85 
X-CRM114-Status: GOOD (  26.10  )
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

Hi Bjorn,

On Wed, 2022-06-08 at 16:20 -0500, Bjorn Helgaas wrote:
> On Wed, Jun 01, 2022 at 08:12:58AM +0400, Miaoqian Lin wrote:
> > of_get_child_by_name() returns a node pointer with refcount
> > incremented, we should use of_node_put() on it when not need
> > anymore.
> > Add missing of_node_put() to avoid refcount leak.
> > 
> > Fixes: 814cceebba9b ("PCI: mediatek-gen3: Add INTx support")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> 
> Can we get an ack from Ryder or Jianjun, as well, since they're
> listed
> as maintainers?

Sure, thanks for the reminder.

Acked-by: Jianjun Wang <jianjun.wang@mediatek.com>
> 
> > ---
> > changes in v2:
> > - move of_node_put(intc_node) right after irq_domain_add_linear to
> > cover
> > normal path and error paths.
> > ---
> > changes in v3:
> > - call of_node_put() in error paths with goto, and call
> > of_node_put() before
> >   return 0 in normal path. Since this function has a goto part to
> > handle
> >   resources, so put them together, as suggested by Miles Chen <
> > miles.chen@mediatek.com>
> > 
> > v1 link: 
> > https://lore.kernel.org/all/20220526110246.53502-1-linmq006@gmail.com/
> > v2 link: 
> > https://lore.kernel.org/all/20220530064807.34534-1-linmq006@gmail.com/
> > ---
> >  drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c
> > b/drivers/pci/controller/pcie-mediatek-gen3.c
> > index 3e8d70bfabc6..bceed28446ed 100644
> > --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> > @@ -600,7 +600,8 @@ static int mtk_pcie_init_irq_domains(struct
> > mtk_gen3_pcie *pcie)
> >  						  &intx_domain_ops,
> > pcie);
> >  	if (!pcie->intx_domain) {
> >  		dev_err(dev, "failed to create INTx IRQ domain\n");
> > -		return -ENODEV;
> > +		ret = -ENODEV;
> > +		goto out_put_node;
> >  	}
> >  
> >  	/* Setup MSI */
> > @@ -623,13 +624,15 @@ static int mtk_pcie_init_irq_domains(struct
> > mtk_gen3_pcie *pcie)
> >  		goto err_msi_domain;
> >  	}
> >  
> > +	of_node_put(intc_node);
> >  	return 0;
> >  
> >  err_msi_domain:
> >  	irq_domain_remove(pcie->msi_bottom_domain);
> >  err_msi_bottom_domain:
> >  	irq_domain_remove(pcie->intx_domain);
> > -
> > +out_put_node:
> > +	of_node_put(intc_node);
> >  	return ret;
> >  }
> >  
> > -- 
> > 2.25.1
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
