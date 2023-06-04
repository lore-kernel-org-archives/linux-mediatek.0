Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3988DC7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 13:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzcElPlulU+8xjoOMrgsQgOCoANsPHLfjay0Dt8SHEY=; b=Bir9MuEXUkkSth
	Z2bMer+LPjzU1nBfhY6P5MWMg4Q4XpNw4n3xOYlbUOJ+vpesQhW9ePPKAzg2OTy9J7ryuuu6F7kyt
	HJw1zv7NMmoiNfkhCxBqoXqWqjNO8vzqYQ9bJQfLc/Q4/cqd/WEWhhk8Qi27R9C0MnIQkx9AJs818
	QwTfHaq6KbKwbwfOLLX8qcWtpjrkw89vVdIoPcrN0kAgDBgTTpZCW3LqZYAyLUfS9Wd7o5ZnJ7x1b
	v74EZWe1eK4LYh14ImzG0XEfEoA5/MP8ftE3Xa1zulErwSR8B7OarXZaaXggwl7GuZzAfCLOGEd3n
	yVwHD7oBKbiKWfmpuivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nrq-00CEvx-2G;
	Sun, 04 Jun 2023 13:33:58 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nrn-00CEvI-0e;
	Sun, 04 Jun 2023 13:33:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685885608; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DPnm3klMFsV5I+wpRudckd2hAgFIn6ljkvX/NMTxREfdp5cxEvlcc28W8zn3rqInhGaONTvdWZI+7CIVnsyn80IlY5WFjxzEh3vgwIQtQGguGyggQU4dYfAQ6HAQs+yPV2oXw6auRPNe0E0sK6/weNzbadAjwOGvdPGyawby8/w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685885608; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=BzcElPlulU+8xjoOMrgsQgOCoANsPHLfjay0Dt8SHEY=; 
	b=NKGrUXTER60OMO2P6gB4dCh5pQFottY0WzoXZwJPNbvD9nE9LpQMqtq9PSTKoOLtJhkuZB9ZxZPc3284YIAcCxrKep8YMJtZsTk4MQruLz+Xpc1ec94i/W3kyK9Dr8R1RqN164rj/mBR8DoI9DRp1jBvEfhv+VykkLmIW6h2zto=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685885608;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BzcElPlulU+8xjoOMrgsQgOCoANsPHLfjay0Dt8SHEY=;
	b=fndRkYd6lUAGZrs3zb0Cco21VEpzO/i+OsXd3S2j6P+YDuEBxRJ2zHnt5sMGQsVK
	CwSC66PgCJ/1vExUMGWTL6wq+Jf7TkApctmM0ObIoLgO43bmXX27udCLcfpiwjPdci6
	QUMuEPLlf7ssYtCX6X24XzpPpLGHe+74VPq5m8VQ=
Received: from [192.168.99.249] (178-147-169-233.haap.dm.cosmote.net [178.147.169.233]) by mx.zohomail.com
	with SMTPS id 1685885607262824.205537190085; Sun, 4 Jun 2023 06:33:27 -0700 (PDT)
Message-ID: <9ce13208-a20d-44ef-8b47-456801c075a1@arinc9.com>
Date: Sun, 4 Jun 2023 16:33:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 25/30] net: dsa: mt7530: properly set
 MT7531_CPU_PMAP
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-26-arinc.unal@arinc9.com>
 <20230522121532.86610-26-arinc.unal@arinc9.com>
 <20230526155124.sps74wayui6bydao@skbuf>
 <9423a818-f9c0-d867-7f7d-27f05e1536b9@arinc9.com>
 <20230604130808.3lxuz5ezsouhku57@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230604130808.3lxuz5ezsouhku57@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_063355_291769_4F418308 
X-CRM114-Status: GOOD (  24.86  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4.06.2023 16:08, Vladimir Oltean wrote:
> On Sun, Jun 04, 2023 at 11:21:48AM +0300, Arınç ÜNAL wrote:
>>> Stylistically, the existence of an indirect call to priv->info->cpu_port_config()
>>> per switch family is a bit dissonant with an explicit check for device id later
>>> in the same function.
>>
>> mt753x_cpu_port_enable() is not being called from priv->info->cpu_port_config()
>> though.
> 
> Quite the other way around. I'm saying that mt753x_cpu_port_enable(),
> the function whose logic you're changing, already has a mechanism to
> execute code specific to one switch family.

Ah, makes sense.

> 
>> I'm not sure how I would do this without the device ID check here.
> 
> Hmm, by defining a new mt7530_cpu_port_config() procedure for ID_MT7621
> and ID_MT7530?
> 
> Although in a different thread we are perhaps challenging the idea that
> what is currently in priv->info->cpu_port_config() is useful - at least
> half of it are manual invocations of phylink methods which are possibly
> not needed. If after the removal of those, it no longer makes sense to
> have priv->info->cpu_port_config() at all, then I'm not saying that the
> explicit check for device id here doesn't make sense. Just that it's not
> in harmony with what currently exists 3 lines above.

Regardless of the outcome of that conversation, I would like to avoid 
structural changes like this since this patch will go to net.

> 
>>>> -#define  MT7531_CPU_PMAP_MASK		GENMASK(7, 0)
>>>> +#define  MT7531_CPU_PMAP(x)		((x) & 0xff)
>>>
>>> You can leave this as ((x) & GENMASK(7, 0))
>>
>> Now that I've read Russell's comment on the previous patch, the below would
>> be even better?
>>
>> MT7531_CPU_PMAP(x)		FIELD_PREP(MT7531_CPU_PMAP_MASK, x)
>>
>>>
>>>> +#define  MT7531_CPU_PMAP_MASK		MT7531_CPU_PMAP(~0)
>>>
>>> There's no other user of MT7531_CPU_PMAP_MASK, you can remove this.
>>
>> Should I do above or remove this?
> 
> No specific preference. If you want to make this driver start using
> FIELD_PREP() then go ahead.

Will do.

Arınç

