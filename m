Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B3FCD6E57
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 May 2026 17:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=; b=4bbSYOCblK3I5hvYAkUIICqcQ4
	FomtUiG1ruz/SqHmmMJVsN71RK/cQjTcmD1//XdOVXNKFmh7YULOii5og8A+dixqKJIovKE7mSc//
	ee+B5ChhGoqaXEHhCz3aNsRsjKj9fckcFpl4vQdRtqN5LLlb2AQFpDvlC6hjad+5VeRyDUxd94Cph
	w+i9Ozxxx8MlT3oWD7jAlSG+hVFPKgsDTxNs9ES4di0FOyOHPq17/PnUm5wU/VaEIIN600aHe5gBP
	3AnHrikzHGguMoB20sZDNRbjXNlg/bYUTfnFkzFvz+FdHl7yJL617ZEOnjaUQZw1qtwoeR70Si/Uf
	ODWFJITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjWY-00000009lea-0yN6;
	Sun, 31 May 2026 17:00:30 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTjWV-00000009leD-2xV2
	for linux-mediatek@lists.infradead.org;
	Sun, 31 May 2026 17:00:29 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf55c39e16so4607455ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 31 May 2026 10:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780246826; x=1780851626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=fYnixSCre+ddbJOqV5hc6Q5/Xj2x65IX1d239jnCb9zg+vIq5yfuuQ43ne0r+nkIi4
         BjoXTBfs3bwidvZ8Tr5VZue58uMiSn7QdqG4XGjhYBRgBFcfAYzKFoUwcQ+BIJD0BLy5
         dmNcjBAmkLQ6c6AZEPq/LDId4pmIjqyRYHQWSOey8v8OfeSIurp1ivV+CSz7XjLLeufq
         m2f8QGRpxd6JxN1XOan/WXNjnMcYVuqpeZbkXP+qfceEqiKeTTYF+VgGWjn1W6GtQqbu
         e5SXcRSRJNguYbRWSiDXmljk0h4+G7Q8ue33OtGiJEluN/c2NB70QaJGwaojWE5iupxM
         jA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780246826; x=1780851626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNZr3l3L/Od3rTaCElFlPcrYufd7SCc++/hp9yDvX+M=;
        b=T9CDceTrnQDZD9JMbwV/++PBN6G9qfG86g1HZdPim0TWbKxpnvncxgBLe2+s0NMTYk
         RZkL3hJNM82LHUfkp3Nbmt7KzksPyivskrJpx0IHT8bm+bOXqOZjdQDHFI5vYOnlUqQy
         O+LXx6e1zKoh+d/KaBjkf+b6wHgsPV6sC9p7W9mtiNPIZoFB/6FzXLvypgGzKMAIJP6d
         Sx8PZcxS1WIIUbBLMzTHggQkMMZ0jLUEcn8Y2/LEoq1dL1MRV3ntx2KdGAaOF9VNcxTW
         IQxjR9oIp5euBw+s3HnFZDNX3TNHyL5QGlGPA/vxYhIw8pLw3PrTpXgbEyvd01QvtrxQ
         bCoA==
X-Forwarded-Encrypted: i=1; AFNElJ+FtyEpC16rzrdDGVoMYHCBK7yPjTeCskXtWP3pvcsKdxzjX1V2cJWCQuq0rulAUV5NLmUHmPDSZOWCS3DESQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXKcVV+Ya1UHFpL1Inoysb8WeLm7/y27MwTpuFi19ccoUYaHas
	ucOrUv+u167nUvO1RWmw8xz1sWbNGv+eshWWTop0+xKWsLIdRe56247c
X-Gm-Gg: Acq92OFr9XpLxujVBfPsBgQ7Sy7Q0GrmcPXgIvPBFj0FiNKRqnazzxnLNMUEm1v8I7z
	ef6/IUOZF8Fd+ReLMA3pBBqndtnMvmys1DFnAgRxCtdg+niBTn46/3LTMsFQh6q8OjeKcfT7Dn2
	URAwiFkcGSY9BJrqcerM4E11WcLngefEQSVrlVUogII7YIxSD+UR6uWd67g7HhBLFO25P6lUWs/
	68CNZ5Dq8oSDUxAoWqiMJKCLlvF65cWiP8orT0TLKF+xhUrDbvRjSOzziNIxO/57DeqNijrHps4
	UQb1ekW35QEAzJRSxROEjv0q928qpsmaiPLXkHUPtYkX7TlxlmeDQw7HUWCjz++wXLae5Rhfqw0
	BcFSiibTpnvijnTF+UQgoY1cjpfBWacSeBYQCM+t+CN3Ofm0rHETOFt+4k3j3Tp8vYshQqMEyny
	EfvduEHkV2k1gi9ZTm8gwSfJJHyPk+FqZxYiYMSaEGHIv5GimQBFQuLpVFp9Ewz5fP9JFAb/KvF
	i9B3zuZUEsxUqktbFI=
X-Received: by 2002:a17:902:cf0d:b0:2c0:c8a8:dbb8 with SMTP id d9443c01a7336-2c0c8a8dff7mr27171725ad.29.1780246826053;
        Sun, 31 May 2026 10:00:26 -0700 (PDT)
Received: from fedora ([103.181.54.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239fd24fsm99331075ad.20.2026.05.31.10.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:00:25 -0700 (PDT)
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
Subject: [PATCH] regulator: dt-bindings: mt6311: Convert to DT schema
Date: Sun, 31 May 2026 22:27:12 +0530
Message-ID: <20260531165712.729635-1-ninadnaik07@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_100027_749879_BED0E07E 
X-CRM114-Status: GOOD (  13.29  )
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
 .../regulator/mediatek,mt6311-regulator.yaml  | 72 +++++++++++++++++++
 .../bindings/regulator/mt6311-regulator.txt   | 35 ---------
 2 files changed, 72 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
new file mode 100644
index 000000000000..a51db46b0f41
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mediatek,mt6311-regulator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6311 Regulator
+
+maintainers:
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+
+description: |
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
+        description: |
+          Regulator nodes.
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
+      mt6311: pmic@6b {
+        compatible = "mediatek,mt6311-regulator";
+        reg = <0x6b>;
+
+        regulators {
+          mt6311_vcpu_reg: VDVFS {
+            regulator-name = "VDVFS";
+            regulator-min-microvolt = <600000>;
+            regulator-max-microvolt = <1400000>;
+            regulator-ramp-delay = <10000>;
+          };
+
+          mt6311_ldo_reg: VBIASN {
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


