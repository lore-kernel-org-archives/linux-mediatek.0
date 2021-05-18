Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9E4C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:54:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6C16112F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6C16112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RiyeBQSr6opUYMebKR1RdQRDgz3n3FpVlAsG1zOzyoA=; b=d+aS4NuAYEvHNwapyVZEKZ0EG8
	OKIBEQqe00mYIfZUytnJAiZSdLmR06XTsOsa4W0UY2PWFD2yAI3wi12y3ExG0HdyhlKCB7oh9wVX9
	a20FhYib6E8aT52hcsxFyoPTzCHlCV0jX9dYq7Z2VQOSSgEA2HFqdy44+Bjc9glTjHlIwE88I+9qI
	8N/oxuxGs13CIYO9x0H3vjQWs3S2/ThyK3Yhuj3uEYhVRJUjR82AFMj8OKaGuP/h7b6/hBBaFrX99
	obNo2Ji8D23obAWJiYNkUDaXpoCsRB27tkhA30YvWRW75dLVZRJ1uAAUkg8pGHh+nq1/ei8272S9W
	i9lyajKw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj3vM-001XVr-Hu; Tue, 18 May 2021 17:54:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3vJ-001XV5-6w
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 17:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=CWPyuzoJy/mScoWjTd2g156JIqxC7nCj/J8y8W+5TIQ=; b=Cy0EMRlOQbXp9C5IPJv0abWs7v
 z2FZ6Dre2/iaP8ltR+GJQgMJU3IqxvpPcbZnHcu9VX9KFubkKhKdNwWl08v3Bczoj6JECLenvphnf
 gOMSYIhtxEYR0jNfs6io6RcgCQNty9zVKKBr2r348EqDswGhkL34L61mRdYmS9lY3L0pnxkTnb4zP
 +OA558Z3+YG65r060VOeeduHx1gPgkNUi6xjDzAZFa6zP93i/dsYPWCGTxVFuLbgauOD0E3wnS3cT
 eKCFu8x7Fn0GxhectmdCGMoVMT9+9EkAHrfQpHp1y+erqeTAsRt349hY/P8xtt6Qo+A26U+IEgw5n
 woLHMplA==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3vG-00Eqze-B0
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 17:54:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id n2so11268486wrm.0
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 10:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWPyuzoJy/mScoWjTd2g156JIqxC7nCj/J8y8W+5TIQ=;
 b=gFITqRQ42/kzXwvlJxXPZLz9mArPh+pgdzCUd/Jxd1yrL6hggF14NdJNillhgJdwyX
 Sce0Br+HzNLf+LOydSu6aplcnaRFCsjewZ+DGhQFzn95i9HvdGi7Vj0BFatbdG9lD2Oy
 mvNPsKvV+132xtqDcIQ2zn1o0rRLooZVm6bkQJ+onnbx88YTgoTors2oG8C38Zwb49Xj
 ynvUDuaGkuN57coAxPIG3Gjp3LW+ruLhQTAVMx1wHLTTJq5YGgg/bCyW2W/Zo7ywGYPh
 F57HYLCKxLUOIKXusNpVCm7AxFQBEFqVWk3gcMS6EfxZl5WffEcfM8tVle8Pmyb/8oYd
 NuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CWPyuzoJy/mScoWjTd2g156JIqxC7nCj/J8y8W+5TIQ=;
 b=fgnkai3BUi9unHnhoaCYnwYTwsYoOwO0UQZNj005ipbe3S6sry0O1PT5lc++O1kjKo
 GHPXj40Fuj5XOWcFzDbmJElEz3jOu2UMaHGMZaDx1pSkD/gfcN3xVarjV9hlfGtw3xg8
 YBDZlAoZsMc5E/51dHZ9g0l0PeqIEKSah3j6jpRsl/f+lGSdAnIIM9IM5jnz+gqk3CVi
 CHEet/bNaRLH8sZ68Ywq7IFpYV3sCZDu4wn3bqpVrLHQh7YLyCLRrtOm+Qga2qyEkYen
 s6xKcVuXDtpZ/6PBjiOzKIV3UZxUVA5mELnTINzci58dHmXWJ3RSJ+Z0zSOxt7sdaIt+
 BcsA==
X-Gm-Message-State: AOAM533rJekM4FORqOC6W+dLjBpJ/+0Duss+Yp9Kp5X/4FcLd675QueY
 zXMoGgMuffrF53ajBTPL3Cny9Q==
