Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398A0C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 08:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqNeVXpCo0a2FuxgS0FBsXQeNAgyt63dNpBjp06s8g4=; b=VFN5fvBtcCK+XnGkKvXM42Ucxi
	wTCSDPbeW48bl4LLg6EG+Krl4LJnWUqs9UhH5PePOfarHg3U5fohy1fc0eZPQ/Le+w+wXa3RrYUss
	ukT7SHqVRM/AYle9MY7QvhSf11Z/qnUCH176lRsysYQ3dsf7j/5k1WlYvrxwKyi6JcfxCoOrSsYW4
	5iS54m0rB7RjNDpCzujz9DP3LcIP9b4nBWXMXcy6kg+J+2qRzKeQWL37C2clrlIeZLGeMkWR5V5a8
	p5VvEdDBK0+SbXsVVC11bbTZEpcxh8GP+22SyNCarxBYKg2A5nKed8dPCbCcM1w1iBR0lwYN0r45u
	d99I+D+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvutP-00000004yUO-1mec;
	Sun, 14 Apr 2024 08:07:15 +0000
Received: from smtp-84.smtpout.orange.fr ([80.12.242.84] helo=msa.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvutM-00000004yR7-0yCR;
	Sun, 14 Apr 2024 08:07:14 +0000
Received: from [192.168.1.18] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id vusxraUSs2kxovusxrWrdY; Sun, 14 Apr 2024 10:06:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1713082014;
	bh=RqNeVXpCo0a2FuxgS0FBsXQeNAgyt63dNpBjp06s8g4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ecIEWTgvlHyKrM4aCxe4CxwWY4N/umtZUc2i4EtdMOVJe8sJOlyDlXsVyoY3aBLZx
	 PoBCEAaZvNT2sYVBc18j3+ZjzAwVs+3RZj3WfqdFd8t+/4ftfsdYrqqI4ZgZEh2+mx
	 Cix0AjGZ3y6dUa1rBZVElJgC8hAIccScNvnKB9EuWh09UHPLH0VXkNbUb6UDa1y35k
	 5hatGlnKICKCKsl39QglBi84en3X5xRlxRvk7/UgIBpCbmPpbyrguGoHwRF4OpOjWi
	 6BYmY/NtLMvnTOQ3mN7XiV42zxMnF//qG3agRHXqHk9SKScEd1ZFt8H5I0cv2zCGAK
	 G1xBC+25UWS+w==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Apr 2024 10:06:54 +0200
X-ME-IP: 86.243.17.157
Message-ID: <6faf8008-3a64-4ed9-8d7e-52ff32862df9@wanadoo.fr>
Date: Sun, 14 Apr 2024 10:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: dsa: mt7530-mdio: read PHY address of
 switch from device tree
To: Daniel Golle <daniel@makrotopia.org>, arinc.unal@arinc9.com
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-0-b08936df2770@arinc9.com>
 <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-1-b08936df2770@arinc9.com>
 <ZhtJGEdjeS3LfMWF@makrotopia.org>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZhtJGEdjeS3LfMWF@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_010712_675046_E1C3193E 
X-CRM114-Status: GOOD (  11.67  )
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

Le 14/04/2024 à 05:10, Daniel Golle a écrit :
> On Sun, Apr 14, 2024 at 01:08:19AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Read the PHY address the switch listens on from the reg property of the
>> switch node on the device tree. This change brings support for MT7530
>> switches on boards with such bootstrapping configuration where the switch
>> listens on a different PHY address than the hardcoded PHY address on the
>> driver, 31.
>>
>> As described on the "MT7621 Programming Guide v0.4" document, the MT7530
>> switch and its PHYs can be configured to listen on the range of 7-12,
>> 15-20, 23-28, and 31 and 0-4 PHY addresses.
>>
>> There are operations where the switch PHY registers are used. For the PHY
>> address of the control PHY, transform the MT753X_CTRL_PHY_ADDR constant
>> into a macro and use it. The PHY address for the control PHY is 0 when the
>> switch listens on 31. In any other case, it is one greater than the PHY
>> address the switch listens on.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> See minor nit inline below.
> 

...

>>   
>> -#define MT753X_CTRL_PHY_ADDR		0
>> +#define MT753X_CTRL_PHY_ADDR(phy_addr)	(phy_addr == 0x1f ? 0 : phy_addr + 1)
> 
> #define MT753X_CTRL_PHY_ADDR(phy_addr)	(phy_addr + 1 & 0x1f)

Nit: maybe (even if certainly useless in this case):
   #define MT753X_CTRL_PHY_ADDR(phy_addr)	((phy_addr) + 1 & 0x1f)

?

> 
> It's shorter, and works without conditional operator which is expensive.
> 

Cj


