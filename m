Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88BDC05052
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 10:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lv+abx3QslGUToUb7vrRoug6JE3seu3NREsfOC/kEXo=; b=XlSyEmsKyvjWgtkSCd9a42BaX5
	sVpxySvbOM4IyHE0xMwL4fE2SKdTxEnsUjuNbeeeLUY/y+z0YiEaiARgqb7EK8ygLYIMSCsQjAMXi
	q7RVN0F57jChOXu7dJoK+CMJ+mISAKgb7lvHlGe2UALhJlbq84G6+PbELrO1jaaQX8Sx8fhiXutAS
	1UD40IMia6ZE8sUM5ZvRufYRrejaiu5sUd8uvF5Zee3k2aiwVCdy826kH4BcN4baZV0PwKjtwqHpc
	ujGEDpCNqArWsG4Sh9oaXfuUxeIwTMG3raoYNC8qtxKycl8xWC6EsPFuFAurojzfkotRxoasmTyRw
	qaKpDqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwNd-008BRQ-1e;
	Fri, 18 Aug 2023 10:06:57 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwNa-008BQU-1P
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Aug 2023 10:06:56 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso7294595e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Aug 2023 03:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692353211; x=1692958011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lv+abx3QslGUToUb7vrRoug6JE3seu3NREsfOC/kEXo=;
        b=wxBr7P0QZmtmISzuXDXdgRfFhn+K3ceIA5ful2/bkKogmWFfEg4BN2B3yTOCJEU/uD
         ke4BAKo+cU0CHmiGV2FVxTcgSo1vCJDr8MCx1l7PVOMQ/AEPdOk/8gDWDp24jtam+PgJ
         kn05bDVjpzmNozWUSgVYqa1TA4CTX9B1xhLcxj2QrEbDtWS1qnCRWu2wT1K9p0liSKPO
         UuYV9tLh6BLckNIX20BSW3EXqkSVq7qUXgsewcT0eQePEcBf5kC/T1tZEs2ytTbIl1Iq
         im+Z438XNmcS/Rba7Krt7L4EFwE4s+Fdgg0WOPf//fN1krGnen1O2ktUwjpjLn/8StF7
         qLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692353211; x=1692958011;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lv+abx3QslGUToUb7vrRoug6JE3seu3NREsfOC/kEXo=;
        b=l+orjaIxbgK89cleZJb6cDEwnJRACaPfn6GiVggbQEM5vxRIyPt4/iLWB7CCnQKxfm
         46gqnrHUVdwVxZBPQaZ+Ncga26wE/OfpWI9C5QdGvxvwsyLOizdTEr1G2ruLM3MOIbEr
         cdUZoucTLWc6ltUMmd+vYcsn/3ZIw+6RLJqOSjmlnSALJ3OSkxYjyYcx8nyQS6DmlqiF
         YQhwNM9bE+gZrsQagrXgOs5GIXcfznSy+M4a4B71tMYK6jKnsgfjLyYJw9D2cJrgqsvb
         vbwYxW2x2s/zIi2gKRXxVj1ZuM2REaKZdbgZjuREQKz+pU8Q05nEOzsyFRhhlQxoyWcj
         uxYg==
X-Gm-Message-State: AOJu0YwjOS32bl2Ffcaglwdhen+23PVfTzRjTV9V3i4S7G3fRofyFm0m
	VIIEEy34pIPkaSHwzmOkS+LqIQ==
X-Google-Smtp-Source: AGHT+IFzWYJ6guNyIaVwmBfXsC7UfY0AV5H0XFxUUmTuqKkczLtSuqqAl+UGrkLoNy/+K3owMK1lWw==
X-Received: by 2002:adf:e50b:0:b0:317:57f0:fae with SMTP id j11-20020adfe50b000000b0031757f00faemr1627817wrm.63.1692353211029;
        Fri, 18 Aug 2023 03:06:51 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id k10-20020adfe8ca000000b003198d274208sm2250783wrn.86.2023.08.18.03.06.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 03:06:50 -0700 (PDT)
Message-ID: <48283a14-d2af-630c-40c0-d0316cd30d69@linaro.org>
Date: Fri, 18 Aug 2023 12:06:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] clocksource/drivers/arm_arch_timer: Disable timer before
 programming CVAL
Content-Language: en-US
To: =?UTF-8?B?V2FsdGVyIENoYW5nICjlvLXntq3lk7Ip?= <Walter.Chang@mediatek.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 =?UTF-8?B?RnJlZGR5IEhzaW4gKOi+m+aBkuixkCk=?= <Freddy.Hsin@mediatek.com>
References: <20230717090735.19370-1-walter.chang@mediatek.com>
 <9c428d54c07f60e79c63119621bf03b797f79a37.camel@mediatek.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <9c428d54c07f60e79c63119621bf03b797f79a37.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_030654_483916_24E91F17 
X-CRM114-Status: GOOD (  15.26  )
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

On 18/08/2023 11:29, Walter Chang (張維哲) wrote:
> On Mon, 2023-07-17 at 17:07 +0800, walter.chang@mediatek.com wrote:
>> From: Walter Chang <walter.chang@mediatek.com>
>> 
>> Due to the fact that the use of `writeq_relaxed()` to program CVAL is
>> not guaranteed to be atomic, it is necessary to disable the timer
>> before
>> programming CVAL.
>> 
>> However, if the MMIO timer is already enabled and has not yet
>> expired,
>> there is a possibility of unexpected behavior occurring: when the CPU
>> enters the idle state during this period, and if the CPU's local
>> event
>> is earlier than the broadcast event, the following process occurs:
>> 
>> tick_broadcast_enter()
>>   tick_broadcast_oneshot_control(TICK_BROADCAST_ENTER)
>>     __tick_broadcast_oneshot_control()
>>       ___tick_broadcast_oneshot_control()
>>         tick_broadcast_set_event()
>>           clockevents_program_event()
>>             set_next_event_mem()
>> 
>> During this process, the MMIO timer remains enabled while programming
>> CVAL. To prevent such behavior, disable timer explicitly prior to
>> programming CVAL.
>> 
>> Fixes: 8b82c4f883a7 ("clocksource/drivers/arm_arch_timer: Move MMIO
>> timer programming over to CVAL")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
>> ---
>>  drivers/clocksource/arm_arch_timer.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/drivers/clocksource/arm_arch_timer.c
>> b/drivers/clocksource/arm_arch_timer.c
>> index e733a2a1927a..7dd2c615bce2 100644
>> --- a/drivers/clocksource/arm_arch_timer.c
>> +++ b/drivers/clocksource/arm_arch_timer.c
>> @@ -792,6 +792,13 @@ static __always_inline void
>> set_next_event_mem(const int access, unsigned long e
>>  u64 cnt;
>>  
>>  ctrl = arch_timer_reg_read(access, ARCH_TIMER_REG_CTRL, clk);
>> +
>> +/* Timer must be disabled before programming CVAL */
>> +if (ctrl & ARCH_TIMER_CTRL_ENABLE) {
>> +ctrl &= ~ARCH_TIMER_CTRL_ENABLE;
>> +arch_timer_reg_write(access, ARCH_TIMER_REG_CTRL, ctrl,
>> clk);
>> +}
>> +
>>  ctrl |= ARCH_TIMER_CTRL_ENABLE;
>>  ctrl &= ~ARCH_TIMER_CTRL_IT_MASK;
>>  
> 
> Gentle ping for this patch.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


