Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3545CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 18:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLyvguQ3/8qO6V2lcHwANpR81ahsl2TlHClhwC0/5sk=; b=DQ+Rt2L5uxzRhT
	uTziNBtQb0LLIEOgWZCtThjimtpYZzXSq+2XfkoTlXZ+q6SfT+wp6yiyfX8IUuC3TCic4hhzAZZ2x
	acnuWqKzVV2zF7sIDJPjxtRqC/mSzHNJRg5hjQA2x08GakGUEgjUG00rGgJY8Yrw7zArP7Xt11cI6
	gAqdxvpzFPJdV7uP0SsvF2cGoyjYAEE8pppb6y9qK3tbVJld7RoRQwR0i/yjmHV3tDwbM4kzrrCXA
	sunmCvjUKstwhdX8aqjKu68CaeqTpvfsas3zUlMH4KJqmm4xvXX4DaggsD36hwkRKRusLZR0WEKL8
	nQdJZ3VobxbDusCgS5MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw6N7-00C8hQ-Ti; Tue, 31 May 2022 18:13:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw6Mw-00C8es-JB; Tue, 31 May 2022 18:13:28 +0000
X-UUID: c11ea813be0c4a1d81646bb44e27cd1c-20220531
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:6465ac7b-e8a7-4f76-aadf-a0b4895441c1,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:66a2048a-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: c11ea813be0c4a1d81646bb44e27cd1c-20220531
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1573055600; Tue, 31 May 2022 11:13:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 May 2022 11:13:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Jun 2022 02:13:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 02:13:16 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <linmq006@gmail.com>
CC: <bhelgaas@google.com>, <jianjun.wang@mediatek.com>, <kw@linux.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-pci@vger.kernel.org>,
	<lorenzo.pieralisi@arm.com>, <matthias.bgg@gmail.com>, <maz@kernel.org>,
	<robh@kernel.org>, <ryder.lee@mediatek.com>
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Fix refcount leak in mtk_pcie_init_irq_domains
Date: Wed, 1 Jun 2022 02:13:16 +0800
Message-ID: <20220531181316.24452-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220530064807.34534-1-linmq006@gmail.com>
References: <20220530064807.34534-1-linmq006@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_111326_677976_1AE7354D 
X-CRM114-Status: GOOD (  15.37  )
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

Hi Miaoqian,

>of_get_child_by_name() returns a node pointer with refcount
>incremented, we should use of_node_put() on it when not need anymore.
>Add missing of_node_put() to avoid refcount leak.
>
>Fixes: 814cceebba9b ("PCI: mediatek-gen3: Add INTx support")
>Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>---
>changes in v2:
>- move of_node_put(intc_node) right after irq_domain_add_linear to cover
>normal path and error paths.
>
>v1 link: https://lore.kernel.org/all/20220526110246.53502-1-linmq006@gmail.com/
>---
> drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
>index 3e8d70bfabc6..19a01daad304 100644
>--- a/drivers/pci/controller/pcie-mediatek-gen3.c
>+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
>@@ -598,6 +598,7 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
> 
> 	pcie->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
> 						  &intx_domain_ops, pcie);
>+	of_node_put(intc_node);
> 	if (!pcie->intx_domain) {
> 		dev_err(dev, "failed to create INTx IRQ domain\n");
> 		return -ENODEV;
>
> 		

Thanks for this v2 patch. I think we can do similar things like
rtl8365mb_irq_setup() in drivers/net/dsa/realtek/rtl8365mb.c.

When I read the error path, I will go back and see if everything is
released, so I think it is clearer to put of_node_put() in the error
path and before return 0.

How do you think?

i.g.,

static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
{
	struct device *dev = pcie->dev;
	struct device_node *intc_node, *node = dev->of_node;
	int ret;

	raw_spin_lock_init(&pcie->irq_lock);

	/* Setup INTx */
	intc_node = of_get_child_by_name(node, "interrupt-controller");
	if (!intc_node) {
		dev_err(dev, "missing interrupt-controller node\n");
		return -ENODEV;
	}

	pcie->intx_domain = irq_domain_add_linear(intc_node, PCI_NUM_INTX,
						  &intx_domain_ops, pcie);
	if (!pcie->intx_domain) {
		dev_err(dev, "failed to create INTx IRQ domain\n");
		ret = -ENODEV;
		goto out_put_node;
	}

	/* Setup MSI */
	mutex_init(&pcie->lock);

	pcie->msi_bottom_domain = irq_domain_add_linear(node, PCIE_MSI_IRQS_NUM,
				  &mtk_msi_bottom_domain_ops, pcie);
	if (!pcie->msi_bottom_domain) {
		dev_err(dev, "failed to create MSI bottom domain\n");
		ret = -ENODEV;
		goto err_msi_bottom_domain;
	}

	pcie->msi_domain = pci_msi_create_irq_domain(dev->fwnode,
						     &mtk_msi_domain_info,
						     pcie->msi_bottom_domain);
	if (!pcie->msi_domain) {
		dev_err(dev, "failed to create MSI domain\n");
		ret = -ENODEV;
		goto err_msi_domain;
	}

	of_node_put(intc);
	return 0;

err_msi_domain:
	irq_domain_remove(pcie->msi_bottom_domain);
err_msi_bottom_domain:
	irq_domain_remove(pcie->intx_domain);
out_put_node:
	of_node_put(intc);

	return ret;
}

thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
