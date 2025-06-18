Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB8BC71157
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jun 2025 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oL+UivKoF5os9z3qBOAG1K1muz/j+dGSv5h1Fe6j3Z0=; b=gAP42fpC6ro/RsRIj/UNCeITjv
	T53Eqf3MozBf+IYhA5Ihnkh7Z6CfMzlpr4kraB6oLQj/b4jNGIITW+uORJsQ1KrJUNDVVfTServ12
	pV0I9/vhF+2T/1VAp14n7pWnZ69Cv+mBpyt4jLs31spO2Y9mhRG6nSbO8bV8QoEVLAnQ5nXnj2kBt
	1TsmZbLfpf2LEMnMZP/XAaDWQ/EYGZHPu8V+BRQ0/JyQ2gy9FRgtpF5df37LO001q41lr2qmnTkQ/
	/8bNy3qJWTd2vbzuGmTNACWj63CXL+Qv+UQ+mvwdUBdvSKaxq78wNK346/cDLAswdrgUUVhcWhBTx
	tZGM8NEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvw5-0000000AlDz-3d7z;
	Wed, 18 Jun 2025 16:46:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtH4-0000000ANHn-4B7B;
	Wed, 18 Jun 2025 13:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=oL+UivKoF5os9z3qBOAG1K1muz/j+dGSv5h1Fe6j3Z0=; b=XdRnp5KXbhdYeyGMXZkMI1Kf0T
	QdKkbFDYmnp6R76Rfev/lyZlGvdsxg/AEjE5u66gKjW+YoLb1pjE2zB3dVJ4l2CrrWrlkoyR92nmA
	32uxTI9ZMKXKw4PFx03NFaZej05EyqkhYwwUqqRnE7jnDHSh2+HYQt369/21uY/YGBmV90XOhLAQD
	4+L5QQkNDAaN6mozbODaklZXl6/EkDr6Gxtw3/Fj1DwEwCn8oZI6EJQjvVs0Ca3XVkqbcxj81QWX8
	DOqwdMOHBoh303vjPe+jDw22gfhSltxbqNhW88y1ysDKf0C0auqKUsdSaf2D0UzsEnAlLfzQMVGs+
	94wL/bHw==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRtH2-000000044m5-2WBK;
	Wed, 18 Jun 2025 13:56:22 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uRt8G-000000003fP-1YpV;
	Wed, 18 Jun 2025 13:55:58 +0000
Date: Wed, 18 Jun 2025 15:55:45 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [net-next v5 1/3] net: ethernet: mtk_eth_soc: support named IRQs
Message-ID: <aFLFYe8mq4tbLfdf@pidgin.makrotopia.org>
References: <20250618130717.75839-1-linux@fw-web.de>
 <20250618130717.75839-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618130717.75839-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_145620_709690_D18EA60C 
X-CRM114-Status: GOOD (  25.18  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, arinc.unal@arinc9.com, linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 18, 2025 at 03:07:12PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add named interrupts and keep index based fallback for existing
> devicetrees.
> 
> Currently only rx and tx IRQs are defined to be used with mt7988, but
> later extended with RSS/LRO support.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Simon Horman <horms@kernel.org>
>  
> +static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
> +{
> +	int i;
> +
> +	/* future SoCs beginning with MT7988 should use named IRQs in dts */
> +	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
> +	eth->irq[2] = platform_get_irq_byname(pdev, "rx");
> +	if (eth->irq[1] >= 0 && eth->irq[2] >= 0)
> +		return 0;

I'd rather extend that logic and fall back to the legacy way only in case
of -ENXIO. Ie. add here:

if (eth->irq[1] != -ENXIO)
	return eth->irq[1];

if (eth->irq[2] != -ENXIO)
	return eth->irq[2];

Maybe also output a warning at this point in case MTK_SHARED_INT is no
set, to recommend users to update their device tree to named interrupts.

> +
> +	/* legacy way:
> +	 * On MTK_SHARED_INT SoCs (MT7621 + MT7628) the first IRQ is taken
> +	 * from devicetree and used for both RX and TX - it is shared.
> +	 * On SoCs with non-shared IRQs the first entry is not used,
> +	 * the second is for TX, and the third is for RX.
> +	 */
> +	for (i = 0; i < 3; i++) {
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> +			eth->irq[i] = eth->irq[0];
> +		else
> +			eth->irq[i] = platform_get_irq(pdev, i);
> +
> +		if (eth->irq[i] < 0) {
> +			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> +			return -ENXIO;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static irqreturn_t mtk_handle_irq_rx(int irq, void *_eth)
>  {
>  	struct mtk_eth *eth = _eth;
> @@ -5106,17 +5137,10 @@ static int mtk_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	for (i = 0; i < 3; i++) {
> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> -			eth->irq[i] = eth->irq[0];
> -		else
> -			eth->irq[i] = platform_get_irq(pdev, i);
> -		if (eth->irq[i] < 0) {
> -			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> -			err = -ENXIO;
> -			goto err_wed_exit;
> -		}
> -	}
> +	err = mtk_get_irqs(pdev, eth);
> +	if (err)
> +		goto err_wed_exit;
> +
>  	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
>  		eth->clks[i] = devm_clk_get(eth->dev,
>  					    mtk_clks_source_name[i]);
> -- 
> 2.43.0
> 
> 

