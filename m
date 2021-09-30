Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72CE7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:32:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A05617E5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 08:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38A05617E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaogP5yok8KWOCRvD2yAbJmzl1gieS6asWpeqOMaIIY=; b=dzWYGjHhEFo8R3
	ykMTi+mRWU2JG59womZ9h9rUtMrMR01Wy7wP604yE2aBVsAh/f4YcVkyhuAD4JShrXVU/kwpiv7cZ
	WavzNGoGJgeEB6UBZ+5v9rl+rraT7Anj6ZJidAJwsji2l932bKdhefxolb8l0AUIsu0PjyaIM3bfN
	w4S1wUkTa+kh7ptcGJI1oKh3VxCTNrxbHrzG/lNwS9mIdliASbo86mJmYGqZWrDwArg94mN87gG5K
	g0wdUqXcITXDNiW+BOLJe0DSKMMmQWRNfY5PkQQ9kK0Qd27y1gi/nEKZrhF1Q5ypq4eWRzJDdUyk6
	nymsG65j+tr3eAv/hGnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVrUR-00DODu-GF; Thu, 30 Sep 2021 08:32:27 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVrU0-00DO1l-Pv; Thu, 30 Sep 2021 08:32:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 32D581F449EB
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org, eizan@chromium.org,
 kernel@collabora.com, drinkcat@chromium.org, jitao.shi@mediatek.com,
 chunkuang.hu@kernel.org, hsinyi@chromium.org, matthias.bgg@gmail.com,
 Guenter Roeck <linux@roeck-us.net>, Crystal Guo <crystal.guo@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v4 1/7] arm64: dts: mediatek: Move reset controller constants
 into common location
Date: Thu, 30 Sep 2021 10:31:44 +0200
Message-Id: <20210930103105.v4.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930083150.3317003-1-enric.balletbo@collabora.com>
References: <20210930083150.3317003-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_013200_989205_A7AC655D 
X-CRM114-Status: GOOD (  10.09  )
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
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---

(no changes since v2)

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
index 494f6fdbd603..9639ca17638e 100644
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
 #include <dt-bindings/pinctrl/mt8183-pinfunc.h>
diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 796fbb048cbe..3d208d627fb0 100644
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
 #include <dt-bindings/reset/mt8195-resets.h>
 #include <linux/delay.h>
 #include <linux/err.h>
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
