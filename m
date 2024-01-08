Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A78C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 10:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XuJv/OyK8RE0Y94blspywgd4cYFg7aH1NjsPMWEemMY=; b=aAmz627VWNchf10HIh/sfxOjWk
	T7uTz+8iuSQYJeZhkHB1ws9YEX6ZtM6Oz6B3H/ndVt+i6mb5MyoweCucHlf25G9+aJBKKqSYmzmoN
	vGbWKbuUkwVXSOvWh8qTVa6H/zz2n4+Fl7+sV5/wqrcHxuFEKS0NWKV3w3T7cT5ySXgJQwK0nxgkY
	+MVB1qfyzAqU5BbBjkzFzHSO5GK7xfR07nNoP0X0TwTH99qOiRgjCNzM+G3RzcbsQk++KFYaKN6Yo
	YiaE0uhESnf8KVDry7iODQ3A73ini4Wwy0DXyMUkHXdVT/obCfO/b7Wxj6uZFO8je7wM7KWkWwjaA
	vTGIkCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmmE-004b7N-2x;
	Mon, 08 Jan 2024 10:22:38 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMmmA-004b69-1c;
	Mon, 08 Jan 2024 10:22:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E041240004;
	Mon,  8 Jan 2024 10:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704709348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XuJv/OyK8RE0Y94blspywgd4cYFg7aH1NjsPMWEemMY=;
	b=o8+G7C7L1f0U+TNR9hjwq2dvwbkDeoKwHmYJ/lL98i2S7oyotEB4PbNN8gyDcg5GRlloJ4
	OciNnaR2VvZAC4nmjTZ+np5PbKkNYYG7o1Cxr7H5Ye6fAga97KSuwf7NsI7zp7idUgQpfg
	SJ5mMW2o4WK9TYiKJbFjDrnvtHRuIBMM1O5SEMQzc5CfYklj5y1x6IP7YkqlmqWwl+YquJ
	yqFc4NSjOXsnEZ7IPLJZI/AEBAntp7P30m6zqhukwqjO/1FoLS/c3pMqFGmgUl1G6OssGb
	psc0qp57ss1dPfKAo2AdfXGmLbT3NcjCQLmbmv/g/I0FcIuhY6aWaSsm1ApBBw==
Message-ID: <65274929-fa59-482c-a744-6b9ce162ab46@arinc9.com>
Date: Mon, 8 Jan 2024 13:22:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: support OF-based registration
 of switch MDIO bus
Content-Language: en-US
To: Simon Horman <horms@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240106122142.235389-1-arinc.unal@arinc9.com>
 <20240107195241.GB132648@kernel.org>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240107195241.GB132648@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_022234_845739_C256D576 
X-CRM114-Status: GOOD (  21.40  )
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

On 7.01.2024 22:52, Simon Horman wrote:
> On Sat, Jan 06, 2024 at 03:21:42PM +0300, Arınç ÜNAL wrote:
>> From: David Bauer <mail@david-bauer.net>
>>
>> Currently the MDIO bus of the switches the MT7530 DSA subdriver controls
>> can only be registered as non-OF-based. Bring support for registering the
>> bus OF-based.
>>
>> The subdrivers that control switches [with MDIO bus] probed on OF must
>> follow this logic to support all cases properly:
>>
>> No switch MDIO bus defined: Populate ds->user_mii_bus, register the MDIO
>> bus, set the interrupts for PHYs if "interrupt-controller" is defined at
>> the switch node. This case should only be covered for the switches which
>> their dt-bindings documentation didn't document the MDIO bus from the
>> start. This is to keep supporting the device trees that do not describe the
>> MDIO bus on the device tree but the MDIO bus is being used nonetheless.
>>
>> Switch MDIO bus defined: Don't populate ds->user_mii_bus, register the MDIO
>> bus, set the interrupts for PHYs if ["interrupt-controller" is defined at
>> the switch node and "interrupts" is defined at the PHY nodes under the
>> switch MDIO bus node].
>>
>> Switch MDIO bus defined but explicitly disabled: If the device tree says
>> status = "disabled" for the MDIO bus, we shouldn't need an MDIO bus at all.
>> Instead, just exit as early as possible and do not call any MDIO API.
>>
>> The use of ds->user_mii_bus is inappropriate when the MDIO bus of the
>> switch is described on the device tree [1], which is why we don't populate
>> ds->user_mii_bus in that case.
>>
>> Link: https://lore.kernel.org/netdev/20231213120656.x46fyad6ls7sqyzv@skbuf/ [1]
>> Suggested-by: David Bauer <mail@david-bauer.net>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/net/dsa/mt7530.c | 18 ++++++++++++++----
>>   1 file changed, 14 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 391c4dbdff42..39d7e7ad7154 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2153,17 +2153,25 @@ mt7530_free_irq(struct mt7530_priv *priv)
>>   static int
>>   mt7530_setup_mdio(struct mt7530_priv *priv)
>>   {
>> +	struct device_node *mnp, *np = priv->dev->of_node;
>>   	struct dsa_switch *ds = priv->ds;
>>   	struct device *dev = priv->dev;
>>   	struct mii_bus *bus;
>>   	static int idx;
>> -	int ret;
>> +	int ret = 0;
>> +
>> +	mnp = of_get_child_by_name(np, "mdio");
>> +
>> +	if (mnp && !of_device_is_available(mnp))
>> +		goto out;
> 
> nit: I think it would easier on the eyes to simply
> 
> 		return 0;

Will do.

Thanks.
Arınç

