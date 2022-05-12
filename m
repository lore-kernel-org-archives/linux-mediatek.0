Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E15CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 May 2022 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qsnz0mgMLlrkUWsxS9IkUT0xLQJzIuxF9aS3HRrbuq8=; b=tKYHS0Bg9bLu5C
	W3hOntEfm6n+NJMRNCf36kwfYMvwlkqkvE/df8vrFnYwD70fib9Ryp4WUONIpe0LyMcBgD0B1fvA5
	NlM16qlm2H9oCOfapB/S+9+S1+DbS7hR3iGxjoClbM4BWSH9gGP05VRujMv4Qzbi267IHEpVOdd63
	62KE6MLikkoyQ+IcbNFS69yzq+uvd5cSmLD0/XdngWS9Fp4fUxQ8W5CnikWrvyafp4O5JJsryrU8j
	YH8QcL37Rt4M+PmghQ6sAbYi/kbD37kmgwog7xKzebHwZRPENm+SAh6+QShihuNu2zSMaqyMpqEZd
	JiYzDmsjR5o7Y6utganw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1np8uC-00C5gv-4N; Thu, 12 May 2022 13:31:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1np7s2-00BmIk-1z
 for linux-mediatek@lists.infradead.org; Thu, 12 May 2022 12:24:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id p189so2931697wmp.3
 for <linux-mediatek@lists.infradead.org>; Thu, 12 May 2022 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CEL25fIAOxZ58SCupHBAbwosUkv+Gl8sueS42GQV8/0=;
 b=hmJKYH3GoV5OPRognhaYZ9+ey9NKhNM6sjc6eiy81im7gczC0H9b8FiR7Ynz3TR2aO
 EtsHN4T+aZLesVCtqXMrOouFUZ0JeTeDAP3e227fx4J9gnYhikxOjKCKJYufyHjNO++H
 r7gu1qICR7hpGKy2Fx4ERghUJfTGx+zUO+RQQ12CRjki/XcuVH25CzD0uo8ilTc7N0QX
 S2j9NtLnAZJBji7+i54njL8ORu9Ph55VVxsVX8jHBGqIkBhETEEywKjaWD6j++UpZVaL
 SnSRYZY/dbyyAE1QccpUR5ph/44KCoclXmeaiIYnLjiEp86PKr8BtlvuhN6R2B5OxqIw
 3wWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CEL25fIAOxZ58SCupHBAbwosUkv+Gl8sueS42GQV8/0=;
 b=e0+RfsiMmoKrR+3lC+H6F5EEoY7MqWBC7M9/FObGwBwk2ZmXBiQsSfF/85RYkM+6hx
 RY7KRzKSGPuGbeUtet2zleiaJV+3ek8k69Kx64EeMnTaLMSdwyUW0K7ADQBmt0a4hAPr
 MDztNsIPCCZI7+1d6jGhBcf6jY+Po3wxFNIPuXOBopZH+Q+dWRJlxhKF5/0oCj3jBC9G
 D9Wh/LqFQZ3YR7nAjkBPwhJzNCuevcCchlxflhteaYdJ/SBQdrKgOc9bidt2d+FIZkXz
 cbaphuBzTNlZ/21bqFlLdaQcbzhe+zxEQtmOqcnTZnsb8WjeIaHjpmIkCsU/oLQjieUa
 WPLQ==
X-Gm-Message-State: AOAM530VK6PEa1NA1MygtJMpn2Gazkygu4ml8Id+LKwkgacHazLYtS0m
 WORYqsSs1MfSvXIBgWR6HBzLwA==
X-Google-Smtp-Source: ABdhPJy2UcZEE5+c7sRO4tFxsA0JEIP0dOgsO3PQO1bZq+4Emf94ol1GlRDSyhrBYOiYdVC3cajVNA==
X-Received: by 2002:a1c:7510:0:b0:394:1961:708 with SMTP id
 o16-20020a1c7510000000b0039419610708mr9895075wmc.201.1652358279313; 
 Thu, 12 May 2022 05:24:39 -0700 (PDT)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 z22-20020a7bc156000000b003942a244f30sm3047819wmi.9.2022.05.12.05.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 05:24:39 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: robh+dt@kernel.org, krzk+dt@kernel.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Subject: [PATCH v6 2/7] dt-bindings: thermal: Add binding document for mt6873
 thermal controller
Date: Thu, 12 May 2022 14:24:28 +0200
Message-Id: <20220512122433.1399802-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512122433.1399802-1-abailon@baylibre.com>
References: <20220512122433.1399802-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_052442_180783_79B77E79 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: devicetree@vger.kernel.org, daniel.lezcano@linaro.org, rafael@kernel.org,
 khilman@baylibre.com, linux-pm@vger.kernel.org, amitk@kernel.org,
 linux-kernel@vger.kernel.org, michael.kao@mediatek.com,
 ethan.chang@mediatek.com, linux-mediatek@lists.infradead.org,
 rui.zhang@intel.com, ben.tseng@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Michael Kao <michael.kao@mediatek.com>

This patch adds binding document for mt6873 thermal controller.

Signed-off-by: Michael Kao <michael.kao@mediatek.com>
Signed-off-by: Ben Tseng <ben.tseng@mediatek.com>
---
 .../thermal/mediatek-thermal-lvts.yaml        | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml

diff --git a/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
new file mode 100644
index 000000000000..69ffe7b14c21
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/mediatek-thermal-lvts.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/mediatek-thermal-lvts.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek SoC LVTS thermal controller (DTS) binding
+
+maintainers:
+  - Yu-Chia Chang <ethan.chang@mediatek.com>
+  - Ben Tseng <ben.tseng@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt6873-lvts
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: lvts_clk
+
+  "#thermal-sensor-cells":
+    const: 0
+
+required:
+  - "#thermal-sensor-cells"
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/thermal/thermal.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/mt8192-clk.h>
+    dts: lvts@1100b000 {
+        compatible = "mediatek,mt6873-lvts";
+        reg = <0x1100b000 0x1000>;
+        clocks = <&infracfg CLK_INFRA_THERM>;
+        clock-names = "lvts_clk";
+        #thermal-sensor-cells = <0>;
+        interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+    thermal-zones {
+        cpu_thermal: cpu-thermal {
+            polling-delay-passive = <0>;
+            polling-delay = <0>;
+
+            thermal-sensors = <&dts>;
+            trips {
+                cpu_alert1: cpu-alert1 {
+                    temperature = <85000>;
+                    hysteresis = <0>;
+                    type = "passive";
+                };
+
+                cpu_crit: cpu-crit {
+                    temperature = <120000>;
+                    hysteresis = <0>;
+                    type = "critical";
+                };
+            };
+
+            cooling-maps {
+            };
+        };
+    };
+...
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
