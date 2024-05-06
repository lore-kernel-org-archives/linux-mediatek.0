Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206DBC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 08:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAxcIPejnSBE6TpNZrG0XPMoBerEwQ8EttmSWNAfzOc=; b=BfzqQ9nlG2GMxt3UbfTlmDYtPS
	imKsG/CIQyNSjAepJ8jFeu5pwUKNk83TW1Tue4wWFlJkFT/fMZwoRhVFp3UrqzbQLNtHrbwWF9LXn
	w4isJPWd8hBMBjK9HlNT+H+3QKFTlt6mEFo0N4WJ+D4esmH7nQVkX3UfzFRdKz+VsFumc6HrhDMi/
	zD+bDZQicYjjqIIG4b4gWa9mB616btcKD9lGqjDckFPzJjovDwluSyrfTEmPOU76GxnogHds+vudR
	HSBoec2TxHBcjHXNIiK3S4AYpyt6UsRjlJsz3cCJhNDB07lOaE1gOEy4APFrbP4a2gL25q0xTpm/2
	dUyx+Ljw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3tST-00000006acn-472b;
	Mon, 06 May 2024 08:12:25 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3tSQ-00000006aa0-2miM;
	Mon, 06 May 2024 08:12:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1s3tSB-000000004rl-38Ff;
	Mon, 06 May 2024 08:12:07 +0000
Date: Mon, 6 May 2024 09:11:59 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net 2/2] net: ethernet: mediatek: use QDMA instead of
 ADMAv2 on MT7981 and MT7986
Message-ID: <ZjiQzwWysZmDv2Hs@makrotopia.org>
References: <5f5d8880a9ec6339688828d6f33bc95e99c16d81.1714696206.git.daniel@makrotopia.org>
 <7815c0e3300563ec1d5a15d2080931461c5b2a9a.1714696206.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7815c0e3300563ec1d5a15d2080931461c5b2a9a.1714696206.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_011222_725038_54D67A31 
X-CRM114-Status: GOOD (  20.75  )
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

On Fri, May 03, 2024 at 01:32:42AM +0100, Daniel Golle wrote:
> ADMA is plagued by RX hangs which can't easily detected and happen upon
> receival of a corrupted package.
> Use QDMA just like on netsys v1 which is also still present and usable, and
> doesn't suffer from that problem.

The commit description is slightly misleading I have just been told by
MediaTek off-list. So please do not apply this patch, I will send v2
shortly.

The internal naming of the DMA implementations in MediaTek calls the DMA
at registers 0x6100 "ADMAv2" while what is found at 0x4100 is called
"ADMAv1". I will adapt the commit description of both patches
accordingly to avoid confusion.

