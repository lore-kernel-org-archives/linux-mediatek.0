Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC283606A337
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 05:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KkOiUkRd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XdsDbqZT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=; b=KkOiUkRdI5kmixOl4eUKYUaqxR
	nCNCLNiWDfAJhYKh/hkriNCPCEjJgtLUWIjW8P5g6JgSzQuB8xQycpRIeVPxkto1IWtLZWEw6uS/U
	yeF+Y9nOS1VsgLhFur6NYj17BOKEW8snqZNlZnit4ULpJRtcCoY0ko8UpltEWpfuAOYDYbDPFkFbv
	0BJK+pRE/gaczfYlDdVLcjbBE38xGaCaKOXrZEAdDcgXlhU6TPc5ZaYkyntN9FzsrVejZ03vGNtgm
	APwyNnxYKTE84VNECfXoMc8eji0vACxUZn6xr2WIhDGvS7w5JZ0c1AlKySv02Z0Mq8fLqdyo7MGNJ
	0GLD7B0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRoG-0000000C6pv-2muX;
	Thu, 26 Nov 2026 05:14:16 +0000
Received: from mail-oo2-x06.google.com ([2607:f8b0:4864:31::6])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWRoB-0000000C6nH-2gin
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 05:14:13 +0000
Received: by mail-oo2-x06.google.com with SMTP id 006d021491bc7-6ddeba3e85dso1523234eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 21:14:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795670050; x=1796274850; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=;
        b=XdsDbqZT9OoiNYKLyUPUxPDR0N1aaTsDGdYPZc6C7BFaOZ+xc2GKE/id1tSZbLc4g6
         DuX6HpS7CL7rWzX9rYPrmRTtQ4hHF7tD4KmFpbDFcDblFMXxUrQJuPvs8cqPYHwthm1r
         vvf9dKua/Qu7uWgdMjznvlgLLix9EF2jTigUhLrodzct+r/jd/w0BJdMEnoJJ4ayEaaf
         IKEBJIZPGgRcHsuaho9GE6xmAFUmTnMZlC+/W/Y9GjbRjIZJF6BBqdDvRPTIJACXrh/6
         uw63SQnd42v9Yh/+uslLOMHk7QxNmVpJI/3VMjsCwAiKvHq1I/A88EZbwpcIeugweO23
         pbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670050; x=1796274850;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IQC0rmb60+7fGUy4+e3ojRybTycBzBk8+WNROPwteGo=;
        b=RXbo6V73TWJsLcW9smWKKwqAIzcjvzPeWio3oX9IG4IxLF11MRdy3TGJFLOTXpcrbU
         dL06nW08c0qX12InPbgMMlartQaCYbjfedKPzwUDYRZGhnwJRCQ3nSXDpQJ2EC51ExN+
         /06TWsIsO/oduYZn67LTPNpffmVZX2ZqR7uC+Du42E2jggvPOL52vgVENJNM0SBMHGol
         hIWy4osEFLYGod8HYIRdJurOrgId4Cx0KdPX9VZMljW74kWgr0ou1Cl0G98NC6Q3Egd/
         Ac8Bpp5S8GmQX8UlDwIgNdj1CZ5Q/17Kh4Jnvd/xMh4PflkHQDEHvo+inCjjUJR0Q6Lq
         Xdog==
X-Forwarded-Encrypted: i=1; AL+hErHWGl5fV4Ottc9wX/IUcqQJaGAtSGqtZgrGigpv9/MPKLMmCRQ0Z3xA8+/5rEUax2ZrVfV/APDW8e/DY8gemg==@lists.infradead.org
X-Gm-Message-State: APuU4Z89+ne1e9Ielrb1vSGBP1LW4G0+RFliaS3CiEcCg45YHbXf05pc
	f54d7oLqBhAVVFfzJB7d6oKSSjGVcAfzp4hljy8EpNemYtft2gneoCXK
