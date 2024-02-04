Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD501C48286
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT0/6zQt68cW/v3LjBVmp3jhbfU8KRIHt1R6FOnr5Ug=; b=dz1a8EpBKvpwfCwdzPtuFmUPA7
	3g1RmRBYuqdgMRBlOSL6Q8aTrPduxm4FL5k+PQIDCN8yqVm8WPtvbXRAAgQmFrNX5DdtostqsJziI
	GZHbHCVaJKrDXL8qgCe9SmkqUOA2ECa7YPVhAt1bW+6dXyiJvjJoxytywNxj/qK/pnhLp+qHTRta6
	M1o0pSBq3rcY+5m6kBCF0EAnA/B2s4nltJyCKRNifaVltaQnaBvTM5ioqPT6X+gIiUDB4Fydg78Tb
	IuFxgxYJgHB0S8VU6US7/T28l/4dT2QxhNmlWB2tWWp0zNWQyBHBZ5+vpE+QeDHAHAk8oBIVHBX3R
	GcnaOOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWcyU-00000000uS8-1GUB;
	Sun, 04 Feb 2024 13:55:58 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWcyP-00000000uQT-3s4m;
	Sun, 04 Feb 2024 13:55:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64D3A40002;
	Sun,  4 Feb 2024 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1707054947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WT0/6zQt68cW/v3LjBVmp3jhbfU8KRIHt1R6FOnr5Ug=;
	b=R8R/F5p+3gb8fz+0YdlFYto2IronmylP4tdxdS6FlqK8FtbhiCNwwd7Cs0h0di9wJ5lMp+
	jENMaTbvWyxdgWORNDJ/YWw57xPdPhAb2Ddczh71LaLghV6CEg8N2ZsmiDY1mA6Tyw7v6J
	HixUudJmnf8VbXdPqfZ5aDYlv1+WnwpIOTGGq1N2tgZA0UEUR1MHtdxS8za3lIMih2fMLZ
	eagalIfv0VE074zMGTx9Y1bGwKafqle+FzXW6/76LwTfC9CJRQZgrF4HeEegDXjTBGDd5C
	IoOhCQJnGDwoQ8b2wYKaApGIPa5KiEP3PgG7e5qczsYevON2b8b9NzAC67c2gw==
Message-ID: <f6234b46-ce30-4b2a-9681-15633a06feff@arinc9.com>
Date: Sun, 4 Feb 2024 16:55:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 4/7] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
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
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <Zb021ozEQSbU-gPd@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_055554_282455_B95880C3 
X-CRM114-Status: GOOD (  19.27  )
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

On 2.02.2024 21:39, Daniel Golle wrote:
> On Fri, Feb 02, 2024 at 09:16:02PM +0300, Arınç ÜNAL wrote:
>> On 2.02.2024 14:48, Russell King (Oracle) wrote:
>>> On Fri, Feb 02, 2024 at 12:19:10PM +0300, Arınç ÜNAL via B4 Relay wrote:
>>>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>>
>>>> The crystal frequency concerns the switch core. The frequency should be
>>>> checked when the switch is being set up so the driver can reject the
>>>> unsupported hardware earlier and without requiring port 6 to be used.
>>>>
>>>> Move it to mt7530_setup(). Drop the unnecessary function printing.
>>>>
>>>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>>>> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
>>>> Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
>>>
>>> I would prefer this to be earlier in the series, before patch 2 which
>>> moves mt7530_setup_port6() to be called from mac_config(). mac_config()
>>> is supposed to be configuration error-free - in other words, all state
>>> should have been checked before hand.
>>
>> I agree but mt7530_mac_config() is not a void function yet. The
>> mac_port_config member of the mt753x_info structure points to this
>> function. My next patch series gets rid of all useless error returns on the
>> phylink path and change mac_port_config to void. So I don't think working
>> on this patch series further will worth the effort. I'd rather have this
>> version applied as is.
> 
> I agree regarding not changing the patch itself, but I also agree
> with Russell regarding the patch ordering. I know it's a 10-minute
> git headache to rebase the patches on top of each other in a different
> order, but you can easily compare the end result being identical to
> what you had before and hence don't need to retest.

This is not about laziness. This is before patch 2:

phylink_mac_ops :: mac_config() -> dsa_port_phylink_mac_config()
-> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
    -> mt753x_mac_config()
       -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
          -> mt7530_setup_port5()
    -> mt753x_pad_setup()
       -> mt753x_info :: pad_setup() -> mt7530_pad_clk_setup()

This is after:

phylink_mac_ops :: mac_config() -> dsa_port_phylink_mac_config()
-> dsa_switch_ops :: phylink_mac_config() -> mt753x_phylink_mac_config()
    -> mt753x_mac_config()
       -> mt753x_info :: mac_port_config() -> mt7530_mac_config()
          -> mt7530_setup_port5()
          -> mt7530_setup_port6()

Patch 2 does not move mt7530_setup_port6() to be called from
phylink_mac_ops :: mac_config(), it already is. There is no valid reason to
reorder the patches.

My response to Russell should've stated this instead of focusing on his
second sentence.

pw-bot: under-review

Arınç

