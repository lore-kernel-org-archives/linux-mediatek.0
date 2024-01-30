Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248C8C47DDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 14:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EiU+vp3jmxj1RQvTE/aNTb9Remw5rmZoUoKv2t5MunA=; b=KCowEPKre6mtgUZCtsNwT15utD
	74BfXYk918yCU3ubvnHlEZafoPSOn57sMP+GtJeD/ZRRbNzZvkD4I8FCT6rU8+inf4ls6U56zaj9f
	HNZUbn8+OLy6rzgehDY58hv8afpyDgDx67mLd6VguLdL8+NfMCeSALkaIeX6+mWkothTT2r6RC4BF
	zGa06d7vJkWrX9oSOhZyBzjz4s2jDeOt8wNJF5cBLMhLs2+WCQAdHM3TLyyfNZOTYZ5/qByK1N3lt
	UdjxyQ8GITNu3sXTC27azrsrqhyypx9TM/xoxPZX6/hpDu7PGWUYuZ1mzyOCV8jniC0K3b06Ka98C
	C2eLqfhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUp4b-0000000Gy8B-2z01;
	Tue, 30 Jan 2024 14:26:49 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUp4Q-0000000Gy29-2OJh;
	Tue, 30 Jan 2024 14:26:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E3C81C000E;
	Tue, 30 Jan 2024 14:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706624795;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EiU+vp3jmxj1RQvTE/aNTb9Remw5rmZoUoKv2t5MunA=;
	b=lIpVxYMXZCa4HN5li0menqRxSUg6vkEUPhvFUqJ5VTxetW7YHyR0ScfsR5g7qFNFfQFhsU
	/GRQVAzrasNhW3ICz/tX6L/w3LV2YslSM2K9TCMk14M7u60E0lSISz63YaS/yKVmfzFyXN
	La1rgFSd4Wg22M/jvjqLFGvyAXXclRwiNc0cpQJkY+iVUO5v0BZH4e/PTBE2xYRyGRFOn0
	6ZLys8l9Cl/y/3+x2mcuOVqm4b7ctVFruZkFU9CWmQc0zjDRQG4cvgbQXf64kxuzbuiggH
	3LB5RhFoLEwzk2Ah0CiuvGh5lHSNE9Inw99BkBBpBWsZ37RHmjJf1Tjg8frtEA==
Message-ID: <8b7e1d9d-70ec-4664-be04-48a2e2877891@arinc9.com>
Date: Tue, 30 Jan 2024 17:26:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
 <20240129125241.gu4srgufad6hpwor@skbuf>
 <431750cc-fb6b-4f7a-9123-b6986d359742@arinc9.com>
 <20240129083152.34d899cd@kernel.org> <20240129165201.s4oiuk3sxtk6zcsw@skbuf>
 <20240129090034.01c11667@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240129090034.01c11667@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_062638_912545_5A9A815A 
X-CRM114-Status: GOOD (  14.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 29.01.2024 20:00, Jakub Kicinski wrote:
> On Mon, 29 Jan 2024 18:52:01 +0200 Vladimir Oltean wrote:
>>>> I still see deferred. I guess I'll have to submit this again. :/
>>>
>>> Took me an hour to fix the mailbot:
>>> https://github.com/kuba-moo/nipa/commit/6766e97e72ac91ffb42ed2259bc8e2ace446d0ef
>>> email is the most quirky thing ever.
>>
>> Ah, so it was my neomutt encoding email as base64...
> 
> Something magical going on there, the email is encoded.. twice?
> See the attachment. That's already thru a round of base64 decode
> and there's another copy of the email with base64 inside it :o
> Anyway, unwrapping it once is good enough for the bot to see the
> command, and enough time spent on this ;)

I don't claim to be an email expert. I've received Vladimir's email with
the "Content-Transfer-Encoding: 8bit" header. The body was plaintext, not
base64 encoded. I have checked how the netdev mailing list distributed
Vladimir's email, its body is plaintext as well, not base64 encoded. Only
the linux-arm-kernel mailing list distributed the body base64 encoded, the
header is "Content-Transfer-Encoding: base64".

And the attachment you've provided seems to be from the raw output of
lore.kernel.org/all which seems to put together the email distribution from
all mailing lists.

raw from all:

https://lore.kernel.org/all/20240129125241.gu4srgufad6hpwor@skbuf/raw

raw from netdev:

https://lore.kernel.org/netdev/20240129125241.gu4srgufad6hpwor@skbuf/raw

raw from linux-arm-kernel:

https://lore.kernel.org/linux-arm-kernel/20240129125241.gu4srgufad6hpwor@skbuf/raw

I don't know which mailing list mailbot looks at in case of an email is
sent with multiple mailing lists being CC'd or TO'd. It seems to be that it
looked at linux-arm-kernel in this instance.

Arınç

