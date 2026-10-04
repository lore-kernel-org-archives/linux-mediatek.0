Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8C5CA5FCE
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Oct 2026 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ihd+dofvU6Mcgj3MdWdld4bUs480ZOkVZ8XCTiohnu8=; b=OSktHsDY/WqqUZRbh0eIhjOuWh
	IK/QCMA+roCVXxBZOb6SCMXoDvP5aSvhkU/kxRvLVkrqf4l8qhuWU0J5LHHVxq6g8gtt+poi7wVLr
	jz75VY2CRTZmRXXhfTJ0DrFff2XM5+v18X1cTy+dr2xrjXFB+IyXbmUdu84C6CkV4hucV1mLQFDXm
	CFwF/ZCrnSgWqCGOfPEyJQIbr8RMY0SEr/tGoOfAUqC7n4q4Mw5c221Jfiip1mIABvJCl1a9fnyDx
	f+TzQNvEjS0/SP/JjejQ03sdjyXWhBX1HasOup07ofgFIwJ5k2LUyoR7twF0QhE5rf1IF0jw12nH5
	JA2Edcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMSo-0000000ErLX-42YG;
	Sun, 04 Oct 2026 13:41:15 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDMSi-0000000ErK0-2L1y
	for linux-mediatek@lists.infradead.org;
	Sun, 04 Oct 2026 13:41:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 83BF54E4115A;
	Sun,  4 Oct 2026 13:41:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 29736604FE;
	Sun,  4 Oct 2026 13:41:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2A72C1032817F;
	Sun,  4 Oct 2026 15:40:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791121263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Ihd+dofvU6Mcgj3MdWdld4bUs480ZOkVZ8XCTiohnu8=;
	b=NvJQmWY6oV3Ja8xANIq3B3P9pcEN+tee1cqds4XePR5AAnzLOaknyImx+sZw2QP9RrlXLL
	eHpb9Q6y8Qr3aXJXh6klwYhtolMHCP/1xooHI/SZXhaBSs9O14zhoWt1KBOvYa5aGJyZAt
	ypm/zMhH98KMkIWI4HKqQWRMz6NE3D1apdac1VRIoszUyE8Iaz30wjhq8UqZACrqPekFTg
	CnBgGke4wA6VzRxfbOBuPy6jFZGwQjmPCX8usxGOlLV9F34mKppDxW5zsU9wkxnJfRTYjF
	VcV9c4vtzdMC3s6ZpMKmKAHHk0XGLfT8HIIXKckonFsxD8tXPqvwsrAZNQClLg==
Message-ID: <c76a27fd-4131-4a4d-a832-de96e0006a55@bootlin.com>
Date: Sun, 4 Oct 2026 15:40:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/7] net: stmmac: mediatek: add RX/TX delay
 stage divider in platform data
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Biao Huang <biao.huang@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260924-dwmac-mediatek-mt8189-v2-0-430bd74d5ef9@collabora.com>
 <20260924-dwmac-mediatek-mt8189-v2-3-430bd74d5ef9@collabora.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260924-dwmac-mediatek-mt8189-v2-3-430bd74d5ef9@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_064111_478157_A0263984 
X-CRM114-Status: GOOD (  15.36  )
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

Hi,

On 9/24/26 09:23, Louis-Alexis Eyraud wrote:
> In preparation of newer SoC support, that have like MT8189 SoC
> different RX and TX internal delay stage steps than MT8188/MT8195, add
> the RX and TX delay stage divider values in the variant platform data
> and replace the hardcoded value use in mt8195_set_delay.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index f7eb85110df0..1c532cc3a975 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -100,6 +100,8 @@ struct mediatek_dwmac_variant {
>  
>  	u32 rx_delay_max;
>  	u32 tx_delay_max;
> +	u16 rx_delay_stage_div;
> +	u16 tx_delay_stage_div;
>  	u8 dma_bit_mask;
>  };
>  
> @@ -300,13 +302,25 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
>  
>  static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
>  {
> +	u16 rx_delay_stage_div = plat->variant->rx_delay_stage_div;
> +	u16 tx_delay_stage_div = plat->variant->tx_delay_stage_div;
>  	struct mac_delay_struct *mac_delay = &plat->mac_delay;
> -	u32 rx_delay_stage_val = mac_delay->rx_delay / MT8195_DLY_RXC_STAGE_DIV;
> -	u32 tx_delay_stage_val = mac_delay->tx_delay / MT8195_DLY_TXC_STAGE_DIV;
> +	u32 rx_delay_stage_val;
> +	u32 tx_delay_stage_val;
>  	u32 gtxc_delay_val = 0;
>  	u32 rmii_delay_val = 0;
>  	u32 delay_val = 0;
>  
> +	if (rx_delay_stage_div)
> +		rx_delay_stage_val = mac_delay->rx_delay / rx_delay_stage_div;
> +	else
> +		rx_delay_stage_val = 0;
> +
> +	if (tx_delay_stage_div)
> +		tx_delay_stage_val = mac_delay->tx_delay / tx_delay_stage_div;
> +	else
> +		tx_delay_stage_val = 0;
> +
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
>  		delay_val |= FIELD_PREP(MT8195_DLY_TXC_ENABLE,
> @@ -415,6 +429,8 @@ static const struct mediatek_dwmac_variant mt8195_gmac_variant = {
>  	.num_clks = ARRAY_SIZE(mt8195_dwmac_clk_l),
>  	.rx_delay_max = MT8195_DLY_RXC_MAX,
>  	.tx_delay_max = MT8195_DLY_TXC_MAX,
> +	.rx_delay_stage_div = MT8195_DLY_RXC_STAGE_DIV,
> +	.tx_delay_stage_div = MT8195_DLY_TXC_STAGE_DIV,
>  	.dma_bit_mask = 35,
>  };
>  
> 


