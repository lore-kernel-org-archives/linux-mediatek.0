Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86935C5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 22:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCX66b07Eva+Uh7XkDrg4iSCZkJv0pYAjVS5PsR5X9s=; b=b3u0cVtiRLDTZS1RTn8iWl2Jj8
	nx9IJ3IIKQT3zcTOg5Z3fMkWDmLgxgqfR+kLAnRJKcKpluc3cgtGbm/s2+Jq+5jUOpwZKYpfY3g5p
	5mJNbuUKUicMSB1VLS88RIvb56alR2gzbxDhUtPRVf185yaiw9zq3wsSI99x02aQdpOO+SvlNYuIt
	NLR/mzfYoz/FPb4JmqY+aIW6AoCoPDsxB7KB4AeeMGHCUFgAHJn4L6bDwBzm3uoL9EBF/zodpfCar
	HF7fe6rjsgENXGVN4iZDr9bXNm+DpK4gvTMKeVHXFeDXhZUlxkBLTWXiApMGCcrQgujjkc7GymWzn
	RSHdc84A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgXQz-00000006p49-48I2;
	Tue, 20 Aug 2024 22:34:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgXQG-00000006oyX-0yK8;
	Tue, 20 Aug 2024 22:33:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F24760DE5;
	Tue, 20 Aug 2024 22:33:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BEDEC4AF0E;
	Tue, 20 Aug 2024 22:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724193230;
	bh=BHbIllKtNuVtHh9Ant8S7H/WA47lkz/44JR0SauUQ50=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PZ5E5JErUL76xOjwN2veBuDu13SoBwujHPxvXeX3hYYVLDlaCjRkD544yZKTyY+UE
	 8sS37eUM0fBOY/oZ8PpTwzdfCLzphIuyCdXIICWlWGx9KrOuIMp+4jYKWFJHVft8tv
	 QqbsqlR1T7dKIoF3LwKlQze08dWchIhLrPac7jU81A9i7fPgDVxf2fZJPNB6zZ+ad/
	 wW8ndqpQ5hSGJ4/uTmW7BhPrEUJ07cMICE+RNnFh3uWnij4ohH5yTE6tc+lifcnnLs
	 I8yDI8bgaQxeaIrhhf5XDqkJGoB/iYC9E5h+KNNo0ytRx8Uvyz7tXPBQx0FTr6cL6T
	 2b8xf7qVoECGw==
Date: Tue, 20 Aug 2024 15:33:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, Mark
 Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, lorenzo.bianconi83@gmail.com
Subject: Re: [PATCH net-next] net: airoha: configure hw mac address
 according to the port id
Message-ID: <20240820153349.2accb2fe@kernel.org>
In-Reply-To: <20240819-airoha-eth-wan-mac-addr-v1-1-e8d7c13b3182@kernel.org>
References: <20240819-airoha-eth-wan-mac-addr-v1-1-e8d7c13b3182@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_153352_374507_1314BE03 
X-CRM114-Status: GOOD (  13.77  )
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

On Mon, 19 Aug 2024 13:10:09 +0200 Lorenzo Bianconi wrote:
> GDM1 port on EN7581 SoC is connected to the lan dsa switch.
> GDM{2,3,4} can be used as wan port connected to an external
> phy module. Configure hw mac address registers according to the port id.
> 
> ---
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

nit: sign-off under ---

>  drivers/net/ethernet/mediatek/airoha_eth.c | 33 +++++++++++++++++++++++-------
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
> index 1fb46db0c1e9..4914565c2fac 100644
> --- a/drivers/net/ethernet/mediatek/airoha_eth.c
> +++ b/drivers/net/ethernet/mediatek/airoha_eth.c
> @@ -67,6 +67,10 @@
>  #define FE_RST_GDM3_MBI_ARB_MASK	BIT(2)
>  #define FE_RST_CORE_MASK		BIT(0)
>  
> +#define REG_FE_WAN_MAC_H		0x0030
> +#define REG_FE_WAN_MAC_LMIN		0x0034
> +#define REG_FE_WAN_MAC_LMAX		0x0038
> +
>  #define REG_FE_LAN_MAC_H		0x0040
>  #define REG_FE_LAN_MAC_LMIN		0x0044
>  #define REG_FE_LAN_MAC_LMAX		0x0048

Isn't it better to define the base address and offsets?

#define REG_FE_MAC_BASE_WAN	0x0030
#define REG_FE_MAC_BASE_LAN	0x0040
#define REG_FE_MAC_OFF_H		0x00
#define REG_FE_MAC_OFF_LMIN		0x04
#define REG_FE_MAC_OFF_LMAX		0x08

Then you only need to select the base and the rest of the code won't
have conditionals (marginally improving readability)
-- 
pw-bot: cr

