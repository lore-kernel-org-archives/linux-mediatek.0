Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C36CC05027
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 14:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoWLxB7LOvb9BMVQQ87qnV7yd3Ao3ePV7KtRkjXCY+A=; b=UpWQ6zjBuR3Dh9XjptZ2eayQ0x
	/LeMossRs9KOT32YBpP8UGbcPKqO1Eql6Z++NT6wj8HJOrQk4vZPZhmMzlYPpkSXgsvGnzmUWFmy3
	kEAwzV/fGurwEpy+mVvmnmdltJ/ouZbso4XIM6tXOuyt05XvJXkaDktAFYOtseeWAf0YjGxBqZei2
	mDjrwlAK/eUNYKQQsekuXpMPAJNZkSIBF/vbajVJAPOt8asUD8OAC+8/+7slGxGUPTAo7FMh79bhN
	6PQG1K/TBtrm4R3lx+L3Br8BUofY2EnD/iB/LzSUrkSSchHXDv//pImiEXTEM5uI/UTgCkFg5TALn
	LCMj0DDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwzp-002OnK-3m; Fri, 03 Feb 2023 14:24:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNwju-002Gy4-Dg; Fri, 03 Feb 2023 14:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IoWLxB7LOvb9BMVQQ87qnV7yd3Ao3ePV7KtRkjXCY+A=; b=czbrcrtsnqZ6XLdYJqaaQRQ5ad
	EeXobBKkj4MHQWXdz7wnozMEE/yhrDQBSMHABxQVj09BUoPe1IQIROJ9zY3yLQ1TTbKiooQeFE18z
	3eOOKylMdavU3eFfZpv9EbarcnXiqbt1R4TWnVsz35CQJgQ1bupuaovf8BZ46Nt+8nEQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pNwjs-0040RI-Mv; Fri, 03 Feb 2023 15:08:28 +0100
Date: Fri, 3 Feb 2023 15:08:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 4/9] net: ethernet: mtk_eth_soc: only write values if
 needed
Message-ID: <Y90VXN5MGD5OSfky@lunn.ch>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <f38c1b3bf555f505e0856bf76c0d65c9e1d15c53.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f38c1b3bf555f505e0856bf76c0d65c9e1d15c53.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_060830_520650_BB28DADB 
X-CRM114-Status: GOOD (  13.58  )
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

On Fri, Feb 03, 2023 at 07:02:01AM +0000, Daniel Golle wrote:
> Only restart auto-negotiation and write link timer if actually
> necessary.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_sgmii.c | 24 +++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> index f3cf66a23e72..58b5f2f70a66 100644
> --- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
> +++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
> @@ -41,17 +41,13 @@ static int mtk_pcs_config(struct phylink_pcs *pcs, unsigned int mode,
>  	struct mtk_pcs *mpcs = pcs_to_mtk_pcs(pcs);
>  	unsigned int rgc3, sgm_mode, bmcr;
>  	int advertise, link_timer;
> -	bool changed, use_an;
> +	bool mode_changed = false, changed, use_an;

Reverse Christmas tree .... Please check all the patches.

	Andrew

