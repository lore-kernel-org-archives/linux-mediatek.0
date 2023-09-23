Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68BC3CE7A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SKox0c6G4xgW3Mj8AqJyJbgfI5M1BKoQYQM71CgVN0=; b=jIy+xQedj8AQjnuIY7vTFZVPf/
	U02/5CYWzguDpBsRAqUIZ0t+PGlFEY9aApQTDexRD+tT2CjfVJPDPzmNi0RdR3sCkQrRLCfpTd7q8
	hA7M/vzJNlZC4Wf7PUf2YjFGpMFzPbI+HNDeTWzJJxW41sJHLIo8X4FdXF91iYa/0a7D3wtDWWijB
	LWRyc2YcqOz36O1wolFkZjPTHAdxKVl0u21njKVJVozafbkPskQnlGCoXX+orzC7rPRo64WpV2o9e
	MDPQ/MZ/g80VboGlJty3hLq0sEi1zmGWmd8KQ9goOnulMdxAymKyKbvgKB9jtSjS76xdtjP/ehJ/T
	2a7eiuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk42L-00B6fX-31;
	Sat, 23 Sep 2023 14:55:13 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk42I-00B6eo-03;
	Sat, 23 Sep 2023 14:55:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=6SKox0c6G4xgW3Mj8AqJyJbgfI5M1BKoQYQM71CgVN0=; b=kZQaY593rSQ1gVZfpbR1Y6X+c3
	+eVPVxehkCSlk6ly/tDUGPRLxwgp+yGBLbfYr/c0VbFaYzft4ioDkixUZe2byFbSw8LbV7vO1QI/0
	jEGecobWOqC8tN0CNKfkt7G+c4s8HrZktrNQg/II2rg5XNOz2Hm4BTvoQFMGE+a11nOU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qk41P-007IOa-FC; Sat, 23 Sep 2023 16:54:15 +0200
Date: Sat, 23 Sep 2023 16:54:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	George McCollister <george.mccollister@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Marcin Wojtas <mw@semihalf.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Marek Vasut <marex@denx.de>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	John Crispin <john@phrozen.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Oleksij Rempel <linux@rempel-privat.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 00/10] define and enforce phylink bindings
Message-ID: <f7a24532-1211-461f-945b-bdf7a847ed65@lunn.ch>
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <ZQ2LMe9aa1ViBcSH@shell.armlinux.org.uk>
 <6c1bb7df-34cd-4db9-95b6-959c87b68588@arinc9.com>
 <ZQ4VPEuXB3+e48Qs@shell.armlinux.org.uk>
 <63649fb5-6dc7-4e63-906d-c3e04aafcc4e@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63649fb5-6dc7-4e63-906d-c3e04aafcc4e@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_075510_058259_57756FB8 
X-CRM114-Status: GOOD (  15.81  )
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

> As you have pointed out with certain examples, once the driver starts
> operating out of what the devicetree says, in other words, once the driver
> starts guessing the hardware, there's no guarantee it will always guess it
> correctly.

This is partially a result of history. Some of these drivers are older
than DT. This guessing was sufficient to make them work in the systems
of that time. Some drivers are used when DT is not available, e.g. USB
or PCI devices, or even ACPI.

> There is also a case for DSA. If there's an implication that the DSA
> controlled switch has an MDIO bus (phy_read() and phy_write()), the DSA
> driver will connect the switch MACs to the PHYs on the MDIO bus of the
> switch, even if there's no description of that MDIO bus on the devicetree.
> As unlikely as it is on a real life scenario, there may be a device that
> has its switch MACs wired to the PHYs on another MDIO bus.

> This is why I've proposed to make the drivers strictly follow what the
> devicetree says.

There are mv88e6xxx systems which don't have a DT description, just
platform data. So if you need to make code changes, keep that in mind.

	 Andrew

