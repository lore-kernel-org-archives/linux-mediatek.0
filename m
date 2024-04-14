Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26BAC4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 05:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DkAVfJhrb20IYkFdMPZ7uw1ETykugiPubMA1XaxEiMQ=; b=0+ahf0O7GjZheZuJUjX1gVBMX5
	gj4MrXF347qvwe86nfwNkkvcA0W5RL31JljljD/uhoTHqNDDvN+uzNI6uOwVfXAg1Ldne0UrZJhyw
	EpsiGVqCoTR0KAx1NLd1i3JeDdGcms2U++aCalVGaJVjC6umW7JH0yc2Df/oIGvWU9mdImIcN0uEe
	ZtXrokf+JEig/8ZbZvs7rJ0PHcdd5lySnd6j2izB3nnVsi3BWmxtU1tIZAwugibY3K3X4Udy9C8jP
	Us/i/qVqfcX12mpZ+EHArZy5SOzG91iXyPgl/VF9KM4NAZF4ulIcNCYRhTNJZGybV8edecLZ5j0Px
	Hrz6QogA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvstt-00000004i02-06yM;
	Sun, 14 Apr 2024 05:59:37 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvsto-00000004hyW-2hWt;
	Sun, 14 Apr 2024 05:59:34 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1F44E0002;
	Sun, 14 Apr 2024 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1713074369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DkAVfJhrb20IYkFdMPZ7uw1ETykugiPubMA1XaxEiMQ=;
	b=Njoqy5NgTDA6NbHuTAtH3AtByQBGjYShG+Bi5WaBWSlEI+xUoDFNc/CXuhNv9anFPfulab
	gb7EBw9Ydxa5LDoEWQdyiw0CRVG9qaMskqreRlmFwmYvEkJPmFK0jx1FWX44ZkfyEtounA
	eKOpYraemv4ZCjooEJdmbTDhGD/Zq4W5PTb4gtARvLpOafS4OHofhKPWwe06Rjcu0B4okw
	THU8GsDRRv9FuFU/tBZFn1+O5mAcwrq45RUgQ18iV43P8bDGcancaU7V9RP/E+AlrFc+Bm
	omzgfykL5m+7IabFWjQshiaJEbwheJpBhQimpPlMZAbfGW/rleFLRSW7+zMZGg==
Message-ID: <f54166f4-bbd6-4711-8194-cc9d9efdee89@arinc9.com>
Date: Sun, 14 Apr 2024 08:59:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: dsa: mt7530-mdio: read PHY address of
 switch from device tree
To: Daniel Golle <daniel@makrotopia.org>
Cc: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-0-b08936df2770@arinc9.com>
 <20240414-b4-for-netnext-mt7530-phy-addr-from-dt-and-simplify-core-ops-v1-1-b08936df2770@arinc9.com>
 <ZhtJGEdjeS3LfMWF@makrotopia.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZhtJGEdjeS3LfMWF@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_225932_978343_AC2274CA 
X-CRM114-Status: GOOD (  16.26  )
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

On 14.04.2024 06:10, Daniel Golle wrote:
> On Sun, Apr 14, 2024 at 01:08:19AM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> Read the PHY address the switch listens on from the reg property of the
>> switch node on the device tree. This change brings support for MT7530
>> switches on boards with such bootstrapping configuration where the switch
>> listens on a different PHY address than the hardcoded PHY address on the
>> driver, 31.
>>
>> As described on the "MT7621 Programming Guide v0.4" document, the MT7530
>> switch and its PHYs can be configured to listen on the range of 7-12,
>> 15-20, 23-28, and 31 and 0-4 PHY addresses.
>>
>> There are operations where the switch PHY registers are used. For the PHY
>> address of the control PHY, transform the MT753X_CTRL_PHY_ADDR constant
>> into a macro and use it. The PHY address for the control PHY is 0 when the
>> switch listens on 31. In any other case, it is one greater than the PHY
>> address the switch listens on.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> See minor nit inline below.
> 
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>
> Tested-by: Daniel Golle <daniel@makrotopia.org>
> (only MT7530 and MT7531 on address 0x1f has been tested, I don't have
> any board configuring the switch to any other base-address)
> 
>> ---
>>   drivers/net/dsa/mt7530-mdio.c | 28 ++++++++++++++--------------
>>   drivers/net/dsa/mt7530.c      | 35 ++++++++++++++++++++++-------------
>>   drivers/net/dsa/mt7530.h      |  4 +++-
>>   3 files changed, 39 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
>> index 585db03c0548..76adc9d21bcf 100644
>> --- a/drivers/net/dsa/mt7530.h
>> +++ b/drivers/net/dsa/mt7530.h
>> @@ -625,7 +625,7 @@ enum mt7531_clk_skew {
>>   #define  MT7531_PHY_PLL_OFF		BIT(5)
>>   #define  MT7531_PHY_PLL_BYPASS_MODE	BIT(4)
>>   
>> -#define MT753X_CTRL_PHY_ADDR		0
>> +#define MT753X_CTRL_PHY_ADDR(phy_addr)	(phy_addr == 0x1f ? 0 : phy_addr + 1)
> 
> #define MT753X_CTRL_PHY_ADDR(phy_addr)	(phy_addr + 1 & 0x1f)
> 
> It's shorter, and works without conditional operator which is expensive.

Great, thanks.

Arınç

