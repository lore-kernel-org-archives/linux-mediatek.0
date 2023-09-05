Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A30BC83F2C
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 11:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYzf4PHEoghXFdMmCHAIIQGECn1QD3BWvIxyh4qMpVg=; b=BQJYWZdg7XMtSLyTCeUq3FCXP8
	RVkl/v1PnviO7wWr8+d4VpeUzCofqv8V4q3oZK6NZwzIlJ2T/Tt7xyeiD7JY3vW58ZJ/DZSB9EtnN
	khlptMBgNfFudap9GKB/n8595kxf/+W8n7Q14hjPbTloe4oT2ZhmGn/Joi68GeRewB1GU2G7jC7Zu
	1lO0dB7CsKHfFDMGvdBkaysJzTIa0P/H1rGhbfSDXzGrWwAIVe3O1QyKtXjNlqEOdtZ67la3vvw4w
	dhJP7GbZzOn2L4gLvVTejvhdQYU/VVJ5GJfpF9ksWlQmJtfh0x8fzOMLFvP4PWlZePjydjC7VakbX
	GlVLez0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTnV-005rrU-2e;
	Tue, 05 Sep 2023 11:00:41 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdTnS-005rqX-0B;
	Tue, 05 Sep 2023 11:00:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC1F22000E;
	Tue,  5 Sep 2023 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1693911633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vYzf4PHEoghXFdMmCHAIIQGECn1QD3BWvIxyh4qMpVg=;
	b=b4qq1/Q1XTOsh7nK+KHIVbBxbzwl/avkrWEXgKOU2B+Pj2K6R2wBhChiSGk4Zu6IuZM9QG
	JCkh12kBuPNaYmUpT+Auid5rRkeOQZIJWiOGxBeuI4uoU6BARODxPVO3OT2dFqeQohREd9
	2LoT+xQwnHIyxXD//Skg6vsAXfBsChtx+E1yd2x9EN4X14piSf8DElXn19XSXTMoSIC4S7
	7DaQqiu/W03BQK8ZqYHsYbZ+uXdcK7+sjJbuEuAc9sNu62H96AGoUDMYHHiECZ6FVFGjIP
	HarvB3RK0ZrrkTB5/8oQ5V2y6C56O44zgBf/2JCfP+E8RdfZwaFYtaPjAoVv9w==
Message-ID: <03d3341b-be77-4b25-bec2-fcae91a549d3@arinc9.com>
Date: Tue, 5 Sep 2023 14:00:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 UNGLinuxDriver@microchip.com, Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <20230814143601.mnpxtcm2zybnbvoh@skbuf>
 <0cee0928-74c9-4048-8cd8-70bfbfafd9b2@arinc9.com>
 <20230827121235.zog4c3ehu2cyd3jy@skbuf>
 <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <CAJq09z6eghuHY+b2y-kGmjKnLiEEOABXGKhjnB-PxJ=-GtYD4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_040038_378727_EF632711 
X-CRM114-Status: GOOD (  23.22  )
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

On 5.09.2023 05:42, Luiz Angelo Daros de Luca wrote:
>>> [1] ...this. The SMI-controlled and MDIO-controlled Realtek switches are
>>> otherwise the same, right? So why would they have different dt-bindings?
>>
>> Honestly, I'm wondering the answer to this as well. For some reason, when
>> probing the SMI controlled Realtek switches, instead of just letting
>> dsa_switch_setup() populate ds->slave_mii_bus, on realtek_smi_setup_mdio()
>> on realtek-smi.c:
>>
>> - priv->slave_mii_bus is allocated.
>> - mdio_np = of_get_compatible_child(priv->dev->of_node, "realtek,smi-mdio");
>> - priv->slave_mii_bus->dev.of_node = mdio_np;
>> - ds->slave_mii_bus = priv->slave_mii_bus;
> 
> I might be able to help here. The Realtek SMI version created a custom
> slave_mii driver because it was the only way to associate it with an
> MDIO DT node. And that DT node was required to specify the interrupts
> for each phy0.
> It would work without that mdio node, letting DSA setup handle the
> slave bus, but it would rely only on polling for port status.
> 
> As we only have a single internal MDIO, the compatible string
> "realtek,smi-mdio" would not be necessary if the driver checks for a
> "mdio"-named child node. Maybe the code was just inspired by another
> DSA driver that uses more MDIO buses or external ones. The "mdio" name
> is suggested by docs since it was committed
> (https://www.kernel.org/doc/Documentation/devicetree/bindings/net/dsa/realtek-smi.txt).
> That name was also kept in the YAML translation
> (https://www.kernel.org/doc/Documentation/devicetree/bindings/net/dsa/realtek.yaml).
> 
> The Realtek MDIO driver was merged at the same release that included
> the change that allows dsa_switch_setup() to reference the "mdio"
> OF-node if present. That way, it could avoid creating a custom
> slave_mii_bus driver.
> 
> I submitted a small series of patches to unify that behavior between
> those two drivers:
> 
> https://lore.kernel.org/netdev/CAJq09z44SNGFkCi_BCpQ+3DuXhKfGVsMubRYE7AezJsGGOboVA@mail.gmail.com/
> (This is my answer to the series opening message to include the first
> paragraph ate by the editor)
> 
> There was some discussion but not NAC, ACK or RFC. It would have
> dropped some lines of code. I can revive it if there is interest.

I'd like this to happen, thanks Luiz!

Arınç

