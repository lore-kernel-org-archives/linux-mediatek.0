Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A8AC4345F
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Apr 2024 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHffaf6MDxa8ECiqE5Vi9zLtI98CHdrDDXTGIYN72xw=; b=E1cZg2d3z01guLpNbCvBR0qMO4
	mNeY2ZysHJ6XxBrw299rvt4iAYY7r+/VqSYzsAGoS3ahPn6lYhp0BLO3m/M56RzNf2tMou8BfUwgC
	MHY7gHyoWosjqeO2rKbzGgxlNTnCGMiWWx9Hhyp+w4JlnGlX1CoG5ab1P9VMHSvQpBdi2k58ucwXv
	uV5GXv8XpDBHhk4ownvwxdtGog0d1DgU4EBsO5BiVWGFzI9DF7eA3z7nbHq+dLuSla+dCWDJdiGQ7
	C/wrWaNHnL6IvBfXmIQg1s+JilhOVIZDxzPVRftPdqWJKjzuaCZDLri7pyjro7XYnh5VUeApX7tni
	GG2z6e5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0kDF-0000000FkhE-26BT;
	Sat, 27 Apr 2024 15:43:41 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0kDB-0000000Fkfz-0lYl;
	Sat, 27 Apr 2024 15:43:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D524C1BF203;
	Sat, 27 Apr 2024 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1714232611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHffaf6MDxa8ECiqE5Vi9zLtI98CHdrDDXTGIYN72xw=;
	b=Eq6oBAykWZPY6GDMA4LSkKisBPZVfPxAjf89dyIQEVNNaoC3265TX/4x0kp76tqoJDpAQi
	UhLULDiNaPF5Inm3ZThvJF7k+dLf1lT9c/myv9sLB0M6bqLSNmD1LQRXDMFJpMwwcIKgmb
	76rRoWWDV4ZdQ55EfrdG5VBsatVhmXRaZ5+VazQMJ6VEe8dBFn6Uy5dsFpPV92cZih82so
	c10GSPuSPiQf/wuyuCv9ptx4oymOHXIovRGmGCYhhIsCi1nJT/bZbS0/+pgRutMAyht7nx
	6FGycRbeSgifOvXaSUKW+vxamba5EBqILD5VvFO7gWyhnuVeBHYE9239zsWByw==
Message-ID: <5acf02b1-8af4-4259-9ce1-c7c7ae00ae9d@arinc9.com>
Date: Sat, 27 Apr 2024 18:43:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: do not set MT7530_P5_DIS when
 PHY muxing is being used
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240427-for-netnext-mt7530-do-not-disable-port5-when-phy-muxing-v1-1-793cdf9d7707@arinc9.com>
 <7c476e63-5747-4128-af97-13edc252a263@lunn.ch>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <7c476e63-5747-4128-af97-13edc252a263@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_084337_884505_8EB5430D 
X-CRM114-Status: GOOD (  18.54  )
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

On 27.04.2024 16:31, Andrew Lunn wrote:
> On Sat, Apr 27, 2024 at 02:24:42PM +0300, Arınç ÜNAL via B4 Relay wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> When the PHY muxing feature is in use, port 5 won't be defined in the
>> device tree. Because of this, the type member of the dsa_port structure for
>> this port will be assigned DSA_PORT_TYPE_UNUSED. The dsa_port_setup()
>> function calls ds->ops->port_disable() when the port type is
>> DSA_PORT_TYPE_UNUSED.
>>
>> The MT7530_P5_DIS bit is unset when PHY muxing is being used.
>> mt7530_port_disable() which is assigned to ds->ops->port_disable() is
>> called afterwards. Currently, mt7530_port_disable() sets MT7530_P5_DIS
>> which breaks network connectivity when PHY muxing is being used.
>>
>> Therefore, do not set MT7530_P5_DIS when PHY muxing is being used.
>>
>> Fixes: 377174c5760c ("net: dsa: mt7530: move MT753X_MTRAP operations for MT7530")
>> Reported-by: Daniel Golle <daniel@makrotopia.org>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>> Hello.
>>
>> I've sent this to net-next as the patch it fixes is on the current
>> development cycle.
>> ---
>>   drivers/net/dsa/mt7530.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 2b9f904a98f0..07b6da3ae97c 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -1220,7 +1220,7 @@ mt7530_port_disable(struct dsa_switch *ds, int port)
>>   	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
>>   		return;
>>   
>> -	if (port == 5)
>> +	if (port == 5 && priv->p5_mode == GMAC5)
>>   		mt7530_set(priv, MT753X_MTRAP, MT7530_P5_DIS);
> 
> 
> It might be worth a comment. It is not obvious that
> priv->p5_mode == GMAC5 means the PHY MUX is being used.
> mt7530_setup_port5() thinks it is sufficiently obscure that
> it comments each case.

priv->p5_mode == GMAC5 means PHY muxing is not being used. That is why
MT7530_P5_DIS is set when priv->p5_mode is GMAC5. Anyway, I believe this
proves your point.

Arınç

