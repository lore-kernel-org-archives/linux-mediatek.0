Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D8CEC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cb7bonRujnndbvNIQM4LPU8azHbUPLzM2mZY1a0gQGI=; b=geKboPSUX8qti4
	Nck9qM20NU7eACBB8m+ZPOhBmlmpK/Htf9+ZCmOohhSSVBvpUaH7gk09xs2zm+nqzkaz6APYO/dww
	jSqw7A+3tVB3nDRJTIh1YovwfjFUhf8tnwpC5Iroa7tJOPTRR0JzEQOiAue4LahlzeT8+zsl9isKL
	zcbyq24zgw14AgwObbr57OgZ0ZIjvcnaZLNA2iDvfEoNLcGPdaEaqK8FNyWkOamU5RIrq/dPcAybA
	640gbo9sC/Kd2WAITNq8IhMmwB7NtH6lC735xuT5K4HTG/EKxRRSz4gGoO7oVMXj463jAA2QFdVDp
	Ecls6Y5cdqbhv5JYnh2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nkC-00CE3K-2n;
	Sun, 04 Jun 2023 13:26:04 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nk8-00CE0q-2f;
	Sun, 04 Jun 2023 13:26:02 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685885132; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Bywjwr7BNZlcxr5xW8ywb/LUrth01TtuaIEzUscw5rmX06leIr3v9HwiIgRRsBgyEJc4eoyelom1Oino5farHt/6sHZURY6YCUS7RoAba0NmYE0NzKTYPHyrqR8cAtsget3hHm+HU64yCSGgpUg0A8CkA9QoJjdM/59P0AfbRIU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685885132; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Cb7bonRujnndbvNIQM4LPU8azHbUPLzM2mZY1a0gQGI=; 
	b=cdNpsrhhpx7GhnTU3QZHNbQJOHRush/nD8ynZ4Vr6QPb56F4zPvSVpb95CUZIbLXKhjJeAgnH45xVaCFvwynvPVqv3Ul0GSLXInhJNlo45vukbffyz6ZtiwHDB3H98aEEqvq8hbVHCW12fQwG/IFn62cV7cU8bKfKbRkpwDk+kc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685885132;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Cb7bonRujnndbvNIQM4LPU8azHbUPLzM2mZY1a0gQGI=;
	b=XU6xkZ/2tPG385WlIaSzEZYOyvN4SYWSQsDarOdl4aeSruIqKCUFpqJSywK2srCK
	5JWJRxHug9M8vooCWhCzIpB3mSv/KE/GxqeSgXih2vjpIpZNEpec6RdDx5PoLxXAdxv
	FQUYrgPQ8VznvBx8djyvvcHdODAxEBj1A1CNSvRI=
Received: from [192.168.99.249] (178-147-169-233.haap.dm.cosmote.net [178.147.169.233]) by mx.zohomail.com
	with SMTPS id 1685885131523433.411804914748; Sun, 4 Jun 2023 06:25:31 -0700 (PDT)
Message-ID: <77906053-62f4-bfbb-6b76-cb22c30bd102@arinc9.com>
Date: Sun, 4 Jun 2023 16:25:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 24/30] net: dsa: mt7530: rename MT7530_MFC to
 MT753X_MFC
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-25-arinc.unal@arinc9.com>
 <20230526154258.skbkk4p34ro5uivr@skbuf>
 <ZHDVUC1AqncfF2mK@shell.armlinux.org.uk>
 <e4aff9aa-d0c6-1f2e-7f16-35df59d51b90@arinc9.com>
 <20230604131735.f2clcinq67wspuun@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230604131735.f2clcinq67wspuun@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_062600_921486_BB58C32F 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4.06.2023 16:17, Vladimir Oltean wrote:
> On Sun, Jun 04, 2023 at 11:06:32AM +0300, Arınç ÜNAL wrote:
>>> Even better are:
>>> #define  MT7531_MIRROR_PORT_GET(x)	FIELD_GET(MT7531_MIRROR_MASK, x)
>>>
>>>>> +#define  MT7531_MIRROR_PORT_SET(x)	(((x) & 0x7) << 16)
>>>>
>>>> and here: (((x) << 16) & GENMASK(18, 16))
>>>
>>> #define  MT7531_MIRROR_PORT_SET(x)	FIELD_PREP(MT7531_MIRROR_MASK, x)
>>>
>>> No need to add parens around "x" in either of these uses as we're not
>>> doing anything with x other than passing it into another macro.
>>
>> Thanks. I suppose the GENMASK, FIELD_PREP, and FIELD_GET macros can be
>> widely used on mt7530.h? Like GENMASK(2, 0) on MT7530_MIRROR_MASK and
>> FIELD_PREP(MT7530_MIRROR_MASK, x) on MT7530_MIRROR_PORT(x)?
> 
> I suppose the answer would be "yes, they can be used", but then, I'm not
> really sure what answer you're expecting.

I was thinking of replacing all manual definitions with these macros on 
mt7530.h. For now, I'll just make sure my current changes use them.

Arınç

