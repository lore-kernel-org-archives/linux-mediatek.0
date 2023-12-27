Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E460EC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 19:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQV8YX8rOUM4ZWornMi1pNG+BpkRd9hjDAN9lELZU0w=; b=13b9axaPOwwgS8SyGUGzNLpqES
	m8vYJH+f7y4YkqbFM1xqv/knL+hH5WgAirjfy2r8mc6jkDZJ075tT6Cb4A8II7Th+BV9GnPX0MdL+
	L5jja04/mdxE7B3QFlOaWn6uRv1dv7myfIYdZsCqNi9G7LtD7INgPWIQGbRBz0rd2lg4rogDZsPLd
	EklwZEKhJIT/vawZSF3gRfFixgFolicfPNae59GdomVTVk4gRDtN33rDEGK1Q0uabK3+GmVGtcQv8
	bmTVWY1Uu6jsa8HLBArj77C1hOHoBsLKLd7P8B9d4/FMMdsMh4a9Dxj9mc6bdoWVRo1Tv8H5Yh3X3
	XNfnXz4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIZw3-00FP91-31;
	Wed, 27 Dec 2023 19:51:23 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIZw0-00FP8G-1T;
	Wed, 27 Dec 2023 19:51:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AD9E1C0003;
	Wed, 27 Dec 2023 19:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1703706674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQV8YX8rOUM4ZWornMi1pNG+BpkRd9hjDAN9lELZU0w=;
	b=de58BORBYXHfy/2uytj3vdf2RsHJQQjor1wdt8a0I3AbXyUJRu0ImhEU/e7UJ6QtwlQPP3
	F/zSvdSUpYdWvHYxOrcaHX8yhmv7ejuq41TFnZ/h0+TkqCmv4cS719NG/yzZEZgbUqS3z7
	g/rbRu55JigKRp1MnNcsBjOdjkzQDhWWEjco2m1607VZGf3k8bGXSUyeHiPR4IllJvjcze
	EasPv28pPh2j/iW5HYRyIJHb5SU6kUFtxbt7qjLUa16EqL2Tay/S0Y9DHOXQYNAPOG+/pG
	5vYsm1bPbvoSzPQdLARKDry6J74u12W1jcUUFLcGAzRB81cRYaRjGrxRkHmwSg==
Message-ID: <bdbe24b2-30f6-48fa-b6eb-a1ae3afe9076@arinc9.com>
Date: Wed, 27 Dec 2023 22:51:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: register OF node for internal
 MDIO bus
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231220173539.59071-1-arinc.unal@arinc9.com>
 <20231221151607.ujobhh4aet4obxdz@skbuf>
 <6600c6b1-2230-4963-940c-8b95a01750fd@arinc9.com>
 <20231227191154.6jkqdlqdxciidpfw@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231227191154.6jkqdlqdxciidpfw@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_115120_642718_4C9DB0EF 
X-CRM114-Status: UNSURE (   8.01  )
X-CRM114-Notice: Please train this message.
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

On 27.12.2023 22:11, Vladimir Oltean wrote:
> On Sun, Dec 24, 2023 at 10:37:12AM +0300, Arınç ÜNAL wrote:
>> If the MDIO bus of the switch is defined on the devicetree, the
>> (!ds->user_mii_bus && ds->ops->phy_read) check in dsa_switch_setup will be
>> true so the MDIO bus will be attempted to be registered again, resulting in
>> a kernel panic.
> 
> Where does mt7530 provide ds->ops->phy_read() in upstream?

Sorry, that's a misdiagnosis from my part. There's indeed no
ds->ops->phy_read() or ds->ops->phy_write(). I should know that as I have
intensively studied the MDIO bus registration on all DSA subdrivers. The
issue is at mt7530_setup_mdio_irq():

ds->user_mii_bus->irq[p] = irq;

I didn't realise ds->user_mii_bus is also used to store irq mapping for
each PHY. Should we agree that user_mii_bus is needed for all cases or make
another way to store the irq mappings?

Arınç

