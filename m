Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3CCCA5FD9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2026 07:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=; b=SIAyy6pM/aQs2pB77lZFVAsNTc
	oZrUk7rm+mpZxHHc7iLFG6VBaYYqJN0tJrclpjjI/q9Dl8WWwtLMEoePABUFeLhgORo6vsxytmwTz
	iv0AxA+3KbAauMmD3u40Zm4RMYxCN/D/zA/eL/oQtDE3moOo8+Xni1i/IQgabpsL/lSyN8y5+eaNl
	zkFpvlJd+qYMwPV4UhUT/LTsnMngxBDsq8aXcMf1dSgaykT2F3HTEUrDwtIH5iVhgCv3o0w1rYaRg
	RUGcYDX88rCNUecVl4P0mQ0fBED2K7PKmSSIatLbKU9vM3/0sp3ro0IsTl8UhHYMxEt2LJadpRpoF
	tPnlQAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaR-0000000AoLD-3ciA;
	Fri, 02 Oct 2026 07:21:43 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXaN-0000000AoH6-0hE7
	for linux-mediatek@lists.infradead.org;
	Fri, 02 Oct 2026 07:21:40 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48b00a0ac65so1578243f8f.0
        for <linux-mediatek@lists.infradead.org>; Fri, 02 Oct 2026 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925697; x=1791530497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=;
        b=liRCU3/0P0uB5tx2rNYSAPHukgbrDUbwqgPz6j+Bp3wqCl+bWsGHn8JGUGd+eYNUqd
         +BHL+/skw3iuC/2sFJO2Qt0vylV04hL4UlQw/IxGd59NmtM8gYfXW3XZUSBI+XkrRpzX
         EKZ7DzVGkGssQmEkHKUrBYxr8Q8bUEemJuhaiLj1/CxhpTW9jm+F6KZsLHM9nUAg6lCe
         tVKwGeJwpeag4xLbert9xtJauRsj5Bl0ivOV+SjFzyk7iuME8zva79bmY7//NJ1pTw86
         Gz/5uSfYsReatZY36/LoXM0KeYxxMQUHwgNX3uhEn1/8SLPoOVpN8rxKN4H/YUmxHyJz
         0csQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925697; x=1791530497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BiRT4iJ8ATEOAN7haj6uPz4qVcb8QlqeLbjNdcN2pu4=;
        b=HaoXONkb9oQ5EpmDT9ahKMYype03c4wWDv7WZpShn86h/Qo23psKjYDp5ZbqEciij0
         Sib4sArN9ldJt4HiHDIEDItlPhIprOrePog8ozJdf1TBy8iyQeAbRyOpdgLZkFhMvnRR
         kBAKgG4MT4xBoDigZt9HYTO3eWIIUb4eckhpSmUOBZ404MvrHMHqm4o2C/d9VvKKM9vD
         G42g5RjsTwlGtiTDDFg8SYoSt4rQJOobwhp49JGTtrUJ9mbdtTbPRTqlqCzvjiB2EWGF
         EJE3lA3AL+6zAQ+0hm5j+6Ths97/vtY1zDxXkdPLDSA2ulkYaDgsm/p7Xaj+lCKXrFYy
         /Hgg==
X-Gm-Message-State: AFq9FYI5jGTvapIyagm4GCiWFfp/ZLOgx6BLCXjBKOJIzF77OWLY0kjA
	0D8dw1GnYmYn+1Q4fkAeU3ZI5QmWTmVnyr6mKheoURjh6vZH/Kua4W/d1/J9lA==
