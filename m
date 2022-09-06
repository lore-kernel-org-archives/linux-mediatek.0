Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D007EC38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=; b=mstF/bMPq6hft83vmXNPcvvTTR
	M1XQ62ze391Fo2m4Vn013uF46WGTA8xsMc/rvh/1ap+jvk3PwCJardZyZCU5oZS9xzJtpSTVPMHzB
	RUEbajlv/CKJ0xjiVRODbdNI1oQohwVCT1gxVGCLBkigGgr8L3B+WzJXCG/Ybez9Ix6LVeHDnWR18
	1Z+7zVkQi8HFZ0zW67uvBR+xMKfoMRP/BRIxb4iABE1DTsAH9I3oGJr5dylDkM5iBvWUj52wH+AO0
	64uG3Mce4hUqDd/24Zq/9GSPXPJxmYAL57jzEOZdatJCaVbngYbLy4ke1g+2PUszV0CZMIUD8C9Gv
	O2csF/0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU5O-00BKSR-Ti; Tue, 06 Sep 2022 08:37:34 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVU4N-00BJVt-Vt; Tue, 06 Sep 2022 08:36:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so4961192pjm.1;
        Tue, 06 Sep 2022 01:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=jmsIl8Ok40mS0SBKL0wE1rjGntjq6OgvfEjRCRIduxXBXKXXW7onrfKPDzdBLMtqht
         LLJXufRoIq+Gp/mJ6ExPpzBKSiQkDCL7PjG2ou+a6SXgyXEh/uxMnNZ4T0HBjyGVJGWp
         cWVFnnVrAmNZ5VB1OP3e/zVaF225LNBFv1YRFEyMkS0VuqXoX+XjnzEBe3jYnQcZ3MbV
         xf/9WM+MC6fVQqOpcUswQlObDKfVHJddBTEZ9JmQxlo4uV5HowtdzSOB+9YutvfVpLr8
         4JC6Ye01m4ZDNqFLoZh+mvwh1PZtVMp1x4gm7Y7Blgp8TBG/mWepJDVFCLa9GKW95bRS
         8Whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XZRFVxasDVXXPTfv/lGT5hPcHgNLG3wH8AQQYSGVOn0=;
        b=MVZnQWuCehqRb9Q/wMdJanBs/Y9TNbkQI4UvagkN8oESf49mxk6upwHA7R8yupce4D
         /cmOYTnuAmeUVx6ph29gEBAttZmig54FYM+XkGeI3/MqFoIhytInDZAuHWT/QFJ6Uibx
         GfQKq6lS+ehT0zEuRyV5uXICri4MUvCQ9D2GvJblyQR71Ue4GjjrAKDTkzp5Bye2N79s
         k+OGYADpE5KN+xfRdtuhNQdWVrHAZBRcYkzFMZzP1KvKfiUMkimzkLGysOofLOFoWQrm
         +kCifk6YdW+8U4TgN5Iil6MuqX9B60eUo04z4a+o7gjk820pKxl2brv5otCiXGdgLvA9
         2/NA==
X-Gm-Message-State: ACgBeo0tdmPoMRmCDYX3DmF2L/m16uN15pmHe66obKPHHB5kWLGzpTdi
	OF4ZfE3LY+onu7YPHLxxsj4=
X-Google-Smtp-Source: AA6agR47cJ+WKK2hQU5pd9MSXs2XnpV6BcgHwm3VK/FZ7lc5KFZrxlJaEA3eimgrUCM2ObUIEEZY0Q==
X-Received: by 2002:a17:90b:3810:b0:1fd:d001:ed41 with SMTP id mq16-20020a17090b381000b001fdd001ed41mr23271322pjb.209.1662453386749;
        Tue, 06 Sep 2022 01:36:26 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-73-80-193.emome-ip.hinet.net. [42.73.80.193])
        by smtp.gmail.com with ESMTPSA id w12-20020aa79a0c000000b005363bc65bafsm9474506pfj.57.2022.09.06.01.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 01:36:26 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	sre@kernel.org,
	jic23@kernel.org,
	lars@metafoo.de,
	broonie@kernel.org,
	mazziesaccount@gmail.com
Cc: chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	cy_huang@richtek.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 2/8] dt-bindings: leds: mt6370: Add MediaTek MT6370 current sink type LED indicator
Date: Tue,  6 Sep 2022 16:33:58 +0800
Message-Id: <4a1c995e94af808ec460e924edc7ac39b58985cc.1662476695.git.chiaen_wu@richtek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662476695.git.chiaen_wu@richtek.com>
References: <cover.1662476695.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_013632_133115_159CA52E 
X-CRM114-Status: GOOD (  11.20  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Add MediaTek MT6370 current sink type LED indicator binding documentation.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
---
 .../bindings/leds/mediatek,mt6370-indicator.yaml   | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 0000000..204b103
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+allOf:
+  - $ref: leds-class-multicolor.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^multi-led@[0-3]$":
+    type: object
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-2]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            enum: [0, 1, 2]
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - color
+      - "#address-cells"
+      - "#size-cells"
+
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        enum: [0, 1, 2, 3]
+
+    required:
+      - reg
+      - color
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.7.4


