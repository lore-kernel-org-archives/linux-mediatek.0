Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0562C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V35iUww6zFkKE+OpCGxX9gUSnt69guR/bKChcyFwsnM=; b=nRAkmmcrdJZu5P
	d+DhAQ5jl3n9be3bSLEVBz8/RlMsnQMwfvTzY70sVn7GEJjrP0eGRH2NG98HBy5qCWy12WqRFT33V
	I+D1xuZpd48IaJC1sWjNLT/9bDxl8xHxcfXod9ObVG/gT7vNRx+KdxqCfToE5ijcsObPDo8rMimaL
	bSyFdws2Ajnx9Nw0FNFEBTpl5e1qqARmynwRYdCEOKxsllKGDtuO9uE3UIp8OpvYO2BX3Y/gzkDnR
	ip7I5LyGqd1+dz7Zbx+5u6NT6Dc+5I2fMszea7uAe+QzQ0VU3b0T7joCapHDftZf4iYfXZQzqkcCz
	qvWa+YogGTDy3PqNeN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8f7-00GbiM-Fe; Wed, 18 May 2022 01:39:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8f5-00Gbhj-3g
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 01:39:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7828615EB;
 Wed, 18 May 2022 01:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAA06C385B8;
 Wed, 18 May 2022 01:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652837977;
 bh=iMqRtnzqU/EqtFUtJsABiZAWBZ8H3DWHwaJYTCqmoPc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LYOthdjMsguNHDhpDllew202sUBsqem6OyOS0GbrCWnonf6K9Uu3C5pW8tyRvPoZx
 B/TzqSn/pnBhzxNNZrJcBHCb6ApXgiXmA0OOf4XGdOKkOKe4N6YWB2yjzhE95brDGs
 0M1uGPByWA1hshbo13QZKkoSVYBqWcH16MStA+a84RzqF1zBz38mfXrhNewnCOmJdi
 yDLAZdneJu4rIVuLNPvUFNgaOMW0YI0BcUksuYpMOfPfovhfxd/GO1+BFqxhc0Nn+x
 Rkxo1XlvzWeejnobHRxSDk675iISLzRXgJSqSVdXxd7HCJP3ike8ostVQsuqUbJcZ8
 VKhTWnGH76wtw==
Date: Tue, 17 May 2022 18:39:35 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 10/15] net: ethernet: mtk_eth_soc: rely on
 rxd_size field in mtk_rx_alloc/mtk_rx_clean
Message-ID: <20220517183935.6863ddc7@kernel.org>
In-Reply-To: <eca56ab1af7f4bbedc4a6d0990a10ff58911d842.1652716741.git.lorenzo@kernel.org>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <eca56ab1af7f4bbedc4a6d0990a10ff58911d842.1652716741.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_183939_234917_FE214DC1 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Mon, 16 May 2022 18:06:37 +0200 Lorenzo Bianconi wrote:
> +
> +		rxd = (void *)ring->dma + i * eth->soc->txrx.rxd_size;
> +		rxd->rxd1 = (unsigned int)dma_addr;
>  
>  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
> -			ring->dma[i].rxd2 = RX_DMA_LSO;
> +			rxd->rxd2 = RX_DMA_LSO;
>  		else
> -			ring->dma[i].rxd2 = RX_DMA_PLEN0(ring->buf_size);
> +			rxd->rxd2 = RX_DMA_PLEN0(ring->buf_size);
> +
> +		rxd->rxd3 = 0;
> +		rxd->rxd4 = 0;

The clearing of rxd3/rxd4 should probably have been mentioned in the
commit message. It does not seem related to descriptor size.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
