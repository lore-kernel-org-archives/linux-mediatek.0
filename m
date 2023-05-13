Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAD7C77B7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 May 2023 17:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O3z8oYCBVL9IrSKxHxmBYKeabaLNAd4V09r9JbFFnc=; b=DCTqjSKYlvOaoHaW6ov/wBgDsU
	5RMOy5iCXbLYbTLKCo+WBzmHjwuEP6dW895nKKGWB+lVnF11y6iTyCSH+GJL90tSxjTOIYH7GcHGZ
	nQ9JEmDZ25pno5paUQKqEeXivIi0lmNQhTOB6C9ucyWGX+eXZ1W+JIwK3ytkkB883wC6+mWlcUemU
	eEAu+zlH3IZooUkwvm/LbzqcgTDpeFOmj9RKMAONG4v8By/gZUqKlupuoKUpXFnTATfi9KuknDmcO
	gUBoSI5iUhhWk+j19dgZKcNEL8WQ5YsNOgpu86qzDMYDIdLkWjNgOncVNmaQRk4+i7mOVtp6Pv/ct
	z14PsRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtS9-00FWO3-0O;
	Sat, 13 May 2023 17:54:45 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxtS5-00FWN3-2F;
	Sat, 13 May 2023 17:54:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pxtRv-0003sj-26;
	Sat, 13 May 2023 17:54:31 +0000
Date: Sat, 13 May 2023 19:52:42 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 0/8] Improvements for RealTek 2.5G Ethernet PHYs
Message-ID: <ZF_Oato0B3d-apVv@pidgin.makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
 <55c11fd9-54cf-4460-a10c-52ff62b46a4c@lunn.ch>
 <ZF0iiDIZQzR8vMvm@pidgin.makrotopia.org>
 <ZF0mUeKjdvZNG44q@shell.armlinux.org.uk>
 <ZF0vXAzWg44GT+fA@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZF0vXAzWg44GT+fA@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230513_105441_878863_6B2EC1E4 
X-CRM114-Status: GOOD (  61.18  )
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

Hi Russell,

thank you for valuable your input and suggestions.

On Thu, May 11, 2023 at 07:09:32PM +0100, Russell King (Oracle) wrote:
> On Thu, May 11, 2023 at 06:30:57PM +0100, Russell King (Oracle) wrote:
> > On Thu, May 11, 2023 at 07:14:48PM +0200, Daniel Golle wrote:
> > > On Thu, May 11, 2023 at 02:28:15AM +0200, Andrew Lunn wrote:
> > > > On Thu, May 11, 2023 at 12:53:22AM +0200, Daniel Golle wrote:
> > > > > Improve support for RealTek 2.5G Ethernet PHYs (RTL822x series).
> > > > > The PHYs can operate with Clause-22 and Clause-45 MDIO.
> > > > > 
> > > > > When using Clause-45 it is desireable to avoid rate-adapter mode and
> > > > > rather have the MAC interface mode follow the PHY speed. The PHYs
> > > > > support 2500Base-X for 2500M, and Cisco SGMII for 1000M/100M/10M.
> > > > 
> > > > I don't see what clause-45 has to do with this. The driver knows that
> > > > both C22 and C45 addresses spaces exists in the hardware. It can do
> > > > reads/writes on both. If the bus master does not support C45, C45 over
> > > > C22 will be performed by the core.
> > > 
> > > My understanding is/was that switching the SerDes interface mode is only
> > > intended with Clause-45 PHYs, derived from this comment and code:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/phylink.c#n1661
> > 
> > It's only because:
> > 
> > 1) Clause 22 PHYs haven't done this.
> > 2) There is currently no way to know what set of interfaces a PHY would
> >    make use of - and that affects what ethtool linkmodes are possible.
> > 
> > What you point to is nothing more than a hack to make Clause 45 PHYs
> > work with the code that we currently have.

As this status-quo has been unchanged for several years now, we could
as well consider it having evolved into a convention...?

> > 
> > To sort this properly, we need PHY drivers to tell phylink what
> > interfaces they are going to switch between once they have been
> > attached to the network interface. This is what these patches in my
> > net-queue branch are doing:
> > 
> > net: phy: add possible interfaces
> > net: phy: marvell10g: fill in possible_interfaces
> > net: phy: bcm84881: fill in possible_interfaces
> > net: phylink: split out PHY validation from phylink_bringup_phy()
> > net: phylink: validate only used interfaces for c45 PHYs
> > 
> > Why only C45 PHYs again? Because the two PHY drivers that I've added
> > support for "possible_interfaces" to are both C45. There's no reason
> > we can't make that work for C22 PHYs as well.

Are you planning to re-submit or merge those changes any time in the
near future?

> > 
> > We could probably make it work for C22 PHYs out of the box by setting
> > the appropriate bit for the supplied interface in "possible_interfaces"
> > inside phy_attach_direct() after the call to phy_init_hw() if
> > "possible_interfaces" is still empty, which means that if a PHY driver
> > isn't updated to setup "possible_interfaces" then we get basically
> > whatever interface mode we're attaching with there.
> > 
> > There may be a problem if phy_attach_direct() gets called with
> > PHY_INTERFACE_MODE_NA (which I believe is possible with DSA.)
> 
> Maybe something like the below on top of those patches I've pointed
> to above? Note that this requires all MAC users of phylink to fill
> in the supported_interfaces bitmap. One of the other patches in my
> net-queue is:
> 
> net: phylink: require supported_interfaces to be filled

