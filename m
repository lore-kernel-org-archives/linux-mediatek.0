Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D25CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 18:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nrt94HanryDqPgXgekCFx2ZT5UiAhwFjtxoVOl3dBZ8=; b=r2jAiWLKefukM3NhJIF7nmBXiG
	xlCe/eAEVKI8X3dJGzT2W0jJHWG6x0dwkO9AmJ096cspfdqD8swhKlDQNujXdkYyhvKohr+JHt40l
	+YovYikvO9stqc10NSKZlJ4KwRBhE6qStQ2M48wjaogh+fQymgy7dyswJQthTeZJHVFUp5Tl1lgCO
	IqqCyvs/924D6rHPjfhXlu3+tSZ5abQoP+ndkQFudyGZmElkFWGOeAkINhhGcFah8wnGKKLPxT53R
	LCzQSP8+ttw5VMNgZHhPXwt3KoY9D4sWWK3vVcQW+J6XxNFxCJ6AC1rwL7cmQQsS9B3y2HA3kcTuS
	0nuPg8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIkc-00G3eO-1V;
	Mon, 18 Sep 2023 18:13:38 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIkY-00G3d9-2P;
	Mon, 18 Sep 2023 18:13:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 44DFDCE1049;
	Mon, 18 Sep 2023 18:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9611C433C8;
	Mon, 18 Sep 2023 18:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695060808;
	bh=rQ7ojhg05dRv+DYjdzxtwP35g4EgY5jql6tHXuMTQJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A9MTYIWeX6qk/C2NyyQZJsGmkblO+CavtmKS3/LkcoyVDKlKm3UMpqXWtKQVjPSPh
	 P9SGB8nAeDA3/TdvpUYDo8iyArokxssFSU2zhYissgl4C3jsYBjoAIs2kNHyzI3uKJ
	 dLERPpgiGV576S3L9yGF0jfUINiS6a40lLYn5CdayIZk+07/4oE3a12w64ku9VKiO1
	 ndQ4U9jqJCHjN/krZ8vPEGLpkPVlYC/1fdSm6IF6h2Y5T+nWNrVLKjFRl5hn92NDW5
	 XipP+Vnp8GULgxTMvZHToE/3q0oSMZdoXAhA3FnqDgWD2crGb330IFlahMlm9BunKr
	 SxwrcGcWJz5ew==
Received: (nullmailer pid 1463138 invoked by uid 1000);
	Mon, 18 Sep 2023 18:13:19 -0000
Date: Mon, 18 Sep 2023 13:13:19 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, George McCollister <george.mccollister@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>, Marcin Wojtas <mw@semihalf.com>, "Russell King (Oracle)" <linux@armlinux.org.uk>, Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>
 , Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Marek Vasut <marex@denx.de>, Claudiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, John Crispin <john@phrozen.org>, Madalin Bucur <madalin.bucur@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, Horatiu Vultur <horatiu.vultur@microchip.com>, Oleksij Rempel <linux@rempel-privat.de>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar
  Nori <nsekhar@ti.com>, Shyam Pandey <radhey.shyam.pandey@xilinx.com>, mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net-next v2 07/10] dt-bindings: net: enforce phylink
 bindings on certain ethernet controllers
Message-ID: <20230918181319.GA1445647-robh@kernel.org>
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <20230916110902.234273-8-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230916110902.234273-8-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_111335_140881_E7576F3F 
X-CRM114-Status: GOOD (  15.42  )
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

On Sat, Sep 16, 2023 at 02:08:59PM +0300, Arınç ÜNAL wrote:
> Phylink bindings are required for ethernet controllers that utilise
> phylink_fwnode_phy_connect() directly or through phylink_of_phy_connect(),
> and register OF-based only MDIO buses, if they register any.

What is phylink?

Don't describe/justify binding changes based on some Linux functions.

> All the drivers that utilise phylink_fwnode_phy_connect() directly or
> through phylink_of_phy_connect():
> 
> - DSA
> - drivers/net/ethernet/mscc/ocelot_net.c
>   - mscc,vsc7514-switch.yaml
> - drivers/net/ethernet/microchip/sparx5/sparx5_netdev.c
>   - microchip,sparx5-switch.yaml
> - drivers/net/ethernet/altera/altera_tse_main.c
>   - altr,tse.yaml
> - drivers/net/ethernet/xilinx/xilinx_axienet_main.c
>   - xlnx,axi-ethernet.yaml
> - drivers/net/ethernet/mediatek/mtk_eth_soc.c
>   - mediatek,net.yaml
> - drivers/net/ethernet/ti/am65-cpsw-nuss.c
>   - ti,k3-am654-cpsw-nuss.yaml
> - drivers/net/ethernet/atheros/ag71xx.c
>   - qca,ar71xx.yaml
> - drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
>   - fsl,fman-dtsec.yaml
> - drivers/net/ethernet/microchip/lan966x/lan966x_main.c
>   - microchip,lan966x-switch.yaml
> - drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
>   - marvell,pp2.yaml
> - drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
>   - fsl,qoriq-mc-dpmac.yaml
> - drivers/net/ethernet/cadence/macb_main.c
>   - cdns,macb.yaml
>   - Can register non-OF-based bus.
> - drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>   - snps,dwmac.yaml
>   - Can register non-OF-based bus.
> - drivers/net/ethernet/marvell/mvneta.c
>   - marvell-armada-370-neta.txt
> - drivers/net/ethernet/freescale/enetc/enetc.c
>   - fsl-enetc.txt
> 
> RFC: The drivers marked with "can register non-OF-based bus" seem to search
> the MDIO bus to connect the PHY to the MAC using phylink_connect_phy()
> and/or phy_find_first() if phylink bindings don't exist. Should we enforce
> phylink bindings on their schemas regardless?

Generally, describing the MDIO bus in DT is optional because the devices 
on the bus can be discovered. But then sometimes a device can't be 
discovered or has additional properties which aren't discoverable. So in 
general, an MDIO bus in DT should always be optional, but always 
supported (and validated) if present. If the device has a separate node 
for the MDIO controller (i.e. one with a compatible and reg for the MDIO 
controller register), then that should always be there (because the h/w 
is always there).

Rob

