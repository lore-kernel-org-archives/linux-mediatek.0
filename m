Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE3E7C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 06:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MwhSXtCM+amK18ZJFZTkmGQCxpMOw/Tgzf9+hmAj/30=; b=H/tGqW6QMoOcHH
	otJ/I+7u3qN/DwsZRLu5nZrilAd8BfTl7ATGmM3z1PjZdF+bSLGh9OE4KjSqqBGnKDdGmU158MBMu
	38rt5IJelkS9cWBA6nknRrI7crT8dzikxPQ6sADnZEhw6P5J+I/WXXVqpendjHAS83VKUSRk0xRC4
	0ZTki8ig97gKmjZbx6YXXhYYMpIM7Q9xBZSiec3q9Bc9bOqN3wPE+OIvhBqnCJoj3lQTnTL7RtYKf
	bD0oDRI39O61JNltqF+TK/jXhg0MWReLTqHiI6x4HJWkgQLTv4kBj9qU9V6AixAlOElWyaRICA6/E
	4VZZNjq6HJ/tC4V3aSmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q24pG-00FinO-30;
	Thu, 25 May 2023 06:51:54 +0000
Received: from sender3-op-o18.zoho.com ([136.143.184.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q24pE-00Fimu-1D;
	Thu, 25 May 2023 06:51:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1684997485; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=afXrsYFLi41jwH+s0sSNtF7dOOG2lVdLUQ3kHMkoesgovweqDtIoPk/C0X29+I4yJTos543ocNwD32phJqChF1rv7yyDdWV2jCe6bIGMj+X8I1V5htoWpeGvBcDPlvpMQ+QR/FLr/kV4wF9iczHez+2neAokZlDMhfSKH1dUZms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1684997485; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=MwhSXtCM+amK18ZJFZTkmGQCxpMOw/Tgzf9+hmAj/30=; 
	b=QxA7JTqOzrVF4E/qxiRKNJ+oobC01mwj8p9jLJcdVC5fX8AOfbZ7EJpok3+NTUCfR4Hd00RGeaMANRDdp82EmdaOZV14Y2w7krjkl45MMoAOA7SIOQPGlkGNnc8QMeiTzeyXYF3+xSXJOZiA1u5h4NlskuadK2Qh15Lv2FxG3Go=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1684997485;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MwhSXtCM+amK18ZJFZTkmGQCxpMOw/Tgzf9+hmAj/30=;
	b=SGz24cTwAJTIyieCXy3a7XPVAxp7Cywv4ErQW6cqg2mcv3UulKBRJTBU5ke9V//I
	wVJxXTSiUODqhBGMT8IdnzyZJAbHFW7LcyvqqQoU/vSjIIMB57GUeZDTOb17jN4wAdg
	zLamxWzs07PapbPkEIw6eURALUYXCyJOelzNR3h8=
Received: from [10.10.10.217] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1684997484418555.9448204414057; Wed, 24 May 2023 23:51:24 -0700 (PDT)
Message-ID: <0777fa04-7dd7-7f67-2a8b-f855f5aeba82@arinc9.com>
Date: Thu, 25 May 2023 09:51:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH net-next 09/30] net: dsa: mt7530: empty default case on
 mt7530_setup_port5()
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-10-arinc.unal@arinc9.com>
 <20230524180529.y7vl5mb4rn4vwdhh@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230524180529.y7vl5mb4rn4vwdhh@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_235152_463166_32D1C312 
X-CRM114-Status: GOOD (  11.72  )
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

On 24.05.2023 21:05, Vladimir Oltean wrote:
> On Mon, May 22, 2023 at 03:15:11PM +0300, arinc9.unal@gmail.com wrote:
>>   	default:
>> -		dev_err(ds->dev, "Unsupported p5_intf_sel %d\n",
>> -			priv->p5_intf_sel);
>> -		goto unlock_exit;
> 
> You could have probably left a comment though (that doesn't cost in
> terms of compiled code):
> 
> 		/* We never call mt7530_setup_port5() with P5_DISABLED */

I remove P5_DISABLED with later patches so I don't see a reason to add 
this then remove it on the same patch series.

Arınç

