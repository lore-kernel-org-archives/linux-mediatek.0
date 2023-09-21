Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6BAE71060
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKm5PjEzUxyMudDyWH1l+GObMoy6S9qVw27naJU6pOw=; b=4TZPJCj6cciLk1/okwJBoUzTb1
	RkmaVYI+sTr94O9HcfG1TNxbUyRiza7HkE1HGl2/32JEe+6Hlwds3GU+IpVaUMXqO+v8ocKYiAH9t
	uOigZ+eZcwU+ZzMgKEMQ1HhYad9FeJng1Hty+mOcDkb1H7pHu7zpwXWxf0UMxixY3KOl3LSvlEjFm
	MUpL2WVY5Y8VerCbO0V6mJ1gdlrSN++QB1oY4deAIdu8hBsPP1ss6r9EVF20340pnMLbB5qrYKUb9
	nVd/7tjPnSyFv5RkgXLjW4/mBM6fEDUYSvl/8Zh+E0xL6AWw6vmZkaFMP0Cuh4ZsqVqldsEy0r2q9
	KqYiMZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJIy-00652q-0h;
	Thu, 21 Sep 2023 13:01:16 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJIu-00651t-11;
	Thu, 21 Sep 2023 13:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=qKm5PjEzUxyMudDyWH1l+GObMoy6S9qVw27naJU6pOw=; b=OUJduL3Hp9PrYXAS7WiSY/LcH1
	OzGr8ycxrYFQLqMLsxZp2JyY+1HhJQ3G1rEkjVVTPEmQByleh6sMMBuKozPsnpZzvwvvJJ3JLVXzN
	8J0txZkz8lhtHI4Me/lysAATpn/bfPA9V/KGdeZAs/cZy4vtQmMIazip89Sw2atjKjJo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qjJHr-0075OV-24; Thu, 21 Sep 2023 15:00:07 +0200
Date: Thu, 21 Sep 2023 15:00:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
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
Subject: Re: [PATCH net-next v2 07/10] dt-bindings: net: enforce phylink
 bindings on certain ethernet controllers
Message-ID: <a8d49992-4fa8-4a9f-b954-79011a3040a8@lunn.ch>
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <20230916110902.234273-8-arinc.unal@arinc9.com>
 <20230918181319.GA1445647-robh@kernel.org>
 <16710cf9-8911-4fed-8e2d-b19b581446c1@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16710cf9-8911-4fed-8e2d-b19b581446c1@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_060112_390668_38620F28 
X-CRM114-Status: GOOD (  22.28  )
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

> - Link descriptions must be required on ethernet controllers. We don't care
>   whether some Linux driver can or cannot find the PHY or set up a fixed
>   link without looking at the devicetree.

That can lead to future surprises, and breakage.

Something which is not used is not tested, and so sometimes wrong, and
nobody knows. Say the driver is extended to a new device and actually
does need to use this never before used information. You then find it
is wrong, and you get a regression.

We have had issues like this before. There are four rgmii phy-link
modes. We have had PHY drivers which ignored one of those modes, it
silently accepted it, but did not change the hardware to actually use
that mode. The PHY continues to use its reset defaults or strapping,
and it worked. A lot of device trees ended up using this mode. And it
was not the same as reset defaults/strapping.

And then somebody needed that fourth mode, and made it actually
work. And all those boards wrongly using that mode broke.

The lesson i learned from that episode is that anything in device tree
must actually be used and tested.

> Although I see dsa.yaml and dsa-port.yaml mostly consist of describing an
> ethernet switch with CPU port(s), there're properties that are specific to
> DSA, such as dsa,member on dsa.yaml and dsa-tag-protocol and label on
> dsa-port.yaml.

I would say dsa,member does describe the hardware. It provides two
bits of information:

Which cluster of switches does this switch belong to. You probably can
derive it using the DSA links between switches, which is also a
hardware property. But having it in device tree makes it simpler.

Which switch is this within a cluster. You need to be able to say:
Send this frame out Port X of switch Y. How does a switch know it is
Y? It could be strapping, which is clearly a hardware property.

dsa-tag-protocol is similar to phy-mode. It tells you the protocol
running between the CPU port and the SoC master interface. You often
can imply it, but again, it could be determined by strapping on the
switch.

label is an interesting one, and probably would not be accepted if it
was proposed now. But it has been around a long time. It also does
describe the hardware, it is what is printed on the case next to the
RJ45. To make the user experience simpler, we then try to make the
linux interface name match the label on the case.

	Andrew

