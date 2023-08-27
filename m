Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D49C83F01
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Aug 2023 08:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skW65uQLk894K9XJtfeHQDWUnHUg2Kk1PFt/VALrobw=; b=pG+ScLV9UGq5eMYEuLvdAOlYVX
	NvCo20OOjr2yTU+gKyqeIrPauZzi71H/iEdhQE/zw/gJWuYjq3tYQqJkTgOGpAqjTspv8cgT0SN3L
	FFms+ULakF8bZDoq5OflVBcxYEDFP67JWNB5hPftaLDAC3szP5j4f0TBQ9HOVkHhh9fGazGkotbeg
	jFrh7inqMdckGOQv0xcQlMCZ9UhoeDr804EA07Y2YOZh0UM42tQzbyPWV5JyAeItCu14lK9WU4nqs
	MeJvI45B/+tx53nWfi6rFLvEUGf/m9HmYR2/nZkKIwAogq/gI56bSouKsUzmfUswATc0wxEgEZyCj
	dIDKUxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBIL-007fwL-2d;
	Sun, 27 Aug 2023 08:38:53 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBII-007fuo-3A;
	Sun, 27 Aug 2023 08:38:52 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1DD1120002;
	Sun, 27 Aug 2023 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1693125518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=skW65uQLk894K9XJtfeHQDWUnHUg2Kk1PFt/VALrobw=;
	b=TgU3MJmA9QvoUrT12sBLc5bWK9BNdvquWgzTEHXBCtHwHbog5s1pwPctEiNXG/edJLwCXf
	YaZLjqtKOpgXEo5X1ub0mFsQKpNCA5BtJYpvCPUyDFD7a/7g4eXxLcrq8uqwwB5mGPnZd7
	XclvxF/jntWYO1steCgqTYl2IJ19Sfh67MHyERsu6qqLCC1ep+MF530HXkVAcvUIWc1KmH
	oEb6TiOGMMdGuWS2Tupi1PtcI2aKYi+f2Zxp95VIvoXwj1owAUnMLoWgqDba4X4CC7OEIY
	802VYXxPFcdHEZRVAk2P6/ZS2FHI4YcyZZ1pPRKROq04s9AOyhf4OvTZmllh9Q==
Message-ID: <b3edd0fe-af28-4ae5-a584-7cbaba8b2e06@arinc9.com>
Date: Sun, 27 Aug 2023 11:38:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Content-Language: en-US
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
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <617c51cf-2c09-4865-ac60-96599db597e7@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_013851_161948_480A030E 
X-CRM114-Status: GOOD (  13.72  )
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

Understood.

> 
>> Not json-schema documentation, don't care about:
>> - ar9331.txt
>> - lan9303.txt
>> - lantiq-gswip.txt
>> - marvell.txt
> 
> The marvell switch can have up to 2 MDIO busses. If i remember
> correctly, there is also one switch which has one MDIO bus per port.

I will work on writing a schema for these once I'm done with this.

Arınç

