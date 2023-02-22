Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74644C61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Feb 2023 18:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMZRAU71TK2JSLnRMQg/noe6Jd/W24ggEs/V/WYcZi4=; b=T1j1NIysK/k3bBK/djKwvOIYqR
	YEEpi6zBh3tr5eiWWu0sxdNTMB0OFUUJmuelwtUpqBKmp1km3Fs3sVXNRY0KzJ43OHMzUKEE2Y5m1
	9R1D2XdYphoKxu/Jmcc+khAjFNxFPWHJmb1lOUraquJ7gzbyJQNgstojaOJnsh0+nBFoLYgIA7X6/
	CW0tKkfzKZNZDLHtA5D3GE+0FdniF8YlZk0IvAiPJecG/rKSKD/sgHTf9SPJBCJdZD88zyMzhuJUK
	Q0dC8bWJUD/0bhrXWpUu6JwvlPp+7acbD9JYnUIBsfiH3JxqQqLNjBpS/nqZvRcNsI70waVVvK6Uq
	9GZ89XPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtYO-00DNGr-9U; Wed, 22 Feb 2023 18:09:20 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUtYK-00DNEr-Si; Wed, 22 Feb 2023 18:09:18 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pUtYJ-0008Ju-24;
	Wed, 22 Feb 2023 19:09:15 +0100
Date: Wed, 22 Feb 2023 18:09:08 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH RFC 1/4] dt-bindings: clock: rename mt7986-clk.h to
 mediatek,mt7986-clk.h
Message-ID: <15d718a2d696d29b48668b9ab5531369c537a1e6.1677089171.git.daniel@makrotopia.org>
References: <cover.1677089171.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677089171.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_100916_974013_99F91933 
X-CRM114-Status: GOOD (  10.69  )
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

Rename dt-bindings header file mt7986-clk.h to mediatek,mt7986-clk.h,
propagate this change also to mt7986a.dtsi which is the only user.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                       | 2 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c                      | 2 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c                      | 2 +-
 .../dt-bindings/clock/{mt7986-clk.h => mediatek,mt7986-clk.h}   | 0
 4 files changed, 3 insertions(+), 3 deletions(-)
 rename include/dt-bindings/clock/{mt7986-clk.h => mediatek,mt7986-clk.h} (100%)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 0d9800c51cc9b..a53993fe457ca 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -6,7 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/clock/mt7986-clk.h>
+#include <dt-bindings/clock/mediatek,mt7986-clk.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index b7efa70c2d6c2..e3363d700243d 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -14,7 +14,7 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 
-#include <dt-bindings/clock/mt7986-clk.h>
+#include <dt-bindings/clock/mediatek,mt7986-clk.h>
 #include <linux/clk.h>
 
 static DEFINE_SPINLOCK(mt7986_clk_lock);
diff --git a/drivers/clk/mediatek/clk-mt7986-topckgen.c b/drivers/clk/mediatek/clk-mt7986-topckgen.c
index fbca3feded8f0..971b5259186a6 100644
--- a/drivers/clk/mediatek/clk-mt7986-topckgen.c
+++ b/drivers/clk/mediatek/clk-mt7986-topckgen.c
@@ -14,7 +14,7 @@
 #include "clk-gate.h"
 #include "clk-mux.h"
 
-#include <dt-bindings/clock/mt7986-clk.h>
+#include <dt-bindings/clock/mediatek,mt7986-clk.h>
 #include <linux/clk.h>
 
 static DEFINE_SPINLOCK(mt7986_clk_lock);
diff --git a/include/dt-bindings/clock/mt7986-clk.h b/include/dt-bindings/clock/mediatek,mt7986-clk.h
similarity index 100%
rename from include/dt-bindings/clock/mt7986-clk.h
rename to include/dt-bindings/clock/mediatek,mt7986-clk.h
-- 
2.39.2