X-Gm-Gg: AZFdTZd4VzJE53ZPzJoWGVu9FnlF/1cazVUjY642rG/ob3DnaWmeEWWccSC9g+IJUND
	d2Al9HaeO+xAnOQxzTyiqN06OQHclIXYC9AQiMzL2cm5I14ZYMT2uIjKcZ8gOkkCgVGVulBrMoP
	NxNtZI/W2tZNOYNsN1Bx77n0X+ZpKYYjXFlf0PgFpJKKWia+KEeVC7sztPG/OxerFjt+r81NBVF
	ibqUX5XLuX4hYsDOONksIPNzE4n/5EzF/uWDmOXLJVNbS8FKBf6rYBWLZLVj9LXk60twQzxKdtH
	3jn0+6+1HP5OIXtMmPlGOJDacWmlWr4SCEKUcVzvvhmbu1WUzvZ3Jg7jm7BTH8VxsKWZpfeze0v
	lxY0JCMQ9DNbbHskmcJWtJGt+r8u73Ug+6hDvXNI38w+/cxXLWdC3xTQ38rM7h8bo3sjDBOVGlp
	eQxm1akfF2ZR5ySK9e0B4GlVGUkI56od1/M1b5ouiSn8Uw0QON5esuhe8mhUt0eCtl1EEcHE2wn
	PJgTRWzw94BkmV1pv2M5hbSyhV1e0Bif2H1tpJxUEMMQpFx/EJnPgOu9ddBUnsUpr8itX+itpe/
	tZs6yfW7QMr0ZMqX/xfpVBvmPch2IOsWXEU=
X-Received: by 2002:a05:6820:83c2:20b0:716:c772:c70f with SMTP id 006d021491bc7-71b39623cd7mr12571634eaf.86.1795670050407;
        Wed, 25 Nov 2026 21:14:10 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm13907873eaf.13.2026.11.25.21.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:14:09 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 23:13:50 -0600
Subject: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuYMrUgrk+9hGAg94KKleBCiI
 by7ARdH1n/4/gVGEqYRCrWA0Mwjxx4KZRIFdVf1LSF7KBSY1ORap2ecOJBgIM/VRA9shwlZXhj
 Fk2DlrCPv8mvjMkgUDEINv3f+XiYKOh6nKJ/9NuutHoRnjRpzr71vrtYak93aUPHzVMewfX6Iu
 RxALJksz1Jyxv8j5bquXwydN+QNAQAA
X-Change-ID: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670047; l=4132;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=sn1/LETHb9l5ZV1gGwt2OIOVEadtpiYZmU8VXT/KLM4=;
 b=Fspx+wv2picpFbsKN9ogP399KLyj59R3MswLn7ymZsrv0ULnFVlAH1GfHX93CuEIG85Yc6w2A
 iZtsCrtCZ4pD4u29I631RHiV9upWNfX/oTc7T/+NexXnKxgAnX0Wje1
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_211411_768561_86CF5D17 
X-CRM114-Status: GOOD (  21.14  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since the driver probes as a platform device, the GPT clock event is
registered late in boot, when PSCI CPU idle may already have put CPUs
into a state that stops their local timer. Those CPUs wait in the
oneshot broadcast mask on the hrtimer broadcast, and
tick_install_broadcast_device() arms the new broadcast device to expire
at once so that it wakes them.

mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
clockevents_config_and_register(). The forced event fires while the bit
is clear, the status register stays clear, and the waiting CPUs are
never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle state in
use, this hung the boot in 20 of 40 boots; with this change it booted
16 of 16.

Enable the interrupt before registering the clock event. The IRQ line
stays disabled until enable_irq(), so the handler still can't run before
the clock event is set up. With the bit set, the timer that
mtk_gpt_setup() leaves running could latch an interrupt that
registration doesn't acknowledge, the kind of pending interrupt that
commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
timer before enabling the interrupt, until the core programs an event.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().

v2 answers Sashiko's review of the resend: enabling the interrupt early
also enabled it while the clock event timer was still running from
mtk_gpt_setup(), so it could latch an interrupt that registration does
not acknowledge. v2 stops the timer before enabling the interrupt.
On the MT8173 tablet, with CPU_SLEEP_0 in use and prints around
registration, v2 booted 16 times out of 16. The status register read 0
before registration in every boot, with v1 (3 boots) as well, so the
stale interrupt never showed up on this board. In 3 of the 16 v2 boots
it read 1 just before enable_irq(): the event registration armed, then
delivered once the line was enabled. The tags from v1 are dropped,
since the code changed.

This patch was developed with the help of an LLM.
---
Changes in v2:
- Stop the clock event timer before enabling its interrupt, so nothing is
  pending when the IRQ line is enabled (Sashiko, via Daniel).
- Dropped the Reviewed-by and Tested-by tags. The code changed in a way
  that I think merits that, but let me know if not.
- Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
- Link to the resend: https://lore.kernel.org/r/20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..14723c6f5f5e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -339,10 +339,12 @@ static int mtk_gpt_init(struct platform_device *pdev)
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
+	/* Stop it so that nothing is pending when its irq is enabled */
+	mtk_gpt_clkevt_time_stop(&to, TIMER_CLK_EVT);
+	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
 
-	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 	enable_irq(timer_of_irq(&to));
 
 	return 0;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>


