Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F69C47258
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 09:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y1NoW9zhjmqcQuUi6KkawAZpHX7sdUmwFKBiyO/7PKA=; b=haVjmb9tzxvWLV
	0akDtmIGRkuW6okX/o3lqHj+KjkBqx2MWJatPVyy6bl2jRYh7qFCSD+hEQ55SADbbOguqb9W6fVbc
	WTY5UKN+UJaQkZQY4etvZ41hJfVbPeOdWGexB1FJ6cfrCZCZ1Ti91thIuOJNCETgl6pnsQAHFXOvY
	oU6LwIkP1u+sK8YmqeTMuDE9JSBuGHop6EhuMosZ3gtGxjFr8pixexFR5O2Grbs+PKkKkTNSIhzQW
	ZRQ3wa6Wk0L49/lP0AECxDCiqljrDW43JEaFvWrIPvuVOkvw6VtzkKwtmvvPZy70ABvaG7OCWLz1J
	2T9frUSSpxUSLSeVbGJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpaV-0000000AtRl-0yIU;
	Fri, 02 Feb 2024 09:11:55 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVpaR-0000000AtQS-2EN4;
	Fri, 02 Feb 2024 09:11:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6671420011;
	Fri,  2 Feb 2024 09:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706865105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y1NoW9zhjmqcQuUi6KkawAZpHX7sdUmwFKBiyO/7PKA=;
	b=TxRDHImxBW1jNI5WVNtiHiElYu6N+plp8XivTZ6hMBaX315Na0NYYCaDzb66WoE7Cllpb4
	ru8QC2pbYn+6vFyUANVu4eby5xhX3DrlOAzs3PJQy66gwpVnCp8pqMtI5RCYO83Bl9CPHM
	7DlGNwhhEwwi5oBsuaGeqAtiAq0yPmOfeug6FBlujbTRFrzrs6j50z5TNOmVmdUH+BNATZ
	DR6FygpLkPFRWJGxxLg0sTl2eJ4zUBjADblDxwLXOT4FR6bv+eR6P5Xt/ouJbQ5RmbKoez
	/0K0bQ/uTyBgEZN/MO8qc4GnT6J+xg6AYPPOmr3HEMzU+rVvcSskEvG/+h/JXA==
Message-ID: <1f0e67ba-edd7-4998-bc20-1de86bd53a68@arinc9.com>
Date: Fri, 2 Feb 2024 12:11:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net RFC] net: dsa: mt7530: fix link-local frames that
 ingress vlan filtering ports
To: Vladimir Oltean <olteanv@gmail.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
References: <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
 <20240201225943.abphuuavp7bkbrt6@skbuf>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240201225943.abphuuavp7bkbrt6@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_011151_746831_2AFC5481 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, tools@kernel.org, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2.02.2024 01:59, Vladimir Oltean wrote:
> On Thu, Feb 01, 2024 at 10:13:39PM +0300, Arınç ÜNAL via B4 Relay wrote:
>> base-commit: 4e192be1a225b7b1c4e315a44754312347628859
>> change-id: 20240201-b4-for-net-mt7530-fix-link-local-that-ingress-vlan-filtering-ports-6a2099e7ffb3
>>
>> Best regards,
>> -- 
>> Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> You sent this patch 3 times. What happened, b4 didn't work so well?

Odd, I've received only a single email of this patch.

Looking at lore.kernel.org, it looks like the b4 web endpoint properly
submitted the patch to the b4-sent mailing list but for some reason changed
the Message-Id before submitting it to the netdev mailing list.

This is the email with what the Message-Id should be, which only exists on
the b4-sent mailing list:

https://lore.kernel.org/all/20240201-b4-for-net-mt7530-fix-link-local-that-ingress-vlan-filtering-ports-v1-1-881c1c96b27f@arinc9.com/

This is the email with changed Message-Id that was submitted to the netdev
mailing list:

https://lore.kernel.org/all/=%3Futf-8%3Fq%3F=3C20240201-b4-for-net-mt7530-fix-link-local-that-ingr%3F=%20=%3Futf-8%3Fq%3Fess-vlan-filtering-ports-v1-1-881c1c96b27f=40arinc9=2Ecom=3E%3F=/

There're no brackets enclosing the Message-Id. That must be why Gmail
modified it with the SMTPIN_ADDED_BROKEN disclaimer added for you. I can't
come up with a theory as to why you've received it thrice though.

Konstantin, could you take a look at what happened here?

Arınç

