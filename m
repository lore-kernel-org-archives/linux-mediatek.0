Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F69CC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 14:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1f9OOyD8ojNFCWrfNkKyD6ZGmK3+QyUoXSTo95z0FgQ=; b=U0fSPKeAlPhGJSHfGoL5YnPSfS
	VzeulCkfhQ/rK9a5JNWgUgI1STHkBatp2lcm8X95j1siiIAYuTi+QzeAaFs/4c4RrouQkjKQ7lohg
	/hYXeewWcL01Teim/MeAzlw50PC64x/ek/u4UCnT2CmoZh6m9LQrLYIUb6kD214+Ve8u0JJKrn8HV
	+vggmSDWRMqm2LIjyexP9bgvyOEueR21TBcLgkhw6FyZIJQ0GeFjYaP4JwCzYXlCF5zddN6+H3Olg
	tit+rDJoMBkOvN2vDjhIOcBeIXuvRb5iVRGvCZMZDNb6gRxfOPxe3pFOUNxOrL6V8QzxJWJ18iVe8
	6UM5bejw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmDax-00000008k7c-19y5;
	Mon, 18 Mar 2024 14:04:07 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmDar-00000008k5w-3aap;
	Mon, 18 Mar 2024 14:04:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB309FF808;
	Mon, 18 Mar 2024 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710770636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1f9OOyD8ojNFCWrfNkKyD6ZGmK3+QyUoXSTo95z0FgQ=;
	b=CamfvvLzQzsBdgypLgY/TEg7rsBJh9tJ+ohoflWSdsyQbji5ujNuZqci7HP0KRoS8CjBHi
	WQUwkIFa0sq59pFBT/Q/sHh/MN2UDjG9j8C0YB/MLpZ2F6V+oGNWO7zJAC9aGrPaCp+pA7
	l67S4uSyqKrf/IXUSdhKv+qQhnD5weIhkuXCwmuO6BgO6ybXvCc3HWv+3Ez3xHoZaJvEpr
	6o2E6JOawk0LC42vui9eCdiW0sy6eGQwUT/ATypB1Cp+wTf0mQ39C8Ouxhc+HDcsCmkSNv
	8N0907nZNxmBUv/2myPs/IO2VqI4Te9Nm97Ofictb1Pt36iqmfcw2c/OSYxz2A==
Message-ID: <ea889226-3649-4f74-8c38-67c459e4ea4d@arinc9.com>
Date: Mon, 18 Mar 2024 17:03:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <65f7f17d.050a0220.3c75a.cde3SMTPIN_ADDED_BROKEN@mx.google.com>
 <5514243b-c795-436e-8628-8f421c900bcb@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <5514243b-c795-436e-8628-8f421c900bcb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_070402_069248_5844BF10 
X-CRM114-Status: GOOD (  11.40  )
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

On 18.03.2024 15:57, Florian Fainelli wrote:
> 
> 
> On 3/18/2024 12:46 AM, Arınç ÜNAL via B4 Relay wrote:
>> Hi.
>>
>> This patch series fixes EEE support for MT7531 and the switch on the MT7988
>> SoC. EEE did not work on MT7531 on most boards before this, it is unclear
>> what's the status on MT7988 SoC switch as I don't have the hardware.
> 
> We've received your patch series 4 times and this was the same thing with your previous b4 submission, can you find out what happened? Thanks.

It looks like my branch name was too long again. b4 0.13.0 cannot handle
branch names that are too long. I'll keep it shorter for future
submissions. It'd be great if Konstantin could provide a specific limit.

https://lore.kernel.org/all/20240205-silky-sensible-puffin-8e23ee@lemur/

Arınç

