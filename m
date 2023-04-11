Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E69FC77B72
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0q9m1x0Kzm672Wv2uZ8p+u8ZZVwbvW5fTmdCfljt3s=; b=4nDnVWfgLyVwNHE2rOSk9p53YW
	MBSFaEFbt639uRalHC84LOYUywQ+sl3FRfCaQhgyRR6J9HZH4lMY41xnKmT4uhEAOJ3c2XvffoStp
	DFhCwujPUphcxqB51z4mJBOehofeLMoZe+KpoRZTJQpA1PraIcGZPVsHSdoFpM3LfnUWeXMmQ4us8
	jo1wJQ+voN/Jan2ud+ZCxBXAYkssdjCPL8WdJ3KY1bwQPZjVMsr2gStGPSqOEJzAFGSZ5tRkk2vYV
	LWW7m738VeNJn2Cn/pevasWWh184cRUfn4kb8VzON61EZjP8dwtPiIGq9f2/x/Gaz/NrFgOEVp+3n
	6bSJn0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmK0s-000zXW-1I;
	Tue, 11 Apr 2023 19:50:46 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmK0p-000zX5-2F;
	Tue, 11 Apr 2023 19:50:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1681242633; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JqZQu0/1zwEpuh2JcCHJXbityLwgMsFgMYjOJfZmEYovU2KTCQlA0NW5r1riQe4QVmFC8CFI6KKRoyrbqPwvieb8lY41XgzeMheJrd9ErxwtEzv0dnmYwk/mgu4Xp3zGCt/Pq199BTzRE54UJH6B+g4W3x1uPn+oEl6L1R00M84=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1681242633; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=k0q9m1x0Kzm672Wv2uZ8p+u8ZZVwbvW5fTmdCfljt3s=; 
	b=QY4VO4boUGLwt9Yxhtaqd5+U4Q7Md6paeVRlr/mvt5jH55NcJIFALF1cACd+KrvIAoPKwaoZMZFVlSZn7IburNSev8q3i6OaXuolV6xCNRc3vK9dQKKBjs+FH9f2sCrO4hMsj5+aWvO4GBSUEACHAiMK+p1U3q45ixwT/5rKwUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1681242633;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=k0q9m1x0Kzm672Wv2uZ8p+u8ZZVwbvW5fTmdCfljt3s=;
	b=EYQu2ZV53EXtJYTbLhEXJrYVkjM91zZ0DjFxMmN/HncbxMX7qlWwjQMnaLG260N8
	5gfK3+ovIyZ5HgxdAON3hClGH1R3a2wi0AsbSeExfEucOeCK+fkRqnb+HNCYfWJ/1n6
	fsoEBAAMVkyCc+ZTgzqBM1lpU+c+ubUtWR5Gc/bg=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1681242631921471.7121572372041; Tue, 11 Apr 2023 12:50:31 -0700 (PDT)
Message-ID: <e5cb12f2-c89e-9cf9-5fbe-cfeeb14512be@arinc9.com>
Date: Tue, 11 Apr 2023 22:50:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH net-next] net: dsa: mt7530: fix support for MT7531BE
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Russell King <linux@armlinux.org.uk>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Vladimir Oltean
 <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>
References: <ZDSlm-0gyyDZXy_k@makrotopia.org>
 <13aedaa6-6b7b-727e-e932-4a5139c54f39@arinc9.com>
 <ZDW4Tr4bIGcxwDgs@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZDW4Tr4bIGcxwDgs@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_125043_774523_F2BB07C1 
X-CRM114-Status: GOOD (  26.28  )
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

On 11.04.2023 22:43, Daniel Golle wrote:
> On Tue, Apr 11, 2023 at 10:30:06PM +0300, Arınç ÜNAL wrote:
>> On 11.04.2023 03:11, Daniel Golle wrote:
>>> There are two variants of the MT7531 switch IC which got different
>>> features (and pins) regarding port 5:
>>>    * MT7531AE: SGMII/1000Base-X/2500Base-X SerDes
>>>    * MT7531BE: RGMII
>>>
>>> Moving the creation of the SerDes PCS from mt753x_setup to mt7530_probe
>>> with commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS creation to
>>> mt7530_probe function") works fine for MT7531AE which got two instances
>>> of mtk-pcs-lynxi, however, MT7531BE requires mt7531_pll_setup to setup
>>> clocks before the single PCS on port 6 (usually used as CPU port)
>>> starts to work and hence the PCS creation failed on MT7531BE.
>>>
>>> Fix this by introducing a pointer to mt7531_create_sgmii function in
>>> struct mt7530_priv and call it again at the end of mt753x_setup like it
>>> was before commit 6de285229773 ("net: dsa: mt7530: move SGMII PCS
>>> creation to mt7530_probe function").
>>
>> If I understand correctly, this patch does two things.
>>
>> Run mt7531_create_sgmii() from mt753x_setup(), after mt7531_setup() and
>> mt7531_setup_common() is run so that PCS on MT7531BE works.
> 
>>
>> Run the PCS creation code inside the loop only once if
>> mt7531_dual_sgmii_supported() is false so it doesn't set the nonexistent
>> port 5 SGMII on MT7531BE.
> 
> Yes, both is correct.
> 
>>
>> Regarding the first part:
>> I was actually in the middle of moving the code until after
>> mt7530_pll_setup() and mt7531_pll_setup() on mt7530_setup() and
>> mt7531_setup() to mt7530_probe(). To me it makes more sense to run them on
>> mt7530_probe() as there's a good amount of duplicate code on mt7530_setup()
>> and mt7531_setup().
> 
> I thought about doing that as well, however, note that you will have to
> move all the reset and regulator setup procedure to mt7530_probe() as
> well then, as PLL setup currently happens after that, and that's
> probably for a reason.
> 
> As the reset and regulator setup works differently on MT7530 and
> MT7531, and depending on whether it's a standalone IC package or MCM, I
> believe changes unifying this will have to be tested on a lot of
> boards...

Not if we don't change the behaviour at all for both switches, which is 
what I intend to do.

> 
>>
>> This will resolve the problem here, and make my future work regarding the
>> PHY muxing feature on the MT7530 switch possible to do.
>>
>> Regarding the second part:
>> I'll take your changes to my current RFC patch series while addressing
>> Jesse's suggestion if this is fine by you.
> 
> Yes, I'd appreciate that and I'm ready to test and review once you post
> your updated series.

Sounds good, cheers.

Arınç

