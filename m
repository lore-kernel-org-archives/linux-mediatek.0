Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448F2CE7A89
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Sep 2023 17:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MHhj+mHJkpQWkiuvF+5NLMuTrzWJfhOnzIw/bOrX/g=; b=nX1NXLByuTNxusMDw2D7S/aOs9
	qjqnuYnqVfNeQIJ9DakROu3fX8nMnBNtVmhVwQDQK8HSaixdpp8fhUM3GZViJ2Zjrg1Tq1MW5oTe6
	WFB0q48VCGwbbZYENeN7Q3RJQLOAtFCGqGdYUo+5vojtH62wvdkE2UWZxhm3Je6/Cb0UrkJt0E/BE
	54/MCG2kyrq4J4sQnJPEC7LmOrzqs3Etf4dKr9bK4pHQOOsKyxXj7ikrlxmWB8Q2oqlpFJ5PCez2Q
	zuF8tEzshkHw3xq8wtEXDCVmm63bgHI+TiEflF/dk9LKynP7e5YHcDRUzqT8mqbLaj+EvU6DW3ccc
	+m6pjW3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6nl-00BHZ6-0W;
	Sat, 23 Sep 2023 17:52:21 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk6ng-00BHY4-1l;
	Sat, 23 Sep 2023 17:52:18 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B91560002;
	Sat, 23 Sep 2023 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695491529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+MHhj+mHJkpQWkiuvF+5NLMuTrzWJfhOnzIw/bOrX/g=;
	b=jDirt66ui1jeO6Hlu8+DPSb5+zHMG0NAm5TnbL3SXUkqMd2JwQi4ai1vnq5/X8Szk8Ne7z
	ENjPyW42YCD/CE9rQbsIG4H1UFUqoq3MajYpNOiPaA9PQhsRenN33jhzGldytorXAkGazx
	pzK3RAGNISijyoFuVO5djM8uZZu7umw/KSQ2/O0gZIVK3GA3yVHscBA3fn/TO70W3K9HdC
	4uOJXfqjDMG1UPOWg8w2m8UEfTzRUCy9deNdDY72BMM+TrepZ6NuVQoeSr/9HrWlkXdWAV
	h4H7TvpRvRpYoNxai0idxf4Frq+AljXkzEjzrY3S0xQefYMZ7Y3szYBj1IrTUA==
Message-ID: <228f24db-0a26-4d38-8f73-a9691262cc5f@arinc9.com>
Date: Sat, 23 Sep 2023 20:51:44 +0300
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
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <410dfe3c-6f99-4054-88f8-0acbd134cfce@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_105216_880530_717D2AF2 
X-CRM114-Status: GOOD (  26.67  )
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

On 23.09.2023 18:12, Andrew Lunn wrote:
> On Sat, Sep 23, 2023 at 09:28:41AM +0300, Arınç ÜNAL wrote:
>> On 23.09.2023 01:36, Andrew Lunn wrote:
>>> You are missing:
>>>
>>> - The MAC has firmware driving the PHY, nothing for linux to do.
>>>
>>> There are properties in ethernet-controller.yaml the MAC driver would
>>> however like to use such as local-mac-address, max-frame-size,
>>> nvmem-cell-names etc.
>>
>> This is interesting. This is clearly a hardware difference of the ethernet
>> controller.
>>
>> I believe this fits case 1. There's still an MDIO bus the ethernet
>> controller uses, there's still a PHY on the MDIO bus which the ethernet
>> controller uses.
> 
> Why must there be an MDIO bus? All the bus provides is a communication
> channel to the PHY. There are PHYs which are memory mapped, or use
> I2C. SFP are a good example of I2C, which Linux maps to MDIO just to
> make things simple, but the hardware is I2C. Why must there be a PHY?
> Maybe it is a Base-K link, i.e. a baseboard link to a switch, or a BMC
> or something.

There's no requirement for an MDIO bus or a PHY. If the MAC is connected to
a PHY, only the PHY node needs to be described. The PHY can be controlled
by any interface, I2C, MDIO, or something else. If there's no PHY, the
fixed-link property would be used to describe the link.

> 
>> The only difference is the firmware of the ethernet
>> controller controls... What exactly does the firmware control that a Linux
>> driver would have controlled instead? Just configuring the link settings of
>> the MAC?
> 
> A MAC driver implements struct ethtool_ops:::get_link_settings and
> set_link_settings. For a MAC driver using phylib or phylink they
> typically then call into phylib or phylink to do the actual work,
> maybe with a bit of pre-processing in the MAC driver.
> 
> A MAC driver using firmware would typically make an RPC into the
> firmware to implement these calls.
> 
> There is a MAC driver currently under review which does not have a PHY
> at all. The MAC is directly connected to a switch, all within one
> IC. The link is always running at 5Gbps, the link is always up. It is
> physically impossible to connect a PHY, so get_link_settings just
> returns hard coded values.

The fixed-link property would be used to describe the link of the MAC here.

Arınç

