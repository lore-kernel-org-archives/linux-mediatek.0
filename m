Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 410AEC10F16
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Apr 2024 04:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxARK+Ac1zGzaPGYkJ1m/SwB3s0XeVwOgtFDsG9w8NQ=; b=a81WApf13tzBeSg+C+j3K03D+F
	Q3fjF5Rffu/4+2zjO57zuNREkX105jjNJhJBXBZQ/9SpaQj+qQVrt4w6UXLagT4/M81KU0gdT2v1m
	5KP/3lxML1oJlN32lcK0AR3/GkahLToF8VLuvtbQzjfAeyZro41cDC3+XATV7GK0Lhi0EPoVHO7fn
	FaL7OcrKwY3syEMc3eOBrwsdIS4Vs38gcS+iaOmoBG+6/KurSxPEoP60sZoxuoAQ8Y8KAYOhU8k+v
	zNCjvJkXG1TaLT+6t1LpLy/DMdR+TbcC4w7nSMudeyg6haMmNDJxYCGcROfWo3x7CASlFsGmG1JZI
	MG8St2vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1fZU-000000055g7-19R2;
	Tue, 30 Apr 2024 04:58:28 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1fZP-000000055de-3ZZF;
	Tue, 30 Apr 2024 04:58:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C189240002;
	Tue, 30 Apr 2024 04:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1714453095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxARK+Ac1zGzaPGYkJ1m/SwB3s0XeVwOgtFDsG9w8NQ=;
	b=GvqvmYBTMir6yilmStEchowgXWLuj9LMkK0Iegexk6xEuqA/fTZrDaF9sc6ox/iy88ofS1
	VeiY3TWT7VwSe0yIpNZrAryXpqBSGu4LpGjYjKjWi5e92jReF5OWMflTn0GMF0I2yVJ0pV
	hWyxbhqP7Qte/5DmFp3NPvMwBe24f4Vx4JrMEKPxO2n3vPgwHn63UnmaY511Q3OV7T/990
	K6VXaKbbpeOMUNnGjfuuooSaLfFfV68W62qT+7An4iCTrkL1vDAPMfl3NgUgzH8xj7dC+5
	ARtBmgiKmlgl229n0IU8wHbfyBSxqTvH9A27v7E861JDg+wNAzkw5viozmMN/Q==
Message-ID: <ded0ee71-dfa5-497e-a579-c212185f23ba@arinc9.com>
Date: Tue, 30 Apr 2024 07:58:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
To: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <e615351aefba25e990215845e4812e6cb8153b28.1714433716.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_215824_090481_7D5C878B 
X-CRM114-Status: UNSURE (   9.36  )
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

On 4/30/24 02:45, Daniel Golle wrote:
> The MDIO address of the MT7530 and MT7531 switch ICs can be configured
> using bootstrap pins. However, there are only 4 possible options for the
> switch itself: 7, 15, 23 and 31 (ie. only 3 and 4 can be configured, bit
> 0~2 are always 111). Practically all boards known as of today use the
> default setting which is to have the switch respond to address 31, while
> the built-in switch PHYs respond to address 0~4 in this case.

I'm not aware of the MT7531 switch having bootstrap pins to configure the
PHY address. Are you sure this is the case?

Arınç

