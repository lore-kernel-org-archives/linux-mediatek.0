Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A67AC30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 18:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gy8AH0XBcf7dpV5Zm5VUIvD/5OEaKpGMnkFSxXObV2s=; b=KwPKxpor4tNMmOC3A+UGRO5QlM
	R6giDkNLUikLPP/Mcoy/cf9bE6ZORHnPameBAprow9fH8GM3TJViUjgBSFoXsgW78wXQGBsyd3p7/
	F8gaWhdE+Wh0oWULS16Xg/8dmVICZZJWo/ZV3VpcXzbHZt6dlRgWPuKSe9UIO2hxpUGLxXbHf0Rie
	UENoGJ7kpIa/ROQd/Fuc7ZoaOJvNws0dP4xQh/xvyJ6hbwp0x0MS4c4On7ESgyNiLuSxwZ5mt0Ll7
	1Bu2J1Pdq0hgOIXQWARPM1hyLH2GBkynCFMoRGgSjalGQQPHFHmFvvW7aD5Arr5qrSETDMG87vRA7
	k+Kl/j7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPRZC-0000000ECCI-2FOU;
	Thu, 04 Jul 2024 18:52:26 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPRYx-0000000EC97-1ZyV;
	Thu, 04 Jul 2024 18:52:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B42861BF204;
	Thu,  4 Jul 2024 18:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1720119126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gy8AH0XBcf7dpV5Zm5VUIvD/5OEaKpGMnkFSxXObV2s=;
	b=RM4d7OgO35orTuUrSmobImrl4SjstNMZ3iYSeI0nJ2I/C33xMNK+kNMCzJQuDkYt4cSCrA
	XVyhcSNOPrQ/Wo0FYV2pYggCDZky4jXo7ob9jpOxE/IXuTUcowpRpyqkflU4ZEfcMphxa9
	dCzTjfNr2KniWE5X+ulSzYbFN8wRveP0fd6NNXCjh+vvR1QswDG+PHzKWLV+4KAoc6I17K
	h7F1XLel6TqlPbyu8ATAte3XQB8fShsPmsLrIRhe4VJ1i0GKediW/zGi5prSas5L0+3ZCI
	vzFjZQHIzHTWzVeRQ2Yn+OwFOo02jO/bTrBZpFdA6SJ4zpmLP/1RnzcyjaukXw==
Message-ID: <884b94a6-3488-4ddf-b096-4f445902875e@arinc9.com>
Date: Thu, 4 Jul 2024 21:52:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 regressions@lists.linux.dev
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
 <d3ac5584-8e52-46e0-b690-ad5faa1ede61@arinc9.com>
 <20240704172154.opqyrv2mfgbxj7ce@skbuf>
 <a57dd43e-0798-4dab-853f-da84a19ee153@arinc9.com>
Content-Language: en-US
In-Reply-To: <a57dd43e-0798-4dab-853f-da84a19ee153@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_115211_724300_1B0C1422 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
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

On 04/07/2024 21:19, Arınç ÜNAL wrote:
> On 04/07/2024 20:21, Vladimir Oltean wrote:
>> On Wed, Jul 03, 2024 at 10:03:09AM +0300, Arınç ÜNAL wrote:
>>> Works on standalone MT7530, MT7621's MCM MT7530, and MT7531. From MT7621's
>>> MCM MT7530:
>>>
>>> [    1.357287] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module
>>
>> Why is the device corresponding to the first print located at address 1f,
>> then 0?
> 
> Because mdio_device_register() in mt7530_reregister() runs with new_mdiodev
> after dev_warn() runs with mdiodev.

I meant before. mdio_device_register() with the new_mdiodev argument is
called before dev_warn() is called with the mdiodev argument.

> 
>>
>>> [    1.364065] mt7530-mdio mdio-bus:00: [Firmware Warn]: impossible switch MDIO address in device tree, assuming 31
>>> [    1.374303] mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -14
>>> [...]
>>> [    1.448370] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module
>>> [    1.477676] mt7530-mdio mdio-bus:1f: configuring for fixed/rgmii link mode
>>> [    1.485687] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
>>> [    1.493480] mt7530-mdio mdio-bus:1f: configuring for fixed/trgmii link mode
>>> [    1.502680] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=17)
>>> [    1.513620] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
>>> [    1.519671] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=18)
>>> [    1.533072] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=19)
>>> [    1.545042] mt7530-mdio mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=20)
>>> [    1.557031] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=21)
> 
> Arınç

Arınç

