Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F58EB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 10:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CPBiqpkD56xdLSiPejjVYwV1Sq+6r1HWFGOkdNUC+E=; b=cn+ppWA7Xa5Mi0RZlujt0Bn5S7
	mr3BlqD3L/plxigAegDKKn40PbGgTKluT1GZGf9YvLoGndBfwldb12Roy88/U5Ah7LHGcPDZwaQs0
	Ru0ymp+Qm9iyiFbs7EfeSBCdLWpkCYWlSinGQkgMRS6XFkIlshLS/XLZjAPBXWVbKe794XzS0J0/p
	dIBztht79xuFig7geQxxAjWK7pGbY/eUnNUYlIOc1oaKETjmuUVqLMf/06ug1b2RVArMxQxWFr+Ml
	MJEt3BdsH53J7LFPHE7/ug8pP2nKE7IqYfB+VkkXU33z3auYm0F3aQScnECzxj9VmdHyeAqCFnqP7
	F5xfSEeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUTF-00Gg8W-25;
	Mon, 14 Aug 2023 10:06:45 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVUTC-00Gg71-0V;
	Mon, 14 Aug 2023 10:06:43 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AFFA71BF209;
	Mon, 14 Aug 2023 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1692007599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CPBiqpkD56xdLSiPejjVYwV1Sq+6r1HWFGOkdNUC+E=;
	b=pmVZ7/v4e3/2MPQjoPucXGAIJRWmIdPGxlHTMR0et+tb7GZcPeX4c+ZBZNOW4iStCN/FoH
	/RPBJjKHlyVdQpaF80MzOP+H8EiGPZAJA6UyyZpxEvsZgqpOwhgczXfkL+GDCO1o4pws8M
	4w0IQE6XsGpxcyQp/RvVFkcTrLLCuK6QPQQMTq1ynP/im39jJN3liVA/PxfmL/2jMkR14e
	HaT5pR1rIx/E3PUEyzmVNn2wcVuf/aoUf8n0oa+1k5gYZnGee0+N8NUvIbvIsbbRjGVI2S
	ogoLa2U8CPylVpn6V0KxSkCrCauZs5CYsQPwbzoqtaHYgEjUxekMpM1yRuMtdQ==
Message-ID: <f5f468c1-b5a2-4336-b1d9-fd82da95b21d@arinc9.com>
Date: Mon, 14 Aug 2023 13:06:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
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
References: <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <20230812091708.34665-1-arinc.unal@arinc9.com>
 <20230812091708.34665-3-arinc.unal@arinc9.com>
 <abc44324-454c-4524-b05e-fe989755ea47@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <47b61929-5c2d-4906-b153-2046a94858c8@arinc9.com>
 <20230813112026.ohsx6srbt2staxma@skbuf>
 <8a8e14f1-0493-4298-a2cc-6e7ae7929334@arinc9.com>
 <20230813190157.4y3zoro53qsz43pe@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230813190157.4y3zoro53qsz43pe@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_030642_454714_4B108CF0 
X-CRM114-Status: GOOD (  16.81  )
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

On 13.08.2023 22:01, Vladimir Oltean wrote:
> On Sun, Aug 13, 2023 at 03:59:11PM +0300, Arınç ÜNAL wrote:
>>> sja1105 does not support an "mdio" child property. I haven't checked the
>>> others. Don't add properties that aren't supported.
>>
>> Adding the mdio property to the dsa.yaml schema will allow it on all of the
>> schemas that refer to dsa.yaml such as this one. This addition here is only
>> to disallow additional properties under the mdio property for this specific
>> schema.
>>
>> That said, my understanding is that the internal MDIO bus exists on all of
>> the switches controlled by DSA.
> 
> How come?
> 
>> Whether each individual DSA subdriver supports registering it does not
>> matter in terms of documenting the internal MDIO bus for all DSA
>> switches.
>>
>> SJA1110 uses the mdios property instead because it's got two internal mdio
>> buses, which is why I invalidate the mdio property for it. If SJA1105 has
>> also got two internal mdio buses, let me know.
> 
> SJA1105 has zero internal MDIO buses and zero internal PHYs.

Ah okay. I didn't consider the switch architecture where the data interface
of the PHY is connected to the switch, and the PHY management interface is
connected to the mdio bus that the switch is connected to.

The schemas of the switches which already utilise the mdio property:
- /schemas/net/dsa/microchip,lan937x.yaml
- /schemas/net/dsa/qca8k.yaml
- /schemas/net/dsa/realtek.yaml
- /schemas/net/dsa/renesas,rzn1-a5psw.yaml

The schemas of the switches which don't have an internal MDIO bus, meaning
the mdio property must be invalid:
- /schemas/net/mscc,vsc7514-switch.yaml
- /schemas/net/dsa/nxp,sja1105.yaml

The schemas of the switches which I don't know if the switch has got an
internal MDIO bus:
- /schemas/net/dsa/arrow,xrs700x.yaml
   - I believe, because there's phy-handle defined on every port without the
     mdio node on the example, the PHYs are not connected to the internal
     MDIO bus. Therefore, we can invalidate the mdio property for this
     schema.
- /schemas/net/dsa/brcm,b53.yaml
   - Seems ok to keep it valid.
- /schemas/net/dsa/brcm,sf2.yaml
   - Seems ok to keep it valid.
- /schemas/net/dsa/hirschmann,hellcreek.yaml
   - Same as /schemas/net/dsa/arrow,xrs700x.yaml.
- /schemas/net/dsa/microchip,ksz.yaml
   - Seems ok to keep it valid.
- /schemas/net/dsa/mscc,ocelot.yaml
   - Same as /schemas/net/dsa/arrow,xrs700x.yaml.

Not json-schema documentation, don't care about:
- ar9331.txt
- lan9303.txt
- lantiq-gswip.txt
- marvell.txt
- vitesse,vsc73xx.txt

Arınç

