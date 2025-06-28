Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE98C54ED1
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jun 2025 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpQ5LeQKLn8DmQkgnLVtZRFeuVCA8DvcNVHpHbSb/zo=; b=eZbHtuXFhrny9CjmncHLZ9dnuz
	sSV76xRUH/6Np4kQa3FDqIJhT1MNWJQqYCiPRD8hmGhd1X9luuv0A4zxTcolH/YO+t1el5oi/oF1s
	Yt6OJ7HaLXsDZiWtVHNTOyLqBi31W3kG2IVBe9unyr8nX+5pHout3+nkfrnBMngLzeuozk+2JYRYY
	GR70tlJ/CimGzjLnbUrNBCA0K0sz2dX/vz6aA2wO6f6S9fFVVcxWruBMOnR8qX79CvIlQTPYx452m
	RMZnrvJzRsSvGH4fKpsyoU6Z02Yd3JbfffanV8b4kAy5KbrVIEchjCKOgEUX9GvqUSvAJnazk+/tF
	nNaIOEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQjf-0000000GY3D-2N6E;
	Sat, 28 Jun 2025 08:16:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVQhM-0000000GXxK-3Ngu;
	Sat, 28 Jun 2025 08:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=CpQ5LeQKLn8DmQkgnLVtZRFeuVCA8DvcNVHpHbSb/zo=; b=Y7O3ZS+kX6ozjbiZFxL/E7Aiyb
	qhUaXUzRpe4wxEySlH4Pzl3f3E/nJNucCdluAS7TjBczAA5/tbO40+Jl3IAbaAb3NKhnzcFmpIh4M
	edGZyyZAQYvS3yr2fgMLBguNF2D8983l2oHX7k3zQm29+qffImlGIhpWrdjevUrWqM1A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uVQh5-00HDrs-JU; Sat, 28 Jun 2025 10:13:51 +0200
Date: Sat, 28 Jun 2025 10:13:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net/next 3/3] net: ethernet: mtk_eth_soc: use genpool
 allocator for SRAM
Message-ID: <f9bec387-1858-4c79-bb4b-60e744457c9f@lunn.ch>
References: <cover.1751072868.git.daniel@makrotopia.org>
 <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <566ca90fc59ad0d3aff8bc8dc22ebaf0544bce47.1751072868.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_011408_847461_1204F608 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Sky Huang <skylake.huang@mediatek.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Bo-Cun Chen <bc-bocun.chen@mediatek.com>, Eric Woudstra <ericwouds@gmail.com>, Elad Yifee <eladwf@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> +static void *mtk_dma_ring_alloc(struct mtk_eth *eth, size_t size,
> +				dma_addr_t *dma_handle)
> +{
> +	void *dma_ring;
> +
> +	if (WARN_ON(mtk_use_legacy_sram(eth)))
> +		return -ENOMEM;
> +
> +	if (eth->sram_pool) {
> +		dma_ring = (void *)gen_pool_alloc(eth->sram_pool, size);
> +		if (!dma_ring)
> +			return dma_ring;
> +		*dma_handle = gen_pool_virt_to_phys(eth->sram_pool, (unsigned long)dma_ring);

I don't particularly like all the casting backwards and forwards
between unsigned long and void *. These two APIs are not really
compatible with each other. So any sort of wrapping is going to be
messy.

Maybe define a cookie union:

struct mtk_dma_cookie {
	union {
		unsigned long gen_pool;
		void *coherent;
	}
}

Only dma_handle appears to be used by the rest of the code, so only
the _alloc and _free need to know about the union.

	Andrew

