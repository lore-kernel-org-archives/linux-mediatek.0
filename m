Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6617DC25B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 00:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WflDhWuIKFSE4VI0LhJHAyqT5VpRL1lsy5EGHvWuXlA=; b=RkxxLqAc5wIIrDSLxeDWyg+QJl
	MuG1QfFMkwXRTlzSxPuzI0xJpU7tiT919AlrSYLzdq49nmrnBIjJWQfehD4m7J5lfo4uuvfYaHAPl
	d1oNhH4DS4k4KjURuz1y9j1s+tVjDGkcF/eFTGFRwBkP5ihHD65NpkfxWzFjQQSpTzyTgSBcvrvF0
	YyqE5vNV1V0Pf2OTYUDaz9HA57FYw0CrMRFPGjj8XdwDxAlEi2vsJI+qIlMkPBRc/S58vS5r8FQN5
	2JFLWHWlrhXuIgTTCZryhhSeJTgImy5zI2tW4eUG9v/h1YFsHt3RDswbD9zt2F7MaeDsur0b4TCXe
	WitvMFtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC7P0-00000002R1D-0rQ8;
	Wed, 29 May 2024 00:42:50 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC7Ow-00000002R0h-2PPV;
	Wed, 29 May 2024 00:42:47 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sC7Of-000000006rU-2SV6;
	Wed, 29 May 2024 00:42:29 +0000
Date: Wed, 29 May 2024 01:42:21 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
	Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4] net: ethernet: mtk_eth_soc: ppe: add support
 for multiple PPEs
Message-ID: <ccfm3zhrhr767qjfaw4c7mvqw7bjbb4k4lgmvcogicak5sabsq@q547dfajx5au>
References: <20240511122659.13838-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511122659.13838-1-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_174246_708127_A80C824B 
X-CRM114-Status: GOOD (  18.53  )
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

Hi Elad,

now that net-next is opened again I finally also had some time to take
a deeper look at your patch ;)

On Sat, May 11, 2024 at 03:26:53PM GMT, Elad Yifee wrote:
> Add the missing pieces to allow multiple PPEs units, one for each GMAC.
> [...]
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 179c0230655a..67e19bd25f7a 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> [...]
> @@ -1311,6 +1311,7 @@ struct mtk_eth {
>  struct mtk_mac {
>  	int				id;
>  	phy_interface_t			interface;
> +	u8						ppe_idx;

I think it would be smarter to just use
ifindex % mtk_get_ppe_num(eth)

Reasons:
 - no need for an additional field in mtk_mac
 - works for all net_device, not just mtk_eth type

>  	int				speed;
>  	struct device_node		*of_node;
>  	struct phylink			*phylink;
> @@ -1421,6 +1422,14 @@ static inline u32 mtk_get_ib2_multicast_mask(struct mtk_eth *eth)
>  	return MTK_FOE_IB2_MULTICAST;
>  }
>  
> +static inline u8 mtk_get_ppe_num(struct mtk_eth *eth)
> +{
> +	if (!eth->soc->offload_version)
> +		return 0;
> +
> +	return eth->soc->version;

Overloading the coincidentally identical hw version and number of PPEs
doesn't feel quite right. Better extend struct mtk_reg_map and turn the
gdma_to_ppe field into an array. Then the number of PPEs for a specific
SoC is the size of that array.

Reasons:
 - we already got that mtk_reg_map structure for hw abstraction, no
   need to introduce more SoC-specific macros like MTK_GDMA_TO_PPEx.
 - no need for mtk_get_ppe_num inline function, or at least no
   overloading of offload_version meaning.


Cheers


Daniel

