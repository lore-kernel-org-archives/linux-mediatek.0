Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C369EE49A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 19 Aug 2023 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHh3Iz9IDJHfKVjgb0UAiqOD3m9T6ZnBLnJtODOw/lc=; b=h/VuFWYMlOSToLYnuCvz3soHzk
	vD0qSeg3nElaQFqTLw1+GNV5JeDhpJIEWtyWzDm9ogdoqHKIMVEhP6+D9LDnzCIsuEf4E3DlLcSXJ
	xYK9vvYcuaJU1joJVj085+gUq14sUUXGawlOEFab/Sue4S5zavakF8V91zK7ChQXvei178hjw/Jze
	Pluh3POY/9DehRNbGmWz8jbbDc5wxibUu/I48w44pSy2oWOKyYQlcWJzf0s5s+2X5uV7TKPCcZRsZ
	sAVoQdK/Pjm6Q4K4eeg328blHBwrpJC8cwWH+Loo1iEoghbEV9+ZWnsyLjQsZaZANuWuVuodPnaVA
	Ero5sJJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXN8i-00AyWK-1v;
	Sat, 19 Aug 2023 14:41:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXN8e-00AyVf-2H;
	Sat, 19 Aug 2023 14:41:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3F0FE6181B;
	Sat, 19 Aug 2023 14:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5515C433C9;
	Sat, 19 Aug 2023 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692456074;
	bh=s/6tz1ntVu9WHcizXMkOFm+PqgGopb/sQCUQJgN/UCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RspyVU2C22Gq4717Y75wZ72mw3oilJhDHzF06iNK7vIzIfhkYMC9p3Dl2ictYYcGa
	 Pj8PGuyGFy+ibtb5heSsWapbk8AbmxSkJ/Fb25XVQm55KTGpkxvLPHyOwNeie2tePw
	 rNelyoxgP6jWnHQTvbhRRuyGSALKNez1mGv3j1bmC6xO0dfxZe3YOmraEBSqzLGaoe
	 UVJga9KYMG5ebcm3/1WhLNmrUBt4GplifCR1HcJrkbK8VnZ84veRbtuyXqi1rESuDx
	 Dxu/jLbp8ezbIPP154mbSd6uPmD60Mnbv9OQeXKGBSL4dQqbN592FuHAdql9b58/9g
	 3FaXaeINNMAsQ==
Date: Sat, 19 Aug 2023 16:41:09 +0200
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
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
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: add reset bits for MT7988
Message-ID: <ZODUhbw9SDOifv49@vergenet.net>
References: <b983a3adf5184a30e4ce620fbbf028c9c76648ae.1692382239.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b983a3adf5184a30e4ce620fbbf028c9c76648ae.1692382239.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230819_074116_849540_E4167A88 
X-CRM114-Status: GOOD (  21.29  )
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

On Fri, Aug 18, 2023 at 07:15:24PM +0100, Daniel Golle wrote:
> Add bits needed to reset the frame engine on MT7988.
> 
> Fixes: 445eb6448ed3 ("net: ethernet: mtk_eth_soc: add basic support for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 76 +++++++++++++++------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 11 ++-
>  2 files changed, 64 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index fe05c90202699..2482f47313085 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3613,19 +3613,34 @@ static void mtk_hw_reset(struct mtk_eth *eth)
>  {
>  	u32 val;
>  
> -	if (mtk_is_netsys_v2_or_greater(eth)) {
> +	if (mtk_is_netsys_v2_or_greater(eth))
>  		regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN, 0);
> +
> +	if (mtk_is_netsys_v3_or_greater(eth)) {
> +		val = RSTCTRL_PPE0_V3;
> +
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
> +			val |= RSTCTRL_PPE1_V3;
> +
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
> +			val |= RSTCTRL_PPE2;
> +
> +		val |= RSTCTRL_WDMA0 | RSTCTRL_WDMA1 | RSTCTRL_WDMA2;
> +	} else if (mtk_is_netsys_v2_or_greater(eth)) {
>  		val = RSTCTRL_PPE0_V2;
> +
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
> +			val |= RSTCTRL_PPE1;
>  	} else {
>  		val = RSTCTRL_PPE0;
>  	}
>  
> -	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
> -		val |= RSTCTRL_PPE1;
> -
>  	ethsys_reset(eth, RSTCTRL_ETH | RSTCTRL_FE | val);
>  
> -	if (mtk_is_netsys_v2_or_greater(eth))
> +	if (mtk_is_netsys_v3_or_greater(eth))
> +		regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN,
> +			     0x6f8ff);
> +	else if (mtk_is_netsys_v2_or_greater(eth))
>  		regmap_write(eth->ethsys, ETHSYS_FE_RST_CHK_IDLE_EN,
>  			     0x3ffffff);
>  }
> @@ -3651,13 +3666,21 @@ static void mtk_hw_warm_reset(struct mtk_eth *eth)
>  		return;
>  	}
>  
> -	if (mtk_is_netsys_v2_or_greater(eth))
> +	if (mtk_is_netsys_v3_or_greater(eth)) {
> +		rst_mask = RSTCTRL_ETH | RSTCTRL_PPE0_V3;
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
> +			rst_mask |= RSTCTRL_PPE1_V3;
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE2))
> +			rst_mask |= RSTCTRL_PPE2;
> +
> +		rst_mask |= RSTCTRL_WDMA0 | RSTCTRL_WDMA1 | RSTCTRL_WDMA2;
> +	} else if (mtk_is_netsys_v2_or_greater(eth)) {
>  		rst_mask = RSTCTRL_ETH | RSTCTRL_PPE0_V2;
> -	else
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
> +			rst_mask |= RSTCTRL_PPE1;
> +	} else {
>  		rst_mask = RSTCTRL_ETH | RSTCTRL_PPE0;
> -
> -	if (MTK_HAS_CAPS(eth->soc->caps, MTK_RSTCTRL_PPE1))
> -		rst_mask |= RSTCTRL_PPE1;
> +	}
>  
>  	regmap_update_bits(eth->ethsys, ETHSYS_RSTCTRL, rst_mask, rst_mask);
>  

Hi Daniel,

The bits set by the code in the above two hunks seem both complex
and similar. At the risk of suggesting excessive complexity,
I do wonder if they can be consolidated somehow.

Maybe the approach you have taken is best as a fix for net.
But a follow-up could be considered for net-next.
Just an idea.

...


