Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D21606A325
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XlhLD7m0;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GaB8fV1b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ezlQIpBeCLKp3BblnMdViA21cKifwksyw0/26Kc1RZI=; b=XlhLD7m0XMScKy
	TX6NoYuUQU5pSBtM/cMVqYM92jciGZUYxVhNzYoN6x9p3O3k26euuWM7YSLyS11oXQO9PqeLFuG3D
	HOXsaLwKjsdkOG/6+rOKhy5qdhK0NIXr3CrDJBDKjbUPsXL8j7XW1YUdZi7ZobVuSEBLiSD0ds6Uj
	knz5h0BEGtBYKlJlUwAeNC9Wz8SUzLwJy3IPlOsQNTPmCQdwFfLLmkcfQSVvIyI255tDl9uFX38jO
	y7Be2rNW3lYBnYw8V2oOlFmYq7r067QbSj0b+41g2mq0zNSoWqqrpwmev1NvhgpE5S/KjA+SebdiW
	l1nmczjgTmV0Og2afjug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOb7-00000000i0Q-20Sd;
	Mon, 09 Nov 2026 12:35:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQOb4-00000000hzI-1n8R;
	Mon, 09 Nov 2026 12:35:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794227734;
	bh=uz6Pxf5P1OBQ1OuxMZ+mpEwGfimAtMPaXnOF09sKZoc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GaB8fV1byCSC9EYTiwgvgZwhDJLwctYNUTvoOHmIWggOil37/GIKZPA4bDmSiD+r0
	 NakpRnw2P2aP0m/dW2BRc2bEUKMJCwYtXkGCc43pNfdZtp6k3H8oz1kDGJxpqaemiA
	 Ukk6H7yKGtL1Jjw7AY/RLhL8ZyTo+tiW/O1vl4zok85PGzWdsNXLx4TmscyQKCSG00
	 4z345XE6XdYIlhQe7FfGCXWsTR1dsLaonEdKK63OAOss6Orb7qjaYEEWbgt/lBmU3n
	 otvWPS4nm3IGY2KU+H/2FlhtMZH3T0V1Y91pK01Ldt6FhvIRa7sSdQjVYikSLo3mkU
	 D6o1Z+iFXOS8w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E5C317E0390;
	Mon, 09 Nov 2026 13:35:34 +0100 (CET)
Message-ID: <379c2b3d-ab98-4b58-86fe-da2276ede617@collabora.com>
Date: Mon, 9 Nov 2026 13:35:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Chen-Yu Tsai <wenst@chromium.org>, Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
 <CAGXv+5FSG5P3-4-eijurDA68NzcFOXJN5k12WV9SJ+_3wmTjPQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5FSG5P3-4-eijurDA68NzcFOXJN5k12WV9SJ+_3wmTjPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_043538_642393_BD2BFBAE 
X-CRM114-Status: GOOD (  26.31  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 10:54, Chen-Yu Tsai wrote:
> On Wed, Nov 4, 2026 at 8:18 AM Ryan Brue <ryanbrue.dev@gmail.com> wrote:
>>
>> Since the driver probes as a platform device, the GPT clock event is
>> registered late in boot, when PSCI CPU idle may already have put CPUs
>> into a state that stops their local timer. Those CPUs wait in the
>> oneshot broadcast mask on the hrtimer broadcast, and
>> tick_install_broadcast_device() arms the new broadcast device to expire
>> at once so that it wakes them.
>>
>> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
>> clockevents_config_and_register(). The forced event fires while the bit
>> is clear, nothing is latched in the status register, and the waiting
>> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
>> state in use, this hung the boot in 20 of 40 boots, and in none of 16
>> with this change.
>>
>> Enable the interrupt before registering the clock event. The IRQ line
>> stays disabled until enable_irq(), so the handler still can't run before
>> the clock event is set up.
>>
>> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
>> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
> 
> This seems to have fixed the cpuidle related stalls I was seeing. I
> didn't do that many rounds of boot tests though.
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> I do think we should expedite this into the kernel, as a 50% chance
> of stalling is not great. It was even higher for me and somehow I
> had to do a hard power cycle by rebooting the EC to get it unstuck.
> 

Agreed.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>> ---
>> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
>> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
>> broadcast device is armed at once to wake CPUs that are already idle,
>> and that event is lost because the GPT's interrupt is enabled only after
>> registration. Traced on the board with prints in
>> tick_install_broadcast_device() and mtk_gpt_init().
>> ---
>>   drivers/clocksource/timer-mediatek.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
>> index 842d6ee4259e..1b2cbcc2795a 100644
>> --- a/drivers/clocksource/timer-mediatek.c
>> +++ b/drivers/clocksource/timer-mediatek.c
>> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
>>
>>          /* Configure clock event */
>>          mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
>> +       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>>          clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>>                                          TIMER_SYNC_TICKS, 0xffffffff);
>>
>> -       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>>          enable_irq(timer_of_irq(&to));
>>
>>          return 0;
>>
>> ---
>> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
>> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
>>
>> Best regards,
>> --
>> Ryan Brue <ryanbrue.dev@gmail.com>
>>
>>

