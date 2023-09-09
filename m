Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947A0EEB57F
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 06:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u1J79G2gHB19xem1WbfDmsg7JRZlNKmKwN1OuiBpPFQ=; b=qIUJ/LnZiHdjBmQ1donyceod0A
	fWhe8jGeSsiQogxCXGuepwo6n8cvwI6tzbErZRI7Tp0OsW2fB2T6msB797Y2HWqLcnHC3b+BzHrJA
	NNn+gKJ+uqH7DXG+VgaptJQOZ+v2OdK7AHca+jDq4IBdvrmLtBoR2bA7CyjqtXN6k+phPbRFPYH4o
	jWBeK8wrMQmOfk4r3M/BLu9A5gwDLhR9sNJfzTorMoFzL86Z3ftJbYbeQv1lLvH4Oi9/1LFN/5dRa
	GK9+ZsZ8712lNw1SXAtYBmev8ial7GoTDVHCgXBfoUg7/kab/pc7wZbaw8UXz8NxFKpsVyDQ9J6/P
	n8zNObWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qerO2-00F5wl-32;
	Sat, 09 Sep 2023 06:24:06 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qerNz-00F5vF-1K;
	Sat, 09 Sep 2023 06:24:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFC7D1BF204;
	Sat,  9 Sep 2023 06:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1694240636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u1J79G2gHB19xem1WbfDmsg7JRZlNKmKwN1OuiBpPFQ=;
	b=gUTVg15eSAIqTlyoV6GvQ5Xfsm0JTJC7ByLx0Qp2Ip+Q4+72vDYnmx483BODHX9+AIu0Yx
	tSwaInjnfjqM0OhV1C4by8j8wP+8AcBuL6j4B4p4LMUPVdKCTVjCw399KOI3x6XeO9OaEf
	TOJqE1rmERhO1rp8c/lC9mQ7yPalrAmaaVIC6cWVM3Ow0mqDxiBY89vWNUnMZTR7F+bSvL
	wh/DQ4XiaIgnFRY6h/AVC6EqJVtCANTuWKQ7vpEr7QJrhgoR2s36HhNZGbho+dhvbB/3Ju
	pieHhES/P5tNXoWbPO4fXBsi8kB57DhUB2A7qLtuzBMdqeXRH/+E+qY6wxzdyw==
Message-ID: <563ac27a-22f2-463e-b5c1-9df721842976@arinc9.com>
Date: Sat, 9 Sep 2023 09:23:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vladimir Oltean <olteanv@gmail.com>,
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
References: <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
 <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
 <617c51cf-2c09-4865-ac60-96599db597e7@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <617c51cf-2c09-4865-ac60-96599db597e7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230908_232403_769929_22467FD9 
X-CRM114-Status: GOOD (  15.39  )
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

Hi Andrew,

On 14.08.2023 16:09, Andrew Lunn wrote:
>> Ah okay. I didn't consider the switch architecture where the data interface
>> of the PHY is connected to the switch, and the PHY management interface is
>> connected to the mdio bus that the switch is connected to.
> 
> The generic Linux architecture for PHYs and binding them to a MAC via
> a phandle allows the PHY to be on any MDIO bus anywhere. DSA has some
> additional shortcuts to support 1:1 mapping if the switch has its own
> MDIO bus, without describing it in DT, but this is just in addition to
> the generic code.
> 
>> Not json-schema documentation, don't care about:
>> - ar9331.txt
>> - lan9303.txt
>> - lantiq-gswip.txt
>> - marvell.txt
> 
> The marvell switch can have up to 2 MDIO busses. If i remember
> correctly, there is also one switch which has one MDIO bus per port.

I'm writing the json-schema for Marvell switches. I've checked a few
devicetree source files on Linus's Linux tree, I only see two buses used at
the most. The internal bus and another bus with
marvell,mv88e6xxx-mdio-external. I've never seen a devicetree with
marvell,mv88e6250 though. Could the switch that has one MDIO bus per port
be this one? Also, is every bus of this switch a
marvell,mv88e6xxx-mdio-external bus or, one internal bus and the remaining
are marvell mv88e6xxx-mdio-external buses?

Arınç

