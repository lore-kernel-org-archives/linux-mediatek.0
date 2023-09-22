Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD3CE7D0C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Sep 2023 05:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OAps/X6vpxbgYNTDEh93GQiH1oj1Rsmu0/cgFBFZydk=; b=WJ4IaYkrq5sKOIK1QhGCUHbCjP
	AdDPO5asi2sjAgmFPQr/pzv2jatnbOu89R7fdc5ymjN4NPI3PPqHNLDERPyelAPreAw2+5XYW6LOH
	r2n8ihQRklKFPa7DYoXSmKP3qZPXJiQwgBU4VY7pdOAbHvRiQGH8t301sXxdz97WKAeQe+/aFdcyq
	tdh63BH/V0gkEFvdsCcDArz6/7rqYSO7VC64woaqwRBqJE9gt4esrTWkzZMcSvcKbDiL7j7vx66GX
	PR57Wn+ZTibaQJPVVqEYobd/yP/0cWIeQftFzJmC+JUDi3Y6GgQhDeuV4iVEZyUVAXAlPxe9IYUTJ
	jEMxo18g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ0v-007x7W-0Y;
	Fri, 22 Sep 2023 05:47:41 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjZ0q-007x5X-1B;
	Fri, 22 Sep 2023 05:47:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 50BE6FF806;
	Fri, 22 Sep 2023 05:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695361647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OAps/X6vpxbgYNTDEh93GQiH1oj1Rsmu0/cgFBFZydk=;
	b=JCAnRGUxGP6RiaYQwdoP7kdNAst4L9X+DS9e3HJevQ2KWGPibSLAFiq8CzdWAtkGc4GcM8
	wmwEKyIECYyXH5JGqrZoE3u8VLuKAQ2rcXvuhAg7KNcXFoB+PyIMHXZHGSnHrzQrj+qPAB
	g8Z01S+FtsJLBXBDjHCW9SKJl5/joZ4NwO6EvQunGtrAv4dQJKmsxo56X8VKkRdWzZCaEU
	g7C8gTafjHaVzzrUu7ukYJZtVQf5kCytGKSWRhek6jLZMPqMycJTsw+aB7nXpRKgsxanTr
	0PctrJ6IOEEz64qxjLygVXUDzmWoK7zZC0aP8Pr5TZ1xSs4nkdDoI714+e5T6g==
Message-ID: <a87032fc-3ad5-4286-828e-77735475c2c5@arinc9.com>
Date: Fri, 22 Sep 2023 08:47:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/10] dt-bindings: net: enforce phylink
 bindings on certain ethernet controllers
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
 Marcin Wojtas <mw@semihalf.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Lars Povlsen <lars.povlsen@microchip.com>,
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
 <20230916110902.234273-8-arinc.unal@arinc9.com>
 <20230918181319.GA1445647-robh@kernel.org>
 <16710cf9-8911-4fed-8e2d-b19b581446c1@arinc9.com>
 <a8d49992-4fa8-4a9f-b954-79011a3040a8@lunn.ch>
 <85cc3b27-417e-4cf4-9f77-347a338c9d67@arinc9.com>
 <8935d431-be0c-43e0-a908-f7dff2048f7c@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <8935d431-be0c-43e0-a908-f7dff2048f7c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_224736_707551_1E26577B 
X-CRM114-Status: GOOD (  24.06  )
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

On 22.09.2023 02:29, Andrew Lunn wrote:
> On Thu, Sep 21, 2023 at 09:21:40PM +0300, Arınç ÜNAL wrote:
>> On 21.09.2023 16:00, Andrew Lunn wrote:
>>>> - Link descriptions must be required on ethernet controllers. We don't care
>>>>     whether some Linux driver can or cannot find the PHY or set up a fixed
>>>>     link without looking at the devicetree.
>>>
>>> That can lead to future surprises, and breakage.
>>>
>>> Something which is not used is not tested, and so sometimes wrong, and
>>> nobody knows. Say the driver is extended to a new device and actually
>>> does need to use this never before used information. You then find it
>>> is wrong, and you get a regression.
>>>
>>> We have had issues like this before. There are four rgmii phy-link
>>> modes. We have had PHY drivers which ignored one of those modes, it
>>> silently accepted it, but did not change the hardware to actually use
>>> that mode. The PHY continues to use its reset defaults or strapping,
>>> and it worked. A lot of device trees ended up using this mode. And it
>>> was not the same as reset defaults/strapping.
>>>
>>> And then somebody needed that fourth mode, and made it actually
>>> work. And all those boards wrongly using that mode broke.
>>>
>>> The lesson i learned from that episode is that anything in device tree
>>> must actually be used and tested.
>>
>> It looks like the root cause here was the lack of dt-bindings to
>> only allow the phy-mode values the hardware supports.
> 
> That would not help. The hardware supported all 4 RGMII modes. So
> listing all four in the dt-binding would be correct. But the driver
> for the hardware had a bug, and so silently ignored one of the
> modes. That then masked the bugs in board DT files.
> 
>> What I see here is the driver change should've been tested on all
>> different hardware the driver controls then the improper describing
>> of hardware on the devicetree source file addressed.
> 
> Which is what did happen. But it took a while to find all those broken
> boards.  For a period of time, we had regressions.
> 
> Bugs happen. It is a fact of life. But we want those bugs to be easy
> to find as possible. If we force DT writers to add properties which
> the driver never uses, they are going to be bugs in those
> properties. And those bugs are not going to be easy to find, and quite
> likely, they will only be found a long time after they are added. We
> should not be adding unused properties and bugs just to keep a yaml
> checker happy.

Understood. Then I will refrain from enforcing link descriptions altogether
as I can't justify enforcing them on ethernet controllers selectively
because certain Linux drivers don't make use of the link properties and may
expose bugs if used.

The link properties are still allowed for all ethernet controllers though,
just not enforced. But I suppose it's better to optionally find the bug
instead of causing a regression then finding the bug.

Arınç

