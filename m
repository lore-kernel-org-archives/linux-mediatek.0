Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D05C64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 13:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+m7/rr7QHJTk9AeXbJ7c1PxCQ2GvH8D7moLZR0Qqv00=; b=WzDS2uv2sZtPj7AgI+frX/mjan
	UuDvwlnLEEE48Ped/uPJvvVcVcxfwWHrNlgKBTWhW4d4bCZGGbyvC6MhslAOGas9GBdgZZrCq4jVQ
	lW34CeDZQEitgdbTIAa+tACEDe0r+DwfNcGNIiX5BxSRQnpLmmTF4o3x5nRsJSN0iNxJh+I5wsJFJ
	FXa6LfmnfJjzUDs/CYp28KIPa8kBzCssZfYWvL6NBmourGy2mLa07fWw/TwjUHpkq7w9zW3O3Nigc
	az/4MfEqkU37RIk0e+TAWo4deYNFFV2AQ818kzEarmyeCWHOzahJSHaOc63ttgfmegtQ51PFhXTtR
	yA89MJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGDI-00A4CP-Jd; Thu, 09 Mar 2023 13:21:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paGD9-00A49V-1J; Thu, 09 Mar 2023 13:21:36 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7653F660301A;
	Thu,  9 Mar 2023 13:21:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678368093;
	bh=ldHXW19jlSTRYyH5WBpqiCYhhBV+psP18BsDgYHhh9c=;
	h=From:To:Cc:Subject:Date:From;
	b=IBMJpfisS7whkQpD/k8VireP5Hs0dDOUGl4S7ZJLe7gUqz2oQUHPX2c++Iw5Wikf7
	 4XnMOclMG6RxTt1PAsYtmcgXEAayT3th9yC3hMHhiIhPHMnecQGLAU1j4H7PHua/jn
	 rtsn6stv7GeI0y+ynN2N4E619/IyDChsLoXhu33Mjl4j+mLF+6P+VLvMW13dwHVheq
	 Gh2tWZ0vMzFaw6kicgGToy0GJoDVdAoWaX8zF9eG9jyd4UIMyjHueIn69qZ1JExiox
	 gv6DokypVRy0OWm+dBqsNzKX9WFcVNqNai9k7EBhX+aFMg/y/0d3Ug++ZbBC1x1rOc
	 Vp42agSkDNRmA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: walter.chang@mediatek.con
Cc: sudeep.holla@arm.com,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	macro@orcam.me.uk,
	jstultz@google.com,
	krzysztof.kozlowski@linaro.org,
	wsd_upstream@mediatek.com,
	stanley.chu@mediatek.com,
	Chun-hung.Wu@mediatek.com,
	Freddy.Hsin@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RFC] RFC: clocksource: timer-mediatek: Add means to register as platform_driver
Date: Thu,  9 Mar 2023 14:21:19 +0100
Message-Id: <20230309132119.175650-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_052135_230713_EF64455E 
X-CRM114-Status: GOOD (  17.85  )
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

This commit is not meant to be picked!

As some parties have some interest [1] in converting timers to
modules (for the sake of GKI), which IMO is quite tricky and hard
to do, I started some (quite fast) research on how could this be
achieved: not like that, for sure!

This kind of timers are obviously started early in the kernel init
process and as far as I saw (rightfully) even before pure_initcall,
or actually, better said, even before *any* initcall.

I fully acknowledge that this, as it is right now, is a quite big
hack... though, this actually compiles and actually... works if
timer-mediatek is compiled as built-in (so, in a way, I achieved
nothing), but the addition of the pure_initcall() there may be an
idea for others to experiment with initializing system timers at
a later stage.

This commit is practically one of the last steps involved in the
conversion, but it's meant as a conversation piece for the
interested parties.

Last thing last, after performing this research, I'm not sure
that pursuing modularization for timers is really worth it,
but I may be ignoring something :-)

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20230214105412.5856-5-walter.chang@mediatek.com/
---
 drivers/clocksource/timer-mediatek.c | 40 ++++++++++++++++++++++++++--
 include/linux/clocksource.h          |  8 ++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..eda7f60475b6 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -13,6 +13,7 @@
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -337,5 +338,40 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*mtk_timer_init)(struct device_node *node);
+
+	mtk_timer_init = device_get_match_data(&pdev->dev);
+	if (!mtk_timer_init)
+		return -EINVAL;
+
+	return mtk_timer_init(pdev->dev.of_node);
+}
+
+static const struct of_device_id timer_mediatek_of_match[] __timer_of_section = {
+	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
+#ifdef MODULE
+	{ /* sentinel */ }
+#endif
+};
+MODULE_DEVICE_TABLE(of, timer_mediatek_of_match);
+
+static struct platform_driver timer_mediatek_driver __maybe_unused = {
+	.driver = {
+		.name = "mediatek-timer",
+		.of_match_table = timer_mediatek_of_match,
+		.suppress_bind_attrs = true,
+	},
+	.probe = mtk_timer_probe,
+};
+
+#ifdef MODULE
+static int __init timer_mediatek_init(void)
+{
+	return platform_driver_register(&timer_mediatek_driver);
+}
+pure_initcall(timer_mediatek_init)
+#endif
diff --git a/include/linux/clocksource.h b/include/linux/clocksource.h
index 1d42d4b17327..a5d61a1099e4 100644
--- a/include/linux/clocksource.h
+++ b/include/linux/clocksource.h
@@ -279,6 +279,14 @@ extern int clocksource_mmio_init(void __iomem *, const char *,
 
 extern int clocksource_i8253_init(void);
 
+#if defined(CONFIG_OF) && !defined(MODULE)
+ #define __timer_of_section				\
+	 __used __section("__timer_of_table")		\
+	 __aligned(__alignof__(struct of_device_id))
+#else
+ #define __timer_of_section
+#endif
+
 #define TIMER_OF_DECLARE(name, compat, fn) \
 	OF_DECLARE_1_RET(timer, name, compat, fn)
 
-- 
2.39.2


