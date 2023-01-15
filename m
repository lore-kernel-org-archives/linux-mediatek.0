Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B84C3DA78
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Jan 2023 08:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoFPi2zHYHBii6ImK1R3fS/gXJBvgvD9QMiEM0r7T34=; b=nMkVk96B2u+UQ9mWQ+O4GbKu5J
	OQZek0SS2iUPXUZ51OMZ8nL3Q5d9bnzOxrfcW7MqRimiC8cpdhSQSYm6xe2/aUIYqeCoxMf9JFxzc
	Wqod+v5SQ0xjrqg6WJUdm/pPjjOHu4vKujIDu8cPrqCYXwURDMoXLf5kLCXMXLnHxvBD2ph98mr9X
	IcRauKMl7v3D6eSZo+Zyn8+z+InqxHwjXC7YKik0CwjsJ5GxatGuvHwhp3VtQmqEOc90Dgkc3TOm7
	Z+l2fi0muzUKGYJM8y9wUsPWrOlWbCyY1e/LWfhhG12/urJL+3ScmNLjgxNh3IPezb5SV4xPpcPrC
	ZAOr1xzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGyHz-00751V-8L; Sun, 15 Jan 2023 08:22:51 +0000
Received: from sender3-op-o19.zoho.com ([136.143.184.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGyHn-0074z2-Kn; Sun, 15 Jan 2023 08:22:42 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1673770941; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jOXDkLHM8sjbw13TWgRUrqi7LljgETBWDx22LzTuxNg7ix6OEw2u7oaN9eyH0zcwiaMJVhXqVHqrL3d3mMumSxEDLrnV1XMc9PoTL/j6gjE/lq4tR5hvooKwZCZLv60wId844x4jMYrJFPHAD51zpi8VzZPB8rlAlEmt742Jv5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1673770941; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=HoFPi2zHYHBii6ImK1R3fS/gXJBvgvD9QMiEM0r7T34=; 
	b=NVhivhUb/Djyzm4tQRYEFp2Um6el0JaMEp1pK9v+ZWc/EUdLYU+EwVoprVpy8z8Vs/By3rH4MRsllySNu51b938WtCCfynOtF5Rjm36h0sj5c5FgqK5x9uE9zQ2iYlWlLNGgjY+7leC8vjlaVYxNJIaCxA1AOJ+9NwdBhJTHRJ4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673770941;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HoFPi2zHYHBii6ImK1R3fS/gXJBvgvD9QMiEM0r7T34=;
	b=VKhk95aijO3NmUxhbNVNGKA9mQv5GQMDE94ZsxYScMs0fq4Ggjd5z88MWfPnfLgP
	B8EQtQq/ovey+DId1A0OB0XQoFPh/jEqd9V3LgvDY49WaXyVp7HwHBfNxAWYflIRBBw
	QQQ8N9jxLs31EDNjru2y83hVZ4FX4H4n0LxDvjME=
Received: from [10.10.10.218] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1673770940011540.826507404914; Sun, 15 Jan 2023 00:22:20 -0800 (PST)
Message-ID: <435531df-3087-cda5-a6ae-a0143f5169ba@arinc9.com>
Date: Sun, 15 Jan 2023 11:22:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mips: ralink: mt7621: fix phy-mode of external phy on
 GB-PC2
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mips@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Petr Louda <petr.louda@outlook.cz>
References: <20221128213238.3959-1-arinc.unal@arinc9.com>
 <20221201105049.GA6569@alpha.franken.de>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20221201105049.GA6569@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_002239_754691_01102A43 
X-CRM114-Status: GOOD (  11.36  )
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

On 1.12.2022 13:50, Thomas Bogendoerfer wrote:
> On Tue, Nov 29, 2022 at 12:32:38AM +0300, Arınç ÜNAL wrote:
>> The phy-mode property must be defined on the MAC instead of the PHY. Define
>> phy-mode under gmac1 which the external phy is connected to.
>>
>> Tested-by: Petr Louda <petr.louda@outlook.cz>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> applied to mips-next.

I just realised I forgot to add "dts:" to the patch subject. Would that 
be a problem?

Arınç

