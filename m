Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA56CA5FC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=; b=o7wuIEB0Qs1fFsfB6Bj+HWet3C
	IIchKBjSJllY0kweJrX1dajAtlLi6jtEL+qOSwQz3q0WOr+s5WM7wjpWLdXVyj5KMygJEy1lLV2+R
	/bQTF397e6cfOwzGA8aLmKyHifluLE6s3vg1Lm3hCqlzqaUD+qSDucQMP9TMbxeoZUClX9gL/DuUK
	xETHNL5OHO286x5KM/Lw0sBfqNbsw5AIby4xLelAQmIG7htDrQmr1/QHB+PxQkS+mZJErE21I7Xr/
	QLH5wedKv68/hkwnLEcAJYS6xzofq24x0af7wM8Wp8lJhJKdGGcxc9yr08P25SOwoFYZyVah4Ak0e
	Jx4huHWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaQ-0000000AoKD-2rBl;
	Fri, 02 Oct 2026 07:21:42 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaM-0000000AoH3-1zjK
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:40 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-488811c9ebaso3870075f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925696; x=1791530496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=;
        b=tN8Ah4KPpoIRLXOZHy2ReWzDTQrdR8eAl9qbwyrrpejd+soIEAUcKOSLs5k40CrM0C
         WILZYvM0SZQi8ZRaBlwrPhhTp9h1SHuEEbwnY8nrclO+poVXXQtgk2pUo3EmIIDKegtn
         Z1pyOvpIjxThAasDQ2FRT+UH2Rre7TJa+umaw2N3TM+fN3wFOyqTxabAcaCEAKLMPTLX
         f57e7dOGXBuK/lBuJ2oNViaLLm/SYNe55Uci+IAAwzovsXLaJhS+LHCvq9IxZPnEE3Mk
         2uS4RZUXySBeB/l2w77BHvyK5ADdP8TjxG7RD+Lh8X9HxbrYTLhj7suRWc128Akk8jyD
         IabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925696; x=1791530496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sI3luWa0xM6qfKAltQLZMgTOBsGpdiL/DKkLZ0qa1GY=;
        b=qEhNRIPlXjOEGkuiakWXQCRArKI8+oXX2gi7TpWXKJNIPz6DUCezQoa74qMYozYpJ2
         XbDYx63hF1ytmMv0cpIEhaINqr9VwujflzTrWBP06O2Djx92UjtollyVuSt2BbxBhyCQ
         qMcZR8gyoxPXk1mydKC80aJnPILHUY4apxUG8qdbUZzE9CYfxERomrMvsQmAqPFNmqzh
         8ga8haM/Wk8u2yctR0NoqC5ZWaBVyiwv7Y86VQDlRVooqXwU1BujY4xy8+pwspLwPdRY
         dimhcvx+ykUHf4fuatVGfObMqCDdVpIBZoSx2ZPGzgsN9MMh4sKqva7DSSdOSPsO2d7e
         jl3w==
X-Gm-Message-State: AFq9FYIYFkT6fJUeFCIPd6wO4CfgLnYWoKExY1vrtitUMgsA4qyERb6N
	3BgEcCmeNSQDSGH25YPjdHfs1Rh8Dm3VUdUnoG7CWS43WC/SuyXcnKU44eKteA==
X-Gm-Gg: AYBFou0JiBCNz0gZGes8kVvP8ious1Yl/JSUw6N3/k0Wq4SbThFct+MFPy6x3oke8K6
	JR875DkfTzUq87u8ySMGVy+TVaHsgk3tND6bHUXQwB7IeaSAuMOjMsGZ7Fj8VkUsOv/5UBSzmpg
	hON7Az0jU6oYVdgX0k+TT3M8opL2eqAQiQtDlQ3gLAHmlUtl6ItsVUkU3T1tpIun4eS7xPfHXuh
	BLJn0kLMlPaPzzKYh6oARd6xtGi7LpBNCKKQj8qLgDxo/ZBD1tpfvIlqH/tTZBGdK2N1lCZqcGa
	v0wNUQ18jPk8Wf3azsXajW21SNyqKYmBBf864P0Y21CcqUyO+yXmEHhSJ+niVP32cJVKdf8H8kt
	g643VzhhTYl07nFTP1J63R7FMBQxWLtL+1wMceZEM7hSpfZvSIahT0VOJgOgvnfECW6c2X85dMK
	DEem1B/H/5g6sh50a0MTWf3/tcSUYjNDf4YzO/QM9YQILr0jLCNVC+WsDPcTatZsVQ6w==
X-Received: by 2002:a5d:6f04:0:b0:48b:11ba:1281 with SMTP id ffacd0b85a97d-48b127517b4mr2978023f8f.53.1790925696282;
        Fri, 02 Oct 2026 00:21:36 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:35 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] clocksource/drivers/timer-mediatek: Fix random crash at boot
Date: Fri,  2 Oct 2026 09:19:26 +0200
Message-ID: <20261002072115.169250-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002138_530709_D29EE02A 
X-CRM114-Status: GOOD (  15.16  )
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

MediaTek bootloaders generally enable APXGPT timers at boot. This means
that a timer IRQ can sometimes happen between the IRQ line request and the
configuration of the clock event handler. This leads to a hard crash with
an instruction abort, branch to pc 0x0 in mtk_gpt_interrupt handler as
clkevt is null.

To avoid this issue request the IRQ with IRQF_NO_AUTOEN and enable it
explicitly after the clock event is configured.

Issue was reported and fix tested on the Lenovo Tab E7 (TB-7104F, mt8167).

Fixes: a0858f937960 ("clocksource/drivers/timer-mediatek: Convert the driver to timer-of")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
Credits for issue discovery and suggested fix go to          
matemiller992 on postmarketOS forums. I am submitting it upstream with     
permission. Not adding Reported-by or Suggested-by tags because it was     
requested not to share real name.    

 drivers/clocksource/timer-mediatek.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..e20075b09fab 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -277,7 +277,7 @@ static struct timer_of to = {
 	},
 
 	.of_irq = {
-		.flags = IRQF_TIMER | IRQF_IRQPOLL,
+		.flags = IRQF_TIMER | IRQF_IRQPOLL | IRQF_NO_AUTOEN,
 	},
 };
 
@@ -298,6 +298,7 @@ static int __init mtk_syst_init(struct device_node *node)
 
 	clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
 					TIMER_SYNC_TICKS, 0xffffffff);
+	enable_irq(timer_of_irq(&to));
 
 	return 0;
 }
@@ -334,6 +335,7 @@ static int __init mtk_gpt_init(struct device_node *node)
 					TIMER_SYNC_TICKS, 0xffffffff);
 
 	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
+	enable_irq(timer_of_irq(&to));
 
 	return 0;
 }
-- 
2.43.0


