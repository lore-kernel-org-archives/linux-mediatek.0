Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D36AC56201
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 22:55:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B41512076E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 22:55:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u13andyQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5DWDk8H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B41512076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wyxHkwQpiVVsS0rX/izt7r1YzbRmb+KLjdZ08O2PseY=; b=u13andyQ8EEft99Pq74cub/r6
	k50x4OaqsQOVJaGxfhG6i1WQjnwjVkAr3F85SOrclNSDyLbQp+FZ2mrGKskfoRxLzISoAyHkhu88k
	s7kRoB7m+VYQkeUK+Cyk7gtpg9K85jyn4o/1d9NcvTWAbmoDZ/NcZuHb5I/Nh0ogKVLF9e65k+9Sq
	EZ0AUTlQiYpdgmis6TgTIxcOL62LG6KmUSx/o8FlThGuop94v3d2OJrgawoEWgIwhptuiAUx9p1Ab
	yrG1Trp204ypCwCARmC9HE5KdOwgbpazE0GBXE/5R6Eb3TyUlCckj7IxVskkqllwL/ghMdYfVV0Cx
	Ai6zC4DiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khhDF-0003JK-MA; Tue, 24 Nov 2020 22:55:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khhDB-0003I5-Hu; Tue, 24 Nov 2020 22:55:02 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D58822076E;
 Tue, 24 Nov 2020 22:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606258500;
 bh=IytfiVfJkl3SGmgNvKbDzwZWlnDst5FWMGBqOJ7gclM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F5DWDk8Hw0avcrErVA2DTvBzZb2j3gkEDE0zIk+FkXJwSnQFLPRFMA0qJcaKl/2gb
 UsCGtg2oErYGyZkHB4bG0wFhAR7hSpD/lhW4+yAohrIbIPbWs0UkllMW/3G8BnBW2p
 szaqZyOlR/33imdMyhy5S8Gbn0Sx+5Cho1q66YsM=
Date: Tue, 24 Nov 2020 14:54:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next] net: ethernet: mediatek: support setting MTU
Message-ID: <20201124145458.207d5cbd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201123034522.1268-1-dqfext@gmail.com>
References: <20201123034522.1268-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_175501_684106_DEB77379 
X-CRM114-Status: GOOD (  15.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Frank Wunderlich <frank-w@public-files.de>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Russell King <linux@armlinux.org.uk>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Rene van Dorst <opensource@vdorst.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 23 Nov 2020 11:45:22 +0800 DENG Qingfang wrote:
> MT762x HW, except for MT7628, supports frame length up to 2048
> (maximum length on GDM), so allow setting MTU up to 2030.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 6d2d60675ffd..27cae3f43972 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -353,7 +353,7 @@ static void mtk_mac_config(struct phylink_config *config, unsigned int mode,
>  	/* Setup gmac */
>  	mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
>  	mcr_new = mcr_cur;
> -	mcr_new |= MAC_MCR_MAX_RX_1536 | MAC_MCR_IPG_CFG | MAC_MCR_FORCE_MODE |
> +	mcr_new |= MAC_MCR_IPG_CFG | MAC_MCR_FORCE_MODE |

This also changes the default MAX_RX from 1536 to 1518 (0).

I think you should at least mention this in the commit message.

>  		   MAC_MCR_BACKOFF_EN | MAC_MCR_BACKPR_EN | MAC_MCR_FORCE_LINK;
>  
>  	/* Only update control register when needed! */

> @@ -320,7 +320,12 @@
>  
>  /* Mac control registers */
>  #define MTK_MAC_MCR(x)		(0x10100 + (x * 0x100))
> -#define MAC_MCR_MAX_RX_1536	BIT(24)
> +#define MAC_MCR_MAX_RX_LEN_MASK	GENMASK(25, 24)
> +#define MAC_MCR_MAX_RX_LEN(_x)	(MAC_MCR_MAX_RX_LEN_MASK & ((_x) << 24))
> +#define MAC_MCR_MAX_RX_LEN_1518	0x0
> +#define MAC_MCR_MAX_RX_LEN_1536	0x1
> +#define MAC_MCR_MAX_RX_LEN_1552	0x2
> +#define MAC_MCR_MAX_RX_LEN_2048	0x3
>  #define MAC_MCR_IPG_CFG		(BIT(18) | BIT(16))
>  #define MAC_MCR_FORCE_MODE	BIT(15)
>  #define MAC_MCR_TX_EN		BIT(14)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
