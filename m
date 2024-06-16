Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F99CC27C6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 07:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VHz5wWhoZB1ZJeF9u59vMYelSxXRAN9/WTQXNh1hnWA=; b=x11AwjuINODYGrBy5kCW5c6wq8
	nbJAc4VmqloS/crEasj+gJlsM6UClRA5gnvU/6/dwWBPUaUmsd3iJllOzAkFRpfCGuKiinDQi4DoM
	RrjnqjyZC84p8yBOS/arR0DUkJTT7Hk0KBB4H2fMzi8ytN7vozvS2BZOHUx2DNVJHEw1NwKMbzeSC
	bDMBD62QM2XM9HpW2CBZOZxmWPVNxC3sWvlTyOLstfRXGXL6zy1Vq/aw8ZVkW3c7ZZJQRbL8TCgM7
	rDjHQSvcVoSp5YewUmzxRtn9tpSCm6hQ38PRpGzWBzwFxEZQDFJZcmQIqVbgg59QK3eW4oAiQRYh5
	cmErPSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIjuB-00000006yj2-0I3w;
	Sun, 16 Jun 2024 07:02:23 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIju6-00000006yh6-1ii2;
	Sun, 16 Jun 2024 07:02:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D6199FF807;
	Sun, 16 Jun 2024 07:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1718521334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VHz5wWhoZB1ZJeF9u59vMYelSxXRAN9/WTQXNh1hnWA=;
	b=Fxl4nyA4ZCgqZk95/mvKKdJtM4ECl69KDa8YCAkBIloYtViECzDT0Qq2V1X7wGxEnyR/DE
	ex4DX6U1UQVvrYTIPE9R0bCymIZx4EmTJFITn25L+e4Xqpdu+vsDcWzsrBGjaMi7tnNWmO
	Ybjp2JtqunDz3byfF63exkXFkVjQj9muqhN1qkux+X8PMZED2rVctNRnUIf6CRvjNd0v2M
	gEfMQhmoqXaoc4wT/sI1zphW+eqmzcopTWYuveFlg4ey00cWIXJ4uvO3/CP/OGUrScfnpK
	W/wZFygCw77USSld8qXWNC7gWnkkkbHYeUU98CATAEMp76kVNl0JP2bewk+UEA==
Message-ID: <6f70da58-b68b-4a93-b369-2cc86e9158d4@arinc9.com>
Date: Sun, 16 Jun 2024 10:02:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: dsa: mt7530: add support for bridge
 port isolation
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Matthias Schiffer <mschiffer@universe-factory.net>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <378bc964b49f9e9954336e99009932ac22bfe172.1718400508.git.mschiffer@universe-factory.net>
 <15263cb9bbc63d5cc66428e7438e0b5324306aa4.1718400508.git.mschiffer@universe-factory.net>
 <4eaf2bcb-4fad-4211-a48e-079a5c2a6767@arinc9.com>
Content-Language: en-US
In-Reply-To: <4eaf2bcb-4fad-4211-a48e-079a5c2a6767@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_000218_757924_D84E51AE 
X-CRM114-Status: GOOD (  17.89  )
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

On 16/06/2024 09:52, Arınç ÜNAL wrote:
> On 15/06/2024 01:21, Matthias Schiffer wrote:
>> Remove a pair of ports from the port matrix when both ports have the
>> isolated flag set.
>>
>> Signed-off-by: Matthias Schiffer <mschiffer@universe-factory.net>
>> ---
>>   drivers/net/dsa/mt7530.c | 21 ++++++++++++++++++---
>>   drivers/net/dsa/mt7530.h |  1 +
>>   2 files changed, 19 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index ecacaefdd694..44939379aba8 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -1303,7 +1303,8 @@ mt7530_stp_state_set(struct dsa_switch *ds, int port, u8 state)
>>   }
>>   static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
>> -                      const struct net_device *bridge_dev, bool join)
>> +                      const struct net_device *bridge_dev,
>> +                      bool join)
> 
> Run git clang-format on this patch as well please.
> 
>>       __must_hold(&priv->reg_mutex)
>>   {
>>       struct dsa_port *dp = dsa_to_port(priv->ds, port), *other_dp;
>> @@ -1311,6 +1312,7 @@ static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
>>       struct dsa_port *cpu_dp = dp->cpu_dp;
>>       u32 port_bitmap = BIT(cpu_dp->index);
>>       int other_port;
>> +    bool isolated;
>>       dsa_switch_for_each_user_port(other_dp, priv->ds) {
>>           other_port = other_dp->index;
>> @@ -1327,7 +1329,9 @@ static void mt7530_update_port_member(struct mt7530_priv *priv, int port,
>>           if (!dsa_port_offloads_bridge_dev(other_dp, bridge_dev))
>>               continue;
>> -        if (join) {
>> +        isolated = p->isolated && other_p->isolated;
>> +
>> +        if (join && !isolated) {
>>               other_p->pm |= PCR_MATRIX(BIT(port));
>>               port_bitmap |= BIT(other_port);
>>           } else {
> 
> Why must other_p->isolated be true as well? If I understand correctly, when
> a user port is isolated, non isolated ports can't communicate with it
> whilst the CPU port can. If I were to isolate a port which is the only
> isolated one at the moment, the isolated flag would not be true. Therefore,
> the isolated port would not be removed from the port matrix of other user
> ports. Why not only check for p->isolated?

The concept of port isolation is that the isolated port can only
communicate with non-isolated ports so the current implementation looks ok.

Which switch models did you test this on; MT7530, MT7531, MT7988 SoC
switch? I will test it on MT7530 and MT7531 tomorrow evening.

Arınç

