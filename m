Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84538C47DB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 16:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfalacopj05NBro973M+ZIGKXKczGFxAKP3QzKWb2R4=; b=gAqhjAZCND4qEDXc3FNBXSbdPR
	4OrFXHlE7uvpHUekEzNhvD8x5nSNyGGE44EfhFN8fsK0oSmIvDQltldhoRYMGbJzFqyzODpJibl06
	9M6+fL5LuIyygdPfMVYFdwiEFx/X6u7Eb0U9iPRYZTX5Tm9fzaS/M1JfIpkpftNTuY4GewU8PFTPR
	AlWm8uZVjeKMxHyrAVUFBAIVEwhZ8fvIRMP4pHUKseyJHlBkgSy5pK0hilZ4yxpsourohP7l4gwFj
	+gR30fxAY1558UZwP/6cf2MhQDBKFALBWxLiAGsw+CB7eXTrDJmcmUTECqp5cBqJaEO/AuiRHTdWd
	svItJI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUPE-0000000DTNJ-0q80;
	Mon, 29 Jan 2024 16:22:44 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUUPB-0000000DTLg-05T6;
	Mon, 29 Jan 2024 16:22:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 069DCE000D;
	Mon, 29 Jan 2024 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1706545355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfalacopj05NBro973M+ZIGKXKczGFxAKP3QzKWb2R4=;
	b=h3InIN03yzv4r1p1AceaEKvatMaRv+Vz4cv+wuVpgHnZ99PedXpFWaffXGs9sQVzxtpO9l
	9gYZhkgjR7Vl3rpSK4+PSCeiwXtlSPaZFnuH8pjLDVqEkudBjE7Y32v64syOpZC8EnZVO5
	Z7WSrGvgYGaH0SAE+pNSt1yVxJnOPQTGnymjVcGmcdTLQuMJRjsUcXHWvRhFXlj57sMaZ/
	e/ZSUD6cYhjGOsYmBaAJ542QIU0lV57bMwCglw0MBXbH1D7pXz70MeSmB+Qjpk4YWSs+pw
	AyjokGotuJYUWPCgNGwfjtP7y1w+jKN+y2mtjRX3EnNjv67xx1WyMj/arujzfg==
Message-ID: <431750cc-fb6b-4f7a-9123-b6986d359742@arinc9.com>
Date: Mon, 29 Jan 2024 19:22:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 6/7] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240122-for-netnext-mt7530-improvements-1-v3-0-042401f2b279@arinc9.com>
 <20240122-for-netnext-mt7530-improvements-1-v3-6-042401f2b279@arinc9.com>
 <20240129125241.gu4srgufad6hpwor@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240129125241.gu4srgufad6hpwor@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_082241_212200_4C20FCDE 
X-CRM114-Status: GOOD (  11.49  )
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

On 29.01.2024 15:52, Vladimir Oltean wrote:
> On Mon, Jan 22, 2024 at 08:35:57AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Running mt7530_setup_port5() from mt7530_setup() used to handle all cases
>> of configuring port 5, including phylink.
>>
>> Setting priv->p5_interface under mt7530_setup_port5() makes sure that
>> mt7530_setup_port5() from mt753x_phylink_mac_config() won't run.
>>
>> The commit ("net: dsa: mt7530: improve code path for setting up port 5")
>> makes so that mt7530_setup_port5() from mt7530_setup() runs only on
>> non-phylink cases.
>>
>> Get rid of unnecessarily setting priv->p5_interface under
>> mt7530_setup_port5() as port 5 phylink configuration will be done by
>> running mt7530_setup_port5() from mt753x_phylink_mac_config() now.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> 
> I hope this moves the patch set out of the 'deferred' state.
> 
> ---
> pw-bot: under-review

I still see deferred. I guess I'll have to submit this again. :/

Arınç

