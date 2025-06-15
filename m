Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7660BC71135
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Jun 2025 19:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijzTqOz4h0NCLEfL0aJYMnFjP/9ya9AFzXDeu1qyoiU=; b=osyOXBehGZ+C2MCc/xy+ukQP4x
	qLNI+weCKSigiabswFN9spHTy3l9jLs/KBkn4raJZb7SPhBzN8WjWkKCrk8UUVgysJHyM42i1qGZ+
	qmGV5GLJzr5VEhTknp2AFaGqkHOcCDNL7YivDlRyEEnd26O1v37WaszyG3sv1yv153D2jcXlZfEhU
	7KmfI3fpWz75mi/JYgaMqJA4+PNvbwf8lB+HBdjwrxgCDuF2rXgtHEQkL9mid7u6utC/AtEA0SqZ5
	wk2Q3zt+0c/GGJsfN+9z9gc7FFQhKxb+TlRR6EdLfIIaoBFSxJTvO27bCoxxUVPHF6BUQpSo+1zpb
	HVgJ7rQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtPf-00000002n7O-1kBR;
	Sun, 15 Jun 2025 19:53:07 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQtNO-00000002n1y-377O;
	Sun, 15 Jun 2025 19:50:48 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uQtEf-000000002Zg-1Dyq;
	Sun, 15 Jun 2025 19:50:27 +0000
Date: Sun, 15 Jun 2025 21:49:43 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [net-next v3 3/3] net: ethernet: mtk_eth_soc: change code to
 skip first IRQ completely
Message-ID: <aE8ja1fbAtvWx2GN@pidgin.makrotopia.org>
References: <20250615150333.166202-1-linux@fw-web.de>
 <20250615150333.166202-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615150333.166202-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_125046_822891_79CE0577 
X-CRM114-Status: GOOD (  19.39  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 15, 2025 at 05:03:18PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> On SoCs without MTK_SHARED_INT capability (mt7621 + mt7628) the first
> IRQ (eth->irq[0]) was read but never used. Skip reading it now too.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 11 ++++++++---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 9aec67c9c6d7..4d7de282b940 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3346,10 +3346,15 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
>  		return 0;
>  
>  	for (i = 0; i < MTK_ETH_IRQ_MAX; i++) {
> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> -			eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
> +			if (i == 0)
> +				eth->irq[MTK_ETH_IRQ_SHARED] = platform_get_irq(pdev, i);
> +			else
> +				eth->irq[i] = eth->irq[MTK_ETH_IRQ_SHARED];
> +		} else if (i < 2)  //skip the 1st and 4th IRQ on !MTK_SHARED_INT

Please use conformant comment style, ie. do not use '//' but always use
'/* ... */' instead, on a dedicated line.

> +			eth->irq[i] = platform_get_irq(pdev, i + 1);
>  		else
> -			eth->irq[i] = platform_get_irq(pdev, i);
> +			continue;
>  
>  		if (eth->irq[i] < 0) {
>  			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 6b1208d05f79..ff2ae3c80179 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -643,8 +643,8 @@
>  #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
>  
>  #define MTK_ETH_IRQ_SHARED	0
> -#define MTK_ETH_IRQ_TX		1
> -#define MTK_ETH_IRQ_RX		2
> +#define MTK_ETH_IRQ_TX		0
> +#define MTK_ETH_IRQ_RX		1
>  #define MTK_ETH_IRQ_MAX		3

Shouldn't MAX be 1 now?
 

