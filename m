Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13CEC4829E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 00:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N0M3vlKgD3SZyqZ71tUL/aZqIFHzAsym3l7hB6fqaZY=; b=Ut8Tu8scuZiDz4a4qduAfqqbZx
	wMnvw/sMw2CdpnRd/2x+/V6dUhDvqWnylYhrdC9dL7AgySX9bvQSqvNC3XpKuU8q63ZvsikfNLMwu
	7Y+F0FHhsPaLJ0/MbyHxRfpGulh0MmQM/olswzb3EFuq+jvkTfTi2VzxJODwq6HKYxn0lVDnOw4oU
	mb1Q0JjIF8sSDQ/vTvfxQp9/4MYfa5bPqXWM73i63CwK3vcgE9U7mbJ09vpUqCzhK/kryr2RqdAsD
	5ArCOEX7uCgP1IwDeg1/suyMCuF8rwg6oOgEnRMawQGTYuuzLLYvuNgj5ACRL/kKK5tFV2+SqsJT8
	s9a+OB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgZV-00000007NwW-1VsO;
	Tue, 13 Feb 2024 00:22:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgZS-00000007NvQ-1GHX;
	Tue, 13 Feb 2024 00:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6A6F611EE;
	Tue, 13 Feb 2024 00:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF312C43399;
	Tue, 13 Feb 2024 00:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707783765;
	bh=TuTEr8omUxfqM1O8DocELWTt9yAKpzvpGXNjHsPxxuc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O5jKDBM0g7YIMdQomXfz1EQQYXPp37dpkB4EONhCwaIyb0zjxJCTGjHrZ/5TroElx
	 Bzp0e5kFbTmwK6t28wyoWt/fBp7Fixsbd6mWPSWid2Ore7tNbIwlNE7YT57QPQPzXM
	 PZadVo5wKMlLuZTowenZP9hVkjfSqkcgCaESHfYXE7OlUXW66va3IUrGWFZd5cyM7T
	 TIhWZx1SwFIgqa7Zo8rVTtomiFD7xJcdpfFm9ZXlH8pa9VIqtVWY7YWKYbOBUAECyR
	 F8yL2UCW4RJ+hOggfVngUXf+prjvJuhXRGRQ0i6e1IkrNFRxAxeq6az9LQtZ+sawD8
	 fMSgyCqhGKuEw==
Date: Mon, 12 Feb 2024 16:22:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3] net: ethernet: mtk_eth_soc: ppe: add
 support for multiple PPEs
Message-ID: <20240212162244.3c011072@kernel.org>
In-Reply-To: <20240210135620.28368-1-eladwf@gmail.com>
References: <Zcdtb-eyvxzX9yPe@makrotopia.org>
	<20240210135620.28368-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_162246_418471_43470313 
X-CRM114-Status: GOOD (  17.89  )
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

On Sat, 10 Feb 2024 15:56:07 +0200 Elad Yifee wrote:
> Add the missing pieces to allow multiple PPEs units, one for each GMAC.
> mtk_gdm_config has been modified to work on targted mac ID,
> the inner loop moved outside of the function to allow unrelated
> operations like setting the MAC's PPE index.

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index a6e91573f8da..5d5cf73a5d5a 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2010,6 +2010,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  	struct mtk_rx_dma_v2 *rxd, trxd;
>  	int done = 0, bytes = 0;
>  	dma_addr_t dma_addr = DMA_MAPPING_ERROR;
> +	u8 ppe_index = 0;

Please don't use u8 for basic on-stack variables unless it matches some
HW field which is 8b.

> @@ -3358,6 +3350,8 @@ static int mtk_open(struct net_device *dev)
>  	struct mtk_mac *mac = netdev_priv(dev);
>  	struct mtk_eth *eth = mac->hw;
>  	int i, err;
> +	struct mtk_mac *target_mac;
> +	const u8 ppe_num = mtk_get_ppe_num(eth);

nit: Please order variable decl lines longest to shortest.
If the order breaks init, you should move the init to the body.

It's a bit unclear what the difference between ppe_num, num_ppe and
ppe_index, id and ppe_idx are. It'd be good to increase the naming
consistency.

> @@ -1311,6 +1313,7 @@ struct mtk_eth {
>  struct mtk_mac {
>  	int				id;
>  	phy_interface_t			interface;
> +	u8			ppe_idx;

this looks misaligned

>  	int				speed;
>  	struct device_node		*of_node;
>  	struct phylink			*phylink;

When you repost please do not reply in the same thread.
Start a new one. 

https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#resending-after-review

-- 
pw-bot: cr

