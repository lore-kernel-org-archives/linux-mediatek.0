Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D122C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Dec 2023 12:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=53VdKDpJcL+9oYwjSNytfeRiAIyPbKa7FVqLsuZATU8=; b=DS7bRjfkQxuYA0
	PRqdDnlJo0t0nxucXnvwJpYHEzHl6uwZ1dX5OcI1hFcVeNHsM4/8eSo3Gyu98U3zOgrzY5wzQAcJE
	HxQzatCnZSNMqQxCA4oeXN5hlPKodgnQpasd5OvCHAWTxw/1Z3iYOblGRGSzHtlGqZvFhC3EDnY4m
	cc+X9ye6R6ZmoZ313Du7eS0qxX708GjknuzK2inW2RyLcksEju1Vek1Xzg85GEx8Bl9njXic/cxm1
	pQtOgVHZFTqj4Sw2DQl2+RUiflKmusLGjfFeyHse/kN0TcUTKnLODbVoN0g16JCn3BPuLGKEhgwib
	7jqZggrE/aT1X7C3r1fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEqTv-007oH8-1X;
	Sun, 17 Dec 2023 12:42:55 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEqTr-007oG4-06;
	Sun, 17 Dec 2023 12:42:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97A3F1BF205;
	Sun, 17 Dec 2023 12:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1702816962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=53VdKDpJcL+9oYwjSNytfeRiAIyPbKa7FVqLsuZATU8=;
	b=b9wK5mg0uUyb2cQPYJNlayYJcOEtfwb7WbqhgIe1HbMH7LeT6fvWNpOxUlGJafWs5WBVzP
	jMVU/V4yxtxr0mfbAHDE+iuPKfshri1J1SEXaq2O0QOYtzTmpJT0F/Kntq8d1XCvUFpIbd
	reBH+mlTqOqPc+Iq0dogGtnEEssPAB7UDZUFkD3ob8G6xeBuI8oV9OuV6D+NAKDdm5xGDO
	Wy6UUwAxVQnp6akeFmO11Gjv73DM39HVAOuu3+QC+YcJncxOVJ1/hmBxBRBre4dPD4nr4D
	L8HRuTGci9PwaO4rZljAxu8vQDITXI4FwRQL17inlZcz0chhVUAOcI21JMavlQ==
Message-ID: <a01fa1eb-be77-4da1-bfa5-3e3c20bc08a7@arinc9.com>
Date: Sun, 17 Dec 2023 15:42:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 06/15] net: dsa: mt7530: do not set
 priv->p5_interface on mt7530_setup_port5()
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <20231118123205.266819-7-arinc.unal@arinc9.com>
 <20231207181858.ojbgt5pwyqq3tzjk@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231207181858.ojbgt5pwyqq3tzjk@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_044251_379016_E383B233 
X-CRM114-Status: GOOD (  25.33  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 7.12.2023 21:18, Vladimir Oltean wrote:
> On Sat, Nov 18, 2023 at 03:31:56PM +0300, Arınç ÜNAL wrote:
>> Do not set priv->p5_interface on mt7530_setup_port5(). There isn't a case
>> where mt753x_phylink_mac_config() runs after mt7530_setup_port5() which
>> setting priv->p5_interface would prevent mt7530_setup_port5() from running
>> more than once.
>>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
>>   drivers/net/dsa/mt7530.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 069b3dfca6fa..fc87ec817672 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -978,8 +978,6 @@ static void mt7530_setup_port5(struct dsa_switch *ds, phy_interface_t interface)
>>   	dev_dbg(ds->dev, "Setup P5, HWTRAP=0x%x, intf_sel=%s, phy-mode=%s\n",
>>   		val, p5_intf_modes(priv->p5_intf_sel), phy_modes(interface));
>>   
>> -	priv->p5_interface = interface;
>> -
>>   unlock_exit:
>>   	mutex_unlock(&priv->reg_mutex);
>>   }
>> -- 
>> 2.40.1
>>
> 
> Purely as a matter of theory, mt753x_phylink_mac_config() itself could
> be called more than once, at any time there is a phylink_major_config() -
> first during initial one, then upon any change of the phy_interface_t.
> With the port being fixed and internal, maybe that is unlikely.
> 
> Destroying and re-creating the phylink instance could also make the
> driver see more than 1 mt753x_phylink_mac_config() call. During periods
> of -EPROBE_DEFER, maybe this could even happen.
> 
> I think what we need to see is a description of what the priv->p5_interface
> test is really protecting against, because it certainly is uncommon in other
> drivers to have this much logic to avoid mt753x_mac_config() being
> called twice.
> 
> If there's nothing wrong with calling it twice and it's just an optimization,
> I think that's enough of a justification for removing that extra protection.
> At the same time, the optimization (and simplification) that we should
> pursue is that we should remove the overlap between phylink and the
> initial port setup made by the driver.

priv->p5_interface and priv->p6_interface were actually intended to apply
only for MT7531. It prevents the CPU ports to be configured again. CPU
ports are unnecessarily configured before phylink. I intend to address that
with the patch below. I'll submit it after the current patches here go
through. There's a lot to clean up in this driver.

https://github.com/arinc9/linux/commit/80efcb1870530ef5526d7feda625374b8f308369

If you can recall, this is where me and Russell mostly left off on my 30
patch series. I was supposed to run some debug info prints to make sure
that the MT7531 CPU ports are still configured as they were with
priv->info->cpu_port_config().

https://lore.kernel.org/netdev/ZHy2jQLesdYFMQtO@shell.armlinux.org.uk/

For this patch, I can change the patch log to state that priv->p5_interface
and priv->p6_interface are intended for use on the MT7531 switch.

Arınç

