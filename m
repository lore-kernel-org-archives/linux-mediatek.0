Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 22:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAxOFyO0BR2egR09od52QesiemV72NTb8HyO4J26QeA=; b=zAesoTFyDe6wEunp8cm3epnIn8
	SEZzhjSni2Q7ylC75iFut76ujnUPy8FvvbgSVSWxlB0DaU5WFtpU9M0jezHlwRGGmaNuEYENNzyUC
	tTmCF6dzSbqamavhH7JD20/lFJUKHqFtGD0RJTBuTXHsSyIFEKC0srUvOz3ca3YlLoB4Kw8oyXqDB
	Mk9Ac2KXioUhrCrQb0pHywMQNZLE9lh59CoH6+dU37jnWzgB5GUui8EsmtDSywBPfonReOJ5KTCcN
	1bRaErYXzg3IVYpg4P0FfLmkOGsdhXKdDLBwy9UpMsyq6ziKgchzkG6hLDUW68yPGrllOV9YxZgv9
	3Qnf+GEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1F5-00C8rs-Dz; Fri, 22 Jul 2022 22:35:31 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF1Et-00C8jS-Tp; Fri, 22 Jul 2022 22:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NAxOFyO0BR2egR09od52QesiemV72NTb8HyO4J26QeA=; b=JTa85rS25K0jIgKbCHYzbUx9NI
	oCUnSF6T35Gpbm8U44eBnN+2Lq9I9nPlgc3P79lFHqRv9fhQTZXLjpC8ISsSD3w8WcLMWxvA0iGpF
	s7eyCOa55MKKRGXXQW99bEOjdGR9MfEP8yeIdF84Vm9hrJx/1hXgtbgYffrD6+WJJY90=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1oF1Ed-00BBdb-Vv; Sat, 23 Jul 2022 00:35:03 +0200
Date: Sat, 23 Jul 2022 00:35:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <YtsmF+rOs6AwzpGU@lunn.ch>
References: <20220721182216.z4vdaj4zfb6w3emo@skbuf>
 <YtnBmFm8Jhokgp7Q@shell.armlinux.org.uk>
 <20220721213645.57ne2jf7f6try4ec@skbuf>
 <YtpfmF37FmfY6BV5@shell.armlinux.org.uk>
 <20220722105238.qhfq5myqa4ixkvy4@skbuf>
 <YtqNkSDLRDtuooy/@shell.armlinux.org.uk>
 <20220722124629.7y3p7nt6jmm5hecq@skbuf>
 <YtqjFKUTsH4CK0L+@shell.armlinux.org.uk>
 <20220722165600.lldukpdflv7cjp4j@skbuf>
 <YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtsUhdg3a2rT3NJC@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_153520_008718_1719A161 
X-CRM114-Status: GOOD (  13.64  )
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

> If a DSA driver defaults to AN enabled on the DSA/CPU ports, and makes
> use of the defaulting firmware description, then this will break with
> these patches, since we setup a fixed-link specifier that states that
> no AN should be used.

There is another way to look at this. AN is only an issue for SERDES
based links. A bit of grepping:

vf610-zii-cfu1.dts:			compatible = "marvell,mv88e6085";
vf610-zii-dev-rev-b.dts:				compatible = "marvell,mv88e6085";
vf610-zii-dev-rev-b.dts:				compatible = "marvell,mv88e6085";
vf610-zii-dev-rev-b.dts:				compatible = "marvell,mv88e6085";
vf610-zii-dev-rev-c.dts:				compatible = "marvell,mv88e6190";
vf610-zii-dev-rev-c.dts:				compatible = "marvell,mv88e6190";
vf610-zii-scu4-aib.dts:				compatible = "marvell,mv88e6190";
vf610-zii-scu4-aib.dts:				compatible = "marvell,mv88e6190";
vf610-zii-scu4-aib.dts:				compatible = "marvell,mv88e6190";
vf610-zii-scu4-aib.dts:				compatible = "marvell,mv88e6190";
vf610-zii-spb4.dts:			compatible = "marvell,mv88e6190";
vf610-zii-ssmb-dtu.dts:			compatible = "marvell,mv88e6190";
vf610-zii-ssmb-dtu.dts:				compatible = "marvell,mv88e6xxx-mdio-external";
vf610-zii-ssmb-spu3.dts:			compatible = "marvell,mv88e6190";

vf610 is a Vybrid, which is fast Ethernet. No SERDES. We cannot break
the CPU port on these...