I've picked up the patches above and also that one from your tree
git://git.armlinux.org.uk/~rmk/linux-arm net-queue. Together with
your suggestion below this will solve part of the problem in a much
more clean way because we explicitely state the supported interface
modes instead of implictely assuming that switching to Cisco SGMII for
10M/100M/1000M is supported by the MAC in case 2500Base-X is used
for 2500M.

Regarding .get_rate_matching I understand that Linux currently just
reads from the PHY whether rate matching is going to be performed.
I assume the PHY should enable rate matching in case the MAC doesn't
support lower-speed interface modes?
In the marvell10g and aquantia PHY drivers I see that the bootloader (?)
is probably supposed to have already done that, as there is no code to
enable or disable rate adapter mode depending on the MACs
capabilities. So this problem (having to decides whether or not it is
feasable to use rate-adapter mode of the PHY; I've 'abused' is_c45 to
decide that...) is not being adressed by your patchset either, or did I
miss something?

Anyway. In case you are submitting or merging that set of changes I can
re-submit my series on top of it.

> 
> which comes before the above patches. I think that's a reasonable
> expectation today but needs testing and review of all users (esp.
> the DSA drivers.)

I can see that it should work fine with mt7530 which is the only DSA
driver I have been dealing with and have hardware to test.

> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index af070be717ec..1cfa101960b9 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -1787,8 +1787,26 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
>  	 */
>  	state->rate_matching = phy_get_rate_matching(phy, state->interface);
>  
> -	/* If this is a clause 22 PHY or is using rate matching, it only
> -	 * operates in a single mode.
> +	/* If the PHY provides a bitmap of the interfaces it will be using,
> +	 * use this to validate the PHY. This can be used for both clause 22
> +	 * and clause 45 PHYs.
> +	 */
> +	if (!phy_interface_empty(phy->possible_interfaces)) {
> +		/* Calculate the union of the interfaces the PHY supports in
> +		 * its configured state, and the host's supported interfaces.
> +		 * We never want an interface that isn't supported by the host.
> +		 */
> +		phy_interface_and(interfaces, phy->possible_interfaces,
> +				  pl->config->supported_interfaces);
> +
> +		return phylink_validate_mask(pl, mode, supported, state,
> +					     interfaces);
> +	}
> +
> +	/* If the PHY doesn't provide it a bitmap of the interfaces it will
> +	 * be using, or is a traditional clause 22 PHY driver that doesn't
> +	 * set ->possible_interfaces, or if we're using rate matching, then
> +	 * we're operating in a single mode.
>  	 */
>  	if (!phy->is_c45 || state->rate_matching != RATE_MATCH_NONE)
>  		return phylink_validate(pl, mode, supported, state);
> @@ -1797,28 +1815,18 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
>  	 * modes according to the negotiated media speed. For example, the
>  	 * interface may switch between 10GBASE-R, 5GBASE-R, 2500BASE-X and
>  	 * SGMII.
> +	 *
> +	 * If we're operating in such a mode, but haven't been provided a
> +	 * possible_interfaces bitmap, then we need to validate all possible
> +	 * interfaces.
>  	 */
> -
> -	/* Backwards compatibility for those MAC drivers that don't set
> -	 * their supported_interfaces, or PHY drivers that don't set
> -	 * their possible_interfaces.
> -	 */
> -	if (phy_interface_empty(phy->possible_interfaces) &&
> +	if (phy->is_c45 &&
>  	    state->interface != PHY_INTERFACE_MODE_RXAUI &&
>  	    state->interface != PHY_INTERFACE_MODE_XAUI &&
> -	    state->interface != PHY_INTERFACE_MODE_USXGMII) {
> +	    state->interface != PHY_INTERFACE_MODE_USXGMII)
>  		state->interface = PHY_INTERFACE_MODE_NA;
> -		return phylink_validate(pl, mode, supported, state);
> -	}
> -
> -	/* Calculate the union of the interfaces the PHY supports in
> -	 * its configured state, and the host's supported interfaces.
> -	 * We never want an interface that isn't supported by the host.
> -	 */
> -	phy_interface_and(interfaces, phy->possible_interfaces,
> -			  pl->config->supported_interfaces);
>  
> -	return phylink_validate_mask(pl, mode, supported, state, interfaces);
> +	return phylink_validate(pl, mode, supported, state);
>  }
>  
>  static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 4e0db4a14f30..b54aa9e8c122 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -178,6 +178,11 @@ static inline bool phy_interface_empty(const unsigned long *intf)
>  	return bitmap_empty(intf, PHY_INTERFACE_MODE_MAX);
>  }
>  
> +static inline unsigned int phy_interface_weight(const unsigned long *intf)
> +{
> +	return bitmap_weight(intf, PHY_INTERFACE_MODE_MAX);
> +}
> +
>  static inline void phy_interface_and(unsigned long *dst, const unsigned long *a,
>  				     const unsigned long *b)
>  {
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

