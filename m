Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E122C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 21:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JfmAC/E4FArAkJLqHhygEkjSsgmfY7ECoy3BidHAuo=; b=r6pHi2SE93pOSW
	jtivQEzUCaFwzq77+b2TwZbDqsH7+P81Prx+7mvbdpxlQzHhbvej12LRdVje8p+hKKhQLQsjrGr8w
	L7sQ1l1rT+U4UwFhAGn3rdGM7yq0w+0+zV2b3+Y2HHBd5OWtURzNixrbfM23uniNfzVB9ubezl4oW
	PNVGsdduLLz8QGhHW0ifJkoYQ/PftwEfSDtRjEWNKvjYHgwsBZQiOK8ljwDIknVypYeO4fXshpUUj
	1POybKrW3pa/XlrxWwgyENlzjNClA5ifYanwzoWK7aNKwgCLM/wuLbipi6aQ3xbmf0Prv/cjyU6gk
	NnT4/eCRjN/UTXDIPa4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgue9-00CS33-1L;
	Mon, 27 Mar 2023 21:44:57 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgue5-00CS25-2M;
	Mon, 27 Mar 2023 21:44:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1679953466; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FpaQAKo96iijQL09OHyq7oXJOia9ek47qTry412zgpp6ecAzuPjSFT07mmjBB8QJHMwmEEiwIRys/jzXv5v5NyAV5zO6qXkCOdden2SGGT6KeN+abPayDsUBrGcy7JYasWrheOa3A6wYhf1oYaVgNwUnpLtuOqrHmmr1ojoUocA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1679953466; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7JfmAC/E4FArAkJLqHhygEkjSsgmfY7ECoy3BidHAuo=; 
	b=CTOtdQf+Aiaz0FM8XaXNHXCLCfOECIxsKHaGovToteltYf6BBlKs67PeLaMLGnVvkfk+5rxaKhukVQI+8yiHja1CpDNRgJJ31P3u1pJ8O1coctja1hOBwfEpw9BvEq+tjGh6s8z2CT2k/AcfZLrpmLL5t9jEUegqjyOWKzIwgmE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1679953466;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=7JfmAC/E4FArAkJLqHhygEkjSsgmfY7ECoy3BidHAuo=;
	b=HtfcyjvEu4aopAbw/VE4Lit7cBmsmAa8Bc3k3HYcwHNuY8VsUPsluDl3feo/Jgs9
	OYi+Eottd5ejp6E58dOOvgparzpdQ7jz+/aRc3CcnhlanV6V0NZ+Z4cQWGh1fxqAFV9
	0dnkyRZVyavOWq25/8T9a9wWMEMHdSTZSXOgclZA=
Received: from [10.10.10.3] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1679953465201776.7811029158123; Mon, 27 Mar 2023 14:44:25 -0700 (PDT)
Message-ID: <2f5ba94a-e48d-7927-4902-9736da2b8cbf@arinc9.com>
Date: Tue, 28 Mar 2023 00:44:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH net 2/7] net: dsa: mt7530: fix phylink for port 5 and fix
 port 5 modes
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
 <20230326140818.246575-3-arinc.unal@arinc9.com>
 <20230327184944.oahce2iizpauw4nm@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20230327184944.oahce2iizpauw4nm@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_144453_818911_9073E25B 
X-CRM114-Status: GOOD (  21.16  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?= <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 27.03.2023 21:49, Vladimir Oltean wrote:
> On Sun, Mar 26, 2023 at 05:08:13PM +0300, arinc9.unal@gmail.com wrote:
>> From: Arınç ÜNAL <arinc.unal@arinc9.com>
>>
>> There're two call paths for setting up port 5:
>>
>> mt7530_setup()
>> -> mt7530_setup_port5()
>>
>> mt753x_phylink_mac_config()
>> -> mt753x_mac_config()
>>     -> mt7530_mac_config()
>>        -> mt7530_setup_port5()
>>
>> The first call path is supposed to run when phy muxing is being used. In
>> this case, port 5 is somewhat of a hidden port. It won't be defined on the
>> devicetree so phylink can't be used to manage the port.
>>
>> The second call path used to call mt7530_setup_port5() directly under case
>> 5 on mt7530_phylink_mac_config() before it was moved to mt7530_mac_config()
>> with 88bdef8be9f6 ("net: dsa: mt7530: Extend device data ready for adding a
>> new hardware"). mt7530_setup_port5() will never run through this call path
>> because the current code on mt7530_setup() bypasses phylink for all cases
>> of port 5.
>>
>> Leave it to phylink if port 5 is used as a CPU port or a user port. For the
>> cases of phy muxing or the port being disabled, call mt7530_setup_port5()
>> directly from mt7530_setup_port5() without involving phylink.
> 
> You probably don't mean "call X() from X()" (that would make it recursive),
> but maybe from mt7530_setup(). But it was already called from mt7530_setup(),
> so I don't understand what is being transmitted here...

Oops, I meant to say call mt7530_setup_port5() directly from 
mt7530_setup() without involving phylink. Will fix.

> 
>>
>> Move setting the interface and P5_DISABLED mode to a more specific
>> location. They're supposed to be overwritten if phy muxing is detected.
>>
>> Add comments which explain the process.
>>
>> Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
>> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
>> ---
> 
> Sorry, I didn't understand... so what was the problem, and how does the
> movement of the mt7530_setup_port5() call that isn't under phylink solve
> that problem?

Port 5 being used as a CPU or user port was being set up from 
mt7530_setup() instead of using phylink. This patch fixes that.

Arınç

