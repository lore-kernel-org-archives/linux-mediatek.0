Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12CEC54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Mar 2024 21:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+eA4poe7YhKyyg6S2zgB/KMMtaqy46s40/9yE4njUg=; b=ba+ZET/Gge0TJDNQGVsMMwcdrd
	tZR+4w+Y54WxOjlkeCr4mflIYbW6e5YGlUJieFNEmML995gDzVouBeaqWs3NYysgWYGHO+8peR2ML
	KzOo2pVACHneS8gk408fZCCWzunYPp9zMUnUMkYVUREbvzF29kSVHpWWkuV2scyipwmV92cOMvyeD
	ItJfbtVfVK/5gMYAyTYn+nruMNNrtx1o49m8E/5tD3/XovI1nbzSua4LTCDfe01EKrMErni52Yv9l
	xj4H8trIEDw15bs6kgIyFHmmahLVscv8sREI24Qp8af71CYtncYdq2pOhHKvJ6yZJyGbBXRDXzSLY
	toEWIPGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn37o-00000000yk6-1HtV;
	Wed, 20 Mar 2024 21:05:28 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn37h-00000000yg9-3t6x;
	Wed, 20 Mar 2024 21:05:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1939E1C0004;
	Wed, 20 Mar 2024 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710968717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u+eA4poe7YhKyyg6S2zgB/KMMtaqy46s40/9yE4njUg=;
	b=JuoJStpPp45vWbK9MnkL1uOhTmNJiyG2ZlZsMk0v5ZWHIETQDf8hVwpIWGRJX8ZBwkMDo0
	wytv9+y/VJJMh9NTSqO8LXurlX8T81aySSDJTWyqCaNceHNP/SNrTAG8dhJgvVo8BnZu/7
	aOp+j16m4940s+7uik7lxvDcmFTA7w9HCP2asUiDZUg2k/RTprEhAL4F/a5LTGuTj4klcf
	psNinjH1BMvNlbXZhtCtmrX9i8OQTy8juOVOCVJVYYaAa4vwmkWT+Z57je5orX65jGZuwT
	ZQd079JYQiGDOwFGxHi4rM4YRFo/QjB9ublP+8iMj40zmM310fmmvAxLwXQn4g==
Message-ID: <dc487e20-7d6c-48b7-a590-cb3bd815cd21@arinc9.com>
Date: Thu, 21 Mar 2024 00:04:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] net: phy: mediatek-ge: do not disable EEE
 advertisement
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-0-3f17226344e8@arinc9.com>
 <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v1-3-3f17226344e8@arinc9.com>
 <3698b522-d6dc-46c1-bab2-d5ee3bed1fce@arinc9.com>
 <ZftM2vDYQ2+5nSRV@shell.armlinux.org.uk>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZftM2vDYQ2+5nSRV@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_140522_300559_C557007F 
X-CRM114-Status: GOOD (  23.74  )
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

On 20.03.2024 23:53, Russell King (Oracle) wrote:
> On Wed, Mar 20, 2024 at 11:40:56PM +0300, Arınç ÜNAL wrote:
>> On 18.03.2024 10:46, Arınç ÜNAL via B4 Relay wrote:
>> Can I get an opinion on this? Is it actually possible that the PHY driver
>> would start probing after the DSA subdriver? On the console logs for the
>> DSA subdriver, I can see that the name of the PHY driver will appear, which
>> makes me believe the PHY driver would actually never probe after the DSA
>> subdriver.
>>
>> [    4.402641] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=POLL)
>> [    4.420392] mt7530-mdio mdio-bus:1f lan0 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=POLL)
>> [    4.437791] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=POLL)
>> [    4.455096] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=POLL)
>> [    4.472422] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=POLL)
>>
>> I don't want to submit a bugfix to the net tree if the bug won't ever
>> happen in real life.
> 
> It would be really great if you could tell us which bug fixes you're
> submitting are for a real problem that you or a user have encountered,
> and which are down to essentially code inspection and things that
> "aren't correct". Basically, don't do this.

I agree. Patch 1 fixes a real problem, patch 2 "fixes" a problem found with
code inspection. Though, it would be great if you could review patch 2.

> 
> It isn't true that the PHY specific driver will be probed before DSA
> initialises - consider the case where the DSA driver is built-in but
> the PHY specific driver is modular and on the not-yet-mounted rootfs.
> That would result in the generic PHY driver being used even when the
> PHY specific driver were to be loaded later - and thus only basic
> standard 802.3 PHY behaviour will be supported.
> 
> That's not specific to mt7530, it applies to everything that uses
> phylib. It isn't something that really warrants "bug fixing" in each
> and every driver.

That makes sense. But there's a special case with the MT7530 DSA subdriver
and mediatek-ge driver. The PHY driver is needed for the PHYs to function
properly. So the DSA subdriver forces mediatek-ge to be selected [1]. So
the PHY driver could only be compiled as a module when the DSA subdriver is
also compiled so. And that designates mediatek-ge as a dependency for the
DSA subdriver, if I understand correctly.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id=fb4bb62aaac715e50c7c007714af19a2698db88b

