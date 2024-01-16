Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5B0C4706C
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3l6hxpsFug+dZMhj61g9EoNgZMZVSBaqnjCk7tOjeaw=; b=z4b0fAG3ejuouY1bfOoDOGojpA
	oeUfdt2tDvZHKPCERvvz3G5T7jXOGM+tPfA54WB9xpXSyBlyFtLTBhYgeI0cknxhtsTAZXfn29IXr
	ItMEMh8+UvJLmdGXJsbNLhY8FSPv571Mee6HRcuFqXqgy/7vP5UOPq2iZLPxjsqAtEiVQRbYfFatR
	eJMloSoV4I4IHSh/xAUvMNVm7OXXledvE8XFnTukLWuCB40VPwZyftFYwwZ3nHQHN4bZ9I8yn2sSJ
	fhy3mAIbxHYgnLKu38BRnAqFbrVv6Gy6TxdFKXnlbUfOdIBp2vJZ/7XDjkFm8D+Qk7Sg2gV3z2ncH
	U0U4QEEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPjCD-00C8dd-0Z;
	Tue, 16 Jan 2024 13:09:37 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPjC9-00C8c0-0C;
	Tue, 16 Jan 2024 13:09:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C7F1B60005;
	Tue, 16 Jan 2024 13:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705410567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3l6hxpsFug+dZMhj61g9EoNgZMZVSBaqnjCk7tOjeaw=;
	b=pi/24u2pxzRvb+HE2QJTXSQdGLJDl+SNa4sY6ZwbdftUBQlELzwy0ASmfca4TyL//tWK4p
	FbAsL6ELKRBOIKhMoMq1uwSp6DTTAhWsq9qcBcZu5Cy5n5Dxc59NWsJbFZSjJeWXp4EBys
	kE8R+wTEPiz3fTWraQqSFIbbDI6jeHeIUXYhziNx46fgHN8bOlKq31jFlMzOHBels00sSM
	Y0b9bO/z9PqN++BFVvCQxijTjfMXx95rN5oCxMkjsdu0MD7KwzFJHJRyLwIjUExpxp/U0R
	jYSMJpOrzY8sipOi5hVX5hpN61LG6RW+iWpgqEp38GffH16AG4gJWoiO5VTR9Q==
Message-ID: <7f59d9e6-1653-4a8d-910d-5922452bb9e8@arinc9.com>
Date: Tue, 16 Jan 2024 16:09:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH net-next 6/8] net: dsa: mt7530: simplify
 mt7530_setup_port6() and change to void
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Luiz Angelo Daros de Luca <luizluca@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240113102529.80371-1-arinc.unal@arinc9.com>
 <20240113102529.80371-7-arinc.unal@arinc9.com>
 <20240115213720.vxlumsjwrjdkqxsl@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240115213720.vxlumsjwrjdkqxsl@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_050933_406784_CDF4EFE3 
X-CRM114-Status: GOOD (  23.49  )
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

On 16.01.2024 00:37, Vladimir Oltean wrote:
> On Sat, Jan 13, 2024 at 01:25:27PM +0300, Arınç ÜNAL wrote:
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 3ce4e0bb04dd..3a02308763ca 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -414,72 +414,56 @@ mt753x_preferred_default_local_cpu_port(struct dsa_switch *ds)
>>   }
>>   
>>   /* Setup port 6 interface mode and TRGMII TX circuit */
>> -static int
>> +static void
>>   mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>>   {
>>   	struct mt7530_priv *priv = ds->priv;
>> -	u32 ncpo1, ssc_delta, trgint, xtal;
>> +	u32 ncpo1, ssc_delta, xtal;
>>   
>>   	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
>>   
>> +	if (interface == PHY_INTERFACE_MODE_RGMII)
>> +		return;
> 
> It would be good to add a comment here which states that the port comes
> out of reset with values good for RGMII.
> 
> Also, there's a built-in assumption in this patch, that dynamically
> switching between RGMII and TRGMII is not possible. This is because
> phylink mac_config() is not necesarily called only once immediately
> after reset, but after each major_config().
> 
> The fact that the driver sets both PHY_INTERFACE_MODE_RGMII and
> PHY_INTERFACE_MODE_TRGMII at once in config->supported_interfaces does
> not disprove that dynamic reconfiguration is possible. Normally,
> interfaces for which it doesn't make sense to dynamically reconfigure
> (they are wired to fixed pinout) have a single bit set in
> supported_interfaces. Is this switching something that makes any sense
> at all, given that port 6 is internal? It's not something that phylink
> knows to do today, but if this is theoretically possible and remotely
> useful, someone might end up wanting, in the future, to revert this patch.

Do you mean by internal port that the port does not have MII pinout? Port 6
of the MT7530 switch do. It is possible to have an external PHY wired to
it. So it would make sense to design mt7530_setup_port6() in the sense that
dynamic reconfiguration is possible.

I've tested to see that the core operations for TRGMII does not interfere
so no need to undo them when the interface changes from TRGMII to RGMII.

I'll do below on this patch:

	if (interface == PHY_INTERFACE_MODE_RGMII) {
		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
			   P6_INTF_MODE(0));
		return;
	}

Arınç

