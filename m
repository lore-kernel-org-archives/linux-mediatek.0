Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7F4C10F1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4v7M/MN8aqackQkVc3/4p8TWYBtdQ4GtrVcP+9uGN+o=; b=CEIQx/lglBFhIcUr4zYsWHU2j2
	GyAwM3urvKCkvVmmt44e03OO8wvcZI2EmvjOIhI0R1ylQy9zp8lJt1PPBUcDwwm51ZjvFwzZsf2rQ
	SMowi6S/le9aUny5Zbyyp+ENjl+GPQ3UPhB6KkcybaoOyxXVXmFttkQmeDhS1R9/KUGUQTSwOUox7
	sXjImir1mphRZeZbfU0ABpnCSpxpIurOlr4HHN4HpLqBP3PjTzVYBlJPtd0YDd7He+WJ4PWU0ixO5
	UsxE5iO5l5d8Wj6fooZHgw+3ywNebVkxq8NZlUBsyIeO2oyF45DJvYMyfwZjoPKPDLFwM8dljdeiZ
	osDsR3Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FDJ-00000009yNM-0YEV;
	Tue, 07 May 2024 07:26:13 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4FDE-00000009yLD-35UZ;
	Tue, 07 May 2024 07:26:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD86D1C000B;
	Tue,  7 May 2024 07:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1715066763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4v7M/MN8aqackQkVc3/4p8TWYBtdQ4GtrVcP+9uGN+o=;
	b=dVkAKfMa8MHTQynPcQ3YAVbZrgfRh6T4busyc3WHCkNHdQkwOBeaIP1lU8DpDJvToT7dDo
	QH4c4lQ7H3wvZ0aG6tibjt3GzxGQBiCEtnAWqev8m4WwMo58OvBxJhY8Z4DOP9SiChMfmB
	aULtIe7z/hBie94nnxmZteRvu4XfMEJFc+OKw+pKoMADu/0nz3TupUYORdC5L/srw3Yuc/
	J5r94ZvX3q2sGmJai2zDFkXHbb5WBu5+B6W0/+uTCMbATLvU4kr7NObbtmailB+iKXCwjt
	/soagSRjRZ6dgMubU7zcvW3GiPhfyBnSmDN7RtqRduQYodG+ErBeGtVI9UhQgw==
Message-ID: <904e5bd2-4495-4c1b-a172-ffcd737e6ee3@arinc9.com>
Date: Tue, 7 May 2024 10:25:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: detect PHY muxing when PHY
 is defined on switch MDIO bus
To: Daniel Golle <daniel@makrotopia.org>
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
References: <20240430-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v2-1-9104d886d0db@arinc9.com>
 <Zji94d4yfEBaHlzt@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Zji94d4yfEBaHlzt@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_002609_136556_E9C7A640 
X-CRM114-Status: GOOD (  22.47  )
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

On 06/05/2024 14:24, Daniel Golle wrote:
> On Tue, Apr 30, 2024 at 08:01:33AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Currently, the MT7530 DSA subdriver configures the MT7530 switch to provide
>> direct access to switch PHYs, meaning, the switch PHYs listen on the MDIO
>> bus the switch listens on. The PHY muxing feature makes use of this.
>>
>> This is problematic as the PHY may be attached before the switch is
>> initialised, in which case, the PHY will fail to be attached.
>>
>> Since commit 91374ba537bd ("net: dsa: mt7530: support OF-based registration
>> of switch MDIO bus"), we can describe the switch PHYs on the MDIO bus of
>> the switch on the device tree. Extend the check to detect PHY muxing when
>> the PHY is defined on the MDIO bus of the switch on the device tree.
>>
>> When the PHY is described this way, the switch will be initialised first,
>> then the switch MDIO bus will be registered. Only after these steps, the
>> PHY will be attached.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> 
>> ---
>> Changes in v2:
>> - Address the terminology on the patch log.
>> - Link to v1: https://lore.kernel.org/r/20240429-b4-for-netnext-mt7530-use-switch-mdio-bus-for-phy-muxing-v1-1-1f775983e155@arinc9.com
>> ---
>>   drivers/net/dsa/mt7530.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 2b9f904a98f0..6cf21c9d523b 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2483,7 +2483,8 @@ mt7530_setup(struct dsa_switch *ds)
>>   			if (!phy_node)
>>   				continue;
>>   
>> -			if (phy_node->parent == priv->dev->of_node->parent) {
>> +			if (phy_node->parent == priv->dev->of_node->parent ||
>> +			    phy_node->parent->parent == priv->dev->of_node) {
> 
> I had some concerns about missing check for phy_node->parent != NULL,
> but it's impossible in practise. If phy_node exists, it will have a parent
> node as well.
> 
> To be super extra safe, maybe doing
> phy_node->parent && phy_node->parent->parent == priv->dev->of_node
> would be better.

At the current state of this driver where the hardware probes on OF, I
don't see any benefit of doing this so I'm going to pass on this for now.

Arınç

