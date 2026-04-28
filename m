Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468BCFF886D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 17:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=; b=WkLYny+NsvH5roUseM7n1OP99J
	9lO7ZR5ucvZ5wust+uKz4T4nP4roO1fkrSn8bzx02Aa/8nMtZnKx9AExrGp+/okF/y0o+moqNJr+H
	oftmudsLaJsrSr1DI/qWnnMc+iwxBuUtoyS94E8CJOA+GaCrPSZh0VQ2jmL0VI3mh3Q8pcKCKTwTS
	eATo+5phl2bInms++oLPKsb2oT9wsNswrOWcN8wYDx6rks/IMpU4J73IJ7AwryF9wzDnJCgAu28MB
	KkpJbjzmT91PpBVWRUughAtaui1I0lfK1ZMx3xM3LDp8tpxwABXZtJP0rdwoh9OsnvEzmG919uPF7
	y419kulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHm3T-000000020XS-1kM6;
	Tue, 28 Apr 2026 17:17:03 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHm3Q-000000020WV-1CwF
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Apr 2026 17:17:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-82748257f5fso29552b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2026 10:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777396619; x=1778001419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=OkCQAY0KG640HuVntFS7mVUqZynqtXlvtyWj2XpXm9ESk+ZseNDRygEu4GagtdG8ko
         YL/Km+wqSoP2D3EdqA1MLjiqVV2BRbTUV05xMy/bZNFHYYCuegMRHe1Ean/NDvvahRaD
         X/bzExpX7S9A1adHzTzcGWkoQi1FEhCpw6Rce9GsG5g6/3HDwBhTkygpHN9X5MHAXzxy
         AmhNs4DhZKy8931Cs5GXX8s6MQicgAMffmLSzpnOZ8Eav4S5UUSJMZfK5ZFf0uyHRiPz
         Uxv++2TJGfxrKb7eRo052H2NxmTfzBE73a+p+xOUw36EoBFQIUZ6Q/L5LR41hk4rIzvL
         A78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777396619; x=1778001419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QVnrg5T5fwP5chnWeWOK6cyXsKrSBxIvGHnvHH3/V4=;
        b=PFfA56NjEm26hhcDi/2qbpDNaZHp5tvIUHdfI0sX9avrDFgUGMJL1ySUThqJVfnZkq
         Lly9BkS6Gvgl7pynkCNRBed1yzQWzIZ4eEMh0aZJPOMzT/JfVZYE5Ie0Kw5LqzMwZFeO
         FpjuaOeiYyEBmhDQ6I/K4sq4uqkoSYhQmuXfOCvz1gh4502bm1EvzPgrK84r8Q4XqF5b
         qCY4AFBN03nEPmmG6tr1Lm3MQV1TS6uJ2X+cCsROkpId4y5YLYQnTZhYCLbyFziYeuov
         T7jxkLOHY3Pcz92abmS2NLrsAe3MmPURCtLedlZ6LYBqzD3DCwRYFYjUHbmkEGejom2u
         DUvw==
X-Forwarded-Encrypted: i=1; AFNElJ8wP7Gus7fa0ttPYioNGdc3qu2kXH4KOXn+7g57HxMT1aiW5H0XuTlAaKss8SThG8TrZ9gXZ3ycKcsoGZW7hw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb7QPzR8+o/kljHyzBLFmGtNlLXnv+/q6UywOSRmHO+mxfDfX2
	R3ovIkvoqVJvKY1Esuzf0LcVqGbusa5VBOuHadSzyeaDT/0tWwFmr7G7
X-Gm-Gg: AeBDiev3PP01c/xO3jV/wdetIfYZExUowAFj7W2SsAZawDk2gSCoRAEry+kV5Mh0zfR
	LlamwkBJcMCwbkWGwlg1nJUANHwzxWDl9zwulrejudTT00ECkuR3ENDwlcbpFK9tdrImac30bF+
	tvBD+MIAlyq+QT/vtmBrX/VUa+HcXBl3cQAlMIJ6MuIPatIoI5gix5hScG/oH9aC4CQOEd8A8nn
	VUoWCJ3E/o07ubG0Vt7niSCeOrEx6a1/oV3LJCn6tpU4fMOKX+5VeJNmYounz0eFQsrbdKabNoU
	R+EjqjCIB499W/7b4C+t/ExJqdhBEZGKqOID5Vcuz1j8uYsPpZK6Yr13xWdN95DVhcDaPgTglOL
	uqcoaCQPcrtX2xDXSZNYayU3nBuwmIEv06jAAnwkfKzxoix619nKbsz1fufwnxO1oIdCunEp9Or
	d4tO7dSrCn6ncZZn8zTTxuWZd63sm/Vl33A3195goroiMJOFE6lEmGCWBY6POus7pFvcLndZZ5E
	BMw4A==
X-Received: by 2002:a05:6a00:4fcf:b0:7a9:d8a8:992a with SMTP id d2e1a72fcca58-834dcb99cafmr3645484b3a.13.1777396618489;
        Tue, 28 Apr 2026 10:16:58 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae2226bsm3370743b3a.18.2026.04.28.10.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 10:16:57 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	kaichieh.chuang@mediatek.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	manishbaing2789@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt6351: convert to DT schema
Date: Tue, 28 Apr 2026 17:16:44 +0000
Message-ID: <20260428171644.5703-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_101700_334651_2F436B02 
X-CRM114-Status: GOOD (  13.09  )
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

Convert MediaTek MT6351 Audio CODEC bindings from text format to
YAML schema to enable dtbs_check validation.

Signed-off-by: Manish Baing <manishbaing2789@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v2:
  - Switch to unevaluatedProperties.
  - Add missing #sound-dai-cells to properties and required list.
  - Update example to include #sound-dai-cells.

 .../bindings/sound/mediatek,mt6351-sound.yaml | 37 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6351.txt      | 16 --------
 2 files changed, 37 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6351.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
new file mode 100644
index 000000000000..b422e238b512
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6351-sound.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt6351-sound.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek MT6351 Audio CODEC
+
+maintainers:
+  - KaiChieh Chuang <kaichieh.chuang@mediatek.com>
+
+description:
+  MT6351 Audio CODEC is a part of the MediaTek MT6351 PMIC.
+  It communicates with the SoC through the MediaTek PMIC wrapper(pwrap).
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: mediatek,mt6351-sound
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+  - "#sound-dai-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+       compatible = "mediatek,mt6351-sound";
+       #sound-dai-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt6351.txt b/Documentation/devicetree/bindings/sound/mt6351.txt
deleted file mode 100644
index 7fb2cb99245e..000000000000
--- a/Documentation/devicetree/bindings/sound/mt6351.txt
+++ /dev/null
@@ -1,16 +0,0 @@
-Mediatek MT6351 Audio Codec
-
-The communication between MT6351 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible : "mediatek,mt6351-sound".
-
-Example:
-
-mt6351_snd {
-	compatible = "mediatek,mt6351-sound";
-};
-- 
2.43.0


