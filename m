Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F599D15DA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-Id:Cc:To:Subject:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++UZr9PQbZadTgMH/kkDDCGV7AiFsRcPEYvhoc8RkHU=; b=Or6ctHyXG4606SmEYhoa4pPq2Y
	mb82hRaCU0hgzcfnhAkxAguKbrXs1md7dKwg8Abzziu4EtxzYggDAK0n+PZLb4i+fN+pJ+5sIHZvw
	6Kaf2Cao6uh85Tgf5P0l3bouz1c42A+SMZLS5aJQ9ww2sOgf1r+dceZtkQDfX6jh916Zzgz8AH0GU
	Bdh/NS16+Yo959SbKk/hcCl8gi4LUZqeqYGEtcB4taPfEtPrbbF8Tp5KE1IOARxgakh+EQ/7ZaIk8
	gCAh+A7lWpU7YPc9tTa1vxqwyiywdLL8jY9zR/kLBKsI5q9fMBzJBXKAspP1mCkA1A1jFVvKchqex
	U54kFU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2toy-00000007h7A-2ny9;
	Mon, 21 Oct 2024 14:55:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tST-00000007cuZ-0d9g;
	Mon, 21 Oct 2024 14:32:34 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1ecbso5794439a12.0;
        Mon, 21 Oct 2024 07:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729521151; x=1730125951; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=++UZr9PQbZadTgMH/kkDDCGV7AiFsRcPEYvhoc8RkHU=;
        b=T4oVResbtVI1bCrmNdyRv4nK3AP1O754mSZ8XjPk6L5g/ZlHCJhR2OSi16fcTOSR1a
         mbJeF3tMV08h2ZOaymSyO4govv04hmd9ACB/f5UCWCCM/zGFkHpC8UNs/7g04gsh2laK
         QfwIAbR7bEcimPidFVjUZcxp+0+jvPUzEvYtWb4dscxo8o1neS5A4Ci1IMvKUMa46zvc
         KAptT4pyVc90U6ZNtYz333iG5y+UMdH9jjNINrDjc6OKJ86yEqh3OkC+14nNVeS1yGDN
         tA0EQY7knlHt8dfURytLzaxOr1Y6t8tMe4a1fi5Fq6FJK1Or8027GKxVB748u47KWjjA
         3Vlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729521151; x=1730125951;
        h=mime-version:references:in-reply-to:message-id:cc:to:subject:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++UZr9PQbZadTgMH/kkDDCGV7AiFsRcPEYvhoc8RkHU=;
        b=jFUKTbPQzQ59OtWuZI0XgaE0A5nP6wcRJYqeDf2WeBxiBMOKEWJUwGmYP8hDrkUtxH
         OwlN6mAwvtiF08HpqwIFOMKHgqaZvvjYR+N5a2J6d2XcwGuTKJ9r26zsvIXlwTPF5Lun
         n1r7C8lF9F6wCftrv30KcfvSfusBabw+fN4ootybEFBo6EX8zxIlj3Nfsvw+LilXy7K/
         J1m5mx6mVIYiXub6FZlbBRyO7fYhgjdmt0S+b9RoLMzWPHjCimRcxeeYeBMYH+gj/HN8
         /BQpPGPWRPGXjI2VVw7EWMGSHm/hr92SPHeaPGfaURwzUGb6Hs/CbnN8JGH8Q2foW4oO
         jzSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoaoqggF5r43hSX3OLd6mTZrOg+1bnHgk6JWjs/451RHudb20wxYN0ouAiRIH6uF1QQ6dtEO7Y6xk1Cw/Tp14=@lists.infradead.org, AJvYcCX1UsPUoMQDs46jOtEXjYM1ae86vyK5RosGr9OnST2W2gh7X1v0e0btc0xj/QNHADh8UqZlV6favqVfT/Wy0EoO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3lkj9f5XUMiIWkkj7RngxQcKgs2/T3kBJw2JZiW7yU9Jo6LcL
	eDwB2WQ/CYEfioMz6MZ4gjKt5L0SJvFYqLCIr28O1sLTPflp7+L/
