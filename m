Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97193C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jan 2024 14:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9f0inLiNdvMCgAXDzTOMFJm8AwgD4xAovOKS/w8Rdk=; b=VwNQE8RhSIxQzZ
	DYFzh8B6qlDarS5Ips1wk8mvn7T+3eLfwjIac4w3UvcBf/3MkWVQJTRKnXvawjcPf1KyjQEF3tmCJ
	z7doJKjfo1mxvpSddZPNQIQKbWJBwoYg2DXTPnNwWBYL89Orgh8Dr2f0flDWiwKloNSfYcoV67c8P
	aEYvmsPKabT04QITS2Q6UP+mYg08GkkLCdIvd+Tk44IEpliPQow+La/aFz4H+K08gPSdHwKdJnfTb
	gdBDGieWC4Fv7Eud/EJpa+d4bRrupCzCOWwhgiAIJkkQHgATRwMvO8gTzDXtV/rY8lAfnRVMux4Cn
	nOr7e2N23+rUsrtAa3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rM7kb-001RIk-2i;
	Sat, 06 Jan 2024 14:34:13 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rM7kY-001RHg-0F;
	Sat, 06 Jan 2024 14:34:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B016FF803;
	Sat,  6 Jan 2024 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704551644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9f0inLiNdvMCgAXDzTOMFJm8AwgD4xAovOKS/w8Rdk=;
	b=Be2kNutcdju7oMbb8ncEf8YM/PrItPtdRjqrlnG7cw6TyUUav9PHvJ6jwQbyfXhTgsJO8W
	k1LoS4yVcy+iNJ4cEeBnHsSiKt1iflrelvfXAjxc7P8q9E292mPmfUkZWlTpcohM/dgEe3
	q6ELEjoYY4JU9TEE8gYio88A7Vq5WRmZo3vEaN69Cbhjy5jaF+dFOIK0zXsnf9EJlZL8NB
	pQLt99kLI7XB3BYcD45A8ZtaQ9l+AnW33Ex0iqDP2kqQdTIMIsRB7WRki4bebDi4g3xK3f
	U11zqQdYEUpWVwWKVep6KvzPtSPXtR9ivGJlF8uQj5hRCCvnSRSpeo456xLi+A==
Message-ID: <6d6169bc-ce33-46e2-8226-0fef9f92949b@arinc9.com>
Date: Sat, 6 Jan 2024 17:33:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 1/7] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-1-arinc.unal@arinc9.com>
 <20231227044347.107291-2-arinc.unal@arinc9.com>
 <20231227044347.107291-2-arinc.unal@arinc9.com>
 <20240104152232.jkoqiuwk3rd24rpm@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240104152232.jkoqiuwk3rd24rpm@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_063410_409205_B1EA7B53 
X-CRM114-Status: GOOD (  17.33  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 4.01.2024 18:22, Vladimir Oltean wrote:
> On Wed, Dec 27, 2023 at 07:43:41AM +0300, Arınç ÜNAL wrote:
>> @@ -3075,6 +3071,38 @@ static int mt753x_set_mac_eee(struct dsa_switch *ds, int port,
>>   	return 0;
>>   }
>>   
>> +static void
>> +mt753x_conduit_state_change(struct dsa_switch *ds,
>> +			    const struct net_device *conduit,
>> +			    bool operational)
>> +{
>> +	struct dsa_port *cpu_dp = conduit->dsa_ptr;
>> +	struct mt7530_priv *priv = ds->priv;
>> +	u8 mask;
>> +	int val = 0;
> 
> Longest line first.
> 
>> +
>> +	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
>> +	 * forwarded to the numerically smallest CPU port which the DSA conduit
>> +	 * interface its affine to is up.
> 
> "first CPU port whose conduit interface is up"
> 
>> +	 */
>> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
>> +		return;
>> +
>> +	mask = BIT(cpu_dp->index);
>> +
>> +	if (operational)
>> +		priv->active_cpu_ports |= mask;
>> +	else
>> +		priv->active_cpu_ports &= ~mask;
>> +
>> +	if (priv->active_cpu_ports)
>> +		val =
>> +		    CPU_EN |
>> +		    CPU_PORT(__ffs((unsigned long)priv->active_cpu_ports));
> 
> I don't think the type cast is necessary (implicit type promotion takes place).
> 
> Also, it is customary to put {} for multi-line "if" blocks, even if they are
> made up of a single expression.
> 
> But without the type cast, it could look like this.
> 
> 	if (priv->active_cpu_ports)
> 		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));

Will do. Thanks for dealing with my rookie mistakes. :)

Arınç

