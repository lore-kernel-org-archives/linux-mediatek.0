Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F2FCCA479
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 19:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6MmuEOQ11SLLfNhMe1RSbPbFAii4+F3EA6k05+Z1u0=; b=E1HV8kYb+CWKyLklm6vBs5fpqT
	EAqhBElfQljlqa9941UC5PcRgvmtNFLN5gv8eX/FK2ztrNiS44DbnptE5v9qen/1wsSc2+XAmVYym
	8Zu80YtimfMZLH+RVOnsnZgM03TU1jP0h7YKjkSjXX9rSJNfaEJqy2BA+GZLMIAToN6t+dPwQFUN3
	nA1E++jRr63jazb1Mrmq4fOBDdzOurSmfGzpjhWaUBo7iE1zsxEcYqRNVCyiWvYit7XPPHB3V97vw
	XLOaMNNJCDBIRUW3n8X+q/HdtcWOOZVpOG+tYN3dhV6wtp2kpsS9v3yw38DEAYcgUEeyre1H3WfFX
	sevLcGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MHu-006ZQQ-3Z; Fri, 01 Jul 2022 19:26:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7MHG-006Z2K-Lu; Fri, 01 Jul 2022 19:26:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8372D61F5E;
	Fri,  1 Jul 2022 19:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7CBC3411E;
	Fri,  1 Jul 2022 19:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656703564;
	bh=SBjh679OIL2Ez+k5zUA2ND4cI1RAcl0Sh4hM5d7eK80=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TaFuZ1lBBJSXyy3Uk3a6JkA8MW8A0Si5QvCXzT8/FCSkJBZLS8v9Dnu5/svbolCbw
	 0bVfC3DBY11hYio6WJutV0MQFWUbrl70auSBlWtsxA7lGYrZH6tFpT3gjFy/DZKik0
	 gNlbRInAXyH6N8hgw6vosjbpZOXBNCwHN6PVayKaW76cHkhpQq5qoePwGgj8nm4ar/
	 It43L48cb/7CAJGs1Z4l2IAba4ulqMaQZdSpbZJllzcIiFlRHkC4pfk4/zWThlTI6Y
	 dBvxPUQ08UrgQgT/Z9v1k3bIvlVFI9Yu2Wbvan8p/R+9b4Dg5oY3AGyF6PnEn/F30P
	 qI8fN1ugR7JKQ==
Date: Fri, 1 Jul 2022 21:25:56 +0200
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, "Alvin __ipraga"
 <alsi@bang-olufsen.dk>, Claudiu Manoil <claudiu.manoil@nxp.com>, "David S.
 Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>, Eric
 Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 George McCollister <george.mccollister@gmail.com>, Hauke Mehrtens
 <hauke@hauke-m.de>, Jakub Kicinski <kuba@kernel.org>, Kurt Kanzenbach
 <kurt@linutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger
 <matthias.bgg@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
 UNGLinuxDriver@microchip.com, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Woojung Huh
 <woojung.huh@microchip.com>
Subject: Re: [PATCH RFC net-next 2/6] net: dsa: mv88e6xxx: report the
 default interface mode for the port
Message-ID: <20220701212556.0b396dea@thinkpad>
In-Reply-To: <E1o6XAF-004pVi-Ue@rmk-PC.armlinux.org.uk>
References: <YrxKdVmBzeMsVjsH@shell.armlinux.org.uk>
	<E1o6XAF-004pVi-Ue@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_122606_904532_9F8816EF 
X-CRM114-Status: GOOD (  23.30  )
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

On Wed, 29 Jun 2022 13:51:27 +0100
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Report the maximum speed interface mode for the port, or if we don't
> have that information, the hardware configured interface mode for
> the port.
> 
> This allows phylink to know which interface mode CPU and DSA ports
> are operating, which will be necessary when we want to select the
> maximum speed for the port (required for such ports without a PHY or
> fixed-link specified in firmware.)
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/dsa/mv88e6xxx/chip.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
> index f98be98551ef..1c6b4b00d58d 100644
> --- a/drivers/net/dsa/mv88e6xxx/chip.c
> +++ b/drivers/net/dsa/mv88e6xxx/chip.c
> @@ -823,6 +823,7 @@ static void mv88e6xxx_get_caps(struct dsa_switch *ds, int port,
>  			       phy_interface_t *default_interface)
>  {
>  	struct mv88e6xxx_chip *chip = ds->priv;
> +	u8 cmode = chip->ports[port].cmode;
>  
>  	chip->info->ops->phylink_get_caps(chip, port, config);
>  
> @@ -830,6 +831,14 @@ static void mv88e6xxx_get_caps(struct dsa_switch *ds, int port,
>  	if (mv88e6xxx_phy_is_internal(ds, port))
>  		__set_bit(PHY_INTERFACE_MODE_GMII,
>  			  config->supported_interfaces);
> +
> +	if (chip->info->ops->port_max_speed_mode)
> +		*default_interface = chip->info->ops->port_max_speed_mode(port);
> +	else if (cmode < ARRAY_SIZE(mv88e6xxx_phy_interface_modes) &&
> +		 mv88e6xxx_phy_interface_modes[cmode])
> +		*default_interface = mv88e6xxx_phy_interface_modes[cmode];
> +	else if (cmode == MV88E6XXX_PORT_STS_CMODE_RGMII)
> +		*default_interface = PHY_INTERFACE_MODE_RGMII;

Will this work correctly for 6185? That one has different array,
mv88e6185_phy_interface_modes.

Maybe instead we need to send the default_interface parameter to
chip->info->ops->phylink_get_caps() ?

Marek

