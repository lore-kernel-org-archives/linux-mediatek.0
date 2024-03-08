Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45DEAC54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xT4i6PWtcF2FTdAWlP3cUk5y60XrX1sqI6b7YtGd8qY=; b=ANl9KqYFE2Q7I/+45Q1GfFrGxv
	cxIlJ5rTNE3VM0IreTIpIfA+VZaZFLbkFki/KWtJrUARYRHr89CGxM7Fn9m+2ZbF9T5dLPnXbwga8
	UFLjWKef6bhHoOEn3BQAvRNmKFCSmXRCOM4xtC8cYUW8c3TJCR7Jo2XSEhiXtf+KbsYJ42EG3pLcG
	MBwoJHCQ5jFFqMYLzfjKfvWSNG4WBnyNL6cdxiRnoT1MTVeTnkNBaycHeffuTvl8qGSA2cIA3YQ2u
	Y9ZZmUhmUuoB7gR1eAS94hobKk6WEfaJrh1xZW6frVvcN8SK/C2kDVIZ3C+U+VJ7l0oRToXvIPRhw
	/rOGx1zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribV9-00000009eav-38Bi;
	Fri, 08 Mar 2024 14:47:11 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribV5-00000009eZE-3Yad;
	Fri, 08 Mar 2024 14:47:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ribUk-0000Uk-1r;
	Fri, 08 Mar 2024 14:46:46 +0000
Date: Fri, 8 Mar 2024 14:46:33 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Justin Swartz <justin.swartz@risingedge.co.za>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
Message-ID: <ZeskyfVuKECkZB1I@makrotopia.org>
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <6064ba52-2470-4c56-958c-35632187f148@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6064ba52-2470-4c56-958c-35632187f148@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_064707_981657_1F147E29 
X-CRM114-Status: GOOD (  39.05  )
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

On Fri, Mar 08, 2024 at 12:51:15PM +0300, Arınç ÜNAL wrote:
> Hey Justin.
> 
> I couldn't find anything on the MT7621 Giga Switch Programming Guide v0.3
> document regarding which pin corresponds to which bit on the HWTRAP
> register. There's only this mention on the LED controller section,
> "hardware traps and LEDs share the same pins in GSW". But page 16 of the
> schematics document for Banana Pi BPI-R2 [1] fully documents this.
> 
> The HWTRAP register is populated right after power comes back after the
> switch chip is reset [2]. This means any active link before the reset will
> go away so the high/low state of the pins will go back to being dictated by
> the bootstrapping design of the board. The HWTRAP register will be
> populated before a link can be set up.
> 
> In conclusion, I don't see any need to disable the LED controller before
> resetting the switch chip.
> 
> [1] https://wiki.banana-pi.org/Banana_Pi_BPI-R2#Documents
> 
> [2] I've tested it on my MT7621AT board with a 40MHz XTAL frequency and a
> board with standalone MT7530 with 25MHz XTAL frequency.

How many times did you repeat this test to conclude that there is no
need to disable LEDs before reset?

