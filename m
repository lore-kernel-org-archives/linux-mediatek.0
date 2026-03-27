Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5B310ED674
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Mar 2026 13:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=; b=TAC/g2tJGX2msX7MEiv1+8oGCN
	HB94H9kdQpom2uzXESeInGRoCWWVhYOzTa89QL5dnaLp/nCKxGzkYl5kjCacOpwggv97lV9ouZHV1
	lm3RaaKu+yli6qBe+89Dsk6N3UNoAc/ZiUKxAw4DaPw+HENY6lVcP+ecFpBDia7ItAIe2v8ZMdRMO
	d9Sal6Cx3Wr1r0pX7fxseXJRQYng83PtuP7Avjk6bnKkcI4+j/zSkA7SO/9wC9Pan8vw2Ruep0YZ3
	ukE+fE6asPsZoQmWWmFs3f34jjlyV3cCcqLDrM4RstLJM5xYXYd0yYby0RcvoIgrUbUeHVmZr1eAK
	XO9naOtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67XJ-00000007TOW-1UgZ;
	Fri, 27 Mar 2026 13:47:42 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67XH-00000007TNV-0iS0
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Mar 2026 13:47:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2addb31945aso17091665ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Mar 2026 06:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774619258; x=1775224058; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=;
        b=bIQr2/xaQFXwJHMQ+1/u09JwLkef2Fa766y5gZhivphgXazCefzfyHg7ajjn11kWTL
         dQs02VYzab9j2iki886ZkoLpNoDfNWkX24o152n2DQmtBOBkt8ezzg8UvfV3AqCvl2Oj
         bEarZczZbtFZ/VOlMcoNE6+2DcDvHZwX1guJENDmIC2z7o5uLZAYES7+uRY7WJk7s/6/
         AXuZFmoapImVQDx0c5t5F78QL14sb/WbnohRSB16EMvKZ2hJRFl+IkyfDjndfsJzjax8
         MkQc5lPd/ZYOqBNPiZvC9mbcAjlapztz9LVGFIh7qLzvUKvZgek4JisYe431Drn58L3f
         UIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774619258; x=1775224058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no0uujIoaeBaN0lzDrFX2OOJtop28oGgvskS3mBh/+k=;
        b=sEF/MtiIwIXOG+P3gpYo5ZHxf6Uu5qAJ3lv90pKITQgrBRT7iiYLXQwXOfI7L5fD5p
         F64bg/BB4veWhLjGYfOa9ENuFRWsDVggdQYC4ovj4sKZRdEo45zS3Rblno0ZP4ZI7Cz5
         nCUwU2kSwJHSIGRXZz+ReBhm9mAS2fDvl0BSzTH37Xjg899jL0NYdNMGSKspxurpaIhm
         x5UiU1vLazFbrTW0Q70cJzBz0SXt+TyabqKpNk5qogdpwmv85otUI6BHnrvtzOfM8j7c
         OVDt7yclrwLshQZAatsr/k6L/StSF/AviPod8Gu/mqL8ixUUJ6d5Z+9vE+QSqRjvkSxs
         cxFg==
X-Forwarded-Encrypted: i=1; AJvYcCXsD0edwdsy9s/NLTDvlLggJBaZvlU9Ck9BEOhk84vU6oJmC5jSqGJDQ9j1fmjIEd4+qqUr6lJxvUcyd8bXgw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+DlsmrfHPaoVbmjKu1wGmRwkFOStDI7t28aumr4okptJbE7YN
	1ywv/uHEIKdX+QjQC9NbX/IkWYvJggcaHO1DI16vp5/KE1Cvu5IfMrUN
X-Gm-Gg: ATEYQzyd+dwVMzBMlE1kl4zsMSdxL9S717biCl5TW8Nn3F4wxM3ACnxB83s6/N/7rjO
	UY32xXXmwdyPLKjnsW6JFT7mnMaBlQQknuMK2mjLlsxJqaaDkL8AO/l4Pozwq4X9ZSaGzhZd9TA
	Lxs4v8jgJJsm7ZG7cBPRMXX5rQhrv9BReSbK1pxewrrugqtGtTDP4VIyMWrijyzKPshx5weiLwN
	dYuT5t9d6u6EUyw6PfQRT+sQisdbXSZtG4+C2jYMItNIWlPZrAvoaTYuC2Mtv7A022DL2UTYbcE
	kA5MfJctLKWxyXkP5Hs+R4fSHkXCeCYgX2lmzN6L5whbIRkPYPqgHjP4ruSz3cp8D18YweVgcFD
	1Updr6yv/ucoNzqDkkzLFEVC2/X4l3czH4n0ji85okRcKjgC/5d3a7cFoXR13YQqWIUjaKC75za
	J0oEc3irm3tWDBvYSacGiK1M4IAJ91
X-Received: by 2002:a17:903:8cb:b0:2ab:3cba:42fa with SMTP id d9443c01a7336-2b0cdd0555emr28331695ad.46.1774619257719;
        Fri, 27 Mar 2026 06:47:37 -0700 (PDT)
Received: from snowman ([2401:4900:614d:8cb4:a69f:d838:ad5c:7358])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b6casm62403545ad.16.2026.03.27.06.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:47:37 -0700 (PDT)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	koro.chen@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt8173-rt5650-rt5514: convert to DT schema
Date: Fri, 27 Mar 2026 19:16:49 +0530
Message-ID: <20260327134649.31376-1-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_064739_206365_FF3040D3 
X-CRM114-Status: GOOD (  12.76  )
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

Convert the Mediatek MT8173 with RT5650 and RT5514 sound card
bindings to DT schema.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v1 -> v2:
- Used two separate entries for two phandles.
- corrected positioning of additionalProperties.
- Fixed commit message to match subsystem.

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../sound/mediatek,mt8173-rt5650-rt5514.yaml  | 41 +++++++++++++++++++
 .../bindings/sound/mt8173-rt5650-rt5514.txt   | 15 -------
 2 files changed, 41 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
new file mode 100644
index 000000000000..ed698c9ff42b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-rt5650-rt5514.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8173-rt5650-rt5514.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT8173 with RT5650 and RT5514 audio codecs
+
+maintainers:
+  - Koro Chen <koro.chen@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8173-rt5650-rt5514
+
+  mediatek,audio-codec:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: Phandles of rt5650 and rt5514 codecs
+    items:
+      - description: phandle of rt5650 codec
+      - description: phandle of rt5514 codec
+
+  mediatek,platform:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of MT8173 ASoC platform.
+
+required:
+  - compatible
+  - mediatek,audio-codec
+  - mediatek,platform
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "mediatek,mt8173-rt5650-rt5514";
+        mediatek,audio-codec = <&rt5650>, <&rt5514>;
+        mediatek,platform = <&afe>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt b/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
deleted file mode 100644
index e8b3c80c6fff..000000000000
--- a/Documentation/devicetree/bindings/sound/mt8173-rt5650-rt5514.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-MT8173 with RT5650 RT5514 CODECS
-
-Required properties:
-- compatible : "mediatek,mt8173-rt5650-rt5514"
-- mediatek,audio-codec: the phandles of rt5650 and rt5514 codecs
-- mediatek,platform: the phandle of MT8173 ASoC platform
-
-Example:
-
-	sound {
-		compatible = "mediatek,mt8173-rt5650-rt5514";
-		mediatek,audio-codec = <&rt5650 &rt5514>;
-		mediatek,platform = <&afe>;
-	};
-
-- 
2.53.0


