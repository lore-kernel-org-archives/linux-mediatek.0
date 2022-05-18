Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49B3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJyhfWLUUJbMEAuadpwHNC5FgDpTdTY+A0+kzOXIyUQ=; b=hwHMMZbCeUvFew
	EUyErp1/FQwcJPQvixm4s5XwEQhLWr/Dyf6mcPXiHbX3/e5y9OQ8KU+esoFhPeyxD5GVgsSDYFk80
	NiDn+ZqaAG1iZhv4dmMED+USgdgFAIbWrzrhuHZ00TbzeCp6IsaflBXntscNnaMz7UlbgxbxRoCiT
	KQK8Kc0NUsbU8+Q0Nija6B2yYs+qxHarOMxD/HCgHbyemv6x8hcw/8MQ24amLrJ9pq9R4nDwepVWJ
	rrkS88LliQvyeTOljRAwTCH/c1GUxAiF6YgkjEC3lvs232snmjl8RTUN9SzwCCssVTt4l40Rh3jV4
	JDX4DSPd27W0YcmrALeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8b4-00GbBW-9O; Wed, 18 May 2022 01:35:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8b1-00GbB2-J2
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 01:35:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E755BB81BE5;
 Wed, 18 May 2022 01:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F08C385B8;
 Wed, 18 May 2022 01:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652837724;
 bh=eejmgDeuegMldE1NuLPI6JWdYtBkX+d0FP7BFTmWlno=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LeX6/giq7LE48APMFpUdl5WeU82P9kRhmyYa9J5KgwWOFBsULnsJMkZ35rvTmPPKv
 D5UUk2mHJzCycYNiVoT/nl3Mj4YbF3G3sQ9yxfFe/ww8com89z+gJhVb4vhL1j4136
 cMdGPjf0QjM92lCyQCKVarQIrNPOxRgedQKSvnXix6LpUp5HpJImdHDhwt7/+YsYfm
 hjh7i6RRDgcle8sO7nnPM97yyxxQfKupusd5SI5YW+aTpLu7i8UemyPCh1AiOpyIh0
 axsPK4eTnF5y7NFeglnXSeU4/wzr1hn9+lY/FRl4ecOWjLqi7MmY2LHqBeTkxHEuqQ
 ysp4oWZM219+w==
Date: Tue, 17 May 2022 18:35:22 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 05/15] net: ethernet: mtk_eth_soc: rely on
 txd_size in mtk_tx_alloc/mtk_tx_clean
Message-ID: <20220517183522.4a585885@kernel.org>
In-Reply-To: <c5228daa3d277cd71a134a1062525bc19b34fa2f.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <c5228daa3d277cd71a134a1062525bc19b34fa2f.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_183527_820843_C23304D8 
X-CRM114-Status: GOOD (  10.65  )
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

On Mon, 16 May 2022 18:06:32 +0200 Lorenzo Bianconi wrote:
>  static int mtk_tx_alloc(struct mtk_eth *eth)
>  {
> +	const struct mtk_soc_data *soc = eth->soc;
>  	struct mtk_tx_ring *ring = &eth->tx_ring;
> -	int i, sz = sizeof(*ring->dma);

The change would be smaller if you left sz in place. 
I guess you have a reason not to?

> +	struct mtk_tx_dma *txd;
> +	int i;
>  
>  	ring->buf = kcalloc(MTK_DMA_SIZE, sizeof(*ring->buf),
>  			       GFP_KERNEL);
>  	if (!ring->buf)
>  		goto no_tx_mem;
>  
> -	ring->dma = dma_alloc_coherent(eth->dma_dev, MTK_DMA_SIZE * sz,
> +	ring->dma = dma_alloc_coherent(eth->dma_dev,
> +				       MTK_DMA_SIZE * soc->txrx.txd_size,
>  				       &ring->phys, GFP_ATOMIC);

Another GFP nugget.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
