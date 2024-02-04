Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4964C48286
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pw/KaLqyNXN7B46B9Layw79P/0my6PltB7XkP8ad8AY=; b=nDpiNIWVr00OCWxXuYzZXmTrxO
	j2sXcRoEIHiSWkrcM03ppP6SenKK2SR083jcFyWzS6qqBL1a8iidE/2amwXIu/mN/y9+irWyfU4qq
	IqmuIRizhTOfALCRrywH49iK6owaH8VgTTEypzXdldaRZgCC6GoJbsw5+c2JvCGvCMgm8irf0JYY3
	Vdh4vwf9377gUOQup2P9Uoe9NjuEf8PNfvgOORJJrzupaohILT6AAKKE+wnYjrMr6RDa3hj2QifxL
	VGIUVdSvUB8vgVWQAyIQvF9kVyM0WrZxJ6KA/ZN4BXk1IwopUo8WZUIrvXjzVtVmeR5LZ+cHf3nRd
	jGsu5k6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWeq8-000000015QZ-3scg;
	Sun, 04 Feb 2024 15:55:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWeq5-000000015Py-0Hx3;
	Sun, 04 Feb 2024 15:55:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F69AC0004;
	Sun,  4 Feb 2024 15:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1707062121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pw/KaLqyNXN7B46B9Layw79P/0my6PltB7XkP8ad8AY=;
	b=Zsi3a1I4x8UIMP+yLCiVz83TQxWgGQm/ZMkkbXAmXyuZsBORrwDbyXEtbnKt42BFJkIJH0
	4fa1GLCiscX/G+oULpJt7cAQ70E6BPyYd8i01Pe5HU21TqbNFVJXrclrVXP0VF2KCwk13g
	M0pPbT0EXdA7jk6N6hAkchT4bEiuq/jkwdkPH+GckWWa5hmoNjiRuovm9yHSauWw2QMFUp
	+LwpBjD1VK2HOFaramUEHxD5FaRool2EE1geTIx0l9X8w0BquumaKGjy95aVe7I816n6NR
	lCahbfbhKBWyzGii0KaXl4eKkTNSNlnSv3x1TaFkcBIljC+7a/opKSMIyyWZDw==
Message-ID: <4fa2ff0d-2804-4a58-980f-162e62b3dc9c@arinc9.com>
Date: Sun, 4 Feb 2024 18:55:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/7] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240202-for-netnext-mt7530-improvements-2-v3-0-63d5adae99ca@arinc9.com>
 <20240202-for-netnext-mt7530-improvements-2-v3-4-63d5adae99ca@arinc9.com>
 <ZbzWpmZrukknMsYf@shell.armlinux.org.uk>
 <5b744f7f-2f63-4219-a0e9-8f08267b1fdd@arinc9.com>
 <Zb021ozEQSbU-gPd@makrotopia.org>
 <f6234b46-ce30-4b2a-9681-15633a06feff@arinc9.com>
 <Zb+ctEe9TVA3zhv8@shell.armlinux.org.uk>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Zb+ctEe9TVA3zhv8@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_075525_400224_EB94118E 
X-CRM114-Status: GOOD (  28.38  )
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

On 4.02.2024 17:18, Russell King (Oracle) wrote:
> On Sun, Feb 04, 2024 at 04:55:40PM +0300, Arınç ÜNAL wrote:
>> This is not about laziness. This is before patch 2:
>>
>> phylink_mac_ops :: mac_config() -> dsa_port_phylink_mac_config()
>> -> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
>>     -> mt753x_mac_config()
>>        -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
>>           -> mt7530_setup_port5()
>>     -> mt753x_pad_setup()
>>        -> mt753x_info :: pad_setup() -> mt7530_pad_clk_setup()
>>
>> This is after:
>>
>> phylink_mac_ops :: mac_config() -> dsa_port_phylink_mac_config()
>> -> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
>>     -> mt753x_mac_config()
>>        -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
>>           -> mt7530_setup_port5()
>>           -> mt7530_setup_port6()
>>
>> Patch 2 does not move mt7530_setup_port6() to be called from
>> phylink_mac_ops :: mac_config(), it already is. There is no valid reason to
>> reorder the patches.
>>
>> My response to Russell should've stated this instead of focusing on his
>> second sentence.
> 
> This patch moves the test for a 20MHz crystal to mt7530_setup(),
> which is something that is entirely orthogonal to patch 2, which
> can be done cleanly (I've just applied the patches in the original
> order and then reordered them:
> 
> 98c481f5d706 net: dsa: mt7530: do not clear config->supported_interfaces
> 93c6b53b17f4 net: dsa: mt7530: correct port capabilities of MT7988
> c9c6d4c51a1d net: dsa: mt7530: simplify mt7530_setup_port6() and change to void
> adfa948253e0 net: dsa: mt7530: remove pad_setup function pointer
> 57e21e6c2fc0 net: dsa: mt7530: call port 6 setup from mt7530_mac_config()
> 959a0f9323c8 net: dsa: mt7530: move XTAL check to mt7530_setup()
> 856ab64a22ef net: dsa: mt7530: empty default case on mt7530_setup_port5()
> 
> No problems. The end result is identical comparing the git tree at the
> original "move XTAL" patch with adfa948253e0.
> 
> Now, if we look at "net: dsa: mt7530: remove pad_setup function pointer"
> we can see that yes, the pad_setup() method was called from mac_confing,
> but this is the exact contents of that patch removing the callsite:
> 
> -               mt753x_pad_setup(ds, state);
> 
> This returns an integer, which may be an error code, which is ignored.
> Therefore, if the XTAL frequency check fires, and mt753x_pad_setup()
> returns an error, it is ignored today.
> 
> After "net: dsa: mt7530: call port 6 setup from mt7530_mac_config()"
> the renamed pad_setup() method is now called from mac_config() thusly:
> 
> +               ret = mt7530_setup_port6(priv->ds, interface);
> +               if (ret)
> +                       return ret;
> 
> So now the error checks cause mt7530_mac_config() to return an error
> which in turn causes mt753x_mac_config() to fail, and therefore
> mt753x_phylink_mac_config() has different behaviour.
> 
> So, patch 2 changes the driver behaviour in the case of a 20MHz XTAL,
> which is then changed again by patch 4.
> 
> It would be better to have only one change of behaviour by moving
> patch 4 before patch 2.

If the idea is to not bring any more error returns to mt753x_mac_config()
because the return code is actually checked for that, I should do a bit
more effort and put patch 5 before patch 2 as well, to live up to what you
originally requested. Because, to get rid of all error returns on
mt7530_setup_port6(), both "net: dsa: mt7530: move XTAL check to
mt7530_setup()" and "net: dsa: mt7530: simplify mt7530_setup_port6() and
change to void" patches are needed. After these patches, I can move
mt7530_setup_port6() to mt7530_mac_config() and there won't be any error
returns being brought under mt753x_mac_config().

pw-bot: cr

Arınç

