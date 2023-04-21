Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD375C77B76
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 18:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nxLE0R6gjb1/ZHAsw0XUmCm7YOxzHcMKWxooBKcqKA=; b=BGroe0aG4iVi2n
	YGpVOKbMO7s1ZzSp838U6fUF6dWH7kPyvywNRGqxd/IdllXKLPCPfXmcefyin9kfP905xOnmCAvB7
	h00gJDplRn9pD58zaeY/ioA+4AelLN0YtTHZdV45BRzD4zGzSGWz6xUvSNr/6TEiVF+s+x/WV858d
	C6zZx1Y5gl3VFpxfTyon9DcdDzJjf0ag6JdqjP7epnzQgr9xWXiX0yIMFEWTMyCZS2VQKGNKZ4fvQ
	Rr549M2UrM/IM1eCPlAgAFNOS0FkxUXrHwZlkBQPwl7Cq3JYggxYawFD3EW2UvKNiA7+OHS6TsBlt
	rslMQolyKUmDuCvm8p6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvWD-00Bczt-08;
	Fri, 21 Apr 2023 18:30:01 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppvW8-00Bcyq-34;
	Fri, 21 Apr 2023 18:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682101767; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QMY72ZsT9TPdktf6rDLixt10ZbESgqGRHQv2+qRrpQTZhZ+LUjPDxD0D99mT0NB3mf4t0qV1ZPfuynoh3v44mzPWkUHxNKEN7XzSTuJdVvvTX/vqdG8B6EBPRIjUTCcvIhzrFx1m48257lMOBnlJbaeKF9qZpVbgqmDJaE9aZJc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682101767; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=6nxLE0R6gjb1/ZHAsw0XUmCm7YOxzHcMKWxooBKcqKA=; 
	b=S9fLar+FxFMpRUb/5WZzvU6U7ZUJ+etZQ2VniUSsr1EoCPrLLvkdY/eXtiKnLEiDBbO0ZDo+G8fjy7s2fUU7rB2Q7OE7rJ95S+Y62KdENw6B+jZV5Dbiai2dp6zkATksIsYz7N1DshU/Dh5Qun/OXySVwlr9imWSJgXdAHoToUU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682101767;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=6nxLE0R6gjb1/ZHAsw0XUmCm7YOxzHcMKWxooBKcqKA=;
	b=jct97Cl8fpkeEJ6Y1c+kVOuloS/ggaZRmV2WlhEFtm1WA8+RKLlHJ+5+rdfL52K7
	r4lS6fF9A6zft/LJwCvFizgLQim+wS4MVosxjlxPS5S1lFfH1srIxiENn9ZHGcm+rzn
	Wo2I8RF2wf0AAdSD/lRVRU4JE8kNol34rZR1ZQbg=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 16821017651111007.8313054039817; Fri, 21 Apr 2023 11:29:25 -0700 (PDT)
Message-ID: <cc43eb64-b1f0-813e-2506-79cc41ab5def@arinc9.com>
Date: Fri, 21 Apr 2023 21:29:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH net-next 03/22] net: dsa: mt7530: properly support
 MT7531AE and MT7531BE
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
References: <20230421143648.87889-1-arinc.unal@arinc9.com>
 <20230421143648.87889-4-arinc.unal@arinc9.com>
 <ZEKqH2oELsJKANkh@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZEKqH2oELsJKANkh@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_112957_034886_EBCD8B2D 
