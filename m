Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B838CC54E71
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 20:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6j8gsk/0efjiGaA6j1k1JY0wgpOfZpJCDP88uiiOZI=; b=oDNlNMWdWGJ9kbDp1CtX7vIHyH
	vwELTp67cARYzTiJbuVwpS9/iwkIRqNC+YPz4a0Sf5KS/JkhHFvIHp8OY0jMi7mtGcq2jzm1Jz0Af
	gGx28XXSocwUtQZOO5R03ijszAAaCdMjUz0GdR9PDA57ThOhhIDGJahA7DatoJZFEzuX4EINqGKnt
	MjAW4xClX5y30qaPqoEbmXHLbizY/QjXRQSNmZDUyQ2OaA5nXFI5Z467fiDqGCVMxIZ2GYb+Dol9B
	Qs+Tj21Bd9DyTD8CtSnAf1ONWfzssVdAaO69jYsaV88SbsC4cBqQDCgftAI3Q677f2HN6LUDoNtUT
	jk01iOVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfiD-0000000E4WT-2Kwf;
	Tue, 19 Mar 2024 20:05:29 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmfi8-0000000E4Uc-2mm8;
	Tue, 19 Mar 2024 20:05:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24838240002;
	Tue, 19 Mar 2024 20:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710878718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6j8gsk/0efjiGaA6j1k1JY0wgpOfZpJCDP88uiiOZI=;
	b=HO3WkU4phWfOw6nkmEI15k1bdiHhhOOUzsS9cl0etLXk2S8wBLrnSkHn8XjXMyv6EN1XR3
	C7oyOImPYZ4kTV+5TlOp4wtW+fKVn19gGbTMyXoVkyI5jtbUepfm7keb6Yr7E33wAxdusK
	/piuAZB0JR+Y7dD5ylWGnMvLHziaYf9FbTDmRx2aa/SrRg0gQAar/eFToEdKrPH5v61Ard
	cvv4gjBNqakKYYlDwXJaLeNUsLDghUcLHxd+Fo8QpkyAS9FdiBw7w66w1gkyuxhD3C5zBQ
	jRaCKZsWSpnwb/AVIbB6HXDK4F8aVoOIGj4LjVZohotEK1TSubPdq9lVCRD6rg==
Message-ID: <7feb4cbc-15f3-47e1-874e-382ebee109de@arinc9.com>
Date: Tue, 19 Mar 2024 23:04:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
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
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <6cb585f6-6da8-45a2-a28b-2fb556f95672@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_130524_930178_DF123A56 
X-CRM114-Status: GOOD (  13.41  )
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

On 19.03.2024 22:38, Andrew Lunn wrote:
>> I would argue that EEE advertisement on the PHY should be enabled by
>> default.
> 
> That is an open question at the moment. For some use cases, it can add
> extra delay and jitter which can cause problems. I've heard people
> doing PTP don't like EEE for example.
> 
> The current phylib core code leaves the PHY advertisement whatever its
> reset default is. So we leave it to the manufacture to decide if it
> should be enabled or disabled by default. It is policy, so it should
> really be down to user space to configure EEE how it wants it.

That's fine by me. Then my patch series is okay as it is.

Arınç