As Justin is decribing a probabilistic phenomenon ("[...] chance of an
unintended HT_XTAL_FSEL value is reduced.") I believe running a single
test is not enough to conlcude anything.

I have a hard time believing that he was working on this patch without
any reason to do so...


> 
> While the kernel was booting, before the DSA subdriver kicks in:
> - For the board with 40 MHz XTAL: I've connected a Vcc pin to ESW_P3_LED_0
>   to set it high.
> - For the board with 25 MHz XTAL: I've connected a GND pin to ESW_P3_LED_0
>   to set it low.
> 
> Board with 40 MHz XTAL:
> [    2.359428] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module
> [    2.374918] mt7530-mdio mdio-bus:1f: xtal is 25MHz
> 
> Board with 25 MHz XTAL:
> [    4.324672] mt7530-mdio mdio-bus:1f: xtal is 40MHz
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 51d7b816dd02..beab5e5558d0 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2216,6 +2216,15 @@ mt7530_setup(struct dsa_switch *ds)
>  		return ret;
>  	}
> +	if ((val & HWTRAP_XTAL_MASK) == HWTRAP_XTAL_25MHZ)
> +		dev_info(priv->dev, "xtal is 25MHz\n");
> +
> +	if ((val & HWTRAP_XTAL_MASK) == HWTRAP_XTAL_40MHZ)
> +		dev_info(priv->dev, "xtal is 40MHz\n");
> +
> +	if ((val & HWTRAP_XTAL_MASK) == HWTRAP_XTAL_20MHZ)
> +		dev_info(priv->dev, "xtal is 20MHz\n");
> +
>  	id = mt7530_read(priv, MT7530_CREV);
>  	id >>= CHIP_NAME_SHIFT;
>  	if (id != MT7530_ID) {
> 
> Arınç
> 
> On 5.03.2024 07:39, Justin Swartz wrote:
> > Disable LEDs just before resetting the MT7530 to avoid
> > situations where the ESW_P4_LED_0 and ESW_P3_LED_0 pin
> > states may cause an unintended external crystal frequency
> > to be selected.
> > 
> > The HT_XTAL_FSEL (External Crystal Frequency Selection)
> > field of HWTRAP (the Hardware Trap register) stores a
> > 2-bit value that represents the state of the ESW_P4_LED_0
> > and ESW_P4_LED_0 pins (seemingly) sampled just after the
> > MT7530 has been reset, as:
> > 
> >      ESW_P4_LED_0    ESW_P3_LED_0    Frequency
> >      -----------------------------------------
> >      0               1               20MHz
> >      1               0               40MHz
> >      1               1               25MHz
> > 
> > The value of HT_XTAL_FSEL is bootstrapped by pulling
> > ESW_P4_LED_0 and ESW_P3_LED_0 up or down accordingly,
> > but:
> > 
> >    if a 40MHz crystal has been selected and
> >    the ESW_P3_LED_0 pin is high during reset,
> > 
> >    or a 20MHz crystal has been selected and
> >    the ESW_P4_LED_0 pin is high during reset,
> > 
> >    then the value of HT_XTAL_FSEL will indicate
> >    that a 25MHz crystal is present.
> > 
> > By default, the state of the LED pins is PHY controlled
> > to reflect the link state.
> > 
> > To illustrate, if a board has:
> > 
> >    5 ports with active low LED control,
> >    and HT_XTAL_FSEL bootstrapped for 40MHz.
> > 
> > When the MT7530 is powered up without any external
> > connection, only the LED associated with Port 3 is
> > illuminated as ESW_P3_LED_0 is low.
> > 
> > In this state, directly after mt7530_setup()'s reset
> > is performed, the HWTRAP register (0x7800) reflects
> > the intended HT_XTAL_FSEL (HWTRAP bits 10:9) of 40MHz:
> > 
> >    mt7530-mdio mdio-bus:1f: mt7530_read: 00007800 == 00007dcf
> > 
> >    >>> bin(0x7dcf >> 9 & 0b11)
> >    '0b10'
> > 
> > But if a cable is connected to Port 3 and the link
> > is active before mt7530_setup()'s reset takes place,
> > then HT_XTAL_FSEL seems to be set for 25MHz:
> > 
> >    mt7530-mdio mdio-bus:1f: mt7530_read: 00007800 == 00007fcf
> > 
> >    >>> bin(0x7fcf >> 9 & 0b11)
> >    '0b11'
> > 
> > Once HT_XTAL_FSEL reflects 25MHz, none of the ports
> > are functional until the MT7621 (or MT7530 itself)
> > is reset.
> > 
> > By disabling the LED pins just before reset, the chance
> > of an unintended HT_XTAL_FSEL value is reduced.
> > 
> > Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
> > ---
> >   drivers/net/dsa/mt7530.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> > index 3c1f65759..8fa113126 100644
> > --- a/drivers/net/dsa/mt7530.c
> > +++ b/drivers/net/dsa/mt7530.c
> > @@ -2238,6 +2238,12 @@ mt7530_setup(struct dsa_switch *ds)
> >   		}
> >   	}
> > +	/* Disable LEDs before reset to prevent the MT7530 sampling a
> > +	 * potentially incorrect HT_XTAL_FSEL value.
> > +	 */
> > +	mt7530_write(priv, MT7530_LED_EN, 0);
> > +	usleep_range(1000, 1100);
> > +
> >   	/* Reset whole chip through gpio pin or memory-mapped registers for
> >   	 * different type of hardware
> >   	 */

