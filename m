Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0D6606A31E
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iIRgH8Rw;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VT7OEweE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=; b=iIRgH8Rw/DG9+w6uhiMIKqAQIA
	YJtsjC6J7yEd0nahc+p+XwTUFtxN3Nh3PrJM4iqvvKyqKYo0cyEp7on/jQjnSLJq+uifzyBEkTtvq
	Do2EpWhbymumcT1yvDnBbGqyFnb5YQm3PAABVwuVgY0rQJ2O74MHjnQlFjoxPoCNEfMqU/if5ezR7
	MigPgB+wpF6CDz397MixZjknkVbRRklyWSOYOW1wJ2k2hIhEjVjaoU6q+U88XG9Ii/TGpM9rZv86M
	DpB/XzBiusYh4KnalltK2XJyc8jNyp6v47VCtY628aGq9rKyEtB5QfwtWojRSLAKoAbUEGAtHE45e
	J4Sms7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMJg-0000000BXko-3qyQ;
	Wed, 25 Nov 2026 23:22:20 +0000
Received: from mail-oo2-x0a.google.com ([2607:f8b0:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMJb-0000000BXk3-1Kt8
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 23:22:19 +0000
Received: by mail-oo2-x0a.google.com with SMTP id 46e09a7af769-862aa241d77so2031503a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 15:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648934; x=1796253734; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=;
        b=VT7OEweElA1xcOO15QAesVJ3N1RRm3CQ4JYNjEgSud3zgMiWXDSSlTt8ExFfYO61X5
         9334MZvejOJkyafY+R+BZn3Bk0fWX+RjYB/nPPsXsUdTFtVALPyHmAhOhUZBajRqrUEd
         isJMQMLfO81ekL6ZR9mMMVoLahmka6KDl1em0RF+ZooNMkSRV4Wp5b+RyXzrmKtx9yrM
         RwOXHLyEBVgss8ye9YWqyDlb1n/a/1T7EIsrzrR6wn3AoJn5kMAeQT38EUPpKTxOTvMj
         c6AXTQ0uMsNbJSXUyyx27w9f1CBD0HplNlVF44HXEef+Z+o1CnuBuXM+BoxSuKm1ZTo4
         TS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648934; x=1796253734;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XYTc/DcHZroRC4kTjFqOBmNj9WcBY99HUsdGTOAweDw=;
        b=H93qeb5MJJqpG8uwjqrNupxp9TGGzp3F29z/+WCBpcHkg3Q/6mCU1RgD5w9uNUEIPq
         fKoztTYzxiHafiKdy4MZZ8J0wSpu5h2U6SYADQMF3hJvs7OeyriWwIGpCguRz+NFKupE
         +x5xtO0mfd7Bbrb79WItSW6GXyGlzISFj1XBZXF+rU9RGg4g1JFbxAwoQxUcYi5hHw/z
         wyiGUlibDB73/9b9JKZce+XVKxQV1Ad092bVEaYWt9drXT5B42fLxnw0Gwo+SguAA4Jy
         2NPCIo7qdEl44/VPSs/QcO7AAmlaETPxMzt6eGLnsd+thPJYAieA2911EXroZiYnBOcE
         rKgQ==
X-Forwarded-Encrypted: i=1; AL+hErFfELp/XIzZ8q4LUe31UF6GvgJqArnqX+Zo6HlecbXEFKfZgQsdGPxskJcw+1AVoiqHz8jNub+PIgsAhMPlpg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9yN9qtDaWWhyvxjexnaXT3KBjs+QZFuLb9emFh2Utn2QBtLMy8
	t7gec/uVyvcUqCcdKxDVikOSjbQBV6+UA2QQNB24RgpXhNu2qdzRQ0zZDOlB1ORCz83BJA==
X-Gm-Gg: AZFdTZchuK1IU2H014YdICqvRfDQcfJBa7FaDi+tg0kqGj/QVw22roX01BuFHxmFVuG
	ahvovpHxuf/EjH0iBxE05qYMsXEgOXV9EQcCd2A2MXsLuRTUUYZt/4tBC23KzHuehczLtTrVee7
	6SddIWOwvSSXU/aIUBx6GEdUy/r9GAkcrhNCbLh1VqVV3YiRPV0HapTiZgIIDr46ssQTZx8nJR4
	MbSopx+HJP4rUIfLT2j+VGGwenaNu36SMaw7oSMX8Abl0DX3do4LWA8ySgN39zLmuKoWam3ZMhJ
	QgiAVgLzYA7SCnvWlZhLlGcJrFCEavfiELiAU3jpKAoumyA4CwQeT8QNqZBwX/RAAbSZd8ftgKW
	uCVRTb9pI5EGXVVMe02XH2OkefIZg86qOYogOcuF453rclCHZiZwK7ftEdu+gjgR2ImnEClq6mS
	w2hCXxbC9lrQh+uUPBw3mgPyNqNQ5hUS2K4IM33hEcwGzduQzmNIEjirRbbULGE6nez4ZTNklr5
	Hsh+CZWcCnLDQGk+zog+kUgL9lFr5sM6exStPf+Y6kJblaWlWRkt2EsAhEdIzoSex7LL0uWdVuf
	/0Ih1lB+YFpuQo0R5fyUWU+AnQXyyhW9kLQ=
X-Received: by 2002:a05:6830:4490:b0:862:88c6:1843 with SMTP id 46e09a7af769-8631598542amr20958825a34.19.1795648934144;
        Wed, 25 Nov 2026 15:22:14 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631692d9f7sm14895213a34.24.2026.11.25.15.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:22:12 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 17:22:11 -0600
Subject: [PATCH RESEND] clocksource/drivers/timer-mediatek: Enable the GPT
 irq before registering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-timer-mediatek-gpt-irq-order-v1-1-7e24640e82d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuYMrQQKk4OsDjoahoYeeNFSb
 BuiIby7CU/g/Cf/t0KkwBShESsEWjiyn6ARMhPQP8w0ErKFRoDKVSllfsTEjgI6smwSPXGcE3J
 4ow+WAhpdabK6rAddQCZgDjTwZ9/f4dre2ssZukzAg2Py4buri9zrf8AiUWJppbVDXVVKFafRG
 X4deu+g27btB+wAC3rQAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795648931; l=3241;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Z6bwbYGmDlV4q9VQg3ShvOBo1zqZq9E6xE6bSf63Eo8=;
 b=ze5Kfc37HiJ33uhw5RVqcNwV0MgJgYbChCd5ePQU/CqzWvUHCPjZZNCW+BG7LC0ljYNZu0xr3
 nezA6dNSplsCElHWsNlsqiUEtzGQAQD9zIp8FrdgrcMs3stihwbx7bd
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_152215_469311_43E87473 
X-CRM114-Status: GOOD (  20.27  )
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
is clear, nothing is latched in the status register, and the waiting
CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
state in use, this hung the boot in 20 of 40 boots, and in none of 16
with this change.

Enable the interrupt before registering the clock event. The IRQ line
stays disabled until enable_irq(), so the handler still can't run before
the clock event is set up.

Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF probing")
Reviewed-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Tested-by: Luca Leonardo Scorcia <l.scorcia@gmail.com> # on mt8167
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().

This is a resend of the 11-03 patch with the review and test tags from
its thread folded in. The code is unchanged, and it still applies to
v7.4-rc4 and tip timers/urgent. As a 7.4-rc1 regression, it would be
good to have it in 7.4.

This patch was developed with the help of an LLM coding assistant.
---
Changes in RESEND:
- Collected Reviewed-by and Tested-by tags from v1; no code change.
- Cc Daniel's oss.qualcomm.com address and Chen-Yu.
- Link to v1: https://lore.kernel.org/r/20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com
---
 drivers/clocksource/timer-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 842d6ee4259e..1b2cbcc2795a 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pdev)
 
 	/* Configure clock event */
 	mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
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


