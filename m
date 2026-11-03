Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA85606A31B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 23:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1wPNyKSp;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OK0wKLB5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Tpy4PRbCAKzUQxsE7QsWxmFHgSXmFy5olOQ9La0VFrM=; b=1wPNyKSpMQE4dhWJ+o9zTgYw3B
	Huu/7FVSy3B8n4vpcT5Ah3Y7iLovuvTvrx1dnA6iAjP13QEtw5NxZGdOg3E0wfn7rHhUgnlhxLtBY
	ovXNIjFVfCiIylHEQVBp+RsVt+NpxEU4jaaQyBh0wV79zI3dTCHqCDRAKFm2RccRl/5maTVkRSVA1
	5otxMezF5bMBRGIOqqIE65nif0fVZnPNW97hHV7uvd1PxVXxsmn9qFZaRWfcGwLzbo8USxgXMxurb
	XWmybeTrQ6xQRSnI8ZU7tXEvgEeMupkZEElNu2hKWaaoGbNOu1SAOPG7/zNMGPWty8u1OoMMBA5Qr
	/yIvVKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONlV-00000003wNJ-07T1;
	Tue, 03 Nov 2026 23:18:05 +0000
Received: from mail-oo2-x04.google.com ([2607:f8b0:4864:31::4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONlR-00000003wLc-0igU
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 23:18:03 +0000
Received: by mail-oo2-x04.google.com with SMTP id 006d021491bc7-702f1150a16so2802eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 15:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793747880; x=1794352680; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Tpy4PRbCAKzUQxsE7QsWxmFHgSXmFy5olOQ9La0VFrM=;
        b=OK0wKLB5QZvsdQU1rRpIMDXcfvE1I9G33BrJnAnMLPfG0Lv7nPH51GEmmbxRv4ULzP
         vJ8B1gZhKSfuMktsitB6QgPviNBclhDn79aDTinKdXutuEGgWDyvWzC3foJXLDi1L/cb
         WKskNmORZaV+EiXCf0v9+riITZIl09wFOdhFM7E8Y2FF+Rw2LYkD7UWfbARh0tJPgyT2
         T0wAJLWwlYZyj+EbclusRGHbHohV4fa7XcoXWx3XizI6Zk28uuwAgbV0YTxus3idguGH
         YeIPIj4SJcuzFykmBaASKGUlCy4dLaw7itqc+9iwx8O0c3hs1niPucittOa6w8uCtm6B
         1fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747880; x=1794352680;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Tpy4PRbCAKzUQxsE7QsWxmFHgSXmFy5olOQ9La0VFrM=;
        b=KcTghBuJPa03EteQ0/N0yRi/CWew+/vjaHk3rXOMkzQwO+dd3U0VfcI3QTxsFazhSQ
         TcrXvNXo26d4izkig5NdMGVEuodvsqbUemvHNDu3LgAZEa4bIRTDn83BlP95pyYQQVXq
         DmuEiZuSVjK3Wz+dsUdrHN6G0p8OeNJPl+xeJ66suPxRJ5GkGgjH1tztt6ztZ2C0dWGc
         6pebFSmOPI/5oJ7HTnCCXNyLPkmLzFK0PDykBH17yWnUUVhFVWjOAfYRCsiI55C8y9k7
         p6c0yq6BXBu1doQtxMYZmvC16OwJLdGYKGxbsc4Edl/Xvq9c+QOaqNj+92WZaM0ZmHJR
         U9pg==
X-Forwarded-Encrypted: i=1; AKwUvBxpMc03Jo5PPD7SlGtOpCStHtD8F4Gr6EZYTbCNeayI0h9AwKkSlxtd+pDJ5dtrCJud6fuUlSgxiAGPvcvTkQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/2nxticE5TVCGq0IwkQqHFSAw5KUVHS9n2HL9b5httOxES5zbl
	4m44Ivq1slCtyP6u8FdE0ybHkVsZwlXdjI/lITPBVVeRi9hDOvGdn8y7
X-Gm-Gg: AYBFou1xWSYD8CiXki56e1ONEAp9yjZWNCZUWAWkK0Cb1wFdGExr/MpL9qMIps9teNP
	keUGn4SJY+fixUkkVqmSzx9DVUCKYdE4+ITG0kEke6tp4D+q3GRo8xh467osIG5y7pMpjefcczo
	PrtwcBhVk1nfO+/tLYTiGPBO3kP6zV94Yh8FitUaVlNWHwCFPusyTpWf5c8So/tEp8u+8KrI6w5
	8rXSJ57j13FTn3tPsBIxih++exT4vSGl/IAVwFt0V2bZJpVYXk5Sbb7wqG3Mdlv1N/+y/n9MBd+
	jPaxColJLifYnFD3ilRRYoYBDHS/cJujteh4gk2PrfiQdIU0n/jx5n12saRc/zFJ+tVjSiO31Jv
	KoumzUvE7Q/B4GkNXjkCGSv3ujLRjrRiciqFWpk0kRjTD+AyV6RIgf3B9dUeb0hM+RktIM8pXFE
	/MouRPMbeiRekGSYVDu+DqvUUIvwhSMam4tBLuLHmz5q84nYB0EDWVG7GTAhnJMuYQbzp/i9J6b
	YWc7HTj0kYYYzRjVRsxYV7Vf5YnrmeaE9oEDdI8OOrIbxxjHtCFu2ackujAhs++KG9sv3J5tc2V
	Om0xoosB92itiVySwKY/YCcHvA==
X-Received: by 2002:a05:6820:55d3:10b0:6f8:92ab:bb40 with SMTP id 006d021491bc7-714f2aa040fmr5152695eaf.79.1793747879615;
        Tue, 03 Nov 2026 15:17:59 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm358638fac.14.2026.11.03.15.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:17:58 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 03 Nov 2026 17:17:56 -0600
Subject: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MWwqDMBAF0K0M8+2AsUVjtlL6EcxVB/HRSSgFc
 e9CzwLOyRmmyBzoZMNXs+4bB3IV8TDHbYJo4kDc1E3rXP2QoitMViSNBYtMRxG1j+yWYBJ955F
 824/+yRXxYRj19+9f7+u6AYLwTM9uAAAA
X-Change-ID: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793747876; l=2356;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=yGcoZIDBoDZaoXv5N00ORiCdvk8UCgSBEFmG1SGHBlk=;
 b=zQlgFfpPbSA2D44pTkzsI0sGU0Rsc6rLUTwqyQEGX2VR7QZAXOcKKsoUPCQGI7WoSIgMJKuka
 qJexhsO3wDwDGxFK9Wmeb+Q4COKXl6pS2/nTm7WQ0H4X8fmjzwU6/s8
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_151801_225155_11DF742A 
X-CRM114-Status: GOOD (  16.86  )
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
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
MT8173 with PSCI CPU idle the boot then hangs about half the time: the
broadcast device is armed at once to wake CPUs that are already idle,
and that event is lost because the GPT's interrupt is enabled only after
registration. Traced on the board with prints in
tick_install_broadcast_device() and mtk_gpt_init().
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


