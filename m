Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1376C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Dec 2022 13:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I00R+mIVMEq1xRbEaHe9Lr5ofnb/O5HdzRlF8l7nfHQ=; b=UFkajq93R5qRHLG/Bh6ju0uUxW
	nLqlUnlnN2dv78csPUxnTXuvqyQqr3IlE/v7io5YYH9S5UUZce+VLglmSoLWAoe7ECnqe+C3cZl2G
	q/qcG2Uuew71D+TGStbL18Lr2Ay6MEElER3QNrNMJ1czF8N+95AMMWGLTrNdn0WO3xb5ao+CjdT3q
	9VzbBTClPsBlGptHZjsjnVq/aA/IvY8C+6Shg/L83bG/W8EsNOeWz/iw86z6pm0RAq+haMWplzRES
	hqj6wYRcH+J134KkzInNKd7fw7rYGu4WcuzgS4EWDP+4hidUK7hHy3e/5fouIqZtrigB6XMdO2075
	tN/Bcd+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5Ras-00Gcxw-3t; Wed, 14 Dec 2022 13:14:42 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5RP0-00GWwv-4x; Wed, 14 Dec 2022 13:02:27 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1p5ROp-0007VE-7T; Wed, 14 Dec 2022 14:02:15 +0100
Date: Wed, 14 Dec 2022 13:02:11 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH net v2] net: dsa: mt7530: remove reduntant assignment
Message-ID: <Y5nJU9ymV59TdOyK@makrotopia.org>
References: <Y5ksCg/Rt/2ELVOG@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5ksCg/Rt/2ELVOG@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221214_050226_268663_070394C2 
X-CRM114-Status: GOOD (  17.97  )
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

Frank Wunderlich has reported a typo in the commit title, and he is
right: reduntant => redundant

Please either fix this while merging or wait until I'll post v3
tomorrow.

On Wed, Dec 14, 2022 at 01:51:06AM +0000, Daniel Golle wrote:
> Russell King correctly pointed out that the MAC_2500FD capability is
> already added for port 5 (if not in RGMII mode) and port 6 (which only
> supports SGMII) by mt7531_mac_port_get_caps. Remove the reduntant
> setting of this capability flag which was added by a previous commit.
> 
> Fixes: e19de30d2080 ("net: dsa: mt7530: add support for in-band link status")
> Reported-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/dsa/mt7530.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index e74c6b406172..908fa89444c9 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2919,9 +2919,6 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
>  	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
>  				   MAC_10 | MAC_100 | MAC_1000FD;
>  
> -	if ((priv->id == ID_MT7531) && mt753x_is_mac_port(port))
> -		config->mac_capabilities |= MAC_2500FD;
> -
>  	/* This driver does not make use of the speed, duplex, pause or the
>  	 * advertisement in its mac_config, so it is safe to mark this driver
>  	 * as non-legacy.
> 
> base-commit: 7e68dd7d07a28faa2e6574dd6b9dbd90cdeaae91
> -- 
> 2.39.0
> 
> 

