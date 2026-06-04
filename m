Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CEECD6E77
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jun 2026 16:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=; b=izXHBv4BKNYLGUS5ewmOazec2T
	BUcdYTVkvnK45sFAwPWJZZlWhQHeJKN3nA8zqO47eKVTQD4o8lq3jA9T+pm4SMeZoywI3sZ7ymUyG
	xHdnZBXveFGx5IOflH0drqkhkAXQPuVwuuV+15xj44x6JFgBCKqHbjYXvY4+sZo4Ds0LWczTExHdq
	CUNG+SbCiyH0cSzdq7a0ufQfklI0++jF1TJuReeX7RPj8FARu6/UOJafBloMAOj5uMwBrk3SyDtLH
	8e2Vy/GSuUD1Li28nYIQifOHpVCC2OBXpzNXVyeNj/WpZdN3gT1rpBYzs4j/3RBHjWuAPGUS21VLs
	NRaXVWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAwa-0000000H4GY-1UZW;
	Thu, 04 Jun 2026 16:29:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAwY-0000000H4Fu-1qV8
	for linux-mediatek@bombadil.infradead.org;
	Thu, 04 Jun 2026 16:29:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=; b=EVM5PW6XwhL32CP3fQhFqjehc1
	qiB3563U6GQSHWtaXOx8xYRWN6duxeefn94CXgOMqaJyI5pxb5IjGYC2nhyBLZ+YzkEz5644KDlFR
	wRA4w4TzE9g5949MMdykmhNlJs9aQ6s/OYFfspE86QC7cEhLuLfJChQv9g1/O6CM2I/+25YYeIy3C
	UqicTnCbmLeDe1xIiEQz4eftAOdFTeho7T+G0JdwQUrzvYBYuSdATsLLgYKdpHqfkZ32cysb8MLnN
	VNyClyImt4IJWt4ZShbl1xJPe5lf501BvI50DF+BApicCv8F9gK3NQprTf6eBFBCY5BJm28wHug+e
	5GieXW+w==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wVAwR-0000000EZzn-1Iv8
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jun 2026 16:29:17 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-36dd65b95f2so659066a91.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jun 2026 09:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780590548; x=1781195348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=FGUEYtVGrp4ywTcmme1Bv3CJgIjU4LhfByo1tbYIjRWUn27mjM8vnvIllf73n/fN7F
         Xi+5rM+KF0u+B+5gS+LN3FnQgBL6JCo29rYjVV+CWlT3RNBYkQNgjNEPa9QqeK5SMCaK
         ZWmj91fV4QV6k3kdJXymsagOzLKEZYQYC/yXeDqQqaG2ypNl0ZVHcDWqRNEhQfAdmAPL
         bbYrZK3rY7740i/UKH1S1+Ca0oMEebJn+K5xi60WXiK1MR0Ki65EFG6Q+sSZ0vfgQuMJ
         mYvb+Qc3bvw0l9pjib25u8S6HTWEXivemj9uOiOso6Qf9UHZvTvPVFZtZix1hQ2OuSzz
         /ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780590548; x=1781195348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tt5XveIXPd5LExPILUEQj2Sv2Xr+T+q71wH/D2X5w18=;
        b=gsQREyRi7W+gLSK45jLfBYkKRm13d9/sD/aUxCYaivpUa0Epji/1Z5KuITTi2mBu66
         WxNhu6bUS700xSXyOOxp41lCEwPR4Z1g6lZLtgQjrnb+hvVmNS4MrYsWI4i10Zv8luqy
         GDDuz+JKJiwjRWdN6tjTH0wHZn27CuuBRPrZNlQCPXfWrDDzVwaZnZpmj+KE1RRtfr1Q
         H7/t88cngAUonan1UZC1Pq0BYtbEZPJGG8D4uuWcJ2Uezvohiym9saemIr03/G5c/S/V
         +9yld+39d0B8QmJJX+07oEJasiNikFCdGeOGP7/JOaHytcPWT6X+k3LYGDB6EM/6dCbJ
         U4iA==
X-Forwarded-Encrypted: i=1; AFNElJ9dEDIzXoMUH9rEawVB6qZLRdl1x1Lw0l8xY2j7cQTZHUathV1PN8Z0K8XWOosyTREU6e4QPsIwsGf1mC/FoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8rMArSDaefgusSuAbvfIQ49Z+kNEN18cjI9pAOfm4cou7rblM
	drY4PoubthHmGRiNVeYvRYCrLiE/y3t0wmbTm06g13O813ZwrfuzhFcY
