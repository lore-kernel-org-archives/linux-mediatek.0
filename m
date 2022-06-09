Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=G1xkTvuUXnuedMTLalQy/r43dwqx+W5WFTyiBVdZLVA=; b=pi/gGDeoN3HZhm
	5zswYHUPWG13gAD1NxkuQxC3F/Iq9gWqfD366svmKpt2q4bDBzlKYer2sqLYZYTJWzWkR2bXuOXy7
	dLnhAxZH29FinfdTOcv/WAbnZncnJD9bNBqIuouFcl3AY4HHCO1WBF3zmquVoepCEeXGV3vP3yQEW
	BgBsGcrL4M2WtVhGXuf+XINfaXNKF03hqe+XohU1TkI/aLg5HJUgQo94fHOydbGynCFv5C7tRIMRp
	WcFpNw2xk08YQBJGjGPHgeNDbtQ1VP7Zugc7bTR/VR070O7aPp9zjI3ZbOTSVS88Nd17EMObt8Q/v
	4M9ajZfpQEtA9AOZOgQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzM0n-003Ai7-NZ; Thu, 09 Jun 2022 17:32:01 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzLut-0037US-KI; Thu, 09 Jun 2022 17:25:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07AD1B82F2F;
	Thu,  9 Jun 2022 17:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9E5C34114;
	Thu,  9 Jun 2022 17:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654795552;
	bh=LRXZrTeIfc/3UjoxAqS+VWrDiLI0ppGgIhrh3HyHgZw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MQjB4azLUJEdeltSFXYBvNCenrXYvpToyYU4mAcKTRlZJTLz0YEdfhiDMgiOOYeh+
	 V9XB/uIgb6VERaxRZdFgwFqJs2bVq+5lVvS76QJOU3ljv7wtE2DSx+eVncXit1oNaF
	 niqHR3ydolPb8ctajta6HlDOf9kGUWGcerCvAI+BxWZV5tJAKfk6XKgPtIM0up9dX0
	 fVCAuPKFxSDaG7lOqn5RFL0fSq47MmycHbkJsnwnqRoqpaKYdBP8bgVG0cl9FPtn40
	 Saq8VFx6B2WFxiLodw9RA8Kiq9hSY7oS++OC3uK+FHZMtTL9/23BVRrCg/9vdCqt1F
	 JE/oHicJMGtYg==
Date: Thu, 9 Jun 2022 12:25:50 -0500
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
Message-ID: <20220609172550.GA519198@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220601041259.56185-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_102555_999724_3A33BB1A 
X-CRM114-Status: GOOD (  22.12  )
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

Applied to pci/ctrl/mediatek-gen3 with Miles' reviewed-by and
Jianjun's ack, thanks!

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
