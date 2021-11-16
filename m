Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E41C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE23863223
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 09:49:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE23863223
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LSCzSZPA46mYUm46USikjBjomKT9LLytDLPPgmLwxd0=; b=oyvNRE8nMN+B2G
	ykhaSlkHWWMey/pTTZmf5z5bvkFuxbnuI/rxJsD6yx5m7YLeykghmx7oP4goJ1xACTdJHOFffnCJ1
	Wy8Yiq7kEVytrlh7pJZNUqZ7ZYAXX4lCs3tS62Sggbifuu4mm7Uh4LjkiBQ+fofp90DzoeEObLPWe
	qiT/9g8UNhKYtfGfT8xotCWxAgmtkGBvD8+RNFFeeR4V8ePb0SrCVSyGXjJmSS0TJY3giXGy/wcCZ
	RQf0sbCakEozCxhZQ4dW7az7esOClVVU/QatlFCVq3zcpRXe/AdmP/SlVs9vhsAQSYbSo3qXftv6K
	446cfhyGqeuetT2PnFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmv62-0010fM-UB; Tue, 16 Nov 2021 09:49:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmv5z-0010cW-73
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 09:49:44 +0000
X-UUID: a20c0b0a834c4c8c812380226d61f710-20211116
X-UUID: a20c0b0a834c4c8c812380226d61f710-20211116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 229905429; Tue, 16 Nov 2021 02:49:38 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Nov 2021 01:49:37 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 16 Nov 2021 17:49:35 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 16 Nov 2021 17:49:34 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: <linux-mediatek@lists.infradead.org>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, <shuijing.li@mediatek.com>,
 <liangxu.xu@mediatek.com>, <xinlei.li@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Subject: [PATCH v3 1/2] drm/panel: panel-boe-tv101wum-nl6: tune the power
 sequence to avoid leakage
Date: Tue, 16 Nov 2021 17:49:29 +0800
Message-ID: <20211116094930.11470-2-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
In-Reply-To: <20211116094930.11470-1-jitao.shi@mediatek.com>
References: <20211116094930.11470-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_014943_286329_52C9DA0C 
X-CRM114-Status: GOOD (  19.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"auo,kd101n80-45na" 2st LCD SPEC update, need to modify the timing
between IOVCC and mipi data.
The 2st version of SPEC modifies the timing requirements from IOVCC to
Mipi Data. IOVCC is now required to take precedence over MIPI DATA,
otherwise there is a risk of leakage. It is recommended that the time
for MIPI to enter LP11 be postponed after IOVCC (delay20ms).

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Change-Id: Ic5212e2145a7dbf2efef9e5585904a93e1bc5a28
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 88 +++++++++++++++++++-------
 include/drm/panel_boe_tv101wum_nl6.h           | 28 ++++++++
 2 files changed, 94 insertions(+), 22 deletions(-)
 create mode 100644 include/drm/panel_boe_tv101wum_nl6.h

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index db9d0b86d542..02efee06c430 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -49,7 +49,7 @@ struct boe_panel {
 	struct regulator *avee;
 	struct regulator *avdd;
 	struct gpio_desc *enable_gpio;
-
+	int powered_refcnt;
 	bool prepared;
 };
 
@@ -488,19 +488,15 @@ static int boe_panel_enter_sleep_mode(struct boe_panel *boe)
 	return 0;
 }
 
-static int boe_panel_unprepare(struct drm_panel *panel)
+static int boe_panel_power_off(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
-	int ret;
 
-	if (!boe->prepared)
-		return 0;
+	if (WARN_ON(boe->powered_refcnt == 0))
+		return -EINVAL;
 
-	ret = boe_panel_enter_sleep_mode(boe);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
-		return ret;
-	}
+	if (--boe->powered_refcnt != 0)
+		return 0;
 
 	msleep(150);
 
@@ -520,17 +516,45 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->pp1800);
 	}
 
+	return 0;
+}
+
+int panel_unprepare_power(struct drm_panel *panel)
+{
+	if (of_device_is_compatible(panel->dev->of_node, "auo,kd101n80-45na"))
+		return boe_panel_power_off(panel);
+
+	return 0;
+}
+EXPORT_SYMBOL(panel_unprepare_power);
+
+static int boe_panel_unprepare(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+	int ret;
+
+	if (!boe->prepared)
+		return 0;
+
+	ret = boe_panel_enter_sleep_mode(boe);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to set panel off: %d\n", ret);
+		return ret;
+	}
+
+	boe_panel_power_off(panel);
+
 	boe->prepared = false;
 
 	return 0;
 }
 
-static int boe_panel_prepare(struct drm_panel *panel)
+static int boe_panel_power_on(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (boe->prepared)
+	if (++boe->powered_refcnt != 1)
 		return 0;
 
 	gpiod_set_value(boe->enable_gpio, 0);
@@ -558,18 +582,8 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	gpiod_set_value(boe->enable_gpio, 1);
 	usleep_range(6000, 10000);
 
-	ret = boe_panel_init_dcs_cmd(boe);
-	if (ret < 0) {
-		dev_err(panel->dev, "failed to init panel: %d\n", ret);
-		goto poweroff;
-	}
-
-	boe->prepared = true;
-
 	return 0;
 
-poweroff:
-	regulator_disable(boe->avee);
 poweroffavdd:
 	regulator_disable(boe->avdd);
 poweroff1v8:
@@ -580,6 +594,36 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	return ret;
 }
 
+int panel_prepare_power(struct drm_panel *panel)
+{
+	if (of_device_is_compatible(panel->dev->of_node, "auo,kd101n80-45na"))
+		return boe_panel_power_on(panel);
+
+	return 0;
+}
+EXPORT_SYMBOL(panel_prepare_power);
+
+static int boe_panel_prepare(struct drm_panel *panel)
+{
+	struct boe_panel *boe = to_boe_panel(panel);
+	int ret;
+
+	boe_panel_power_on(panel);
+
+	if (boe->prepared)
+		return 0;
+
+	ret = boe_panel_init_dcs_cmd(boe);
+	if (ret < 0) {
+		dev_err(panel->dev, "failed to init panel: %d\n", ret);
+		return ret;
+	}
+
+	boe->prepared = true;
+
+	return 0;
+}
+
 static int boe_panel_enable(struct drm_panel *panel)
 {
 	msleep(130);
diff --git a/include/drm/panel_boe_tv101wum_nl6.h b/include/drm/panel_boe_tv101wum_nl6.h
new file mode 100644
index 000000000000..72abe3eb7840
--- /dev/null
+++ b/include/drm/panel_boe_tv101wum_nl6.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018 MediaTek Inc.
+ * Author: Jitao Shi <jitao.shi@mediatek.com>
+ */
+
+#ifndef __PANEL_BOE_TV101WUM_NL6_H__
+#define __PANEL_BOE_TV101WUM_NL6_H__
+
+#include <linux/types.h>
+#include <drm/drm_panel.h>
+
+#if defined(CONFIG_DRM_PANEL_BOE_TV101WUM_NL6)
+int panel_unprepare_power(struct drm_panel *panel);
+int panel_prepare_power(struct drm_panel *panel);
+#else
+int panel_unprepare_power(struct drm_panel *panel)
+{
+	return 0;
+}
+
+int panel_prepare_power(struct drm_panel *panel)
+{
+	return 0;
+}
+#endif
+#endif /* __PANEL_BOE_TV101WUM_NL6_H__ */
+
-- 
2.12.5


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
