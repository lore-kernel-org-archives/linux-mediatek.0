Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF49C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzwk+pGmNPsn+qgVvLn8h37NslvYlVHQSekvcEMNHZM=; b=q3OAD0t1gsxjT+Ttih45C+LkWS
	kj38a6HzXTk9ABGl0GHMkMRJx0YcGQxotYuWalUmaSE35Z0fQMv1Er0seEIEySmgAfdw12pONEDSG
	0oFhSj0GobFmUPiAVqTsMNIviYUdeyGG8WCBpIdFa+Kg7EGYjPq+HybjO7laMh4NWX8dblDyy861l
	kc21fzq8nwERYdlQz3IWgOr8Q5GdzHvuDTw6yhTiUr9DBHIP7DdlGQ0dsCZDxBEwxgpxeOzARfsht
	hSPOP17I1RwcZ3K2jA7cujSGx9ZXpy67BYvqw2H4T6GOr9W8pFQiRC1cd4ZjFGjsN+wfTkCiKru4F
	KtjdsORA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PPE-00EWoB-Lo; Mon, 17 Jan 2022 10:38:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PP1-00EWko-QE; Mon, 17 Jan 2022 10:38:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AA09C1F437BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642415898;
 bh=jqiDzA7U4dHZTbnAE4kudgIyEogo59g2smc2wtyjBCQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Q6wzCvc9qE0otYn2eiO7z1qOqwYBxHD2hj+a9xD+ZDbEhnoPnsww9q5sCVT0Ri90b
 +awd9SB778AgeVBUFaDcC2d0vYHLTDNlR6B3P2Qs40ImprpGrZj8dfJigFwyVREDlB
 g+YfVxD6EYxW0Q5gDY/5uEiedsqHf6Tg+ke3OIAPMgmjecb6RHfPaUpW/BjD0FrJXH
 c3nEvZFMef538HdXkXk6pHUNI0NdpJsV6hl8eGnrD32iqbvqg+2UjZgGn90oO/QuXf
 iX2yVyXjgpyM+Z8D6uzegZMrImvaYVEwywN/L9gHGyuYDgS96jvjZKHOkElscpyKyC
 wR3X2XAYjOkoQ==
Subject: Re: [PATCH net-next v12 3/7] stmmac: dwmac-mediatek: re-arrange clock
 setting
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com, dkirjanov@suse.de
References: <20220117070706.17853-1-biao.huang@mediatek.com>
 <20220117070706.17853-4-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <2c62f337-5eb4-e525-7e3a-289435315c09@collabora.com>
Date: Mon, 17 Jan 2022 11:38:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220117070706.17853-4-biao.huang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_023820_023989_03452474 
X-CRM114-Status: GOOD (  17.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/01/22 08:07, Biao Huang ha scritto:
> The rmii_internal clock is needed only when PHY
> interface is RMII, and reference clock is from MAC.
> 
> Re-arrange the clock setting as following:
> 1. the optional "rmii_internal" is controlled by devm_clk_get(),
> 2. other clocks still be configured by devm_clk_bulk_get().
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 72 +++++++++++++------
>   1 file changed, 49 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 8747aa4403e8..2678d2deb26a 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -49,14 +49,15 @@ struct mac_delay_struct {
>   struct mediatek_dwmac_plat_data {
>   	const struct mediatek_dwmac_variant *variant;
>   	struct mac_delay_struct mac_delay;
> +	struct clk *rmii_internal_clk;
>   	struct clk_bulk_data *clks;
> -	struct device_node *np;
>   	struct regmap *peri_regmap;
> +	struct device_node *np;
>   	struct device *dev;
>   	phy_interface_t phy_mode;
> -	int num_clks_to_config;
>   	bool rmii_clk_from_mac;
>   	bool rmii_rxc;
> +	int num_clks;

I don't see any need to get a num_clks here, at this point: since all functions
reading this are getting passed a pointer to this entire structure, you can
simply always access plat->variant->num_clks.

Please, drop the addition of num_clks in this struct.

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