> 
> Fixes: 197c9e9b17b11 ("net: ethernet: mtk_eth_soc: introduce support for mt7986 chipset")
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 46 ++++++++++-----------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 3eefb735ce19..d7d73295f0dc 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -110,16 +110,16 @@ static const struct mtk_reg_map mt7986_reg_map = {
>  	.tx_irq_mask		= 0x461c,
>  	.tx_irq_status		= 0x4618,
>  	.pdma = {
> -		.rx_ptr		= 0x6100,
> -		.rx_cnt_cfg	= 0x6104,
> -		.pcrx_ptr	= 0x6108,
> -		.glo_cfg	= 0x6204,
> -		.rst_idx	= 0x6208,
> -		.delay_irq	= 0x620c,
> -		.irq_status	= 0x6220,
> -		.irq_mask	= 0x6228,
> -		.adma_rx_dbg0	= 0x6238,
> -		.int_grp	= 0x6250,
> +		.rx_ptr		= 0x4100,
> +		.rx_cnt_cfg	= 0x4104,
> +		.pcrx_ptr	= 0x4108,
> +		.glo_cfg	= 0x4204,
> +		.rst_idx	= 0x4208,
> +		.delay_irq	= 0x420c,
> +		.irq_status	= 0x4220,
> +		.irq_mask	= 0x4228,
> +		.adma_rx_dbg0	= 0x4238,
> +		.int_grp	= 0x4250,
>  	},
>  	.qdma = {
>  		.qtx_cfg	= 0x4400,
> @@ -1107,7 +1107,7 @@ static bool mtk_rx_get_desc(struct mtk_eth *eth, struct mtk_rx_dma_v2 *rxd,
>  	rxd->rxd1 = READ_ONCE(dma_rxd->rxd1);
>  	rxd->rxd3 = READ_ONCE(dma_rxd->rxd3);
>  	rxd->rxd4 = READ_ONCE(dma_rxd->rxd4);
> -	if (mtk_is_netsys_v2_or_greater(eth)) {
> +	if (mtk_is_netsys_v3_or_greater(eth)) {
>  		rxd->rxd5 = READ_ONCE(dma_rxd->rxd5);
>  		rxd->rxd6 = READ_ONCE(dma_rxd->rxd6);
>  	}
> @@ -2028,7 +2028,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  			break;
>  
>  		/* find out which mac the packet come from. values start at 1 */
> -		if (mtk_is_netsys_v2_or_greater(eth)) {
> +		if (mtk_is_netsys_v3_or_greater(eth)) {
>  			u32 val = RX_DMA_GET_SPORT_V2(trxd.rxd5);
>  
>  			switch (val) {
> @@ -2140,7 +2140,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  		skb->dev = netdev;
>  		bytes += skb->len;
>  
> -		if (mtk_is_netsys_v2_or_greater(eth)) {
> +		if (mtk_is_netsys_v3_or_greater(eth)) {
>  			reason = FIELD_GET(MTK_RXD5_PPE_CPU_REASON, trxd.rxd5);
>  			hash = trxd.rxd5 & MTK_RXD5_FOE_ENTRY;
>  			if (hash != MTK_RXD5_FOE_ENTRY)
> @@ -2690,7 +2690,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>  
>  		rxd->rxd3 = 0;
>  		rxd->rxd4 = 0;
> -		if (mtk_is_netsys_v2_or_greater(eth)) {
> +		if (mtk_is_netsys_v3_or_greater(eth)) {
>  			rxd->rxd5 = 0;
>  			rxd->rxd6 = 0;
>  			rxd->rxd7 = 0;
> @@ -3893,7 +3893,7 @@ static int mtk_hw_init(struct mtk_eth *eth, bool reset)
>  	else
>  		mtk_hw_reset(eth);
>  
> -	if (mtk_is_netsys_v2_or_greater(eth)) {
> +	if (mtk_is_netsys_v3_or_greater(eth)) {
>  		/* Set FE to PDMAv2 if necessary */
>  		val = mtk_r32(eth, MTK_FE_GLO_MISC);
>  		mtk_w32(eth,  val | BIT(4), MTK_FE_GLO_MISC);
> @@ -5169,11 +5169,11 @@ static const struct mtk_soc_data mt7981_data = {
>  		.dma_len_offset = 8,
>  	},
>  	.rx = {
> -		.desc_size = sizeof(struct mtk_rx_dma_v2),
> -		.irq_done_mask = MTK_RX_DONE_INT_V2,
> +		.desc_size = sizeof(struct mtk_rx_dma),
> +		.irq_done_mask = MTK_RX_DONE_INT,
>  		.dma_l4_valid = RX_DMA_L4_VALID_V2,
> -		.dma_max_len = MTK_TX_DMA_BUF_LEN_V2,
> -		.dma_len_offset = 8,
> +		.dma_max_len = MTK_TX_DMA_BUF_LEN,
> +		.dma_len_offset = 16,
>  	},
>  };
>  
> @@ -5195,11 +5195,11 @@ static const struct mtk_soc_data mt7986_data = {
>  		.dma_len_offset = 8,
>  	},
>  	.rx = {
> -		.desc_size = sizeof(struct mtk_rx_dma_v2),
> -		.irq_done_mask = MTK_RX_DONE_INT_V2,
> +		.desc_size = sizeof(struct mtk_rx_dma),
> +		.irq_done_mask = MTK_RX_DONE_INT,
>  		.dma_l4_valid = RX_DMA_L4_VALID_V2,
> -		.dma_max_len = MTK_TX_DMA_BUF_LEN_V2,
> -		.dma_len_offset = 8,
> +		.dma_max_len = MTK_TX_DMA_BUF_LEN,
> +		.dma_len_offset = 16,
>  	},
>  };
>  
> -- 
> 2.45.0
> 

