Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7686C77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBXeXCU/UgwboBJFOf/poMbw1fHDOx94dPF/IdTAh+A=; b=sUAll8CZo9VEZ5
	XjwCzVdCa+3MOQ0RfX8mbkhK5adZVQ4lOWSCadAfcn2lVzLDJUEQouIzNNNbX5EUcXqn5EOvsXrjH
	3yXJ8zWh4Z5WJ/vhHpbMCd9BNvNWUrNLTti9duOrAp7e0b0GemYPl6ABe1BlvXSWt8i8u6d2r5oJ4
	LhfjKi2cYDrcXcIx3F1eALlJy78rYgmZjAwbphPU0vE/Bq6Mfdy4dmPSGHaKZeM56aweKpgGuZrcu
	qtbijls2AOjWEJo67XJlUUbujxMdoLMFLh099yEFJGTRd+jviUaOe8sTvwW8SInzMD4pXLt7izdWj
	G+483gUjUEVnJCkddeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2529-00FkIg-0F;
	Thu, 25 May 2023 07:05:13 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2526-00FkHq-1R;
	Thu, 25 May 2023 07:05:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684998280; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FhlwXbdyg2KV2qaSNsln6HszZZBAoO9AenIWWp3kfLXU1Xxif1rBD1a9uTs2T4rtmhZwXwzoBZ/STmwjRovfEpiD8Px6f6YeLzGWMo7RiCHz1cvRMi5ZfRGt5uTctEfakiNKPgzH/KvBZ1bMLTPvZbxWU53oyADFv0uhJCCRJHw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684998280; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=BBXeXCU/UgwboBJFOf/poMbw1fHDOx94dPF/IdTAh+A=; 
	b=Hd4ensrRAnyicfindEUE0QY8Fuyt/86ttFy3+coH0EXiK5EHgPeohg2cPS7KHQLc4UeexX19HF+FNBqmXfhGIR2MCV/Qh88nnNuKdIuWttMmdsKOZl1NLm/4IO0kUnwRbIvAYXmim4kC6NzWXZ8PO+VuTM7+NUkvoxR9XxdurOU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684998280;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BBXeXCU/UgwboBJFOf/poMbw1fHDOx94dPF/IdTAh+A=;
	b=QDUK2KjPTaW0DDxc20ompR2E7FSlQTpglMvQgWpXpnoU08UvQrIMMzAwOy3JkZAf
	0HbFuaM+N/Czzdx4OJ79/zAvc+q4a+j/+wCTaJwrTbvCR6yfNWq7eLh5qyZT/NcS+DK
	HtUPU0quBgwF/2Uq5RDnwyfKDP3i+vODBP/TiOAg=
Received: from [10.10.10.217] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 168499827797666.68276826582598; Thu, 25 May 2023 00:04:37 -0700 (PDT)
Message-ID: <7d2aacbe-9725-2c15-38b7-deb56184f82b@arinc9.com>
Date: Thu, 25 May 2023 10:04:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 12/30] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-13-arinc.unal@arinc9.com>
 <20230524181512.tmll4ijpijmc5fea@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230524181512.tmll4ijpijmc5fea@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_000510_544018_9B696FAF 
X-CRM114-Status: GOOD (  21.80  )
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

On 24.05.2023 21:15, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:14PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> The crystal frequency concerns the switch core. The frequency should be
>> checked when the switch is being set up so the driver can reject the
>> unsupported hardware earlier and without requiring port 6 to be used.
>>
>> Move it to mt7530_setup().
>>
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> Do you know why a crystal frequency of 20 MHz is not supported?

I don't know, it just isn't.

https://github.com/BPI-SINOVOIP/BPI-R2-bsp/blob/master/linux-mt/drivers/net/ethernet/mediatek/gsw_mt7623.c#L1076

> 
>>   drivers/net/dsa/mt7530.c | 18 ++++++++++--------
>>   1 file changed, 10 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 049f7be0d790..fa48273269c4 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -408,13 +408,6 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>>   
>>   	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
>>   
>> -	if (xtal == HWTRAP_XTAL_20MHZ) {
>> -		dev_err(priv->dev,
>> -			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
>> -			__func__);
>> -		return -EINVAL;
>> -	}
>> -
>>   	switch (interface) {
>>   	case PHY_INTERFACE_MODE_RGMII:
>>   		trgint = 0;
>> @@ -2133,7 +2126,7 @@ mt7530_setup(struct dsa_switch *ds)
>>   	struct mt7530_dummy_poll p;
>>   	phy_interface_t interface;
>>   	struct dsa_port *cpu_dp;
>> -	u32 id, val;
>> +	u32 id, val, xtal;
>>   	int ret, i;
>>   
>>   	/* The parent node of master netdev which holds the common system
>> @@ -2203,6 +2196,15 @@ mt7530_setup(struct dsa_switch *ds)
>>   		return -ENODEV;
>>   	}
>>   
>> +	xtal = mt7530_read(priv, MT7530_HWTRAP) & HWTRAP_XTAL_MASK;
>> +
>> +	if (xtal == HWTRAP_XTAL_20MHZ) {
>> +		dev_err(priv->dev,
>> +			"%s: MT7530 with a 20MHz XTAL is not supported!\n",
>> +			__func__);
> 
> I don't think __func__ brings much value here, it could be dropped in
> the process of moving the code.

Will do.

> 
> Also, the HWTRAP register is already read once, here (stored in "val"):
> 
> 	INIT_MT7530_DUMMY_POLL(&p, priv, MT7530_HWTRAP);
> 	ret = readx_poll_timeout(_mt7530_read, &p, val, val != 0,
> 				 20, 1000000);
> 
> I wonder if we really need to read it twice.

Likely not, good catch.

Arınç

