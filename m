Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36263CE7A8C
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 06:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4oWvaYHBJFJ7O18JZNgwdBYWtURWzzwNBvvz0evj8O0=; b=mGAhGAAFCgk/OUe+eTe7jDsg3a
	8SanepcwP48fJoliuH2acYzxIyezR4I4DNWQhlXykvVv8aI0TT2B25oJ06GqG4nMRzUt8iYVx+PVr
	jAUOf6ZrF4ZN42vKv+7DpCB1HnwROLkYJfuH05naPha0ldwjVjaAtAXzRah2tmJjIsyu2hUYas1vO
	cWBKE+bhXahPmYpFfJrYzCIMaI0oGSWpKU4cWOT6Sjg6dfdbqEDu9GAQZqR3smgDuyQ1DWYAU+BmF
	ZV1ngZbtG4xqBcN2UNByKMpbXY4lt5qsD1SnQQh3OfS4Ej+L0qWpCeRNLQPZ9w7uUiNTluvH/97L5
	QlC3/N/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjvnE-00AVrC-2L;
	Sat, 23 Sep 2023 06:07:04 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjvnA-00AVpz-20;
	Sat, 23 Sep 2023 06:07:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4B489FF803;
	Sat, 23 Sep 2023 06:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695449214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4oWvaYHBJFJ7O18JZNgwdBYWtURWzzwNBvvz0evj8O0=;
	b=bmNdp5wiJX4kR9210Tg5h8vw/C+LDUgASJM+L38kQ5zwtSJ0ZsD5WjI9bmd3v1xtSTo34j
	Mnf1r6k/vB5tk/3r3l4oq9duEyJvLJ7rny5M6wl9Iam9s5L0nf8QruRA5UIvZupcUB25Rw
	NYW7dYS66SXbVxI6DOaCHewAiyMQH5CfkwBOBbG8/PF/gv/BgNlf3WGVEcOmnF3NXyr9mO
	R5ea45R4MivUVkJQhmKS7+ezlXx+dqp4PffhAsPxoTYAtYTPg9s9G0opA9kC9qeJt0Mbws
	tMFAq/inmnLXiz6AxYPTloye8TBYOFHrBu2N77AMkdxnGsYOFRw5tF3nwIDU3g==
Message-ID: <a1cdbed7-8d71-44df-a6fc-7b1d2066cc29@arinc9.com>
Date: Sat, 23 Sep 2023 09:06:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/10] define and enforce phylink bindings
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>,
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
 <ZQ4VPEuXB3+e48Qs@shell.armlinux.org.uk>
 <f610de0b-a804-463d-b7ae-0433dbb809a9@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <f610de0b-a804-463d-b7ae-0433dbb809a9@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_230700_981682_D766D304 
X-CRM114-Status: GOOD (  10.01  )
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

On 23.09.2023 01:44, Andrew Lunn wrote:
>> However, to dress this up as "phylink requires xyz, so lets create
>> a phylink binding description" is just wrong.
> 
> +1
> 
> Also, phylink is a Linux implementation detail. Other OSes using the
> binding don't need to have phylink. Yet they can still use the DT
> blobs because they should describe the hardware, independent of how
> the OS drives that hardware.

I haven't stated it directly but I've been agreeing to this fact since the
start of the discussion on patch 7.

Arınç

