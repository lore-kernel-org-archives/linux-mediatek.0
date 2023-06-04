Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA7DC77B73
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzKxESsGqIImQUDJUJYL+7PImeOTaIjTFkaL71n8Wq0=; b=hAKq/e62+HOotd
	4qzpj87IFe+XQkPlbyYAqRT5iwBgd/matGarYZwQhIHxbkeMSk8LrzLpRdehgnnjOMtMv9jwPoW+s
	9Jh6Wro5a/tLCZUq7t46GjAaWoSz9b/GJftqZS6CfOsmtmWveYPR2MQD7bd72SJwkAk0uZo/74TJ3
	A+ASJOFmTFkUzaYieveJyR0fDbAiXoIP9VhqHEoPLsxknNdAZ1oRERha/kiwqGbwfklAAU9CmYf6C
	y86qVR6r3kbW7pMSMRSDPl2LFSNb5FyJGvaMVAcdmUL4lpznv7R2gB6ZQTfwuWmrySnuJ5xvfN6cW
	wfTScijH7lIwHrK1UsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5qW2-00CRv8-0u;
	Sun, 04 Jun 2023 16:23:38 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5qVz-00CRty-1I;
	Sun, 04 Jun 2023 16:23:36 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685895784; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UWW3l4ZrcaDK2YfhvoxoFmFsg1DALMulLu+BN8skX832dUHNBHhAWjNF5ANPKC1YP8diLkvT3zwrGWWh09g4Mnamo34/TKGXS52q65oEVs45++QDdQ1Rc5uuTnotO3O08h91usibr6u7I/FVJd8m+Xgll8+ixxiqDc1hcMkBxzI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685895784; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=ZzKxESsGqIImQUDJUJYL+7PImeOTaIjTFkaL71n8Wq0=; 
	b=CJdkPXxIlDoNsuHCySmE07J+PIr8E6P7NShHnueS+ADS6I0UV/FHeA05VYG1nim+Hfhqr/5H18qYJNbHGivB6EgdX2ttNdd9mv/ZuQ18zYaLbFXEKFXNVdcNDy7CtvhHa5UUPqo3Qw5AyVEsnKAqzJc9eU23cS7XRlKTqXcZu+o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685895784;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZzKxESsGqIImQUDJUJYL+7PImeOTaIjTFkaL71n8Wq0=;
	b=Qr6/guytmsnwfXLB6YhzHVTWgNrE4sWgtNzNeWeA7hnenI5xRdAd6iFwYDKISEbp
	gJ4gjJ5cQ/57ZRiO1xlZs6rVE+QzqgbeiVbuM/49u/96sXeit0gShlZs/WY7uYl3GwM
	JzsSIiUILE0PlFv1ZBgyc343QpCws0EAF+tT5b/E=
Received: from [192.168.66.198] (178-147-169-233.haap.dm.cosmote.net [178.147.169.233]) by mx.zohomail.com
	with SMTPS id 1685895783375357.2741855678689; Sun, 4 Jun 2023 09:23:03 -0700 (PDT)
Message-ID: <a60be212-7b81-20ea-8af4-eee70ac3ecd8@arinc9.com>
Date: Sun, 4 Jun 2023 19:22:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 05/30] net: dsa: mt7530: read XTAL value from
 correct register
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230524165701.pbrcs4e74juzb4r3@skbuf>
 <7c915d5b-56c9-430d-05ac-544f76966eb1@arinc9.com>
 <20230525133140.xewm6g5rl7sm57d2@skbuf>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-6-arinc.unal@arinc9.com>
 <20230524165701.pbrcs4e74juzb4r3@skbuf>
 <7c915d5b-56c9-430d-05ac-544f76966eb1@arinc9.com>
 <20230525133140.xewm6g5rl7sm57d2@skbuf>
 <f9e29db7-7b95-290c-b44c-97cf95476141@arinc9.com>
 <f9e29db7-7b95-290c-b44c-97cf95476141@arinc9.com>
 <20230604071122.kb3xenjbptm6jebh@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230604071122.kb3xenjbptm6jebh@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_092335_471982_28C4F306 
X-CRM114-Status: GOOD (  21.41  )
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

