Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 450F5C636CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 10:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tEBK+dfkMrtcAvCvX7B7AQ5v86sSP8H5vx6IKOoo8Hs=; b=Schk0Q4XuLzhw3aDOI/ZpQE3vE
	dyqZDgmAmJHkxhkNRHFrcb9Dwg6lRfdDTATK/6uo/4vAKkPzrfLu6iq2HrITCp3w0Mah5QYDm/p/G
	/glZyv55YVUl0gVkJaKRu4DAKgry1vFagbEFcaQC5oAxDRULmxYIDSAKkzQAG4wW1UXlNYKaxm2es
	vfY6LV7Cp/PfoiQJsxKnivyFpdXyoxxCqo+lUHEJEStbyY6Pq1QixxnBtmlzFN+3yk3RRQMEu94qm
	oNluTo8Aq5HWhaxocPvHKxQcxKm+0wBty67rJe/A/+d1P+Fp9DrUxq3AqFWcrXZHv0vYLb+9J84cf
	HzHIhGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQOk-005EL2-IX; Fri, 10 Feb 2023 10:12:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQQOe-005EIl-Q4; Fri, 10 Feb 2023 10:12:51 +0000
X-UUID: 71c9bd3ea92b11eda08d4d6090ec5a5c-20230210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tEBK+dfkMrtcAvCvX7B7AQ5v86sSP8H5vx6IKOoo8Hs=;
	b=Hfv+BiSvQ/M8R0hP3zWaZ6z+/zed/2xh3QyKXfuaGa4dZKMV/mpCeSTZiCC2xz/jCJ13Sb18iiB7gxXr7DZ1s1SMh4eXRmdvzKicyE+sLnkUy4OJXdufFA5yBnNy9WQyYsrzi4JUOOQlgbwmB03PTBNqc7KgJfDq7XiGUMXnCq4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:65a36883-33f4-4c71-acae-5875ac51d6e5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:885ddb2,CLOUDID:2032e856-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 71c9bd3ea92b11eda08d4d6090ec5a5c-20230210
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <walter.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1047796600; Fri, 10 Feb 2023 03:12:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Feb 2023 18:02:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 10 Feb 2023 18:02:02 +0800
From: <walter.chang@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
	<tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>, John Stultz <jstultz@google.com>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
CC: <wsd_upstream@mediatek.com>, <stanley.chu@mediatek.com>,
	<Chun-hung.Wu@mediatek.com>, <Freddy.Hsin@mediatek.com>, Chun-Hung Wu
	<chun-hung.wu@mediatek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] clocksource/drivers/timer-mediatek: Make timer-mediatek become loadable module
Date: Fri, 10 Feb 2023 18:00:38 +0800
Message-ID: <20230210100058.19861-1-walter.chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_021248_873755_056DA406 
X-CRM114-Status: GOOD (  15.62  )
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

From: Chun-Hung Wu <chun-hung.wu@mediatek.com>

This patch makes the timer-mediatek driver which can
register an always-on timer as tick_broadcast_device
on MediaTek SoCs become loadable module in GKI.

This patch depends on the previous patch.
https://lore.kernel.org/lkml/20230208094813.20874-1-walter.chang@mediatek.com/T/#t

Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
---
 drivers/clocksource/Kconfig          |  2 +-
 drivers/clocksource/timer-mediatek.c | 43 ++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 4469e7f555e9..41345827055b 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -472,7 +472,7 @@ config SYS_SUPPORTS_SH_CMT
 	bool
 
 config MTK_TIMER
-	bool "Mediatek timer driver" if COMPILE_TEST
+	tristate "Mediatek timer driver"
 	depends on HAS_IOMEM
 	select TIMER_OF
 	select CLKSRC_MMIO
diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index d5b29fd03ca2..806044ef391c 100644
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
@@ -450,6 +453,46 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	return 0;
 }
+
+#ifdef MODULE
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
+	{
+		.compatible = "mediatek,mt6577-timer",
+		.data = mtk_gpt_init,
+	},
+	{
+		.compatible = "mediatek,mt6765-timer",
+		.data = mtk_syst_init,
+	},
+	{
+		.compatible = "mediatek,mt6795-systimer",
+		.data = mtk_cpux_init,
+	},
+	{}
+};
+
+static struct platform_driver mtk_timer_driver = {
+	.probe = mtk_timer_probe,
+	.driver = {
+		.name = "mtk-timer",
+		.of_match_table = mtk_timer_match_table,
+	},
+};
+MODULE_DESCRIPTION("MEDIATEK Module Timer driver");
+MODULE_LICENSE("GPL v2");
+
+module_platform_driver(mtk_timer_driver);
+#else
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);
 TIMER_OF_DECLARE(mtk_mt6765, "mediatek,mt6765-timer", mtk_syst_init);
 TIMER_OF_DECLARE(mtk_mt6795, "mediatek,mt6795-systimer", mtk_cpux_init);
+#endif
-- 
2.18.0


