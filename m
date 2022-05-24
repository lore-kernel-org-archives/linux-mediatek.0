Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8E9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 15:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+3sypjKN3hyUqv5l1hZUNAZWYjhx29bTMWZBNfAi30=; b=EvM4cjzQPE09lM
	EJQefwEV9rkxPlZf/Qrl+2UF8hyJKVaYUd/dgpOLCO5YtIV3KexF8iyTRoRXB9yuJrR/gXDuBM13/
	vLbFSDrvBJ9nCGZvIjuQkQb1XDwMSWoKWzkRWb1ZCvqKHRdIPJanHKwPNqAeYEKDuA8nHrs6hRJ3m
	0gTR9K6W+IR6YmJeiJpQLZrlOqNUck3M/TMHjg+hP0E2RS/230mWrJx3htfGRhqlfpcdk4mv74end
	qxeiwoeFuJeyV/Eaqxka5J0E5yxMoAiK6zZZbR8YOd8T+oWUxUs5fUslM/BGnDeg8zYGgd+6vNtv+
	j9ZbEcMmwKvK3IadC7Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntWSR-008Rne-12; Tue, 24 May 2022 15:28:27 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntWS8-008Rds-WE
 for linux-mediatek@lists.infradead.org; Tue, 24 May 2022 15:28:11 +0000
Received: by mail-wr1-x430.google.com with SMTP id u27so25400204wru.8
 for <linux-mediatek@lists.infradead.org>; Tue, 24 May 2022 08:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K2Kq4AjX60Auvs3EuDkJuXpELchmlwLWXQGbXPVKMFg=;
 b=MaqBpO0pzw2Nv86cZdqlL2ALSDFOV1BK9LgFUwh35kTr5l0ZencTSTkfJUfpzHwq4A
 LZNnnNo4Zc7/yvDJ1AA+qsJqoF8vsxLvFmggzUmZ3J5jYs56Z/bj1NfI0oMUTFC/IcMw
 A9a6feB5qVngeQMPrdhkk5bM3jqtrnhSwpr+EGbm2w0cPK8Crl381CE7ZLc6ma6SjgqY
 Vh5VpS57UfOIivGNOEOPheHHd29CzvCa6rUM/gr/Cw8fXNJq1J/qr4O9AXlq0bnRlruP
 mADsDpqLi9PDK5UBvn8ADQNFzFPEWEEP+h70O9ijS0SmGSyYgB8cwcUf4KPSnYs9rKFv
 ge3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K2Kq4AjX60Auvs3EuDkJuXpELchmlwLWXQGbXPVKMFg=;
 b=0+4HJtMvc+kX0E570f6sRCVaAj3fZyf/yvRTsBQd56/Nz4lK/kHLxhqhweJ8fUky49
 vF77kUc/UfDobRgHVDQXD7ecHkPL9X1pekS0E8Mio7TfB8j3dDi9bHvSz29IE1nKz97o
 v6g7M5uDL/Er1pEU70rZElW5+jOaeAp0K0WQfg7x1lDP8+21Q+c2sFlA3uq91kjn0lDt
 SnbP0sMjyseoHHPPKbETRdCO769+23q8e+SUUK7DwFFmGkEoStKqpWxn6xwXFmoAJx9p
 4Od3t2aye3fHiF/r1HJJhiD/+NF+htdph/xxw8kZFv2U4r5JTGu7bTSd9XVgcyrGq0on
 i/ew==
X-Gm-Message-State: AOAM530x7/X2FWkHkrb6EQ1f8Wo7ouKIL/tI/z3xYxoNPBie6SLj598a
 7Yju7At7fDK/F65f7PruM48hfw==
X-Google-Smtp-Source: ABdhPJzhL25As+aiDUdp92860cR8SXhTp4IGDzPkkcaizWyOIZvd4NfNBonbrx5zCl7T9cfzyR+7Mw==
X-Received: by 2002:a05:6000:1541:b0:20f:e8f0:be4e with SMTP id
 1-20020a056000154100b0020fe8f0be4emr6471819wry.658.1653406085387; 
 Tue, 24 May 2022 08:28:05 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c1c9800b003974027722csm2703693wms.47.2022.05.24.08.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 08:28:05 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v7 2/6] dt-bindings: thermal: Add binding document for LVTS
 thermal controllers
Date: Tue, 24 May 2022 17:25:49 +0200
Message-Id: <20220524152552.246193-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220524152552.246193-1-abailon@baylibre.com>
References: <20220524152552.246193-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_082809_115260_26C042DB 
X-CRM114-Status: GOOD (  11.30  )
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

This patch adds binding document for mt8192 and mt8195 thermal
controllers.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 .../thermal/mediatek,mt8192-lvts.yaml         | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
new file mode 100644
index 000000000000..914c877d1f2f
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,mt8192-lvts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek SoC LVTS thermal controller
+
+maintainers:
+  - Yu-Chia Chang <ethan.chang@mediatek.com>
+  - Ben Tseng <ben.tseng@mediatek.com>
+
+allOf:
+  - $ref: thermal-sensor.yaml#
+  - $ref: /nvmem/nvmem-consumer.yaml#
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8192-lvts
+      - mediatek,mt8195-lvts
+
+  reg:
+    minItems: 2
+    maxItems: 4
+
+  interrupts:
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+  nvmem-cells:
+    maxItems: 2
+    description: Calibration data for thermal sensors
+
+  nvmem-cell-names:
+    items:
+      - const: e_data1
+      - const: e_data2
+
+  resets:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+
+
+required:
+  - '#thermal-sensor-cells'
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - nvmem-cells
+  - nvmem-cell-names
+  - resets
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
+    lvts: lvts@1100b000 {
+        compatible = "mediatek,mt8195-lvts";
+        #thermal-sensor-cells = <1>;
+        reg = <0 0x1100b000 0 0x1000>,
+              <0 0x11278000 0 0x1000>;
+        interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+                     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
+        resets = <&infracfg_ao MT8195_INFRA_RST0_THERM_CTRL_SWRST>,
+                 <&infracfg_ao MT8195_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+        nvmem-cells = <&lvts_e_data1 &lvts_e_data2>;
+        nvmem-cell-names = "e_data1","e_data2";
+    };
+...
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