X-Google-Smtp-Source: ABdhPJzoBUSu3qBReU3Wn0C/GcMbanCzAN+0PiM0fvT4m9u2qWF6Q6o+Gx0yv3qirYtHdkj9jj/OzQ==
X-Received: by 2002:a5d:4003:: with SMTP id n3mr8552995wrp.173.1621360464840; 
 Tue, 18 May 2021 10:54:24 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a17sm14458963wrt.53.2021.05.18.10.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 10:54:24 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: pwm: pwm-mtk-disp: convert to YAML schema
Date: Tue, 18 May 2021 19:54:19 +0200
Message-Id: <20210518175422.2678665-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_105426_407583_83259E05 
X-CRM114-Status: GOOD (  18.99  )
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

Convert the dt-binding documentation for pwm-mtk-disp to YAML.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 ----------
 .../devicetree/bindings/pwm/pwm-mtk-disp.yaml | 83 +++++++++++++++++++
 2 files changed, 83 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
deleted file mode 100644
index 902b271891ae..000000000000
--- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-MediaTek display PWM controller
-
-Required properties:
- - compatible: should be "mediatek,<name>-disp-pwm":
-   - "mediatek,mt2701-disp-pwm": found on mt2701 SoC.
-   - "mediatek,mt6595-disp-pwm": found on mt6595 SoC.
-   - "mediatek,mt8167-disp-pwm", "mediatek,mt8173-disp-pwm": found on mt8167 SoC.
-   - "mediatek,mt8173-disp-pwm": found on mt8173 SoC.
- - reg: physical base address and length of the controller's registers.
- - #pwm-cells: must be 2. See pwm.yaml in this directory for a description of
-   the cell format.
- - clocks: phandle and clock specifier of the PWM reference clock.
- - clock-names: must contain the following:
-   - "main": clock used to generate PWM signals.
-   - "mm": sync signals from the modules of mmsys.
- - pinctrl-names: Must contain a "default" entry.
- - pinctrl-0: One property must exist for each entry in pinctrl-names.
-   See pinctrl/pinctrl-bindings.txt for details of the property values.
-
-Example:
-	pwm0: pwm@1401e000 {
-		compatible = "mediatek,mt8173-disp-pwm",
-			     "mediatek,mt6595-disp-pwm";
-		reg = <0 0x1401e000 0 0x1000>;
-		#pwm-cells = <2>;
-		clocks = <&mmsys CLK_MM_DISP_PWM026M>,
-			 <&mmsys CLK_MM_DISP_PWM0MM>;
-		clock-names = "main", "mm";
-		pinctrl-names = "default";
-		pinctrl-0 = <&disp_pwm0_pins>;
-	};
-
-	backlight_lcd: backlight_lcd {
-		compatible = "pwm-backlight";
-		pwms = <&pwm0 0 1000000>;
-		brightness-levels = <
-			  0  16  32  48  64  80  96 112
-			128 144 160 176 192 208 224 240
-			255
-		>;
-		default-brightness-level = <9>;
-		power-supply = <&mt6397_vio18_reg>;
-		enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
new file mode 100644
index 000000000000..0f016c81cd53
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/pwm/pwm-mtk-disp.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MediaTek display PWM controller
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Lee Jones <lee.jones@linaro.org>
+  - Matthias Brugger <matthias.bgg@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - mediatek,mt2701-disp-pwm
+          - mediatek,mt6595-disp-pwm
+          - mediatek,mt8173-disp-pwm
+      - items:
+          - const: mediatek,mt8167-disp-pwm
+          - const: mediatek,mt8173-disp-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: clock used to generate PWM signals
+      - description: sync signal from the mmsys module
+
+  clock-names:
+    items:
+      - const: main
+      - const: mm
+
+  "#pwm-cells":
+    const: 2
+
+  power-domains:
+    description:
+      List of phandles and PM domain specifiers, as defined by bindings of the
+      PM domain provider (see also ../power_domain.txt).
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8173-clk.h>
+    #include <dt-bindings/gpio/gpio.h>
+    pwm0: pwm@1401e000 {
+      compatible = "mediatek,mt8173-disp-pwm";
+      reg = <0x1401e000 0x1000>;
+      #pwm-cells = <2>;
+      clocks = <&mmsys CLK_MM_DISP_PWM026M>,
+               <&mmsys CLK_MM_DISP_PWM0MM>;
+      clock-names = "main", "mm";
+      pinctrl-names = "default";
+      pinctrl-0 = <&disp_pwm0_pins>;
+    };
+
+    backlight_lcd: backlight_lcd {
+      compatible = "pwm-backlight";
+      pwms = <&pwm0 0 1000000>;
+      brightness-levels = <
+        0  16  32  48  64  80  96 112
+        128 144 160 176 192 208 224 240
+        255
+      >;
+      default-brightness-level = <9>;
+      power-supply = <&mt6397_vio18_reg>;
+      enable-gpios = <&pio 95 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
