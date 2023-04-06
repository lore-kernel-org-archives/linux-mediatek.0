Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3493BC76196
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 21:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=diNSykaS+oUedS7VRS2UScAeKnMuDa1g/Ie2fVWIof0=; b=tnAhNtBt+6kT/Kq5llW8uvbl8s
	WbZL2gGpIyaRwxRyrEel5YojwbiYsbnFzOh38bWX+NqO+MM6NejVds2cFvaPqTcxP5c2r3gwVXY17
	epNoXepKaJ96iJBnxWd/UX8OG1DikkYPy8TCy86xPGuMHRQ9fcoRU1g7LAJ8JKdv5AL3779Y1emb4
	vEy2T/3iLX71s67KFl9dvmRZDWCWZdpVVymZcOKxOHznUHOjo2+qp+wRvsdHFbc2PK4HgwttCL34w
	AeoUUWNRT7gA60iPkirogbCrqNJFRfVM0zHrKsxjmG8acx+ukpr0vpCL+lOEWHRGJ2I7UJysB7zu2
	s3tZHC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkXck-008hjz-2d;
	Thu, 06 Apr 2023 21:58:30 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkXcg-008hiy-15;
	Thu, 06 Apr 2023 21:58:27 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pkXc9-0004wy-34;
	Thu, 06 Apr 2023 23:57:54 +0200
Date: Thu, 6 Apr 2023 22:57:51 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [RFC PATCH net-next] net: dsa: mt7530: fix port specifications
 for MT7988
Message-ID: <ZC9AXyuFqa3bqF3Q@makrotopia.org>
References: <20230406100445.52915-1-arinc.unal@arinc9.com>
 <ZC6n1XAGyZFlxyXx@shell.armlinux.org.uk>
 <e413a182-ce93-5831-09f5-19d34d7f7fcf@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e413a182-ce93-5831-09f5-19d34d7f7fcf@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_145826_372508_F3B42BED 
X-CRM114-Status: GOOD (  37.47  )
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

On Fri, Apr 07, 2023 at 12:43:41AM +0300, Arınç ÜNAL wrote:
> On 6.04.2023 14:07, Russell King (Oracle) wrote:
> > On Thu, Apr 06, 2023 at 01:04:45PM +0300, arinc9.unal@gmail.com wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > On the switch on the MT7988 SoC, there are only 4 PHYs. There's only port 6
> > > as the CPU port, there's no port 5. Split the switch statement with a check
> > > to enforce these for the switch on the MT7988 SoC. The internal phy-mode is
> > > specific to MT7988 so put it for MT7988 only.
> > > 
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > ---
> > > 
> > > Daniel, this is based on the information you provided me about the switch.
> > > I will add this to my current patch series if it looks good to you.
> > > 
> > > Arınç
> > > 
> > > ---
> > >   drivers/net/dsa/mt7530.c | 67 ++++++++++++++++++++++++++--------------
> > >   1 file changed, 43 insertions(+), 24 deletions(-)
> > > 
> > > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > > index 6fbbdcb5987f..f167fa135ef1 100644
> > > --- a/drivers/net/dsa/mt7530.c
> > > +++ b/drivers/net/dsa/mt7530.c
> > > @@ -2548,7 +2548,7 @@ static void mt7988_mac_port_get_caps(struct dsa_switch *ds, int port,
> > >   	phy_interface_zero(config->supported_interfaces);
> > >   	switch (port) {
> > > -	case 0 ... 4: /* Internal phy */
> > > +	case 0 ... 3: /* Internal phy */
> > >   		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
> > >   			  config->supported_interfaces);
> > >   		break;
> > > @@ -2710,37 +2710,56 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
> > >   	struct mt7530_priv *priv = ds->priv;
> > >   	u32 mcr_cur, mcr_new;
> > > -	switch (port) {
> > > -	case 0 ... 4: /* Internal phy */
> > > -		if (state->interface != PHY_INTERFACE_MODE_GMII &&
> > > -		    state->interface != PHY_INTERFACE_MODE_INTERNAL)
> > > -			goto unsupported;
> > > -		break;
> > > -	case 5: /* Port 5, a CPU port. */
> > > -		if (priv->p5_interface == state->interface)
> > > +	if (priv->id == ID_MT7988) {
> > > +		switch (port) {
> > > +		case 0 ... 3: /* Internal phy */
> > > +			if (state->interface != PHY_INTERFACE_MODE_INTERNAL)
> > 
> > How do these end up with PHY_INTERFACE_MODE_INTERNAL ? phylib defaults
> > to GMII mode without something else being specified in DT.
> > 
> > Also note that you should *not* be validating state->interface in the
> > mac_config() method because it's way too late to reject it - if you get
> > an unsupported interface here, then that is down to the get_caps()
> > method being buggy. Only report interfaces in get_caps() that you are
> > prepared to handle in the rest of the system.
> 
> This is already the case for all three get_caps(). The supported interfaces
> for each port are properly defined.
> 
> Though mt7988_mac_port_get_caps() clears the config->supported_interfaces
> bitmap before reporting the supported interfaces. I don't think this is
> needed as all bits in the bitmap should already be initialized to zero when
> the phylink_config structure is allocated.
> 
> I'm not sure if your suggestion is to make sure the supported interfaces are
> properly reported on get_caps(), or validate state->interface somewhere
> else.

I think what Russell meant is just there is no point in being overly
precise about permitted interface modes in mt753x_phylink_mac_config,
as this function is not meant and called too late to validate the
validity of the selected interface mode.

You change to mt7988_mac_port_get_caps looks correct to me and doing
this will already prevent mt753x_phylink_mac_config from ever being
called on MT7988 for port == 4 as well as and port == 5.

