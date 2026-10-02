Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4343CCA5FE1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=; b=01qjJjqu00+W0cIsfuP4BmjOR5
	xMeNmW8RKIdpP3CFEO170U+DEQFPu4gqFgaABvVR6o+K6zdgZw7I+2IdXNwgg7sl3fGkj2dOq2ogt
	ah6bNOsWV3v6jF3233TvXcMB/jHOE1cA8V9CqkP9yE2Us/rPTbcYf5nm8laNdMlLgSNp6Qk6gcnY5
	FGVILxdKaao0o+2DyelCz87j7MJjQOiEJMOZB/eQ3xZHrIIUGJW1kDZBqUxgcRv1tSbUk3vdoUmC6
	OsVuaslsRhenOeC/9QMJNUtfIXPdvlcbI3okVtxI5VbJ9EAPshAVO6/nf0SM6MVzOPRTcsenllbzi
	usy871QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaS-0000000AoM5-0rzo;
	Fri, 02 Oct 2026 07:21:44 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaO-0000000AoIQ-21TB
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:42 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b059eae96so1597473f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 00:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925699; x=1791530499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=;
        b=gHGR88UuPYY2/nb7RnoeA+JbMXWp+cqQdcSzAJ2qepknQjNbii5hMMpN9WWwRWrjqi
         eIEdVqTAMDVhzH+Q1qYl74JHuL/PSdSDQ1kRpsSeSbMzPUyYFA/TVbZTKh3FVN9qF02v
         0LKagiSm31kCch4M444ActwqZuhL788LCcWmCkcKSgvIrnlU/SyDoY6PKdL34Yj9BOlD
         VqZ++X3u6PsoUaIrfyvKrdfMMBZqVvhz2KwXeKO+A5yc49ud4DQMdDrXQ+g9I/izGyLE
         hR6meZLNsxLe/a2fPxbVZ8VKqubypNHLeKt97L9Y2h8GEz9Spm55f1mUaRUle5cCT0Uq
         dPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925699; x=1791530499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wUsDqDrhpmZMvn+QumvMUSjkcnQssbcKtOFdPQ7A4VQ=;
        b=HmxwWnDp5/zD0RsJss8M9fhzPBPv4CwYMR10Jp/GBjYY2LuwV10Ie1EAKRbHC+9a+p
         8SobOPlWjGLE4xIe0DIhXGgzoBoTHRy/AjS/JS2bXdxHbra/5tXVfqK3wd58P88sPlN2
         xx7Q1Jbuk/mV4Ti0CgQTTQNHdgaBZBFTXaHQqBNsa1Owpa+HkNFaUP1jX1sZD1buhRfJ
         gXBmYh6T3nf6y9+TtcjhS6RW33DtMNPwNZi8J0nLDoBwPcnGpR71T0EKT6vRdcnb8VDh
         G6z0QWj2gBV5Gom6TmRZgCWxMjNpqdMeY2xxzxg7k7NnBCUygeZJ/rBpy13kw8FmG0ch
         001A==
X-Gm-Message-State: AFq9FYJ1jk7avJPYUzMrhHwbvRMZqMQ7SGWQo0qY8GO+fJy1RouX1mj/
	DMg8fnVAZhSadzbA6IoQ3fRuGPs3kB9DLsONaO+jctiXGEysWgP05KpZ9I/GIQ==
X-Gm-Gg: AYBFou3Fnr2wz/ax/zFUK8wuY+5YcRLc73dGpU7+1vU/UY7ankjdMBM47Lp5ceUgdKn
	xjbvg/sqCmFHewILM67TgUB8DrmjFAB1v67nPVPKXvyGtEiZON3Ie1QdkPGnaOFF+1CBNt4/a+Y
	Ck4X9qLABWWE6yjfpz3gPnzQz+6+tthMM4H72U212XBZV0q0AHhmCOqVgE7w/cEQVAE3Sk6bIh4
	f4HV9pEiZlA5u06c6dyvtUwt4n90T2ZBKq8e/A/rS+v8ByR09Tehvvv+1rfvqW+Xx7d7QgEHG8F
	0JW/wn4LLQ8PHFwvtilizlvdVCq3SIZKt15pHN7YORXVpCwPasPvXJVpd8eqfoTViVwLWwCNIsu
	0I5Ekw/+p7Kz9CH/qhivQyArQJWE5HuYrb7KObdIK4BN3aONr/zwvgnpVPYGp0a8PD/LHdBxGgl
	+cs/4zJpeXjQX0Xp9zT8Yb1J5zP4+m/DbJAYA+hWqEHkctulNYtl0ySMfNb0W7LTP7mn0=
X-Received: by 2002:a05:6000:4717:b0:487:7fd:730 with SMTP id ffacd0b85a97d-48b1271cda5mr3160214f8f.13.1790925698787;
        Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
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
Subject: [PATCH 3/3] clocksource/drivers/timer-mediatek: Request and enable the bus clock
Date: Fri,  2 Oct 2026 09:19:28 +0200
Message-ID: <20261002072115.169250-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002140_528170_44520AD3 
X-CRM114-Status: GOOD (  15.36  )
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

MediaTek APXGPT general purpose timers may optionally depend on a bus
clock. If this clock is not enabled the timers don't actually run. Boot
loaders usually turn it on, but later the kernel turns it off since it's
never requested by any driver.

Some platforms (like mt6735) declare it as a critical clock in their
clock definitions to keep it running, but at least on mt8167 it's not
actually required for a successful boot.

If a bus clock is declared in the device tree, make sure it is enabled
by driver probe and associated to the device.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index a9e7ff6908a3..842d6ee4259e 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -9,6 +9,7 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
+#include <linux/clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
@@ -283,8 +284,9 @@ static struct timer_of to = {
 	},
 };
 
-static int mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
 	int ret;
 
 	to.clkevt.features = CLOCK_EVT_FEAT_DYNIRQ | CLOCK_EVT_FEAT_ONESHOT;
@@ -305,10 +307,14 @@ static int mtk_syst_init(struct device_node *node)
 	return 0;
 }
 
-static int __init mtk_gpt_init(struct device_node *node)
+static int mtk_gpt_init(struct platform_device *pdev)
 {
+	struct device_node *node = pdev->dev.of_node;
+	struct clk *clk_bus;
 	int ret;
 
+	clk_bus = devm_clk_get_optional_enabled(&pdev->dev, "bus");
+
 	to.clkevt.features = CLOCK_EVT_FEAT_PERIODIC | CLOCK_EVT_FEAT_ONESHOT;
 	to.clkevt.set_state_shutdown = mtk_gpt_clkevt_shutdown;
 	to.clkevt.set_state_periodic = mtk_gpt_clkevt_set_periodic;
@@ -344,11 +350,10 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 static int mtk_timer_probe(struct platform_device *pdev)
 {
-	int (*timer_init)(struct device_node *node);
-	struct device_node *np = pdev->dev.of_node;
+	int (*timer_init)(struct platform_device *pdev);
 
 	timer_init = of_device_get_match_data(&pdev->dev);
-	return timer_init(np);
+	return timer_init(pdev);
 }
 
 static const struct of_device_id mtk_timer_match_table[] = {
-- 
2.43.0


