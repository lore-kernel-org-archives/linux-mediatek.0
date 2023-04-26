Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB28C7618E
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Apr 2023 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=scdniOaEMN93CnEzkg3P5onK/tzC0rz3np2V8rdqLqo=; b=j8SoywRlvYKRbu
	4D8XSBSJYz6mCy0KnuJWmW1qV4vXxiWFaoEzGCsPh8IvklfCDh4JPxo2u+CA1Xrwpu5KElUYI3Ht3
	FP+c9IU300XMMryWbhHbJGfd1RQ/FtFS8WqnwOrKvywVYGnqyAfH912I09rhsdHEfyYLHSrUsR+rm
	hanAD6RhBOOzNEkQoGvRG+GwYhnQqfywr5nO+KwbkBhtaB3aHtHqrRjMYj3pkWPSZ7zUtG/Wm62Tj
	xWVvCvXvQiETps29mrOF9yiSYMjsiqcpB8XwJr8Q54jKvHpyWFG2aN5MVf7zBI9AZXQLM8kErXjer
	3fwfyXVoSM2MNZwQvSBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1praHT-0038eC-1a;
	Wed, 26 Apr 2023 08:13:39 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1praHQ-0038d5-0B;
	Wed, 26 Apr 2023 08:13:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1682496746; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g2H/eTsheAIYkCOppxipJfD5P5trI7RfjlfLGFx7ZriFbsPQ5doZW6vCvbHCNkkTR0gpPH80WGrvAs1aEWSyrtX272EkYIUttpEhqIFX1sMXk7vbJPie8ZcCOoU7WBY/vT0bExpt9wc6Kya3eRiRdD4bSvVnsgNlkTMluC0vECI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1682496746; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=scdniOaEMN93CnEzkg3P5onK/tzC0rz3np2V8rdqLqo=; 
	b=czijfwYx310rhCUDxDVJy2aiugbW42a/peCGYLIxLOcaA1HuMSUCB7SynmGOJg+0jRKda6T9kL5XpjrbuzsB1WQ3jr6KYgvGLxYFEUsNizPhZJw243Nnhdu4Sk8yxvCe4KpaKo/aS7vEPFXzO9NpYRBY5YWg9ZJrTHNm4R3hDO4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1682496746;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=scdniOaEMN93CnEzkg3P5onK/tzC0rz3np2V8rdqLqo=;
	b=I0oPro1bUVwflc9HXRdxK81n8+PJ+A3j2HzFyrNaM0p4Yk0InSOZk7LmTp8zOC/+
	jaOqwPqZyhmB2GIpAoiz672nn5yh5P26Ipg8m4+U56mLCSqPx/9uXD0gfCNfIjEqVrJ
	FSCU7jBXWYO9xGrAqIn4PQ6EelDecH9C4BZD1Nu4=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1682496745634552.1517854827307; Wed, 26 Apr 2023 01:12:25 -0700 (PDT)
Message-ID: <ce681fac-5f00-f0fc-b2cf-89907c50ee7c@arinc9.com>
Date: Wed, 26 Apr 2023 11:12:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH net-next 04/24] net: dsa: mt7530: properly support
 MT7531AE and MT7531BE
To: Daniel Golle <daniel@makrotopia.org>
References: <20230425082933.84654-1-arinc.unal@arinc9.com>
 <20230425082933.84654-5-arinc.unal@arinc9.com>
 <ZEfsCit0XX8zqUIJ@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZEfsCit0XX8zqUIJ@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_011336_172805_C6B4C119 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25.04.2023 18:04, Daniel Golle wrote:
> On Tue, Apr 25, 2023 at 11:29:13AM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Introduce the p5_sgmii pointer to store the information for whether port 5
>> has got SGMII or not.
> 
> The p5_sgmii your are introducing to struct mt7530_priv is a boolean
> variable, and not a pointer.

I must've meant to say field.

> 
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
>> represent the mode that port 5 is being used in, not the hardware
>> information of port 5. Set p5_intf_sel to P5_INTF_SEL_GMAC5 instead, if
>> port 5 is not dsa_is_unused_port().
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> Other than the comment above this change makes sense and looks good to
> me, so once you correct the commit message, you may add my Acked-by.

Will do, thanks.

Arınç

