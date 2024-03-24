Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE7C47DD9
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Mar 2024 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SHd06vSLOzCjmoLwufibD7173gHP8W2NTfMUYQWalTM=; b=yvoUJOTUJD7ip/TjUZVguWn4GM
	jD6OTb9kcGM0l443ocmw3kfJUNPhRIOqjorXOKD/cd4FzR3dYYyLLbFuEk+gA2KMWRX8/gaoyu1MR
	KOWbR/7X8IHY3UJdHAZucDLvmO6CaaMYbInsj4NG0XaYAgA4ir90vkKut2mK7w9GQjHlAJK4vZeiX
	ShRSgFCMvKdULJVwqzs63v8/al2p60E6k3dnyDASTOiiRI+YrrG7LRHJJIeQUwwau8KtmMP1SWO+u
	Qx+MAGZzM/exjEEcfP69D7Jm0yoP05dM+csE8MS4PeoP+SLCq0Mexymd98owPCO2mRCQc21shrxrY
	Kyah3gyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roMI1-0000000CTbh-44qF;
	Sun, 24 Mar 2024 11:45:25 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roMHx-0000000CTaz-0Rkk;
	Sun, 24 Mar 2024 11:45:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F374F40005;
	Sun, 24 Mar 2024 11:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1711280717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SHd06vSLOzCjmoLwufibD7173gHP8W2NTfMUYQWalTM=;
	b=bpzbnkW+EWJftWZQUvb7X+yE7kOgudmqCMAGz9gTfHD8MP9UhA3pt9hXoju4h7iZQU6n8N
	WuzWRoFQvg3dhQCl9IoZlpcsomANxCZyClQw9a4ty5iYVHJFcDk2dp6cz2KQSAVVtkWlaZ
	h1/cJ/dqh7RGlekrYdfRlnLnFx3AGQqD6+vEMOLdugXKLLmgjHqIfl1PF9UafOVlzd1JAn
	LZq6kL1/ry7H4AfLzpOfwuh1q8smC8NbaeUOzXo+6mlgiF/08sBUkA/nF3MmXntk5+5aM7
	vfYrY1+OOwbZ2kOO4ruLevXHWCPRJoqa53doSxGBFptLMhC+3sUq0qFbTiRMpg==
Message-ID: <6db6a339-e402-472f-b640-523ced553354@arinc9.com>
Date: Sun, 24 Mar 2024 14:45:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240318-for-net-mt7530-fix-eee-for-mt7531-mt7988-v>
 <ZfnYkuzuvwLepIfC@makrotopia.org>
 <00ec9779-19ce-4005-83f0-f4abf37350fc@arinc9.com>
 <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
 <Zfn1DxkEa3u-f7l2@makrotopia.org>
 <38798882-c033-4949-9446-4c6f15c25ebe@gmail.com>
 <0fbe7ba2-6529-4118-b050-8ea76d28b712@arinc9.com>
 <11b2a4d1-66d8-4bcf-b1a8-20a635b99cc4@gmail.com>
 <5a4c0436-cd78-419f-af14-9c4e0c0435e3@arinc9.com>
 <ZgAQ4Ihsn6RCk7xx@shell.armlinux.org.uk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZgAQ4Ihsn6RCk7xx@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240324_044521_331586_0BA32E9C 
X-CRM114-Status: GOOD (  15.95  )
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

On 24.03.2024 14:39, Russell King (Oracle) wrote:
> On Sun, Mar 24, 2024 at 12:47:08PM +0300, Arınç ÜNAL wrote:
>> I've tested with switch ports interfaces' tx-timer from 0 to 40, same
>> tx-timer for both interfaces. Loss is still there.
> 
> EEE implementations tend to be a mess in the way drivers implement the
> API, so one can't at the moment rely on what ethtool says about the
> status. Sadly, this is what happens when driver authors are left to
> their own ends. :(
> 
>> I suppose the MT7531 switch PHYs need calibration for EEE that is currently
>> missing from the mediatek-ge driver.
> 
> EEE is quite simple from the software point of view. There is software
> negotiation of the modules that EEE supports, and then there is are
> one or more timers that affect the behaviour of EEE. The LPI timer is
> "how long the link needs to be idle for before _this_ end signals that
> it _can_ enter low power state". The link only enters low power state
> when *both* ends of the link signal that they can enter low power
> state.
> 
> What calibration would be necessary?

Check out mt798x_phy_eee() on drivers/net/phy/mediatek-ge-soc.c.

Arınç