X-Gm-Gg: Acq92OGZ3svBKhvxHIzmdtkiDecQanstXpUuzzsdeRgFlJ88GXURlBKXwjoc/z970cl
	zXcmpWm1nq9ThRXuL5toMRugHSWqhhq95JtTgpoaVLEMmFps/hhVCMke0kQQGgPXG/tsHNE+YRF
	V5nkNV+jiwpj6gL8lWgm3S64Q9CB+/tEmFLPlDzKjeKA36g7/jDfUynjYjtwjb2zNY+qDhUPgnp
	7RwYOL2jAjo3TgxqCXT8Z9McTF+8qtjnwD3jbKz7pMQp8526o9URS5IBeXgN6kCIIjtsZ+1tUVE
	tDPSlUO1uxP6DG7eszXfbdoNznEKWt+GnFi3ktFk+qZU+2nPEhwz5axzkbrSsqOrsL6rpTVtz3u
	ZYoRhPLHzJsACDo1Eo0j4Y8Rwn6k65i/bOWRAYLNjyyzadSfo8OiX5JTja2C/9VGTOuX+lq9Era
	bDjJTd5KH8YZVL3u9RDpN/r95QmCGki7aY6YJyOURlC9zi8/ORAc8bnEltZyQZudbcUgHcItqIC
	3C4cJJcEfypi0pJn5VkH2ptYOtC
X-Received: by 2002:a17:90b:2b4b:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-36f781bded1mr3553423a91.15.1780590548307;
        Thu, 04 Jun 2026 09:29:08 -0700 (PDT)
Received: from fedora ([103.181.54.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f712de91asm3670255a91.16.2026.06.04.09.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:29:07 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH v2] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Thu,  4 Jun 2026 21:56:24 +0530
Message-ID: <20260604162624.644241-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_172911_883235_970894F7 
X-CRM114-Status: GOOD (  13.90  )
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

Convert mediatek,mt6311 to DT schema.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
Changes in v2:
- Correct "MediaTek" in the title.
- Drop "|" in the top-level description.
- Remove unnecessary regulator node description.
- Remove unused labels from example.

 .../regulator/mediatek,mt6311-regulator.yaml  | 70 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ----------
 2 files changed, 70 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..f65ee2c90298
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description:
+  The MediaTek MT6311 is an I2C power management IC that provides one step-down
+  converter and one low-dropout regulator. The regulators are named VDVFS and
+  VBIASN, respectively.
+
+properties:
+  compatible:
+    const: mediatek,mt6311-regulator
+
+  reg:
+    description: I2C slave address.
+    maxItems: 1
+
+  regulators:
+    type: object
+    description: List of regulators provided by this controller.
+
+    patternProperties:
+      "^(VDVFS|VBIASN)$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          VBIASN {
+            regulator-name = "VBIASN";
+            regulator-min-microvolt = <200000>;
+            regulator-max-microvolt = <800000>;
+          };
+        };
+      };
+    };
+...
diff --git a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt b/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
deleted file mode 100644
index 84d544d8c1b1..000000000000
--- a/Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Mediatek MT6311 Regulator
-
-Required properties:
-- compatible: "mediatek,mt6311-regulator"
-- reg: I2C slave address, usually 0x6b.
-- regulators: List of regulators provided by this controller. It is named
-  to VDVFS and VBIASN.
-  The definition for each of these nodes is defined using the standard binding
-  for regulators at Documentation/devicetree/bindings/regulator/regulator.txt.
-
-The valid names for regulators are:
-BUCK:
-  VDVFS
-LDO:
-  VBIASN
-
-Example:
-	mt6311: pmic@6b {
-		compatible = "mediatek,mt6311-regulator";
-		reg = <0x6b>;
-
-		regulators {
-			mt6311_vcpu_reg: VDVFS {
-				regulator-name = "VDVFS";
-				regulator-min-microvolt = < 600000>;
-				regulator-max-microvolt = <1400000>;
-				regulator-ramp-delay = <10000>;
-			};
-			mt6311_ldo_reg: VBIASN {
-				regulator-name = "VBIASN";
-				regulator-min-microvolt = <200000>;
-				regulator-max-microvolt = <800000>;
-			};
-		};
-	};
-- 
2.54.0


