Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC5FCE7A81
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 07:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ThyHS05ydQoxH/bSwHr8OdaIUfcQUC2ILgoMwJVFYr4=; b=tRJmrSChZaM0E29JzcVJ19K7Y/
	+bjtDoEivdO+8XeI9hB6g9EhqNt2rpzO3kQ/q6vTavz4MOTNxPW6Xt+fvbYh+kNnK3woZCkgmHdrE
	PfPzwc+bAre3Hk1c9EktctBDU89fo9H3ZJT5+ws2mB+i2dIE2pPNKE5oByc3Z5iG1l6sDT2jSBNhg
	VEZSK85nPzEv30/r3/aiGjX5awpHSFZNo3TQBoaQAdjEI1L75jn+GYrrljryz254jfoM23c94Ig0E
	Bei7tZpmRegwvH1DU03ZDF7m4cu2bQ0/Pn898UcTZBq1jlpWUo42HXsemj4aZ03U4BcF1cUhDPQDB
	0bGerOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkgJh-00DegT-1s;
	Mon, 25 Sep 2023 07:47:41 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkgJc-00Def7-0J;
	Mon, 25 Sep 2023 07:47:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C471C000A;
	Mon, 25 Sep 2023 07:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695628052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ThyHS05ydQoxH/bSwHr8OdaIUfcQUC2ILgoMwJVFYr4=;
	b=gneWysS1thG64xcYgV9B5Q8Gn5+yngBBlc5x824QyPp2c7PzQI7wLQDx04UP1ox10czcO6
	B2c1PlnGWnAq7hp5tmUCvpUUXZrTcvvI1Qp/TYWvPG9MIDpLhQ7nv2dUAk67yJqPbQJxFV
	ISUdCq/usdTpgvyqsJiWPg2l0u8cEvfMQV17avNLh3cO2VAt2SjA44YE3waUGuBbq8UQrt
	VZwm+IgPE3H5YqKCe3UAtJkky0hG0xYsqx9Y4oBoyE6Do2qXh8VNygP+FC/O7PlBovtW0N
	QMimc5MAbDLr8/Zoh8KVirbAl2OOmdLCKAVACzxT93B//Vem2ZAmgtUzo4AZeg==
Message-ID: <e0191a5e-dadf-4f55-b421-1d1ffee8e53a@arinc9.com>
Date: Mon, 25 Sep 2023 10:47:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/10] define and enforce phylink bindings
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Conor Dooley <conor+dt@kernel.org>,
 George McCollister <george.mccollister@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Marcin Wojtas <mw@semihalf.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Marek Vasut <marex@denx.de>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 John Crispin <john@phrozen.org>, Madalin Bucur <madalin.bucur@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>,
 Shyam Pandey <radhey.shyam.pandey@xilinx.com>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20230916110902.234273-1-arinc.unal@arinc9.com>
 <ZQ2LMe9aa1ViBcSH@shell.armlinux.org.uk>
 <6c1bb7df-34cd-4db9-95b6-959c87b68588@arinc9.com>
 <4856b212-5bc5-4783-a184-b34a4a915878@lunn.ch>
 <5650a2a3-a36f-441e-b4c2-aa7c751b5af5@arinc9.com>
 <410dfe3c-6f99-4054-88f8-0acbd134cfce@lunn.ch>
 <228f24db-0a26-4d38-8f73-a9691262cc5f@arinc9.com>
 <2be01f7e-8bd0-42c5-bc82-b1da29b83e24@lunn.ch>
 <78e70cc9-a6ca-439b-bfca-3119299249de@arinc9.com>
 <29cd6190-a565-4f95-9de0-41ed7c7772e6@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <29cd6190-a565-4f95-9de0-41ed7c7772e6@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_004736_429737_12EB839C 
X-CRM114-Status: GOOD (  19.42  )
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

On 24.09.2023 17:55, Andrew Lunn wrote:
> On Sun, Sep 24, 2023 at 10:49:49AM +0300, Arınç ÜNAL wrote:
>> On 24/09/2023 06:15, Andrew Lunn wrote:
>>>>> There is a MAC driver currently under review which does not have a PHY
>>>>> at all. The MAC is directly connected to a switch, all within one
>>>>> IC. The link is always running at 5Gbps, the link is always up. It is
>>>>> physically impossible to connect a PHY, so get_link_settings just
>>>>> returns hard coded values.
>>>>
>>>> The fixed-link property would be used to describe the link of the MAC here.
>>>
>>> Fixed-link make sense for a general purpose MAC which could be
>>> connected to a PHY, or could also be used without a PHY. fixed-link
>>> simplifies the code in that the MAC driver does not see a difference,
>>> it all looks like a PHY.
>>>
>>> However for a MAC which cannot be connected to a PHY, there is no need
>>> to emulate a PHY. The MAC driver will be simpler. So i would not
>>> recommend a fixed-link in this situation.
>>
>> There's a link, it must be described.
> 
> Why must it be described?
> 
> Lets take this to the extreme to make a point. The chip has a ground
> pin. Must i describe that?

I think it depends on how important the information is, to be put on the
devicetree. I don't think a ground pin of an SoC is important enough to be
described on the devicetree. It could be described as a text on the
relevant devicetree document though. I've recently submitted a patch that
does a similar thing. I've described which pin groups represent which pins.

https://lore.kernel.org/lkml/20230917162837.277405-2-arinc.unal@arinc9.com/

For an ethernet controller, its link is the core part of the hardware.
Therefore describing the link was deemed important. Hence certain
properties were made to describe the link on the devicetree.

All I proposed was to make sure these properties are always defined on the
devicetree since, for an ethernet controller to exist, it must have a link.

Arınç

