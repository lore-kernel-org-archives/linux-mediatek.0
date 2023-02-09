Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39CFC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 16:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqW+J62u+F38rj1oQkjZ2aXxW+B6eCdB44F8VKcH3q4=; b=c8IATixucMgVulDv5JxVUiMuWC
	JLVy4Z6WIXH5k4ZJ0AMm8TX1tLkoer3tIA+hNWfX+l696NX6q6s+TuTmzFTn5fVDlM4ECLCB16bJn
	JuzveE54+cOYsmgMIqW1A0qkJihaXmbuoA1hm+BLusYASg07/FMj8A0EhkBSab7GbhAuTn4BmsZEe
	3SCScCEz9wlGYv79M3mlWaGF5kGn3cy6u+qt9clALf61Whx7yOuJepQQtprIwGQ5UUdM63McyAVQ+
	N4SQ7cDbLYy95QwJmAjTOCno3tdCy8uUPWFZ/gBNMYkijxExLadKq39J0UA+luEt+g8Enkalw+q+p
	Bx0RiIIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9U8-002MeY-Vb; Thu, 09 Feb 2023 16:09:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ9Tw-002MZn-Me; Thu, 09 Feb 2023 16:09:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 001BEFEC;
	Thu,  9 Feb 2023 08:09:46 -0800 (PST)
Received: from bogus (unknown [10.57.10.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B65A3F8C6;
	Thu,  9 Feb 2023 08:09:01 -0800 (PST)
Date: Thu, 9 Feb 2023 16:08:58 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, walter.chang@mediatek.com,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	John Stultz <jstultz@google.com>, wsd_upstream@mediatek.com,
	stanley.chu@mediatek.com, Chun-hung.Wu@mediatek.com,
	Freddy.Hsin@mediatek.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] time/sched_clock: Export sched_clock_register()
Message-ID: <20230209160858.ujz26zcnizap5lqw@bogus>
References: <20230208094813.20874-1-walter.chang@mediatek.com>
 <20230208094813.20874-2-walter.chang@mediatek.com>
 <e1a89a4e-8a0d-47e1-a8fd-75ea152ef816@linaro.org>
 <ad3a5c30-5062-55ae-7908-c0a127bec5ee@gmail.com>
 <3bbc55b8-6b12-4e81-026d-75e0c9116a7b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bbc55b8-6b12-4e81-026d-75e0c9116a7b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_080908_876654_22D4D200 
X-CRM114-Status: GOOD (  26.49  )
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

On Wed, Feb 08, 2023 at 08:45:15PM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 20:41, Matthias Brugger wrote:
> > On 08/02/2023 15:24, Krzysztof Kozlowski wrote:
> >> On 08/02/2023 10:48, walter.chang@mediatek.com wrote:
> >>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> >>>
> >>> clocksource driver may use sched_clock_register()
> >>> to resigter itself as a sched_clock source.
> >>> Export it to support building such driver
> >>> as module, like timer-mediatek.c
> >>>
> >>> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> >>> ---
> >>>   kernel/time/sched_clock.c | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> >>> index 8464c5acc913..8e49e87d1221 100644
> >>> --- a/kernel/time/sched_clock.c
> >>> +++ b/kernel/time/sched_clock.c
> >>> @@ -150,8 +150,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
> >>>   	return HRTIMER_RESTART;
> >>>   }
> >>>   
> >>> -void __init
> >>> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> >>> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> >>
> >> Is there a non-init caller?
> >>
> >>>   {
> >>>   	u64 res, wrap, new_mask, new_epoch, cyc, ns;
> >>>   	u32 new_mult, new_shift;
> >>> @@ -223,6 +222,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> >>>   
> >>>   	pr_debug("Registered %pS as sched_clock source\n", read);
> >>>   }
> >>> +EXPORT_SYMBOL_GPL(sched_clock_register);
> >>
> >> Where is the module using it?
> >>
> >> You need to bring users of these two changes, not just prepare something
> >> for your out of tree patches.
> >>
> > 
> > I'd propose to add at least one driver that will need these changes, to make it 
> > clear why you need that.
> 
> ... and actually test if the system works fine when booted from such
> clocksource as a module. I have doubts that and unfortunately folks
> working on GKI like to put whatever stuff from mainline into modules
> even if it does not make sense for us (see long time ago discussion
> about pinctrl drivers).

Just to add, system boot test with these as modules are not sufficient
based on the usage of such timers. I am aware of systems where arm
architected timer are functional in normal running state of the CPU.
They may have bugs/errata where these arch timers(mmio access) are not
available when CPUs enter low power idle states. Generally, CPUs enter
idle states on boot, but one CPU may not as it will act as broadcast timer.
With this added timer, they may achieve all CPUs entering idle states
properly.

In short the system might be bootable w/o such timers but not power
efficient. We need to tests that involve loading and unloading of such
modules to see if the transition between this timer as broadcast and one
CPU itself as broadcast happens correctly and system survives across such
loading and unloading of the modules.

Note I am not for/against allowing the such timer as module, but just
adding possible testcase to pass to consider if we are allowing it.

--
Regards,
Sudeep

