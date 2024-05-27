Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B90C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 23:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfhPK1L6y3rw017RUONTn5kQQgIIO20S7PuQcjiORbE=; b=YvkPjqrfu296+7XRovUG9K8T4c
	lPImra5iR5sRJcQFsy8BBb1dhwXMhHasxr7Zus+LwZmkQ53F+kBVsQn0oxH+vhjdGVAW5/enMN1CI
	WSGDyH+GfM3pDcEYT0La26bNYQ8hCZWO2pmV35M9EyR5eEwau1/VGDv9GBsaccKV6c4vjzWNDoxm9
	OOWcVTS+SK9lvLtzv5WRgIjLkrRrNGYH19EYbsSRLsYCfXDrx5WKr6PKHIP5m6BtqvNetXqKT3HIU
	SxreGJkOJrL2eiFfOJti/cZ/rgxTZnoGeTZecC0kLAQcz3Ex4XrA/BbpP3JZEIkrKxtO4OdUEWNBf
	THaCn8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBjzZ-0000000Gbh6-1nyC;
	Mon, 27 May 2024 23:43:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBjzV-0000000GbgK-1x5C;
	Mon, 27 May 2024 23:42:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B732D61978;
	Mon, 27 May 2024 23:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19FAC2BBFC;
	Mon, 27 May 2024 23:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716853371;
	bh=XUGNe4Vne0m7pN3CMpt65nY5zW6n4Cua0wTpgEl0dxI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CZszdni2CFdUNNsdaZQSdg5xyv2aQogk6pGHNwOc4uqLYLDCvOQmcSZ0kn8u+298X
	 KpbX3qLNsRuXhWknHdCEkOhfPUtWjkSFsPv/EU9WtIAbyPTgRe8GoGqQGAY1AbHeOY
	 hoXeHswPUOoGseVhJFFKmOC+BI2hk7/79aLxRobZfrbKEi4twNZOdHpv1gAu11jS90
	 zMPOTHWY7nd4og9A93W8OF0excwX1wAEgcksaNMyiyOH4tkk7veTAP6UflJz42ir9a
	 jzw7zUJf2XnF1tK81SpynefzpwVwhNpFffDHLDKLMEIz9rLTl+jpUEMu8qwWUqE2nj
	 eKslG/W+wlbcQ==
Date: Mon, 27 May 2024 16:42:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: nbd@nbd.name, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 lorenzo@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: ethernet: mtk_eth_soc: add missing
 check for rhashtable_init
Message-ID: <20240527164249.4aafd105@kernel.org>
In-Reply-To: <20240517023922.362327-1-nichen@iscas.ac.cn>
References: <20240517023922.362327-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_164257_587416_E54DA474 
X-CRM114-Status: GOOD (  16.31  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 17 May 2024 10:39:22 +0800 Chen Ni wrote:
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index cae46290a7ae..f9b8956a8726 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -4957,7 +4957,7 @@ static int mtk_probe(struct platform_device *pdev)
>  
>  			eth->ppe[i] = mtk_ppe_init(eth, eth->base + ppe_addr, i);
>  
> -			if (!eth->ppe[i]) {
> +			if (IS_ERR_OR_NULL(eth->ppe[i])) {
>  				err = -ENOMEM;

You still discard the real error here.

>  				goto err_deinit_ppe;
>  			}
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
> index 0acee405a749..4895c6febaf8 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -884,12 +884,15 @@ struct mtk_ppe *mtk_ppe_init(struct mtk_eth *eth, void __iomem *base, int index)
>  	struct mtk_ppe *ppe;
>  	u32 foe_flow_size;
>  	void *foe;
> +	int ret;
>  
>  	ppe = devm_kzalloc(dev, sizeof(*ppe), GFP_KERNEL);
>  	if (!ppe)
>  		return NULL;

Please convert the return NULL in this function to 
return ERR_PTR(-ENOMEM) and use the error code in mtk_probe()

> -	rhashtable_init(&ppe->l2_flows, &mtk_flow_l2_ht_params);
> +	ret = rhashtable_init(&ppe->l2_flows, &mtk_flow_l2_ht_params);
> +	if (ret)
> +		return ERR_PTR(ret);

Also there are two direct return NULLs without calling rhashtable_destroy()
later in this function. Please fix that in a separate patch.

>  	/* need to allocate a separate device, since it PPE DMA access is
>  	 * not coherent.

