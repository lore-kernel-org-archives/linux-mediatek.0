Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C67CD128A
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 04:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wwE/tImZaiEw269ZV6D7aAgEnYEgHKfSAFMQ257qCzM=; b=A/Wq2INl2XV/2Jpf9NQde/lnsY
	aAPfdbV0HjxgG4lhp+dca+XKn30dphsMEJcEb/Dpp/OHh/lKLITniCcbW3P/8dxCL5iC5pLxMMWFD
	Uf3PidfzcjXli7XDjzPLINe2Ypz4uHDXkxz3SzpLjSJ8+HSklhEypo6gDP+89E/URiDCrN5rOuy9/
	Z1MjNPJdbL9HR4DulkqlLJEwtJVMocbUlE6sLTQo0BgCuZduG2MHSqnPgAt+0XhFJm0AL9p0sJEvU
	y6ppAMY3uANA8Jkc74OQj8lKw1Le1TKggr/W6g7r1bWPM2dQwpa8mXjuujCXHquZ8fWiZ9qDMgyvR
	os9s83sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr9PJ-00000006tx1-1ehq;
	Mon, 01 Apr 2024 04:36:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rr9PF-00000006twA-28zA;
	Mon, 01 Apr 2024 04:36:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1e0189323b4so25120195ad.1;
        Sun, 31 Mar 2024 21:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711946179; x=1712550979; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wwE/tImZaiEw269ZV6D7aAgEnYEgHKfSAFMQ257qCzM=;
        b=SFFYztM9d6ElH+0scuuIBebsLdyZBC47Gzq9fiy0xKZFZ4sbH6f0rmOPuRqiWywoHL
         79LiUKyJFkW0O8t0wYhsZwE5zlKSQoH/XSWXifMYlQCoPDy5dammIAHudo/jggXIwleW
         uwWCA57sFa1KcmZMnZa50+w2b8MwiZFFdGLJ2Hn7BXs22RnTS4IzPV8f/DwltXBIALFR
         35CBc0PABlCO/Eah4oScQ8HJqpSmTtKet3dRyVbo//Ki0DZAGODaGhib0hesyRY/a32z
         QFFjfNKvizZG3Ltl6waich9lbkjlFXluANwewcpf5lDxDSyb1q97ZgV3x9S17sI5LUAM
         phpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711946179; x=1712550979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wwE/tImZaiEw269ZV6D7aAgEnYEgHKfSAFMQ257qCzM=;
        b=l4eFGeuS53fpuMcEEJdO0ap5PDtkR1/Uppp6dG9+JqHjUELY+COg/7RAT5+JHp8eiR
         tFH1MuAGre/WAR0jOgCW5hn8zelkbSrSrP1YrWPJKdPV5S1nH0Y404tRo/mH7REEHLfh
         FJjKOhhRZ2cpokYY/kMkB6PjX+ilBeK6DDxY80bGvuzYaiQlXYd9YxUWxgHZukk5Uu9V
         vwAhfQvcUNZSODA4vWRr5pZj7XBaaVpIni5UShG18gJyBjmKn6kT/H5R3qiGM52gRi7i
         0WZmFEMetEJHPc+eS2/laDuqh7Z+Ivon95aC4kwmVh5SDvImEyDZWRAZ8IH5MoUJDaE1
         zUAw==
X-Forwarded-Encrypted: i=1; AJvYcCUB2+YuksJ6n75YKveEAzCr0LetqzHDaAzZrRE3oP5PrSA3HfhkLtMBF9Mzu1BPIEQSKk5fp2BjBT95KzA/vbKsCPd6jwuhOcYmTMhVg1vYxcp6MC9ssNeRb1iKNlInu8meyezTH+EV0FnCwjadYRS4brVP45hr9Aw=
X-Gm-Message-State: AOJu0YziFiuk6yohUnkCn3Gkr8tf1c0L0RbwKtjqawaQiI/05ODVA1PI
	weSQ+ZQ0B9sTLB+/1DdugrG24fyksS/BXH/XjMfXFB5AObo9DVKApsHCBgevtXQ=
X-Google-Smtp-Source: AGHT+IEPrRPcssxLAqfAranfcyHY9xgJrUdh96WohAZXPVnDF8gY+cKfMUA1ablelrfiFyNBcdPxHg==
X-Received: by 2002:a17:902:db0e:b0:1e0:b5ee:e806 with SMTP id m14-20020a170902db0e00b001e0b5eee806mr10295230plx.10.1711946178553;
        Sun, 31 Mar 2024 21:36:18 -0700 (PDT)
Received: from localhost ([103.139.191.219])
        by smtp.gmail.com with UTF8SMTPSA id t4-20020a170902e84400b001d8be6d1ec4sm7748324plg.39.2024.03.31.21.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Mar 2024 21:36:01 -0700 (PDT)
From: Kartik Agarwala <agarwala.kartik@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com
Cc: Kartik Agarwala <agarwala.kartik@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mt2701-wm8960: Convert to dtschema
Date: Mon,  1 Apr 2024 10:05:05 +0530
Message-Id: <20240401043505.40972-1-agarwala.kartik@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240331_213625_587819_0E2742BD 
X-CRM114-Status: GOOD (  14.84  )
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

Convert mt2701-wm890 bindings from text to dtschema. This is used by MediaTek mt77623a/n SoC.

Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
---
 .../sound/mediatek,mt2701-wm8960.yaml         | 59 +++++++++++++++++++
 .../bindings/sound/mt2701-wm8960.txt          | 24 --------
 2 files changed, 59 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt2701-wm8960.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
new file mode 100644
index 000000000..771f14a59
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-wm8960.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt2701-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT2701 with WM8960 CODEC
+
+maintainers:
+  - Kartik Agarwala <agarwala.kartik@gmail.com>
+
+properties:
+  compatible:
+    const: mediatek,mt2701-wm8960-machine
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT2701 ASoC platform.
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the WM8960 audio codec.
+  
+  pinctrl-names:
+    const: default
+
+  pinctrl-0: true
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - mediatek,platform
+  - audio-routing
+  - mediatek,audio-codec
+  - pinctrl-names
+  - pinctrl-0
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt2701-wm8960-machine";
+        mediatek,platform = <&afe>;
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+        mediatek,audio-codec = <&wm8960>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&aud_pins_default>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt2701-wm8960.txt b/Documentation/devicetree/bindings/sound/mt2701-wm8960.txt
deleted file mode 100644
index 809b609ea..000000000
--- a/Documentation/devicetree/bindings/sound/mt2701-wm8960.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-MT2701 with WM8960 CODEC
-
-Required properties:
-- compatible: "mediatek,mt2701-wm8960-machine"
-- mediatek,platform: the phandle of MT2701 ASoC platform
-- audio-routing: a list of the connections between audio
-- mediatek,audio-codec: the phandles of wm8960 codec
-- pinctrl-names: Should contain only one value - "default"
-- pinctrl-0: Should specify pin control groups used for this controller.
-
-Example:
-
-	sound:sound {
-		compatible = "mediatek,mt2701-wm8960-machine";
-		mediatek,platform = <&afe>;
-		audio-routing =
-			"Headphone", "HP_L",
-			"Headphone", "HP_R",
-			"LINPUT1", "AMIC",
-			"RINPUT1", "AMIC";
-		mediatek,audio-codec = <&wm8960>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&aud_pins_default>;
-	};
-- 
2.34.1


