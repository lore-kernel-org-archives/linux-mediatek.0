Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B062C77B60
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 20:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=audfrg0TbzPVe9GE64f0nIf2NcoJlBK1halRukyl4Tg=; b=rHGvXzg3KDv+hb/8P1CFL2UDXA
	tqkHUefpblBFDX83IXgi+ROZ/+Hxsa3BSwuTwVn5XL/j2rS7O+NxUnHWndh5wcDfBe8WOPBYFNVD+
	w4cERk6o+8UzQdjuzI3UJeA2bycxCLxRwnvA8nu+q4KDc3spLOCnmU+NiIcSiuE77Q8s2u3MThbJb
	YBIiBpEGOSRAEsnTN5rLCS2bSoKFdMKRD9k1trZriyGKjfmS5kQEVit33K5nZbEvWDNqZ8EAYzHOp
	f4FmaU7vug9OoOV40fIMOTdFU1gkjchylj90naGdMNF99DuRhWt2J4UYUrNYpSFaDzq1Icte5oIo6
	R0ghT7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptDrf-00Em7t-0L;
	Sun, 30 Apr 2023 20:41:47 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptDra-00Em6L-1X;
	Sun, 30 Apr 2023 20:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=audfrg0TbzPVe9GE64f0nIf2NcoJlBK1halRukyl4Tg=; b=mE
	xqFE8U5/4Z+0j6gmedg/0LmECUZa51EudrlfchyPHY8WHQoBPVOVOl+JgOp3+WBx4StO++I5OtFhi
	ozXffb6Uw9bvEeVYXfbX8rXF0H2CHpC/V9zn8ivEzVj5onsBpIcwTgiaWAtOhlVLS+PZGNJGEgX0e
	6oM+qhcacmN128w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ptDr4-00BZTI-IZ; Sun, 30 Apr 2023 22:41:10 +0200
Date: Sun, 30 Apr 2023 22:41:10 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: David Bauer <mail@david-bauer.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document
 MDIO-bus
Message-ID: <de1a5264-f4ce-4e94-bae6-73407efef6e4@lunn.ch>
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
 <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
 <396fad42-89d0-114d-c02e-ac483c1dd1ed@arinc9.com>
 <04cc2904-6d61-416e-bfbe-c24d96fe261b@lunn.ch>
 <a6c6fe83-fbb5-f289-2210-6f1db6585636@arinc9.com>
 <207753d6-cffd-4a23-be16-658d7c9ceb4a@lunn.ch>
 <e5476692-aa3a-29b8-2e1d-ce93fd13a23b@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5476692-aa3a-29b8-2e1d-ce93fd13a23b@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_134142_664598_0267AD06 
X-CRM114-Status: GOOD (  39.78  )
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

