Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F63FC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 06:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QmWADVtt1bAIDiV+lGyZGiUZ+bZgxA+uS3KFDsIT1TI=; b=rkIt9Q4Y7fRqji
	XhVf5V1mBpqlnqIskr08MzFD3Ah/CdAbPQziCrLUOmhjn8Mmdl5rpd4S8NuKuZL1Gc4Xhmnjj3Ng9
	dOw+k0UbwhrqVzbYzE6LChO+1PLyczfo2gHSb+JQjGdUukF5P+CtAU6tcYW9QdsQQOlDMd6be5ufa
	Vacr19RBlsyP+Zft8Hxb9nDlov+Qr4YJE8HTYaYiTeGbKSg8k9O/jajsuK6EFpkZczywxEAUkvVZY
	0+IN52jWfHyrvqu31yV+fuoPE/HOefiAL54v/J4PEiETfrc7jwZyRrOw4R8Xnd05WWiLmGikUbdMX
	QBbzCP79fogByWh0uqhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q24oE-00FiaU-0x;
	Thu, 25 May 2023 06:50:50 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q24oA-00FiZi-2o;
	Thu, 25 May 2023 06:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684997412; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q6tJGyb1DqPzT7MCeAIMcBQWCjs4JwfGu7nbsd7137sieZy6Sp3fGl8ZRV6oMVOpban4TFv4Q+ZdNY59bzgsWjNQwQQm/uua1bSKu28CEqCwQ/YmfcI6zyY3i3KAP2dqj7gvtPMNbhNoLFAXYGImrEIafrCSh283DyRMYHSm4W0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684997412; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=QmWADVtt1bAIDiV+lGyZGiUZ+bZgxA+uS3KFDsIT1TI=; 
	b=Dlqo2DyiJIMcTX9m9haJCPBk99OoXEetg/OGfW8D6B6toxUpp3NPJde9NzwB/xX89yMBetlFYckMTO0CE4OMCOfGarlu8KRaaeqCCdnIt4j0+0vBkKudgK6QQGPpWJ0nWwWGnt2BaNhOMjf2YEFKCgknXY4tI888OH9ChDTgqWA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684997412;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QmWADVtt1bAIDiV+lGyZGiUZ+bZgxA+uS3KFDsIT1TI=;
	b=HBL2Hxc6VzTLaYZitkUWm1IU23e+z20GO7Q2tKeV+gTuVo2gcIzH1VmlOYhWPDxK
	7mO4sCjV6mavxS+wCFAn609L/ufFozIefkjLuDsUVMZEWJFgcL4mqjzb2yyV74WqOOL
	BmBvNgEl6k2svXU4FNUFOZQwquL/lGQbUSd0N1qA=
Received: from [10.10.10.217] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 168499741040714.054183633237926; Wed, 24 May 2023 23:50:10 -0700 (PDT)
Message-ID: <576f92b0-1900-f6ff-e92d-4b82e3436ea1@arinc9.com>
Date: Thu, 25 May 2023 09:49:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 08/30] net: dsa: mt7530: change p{5,6}_interface
 to p{5,6}_configured
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230522121532.86610-9-arinc.unal@arinc9.com>
 <20230524175107.hwzygo7p4l4rvawj@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230524175107.hwzygo7p4l4rvawj@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_235046_969223_96DDB702 
X-CRM114-Status: GOOD (  11.44  )
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

On 24.05.2023 20:51, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:10PM +0300, arinc9.unal@gmail.com wrote:
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 710c6622d648..d837aa20968c 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2728,25 +2722,20 @@ mt753x_phylink_mac_config(struct dsa_switch *ds, int port, unsigned int mode,
>>   			goto unsupported;
>>   		break;
>>   	case 5: /* Port 5, can be used as a CPU port. */
>> -		if (priv->p5_interface == state->interface)
>> +		if (priv->p5_configured)
>>   			break;
>>   
>>   		if (mt753x_mac_config(ds, port, mode, state) < 0)
>>   			goto unsupported;
>> -
>> -		if (priv->p5_intf_sel != P5_DISABLED)
>> -			priv->p5_interface = state->interface;
> 
> If you don't replace this bit with anything, who will set priv->p5_configured
> for mt7530?

I intend priv->p5_configured and priv->p6_configured to be only used for 
MT7531 as I have stated on the mt7530_priv description.

Arınç

