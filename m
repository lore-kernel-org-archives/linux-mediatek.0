Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896F2C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 07:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrWsSClDpsgyGzHOaL8tpqRTFE2Qs26x3Fav87hKIS4=; b=gYWA3KvvAyMk6tLHJz5XRTCct5
	rd+pEGdUhGnFehfNwBIWNURdb62q/o148tlrY3rsx9QIkaJCjEDafaG86BeIRgirevmMlhlnV+4qj
	7Ipbo8YoxNLNA9O1zKA2+ibP3munSygXVK9qM1r/rSbGRO3Mw/ByERrW9nM5JNe1Y43BBD4Z+z9K+
	lGgqXwPlSvBsloaDFgCUyGhQ/bhdnqdQODKCg2q6J8bsU2S8pKXR0vfIt5nDiAps/LuFX4O3iEEmh
	GtmHWeCyWyf1EzFYEfaYbjpeCUOPBG4OL+WcA7tcInR2eqGSRNU3izZOs8fkWhKso6yOGkWAbcDtE
	v3lSAmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfx9i-0000000GhSA-40Ai;
	Fri, 01 Mar 2024 07:18:06 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfx9e-0000000GhNy-2sSA;
	Fri, 01 Mar 2024 07:18:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C9E21C0006;
	Fri,  1 Mar 2024 07:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709277478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lrWsSClDpsgyGzHOaL8tpqRTFE2Qs26x3Fav87hKIS4=;
	b=QbgeyEDUeUMQOAPAbUNPlZUfudRBI8YM9TORjlY7M2cJeot2oDtllAcd0MjXUEnr5ZIZX1
	p7KyYE+yeIDFTQ8yQPM/ufRM8qE/cq+c2eNJ85dh0mpaStnBthX56nTPnApoRI0AihsDkF
	2/9EUpOLnnYTX/kKXISnEy6CzgF93YcJS+IzWLbfHW3wbZdVCVMkFOY9DGnPRrcWHktCq+
	pnHg5rPZD9FjXi0nAkhUqTYBfKx3j0DXH1Rhl+1pCFfYQkJSE8jq3RrkdY+VYmv+1rcD3M
	zlFgosSPF0xqqFX/CJ9MPl/p7Oqr645ldbp9SG2lOxBi/QZUBeIm20G6rHL0zA==
Message-ID: <ac5feb1c-602d-4562-9aed-d949670dd0f0@arinc9.com>
Date: Fri, 1 Mar 2024 09:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 8/8] net: dsa: mt7530: simplify link
 operations and force link down on all ports
To: Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTCB2aWEgQjQgUmVsYXk=?=
 <devnull+arinc.unal.arinc9.com@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240216-for-netnext-mt7530-improvements-3-v2-0-094cae3ff23b@arinc9.com>
 <20240216-for-netnext-mt7530-improvements-3-v2-8-094cae3ff23b@arinc9.com>
 <20240228174932.2500653d@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240228174932.2500653d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_231803_107857_40761D45 
X-CRM114-Status: GOOD (  23.26  )
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

Thanks for looking over this patch series Jakub!

On 29/02/2024 03:49, Jakub Kicinski wrote:
> On Fri, 16 Feb 2024 14:05:36 +0300 Arınç ÜNAL via B4 Relay wrote:
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
> 
> I don't know phylink so some basic questions..
> 
> What's "mode" in this case?

The mode here represents whether we will configure properties of the link
manually (force mode), or by polling the PHY. The driver is supposed to
configure the properties so we enable force mode on the port MAC registers.

MT7530 has a single bit for this, PMCR_FORCE_MODE. MT7531 has multiple
bits, MT7531_FORCE_MODE, each of them enabling the force mode for a certain
property of the link.

> 
>> Now that the bit for setting the port on force mode is done on
>> mt7530_setup() and mt7531_setup_common(), get rid of PMCR_FORCE_MODE_ID()
>> which helped determine which bit to use for the switch model.
> 
> MT7531_FORCE_MODE also includes MT7531_FORCE_LNK, doesn't that mean
> the link will be up?

No, that one enables force mode for the link status property. The bit for
setting the link status is PMCR_FORCE_LNK.

I know the current naming of the bits is confusing. I have patch for this
on my next patch series to improve it.

> 
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
> 
> This should be a separate change.

Sure, will do.

> 
>> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
>> @@ -2257,6 +2255,12 @@ mt7530_setup(struct dsa_switch *ds)
>>   	mt7530_mib_reset(ds);
>>   
>>   	for (i = 0; i < MT7530_NUM_PORTS; i++) {
>> +		/* Clear link settings and enable force mode to force link down
> 
> "Clear link settings to force link down" makes sense.
> Since I don't know what the mode is, the "and enable force mode"
> sounds possibly out of place. If you're only combining this
> for the convenience of RMW, keep the reasoning separate.

No. Force mode must be enabled so that we can manually set the link state.
Then, clearing the link settings achieves setting the link status to down.

Arınç