X-Gm-Gg: AYBFou17zpDIHu6uSvEfieB7L/9y4DKAD3DWOgnW76RqN1VW+rGp2Gz6g0+2gSN5HHV
	sYIBtJfjjHyAXEW3opTdYnD018Qumdy3/RSS/Wz035Qi7qxmHhd+7RfE9J9RF1G4ZoQaw4BC0sN
	COEec9lpPFKYAWIHNWgTSKTpprDeXUGvEdyhFm3lXJI5uHsir2TPODqBD9Xelz90/AtEmLKn25e
	mcV83f8nbElxWu0CY2HIapXeRAZIL5Ny6Cre1GLqU3wzTf1WFah1OJw7Uun8AqG2UH8zBxfRNUL
	Gu1LST9t+2YznbEkjZoRfKKUDHKKds5eLIju1OTpW3jCn3P2Snv9+2wA9UOMJe8mkW6rseAorvE
	U4jHK+j2Rv9AtflDIVwdG1yF72S0Z0h1N0IBj/FUeDvsmxeROVume66MWOb8GjNWzR7ET5WViok
	ERAdugy980JAgWZZYGoqTjDDG8J8zPXTLxduJ7CszzixEDTATrKT6fdMoZBxIODnuMXw==
X-Received: by 2002:a05:6000:981:b0:48b:9f7:9359 with SMTP id ffacd0b85a97d-48b12739796mr3125446f8f.16.1790925697499;
        Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3564479f8f.31.2026.10.02.00.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:21:37 -0700 (PDT)
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
Subject: [PATCH 2/3] clocksource/drivers/timer-mediatek: Convert to OF probing
Date: Fri,  2 Oct 2026 09:19:27 +0200
Message-ID: <20261002072115.169250-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002072115.169250-1-l.scorcia@gmail.com>
References: <20261002072115.169250-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002139_240362_1788349B 
X-CRM114-Status: GOOD (  18.10  )
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

MediaTek APXGPT general purpose timer driver is registered via
TIMER_OF_DECLARE to be loaded early in the boot process. It depends on
a reference 13 MHz clock that is assigned via the clocks property of
its DT node.
On platforms like mt8516/mt8167 this clock is provided by a driver that
is loaded using OF probing and becomes available only later during boot.
This leads to a silent EDEFER error during timer init, which is not
recovered by TIMER_OF_DECLARE and GPT clocks are not registered at all.

Since those clocks are not critical for boot, convert the timer-mediatek
to OF probing and drop the TIMER_OF_DECLARE instructions.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clocksource/timer-mediatek.c | 36 ++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index e20075b09fab..a9e7ff6908a3 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -13,6 +13,9 @@
 #include <linux/clocksource.h>
 #include <linux/interrupt.h>
 #include <linux/irqreturn.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/slab.h>
 #include "timer-of.h"
@@ -215,8 +218,7 @@ static irqreturn_t mtk_gpt_interrupt(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void
-__init mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
+static void mtk_gpt_setup(struct timer_of *to, u8 timer, u8 option)
 {
 	writel(GPT_CTRL_CLEAR | GPT_CTRL_DISABLE,
 	       timer_of_base(to) + GPT_CTRL_REG(timer));
@@ -281,7 +283,7 @@ static struct timer_of to = {
 	},
 };
 
-static int __init mtk_syst_init(struct device_node *node)
+static int mtk_syst_init(struct device_node *node)
 {
 	int ret;
 
@@ -339,5 +341,29 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
-TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
-TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
+
+static int mtk_timer_probe(struct platform_device *pdev)
+{
+	int (*timer_init)(struct device_node *node);
+	struct device_node *np = pdev->dev.of_node;
+
+	timer_init = of_device_get_match_data(&pdev->dev);
+	return timer_init(np);
+}
+
+static const struct of_device_id mtk_timer_match_table[] = {
+	{ .compatible = "mediatek,mt6577-timer", .data = mtk_gpt_init },
+	{ .compatible = "mediatek,mt6765-timer", .data = mtk_syst_init },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver mtk_timer_driver = {
+	.probe = mtk_timer_probe,
+	.driver = {
+		.name = "mediatek-timer",
+		.of_match_table = mtk_timer_match_table,
+	},
+};
+module_platform_driver(mtk_timer_driver);
+
+MODULE_DESCRIPTION("MediaTek Timer driver");
-- 
2.43.0


