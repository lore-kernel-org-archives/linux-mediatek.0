Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD75C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 06:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZWlL+X281/Zl5DVb1uux7mzuNKw9DdevEn+JSeEMus=; b=hM5jNAPH5qhecl
	23iR7nwp4bIE3vCkGDK7NGNzfWjLwYsmG47ut8pTavcA+Lnj42fMwak8THpAd6bPmrPQTwu7gItDD
	DlIkMF+lVxBRglfJI0RYdBPIx9Z5OKQXw3pdxCds7lwLYndb61ifB+RmO8nF0MNzfSA6V8D/FY6Ij
	W2FVxXad3tc334LARjWQHh1Qk8E47XklYkgrlQMCi494wFunXgBwPCYiie2V8b/6gKlwDRyDKqpHT
	gm/1+13DVeHD/4rXvcUTOhMAE8nIZRG1AISVSew1bnx9hufDuTs6MWl1AmN94pHbV8hG658l1Z/Ui
	NlS6iqNv6coUxjjyyMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q242S-00FdIp-2i;
	Thu, 25 May 2023 06:01:28 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q242P-00FdHS-0B;
	Thu, 25 May 2023 06:01:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684994441; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=H7Gb/GRK434tf5OoFV6XbjyMYYnHGuSRucN4PO3V2e+FGGD7KOBK5mY8HNnINmHC5czdnwrxagyq6/Cwd0pLVvcj9GSpAda+e1jrJ+jAglsyYaJkTbkOA+gS/+PxjqT90bIvSdke9JRz4scMS63L21s3yx+ANT+7ySBpnmAi4rc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684994441; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=fZWlL+X281/Zl5DVb1uux7mzuNKw9DdevEn+JSeEMus=; 
	b=RC0kMIuyUQBt+7JzNiM4zZK/VETPVvyil8YX3M/Qd9EXvQHTgsmhHc5FNNr8Vt1CX79/Dk50rlu72I1jo3vLMbkaRZaFxMh+wLrw0in32EeSA9WHu5LjSLxvcD6uv3UTSgIx675qrDRkF3JQyh2rIHWqID2RUiWKGEcqjhllJvs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684994441;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fZWlL+X281/Zl5DVb1uux7mzuNKw9DdevEn+JSeEMus=;
	b=R99uKyKyy5+i/nPLyF4nQwGNSzfNX7s46DuXv0vApoQhpBWhSwMbYxatZldcTkBt
	76j0n5fU/z0mz8tM/xhDGUraHLQc752afncsVaXfLoVQBR3smjZ972NlVlczdww3ZFB
	O3VHFsAvmQxMUUtme1TTDxjCSZXmg/KggcKKGhYU=
Received: from [10.10.10.217] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1684994440573922.120964931391; Wed, 24 May 2023 23:00:40 -0700 (PDT)
Message-ID: <98d3cefc-0198-f3b2-8ab6-c99ed50e5f57@arinc9.com>
Date: Thu, 25 May 2023 09:00:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 03/30] net: dsa: mt7530: properly support
 MT7531AE and MT7531BE
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-4-arinc.unal@arinc9.com>
 <20230524144817.dubqwmfbthes2ggh@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230524144817.dubqwmfbthes2ggh@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_230125_174518_B65D4397 
X-CRM114-Status: GOOD (  20.78  )
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

On 24.05.2023 17:48, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:05PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Introduce the p5_sgmii field to store the information for whether port 5
>> has got SGMII or not.
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
>> Acked-by: Daniel Golle <daniel@makrotopia.org>
>> ---
> 
> Pretty busy patch, and after reading it, I'm not sure:
> 
> - why? (this seems to be absent from the commit message)
> - how are MT7531AE and MT7531BE supported any more properly after this
>    change, as the commit title claims
> - what is the overall effect, other than just refactoring. If that's
>    all, what's written on the tin needs to be a better representation of
>    what's inside.
> 
> Pure refactoring is not a bad goal in itself, as long as we're on the
> same page that there is a justification which makes the new code better
> than the old one.

With this patch, instead of reading the MT7531_TOP_SIG_SR register 
multiple times, the register will be read once and the value will be 
stored on the p5_sgmii field. This saves unnecessary reads of the 
register. I will mention this on the patch log.

This is already being done on the U-Boot driver.

https://github.com/u-boot/u-boot/blob/master/drivers/net/mtk_eth.c#L859

I think "improve MT7531AE and MT7531BE support" will be a better subject.

Arınç