X-CRM114-Status: GOOD (  25.73  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Richard van Schagen <richard@routerhints.com>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Richard van Schagen <vschagen@cs.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, erkin.bozoglu@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 21.04.2023 18:22, Daniel Golle wrote:
> On Fri, Apr 21, 2023 at 05:36:29PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Introduce the p5_sgmii pointer to store the information for whether port 5
>> has got SGMII or not. Print "found MT7531AE" if it's got it, print "found
>> MT7531BE" if it hasn't.
>>
>> Move the comment about MT7531AE and MT7531BE to mt7531_setup(), where the
>> switch is identified.
>>
>> Get rid of mt7531_dual_sgmii_supported() now that priv->p5_sgmii stores the
>> information. Address the code where mt7531_dual_sgmii_supported() is used.
>>
>> Get rid of mt7531_is_rgmii_port() which just prints the opposite of
>> priv->p5_sgmii.
>>
>> Remove P5_INTF_SEL_GMAC5_SGMII. The p5_interface_select enum is supposed to
>> represent the mode that port 5 is used in, not the hardware information of
>> port 5. Set p5_intf_sel to P5_INTF_SEL_GMAC5 instead, if port 5 is not
>> dsa_is_unused_port().
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/net/dsa/mt7530-mdio.c |  7 ++---
>>   drivers/net/dsa/mt7530.c      | 49 +++++++++++++++--------------------
>>   drivers/net/dsa/mt7530.h      |  6 +++--
>>   3 files changed, 27 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
>> index 088533663b83..fa3ee85a99c1 100644
>> --- a/drivers/net/dsa/mt7530-mdio.c
>> +++ b/drivers/net/dsa/mt7530-mdio.c
>> @@ -81,17 +81,14 @@ static const struct regmap_bus mt7530_regmap_bus = {
>>   };
>>   
>>   static int
>> -mt7531_create_sgmii(struct mt7530_priv *priv, bool dual_sgmii)
>> +mt7531_create_sgmii(struct mt7530_priv *priv)
>>   {
>>   	struct regmap_config *mt7531_pcs_config[2] = {};
>>   	struct phylink_pcs *pcs;
>>   	struct regmap *regmap;
>>   	int i, ret = 0;
>>   
>> -	/* MT7531AE has two SGMII units for port 5 and port 6
>> -	 * MT7531BE has only one SGMII unit for port 6
>> -	 */
>> -	for (i = dual_sgmii ? 0 : 1; i < 2; i++) {
>> +	for (i = priv->p5_sgmii ? 0 : 1; i < 2; i++) {
>>   		mt7531_pcs_config[i] = devm_kzalloc(priv->dev,
>>   						    sizeof(struct regmap_config),
>>   						    GFP_KERNEL);
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index c680873819b0..edc34be745b2 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -473,15 +473,6 @@ mt7530_pad_clk_setup(struct dsa_switch *ds, phy_interface_t interface)
>>   	return 0;
>>   }
>>   
>> -static bool mt7531_dual_sgmii_supported(struct mt7530_priv *priv)
>> -{
>> -	u32 val;
>> -
>> -	val = mt7530_read(priv, MT7531_TOP_SIG_SR);
>> -
>> -	return (val & PAD_DUAL_SGMII_EN) != 0;
>> -}
>> -
>>   static int
>>   mt7531_pad_setup(struct dsa_switch *ds, phy_interface_t interface)
>>   {
>> @@ -496,7 +487,7 @@ mt7531_pll_setup(struct mt7530_priv *priv)
>>   	u32 xtal;
>>   	u32 val;
>>   
>> -	if (mt7531_dual_sgmii_supported(priv))
>> +	if (priv->p5_sgmii)
>>   		return;
>>   
>>   	val = mt7530_read(priv, MT7531_CREV);
>> @@ -907,8 +898,6 @@ static const char *p5_intf_modes(unsigned int p5_interface)
>>   		return "PHY P4";
>>   	case P5_INTF_SEL_GMAC5:
>>   		return "GMAC5";
>> -	case P5_INTF_SEL_GMAC5_SGMII:
>> -		return "GMAC5_SGMII";
>>   	default:
>>   		return "unknown";
>>   	}
>> @@ -2440,6 +2429,18 @@ mt7531_setup(struct dsa_switch *ds)
>>   		return -ENODEV;
>>   	}
>>   
>> +	/* MT7531AE has got two SGMII units. One for port 5, one for port 6.
>> +	 * MT7531BE has got only one SGMII unit which is for port 6.
>> +	 */
>> +	val = mt7530_read(priv, MT7531_TOP_SIG_SR);
>> +
>> +	if ((val & PAD_DUAL_SGMII_EN) != 0) {
>> +		priv->p5_sgmii = true;
>> +		dev_info(priv->dev, "found MT7531AE\n");
>> +	} else {
>> +		dev_info(priv->dev, "found MT7531BE\n");
> 
> I don't think dev_info is useful here for regular users.
> If you really want this output, use dev_dbg to reduce log pollution.
> Imho completely removing the else branch and only silently
> setting priv->p5_sgmii is sufficient, as users can also turn on
> dyndbg for drivers/net/pcs/pcs-mtk-lynxi.c and will then be informed
> about the created SGMII/1000Base-X/2500Base-X PCS instances.

Sounds good, I'll drop it.

Arınç