kirkwood-dir665.dts:		compatible = "marvell,mv88e6085";
kirkwood-l-50.dts:		compatible = "marvell,mv88e6085";
kirkwood-l-50.dts:		compatible = "marvell,mv88e6085";
kirkwood-linksys-viper.dts:		compatible = "marvell,mv88e6085";
kirkwood-mv88f6281gtw-ge.dts:		compatible = "marvell,mv88e6085";
kirkwood-rd88f6281.dtsi:		compatible = "marvell,mv88e6085";

RGMII or GMII. You cannot break the CPU port on these.

orion5x-netgear-wnr854t.dts:		compatible = "marvell,mv88e6085";

Even older than kirkwood, mo chance it uses SERDES.

imx51-zii-rdu1.dts:			compatible = "marvell,mv88e6085";
imx51-zii-scu2-mezz.dts:			compatible = "marvell,mv88e6085";
imx51-zii-scu3-esb.dts
imx6q-bx50v3.dtsi:			compatible = "marvell,mv88e6085"; /* 88e6240*/
imx6qdl-gw5904.dtsi:			compatible = "marvell,mv88e6085";
imx6qdl-zii-rdu2.dtsi:			compatible = "marvell,mv88e6085";
imx7d-zii-rpu2.dts:			compatible = "marvell,mv88e6085";

These all have a FEC, so are either GMII or MII. No SERDES.

What is left for 32bit ARM is:

armada-370-rd.dts:		compatible = "marvell,mv88e6085";
Has a fixed-link for the switch, and nothing for the SoC

armada-381-netgear-gs110emx.dts:		compatible = "marvell,mv88e6190";
Has a fixed-link for the switch and a fixed-link for the SoC, as is RGMII

armada-385-clearfog-gtr-l8.dts:		compatible = "marvell,mv88e6190";
armada-385-clearfog-gtr-s4.dts:		compatible = "marvell,mv88e6085";
These two have nothing for the CPU port, SoC has fixed-link, "2500base-x"

armada-385-linksys.dtsi:		compatible = "marvell,mv88e6085";
Has a fixed link, and Soc also has a fixed link, SGMII.

armada-385-turris-omnia.dts:		compatible = "marvell,mv88e6085";
Has a fixed link, with phy-mode rgmii-id.

armada-388-clearfog.dts:		compatible = "marvell,mv88e6085";
Has a fixed link, SoC also has a fixed link.

armada-xp-linksys-mamba.dts:		compatible = "marvell,mv88e6085";
Has a fixed-link, nothing for the SoC side.

So the majority of boards are:

1) Not SERDES based

or

2) Have a fixed-link.

It is just the two clearfog boards which might have a problem, but
these two also use mvneta, and Russell already pointed out, they are
by default forgiving with inband signalling.

In the arm64 world, we have:

freescale/imx8mq-zii-ultra.dtsi:			compatible = "marvell,mv88e6085";
marvell/cn9130-crb.dtsi:		compatible = "marvell,mv88e6190";
marvell/armada-3720-turris-mox.dts:		compatible = "marvell,mv88e6190";
marvell/armada-3720-turris-mox.dts:		compatible = "marvell,mv88e6085";
marvell/armada-3720-turris-mox.dts:		compatible = "marvell,mv88e6190";
marvell/armada-3720-turris-mox.dts:		compatible = "marvell,mv88e6085";
marvell/armada-3720-turris-mox.dts:		compatible = "marvell,mv88e6190";
marvell/armada-3720-turris-mox.dts:		compatible = "marvell,mv88e6085";
marvell/armada-3720-espressobin.dtsi:		compatible = "marvell,mv88e6085";
marvell/armada-7040-mochabin.dts:		compatible = "marvell,mv88e6085";
marvell/armada-8040-clearfog-gt-8k.dts:		compatible = "marvell,mv88e6085";

So another RGMII FEC, and then Marvell devices which are all pretty
forgiving.

So i would say, the likelihood of the CPU port breaking is pretty low.

DSA ports could also be an issue here.

armada-3720-turris-mox.dts has:

                                phy-mode = "2500base-x";
                                managed = "in-band-status";
for all its DSA ports.

vf610-zii-dev-rev-b.dts has fixed link, some ports are rgmii, some are
1000base-X.

vf610-zii-dev-rev-c.dts does not have fixed link and the ports are
xaui. Does xaui have in-band signalling?

vf610-zii-scu4-aib.dts does not have fixed link and the ports are xgmii and 2500base-x.

So there are more open questions here, but a lot less boards.

   Andrew

