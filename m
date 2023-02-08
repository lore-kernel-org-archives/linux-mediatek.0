Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34ED7C636D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 19:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcpu1yCq+3DBiPRJXefpNsm5ZTj36dGxZgbWh1zl2Wc=; b=D+kPzJI/vDPqnMZMS5FxbbcLVl
	C2BdDYq106PIQbONVdel0Iu0nLm+V1flNbWVT5kHW/ycxSkB3muFVsbV5ALUdvWFIpIZrY2chU/1F
	0CiKfj9XQmMHiZoyhV9aVlcmg2hrH7sN+fbHlXrjWgzwCiQcnnecmrAboga5qBN18QBVdsXHE+6mY
	GQUzoyyLTUG5OPJ/BN9ohtkS1ECBvkF2ze4jOrd+Zw/wrLkaP9JRiGbfdw0TtEZqWrTn/eBR09Fcc
	gVIs5KMeOQx9zA7BzUm24hHYxnOW2yzgLcvQCZZQrP4b+tp06apxIy2lmTGAJHfdxD3peJPoXgSul
	ZPHS+3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqNf-00GmZJ-LV; Wed, 08 Feb 2023 19:45:23 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPqNc-00GmXn-Qn
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 19:45:22 +0000
Received: by mail-wr1-x429.google.com with SMTP id ba1so13869970wrb.5
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Feb 2023 11:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dcpu1yCq+3DBiPRJXefpNsm5ZTj36dGxZgbWh1zl2Wc=;
        b=OUMIe+EUTora5rHVb+d21xKIyvYPdoz406FHHrW6RSmrr1mUDgKsVQDeH0UKgh22Ql
         AtTKQpt0qbnCacxQygthd0EDmjV/qKaKc+to1IA9AfGNjW/r7gZM8fRMa4CBMeDVirVH
         G/aTyA7IVNX2EYsBQdifTzOYosyRRwM7OPiBahplZxkVL0sfEHSXmwtdOg1VqJpJn22b
         +xOE6LbTvh2BABTFmRV8ovZxc0IegFcGAMwsn9E3+wGKPtQWdvC7zscxO6ZoIsNNzJRG
         CyWVUPOn0Cr7iRhP2jBUMSziSQE7Uuu0fbuWY+PNi3E8yBqf9g4BD1q/wqwZIAaKxWGu
         c7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcpu1yCq+3DBiPRJXefpNsm5ZTj36dGxZgbWh1zl2Wc=;
        b=3lidjZYo2rlTu9piaL0qhU2Wxy5fu7LqIN0oJeIYRPrmLt/UMzo7qLUkCxpZyb3voT
         +SRHyMtEx4PYl/HN31rYVWXerdKoksK/OyCBcI7h8KeRq3p6to29TQmD81I+VaYQuYy6
         gBO30RyyNpoYFARWg/rIS/3quZkSneJbk1PJJmaDqfM3EC5czuXlknZ9FlEgUy4oE3Mk
         pGQlAxw3XaG/c0y0wluIHMm63AZb0pQCLCASj0/qbP8iedh1bkUEFOjx1v3fEpkwgGqN
         Dd+OqdzoVDt1uV8hyo9jS3z+mcomWZZYddAFs1+veUv2m9DlOs1UPPoAVlnvLCQXEKk4
         rJuQ==
X-Gm-Message-State: AO0yUKXkpo/icj7U7fZo70YN5PXi3Xg/KXDV+pG0zU7F6nsVDqLGoZOG
	0PgbSe8uFsZnIqeNuhlx6r5PNQ==
X-Google-Smtp-Source: AK7set/cLC16HbjIHc8L0GJze/Ks8KeQf93wbv9Iks6HkOhitRKQ6p3rFwPCVNyTYlGFAalDdr7o7w==
X-Received: by 2002:adf:dcd2:0:b0:2c3:db61:20ec with SMTP id x18-20020adfdcd2000000b002c3db6120ecmr7936860wrm.23.1675885517564;
        Wed, 08 Feb 2023 11:45:17 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id a18-20020adffad2000000b002c3f280bdc7sm4802289wrs.96.2023.02.08.11.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 11:45:17 -0800 (PST)
Message-ID: <3bbc55b8-6b12-4e81-026d-75e0c9116a7b@linaro.org>
Date: Wed, 8 Feb 2023 20:45:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] time/sched_clock: Export sched_clock_register()
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, walter.chang@mediatek.com,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com,
 Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <20230208094813.20874-2-walter.chang@mediatek.com>
 <e1a89a4e-8a0d-47e1-a8fd-75ea152ef816@linaro.org>
 <ad3a5c30-5062-55ae-7908-c0a127bec5ee@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ad3a5c30-5062-55ae-7908-c0a127bec5ee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_114520_935438_F66AA7AC 
X-CRM114-Status: GOOD (  16.51  )
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

On 08/02/2023 20:41, Matthias Brugger wrote:
> 
> 
> On 08/02/2023 15:24, Krzysztof Kozlowski wrote:
>> On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
>>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>>
>>> clocksource driver may use sched_clock_register()
>>> to resigter itself as a sched_clock source.
>>> Export it to support building such driver
>>> as module, like timer-mediatek.c
>>>
>>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>>> ---
>>>   kernel/time/sched_clock.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
>>> index 8464c5acc913..8e49e87d1221 100644
>>> --- a/kernel/time/sched_clock.c
>>> +++ b/kernel/time/sched_clock.c
>>> @@ -150,8 +150,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>>>   	return HRTIMER_RESTART;
>>>   }
>>>   
>>> -void __init
>>> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>
>> Is there a non-init caller?
>>
>>>   {
>>>   	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>>>   	u32 new_mult, new_shift;
>>> @@ -223,6 +222,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>>>   
>>>   	pr_debug("Registered %pS as sched_clock source\n", read);
>>>   }
>>> +EXPORT_SYMBOL_GPL(sched_clock_register);
>>
>> Where is the module using it?
>>
>> You need to bring users of these two changes, not just prepare something
>> for your out of tree patches.
>>
> 
> I'd propose to add at least one driver that will need these changes, to make it 
> clear why you need that.

... and actually test if the system works fine when booted from such
clocksource as a module. I have doubts that and unfortunately folks
working on GKI like to put whatever stuff from mainline into modules
even if it does not make sense for us (see long time ago discussion
about pinctrl drivers).

Best regards,
Krzysztof


