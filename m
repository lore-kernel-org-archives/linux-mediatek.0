Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27132E7D0A4
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9iU/unn2B5Lg59HKhzCVV0eWDfanHflmRLaK3sdqHo=; b=wuS9jpRRktHn36SKXC+qtSz9Jg
	KYsbqdTKHJlUA1wGnhJrE4TtUHCEvedd6gvEB2DVAcbwVm0SLl93ogdVxmdVVJ09lmRXitHraLbfU
	GfGxMjv8dvYp/WTdQ67S4RKXKUHQhfMykH3quz1eT1jUaCwcQFv8pReF+ipjXrjusSjBCRiaFVgfN
	IbR4arSjaCJ1jAgJrONV4WCgRq72i5G4EuHLNKptsKZ/TVCh5qdXEKRyRqv0W8rxHrbb0kdn0wT8x
	kYW0/emKyEqrbKXsBcW8uDPCXuLEHL8st+CmKDPlA++v2FibmXA2G8cEQOygcI6HzNukagAMpeR5V
	ZcBR3BBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjOJf-006njP-2l;
	Thu, 21 Sep 2023 18:22:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjOJa-006ngU-2z;
	Thu, 21 Sep 2023 18:22:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8DB5DE0003;
	Thu, 21 Sep 2023 18:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1695320525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j9iU/unn2B5Lg59HKhzCVV0eWDfanHflmRLaK3sdqHo=;
	b=hIAvQ8dgDH08u0BdHXTRIonGAo3yKFcZMxt3uw1qDZt+5ypJM3sJ8rIIGEcwJHGsRoCaR2
	nifRNtpjmn7gbCEdBRqJLjOFn75cZwYAcde/5iEG/trGreT3o1bM9iKxU+HgDHKAPKa+G6
	Jih/l/+El0+VJyWic6ezaTZoSmTUD4vc8twqBfLOUADhLTcNE24hbSjRqw84uEROq3R32d
	LRudTD7HMQ1tbNO1XwIXQtasht2CBb5tWbQ7fPTz5pMthOnuUlVdU1aMrNn9xUw2PbB83C
	jw74tIo2/G4YcjHYlpb20jMeWYMc/0OX6IdrPVnzwLA259K7WqTosgU1i6+GRQ==
Message-ID: <85cc3b27-417e-4cf4-9f77-347a338c9d67@arinc9.com>
Date: Thu, 21 Sep 2023 21:21:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 07/10] dt-bindings: net: enforce phylink
 bindings on certain ethernet controllers
Content-Language: en-US
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
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <a8d49992-4fa8-4a9f-b954-79011a3040a8@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_112215_240834_202A0C97 
X-CRM114-Status: GOOD (  34.36  )
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

On 21.09.2023 16:00, Andrew Lunn wrote:
>> - Link descriptions must be required on ethernet controllers. We don't care
>>    whether some Linux driver can or cannot find the PHY or set up a fixed
>>    link without looking at the devicetree.
> 
> That can lead to future surprises, and breakage.
> 
> Something which is not used is not tested, and so sometimes wrong, and
> nobody knows. Say the driver is extended to a new device and actually
> does need to use this never before used information. You then find it
> is wrong, and you get a regression.
> 
> We have had issues like this before. There are four rgmii phy-link
> modes. We have had PHY drivers which ignored one of those modes, it
> silently accepted it, but did not change the hardware to actually use
> that mode. The PHY continues to use its reset defaults or strapping,
> and it worked. A lot of device trees ended up using this mode. And it
> was not the same as reset defaults/strapping.
> 
> And then somebody needed that fourth mode, and made it actually
> work. And all those boards wrongly using that mode broke.
> 
> The lesson i learned from that episode is that anything in device tree
> must actually be used and tested.

It looks like the root cause here was the lack of dt-bindings to only allow
the phy-mode values the hardware supports. What I see here is the driver
change should've been tested on all different hardware the driver controls
then the improper describing of hardware on the devicetree source file
addressed.

If a devicetree change that ensures proper describing of hardware is found
to break a driver in the future, then that exposes a bug on the driver and
the driver will have to be fixed. I don't see this upholding writing
dt-bindings that ensures proper describing of the hardware.

> 
>> Although I see dsa.yaml and dsa-port.yaml mostly consist of describing an
>> ethernet switch with CPU port(s), there're properties that are specific to
>> DSA, such as dsa,member on dsa.yaml and dsa-tag-protocol and label on
>> dsa-port.yaml.
> 
> I would say dsa,member does describe the hardware. It provides two
> bits of information:
> 
> Which cluster of switches does this switch belong to. You probably can
> derive it using the DSA links between switches, which is also a
> hardware property. But having it in device tree makes it simpler.
> 
> Which switch is this within a cluster. You need to be able to say:
> Send this frame out Port X of switch Y. How does a switch know it is
> Y? It could be strapping, which is clearly a hardware property.
> 
> dsa-tag-protocol is similar to phy-mode. It tells you the protocol
> running between the CPU port and the SoC master interface. You often
> can imply it, but again, it could be determined by strapping on the
> switch.
> 
> label is an interesting one, and probably would not be accepted if it
> was proposed now. But it has been around a long time. It also does
> describe the hardware, it is what is printed on the case next to the
> RJ45. To make the user experience simpler, we then try to make the
> linux interface name match the label on the case.

Looks like we can incorporate dsa.port and dsa-port.yaml into
ethernet-switch.yaml and ethernet-switch-port.yaml with adjustments.

Arınç

