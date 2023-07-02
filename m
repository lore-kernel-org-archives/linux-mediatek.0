Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C15EB64D9
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jul 2023 18:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qzr/VwRbbgwsrmE6jlZJ9FcP3Vc2cGWHqLjQfvYlffY=; b=ON7ilUF/rrycxpreBMcIk1qEXP
	m5e1NkgJ4WhNuZ4xPNi63oyC2yjoN1tNh9cVKPRpxFGKHG1gGIVjzqeGT/bZs6L4bEHV995vFkPQI
	FSVyAksE6td0TzXltJWZd97NpTC7nTWLl26yAA5KMJiAwIqqM7pi0ocLBQaUHZqe5HsfNQXHMZrxe
	yOeA/uHBQ6xea/v0tqKqyV6m/tZJt2mV/NCqubj6z17TG+Af//zN9vDI8i2k/U9G7dWnbtuErETDn
	+srUBj+mLGxbVj+059aZAX8dk6aogNu5dg6vtEwDXGp3xxR4C4TuHNXMeda3igkteinX3gdwIiWUS
	3glZLDbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qG1jC-008JZB-0n;
	Sun, 02 Jul 2023 18:23:18 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qG1j7-008JWV-0L
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Jul 2023 18:23:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-991fe70f21bso431026466b.3
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Jul 2023 11:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688322191; x=1690914191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qzr/VwRbbgwsrmE6jlZJ9FcP3Vc2cGWHqLjQfvYlffY=;
        b=iDFLGVhtmva98VVo1s7qaAtOvSb8hoZWP8hPCdQ4DFiRLtfr9Od2UOFA5bcj3ueX+Z
         Q/DHkOcVx73Yem8FSZwZcOGDX1YUo7SdB4uX5hy0p8PwCShj3sudB3xpoRNvN9eB/5WS
         AlrKev4iUUm3r0ir27SCMDF9IR/UhGtZmubXdidRdSiMK9+dCSeI2Exjz7CFMmTwzmd3
         sB1Ded1tyihdP7JQiRd1zV++gqtifXqhaw2LkQLxAeBXhjG35OJus7RtEahQ7BQsRfIe
         upbMphX7kKXqo1BcrUpTItzijk1zXzhyU6J92tZJm1kKyCQok4y3awICBT/gpRLdQSoy
         qW4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688322191; x=1690914191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qzr/VwRbbgwsrmE6jlZJ9FcP3Vc2cGWHqLjQfvYlffY=;
        b=kfQuVQfjusacakTxzMj9a/Mr3zLhOtCz/XrK4gjUu6+c7iPxSSdTO4GN3CT6A875g+
         A0CB40uLUxaXMF/mqVoU6RRSYWuFfxBrp9dELxlLq55YD6A8ZUugkm72zzWZU1SbjiNH
         jmeCZiT4li+9UMhe/ke3GI3XZGIDH6eFBXhhqncugGgyro15nVrdjFNcBDsgUDnCWrwT
         8H8af3BI4MBqWXRj8ImwKCoroD+ErUnedAFBS0OMUWY0Ujqh5SUhZgMJB+BEQPvA6WNM
         pqtqoNCCheb36UWqNt9gr0Q+kwZx+4A1bI9gbhFoWjdY8Vcb76ztDRzDU20TDWojFi7x
         PfAw==
X-Gm-Message-State: ABy/qLZiF3YQOOQ22Yz8bRLmUy3Ii12Sgzgu9ImjtHC8/zgYlC1Hh57S
	/hFt4I/pLZ4GsWnXAWLEFzJhhg==
X-Google-Smtp-Source: ACHHUZ53KUKEp/qx2RT5nWxkeQ2K5QRc74L6k4flhy2OCKXv5BYIsQU3P3oC04yPG5HR5Pl0ibYw7Q==
X-Received: by 2002:a17:906:d9cf:b0:988:f2ad:73e9 with SMTP id qk15-20020a170906d9cf00b00988f2ad73e9mr5829930ejb.52.1688322191275;
        Sun, 02 Jul 2023 11:23:11 -0700 (PDT)
Received: from krzk-bin.. ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709060e8b00b00993159ce075sm2584698ejf.210.2023.07.02.11.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 11:23:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Leo Yan <leo.yan@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: cleanup DTS example whitespaces
Date: Sun,  2 Jul 2023 20:23:08 +0200
Message-Id: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_112313_487408_D0A03F19 
X-CRM114-Status: GOOD (  10.45  )
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

The DTS code coding style expects spaces around '=' sign.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Rob,

