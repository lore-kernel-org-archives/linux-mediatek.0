Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71880C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 13:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ETAlUNaMGQpo/uPrl7ABLWcA/ucKMRK4Sq2xTm6LKJ0=; b=Rq6TbHbCtezQON9FU1hQAKVaB5
	AHnvKrh7Ly5WbojnsVtVfbKi51ovHkMvL7gEithU8o/9zOhKipGMFhz4yxUJlC/+6xJ25p5bnE/XG
	InX5C2CECNsUTBNcDGSz6hEGjqtKsjNd5zYOqPdBVzVyxD6jSmckvuXFiG20qDNY49mP6nc80TxTf
	ryUcF7jlNwT5xnTHzZc/GWNmWU58U8/MKbWtjXDP7ILH4WX9QYEoYDQGWkK1b/4u3UFNm/16cCmUE
	O6QL7CPEzSXTmlfrauXQps+6hn1fwmN2vOS775xW2GMzBzdN8De7bRk8YB1fMkXu0i7WSSuznvDJh
	lXkd/+uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJacR-006Arr-2F; Thu, 04 Aug 2022 13:10:31 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJabx-006AXm-FB
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 13:10:04 +0000
Received: by mail-wr1-x435.google.com with SMTP id bk11so15353405wrb.10
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 06:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ETAlUNaMGQpo/uPrl7ABLWcA/ucKMRK4Sq2xTm6LKJ0=;
        b=N9mg1GGa3pwtI8qwXcnAzLD7CEsS9/tz7e5TGqSzK+TYejyMwE84o1o+htg5e0jfGa
         QBxFGjvIgNUvt/vOt6d4dG1yGNG746FMXZYKqBhUuq5PFkIFiggS94FEW1HWzmVSL8YN
         VKycWa1BpZmcTDDw4DTb41yyiuExfFx0brq5izSecgSnDkBwXDN4z3C96SkMOGS+Z9RS
         vV1BuNEXObvWZfnqJg5XFPrcLT4tqCeoZqZefNM2mu6diG5F6R3ejU/Tv95FZt0X2xbK
         eQyAN+SfZXUDilGmsLqOIHelMmqfzs8Be/E1VYoBKl+x4Sy1OeomZT+hVK27z58IHnsv
         PsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ETAlUNaMGQpo/uPrl7ABLWcA/ucKMRK4Sq2xTm6LKJ0=;
        b=ApxsCDNnIGACxuM32qVbQFoKkCqsw+Og4KuUvN+Rufd/kNSRp876+qk+f7+oBcNbO7
         Yuo0+z6vndqnTTQCDt0V3fMk6riplCDSFCTS6IvUrasNVNvMWcIb20+cHBR+ajTxvY1x
         o9hyuQUZ0CrPsv+OProqLbXq6k6Di5hgYLZNReQ54kBhwZvyX14H4I9LoWQTf2/rRxbm
         /xe+RLL0qs0jWOeZHGw9SwUQ9Ba9sbc/tRZ9gSVQy1vhjBqI/xZoRUNn2/j9BawmLaIA
         dZ14vjXiH6tPx8H70vBo/QJjbzU5FfvM1RO3doYfLEK+F43frhB+7mXNuTkRUqb+s9wt
         NiOQ==
X-Gm-Message-State: ACgBeo1QZRXVYQs41ZfYl0SayUwdydttc/K/IPlHoIKGRpqvCJUIWoU/
	7ssMaX0X20928zC9YPVF0Uvipg==
X-Google-Smtp-Source: AA6agR4NM2DuUJ9ZgcrlN+3wkc0Rf579Msjd8f9h/Jqtrma62QpnqPtRFG6GD9EJr9FuCtRnPy1P/Q==
X-Received: by 2002:a5d:6f1c:0:b0:21f:121e:1190 with SMTP id ay28-20020a5d6f1c000000b0021f121e1190mr1341352wrb.589.1659618599667;
        Thu, 04 Aug 2022 06:09:59 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.. (235.163.185.81.rev.sfr.net. [81.185.163.235])
        by smtp.gmail.com with ESMTPSA id o15-20020adfcf0f000000b0021d6a520ce9sm1156817wrj.47.2022.08.04.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 06:09:59 -0700 (PDT)
From: bchihi@baylibre.com
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v8.1, 2/7] dt-bindings: thermal: Add binding document for LVTS thermal controllers
Date: Thu,  4 Aug 2022 15:09:07 +0200
Message-Id: <20220804130912.676043-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220804130912.676043-1-bchihi@baylibre.com>
References: <20220804130912.676043-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_061001_534163_D25B6E9B 
X-CRM114-Status: GOOD (  11.67  )
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

From: Alexandre Bailon <abailon@baylibre.com>

This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 .../thermal/mediatek,lvts-thermal.yaml        | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
new file mode 100644
index 000000000000..53c44a73f3a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,lvts-thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoC LVTS thermal controller
+
+maintainers:
+  - Yu-Chia Chang <ethan.chang@mediatek.com>
+  - Ben Tseng <ben.tseng@mediatek.com>
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8192-lvts-ap
+      - mediatek,mt8192-lvts-mcu
+      - mediatek,mt8195-lvts-ap
+      - mediatek,mt8195-lvts-mcu
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  reg:
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: SW reset HW AP/MCU domain to clean temporary data on HW initialization/resume.
+
+  nvmem-cells:
+    items:
+      - description: LVTS calibration data 1 for thermal sensors
+      - description: LVTS calibration data 2 for thermal sensors
+
+  nvmem-cell-names:
+    items:
+      - const: lvts_calib_data1
+      - const: lvts_calib_data2
+
+required:
+  - compatible
+  - '#thermal-sensor-cells'
+  - reg
+  - interrupts
+  - clocks
+  - resets
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/thermal/thermal.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8195-clk.h>
+    #include <dt-bindings/reset/mt8195-resets.h>
+
+      lvtsmcu: thermal-sensor@11278000 {
+        compatible = "mediatek,mt8195-lvts-mcu";
+        #thermal-sensor-cells = <1>;
+        reg = <0 0x11278000 0 0x400>;
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+        resets = <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+        nvmem-cells = <&lvts_efuse_data1 &lvts_efuse_data2>;
+        nvmem-cell-names = "lvts_calib_data1", "lvts_calib_data2";
+      };
+
+...
-- 
2.34.1