X-Google-Smtp-Source: AGHT+IHFsBGfdQeumuaHld7GyjAWhQPovdu4Pq47U4znM0Gwx2Pk+r27FwnNH4GkIvp+dZhxEiN96A==
X-Received: by 2002:a17:907:724e:b0:a9a:1739:91e9 with SMTP id a640c23a62f3a-a9a69a7638emr1209590566b.24.1729521150626;
        Mon, 21 Oct 2024 07:32:30 -0700 (PDT)
Received: from [10.32.3.23] ([95.183.227.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a91598f1csm210212966b.199.2024.10.21.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:32:29 -0700 (PDT)
Date: Fri, 18 Oct 2024 10:10:04 +0300
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 2/2] watchdog: mtk_wdt: Add support for MT6735 WDT
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Message-Id: <SKIJLS.S7FSW9OJT5K82@gmail.com>
In-Reply-To: <ccacc376-8494-4941-a4b8-dbb4d09914ee@collabora.com>
References: <20230302124015.75546-1-y.oudjana@protonmail.com>
	<20230302124015.75546-3-y.oudjana@protonmail.com>
	<0398e95e-dbb8-2e41-7b36-12e36b8729f0@collabora.com>
	<f9b09f59-a222-4b75-a6ef-c7fb7c2cff9e@gmail.com>
	<9bd327fb-5f67-453d-947d-4742134b32b1@collabora.com>
	<WOMHLS.HLNVQWWVER5T1@gmail.com>
	<4e3545ce-5740-48b6-8c10-666548d31908@roeck-us.net>
	<ccacc376-8494-4941-a4b8-dbb4d09914ee@collabora.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_073233_316994_8D950FD0 
X-CRM114-Status: GOOD (  56.07  )
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


On Thu, Oct 17 2024 at 17:16:54 +02:00:00, AngeloGioacchino Del Regno 
<angelogioacchino.delregno@collabora.com> wrote:
> Il 17/10/24 16:09, Guenter Roeck ha scritto:
>> On 10/16/24 23:43, yassine.oudjana@gmail.com wrote:
>> ...
>>>>> 
>>>>> Say I don't want to use the watchdog (which I don't, all I need 
>>>>> from TOPRGU is the resets, I don't care about the watchdog). 
>>>>> Not starting the watchdog means I can't reset the system 
>>>>> because all mtk_wdt_restart will do is make TOPRGU send me an 
>>>>> IRQ that I have no use for.
>>>> 
>>>> If you don't want to use the watchdog, then you don't need to care 
>>>> about bark
>>>> interrupts and you don't need any mtk_wdt_restart() functionality 
>>>> at all :-)
>>> 
>>> I need mtk_wdt_restart to restart my system. I shouldn't need to 
>>> take off my phone's back cover and remove the battery every time 
>>> :)
>>> 
>>>> 
>>> I think what Guenter said makes sense. We should make sure the 
>>> watchdog is started when calling mtk_wdt_restart or at least 
>>> configured in such a way that we are sure it will issue a system 
>>> reset.
>>> 
>> 
>> It is more than that. There is no limitation in the watchdog API 
>> that says
>> "you must only use the watchdog kernel driver to reset the system if 
>> the
>> watchdog has been activated from userspace". Such a limitation would 
>> be
>> completely arbitrary and not make any sense. It is perfectly fine to 
>> enable
>> the watchdog from the restart callback if needed. Actually, all 
>> restart
>> handlers in watchdog drivers have to do that if they indeed use a 
>> watchdog
>> to reset the system.
>> 
>> Actually, I am not entirely sure I understand what we are arguing 
>> about.
>> 
> 
> Guenter:
> We're arguing about bad configuration and lots of misunderstanding.
> 
> Regarding WDT_MODE_EXRST_EN: when enabled, it enables an external 
> output
> reset signal - meaning that it's going to flip the state of a GPIO to 
> active
> (high in Yassine's case - as that's configured through WDT_MODE 
> BIT(1) and
> his 0x5c means that it's flipped on), signaling to another chip 
> (usually,
> the PMIC...!) that we want to reset the system.
> 
> Explaining what Yassine is doing with this commit: he is flipping the 
> IRQ_EN
> bit [BIT(5)] in WDT_MODE.
> 
> When bit 5 *is set*, the watchdog bark event will only raise an 
> interrupt and
> will not reset the system (that's left to be done to an interrupt 
> handler in
> the driver).
> 
> When bit 5 *is NOT set*, the watchdog bark event will trigger a CPU 
> reset.
> 
> Now, my confusion came from the fact that he's trying to fix a 
> watchdog bark
> event so that it triggers system reset, but I didn't understand the 
> actual
> reason why he wants to do that - which is powering off the system!

I'm currently aiming for reboot, not poweroff. There was some point 
during development where holding the power button wasn't enough to 
force restart and I'm still not sure why that was happening but it's 
working now. That's why I was removing the battery to power it off then 
turn it on again with the power button.

> 
> 
> Yassine:
> 
> You don't *have to* rely on the watchdog to reset the system, and if 
> you use
> only that - especially on a smartphone - I'm mostly sure that you'll 
> get
> power leakage.

I did notice that when I tried poweroff. It didn't fully power off and 
eventually drained the battery. But again I'm not looking into fixing 
poweroff for the time being, I'm focusing on reboot. I'll probably ask 
you again about it when I look into fixing poweroff since you seem to 
know something about the matter.

> 
> Before you read the following - please note that this is platform 
> dependent
> so, take this with a grain of salt: it is the PMIC that should get 
> configured
> to take your system down! I have a hunch that this works for you only 
> because
> the platform will reboot, and then the bootloader will decide to turn 
> off the
> system for you by default (that, unless you send a warm reboot 
> indication).
> 
> That flow looks more like a hack than a solution for an actual 
> problem.
> 
> 
> Now - whether you want to fix your platform or not, this is out of 
> the scope
> of this commit, which is - in the end - still fixing something that 
> is wrong.
> 
> Effectively, as Guenter said, if the watchdog is never started, the 
> restart
> function is not going to reboot the system, so yes this problem needs 
> to be
> fixed.
> 
> There are two problems in this driver that can be solved with:
>  1. Disable IRQ generation when *no irq* is found in DT; and
>  2. Implement support for reboot in mtk_wdt_isr() by reading the 
> WDT_STA
>     register and by then taking appropriate actions.
> 
> Of course my preference would be N.2 because:
>  - The pretimeout way is already supported in the driver, and if you 
> specify
>    a pretimeout, then the watchdog will never trigger SYSRST->XRST: 
> this
>    is actually a bug (IMO!!), as declaring an IRQ in DT means losing 
> reset (!);
>  - The WDT_STA register tells you more than just "SW/HW watchdog 
> reset asserted"
>    and that can be extended in the future to support more than that.
> 
> However, I recognize that this may be too much work for you, so, if 
> there's no
> way for you to properly add support for N.2 - I can chime in.
> 
> As for N.1, the solution is simple: check if 
> platform_get_irq_optional fails
> and - if it does - force unsetting (WDT_MODE_IRQ_EN | 
> WDT_MODE_DUAL_EN) in
> WDT_MODE, if and only if WDT_EN is not set.. but that, in the probe 
> function!

I still honestly don't see the point in either solution. N.1 sounds 
like a hack; the interrupt should be described in DT even if we don't 
want to use it since DT is ultimately hardware description and the 
interrupt line exists whether we are using it or not. N.2 is 
unnecessarily complicating things. I mean why should we make the 
watchdog issue an interrupt then in the interrupt handler perform the 
reset? When someone calls the restart function they expect an immediate 
reset. As Guenter said we should configure the hardware to issue reset 
in the reset handler, and I believe that's what I did originally.




