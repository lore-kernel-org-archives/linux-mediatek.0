Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD737C77B73
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Apr 2023 18:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Azc4Hc1srpPKgzIM+J+f5sUKPmY+suHFF9oAfbKeBhU=; b=3EBSrmYCdXedgRQ9QSnZkk25bT
	YwU9/0/qno8JqR68+8XYCEbKATrTnqnc41sP8CaimEJCDnrflXTCC8U1WgKBZig0+OUVV6DkfYkQN
	Glv+fp1oASZ7s0eSEE/pn2wL+MyJvbWvXD5vMgThA/zzuejBpVvUDbmqyyl7nyL5c3GEaiUCNfhID
	mwrlFok4tUBhAA0einzL00V9S4WkeS8ah3gDrsNzibzBqVGVqLzBf+R+SBnE3Q2/y6WjEWUAjBOeS
	9vsB3oFl3wP/9tf4vrMH6BRz8h4jW8v0klm+nG2JBYawASGdnFhJ7/XBM0V7UyL2pybSifsgxbel8
	3doR04NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptBnR-00Ed1F-0a;
	Sun, 30 Apr 2023 18:29:17 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptBnM-00Ed0Y-2V;
	Sun, 30 Apr 2023 18:29:14 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682879329; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Df4NHlvOv469Uzy5L8lZNU252LcUatMtKixmuVpIr3/LCgHDQQnncMm8FfsyeZm+q3TsH0y6ad1G6jpSVuudH8k++o1Ruk3zGjdiDJH7x7+CLREVINO5kRsHLOskmDU0PkeNRCAdYcbgy0ojT5mkh31d2ag2XPX7OzNHtI43DSA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682879329; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Azc4Hc1srpPKgzIM+J+f5sUKPmY+suHFF9oAfbKeBhU=; 
	b=W4UMlZXdcTam16sk55nJXZs6QqlEw0O958MtmrNUnn0j7IDElKXl4H4VTDUiNVoccs8JaJbM/xam2UQF5babseT3DtEKqh5FmlDbgOkYuXpxVhOK9HNHXDNYtYuPr7Csa6/QMdtkCTzEQ5FuhW+k7Pek1xdXg1vwQYAN/wACOfc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682879329;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Azc4Hc1srpPKgzIM+J+f5sUKPmY+suHFF9oAfbKeBhU=;
	b=VNwLLh0SrtzCxN6J1ejN0CMx3NFNwTYCaRUy/0vEUpT4/TOw7PaAB2fLpnbsqJJW
	c4DCv+YAlxeYQwVmsAP8nt1TXAxmdPaw9Ma7QWCJx7Pl6gUFr0MeKvm+yR68ztGF2Ip
	0Ce0cbbyPhqFb1qotE62U9wQdXUZ+ODu6/3jNJlk=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 168287932708259.260584656568085; Sun, 30 Apr 2023 11:28:47 -0700 (PDT)
Message-ID: <a6c6fe83-fbb5-f289-2210-6f1db6585636@arinc9.com>
Date: Sun, 30 Apr 2023 21:28:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] dt-bindings: net: dsa: mediatek,mt7530: document
 MDIO-bus
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Bauer <mail@david-bauer.net>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230430112834.11520-1-mail@david-bauer.net>
 <20230430112834.11520-2-mail@david-bauer.net>
 <e4feeac2-636b-8b75-53a5-7603325fb411@arinc9.com>
 <396fad42-89d0-114d-c02e-ac483c1dd1ed@arinc9.com>
 <04cc2904-6d61-416e-bfbe-c24d96fe261b@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <04cc2904-6d61-416e-bfbe-c24d96fe261b@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230430_112912_894768_9D5D857C 
X-CRM114-Status: GOOD (  13.87  )
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

On 30.04.2023 20:18, Andrew Lunn wrote:
> On Sun, Apr 30, 2023 at 07:17:10PM +0300, Arınç ÜNAL wrote:
>> On 30.04.2023 15:34, Arınç ÜNAL wrote:
>>> On 30.04.2023 14:28, David Bauer wrote:
>>>> Document the ability to add nodes for the MDIO bus connecting the
>>>> switch-internal PHYs.
>>>
>>> This is quite interesting. Currently the PHY muxing feature for the
>>> MT7530 switch looks for some fake ethernet-phy definitions on the
>>> mdio-bus where the switch is also defined.
>>>
>>> Looking at the binding here, there will be an mdio node under the switch
>>> node. This could be useful to define the ethernet-phys for PHY muxing
>>> here instead, so we don't waste the register addresses on the parent
>>> mdio-bus for fake things. It looks like this should work right out of
>>> the box. I will do some tests.
>>
>> Once I start using the mdio node it forces me to define all the PHYs which
>> were defined as ports.
> 
> Try setting ds->slave_mii_bus to the MDIO bus you register via
> of_mdiobus_register().

That seems to be the case already, under mt7530_setup_mdio():

	bus = devm_mdiobus_alloc(dev);
	if (!bus)
		return -ENOMEM;

	ds->slave_mii_bus = bus;

The bus is registered with devm_of_mdiobus_register(), if that matters. 
(My current knowledge about OF or OF helpers for MDIO is next to nothing.)

The same behaviour is there.

Arınç