On Sun, Apr 30, 2023 at 10:54:50PM +0300, Arınç ÜNAL wrote:
> On 30.04.2023 21:48, Andrew Lunn wrote:
> > > > Try setting ds->slave_mii_bus to the MDIO bus you register via
> > > > of_mdiobus_register().
> > > 
> > > That seems to be the case already, under mt7530_setup_mdio():
> > > 
> > > 	bus = devm_mdiobus_alloc(dev);
> > > 	if (!bus)
> > > 		return -ENOMEM;
> > > 
> > > 	ds->slave_mii_bus = bus;
> > > 
> > > The bus is registered with devm_of_mdiobus_register(), if that matters. (My
> > > current knowledge about OF or OF helpers for MDIO is next to nothing.)
> > > 
> > > The same behaviour is there.
> > 
> > Maybe take a look at what is going on in dsa_slave_phy_setup() and
> > dsa_slave_phy_connect().
> > 
> > The way i understand it, is it first looks in DT to see if there is a
> > phy-handle, and if there is, it uses it. If not, it assumes there is a
> > 1:1 mapping between port number and PHY address, and looks to see if a
> > PHY has been found on ds->slave_mii_bus at that address, and uses it.
> > 
> > So i don't think you need to list the PHY, the fallback should be
> > used.
> 
> Thanks for pointing me in the right direction Andrew.
> 
> I applied this diff:
> 
> diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
> index 389f33a12534..19d0c209e7e9 100644
> --- a/drivers/net/phy/mdio_bus.c
> +++ b/drivers/net/phy/mdio_bus.c
> @@ -117,8 +117,12 @@ struct phy_device *mdiobus_get_phy(struct mii_bus *bus, int addr)
>  	mdiodev = bus->mdio_map[addr];
> -	if (!mdiodev)
> +	if (!mdiodev) {
> +		dev_info(&bus->dev, "mdio device doesn't exist\n");
>  		return NULL;
> +	}
> +
> +	dev_info(&bus->dev, "mdio device exists\n");
>  	if (!(mdiodev->flags & MDIO_DEVICE_FLAG_PHY))
>  		return NULL;
> diff --git a/net/dsa/slave.c b/net/dsa/slave.c
> index 165bb2cb8431..0be408e32a76 100644
> --- a/net/dsa/slave.c
> +++ b/net/dsa/slave.c
> @@ -2487,6 +2487,7 @@ static int dsa_slave_phy_setup(struct net_device *slave_dev)
>  		/* We could not connect to a designated PHY or SFP, so try to
>  		 * use the switch internal MDIO bus instead
>  		 */
> +		netdev_err(slave_dev, "using switch's internal MDIO bus\n");
>  		ret = dsa_slave_phy_connect(slave_dev, dp->index, phy_flags);
>  	}
>  	if (ret) {
> 
> With or without this patch, the switch's internal MDIO bus is used to set
> up the PHYs.
> 
> DT that defines ethphy0 only, without this patch applied:
> 
> [    4.660784] mt7530-mdio mdio-bus:1f wan (uninitialized): using switch's internal MDIO bus
> [    4.669026] mdio_bus mt7530-0: mdio device exists
> [    4.677693] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.693238] mt7530-mdio mdio-bus:1f lan0 (uninitialized): using switch's internal MDIO bus
> [    4.701589] mdio_bus mt7530-0: mdio device exists
> [    4.707101] mt7530-mdio mdio-bus:1f lan0 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.718550] mt7530-mdio mdio-bus:1f lan1 (uninitialized): using switch's internal MDIO bus
> [    4.726856] mdio_bus mt7530-0: mdio device exists
> [    4.732384] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.743822] mt7530-mdio mdio-bus:1f lan2 (uninitialized): using switch's internal MDIO bus
> [    4.752154] mdio_bus mt7530-0: mdio device exists
> [    4.757662] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.769099] mt7530-mdio mdio-bus:1f lan3 (uninitialized): using switch's internal MDIO bus
> [    4.781872] mdio_bus mt7530-0: mdio device exists
> [    4.787413] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=POLL)
> 
> Same DT but with this patch applied:
> 
> [    4.621547] mt7530-mdio mdio-bus:1f: configuring for fixed/trgmii link mode
> [    4.631524] mt7530-mdio mdio-bus:1f wan (uninitialized): using switch's internal MDIO bus
> [    4.639764] mdio_bus mt7530-0: mdio device exists
> [    4.647770] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.663898] mt7530-mdio mdio-bus:1f lan0 (uninitialized): using switch's internal MDIO bus
> [    4.672253] mdio_bus mt7530-0: mdio device doesn't exist
> [    4.677597] mt7530-mdio mdio-bus:1f lan0 (uninitialized): no phy at 1
> [    4.684053] mt7530-mdio mdio-bus:1f lan0 (uninitialized): failed to connect to PHY: -ENODEV
> [    4.692435] mt7530-mdio mdio-bus:1f lan0 (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 1
> [    4.703087] mt7530-mdio mdio-bus:1f lan1 (uninitialized): using switch's internal MDIO bus
> [    4.711408] mdio_bus mt7530-0: mdio device doesn't exist
> [    4.716731] mt7530-mdio mdio-bus:1f lan1 (uninitialized): no phy at 2
> [    4.723214] mt7530-mdio mdio-bus:1f lan1 (uninitialized): failed to connect to PHY: -ENODEV
> [    4.731597] mt7530-mdio mdio-bus:1f lan1 (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 2
> [    4.742199] mt7530-mdio mdio-bus:1f lan2 (uninitialized): using switch's internal MDIO bus
> [    4.755431] mdio_bus mt7530-0: mdio device doesn't exist
> [    4.760793] mt7530-mdio mdio-bus:1f lan2 (uninitialized): no phy at 3
> [    4.767263] mt7530-mdio mdio-bus:1f lan2 (uninitialized): failed to connect to PHY: -ENODEV
> [    4.775632] mt7530-mdio mdio-bus:1f lan2 (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 3
> [    4.786270] mt7530-mdio mdio-bus:1f lan3 (uninitialized): using switch's internal MDIO bus
> [    4.794591] mdio_bus mt7530-0: mdio device doesn't exist
> [    4.799944] mt7530-mdio mdio-bus:1f lan3 (uninitialized): no phy at 4
> [    4.806397] mt7530-mdio mdio-bus:1f lan3 (uninitialized): failed to connect to PHY: -ENODEV
> [    4.814782] mt7530-mdio mdio-bus:1f lan3 (uninitialized): error -19 setting up PHY for tree 0, switch 0, port 4
> 
> DT without the mdio node defined, with this patch applied:
> 
> [    4.650766] mt7530-mdio mdio-bus:1f: configuring for fixed/trgmii link mode
> [    4.660687] mt7530-mdio mdio-bus:1f wan (uninitialized): using switch's internal MDIO bus
> [    4.668937] mdio_bus mt7530-0: mdio device exists
> [    4.677787] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.693165] mt7530-mdio mdio-bus:1f lan0 (uninitialized): using switch's internal MDIO bus
> [    4.701517] mdio_bus mt7530-0: mdio device exists
> [    4.707029] mt7530-mdio mdio-bus:1f lan0 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.718469] mt7530-mdio mdio-bus:1f lan1 (uninitialized): using switch's internal MDIO bus
> [    4.726773] mdio_bus mt7530-0: mdio device exists
> [    4.732322] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.743793] mt7530-mdio mdio-bus:1f lan2 (uninitialized): using switch's internal MDIO bus
> [    4.752143] mdio_bus mt7530-0: mdio device exists
> [    4.757662] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=POLL)
> [    4.769105] mt7530-mdio mdio-bus:1f lan3 (uninitialized): using switch's internal MDIO bus
> [    4.781905] mdio_bus mt7530-0: mdio device exists
> [    4.787459] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=POLL)
> 
> This is how I define it, mind you no phandles.
> 
> switch@1f {
> 	...
> 	mdio {
> 		#address-cells = <0x01>;
> 		#size-cells = <0x00>;
> 
> 		ethernet-phy@0 {
> 			reg = <0x00>;
> 		};
> 	};
> };
> 
> Like you said, if the mdio node is not defined, the driver will assume 1:1
> mapping. If not, it will need all the PHYs to be defined on the mdio node
> along with on the ports node. Hence back to my original statement, we can
> either force defining the PHYs on the mdio node which would break the ABI,
> or forget about doing PHY muxing this way.
> 
> There are no MDIO operations needed on the PHYs for the PHY muxing anyway,
> so I'd rather do this some other way.

The problem is __of_mdiobus_register() :-(

If there is a node in DT, the scanning of all addresses is
disabled. It looks at just the addresses listed in DT. Plain
mdiobus_register() by default looks at all addresses to discover if a
PHY is there.

Hence when slave.c tries to connect to the PHY, only the PHY you
listed in DT has been found.

I don't see a way around this, at least not without adding a new
variant of of_mdiobus_register which combined DT with a bus scan.

	Andrew

