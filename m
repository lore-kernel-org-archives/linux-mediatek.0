Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F6EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=lsld4dlQu67gmlmMWldwUj7/WakoxoJocyVLh5wGhco=; b=YLZLKHWCHrnsLk
	YOYmUchVLwYZCk8rb1VVb6fpig3xVijZhaQNbfh3Z8TAeYSnl0lh5x6XiGps8NPMHmui5/lmOUJrH
	JtOAebdOz3MkZREu3JBwHO/kHgCQOh6baJ1GEJPYOp6S2BD/gYUJ9WXRPsLN0aaKiI64xKyGth+90
	qwVe7NTDzMWTk7HdBOULUQ3qqv0pxFwkEIa4XAlem9ufcXbOR2sL2NWLDrHtQtseiWyh5FZ1CQSrl
	Pd4hyB/vNgH5torn5YXhDaMHugn6vL3HcG+fx+5AgBorfCdRogq1elxIGA8E54TRDgENuo/ZILkKt
	JvNbIcT/THoxffBb3hmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz372-00F13W-TD; Wed, 08 Jun 2022 21:21:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz36r-00F11b-6f; Wed, 08 Jun 2022 21:21:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C46360C85;
	Wed,  8 Jun 2022 21:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA963C3411E;
	Wed,  8 Jun 2022 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654723260;
	bh=S3UEZv3ead2hOkIPLW7Y042Bs94VzTGvzX0yMk+NxlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rbfxb19Ae3cah/01V7chFtBj+m46O5WTrj4ME78TsGsYH8e3YRinhfNXJoSg4VOft
	 4KXfE9px6mQqZUtk3mA2jL8VJNXKk6a4/9ZocluE3GBrstjvkd7sDZBYq/ReztMUew
	 kzzLvHqRzpdljwPJNm7fuYNRtDiEDTJSJGb5+SkSsT8Zk+L0bya94XtMGOe/MmQqMo
	 R02p6t+mL8QPInjZhu+ZHlDjhPBXpKUJD4jzdYCZXPEjYFUMdHW79wb2r7zBNvWXkg
	 CGe1Idm4gzUdd8g6egGBwPZcJ3JPiez0TfHJrH562iHqj/ezcCMpMQGj3brbmqFL14
	 aZaq1gPAa+PwA==
Date: Wed, 8 Jun 2022 16:20:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: miles.chen@mediatek.com, Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Fix refcount leak in
 mtk_pcie_init_irq_domains
Message-ID: <20220608212058.GA424368@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601041259.56185-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_142101_356671_C238C015 
X-CRM114-Status: GOOD (  22.54  )
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

On Wed, Jun 01, 2022 at 08:12:58AM +0400, Miaoqian Lin wrote:
> of_get_child_by_name() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when not need anymore.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: 814cceebba9b ("PCI: mediatek-gen3: Add INTx support")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Can we get an ack from Ryder or Jianjun, as well, since they're listed
as maintainers?

> ---
> changes in v2:
> - move of_node_put(intc_node) right after irq_domain_add_linear to cover
> normal path and error paths.
> ---
> changes in v3:
> - call of_node_put() in error paths with goto, and call of_node_put() before
>   return 0 in normal path. Since this function has a goto part to handle
>   resources, so put them together, as suggested by Miles Chen <miles.chen@mediatek.com>
> 
> v1 link: https://lore.kernel.org/all/20220526110246.53502-1-linmq006@gmail.com/
> v2 link: https://lore.kernel.org/all/20220530064807.34534-1-linmq006@gmail.com/
> ---
>  drivers/pci/controller/pcie-mediatek-gen3.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index 3e8d70bfabc6..bceed28446ed 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -600,7 +600,8 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
>  						  &intx_domain_ops, pcie);
>  	if (!pcie->intx_domain) {
>  		dev_err(dev, "failed to create INTx IRQ domain\n");
> -		return -ENODEV;
> +		ret = -ENODEV;
> +		goto out_put_node;
>  	}
>  
>  	/* Setup MSI */
> @@ -623,13 +624,15 @@ static int mtk_pcie_init_irq_domains(struct mtk_gen3_pcie *pcie)
>  		goto err_msi_domain;
>  	}
>  
> +	of_node_put(intc_node);
>  	return 0;
>  
>  err_msi_domain:
>  	irq_domain_remove(pcie->msi_bottom_domain);
>  err_msi_bottom_domain:
>  	irq_domain_remove(pcie->intx_domain);
> -
> +out_put_node:
> +	of_node_put(intc_node);
>  	return ret;
>  }
>  
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
