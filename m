Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6653C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 06:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZiZ2gjUhvxUP8BYOHfnT84nsjVYZIVSYU0+1+9zrdH0=; b=xcmoLQAo1+2oI/
	oHZnB2DbItczlHxL8lF/DT2E50H2P5asKfYlFkJ9owQdUg6e/TaM44AWOxLKr53njOZuhDKuwh9XT
	01tI1EQdaFBaIoiSO864EvsSB5BDUb0rivxf3+V5MAyE9lgeSXHZNZHpftgQOeMKCeDupoE9x/n0K
	TW83VpS0bsj8ZBNVrm5UAG/Wdm66T52IBb1OIpHHJ+isYAVhgbSR3kclo7L2MBijIjp9dEXZ7amKv
	whD1/W3qUvkdbItY4OZCAK0BxWVhtYJsJDgZ8k95yTUVpoZEYJ4K/2GdpPaopUo45TgSvpDj6pjia
	d9u+xvNsG2SkdhHZSg6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqU71-006AX5-RE; Mon, 16 May 2022 06:21:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqU6p-006AUV-Ec; Mon, 16 May 2022 06:21:37 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so12150886pjb.1; 
 Sun, 15 May 2022 23:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XQvQdTgnCwDfmHkTZtajXuRMAeapjHZEvNeUkViza8=;
 b=ZLrZuXWGhglqCmNncstz6ccn5vDYbYWzH2VkXAZA1887OQvrY9eWeB0/8UQQgwWSGB
 pVzZi6ep4Ax9nm3l099qIlairb6gML7KBNuKERwrzUYQKU5NB+Chh4uwnt1fUGD3DE0v
 UVgcdupbcev1+NvQClM6qz9BVECcYIcbIAc2jk+cxmDVvMnR1sraxFf/z4kVM62+mgmr
 YG0sv49pzekIRo8vFDi2WXwQkJUYsQ4dyp/aZReuOOSbOFLpNQgBchkiWCIzyH9ZSWww
 0vH4RNk6R8t4fh5r6JasX81Clk/MpWUx0Ft4/SLtqC8ha+FyAKf7T2imbZHL04MZ9fsN
 zzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2XQvQdTgnCwDfmHkTZtajXuRMAeapjHZEvNeUkViza8=;
 b=pbXU8LQMGHcXx2PPaEzsPxTLdDoFRrZhLhaMv07qjU7aFxWemZqNJtKYl5638v1KwY
 zUC05QDMG0HYY2WRC/xZKjs+IlELkM33SraoHz7xy4V7MByXlYkrpVGifnP91iUYJCA2
 CJnl1f5MjG2ytxlHsAAA5rgzmlSrNX9w2BaELz0Quqa0vAFOQu0w+wx/OEMIco9liMm3
 63PNWG5E6jzQ2XaJK6E4f5yyJaKRuibYGfev2Klut4F+OriOjMkk5yBgZvJTpPCSbde0
 0EKpvR/mr9SAJOVTNxUsAm6ZlCwAcucOdPJ5MOTe4XvNBiuUM1s0Tvwn0rx5K2aKbPoi
 AMkw==
X-Gm-Message-State: AOAM531ZuB3m0K1ZUaky6KTQk8N7uJ1uamPmzt0EHuQ33ZNtt9ynkcnQ
 Z6/6v3pWrJAQiv0CQ1SPRpY=
X-Google-Smtp-Source: ABdhPJydDWCC0cImtGR3ApozIWoml6FLqAUUWtzPeE7bW1eJQ3xAFnItpbdPcy3zKpfDYwU75NnssA==
X-Received: by 2002:a17:902:7593:b0:15e:fe5d:58e1 with SMTP id
 j19-20020a170902759300b0015efe5d58e1mr16364570pll.102.1652682093885; 
 Sun, 15 May 2022 23:21:33 -0700 (PDT)
Received: from genechen-System-Product-Name.richtek.com
 ([2402:7500:469:4645:1448:44e0:4d9f:8e5b])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090ad58f00b001d840f4eee0sm7597337pju.20.2022.05.15.23.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 May 2022 23:21:33 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, pavel@ucw.cz
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, cy_huang@richtek.com
Subject: [PATCH v2] dt-bindings: mfd: Add bindings child nodes for the
 Mediatek MT6360
Date: Mon, 16 May 2022 14:21:27 +0800
Message-Id: <20220516062127.99647-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220515_232135_539496_B52F9743 
X-CRM114-Status: UNSURE (   9.34  )
X-CRM114-Notice: Please train this message.
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

From: Gene Chen <gene_chen@richtek.com>

Add bindings child nodes for the Mediatek MT6360

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Link: https://lore.kernel.org/all/YmqTzlrVL5KaVPuz@robh.at.kernel.org/
---
 .../bindings/mfd/mediatek,mt6360.yaml         | 189 ++++++++++++++++++
 1 file changed, 189 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
index 4d8769f3748c..28eee02441ee 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
@@ -37,6 +37,18 @@ properties:
     description:
       The first cell is the IRQ number.
 
+  regulators:
+    $ref: /schemas/regulator/mt6360-regulator.yaml#
+
+  charger:
+    $ref: /schemas/power/supply/mt6360_charger.yaml#
+
+  tcpc:
+    $ref: /schemas/usb/mediatek,mt6360-tcpc.yaml#
+
+  led-controller:
+    $ref: /schemas/leds/leds-mt6360.yaml#
+
 required:
   - compatible
   - reg
