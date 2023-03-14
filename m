Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A646C6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 18:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xR2ZuMBgL0CR3gcHLjvqNZioqN17cEC9aRmXB7527zk=; b=v5CKPOEwf602l1
	A6UOa/nPEaKq1/uScR0bbBNP2nQOMN6oEAayKqbDsN9kmVkev0T9joe0iyyZrT24CynYwGfbLcx5U
	ivEFxbKnHPNCJ2KYgQZQNWpaWV7HUgrvtmb26pFSsy4HbGJexRMOlvGKaQviUxlmrUuAvr7WqG7/j
	NBSwijKnzWY79onJCyCjMCmRHZLzfXOQW2B5DDbkvnsYsDcvuXpdDre0ZqHdo4pn7SQzJw07I/xM8
	JCeKMUhyR9WMLdZ5eAqtwSvD+/cz/vR7rqyetaOv0Dug2ZrclnnN2iTU6JihmwWtR83nVXqraCvEY
	mJyQcI8l1cY3gSiytMIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9IN-00BALK-1u;
	Tue, 14 Mar 2023 18:22:47 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc9IK-00BAJy-0B;
	Tue, 14 Mar 2023 18:22:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1678818109; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=D4i9/oTLSLk394ZwoD80SvbBPKmmbAi7Re4lFe9cDkrfUCT6mezA90KEBkr/lJFbk7GS9gc0oGDOopk+bZiBV/ar+uHR3nf5eYu88f2JSpiv3V+9fR37/CVjfzhybtwFiPgTYCfIke/8d8MptuT8zaO/eVUKpM2FC1GvF4ZWqkU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1678818109; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=xR2ZuMBgL0CR3gcHLjvqNZioqN17cEC9aRmXB7527zk=; 
	b=W/FYTpvgT1byFHRbWt97MhdSyUFSVN8y/n5Q60opw2F1uiG7P96tOtLN5VobZlEpCtyCZ2vW7IX07xrvXMM/1IyL5ngwgE8y8UWEikOt7MIVQqzQE1eGVOdQIMm2MavrjfOH76TjviTuwiY02ZtlhetkitucAunS3WcZGONly+E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1678818109;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xR2ZuMBgL0CR3gcHLjvqNZioqN17cEC9aRmXB7527zk=;
	b=QJDdUEtFvFUGGQyT+Y85S9VcGvWVwZi9XElFU+Nqy1eOtoxb/CAu2ABlE2jHRtfC
	3StiErNC3t49HoQbp2+qjgEaEprxj3luGwu5Z1d8RrT/FunShBvh6PgdxmbxpnznXn+
	kI+BefOVZPKEof2Z+isc/+X/7ztglYuQ8UdNm+oE=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1678818108571530.742693346108; Tue, 14 Mar 2023 11:21:48 -0700 (PDT)
Message-ID: <c07651cd-27b4-5ba4-8116-398522327d27@arinc9.com>
Date: Tue, 14 Mar 2023 21:21:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net-next v13 11/16] net: dsa: mt7530: use external PCS
 driver
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
 <e99cc7d1-554d-5d4d-e69a-a38ded02bb08@arinc9.com>
 <ZBCyqdfaeF/q8oZr@makrotopia.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZBCyqdfaeF/q8oZr@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_112244_132129_A562133F 
X-CRM114-Status: GOOD (  19.04  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Couzens <lynxis@fe80.eu>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14/03/2023 20:45, Daniel Golle wrote:
> On Tue, Mar 14, 2023 at 08:16:35PM +0300, Arınç ÜNAL wrote:
>> On 9.03.2023 13:57, Daniel Golle wrote:
>>> [...]
>>> +static int mt7530_regmap_read(void *context, unsigned int reg, unsigned int *val)
>>> +{
>>> +	struct mt7530_priv *priv = context;
>>> +
>>> +	*val = mt7530_read(priv, reg);
>>> +	return 0;
>>> +};
>>> +
>>> +static int mt7530_regmap_write(void *context, unsigned int reg, unsigned int val)
>>> +{
>>> +	struct mt7530_priv *priv = context;
>>> +
>>> +	mt7530_write(priv, reg, val);
>>> +	return 0;
>>> +};
>>> +
>>> +static int mt7530_regmap_update_bits(void *context, unsigned int reg,
>>> +				     unsigned int mask, unsigned int val)
>>> +{
>>> +	struct mt7530_priv *priv = context;
>>> +
>>> +	mt7530_rmw(priv, reg, mask, val);
>>> +	return 0;
>>> +};
>>> +
>>> +static const struct regmap_bus mt7531_regmap_bus = {
>>> +	.reg_write = mt7530_regmap_write,
>>> +	.reg_read = mt7530_regmap_read,
>>> +	.reg_update_bits = mt7530_regmap_update_bits,
>>
>> These new functions can be used for both switches, mt7530 and mt7531,
>> correct?
> 
> In theory, yes, they could be used on all switch ICs supported by the
> mt7530.c driver. In practise they are used on MT7531 only because MT7530
> and MT7621 don't have any SGMII/SerDes ports, but only MT7531 does.
> 
> 
>> If so, I believe they are supposed to be called mt753x since
>> 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a new
>> hardware").
>>
>> mt753x: functions that can be used for mt7530 and mt7531 switches.
>> mt7530: functions specific to mt7530 switch.
>> mt7531: functions specific to mt7531 switch.
> 
> Good catch, so mt7530_* is for sure not accurate. I used that naming
> due to existing function names mt7530_read, mt7530_write and mt7530_rmw.

I was going to send a mail to netdev mailing list to ask for opinions 
whether we should rename the mt7530 DSA driver to mt753x and rename 
these functions you mentioned to mt753x so it's crystal clear what code 
is for what hardware. Now that we glossed over it here, I guess I can 
ask it here instead.

> 
> Given the situation I've explained above I think that mt753x_* would
> be the best and I will change that for v14.
> 
> Thank you for reviewing!

Sounds good, cheers.

Arınç

