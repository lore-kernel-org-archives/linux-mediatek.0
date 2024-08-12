Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27400C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uWo/MphiHWyccu2bEjsz1ygQNBtQClBlLF8ArbcDKQ=; b=Giph7lgc+iAgnvp6USV7zHFdA0
	vHmLR2EvdEHSnDCUHLQTpprM1byaKtd1uGwilBkeyZ1EZg4vIYK9H7zGkoOv9Nr6TjlYjme6aUQUr
	XHnFpBrHazyVqCFiSvUEPdkmyZM4HZWDUfR3ZPN6b1xxaR/EoHdYG2kBBJ6Vf+ITusZD8nlpy/EWz
	t9+9oF5TO/c4RCSgYyXqORg0m2c99PH2Y+4gr1+qNVSldMXnxmxoBba467rBlaydxltsbPl6MkXaQ
	cqGM1Yb7eoRbw/YT4QQzxplP7MMz03pTVilug/dtWkKh3ARvco20mFREg0Ba2FgWNSJuUIpQtM3wr
	3uOaX7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdX3D-00000000l88-28RW;
	Mon, 12 Aug 2024 15:33:39 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdX2b-00000000kxp-0jQh;
	Mon, 12 Aug 2024 15:33:02 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1sdX2I-000000000SJ-1aqJ;
	Mon, 12 Aug 2024 15:32:42 +0000
Date: Mon, 12 Aug 2024 16:32:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Lin <chen45464546@163.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2] net: ethernet: mtk_eth_soc: fix memory leak in
 LRO rings release
Message-ID: <ZrorEoWOoe8inWcx@makrotopia.org>
References: <20240812152126.14598-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240812152126.14598-1-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_083301_232778_F692A6A7 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Aug 12, 2024 at 06:21:19PM +0300, Elad Yifee wrote:
> For LRO we allocate more than one page, yet 'skb_free_frag' is used
> to free the buffer, which only frees a single page.
> Fix it by using 'free_pages' instead.
> 
> Fixes: 2f2c0d2919a1 ("net: ethernet: mtk_eth_soc: fix misuse of mem alloc interface netdev[napi]_alloc_frag")
> Signed-off-by: Elad Yifee <eladwf@gmail.com>
> ---
> v2: fixed compilation warnings
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 16ca427cf4c3..e25b552d70f7 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1762,8 +1762,10 @@ static void mtk_rx_put_buff(struct mtk_rx_ring *ring, void *data, bool napi)
>  	if (ring->page_pool)
>  		page_pool_put_full_page(ring->page_pool,
>  					virt_to_head_page(data), napi);
> -	else
> +	else if (ring->frag_size <= PAGE_SIZE)
>  		skb_free_frag(data);
> +	else
> +		free_pages(unsigned long)data, get_order(mtk_max_frag_size(ring->frag_size)));
You miss on open '(' there. Won't even compile like that.
Please always compile- and run-time test patches before sending them
to the mailing list.

>  }
>  
>  static int mtk_xdp_frame_map(struct mtk_eth *eth, struct net_device *dev,
> @@ -2132,7 +2134,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  				ring->buf_size, DMA_FROM_DEVICE);
>  			if (unlikely(dma_mapping_error(eth->dma_dev,
>  						       dma_addr))) {
> -				skb_free_frag(new_data);
> +				mtk_rx_put_buff(ring, new_data, true);
>  				netdev->stats.rx_dropped++;
>  				goto release_desc;
>  			}
> @@ -2146,7 +2148,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  			skb = build_skb(data, ring->frag_size);
>  			if (unlikely(!skb)) {
>  				netdev->stats.rx_dropped++;
> -				skb_free_frag(data);
> +				mtk_rx_put_buff(ring, data, true);
>  				goto skip_rx;
>  			}
>  
> @@ -2691,7 +2693,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>  				ring->buf_size, DMA_FROM_DEVICE);
>  			if (unlikely(dma_mapping_error(eth->dma_dev,
>  						       dma_addr))) {
> -				skb_free_frag(data);
> +				mtk_rx_put_buff(ring, data, false);
>  				return -ENOMEM;
>  			}
>  		}
> -- 
> 2.45.2
> 

