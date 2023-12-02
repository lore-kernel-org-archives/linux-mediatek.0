Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD7CC4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 08:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AepG7Sxs6UrlTw5J0jcbOX6uiYe5pZuBTrOV1pLs6ME=; b=wVmwVbPAgrsRfP
	ftcPSQR/RZkYXy8jnewPFT6hr2ZKFWzrpnWcI82vbdOlFZB2H4tXvFYndOhWRBP0XLqFGJ8py+Edy
	YTxBFHKWwkMoS+UCOHphcpgg+Ncf2LLHD1KhqjYabJ5X6q4HE9E7jqXbRkZ4czvhQVjxgf+Pn/hfa
	gCQYq37h4DmzUVHgLLg7hosfEzAfzvOIZfG7/0gHQ695tEdyBEJi08cjqmz6VI0WTzLOOMcg15Umj
	U/CD/gQXDOz2md65dbBggK/Loc3m3OsXZt7ttfKRaVQ1udOsi1SNvK1OTCLXiADC3gxlBYcFa1vzu
	4A1CG8MRXGbGVPLPxltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9LO4-00FJRi-1c;
	Sat, 02 Dec 2023 08:30:08 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9LNz-00FJQM-2y;
	Sat, 02 Dec 2023 08:30:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66A9820003;
	Sat,  2 Dec 2023 08:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1701505797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AepG7Sxs6UrlTw5J0jcbOX6uiYe5pZuBTrOV1pLs6ME=;
	b=pxoYcgmX8xvCrfbGL5CbcvRtmQg/u+oFGkflBsXi9pLvQTIIG0gWUnkW2jkVsUrZkfJWwN
	4beX9Ut7AitIw+I8urbjgmi5GKJkVnrsV1maxEkEmgJf/wPwIxVEsk/1WnA/3vrvgRRgH4
	mq5oiyFl0Nkj8rzNV3P9tGuUqUi7LsaO9WrBgT7vFr+YpokyaCRPr2Bahk86afTvRhTul4
	CAbwb9Etd/0PwIpIdu60zlzgb01rOS65pSi/Q8ldn0bc44iLgdAuYN31RVJY0EVV8ZWv0v
	BQ4aVE20Ueyo2mwhDdrV2y7dDT90s/DgFONEJ2OEo0/G567/3tPnYYNstmtE6A==
Message-ID: <ffaa26b3-eb25-47cc-8891-fe3cbcc724da@arinc9.com>
Date: Sat, 2 Dec 2023 11:29:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 01/15] net: dsa: mt7530: always trap frames to
 active CPU port on MT7530
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-2-arinc.unal@arinc9.com>
 <ZVjLj6/iCL/muzmH@shell.armlinux.org.uk>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZVjLj6/iCL/muzmH@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_003004_249693_9D952093 
X-CRM114-Status: GOOD (  22.97  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 18.11.2023 17:34, Russell King (Oracle) wrote:
> On Sat, Nov 18, 2023 at 03:31:51PM +0300, Arınç ÜNAL wrote:
>> +	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
>> +	 * forwarded to the numerically smallest CPU port which the DSA conduit
>> +	 * interface its affine to is up.
>> +	 */
>> +	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
>> +		return;
>> +
>> +	if (operational)
>> +		priv->active_cpu_ports |= BIT(cpu_dp->index);
>> +	else
>> +		priv->active_cpu_ports &= ~BIT(cpu_dp->index);
>> +
>> +	if (priv->active_cpu_ports)
>> +		mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, CPU_EN |
>> +			   CPU_PORT(__ffs(priv->active_cpu_ports)));
> 
> I would be tempted to write this as:
> 
> 	mask = BIT(cpu_dp->index);
> 
> 	if (operational)
> 		priv->active_cpu_ports |= mask;
> 	else
> 		priv->active_cpu_ports &= ~mask;
> 
> Now, what happens when active_cpu_ports is zero? Doesn't that mean there
> is no active CPU port? In which case, wouldn't disabling the CPU port
> direction be appropriate, such as:
> 
> 	if (priv->active_cpu_ports)
> 		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));
> 	else
> 		val = 0;
> 
> 	mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, val);	
> 
> ?

In practice, it doesn't seem to matter. The CPU_EN bit enables the CPU port
defined on CPU_PORT_MASK which is used for trapping frames. No active CPU
ports would mean that all the DSA conduits are down. In that case, all the
user ports will be down also. So there won't be any traffic. But disabling
it is of course more appropriate here.

> 
>>   struct mt7530_priv {
>>   	struct device		*dev;
>> @@ -786,6 +787,7 @@ struct mt7530_priv {
>>   	struct irq_domain *irq_domain;
>>   	u32 irq_enable;
>>   	int (*create_sgmii)(struct mt7530_priv *priv, bool dual_sgmii);
>> +	unsigned long active_cpu_ports;
> 
> So this will be 32 or 64 bit in size. Presumably you know how many CPU
> ports there can be, which looking at this code must be less than 8 as
> CPU_PORT_MASK is only 3 bits in size. So, maybe use a u8, and check
> that cpu_dp->index <= 7 ?

Aren't there other mechanisms to check that cpu_dp->index is a valid port?
At least with phylink_get_caps(), only ports lower than 7 will have proper
interface modes allowed.

Here's the code after you and Vladimir's review:

static void
mt753x_conduit_state_change(struct dsa_switch *ds,
			    const struct net_device *conduit,
			    bool operational)
{
	struct dsa_port *cpu_dp = conduit->dsa_ptr;
	struct mt7530_priv *priv = ds->priv;
	u8 mask;
	int val;

	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
	 * forwarded to the numerically smallest CPU port which the DSA conduit
	 * interface its affine to is up.
	 */
	if (priv->id != ID_MT7530 && priv->id != ID_MT7621)
		return;

	mask = BIT(cpu_dp->index);

	if (operational)
		priv->active_cpu_ports |= mask;
	else
		priv->active_cpu_ports &= ~mask;

	if (priv->active_cpu_ports)
		val = CPU_EN | CPU_PORT(__ffs(priv->active_cpu_ports));
	else
		val = 0;

	mt7530_rmw(priv, MT7530_MFC, CPU_EN | CPU_PORT_MASK, val);
}

struct mt7530_priv {
	[...]
	u8 active_cpu_ports;
};

> 
> I would also suggest moving irq_enable after create_sgmii, to avoid
> holes in the struct.

Sorry, I've got no idea about this. Could you explain why would there
possibly be holes in the struct with the current ordering of the members of
the mt7530_priv structure?

Arınç

