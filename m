Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DEC7EE2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 15:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=luSvtwFvYuWEDfQ0oWnh9KpQF4jauEGj7bA+0Z7dn4Y=; b=NVgfhz1POL8gJU0j3kcsPYfD/Y
	uI9PF7v0LdQGsPbhyLTRFLxruPTGvVEtxoO4WDT/J04ETXdb41eCZrNStf1Hxlk3pZtEjPkjZtQl/
	1OAeGRaeAatcReeROT6NK3kJ6mEDh3mwkOgYnbRt+ZuRZ//Io/kbjK7H0WLr/NlBFQSvwkQzte05U
	SYW5hlBUPBLpcc3Xcrt3eZeJ0gdtDp5XdvetzaB27/kbOF2ej4ONpnq8wtM6Lnwlwa6Jw/1M1T0CX
	88+BtPofCvauBJAMLNFFKQtJveVI4zz3ZTj7MV98TsMEXxXR+A5GeLRinNTHqjQI9VpGd6J4PNMFI
	Zkoimalg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Ziq-0032I9-0V;
	Fri, 26 May 2023 15:51:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Zil-0032GD-0m;
	Fri, 26 May 2023 15:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=luSvtwFvYuWEDfQ0oWnh9KpQF4jauEGj7bA+0Z7dn4Y=; b=OA7OqI7gnvQqMRhLYwoLU6eBos
	sXAQseXvyzb55q9L8L94gtuYNT8Q3H7U9yXwejTnWnRnekY8CFcbpe20VuZio0bz9+xZ8CAXCQOG+
	gfZs40AURVleyDRDNerPyG6/TQ4FKgck+/Q0LsXFaV1mGaIqPnKtwmrFQ+CvRKlRt9Y5b9v3bNQOk
	Tqs+BeduE/jGpym96MQOJNdqQBjOSuWzQN9w8Tn3VHf5N4wGR3Eh8Nn7oJc6R8qL2apVFgmDiiknu
	NPG47lMmnGT3ZPzyN7T5KBeCDgkHW6QCAu1TLsjix32DIdLnt5IDBo910YXcYoMXyEUXkShsISgfh
	WOtBoWtw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44614)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1q2ZiN-0005qz-1e; Fri, 26 May 2023 16:50:51 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1q2ZiC-0003rr-Ob; Fri, 26 May 2023 16:50:40 +0100
Date: Fri, 26 May 2023 16:50:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 24/30] net: dsa: mt7530: rename MT7530_MFC to
 MT753X_MFC
Message-ID: <ZHDVUC1AqncfF2mK@shell.armlinux.org.uk>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-25-arinc.unal@arinc9.com>
 <20230526154258.skbkk4p34ro5uivr@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526154258.skbkk4p34ro5uivr@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_085115_299945_E1CCDB41 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Richard van Schagen <richard@routerhints.com>, arinc9.unal@gmail.com, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Richard van Schagen <vschagen@cs.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, May 26, 2023 at 06:42:58PM +0300, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:26PM +0300, arinc9.unal@gmail.com wrote:
> >  	/* Disable flooding on all ports */
> > -	mt7530_clear(priv, MT7530_MFC, BC_FFP_MASK | UNM_FFP_MASK |
> > -		     UNU_FFP_MASK);
> > +	mt7530_clear(priv, MT753X_MFC, MT753X_BC_FFP_MASK | MT753X_UNM_FFP_MASK
> > +		     | MT753X_UNU_FFP_MASK);
> 
> The preferred coding style is not to start new lines with operators.
> 
> > +/* Register for CPU forward control */
> >  #define MT7531_CFC			0x4
> >  #define  MT7531_MIRROR_EN		BIT(19)
> > -#define  MT7531_MIRROR_MASK		(MIRROR_MASK << 16)
> > -#define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & MIRROR_MASK)
> > -#define  MT7531_MIRROR_PORT_SET(x)	(((x) & MIRROR_MASK) << 16)
> > +#define  MT7531_MIRROR_MASK		(0x7 << 16)
> 
> minor nitpick: if you express this as GENMASK(18, 16), it will be a bit
> easier to cross-check with the datasheet, since both 18 and 16 are more
> representative than 0x7.
> 
> > +#define  MT7531_MIRROR_PORT_GET(x)	(((x) >> 16) & 0x7)
> 
> also here: (((x) & GENMASK(18, 16)) >> 16)

Even better are:
#define  MT7531_MIRROR_PORT_GET(x)	FIELD_GET(MT7531_MIRROR_MASK, x)

> 
> > +#define  MT7531_MIRROR_PORT_SET(x)	(((x) & 0x7) << 16)
> 
> and here: (((x) << 16) & GENMASK(18, 16))

#define  MT7531_MIRROR_PORT_SET(x)	FIELD_PREP(MT7531_MIRROR_MASK, x)

No need to add parens around "x" in either of these uses as we're not
doing anything with x other than passing it into another macro.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