Maybe this could go via your tree? Rebased on your for-next:
v6.4-rc2-45-gf0ac35049606
---
 .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
 .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
 .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-
 .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
 .../display/rockchip/rockchip-vop.yaml         |  4 ++--
 .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
 .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
 .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
 .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
 .../bindings/net/mediatek-dwmac.yaml           |  2 +-
 .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
 .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
 .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
 .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
 .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
 15 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 0c5b875cb654..d6c84b6e7fe6 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -287,7 +287,7 @@ examples:
             arm,trig-in-sigs = <0 1>;
             arm,trig-in-types = <PE_DBGTRIGGER
                                  PE_PMUIRQ>;
-            arm,trig-out-sigs=<0 1 2 >;
+            arm,trig-out-sigs = <0 1 2 >;
             arm,trig-out-types = <PE_EDBGREQ
                                   PE_DBGRESTART
                                   PE_CTIIRQ>;
@@ -309,24 +309,24 @@ examples:
 
       trig-conns@0 {
         reg = <0>;
-        arm,trig-in-sigs=<0>;
-        arm,trig-in-types=<GEN_INTREQ>;
-        arm,trig-out-sigs=<0>;
-        arm,trig-out-types=<GEN_HALTREQ>;
+        arm,trig-in-sigs = <0>;
+        arm,trig-in-types = <GEN_INTREQ>;
+        arm,trig-out-sigs = <0>;
+        arm,trig-out-types = <GEN_HALTREQ>;
         arm,trig-conn-name = "sys_profiler";
       };
 
       trig-conns@1 {
         reg = <1>;
-        arm,trig-out-sigs=<2 3>;
-        arm,trig-out-types=<GEN_HALTREQ GEN_RESTARTREQ>;
+        arm,trig-out-sigs = <2 3>;
+        arm,trig-out-types = <GEN_HALTREQ GEN_RESTARTREQ>;
         arm,trig-conn-name = "watchdog";
       };
 
       trig-conns@2 {
         reg = <2>;
-        arm,trig-in-sigs=<1 6>;
-        arm,trig-in-types=<GEN_HALTREQ GEN_RESTARTREQ>;
+        arm,trig-in-sigs = <1 6>;
+        arm,trig-in-types = <GEN_HALTREQ GEN_RESTARTREQ>;
         arm,trig-conn-name = "g_counter";
       };
     };
diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
index 91b96065f7df..86b59de7707e 100644
--- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
+++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
@@ -96,8 +96,8 @@ examples:
       compatible = "ti,k2g-sci";
       ti,system-reboot-controller;
       mbox-names = "rx", "tx";
-      mboxes= <&msgmgr 5 2>,
-              <&msgmgr 0 0>;
+      mboxes = <&msgmgr 5 2>,
+               <&msgmgr 0 0>;
       reg-names = "debug_messages";
       reg = <0x02921800 0x800>;
     };
@@ -107,8 +107,8 @@ examples:
       compatible = "ti,k2g-sci";
       ti,host-id = <12>;
       mbox-names = "rx", "tx";
-      mboxes= <&secure_proxy_main 11>,
-              <&secure_proxy_main 13>;
+      mboxes = <&secure_proxy_main 11>,
+               <&secure_proxy_main 13>;
       reg-names = "debug_messages";
       reg = <0x44083000 0x1000>;
 
diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 029d72822d8b..65b02c7a1211 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -225,7 +225,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     gmu: gmu@506a000 {
-        compatible="qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
+        compatible = "qcom,adreno-gmu-630.2", "qcom,adreno-gmu";
 
         reg = <0x506a000 0x30000>,
               <0xb280000 0x10000>,
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
index 1cdc91b3439f..200fbf1c74a0 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8aa0.yaml
@@ -74,7 +74,7 @@ examples:
             vdd3-supply = <&vcclcd_reg>;
             vci-supply = <&vlcd_reg>;
             reset-gpios = <&gpy4 5 0>;
-            power-on-delay= <50>;
+            power-on-delay = <50>;
             reset-delay = <100>;
             init-delay = <100>;
             panel-width-mm = <58>;
diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
index 6f43d885c9b3..df61cb5f5c54 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip-vop.yaml
@@ -121,11 +121,11 @@ examples:
         #size-cells = <0>;
         vopb_out_edp: endpoint@0 {
           reg = <0>;
-          remote-endpoint=<&edp_in_vopb>;
+          remote-endpoint = <&edp_in_vopb>;
         };
         vopb_out_hdmi: endpoint@1 {
           reg = <1>;
-          remote-endpoint=<&hdmi_in_vopb>;
+          remote-endpoint = <&hdmi_in_vopb>;
         };
       };
     };
