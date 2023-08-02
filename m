Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C45C04A6A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Aug 2023 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dvN0dntlvH62YuWcd8eiE2DcoLjqV2r9ezrojHA7eH4=; b=oPzWHWR805bdH1/PUmrP15awJZ
	B4YlNujvQEHB7mA1TouX8qcKgZX6GUukPxAw19uMv1J/eYLtDMtLz5gK2ro937NtfqGTtNCyQjs98
	Qw5YFXEScUmQBziBDOMEylOBM1o7J+KhvgWKznlWxJfUfTMvC74aTko2BmCcz0nRt4HZ5xYb/NQqV
	Tahd9JSvfVHVzNSAZN+82e+5V2WPaEKIgBaajAo19knZQHLk+DSvLWDODS5e+Cbe6mcFbaXFhBhuj
	sSnrJeH2ShpaUQq9mnvnrP0zX5ztJNM5skTElu3mJ2i9n/qZMXwjm5Tj9k65yP3aTXsqnR0tLDX4L
	dgL/ying==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDxa-005G2V-0e;
	Wed, 02 Aug 2023 15:40:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDxW-005G1i-2k;
	Wed, 02 Aug 2023 15:40:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4EFD361A10;
	Wed,  2 Aug 2023 15:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9535EC433C8;
	Wed,  2 Aug 2023 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690990821;
	bh=rhjbjV8sZ1peSZbXxFnvc17eLjF68P5s32OkLyh/sV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j35hkY5efxTYJI8k0ZpmxUBMnt7mxR6nPTCvfYI7+/094fGf5LfgGwIBvFs4B38GK
	 RDT8sa0ja+ikQ0NisRFWq4wur0SENZ+oF3HQYGAWStF5TjZISF9qyhOK5nZzmxZac2
	 n3rjUK1noMGltxU1VdjaJAGTnj/Br3t46tfAKDX4tS4x0hr6lHxyZLsRy9N1zf4UZa
	 7kMX6fcc/UgS/S4VilqNEZv+9RikXtClqQnRkEakFKWCo5B9fBmQ5jXHlif/3OOApq
	 aBqdlJ8TqE4Y9+vl6CtmCr5TNiqfEeYY/LNV9CxGKR6hZHcTjalOnqxmZ3bgOVfqB8
	 shC6SoUuLN7sw==
Date: Wed, 2 Aug 2023 17:40:16 +0200
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Larysa Zaremba <larysa.zaremba@intel.com>
Subject: Re: [PATCH net-next v3] net: ethernet: mtk_eth_soc: support per-flow
 accounting on MT7988
Message-ID: <ZMp44GXm6QKG21+u@kernel.org>
References: <37a0928fa8c1253b197884c68ce1f54239421ac5.1690946442.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37a0928fa8c1253b197884c68ce1f54239421ac5.1690946442.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_084022_982427_82FF2782 
X-CRM114-Status: GOOD (  24.09  )
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

+ Larysa Zaremba

On Wed, Aug 02, 2023 at 04:31:09AM +0100, Daniel Golle wrote:
> NETSYS_V3 uses 64 bits for each counters while older SoCs are using
> 48/40 bits for each counter.
> Support reading per-flow byte and package counters on NETSYS_V3.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Hi Daniel,

I think you missed Larysa's Reviewed-by tag from v2.

In any case, this looks good to me.

Reviewed-by: Simon Horman <horms@kernel.org>

> ---
> v3: correct calculation, local variables
> v2: fix typo bytes_cnt_* -> byte_cnt_*
> 
> drivers/net/ethernet/mediatek/mtk_eth_soc.c  |  1 +
>  drivers/net/ethernet/mediatek/mtk_ppe.c      | 21 +++++++++++++-------
>  drivers/net/ethernet/mediatek/mtk_ppe_regs.h |  2 ++
>  3 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 05be702f19c5..1b89f800f6df 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -5064,6 +5064,7 @@ static const struct mtk_soc_data mt7988_data = {
>  	.version = 3,
>  	.offload_version = 2,
>  	.hash_offset = 4,
> +	.has_accounting = true,
>  	.foe_entry_size = MTK_FOE_ENTRY_V3_SIZE,
>  	.txrx = {
>  		.txd_size = sizeof(struct mtk_tx_dma_v2),
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe.c b/drivers/net/ethernet/mediatek/mtk_ppe.c
> index bf1ecb0c1c10..973370c3cb51 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe.c
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe.c
> @@ -92,7 +92,6 @@ static int mtk_ppe_mib_wait_busy(struct mtk_ppe *ppe)
>  
>  static int mtk_mib_entry_read(struct mtk_ppe *ppe, u16 index, u64 *bytes, u64 *packets)
>  {
> -	u32 byte_cnt_low, byte_cnt_high, pkt_cnt_low, pkt_cnt_high;
>  	u32 val, cnt_r0, cnt_r1, cnt_r2;
>  	int ret;
>  
> @@ -107,12 +106,20 @@ static int mtk_mib_entry_read(struct mtk_ppe *ppe, u16 index, u64 *bytes, u64 *p
>  	cnt_r1 = readl(ppe->base + MTK_PPE_MIB_SER_R1);
>  	cnt_r2 = readl(ppe->base + MTK_PPE_MIB_SER_R2);
>  
> -	byte_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R0_BYTE_CNT_LOW, cnt_r0);
> -	byte_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R1_BYTE_CNT_HIGH, cnt_r1);
> -	pkt_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R1_PKT_CNT_LOW, cnt_r1);
> -	pkt_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH, cnt_r2);
> -	*bytes = ((u64)byte_cnt_high << 32) | byte_cnt_low;
> -	*packets = (pkt_cnt_high << 16) | pkt_cnt_low;
> +	if (mtk_is_netsys_v3_or_greater(ppe->eth)) {
> +		/* 64 bit for each counter */
> +		u32 cnt_r3 = readl(ppe->base + MTK_PPE_MIB_SER_R3);
> +		*bytes = ((u64)cnt_r1 << 32) | cnt_r0;
> +		*packets = ((u64)cnt_r3 << 32) | cnt_r2;
> +	} else {
> +		/* 48 bit byte counter, 40 bit packet counter */
> +		u32 byte_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R0_BYTE_CNT_LOW, cnt_r0);
> +		u32 byte_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R1_BYTE_CNT_HIGH, cnt_r1);
> +		u32 pkt_cnt_low = FIELD_GET(MTK_PPE_MIB_SER_R1_PKT_CNT_LOW, cnt_r1);
> +		u32 pkt_cnt_high = FIELD_GET(MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH, cnt_r2);
> +		*bytes = ((u64)byte_cnt_high << 32) | byte_cnt_low;
> +		*packets = ((u64)pkt_cnt_high << 16) | pkt_cnt_low;
> +	}
>  
>  	return 0;
>  }
> diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_regs.h b/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
> index a2e61b3eb006..3ce088eef0ef 100644
> --- a/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
> +++ b/drivers/net/ethernet/mediatek/mtk_ppe_regs.h
> @@ -163,6 +163,8 @@ enum {
>  #define MTK_PPE_MIB_SER_R2			0x348
>  #define MTK_PPE_MIB_SER_R2_PKT_CNT_HIGH		GENMASK(23, 0)
>  
> +#define MTK_PPE_MIB_SER_R3			0x34c
> +
>  #define MTK_PPE_MIB_CACHE_CTL			0x350
>  #define MTK_PPE_MIB_CACHE_CTL_EN		BIT(0)
>  #define MTK_PPE_MIB_CACHE_CTL_FLUSH		BIT(2)
> -- 
> 2.41.0
> 
> 

