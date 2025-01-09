Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D444E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmGYtV21jsy0C5YxWF/+p3yWmQUFPOm+4ZEyL+sjZzA=; b=AJWfXSGmdi3JbN7bW/wTDJDHXf
	movr8JxZiEjMBbT13nbcIMVv/rt6j6AP2sUjYGlASybCQEKaYZ+ZbOIRNbOecvvZujNTUjPAek/Iq
	LOmukyzsNzgVVqez+R8WaWRcWfoMGYR9fDcKeOJ20cKzJVz1LzlJ0ZDHKfzJy0QTqCkDIPtBvrl+V
	n13jnipLEc1JPdZclZ7bG3GUeUdM3aODGcCs+50tCm4Mpy7UHvWw8VxvBZmh6bD54+2JFhcaDTxf2
	WvaKHML4i3B2RtHL/mBCgrOvrlKsxbxxnX7LQS8y5hxpq+F/eRI8ajPRHr8IsVu/asNcbFA1NbbcS
	JeUhNoKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvyK-0000000CmnV-3vnL;
	Thu, 09 Jan 2025 17:05:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvvT-0000000CmIg-3Eos;
	Thu, 09 Jan 2025 17:02:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3CA595C5AAD;
	Thu,  9 Jan 2025 17:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 486B8C4CED2;
	Thu,  9 Jan 2025 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736442150;
	bh=Fg3vYZyTO2Fw+Xxth4e/W3NjOlbC7sP2c8f+MJ5K2ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBBk8lNaYerCF5M/6HUJQLFK2H9nv6ugX8pIQ6ULhnqMjYY5l0Hf6pGBJy8rTdnuc
	 1BL4mOfvX3nXoqhvpIrNBoH9Go1oDuuJo1BcKi4Ixl/rO0juAZFlWI4VL85zYV6hRy
	 1KOMj/ZB8WePQqQEdZ39UXHlvH5peHLFEYWxb9hSQovRvYAX04XdvZHKAeEOCr+8kF
	 5/4+5X6Bx2vHP4c85w7jb2FgadOGQTZQODLBHmk57Ju83dInKsMEOBSdvtNP6Ka4CZ
	 2kaF8OrF0NQo/SSUGcU47UcCex5CyYUF8oksXuetOpos5aAPdPuRfcNvQEBpMPBl0U
	 ZGbUvG8aumS4Q==
Date: Thu, 9 Jan 2025 17:02:22 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Golle <daniel@makrotopia.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <Jose.Abreu@synopsys.com>, kernel-team@meta.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Michal Simek <michal.simek@amd.com>, netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Sean Anderson <sean.anderson@seco.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Taras Chornyi <taras.chornyi@plvision.eu>,
	UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: Re: [PATCH net-next 1/5] net: phylink: use pcs_neg_mode in
 phylink_mac_pcs_get_state()
Message-ID: <20250109170222.GM7706@kernel.org>
References: <Z3_n_5BXkxQR4zEG@shell.armlinux.org.uk>
 <E1tVuFh-000BXQ-D7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1tVuFh-000BXQ-D7@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_090231_890580_DFBF2CF5 
X-CRM114-Status: GOOD (  19.68  )
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

On Thu, Jan 09, 2025 at 03:15:17PM +0000, Russell King (Oracle) wrote:
> As in-band AN no longer just depends on MLO_AN_INBAND + Autoneg bit,
> we need to take account of the pcs_neg_mode when deciding how to
> initialise the speed, duplex and pause state members before calling
> into the .pcs_neg_mode() method. Add this.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/phy/phylink.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 31754d5fd659..d08cdbbbbc1e 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1492,12 +1492,24 @@ static int phylink_change_inband_advert(struct phylink *pl)
>  static void phylink_mac_pcs_get_state(struct phylink *pl,
>  				      struct phylink_link_state *state)
>  {
> +	struct phylink_pcs *pcs;
> +	bool autoneg;
> +
>  	linkmode_copy(state->advertising, pl->link_config.advertising);
>  	linkmode_zero(state->lp_advertising);
>  	state->interface = pl->link_config.interface;
>  	state->rate_matching = pl->link_config.rate_matching;
> -	if (linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> -			      state->advertising)) {
> +	state->an_complete = 0;
> +	state->link = 1;
> +
> +	pcs = pl->pcs;
> +	if (pcs->neg_mode)
> +		autoneg = pl->pcs_neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED;
> +	else
> +		autoneg = linkmode_test_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
> +					    state->advertising);
> +
> +	if (autoneg) {
>  		state->speed = SPEED_UNKNOWN;
>  		state->duplex = DUPLEX_UNKNOWN;
>  		state->pause = MLO_PAUSE_NONE;
> @@ -1506,11 +1518,9 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
>  		state->duplex = pl->link_config.duplex;
>  		state->pause = pl->link_config.pause;
>  	}
> -	state->an_complete = 0;
> -	state->link = 1;
>  
> -	if (pl->pcs)
> -		pl->pcs->ops->pcs_get_state(pl->pcs, state);
> +	if (pcs)
> +		pcs->ops->pcs_get_state(pcs, state);
>  	else
>  		state->link = 0;

Hi Russell,

Here it is assumed that pcs may be NULL.
But it is dereferenced unconditionally immediately
after it is assigned above.

This seems inconsistent.

Flagged by Smatch.

>  }
> -- 
> 2.30.2
> 
> 