@@ -51,6 +63,8 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
     #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
+    #include <dt-bindings/leds/common.h>
+    #include <dt-bindings/usb/pd.h>
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -63,5 +77,180 @@ examples:
             interrupt-names = "IRQB";
             interrupt-controller;
             #interrupt-cells = <1>;
+
+            mt6360_charger: charger {
+                compatible = "mediatek,mt6360-chg";
+                richtek,vinovp-microvolt = <14500000>;
+
+                otg_vbus_regulator: usb-otg-vbus-regulator {
+                    regulator-compatible = "usb-otg-vbus";
+                    regulator-name = "usb-otg-vbus";
+                    regulator-min-microvolt = <4425000>;
+                    regulator-max-microvolt = <5825000>;
+                };
+            };
+
+            led-controller {
+                compatible = "mediatek,mt6360-led";
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                multi-led@0 {
+                    reg = <0>;
+                    function = LED_FUNCTION_INDICATOR;
+                    color = <LED_COLOR_ID_RGB>;
+                    led-max-microamp = <24000>;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    led@0 {
+                        reg = <0>;
+                        color = <LED_COLOR_ID_RED>;
+                    };
+                    led@1 {
+                        reg = <1>;
+                        color = <LED_COLOR_ID_GREEN>;
+                    };
+                    led@2 {
+                        reg = <2>;
+                        color = <LED_COLOR_ID_BLUE>;
+                    };
+                };
+                led@3 {
+                    reg = <3>;
+                    function = LED_FUNCTION_INDICATOR;
+                    color = <LED_COLOR_ID_WHITE>;
+                    led-max-microamp = <150000>;
+                };
+                led@4 {
+                    reg = <4>;
+                    function = LED_FUNCTION_FLASH;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function-enumerator = <1>;
+                    led-max-microamp = <200000>;
+                    flash-max-microamp = <500000>;
+                    flash-max-timeout-us = <1024000>;
+                };
+                led@5 {
+                    reg = <5>;
+                    function = LED_FUNCTION_FLASH;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function-enumerator = <2>;
+                    led-max-microamp = <200000>;
+                    flash-max-microamp = <500000>;
+                    flash-max-timeout-us = <1024000>;
+                };
+            };
+
+            regulators {
+                compatible = "mediatek,mt6360-regulator";
+                LDO_VIN3-supply = <&BUCK2>;
+                buck1 {
+                    regulator-compatible = "BUCK1";
+                    regulator-name = "mt6360,buck1";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP
+                         MT6360_OPMODE_ULP>;
+                };
+                BUCK2: buck2 {
+                    regulator-compatible = "BUCK2";
+                    regulator-name = "mt6360,buck2";
+                    regulator-min-microvolt = <300000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP
+                         MT6360_OPMODE_ULP>;
+                };
+                ldo6 {
+                    regulator-compatible = "LDO6";
+                    regulator-name = "mt6360,ldo6";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2100000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP>;
+                };
+                ldo7 {
+                    regulator-compatible = "LDO7";
+                    regulator-name = "mt6360,ldo7";
+                    regulator-min-microvolt = <500000>;
+                    regulator-max-microvolt = <2100000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP>;
+                };
+                ldo1 {
+                    regulator-compatible = "LDO1";
+                    regulator-name = "mt6360,ldo1";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP>;
+                };
+                ldo2 {
+                    regulator-compatible = "LDO2";
+                    regulator-name = "mt6360,ldo2";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP>;
+                };
+                ldo3 {
+                    regulator-compatible = "LDO3";
+                    regulator-name = "mt6360,ldo3";
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP>;
+                };
+                ldo5 {
+                    regulator-compatible = "LDO5";
+                    regulator-name = "mt6360,ldo5";
+                    regulator-min-microvolt = <2700000>;
+                    regulator-max-microvolt = <3600000>;
+                    regulator-allowed-modes = <MT6360_OPMODE_NORMAL
+                         MT6360_OPMODE_LP>;
+                };
+            };
+
+            tcpc {
+                compatible = "mediatek,mt6360-tcpc";
+                interrupts-extended = <&gpio26 3 IRQ_TYPE_LEVEL_LOW>;
+                interrupt-names = "PD_IRQB";
+
+                connector {
+                    compatible = "usb-c-connector";
+                    label = "USB-C";
+                    data-role = "dual";
+                    power-role = "dual";
+                    try-power-role = "sink";
+                    source-pdos = <PDO_FIXED(5000, 1000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+                    sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_DUAL_ROLE | PDO_FIXED_DATA_SWAP)>;
+                    op-sink-microwatt = <10000000>;
+
+                    ports {
+                        #address-cells = <1>;
+                        #size-cells = <0>;
+
+                        port@0 {
+                            reg = <0>;
+                            endpoint {
+                                remote-endpoint = <&usb_hs>;
+                            };
+                        };
+                        port@1 {
+                            reg = <1>;
+                            endpoint {
+                                remote-endpoint = <&usb_ss>;
+                          };
+                        };
+                        port@2 {
+                            reg = <2>;
+                            endpoint {
+                                remote-endpoint = <&dp_aux>;
+                            };
+                        };
+                    };
+                };
+            };
         };
     };
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
