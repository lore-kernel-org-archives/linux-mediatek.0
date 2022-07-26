Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07ECC00144
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UyB6UT6ks0HkEwyd3qTKWT7a722IA4Qy0x6ECfS6JA=; b=PbRoyIOL0BZ8p97MgrztuKpga7
	hnGSotaQng70UPPIO4MEF9qXJYhVKzNw/H0SKp4EsCZCcRB2TioevJP63KPVXh612sJMcnwzBd+Tq
	PCcD5RWBsjywbg/69anFM6zk6WmX9B6FpG8T9cIrc3+wSWL2ai8lJUIe1NlJTC87fjAiQbbsureBh
	k+A/ipbbuM7mnBrwk0Hqx8EUnctjMHdmZ34QL4z4OgIwbr4zyoYTQuyRqPhjLlMHPwUXdmwEHWSnr
	3FDcHl5UuHT/ic5uCXSyUwdptSQAJcvrMVq/x8qwuMyGCuMWbGLhvdfQHGeMbzMFncwt3MqEhEXlI
	dpkaUmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL35-00HZAV-8Y; Tue, 26 Jul 2022 13:56:35 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGL1u-00HYUi-Fy
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 13:55:26 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g2so12209691wru.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 06:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4UyB6UT6ks0HkEwyd3qTKWT7a722IA4Qy0x6ECfS6JA=;
        b=fnElU9WVkp/hVhjv7YThd5aslfssg97RW5Tc1Htc8AR/9ztHH0xlHj+E1ANhlATIin
         NpCigtCYkQPtAt4+998IITLVdULV+9ilkjQuyB4FpACY69+gQUDL+lk1KY0Hz5J08+/i
         EGLxVbqfCUgGEZPemzqKYJrQnXKYjSqzX/IaA+l5DSyONvBo9iMEgdrUP0hv7aEMNuDp
         gNkUWDOt0MNHSQhzapmSD0z5p3VdS+nnLAnMW3FEz8Qz/DmsCYXtwjCYZHOSKeYn2RXg
         G7rHqkqafxEz0fBrB5x8+lUwJTD54xUirg6le322OaUZyQoPvPGiucsZPUp1b2luQ2DN
         +MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4UyB6UT6ks0HkEwyd3qTKWT7a722IA4Qy0x6ECfS6JA=;
        b=4VHZhb8jWbtHsIkLtkl/fHwi6yfKJdrq/rAzjnx4qROrInUNOMV94p3bd34nXGk1mr
         Z0rX9a2920mmN7mycLWlnXKFC2SuihVTTMAAyu5wAPOvKqtXKvsCAiso6DRW+YfuoRza
         M6ZVQKlLtu03MffnHMRJG8coVOZub8i6RXeX9BceLyjIIImRHPFCcHuH/gBQ0+2n53N5
         uVFLa+mhpGK2vUoGXbyH0KZa5vIQN1bDXr9jx2/01q7CV/SL0DmXEJ/Lv1uMJIhDniji
         r6sCiJ22dra2+jMjIlJDs1DtBc6TiSid/XsRs5MQbUBe9o9WhL0NYONXZuVajouZERRi
         xmEg==
X-Gm-Message-State: AJIora/dlg18UO0eTPxO+/PTkGYb/8fbCMy5uWYVTNeJQ1nJGJv5havj
	FzgWCT3ZsoBpeDPLjofkObRNvw==
X-Google-Smtp-Source: AGRyM1tNOSDyHTzrF4a7MTg/xELPN/dHSfVWdPLkjj7I/TNbUJeJJG9NgzCR6U44gB8fwRp4KDsO2A==
X-Received: by 2002:adf:f492:0:b0:21d:89d5:9443 with SMTP id l18-20020adff492000000b0021d89d59443mr10608607wro.201.1658843718871;
        Tue, 26 Jul 2022 06:55:18 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id d13-20020adf9c8d000000b0021e4c3b2967sm15244670wre.65.2022.07.26.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 06:55:18 -0700 (PDT)
From: Balsam CHIHI <bchihi@baylibre.com>
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
Subject: [PATCH v8 2/6] dt-bindings: thermal: Add binding document for LVTS thermal controllers
Date: Tue, 26 Jul 2022 15:55:02 +0200
Message-Id: <20220726135506.485108-3-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726135506.485108-1-bchihi@baylibre.com>
References: <20220726135506.485108-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_065522_570186_65BB5778 
X-CRM114-Status: GOOD (  12.46  )
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

This patch adds dt-binding documents for mt8192 and mt8195 thermal controllers.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 .../thermal/mediatek,mt8192-lvts.yaml         | 73 ++++++++++++++++++
 .../thermal/mediatek,mt8195-lvts.yaml         | 75 +++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml

diff --git a/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
new file mode 100644
index 000000000000..8c5a02eb97c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,mt8192-lvts.yaml
@@ -0,0 +1,73 @@
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
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8192-lvts-ap
+      - mediatek,mt8192-lvts-mcu
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
+      - description: SW reset HW AP/MCU domain for clean temporary data when HW initialization and resume.
+
+  nvmem-cells:
+    items:
+      - description: LVTS calibration data for thermal sensors
+
+  nvmem-cell-names:
+    items:
+      - const: lvts_calib_data
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
+    #include <dt-bindings/clock/mt8192-clk.h>
+    #include <dt-bindings/reset/mt8192-resets.h>
+
+      lvtsmcu: thermal-sensor@11278000 {
+        compatible = "mediatek,mt8192-lvts-mcu";
+        #thermal-sensor-cells = <1>;
+        reg = <0 0x11278000 0 0x400>;
+        interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>;
+        clocks = <&infracfg_ao CLK_INFRA_THERM>;
+        resets = <&infracfg_ao MT8192_INFRA_RST4_THERM_CTRL_MCU_SWRST>;
+        nvmem-cells = <&lvts_efuse_data>;
+        nvmem-cell-names = "lvts_calib_data";
+      };
+
+...
diff --git a/Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
new file mode 100644
index 000000000000..6b0b53a33272
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek,mt8195-lvts.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek,mt8195-lvts.yaml#
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
+      - description: SW reset HW AP/MCU domain for clean temporary data when HW initialization and resume.
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


