Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500B0C001CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 07:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHi33ssp9kCXeOvzprYeABBoEMwbdoM+wrd834QLJgg=; b=yPSUkziocts2R8q5aNAxgZHyxO
	qaUVxHqBClIOKl/NhPG69dsw3MdmnNwJsaNERfiGi6dilNmQ+47CW+6X09u/Uq6PSOIQPGKwDBDrB
	YP7F7vD4fXObFf2uyKmJe0F2MjnUj5U5lhXgMOTVjZ1fMA5MwJz38Rx6av7DILA22iLxbsnlwgyTg
	BNRlH/3clqNpTtLlsdqcrWfks2EtM4ltejhya5eUcgsimTnTeE9dV56tpDcvVRGS+z1+qZ3M33VwU
	SkocAt5iPT1+IwcX/sn8WyoimGt9n+FitroyNsl4BKf81qGT+gu/4gHzVrwUAd5cj9rp8oGajp+tP
	R2KFu7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzJg-0000000Ewq9-0KDm;
	Wed, 17 Apr 2024 07:02:48 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzJY-0000000Ewma-0Twd;
	Wed, 17 Apr 2024 07:02:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D33EE0008;
	Wed, 17 Apr 2024 07:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1713337357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHi33ssp9kCXeOvzprYeABBoEMwbdoM+wrd834QLJgg=;
	b=QU4lGBynmQ5d3Z4ZmTULXjUTDwkmk5natWmgnO1imlQ1bVRPMtlLpNeLVZXZ1IcJRNuztx
	wePVgJlAYGli9/dzyC6C7oH9C5oBIgwVxNphpIV3REr7jmxMNrhyd0m1FaZOszzItJM1Zq
	Id1yoHl8PizieY9dSgxsrkgTfu7ZlfB2u6v8Lae+MzF2iVPtsB7WRYYUTJReJjMF5to/uC
	fAMnT3zgHQAVk82Eg5VB+cR2NJbz5YV6J++Lhd8tYxodZJu/JJqw3EHdHTZt4lfhEyZstN
	MUJwgKTVvvdmjC658Wzjq6OvSDz555mdVpe2rsDT+mF6n4lWhvXfwUm304Kjvw==
Message-ID: <48cabb89-e3bb-4f72-b6fc-024b6900149d@arinc9.com>
Date: Wed, 17 Apr 2024 10:02:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/2] net: dsa: mt7530-mdio: read PHY address
 of switch from device tree
To: Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-0-1a7649c4d3b6@arinc9.com>
 <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v2-1-1a7649c4d3b6@arinc9.com>
 <459b31bd-64b3-4804-bc5a-c8ffd145e055@gmail.com>
 <7d0ded52-14f0-4f6a-b639-72f537603be8@arinc9.com>
 <050ef345-9f4c-437c-863b-fdb8e2a47041@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <050ef345-9f4c-437c-863b-fdb8e2a47041@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_000240_446719_88F79841 
X-CRM114-Status: GOOD (  17.80  )
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

On 17/04/2024 06:09, Florian Fainelli wrote:
> 
> 
> On 4/16/2024 1:32 AM, Arınç ÜNAL wrote:
>> On 15/04/2024 18:30, Florian Fainelli wrote:
>>> I would go a step further and name phy_addr switch_mdio_addr, or something along those lines to clearly denote this is not a per-port PHY address neither a proper PHY device, but we've already had a similar discussion before about spelling this out clearly as a "pseudo PHY"....
>>
>> I am fine with calling the switch operating on an MDIO bus a psuedo-PHY.
>> But I don't believe this grants making up names on our own instead of using
>> the name described in IEEE Std 802.3-2022. The switch listens on a PHY
>> address on the MDIO bus. 
> 
> The switch listens at a particular address on the MDIO bus, that is the key thing. Whether the addressable device happens to be an Ethernet/SATA/PCIe/USB PHY, an accelerometer, a light switch or an Ethernet switch does not matter as long as it is addressable over clause 22 and/or 45. For all that matters the switch's MDIO interface is not a PHY, otherwise its registers 0-15 would be abiding by the IEEE 802.3-2022 standard, and that is not the case.

I don't deny anything you've said here. I just don't see how this
constitutes making up a different name. The field which the address is
stored is called "PHYAD (PHY Address)". The PHY Address field of the
management frame structure the switch implements is still Clause 22
conformant, as far as I understand.

> 
>> The description for the phy_addr member of the
>> mt753x_info structure clearly explains that so I don't see a reason to
>> change the variable name.
> 
> IMHO it is clearer to use mdiodev->addr through and through, the shorthand is not necessary and does not save that many characters to type in the first place. Saving a mdiodev pointer into mt7530_priv and accessing priv->mdiodev->addr would be 18 characters to type versus 14 with priv->phy_addr.

Fine by me, I can do that.

Arınç