On 4.06.2023 10:11, Vladimir Oltean wrote:
> On Sun, Jun 04, 2023 at 09:34:38AM +0300, Arınç ÜNAL wrote:
>>> I disagree as a matter of principle with the reasoning. The fact that
>>> XTAL constants are defined under HWTRAP is not a reason to change the
>>> code to read the XTAL values from the HWTRAP register. The fact that
>>> XTAL_FSEL is read-only in MHWTRAP is indeed a reason why you *could*
>>> read it from HWTRAP, but also not one why you *should* make a change.
>>
>> Makes sense. I have refactored the hardware trap constants definitions
>> by looking at the documents for MT7530 and MT7531. The registers are the
>> same on both switches so I combine the bits under MT753X_(M)HWTRAP.
>>
>> I put the r/w bits on MHWTRAP to MWHTRAP, the read-only bits on HWTRAP
>> and MHWTRAP to HWTRAP. Mind that the MT7531_CHG_STRAP bit exists only on
>> the MHWTRAP register.
>>
>> To follow this, I read XTAL for MT7530 from HWTRAP instead of MHWTRAP
>> since the XTAL bits are read-only. Would this change make sense as a
>> matter of refactoring?
> 
> Possibly. The maintainers of mt7530 have the definitive word on that.
> Behavior changes (reading XTAL from HWTRAP instead of MHWTRAP) should
> still have their separate change which isn't noisy, separate from the
> renaming of constants.
> 
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 5b77799f41cc..444fa97db7c0 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -420,9 +420,9 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>>   	struct mt7530_priv *priv = ds->priv;
>>   	u32 ncpo1, ssc_delta, i, xtal;
>> -	mt7530_clear(priv, MT7530_MHWTRAP, MHWTRAP_P6_DIS);
>> +	mt7530_clear(priv, MT753X_MHWTRAP, MT7530_P6_DIS);
>> -	xtal = mt7530_read(priv, MT7530_MHWTRAP) & HWTRAP_XTAL_MASK;
>> +	xtal = mt7530_read(priv, MT753X_HWTRAP) & MT7530_XTAL_MASK;
>>   	if (interface == PHY_INTERFACE_MODE_RGMII) {
>>   		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
>> @@ -431,21 +431,21 @@ mt7530_setup_port6(struct dsa_switch *ds, phy_interface_t interface)
>>   		mt7530_rmw(priv, MT7530_P6ECR, P6_INTF_MODE_MASK,
>>   			   P6_INTF_MODE(1));
>> -		if (xtal == HWTRAP_XTAL_25MHZ)
>> +		if (xtal == MT7530_XTAL_25MHZ)
>>   			ssc_delta = 0x57;
>>   		else
>>   			ssc_delta = 0x87;
>>   		if (priv->id == ID_MT7621) {
>>   			/* PLL frequency: 125MHz: 1.0GBit */
>> -			if (xtal == HWTRAP_XTAL_40MHZ)
>> +			if (xtal == MT7530_XTAL_40MHZ)
>>   				ncpo1 = 0x0640;
>> -			if (xtal == HWTRAP_XTAL_25MHZ)
>> +			if (xtal == MT7530_XTAL_25MHZ)
>>   				ncpo1 = 0x0a00;
>>   		} else { /* PLL frequency: 250MHz: 2.0Gbit */
>> -			if (xtal == HWTRAP_XTAL_40MHZ)
>> +			if (xtal == MT7530_XTAL_40MHZ)
>>   				ncpo1 = 0x0c80;
>> -			if (xtal == HWTRAP_XTAL_25MHZ)
>> +			if (xtal == MT7530_XTAL_25MHZ)
>>   				ncpo1 = 0x1400;
>>   		}
>> @@ -487,12 +487,12 @@ mt7531_pll_setup(struct mt7530_priv *priv)
>>   	val = mt7530_read(priv, MT7531_CREV);
>>   	top_sig = mt7530_read(priv, MT7531_TOP_SIG_SR);
>> -	hwstrap = mt7530_read(priv, MT7531_HWTRAP);
>> +	hwstrap = mt7530_read(priv, MT753X_HWTRAP);
>>   	if ((val & CHIP_REV_M) > 0)
>> -		xtal = (top_sig & PAD_MCM_SMI_EN) ? HWTRAP_XTAL_FSEL_40MHZ :
>> -						    HWTRAP_XTAL_FSEL_25MHZ;
>> +		xtal = (top_sig & PAD_MCM_SMI_EN) ? MT7531_XTAL_FSEL_40MHZ :
>> +						    MT7531_XTAL_FSEL_25MHZ;
>>   	else
>> -		xtal = hwstrap & HWTRAP_XTAL_FSEL_MASK;
>> +		xtal = hwstrap & MT7531_XTAL25;
> 
> xtal = hwstrap & BIT(7). The "xtal" variable will either hold the value
> of 0 or BIT(7), do you agree?

Yes I suppose the correct code should be:

xtal = (hwstrap & MT7531_XTAL25) ? MT7531_XTAL_FSEL_25MHZ :
				   MT7531_XTAL_FSEL_40MHZ;

> 
>>   	/* Step 1 : Disable MT7531 COREPLL */
>>   	val = mt7530_read(priv, MT7531_PLLGP_EN);
>> @@ -521,13 +521,13 @@ mt7531_pll_setup(struct mt7530_priv *priv)
>>   	usleep_range(25, 35);
>>   	switch (xtal) {
>> -	case HWTRAP_XTAL_FSEL_25MHZ:
>> +	case MT7531_XTAL_FSEL_25MHZ:
> 
> reworded:
> 	case 1:
> 
> when will "xtal" be equal to 1?

This should work correctly with my comment above.

Arınç

