Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4756BC07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:12:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19C9B60FF2
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 10:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19C9B60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wdq38wF88UIAo/WLIW7y88dZ1oJYcdraAgQgQvmCA0=; b=PN76sF89KEGI3P
	/TtwiAAOrNskpGd1EEYFiOKjW2bB8dYOQY5jJISavaw2HonqVXDfBQGWC+U5eAyhpzRbUUGsrUdh2
	28VphwOQxeY6no2n/e9qREXiBBKnrCOMTB6n44soTGnZHbKSRw6XjWto7sh7saxhQMHwDAmsUUkBQ
	oimfBRU/f5AmyeB+hbSkfScG4Fy7yncZpNmB/KnKhrWYMHJpDQQXgm6MK/N2dZY/HcoDdqrJjIveF
	KYU7or0Z49fgmVclHyvCXRJnR/o+T3NgNtwzbFXc0bHAzLfh5CimvrsKv2mVy/i+ENgU+AItPwrG/
	DYJ6IfhrWximxl9T89hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3bsI-00D2iv-9s; Wed, 14 Jul 2021 10:12:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3brt-00D2ax-4U; Wed, 14 Jul 2021 10:11:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id C780E1F42DB8
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: chunkuang.hu@kernel.org, hsinyi@chromium.org, kernel@collabora.com,
 drinkcat@chromium.org, eizan@chromium.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com, Crystal Guo <crystal.guo@mediatek.com>,
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v2 1/7] arm64: dts: mediatek: Move reset controller constants
 into common location
Date: Wed, 14 Jul 2021 12:11:35 +0200
Message-Id: <20210714121116.v2.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714101141.2089082-1-enric.balletbo@collabora.com>
References: <20210714101141.2089082-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_031153_345193_D41BF8E3 
X-CRM114-Status: GOOD (  10.01  )
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

The DT binding includes for reset controllers are located in
include/dt-bindings/reset/. Move the Mediatek reset constants in there.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2:
- Fix build test ERROR Reported-by: kernel test robot <lkp@intel.com>

 arch/arm64/boot/dts/mediatek/mt8183.dtsi                    | 2 +-
 drivers/watchdog/mtk_wdt.c                                  | 6 +++---
 .../dt-bindings/{reset-controller => reset}/mt2712-resets.h | 0
 .../dt-bindings/{reset-controller => reset}/mt8183-resets.h | 0
 .../dt-bindings/{reset-controller => reset}/mt8192-resets.h | 0
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 96473d88f391..4ef0b5b23047 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -11,7 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8183-larb-port.h>
 #include <dt-bindings/power/mt8183-power.h>
-#include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
 #include "mt8183-pinfunc.h"
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 16b6aff324a7..6986bc740465 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -9,9 +9,9 @@
  * Based on sunxi_wdt.c
  */
 
-#include <dt-bindings/reset-controller/mt2712-resets.h>
-#include <dt-bindings/reset-controller/mt8183-resets.h>
-#include <dt-bindings/reset-controller/mt8192-resets.h>
+#include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mt8183-resets.h>
+#include <dt-bindings/reset/mt8192-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/init.h>
diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset/mt2712-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt2712-resets.h
rename to include/dt-bindings/reset/mt2712-resets.h
diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt8183-resets.h
rename to include/dt-bindings/reset/mt8183-resets.h
diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt8192-resets.h
rename to include/dt-bindings/reset/mt8192-resets.h
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
