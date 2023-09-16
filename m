Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BCDCD37BF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 16:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gR3DLgOcVXEyCHmeRvHW5kTpbx/Ml5B4FTcTxP2j0o=; b=ICL82HwB9yXiDugkGIxS7pwpos
	+v0JFzrwUHHSDOg9fAfwxB/OCd449GH9y0rq9yF5L+VEvE0esOZBrQySAheO49NCcDU9VhQRmCuw/
	/gPPfJMIdSLrV6Yf+a1IBwYePHBLLOMtmJJWPP+n/OlaOp5+Z83u9EkKBFyse9y1YRfh2FA8SRJOi
	OR23RsCiUCTE7I/KRx0Yhhz2wx/yBPsTbMThPOEMAmwfcKxuU6hdcLISMJHzJvg3fJTQNTcRNFpK+
	MX7LSUTpatiVkjpc4xSlNhK4kU49YmmZW7oobn/sLXfDfXpBY01ms0DFdnqDJr8ca2a4OXHY8O5Yw
	/HeYZZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhXxq-00CeIJ-0T;
	Sat, 16 Sep 2023 16:16:10 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhXxl-00CeHw-1v;
	Sat, 16 Sep 2023 16:16:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A761F20004;
	Sat, 16 Sep 2023 16:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694880962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3gR3DLgOcVXEyCHmeRvHW5kTpbx/Ml5B4FTcTxP2j0o=;
	b=dlTg8bzB+GMfQwAkNn10piDT3xlzayexaJtzerTcgHGpGMs/JAhpZPkaM8RoNcP//TSyqN
	3qqwDwy34P2RQiy3Kz8V9s5uw9bjz86onvrpaijDpXuq/oH81lB+2Yme5oZAxFBj7pTtCX
	oM2LDmFmQum3aFrwsNN4fZtg9PUMRqx6PwUFU7uvrKAlbbFMOzjF3Dqm9MQ+BO6pxYcOMh
	ifohoX73vuoVQ12QX1Ql7G1QHgmUvNpWCS/+P+cwSVNJ19TSSVrCnNe1mXIr/9LntGG2p8
	3yC5m9V4cZIzMAHQGVFJEoeGGAnb+x1HyLflkFe7W4wgbaNMfGzsecHWLd0tfg==
Message-ID: <e0a925bb-d4f1-44a1-8fe3-e1a59c4a7476@arinc9.com>
Date: Sat, 16 Sep 2023 19:15:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/10] dt-bindings: net:
 marvell-armada-370-neta: convert to json-schema
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Sean Wang <sean.wang@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Woojung Huh <Woojung.Huh@microchip.com>, John Crispin <john@phrozen.org>,
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Oleksij Rempel <linux@rempel-privat.de>,
 Shyam Pandey <radhey.shyam.pandey@xilinx.com>, Andrew Lunn <andrew@lunn.ch>,
 Steen Hegelund <steen.hegelund@microchip.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Daniel Machon <daniel.machon@microchip.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marcin Wojtas <mw@semihalf.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, "David S. Miller" <davem@davemloft.net>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Daniel Golle
 <daniel@makrotopia.org>, Horatiu Vultur <horatiu.vultur@microchip.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-kernel@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Marek Vasut <marex@denx.de>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Sekhar Nori <nsekhar@ti.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Kurt Kanzenbach <kurt@linutronix.de>, Jose Abreu <joabreu@synopsys.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 mithat.guner@xeront.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 George McCollister <george.mccollister@gmail.com>, erkin.bozoglu@xeront.com,
 linux-renesas-soc@vger.kernel.org
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <20230916110902.234273-11-arinc.unal@arinc9.com>
 <169487631064.1637966.13545721653989465162.robh@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <169487631064.1637966.13545721653989465162.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_091605_930496_012C318A 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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

On 16.09.2023 17:58, Rob Herring wrote:
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/marvell-armada-370-neta.yaml:
> Unresolvable JSON pointer: '$defs/phylink'

Not surprising as this is added with a previous patch in this series.

> doc reference errors (make refcheckdocs):
> Warning: Documentation/devicetree/bindings/net/marvell-neta-bm.txt references a file that doesn't exist: Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt
> Documentation/devicetree/bindings/net/marvell-neta-bm.txt: Documentation/devicetree/bindings/net/marvell-armada-370-neta.txt

Will address.

Arınç

