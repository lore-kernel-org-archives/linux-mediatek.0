Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED617C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 10:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qfFonYRVFf4urM+5uJF5QuqNz9TM00Eh0PPfAvORzBU=; b=aOqNTMGBEpuY9w
	6SmswzeLPAF5JD55mqfwO4swYhW66EabkcmdENpMAcOs32uk/3yHGBq74BkDyABRDZxh0rMy71EoZ
	zzy1pUiLw04tAZt3TmzTY4p6CiN0hnkldcfKsSgPU0zKxbZv0+4ocWuoE6SADAGRFMs63pVOdTkWb
	x8X+5loPLzBxpygnx3V4QKa9enEccHmjOgxAMu63rtMKimAubJHJmqwD3nhZb84iOZCl1+knr7Cmg
	2Vn5plnvOW1cDxtUfMVKCtjPDKbf7XAqrqETJT1C1Gq/fN9GmUAhGUZF5rTDjTbkiSJEbOI0ls0Wn
	oghPzirthHrlCD6I3KZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsCn-00GyPt-2G;
	Thu, 11 Jan 2024 10:22:33 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNsCk-00GyLo-0g;
	Thu, 11 Jan 2024 10:22:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E659120004;
	Thu, 11 Jan 2024 10:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704968539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfFonYRVFf4urM+5uJF5QuqNz9TM00Eh0PPfAvORzBU=;
	b=LM8IrbNhBB6sP+VNXbhM/PMiu4yRl818gZZJ2Uuv1XoKpUImGDyCEGSTwITmoLBFH07xp/
	FTFrteUc/sgwpLwBvoojN1UOrcw2xcKO/Mc8sKAz5zRMotIXyoVv7DxUStr3nQa0by/U2F
	mfP2OBVLlfn7Y6D8l0jww9ni/ocSVACBj2fGg8IpmKFGuVQtKeQD3/N2nCOGKjZI9C/2A6
	ZiiQJCYnfxpywkEkFxlrEnmCd8kPy3tTCIwgvblyvvyomd9+q1uqW6fp5cylAEAUwcxBDx
	U2T1LspaH3ve+YGxBV8WFhuVO8BJdPR6c8TBGgTDYkWW25ibWX9MKa2fWD5h0Q==
Message-ID: <009fec43-0669-419e-a3a9-ce54c676a324@arinc9.com>
Date: Thu, 11 Jan 2024 13:22:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 07/15] net: dsa: mt7530: do not run
 mt7530_setup_port5() if port 5 is disabled
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <a2826485-70a6-4ba7-89e1-59e68e622901@arinc9.com>
 <90fde560-054e-4188-b15c-df2e082d3e33@moroto.mountain>
 <20231207184015.u7uoyfhdxiyuw6hh@skbuf>
 <9b729dab-aebc-4c0c-a5e1-164845cd0948@suswa.mountain>
 <20231208184652.k2max4kf7r3fgksg@skbuf>
 <c3a0fc6a-825c-4de3-b5cf-b454a6d4d3cf@arinc9.com>
 <48b664fb-edf9-4170-abde-2eb99e04f0e5@suswa.mountain>
 <2ad136ed-be3a-407f-bf3c-5faf664b927c@arinc9.com>
 <20240109145740.3vbtkuowiwedz5hx@skbuf>
 <0a086b5f-b319-4f08-9513-a38c214e1da7@arinc9.com>
 <20240110182358.ci7pg7ipcbsjxqjf@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240110182358.ci7pg7ipcbsjxqjf@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_022230_555043_006C85AF 
X-CRM114-Status: GOOD (  21.44  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Dan Carpenter <dan.carpenter@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 10.01.2024 21:23, Vladimir Oltean wrote:
> On Wed, Jan 10, 2024 at 10:26:54AM +0300, Arınç ÜNAL wrote:
>>> Are there existing systems that use PHY muxing? The possible problem I
>>> see is breaking those boards which have a phy-handle on gmac5, if the
>>> mt7530 driver is no longer going to modify its HWTRAP register.
>>
>> Ah see, for PHY muxing, the driver actually wants the phy-handle to be put
>> on the SoC MAC, and the PHY to be defined on the SoC ethernet's MDIO bus.
>> We don't even define gmac5 as a port on the switch dt-bindings.
> 
> I noticed that from the code already. Maybe I shouldn't have said
> "gmac5" when I meant "the GMAC attached to switch port 5, aka GMAC0".
> I was under the impression that you were also using this slightly
> incorrect terminology, to keep a numerical association between the CPU
> port number and its directly attached GMAC.
> 
>> While none of the DTs on the Linux repository utilise this, some of the
>> mt7621 DTs on OpenWrt do. The change in behaviour will only be that phy0/4
>> will be inaccessible from the SoC MAC's network interface. I de-facto
>> maintain the mt7621 device tree source files there. I intend to revert it
>> along with adding port 5 as a CPU port so that the conduit changing feature
>> becomes available.
> 
> If OpenWrt kernels are always shipped in tandem with updated device
> trees (i.e. no Arm SystemReady IR platforms, where the DT is provided by
> U-Boot), I won't oppose to retracting features described via DT if their
> platform maintainers agree in a wide enough circle that the breakage is
> manageable.

I will see to this when the time comes.

> 
> BTW, besides OpenWrt, what other software is deployed on these SoCs
> typically?

Other than OpenWrt which is widely used for these SoCs for its ease of
flashing and upgrading, compatibility with legacy U-boot versions that
usually come with any vendor making a product out of these SoCs, I can only
talk about what I deploy to run Linux. I use mainline U-Boot along with the
device trees from the Linux repository to boot mainline Linux kernels with
Buildroot as the filesystem.

Arınç