diff --git a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
index 9b072b057f16..a60b1e100ee4 100644
--- a/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/ti,adc108s102.yaml
@@ -35,7 +35,7 @@ unevaluatedProperties: false
 examples:
   - |
     spi {
-        #address-cells= <1>;
+        #address-cells = <1>;
         #size-cells = <0>;
 
         adc@0 {
diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
index 7dde7967c886..1e72b8808d24 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-cru.yaml
@@ -137,7 +137,7 @@ examples:
 
                 cru_parallel_in: endpoint@0 {
                     reg = <0>;
-                    remote-endpoint= <&ov5642>;
+                    remote-endpoint = <&ov5642>;
                     hsync-active = <1>;
                     vsync-active = <1>;
                 };
@@ -150,7 +150,7 @@ examples:
 
                 cru_csi_in: endpoint@0 {
                     reg = <0>;
-                    remote-endpoint= <&csi_cru_in>;
+                    remote-endpoint = <&csi_cru_in>;
                 };
             };
         };
diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 91e8f368fb52..324703bfb1bd 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -303,11 +303,11 @@ examples:
 
                             vin0csi20: endpoint@0 {
                                     reg = <0>;
-                                    remote-endpoint= <&csi20vin0>;
+                                    remote-endpoint = <&csi20vin0>;
                             };
                             vin0csi40: endpoint@2 {
                                     reg = <2>;
-                                    remote-endpoint= <&csi40vin0>;
+                                    remote-endpoint = <&csi40vin0>;
                             };
                     };
             };
diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index f8c976898a95..18f6733408b4 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -164,7 +164,7 @@ examples:
             reg = <0 0xf80000>;
         };
         firmware@f80000 {
-            label ="firmware";
+            label = "firmware";
             reg = <0xf80000 0x80000>;
             read-only;
         };
diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 0fa2132fa4f4..400aedb58205 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -156,7 +156,7 @@ examples:
         reg = <0x1101c000 0x1300>;
         interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_LOW>;
         interrupt-names = "macirq";
-        phy-mode ="rgmii-rxid";
+        phy-mode = "rgmii-rxid";
         mac-address = [00 55 7b b5 7d f7];
         clock-names = "axi",
                       "apb",
diff --git a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
index 50f46a6898b1..4adab0149108 100644
--- a/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
+++ b/Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
@@ -42,8 +42,8 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     pmu {
-        #address-cells=<2>;
-        #size-cells=<2>;
+        #address-cells = <2>;
+        #size-cells = <2>;
 
         pmu@ff638000 {
             compatible = "amlogic,g12a-ddr-pmu";
diff --git a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
index 26f2b887cfc1..b8d77165c4a1 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
@@ -83,7 +83,7 @@ examples:
         clocks = <&clk26m>;
         clock-output-names = "mipi_tx0_pll";
         drive-strength-microamp = <4000>;
-        nvmem-cells= <&mipi_tx_calibration>;
+        nvmem-cells = <&mipi_tx_calibration>;
         nvmem-cell-names = "calibration-data";
         #clock-cells = <0>;
         #phy-cells = <0>;
diff --git a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
index 3100cb870170..76e8ca44906a 100644
--- a/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/amlogic,meson-mx-ao-arc.yaml
@@ -75,7 +75,7 @@ additionalProperties: false
 examples:
   - |
     remoteproc@1c {
-      compatible= "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
+      compatible = "amlogic,meson8-ao-arc", "amlogic,meson-mx-ao-arc";
       reg = <0x1c 0x8>, <0x38 0x8>;
       reg-names = "remap", "cpu";
       resets = <&media_cpu_reset>;
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 478214ab045e..a59d91243ac8 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -304,7 +304,7 @@ examples:
   # Dual role switch with type-c
   - |
     usb@11201000 {
-        compatible ="mediatek,mt8183-mtu3", "mediatek,mtu3";
+        compatible = "mediatek,mt8183-mtu3", "mediatek,mtu3";
         reg = <0x11201000 0x2e00>, <0x11203e00 0x0100>;
         reg-names = "mac", "ippc";
         interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_LOW>;
diff --git a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
index d25fc708e32c..fec5651f5602 100644
--- a/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,am62-usb.yaml
@@ -92,7 +92,7 @@ examples:
 
         usb@31100000 {
           compatible = "snps,dwc3";
-          reg =<0x00 0x31100000 0x00 0x50000>;
+          reg = <0x00 0x31100000 0x00 0x50000>;
           interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>, /* irq.0 */
                        <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>; /* irq.0 */
           interrupt-names = "host", "peripheral";
-- 
2.34.1


