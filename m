Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 140A5C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 19:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ddz8Sv+QlYT5INqMFfFhMaDjWIdMDNTLjt/Wj7ITUr8=; b=08oXjygJkgIqgu2GNd5ADcMYsP
	KrmfuuZYYiu7G0vLphu/M4iEia4pRCc0a7D0BhpOV9UsP5Apfg2dJwq8JFizrHDf/MUW6TtAgDBla
	TA+akU5DuoUOjHKt3epW4dzpxUlEFei2602gwKGa6xf13qw/9G/EGZjCmudoWOc+kKiHDPjVaaXTv
	UP/nQeKxuSlaWLb14jRryxRBHmuYr/tCAVw9nFE5kRJAGz3Df6SChlhdAK6IHxoL1LOvwuqN2hikm
	RoEFKlBpa5iPMbrNRTWITrQXlPzKxno/RcJ+WIUcQdNyp+r7ey1KIjvaWtSpgon+BE3hf71IYnKCL
	CaMn7iCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYABq-0000000Emjn-3utQ;
	Thu, 08 Feb 2024 19:36:06 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYABn-0000000Emj9-2Kpt;
	Thu, 08 Feb 2024 19:36:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C11B1BF207;
	Thu,  8 Feb 2024 19:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1707420958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ddz8Sv+QlYT5INqMFfFhMaDjWIdMDNTLjt/Wj7ITUr8=;
	b=nghsWFaikliESs/fO8r46x5t8cVB/B+0wrV0kdwuHfqtdxFbxnOj36IIpcEDKDvErggVne
	Qg4XiFACEowYkf02TO0897fWCBHQNG+iINuFD3b0wK0vQDM1Palyk4GdWK0P7yZaCiDgrt
	hI5ScCCJZY88D3teO70p343rCtIYwizwh7Acj+kNv5MCO5LzNnNWq2udd2PrTSkWNO4YhD
	dtFTnyavm/on7eUzWUjCv3LQWl8x8nJ5s+OAi5AXg04pBCunytKhBh52q3pv0YLk9uvTrJ
	hPY/C8NtqMDBDyGuwg/IPcPFmfW8kUhMNpnvLz7nerfL55pQg8T93IC0XisgIQ==
Message-ID: <2a6a8d93-beae-4bec-a792-0e093b4c4ecd@arinc9.com>
Date: Thu, 8 Feb 2024 22:35:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH netnext 8/8] net: dsa: mt7530: simplify link operations
 and force link down on all ports
To: Daniel Golle <daniel@makrotopia.org>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
 <20240208-for-netnext-mt7530-improvements-3-v1-8-d7c1cfd502ca@arinc9.com>
 <ZcT_r68mStRAC3Uk@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZcT_r68mStRAC3Uk@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_113603_888677_C2FD70D2 
X-CRM114-Status: GOOD (  18.33  )
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

On 8.02.2024 19:22, Daniel Golle wrote:
> On Thu, Feb 08, 2024 at 08:51:36AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Currently, the link operations for switch MACs are scattered across
>> port_enable, port_disable, phylink_mac_config, phylink_mac_link_up, and
>> phylink_mac_link_down.
>>
>> port_enable and port_disable clears the link settings. Move that to
>> mt7530_setup() and mt7531_setup_common() which set up the switches. This
>> way, the link settings are cleared on all ports at setup, and then only
>> once with phylink_mac_link_down() when a link goes down.
>>
>> Enable force mode at setup to apply the force part of the link settings.
>> This ensures that only active ports will have their link up.
>>
>> Now that the bit for setting the port on force mode is done on
>> mt7530_setup() and mt7531_setup_common(), get rid of PMCR_FORCE_MODE_ID()
>> which helped determine which bit to use for the switch model.
>>
>> The "MT7621 Giga Switch Programming Guide v0.3", "MT7531 Reference Manual
>> for Development Board v1.0", and "MT7988A Wi-Fi 7 Generation Router
>> Platform: Datasheet (Open Version) v0.1" documents show that these bits are
>> enabled at reset:
>>
>> PMCR_IFG_XMIT(1) (not part of PMCR_LINK_SETTINGS_MASK)
>> PMCR_MAC_MODE (not part of PMCR_LINK_SETTINGS_MASK)
>> PMCR_TX_EN
>> PMCR_RX_EN
>> PMCR_BACKOFF_EN (not part of PMCR_LINK_SETTINGS_MASK)
>> PMCR_BACKPR_EN (not part of PMCR_LINK_SETTINGS_MASK)
>> PMCR_TX_FC_EN
>> PMCR_RX_FC_EN
>>
>> These bits also don't exist on the MT7530_PMCR_P(6) register of the switch
>> on the MT7988 SoC:
>>
>> PMCR_IFG_XMIT()
>> PMCR_MAC_MODE
>> PMCR_BACKOFF_EN
>> PMCR_BACKPR_EN
>>
>> Remove the setting of the bits not part of PMCR_LINK_SETTINGS_MASK on
>> phylink_mac_config as they're already set.
>>
>> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/net/dsa/mt7530.c | 26 +++++++++++++-------------
>>   drivers/net/dsa/mt7530.h |  2 --
>>   2 files changed, 13 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 5c8ad41ce8cd..f67db577d1c0 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -1018,7 +1018,6 @@ mt7530_port_enable(struct dsa_switch *ds, int port,
>>   	priv->ports[port].enable = true;
>>   	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
>>   		   priv->ports[port].pm);
>> -	mt7530_clear(priv, MT7530_PMCR_P(port), PMCR_LINK_SETTINGS_MASK);
>>   
>>   	mutex_unlock(&priv->reg_mutex);
>>   
>> @@ -1038,7 +1037,6 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
>>   	priv->ports[port].enable = false;
>>   	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_MATRIX_MASK,
>>   		   PCR_MATRIX_CLR);
>> -	mt7530_clear(priv, MT7530_PMCR_P(port), PMCR_LINK_SETTINGS_MASK);
>>   
>>   	mutex_unlock(&priv->reg_mutex);
>>   }
>> @@ -2257,6 +2255,12 @@ mt7530_setup(struct dsa_switch *ds)
>>   	mt7530_mib_reset(ds);
>>   
>>   	for (i = 0; i < MT7530_NUM_PORTS; i++) {
>> +		/* Clear link settings and enable force mode to force link down
>> +		 * on all ports until they're enabled later.
>> +		 */
>> +		mt7530_clear(priv, MT7530_PMCR_P(i), PMCR_LINK_SETTINGS_MASK);
>> +		mt7530_set(priv, MT7530_PMCR_P(i), PMCR_FORCE_MODE);
> 
> Any reason to not combine the two lines above into a single call:
> 
> mt7530_rmw(priv, MT7530_PMCR_P(i),
> 	   PMCR_LINK_SETTINGS_MASK | PMCR_FORCE_MODE,
> 	   PMCR_FORCE_MODE);

No reason whatsoever, I'll do this. Thanks!

Arınç

