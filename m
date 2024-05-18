Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7098EC25B74
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 May 2024 08:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eEo3Oc4cs0XxLO515UB83B0dN8f7TDFENOMb1E+m+II=; b=ctIc5U/2l2WqxNEEOKW1V0OFvN
	GMfkaD8jwTyyHc1rAINClfFRp6cZiTFASq9LsGDCC3CBllqOTlwEkUHzaf4iFn7VK20z7aJbLsA8j
	6/iaa3RQx6PIom130OBuvmKdWMCiSziRLcdA9RlkNkuPh0LivBUHlZfDTjsXzqcy51AKJr5OKu/UN
	Dw/Jd6gLdBiTaS0IU8Xqz2POFSG6DhhTWFbvwea8g9pAaV5GnSmb4vl4Ykf/wqeD0t4cn6+YUj7nj
	pgUHe9gfcgVc6hadwqtA0zWVZ4mlKKQ9Fm/Jo+FjpgUiKpd07lggsxIW2OxKX6pU+2SrnmMzF/uJX
	SqqkXFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8FFj-00000009ko3-0ODk;
	Sat, 18 May 2024 08:17:15 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8FFg-00000009knI-1yGC
	for linux-mediatek@lists.infradead.org;
	Sat, 18 May 2024 08:17:14 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2b6456f7e94so615494a91.1
        for <linux-mediatek@lists.infradead.org>; Sat, 18 May 2024 01:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716020224; x=1716625024; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eEo3Oc4cs0XxLO515UB83B0dN8f7TDFENOMb1E+m+II=;
        b=mQuVmjvICL9jXP1IgCvbqWTrkGVom6UY1WB2rGRaFh8VE/OH9UiDNW6X5LFfMipNrT
         dvnCjVqRDvp+HGFpOHhCHxyGUUwirLWogWze4GlBvxVnm9faVwZAYo8zxz81CIk+inb+
         tQ+qJkYK7GhLL9p/a2m2wBS9FAR2+xusQIojv3Cgj4nyRYoyaWcHB+abnIDpwoJbEe7d
         Uv/8lDXN6PtpQsZdazCty7HASr0BBzgY1pVc6uoletEs5M/nz1K1/N9PfqZTmhAcxogi
         gnp6nGyQlwN3DnMZIgNz3dIu+HNwzcvICjIdTFMiGqayMicaVYkMSJrKR8rxFqgRIz8f
         9TXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716020224; x=1716625024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEo3Oc4cs0XxLO515UB83B0dN8f7TDFENOMb1E+m+II=;
        b=rOttUq0xreLNqvQhnueAxLbKF/TmMGJnb4v2M7eUD1TH5VrHIrd7GQRBNWcqdW9epb
         y5EM6DHfSdUkJMh2sZBrCIAok7Eg6JwnjiGGw6TOT2iJG2c+Db0QYcpUmp7HdeLndCu9
         HUusjWvqGIXCjC6aDn77VIz6cGCTabi5kPh6WP0k1qcVuzVLSoooR1iBHs/FL+X1RGNe
         B0tTDGP3mnwvE6ai6tuvcFmDB1MmByDaMvxDWg3Lyuxw2mQqo+HBaXoziVu6iVjh92Yz
         UOL1mM3xd1+qaHnIhzX5pzxsA+pi60tjobE9y8Ex2ffmPm7liyrWk1anB2fSukLlu79w
         D5jw==
X-Forwarded-Encrypted: i=1; AJvYcCVjzYfWWaWU6KpsKtCVPRBufolFDpCFEKNnzcCjqQ8iEwPxvGgoYWitSieGwoSMhofZ4NlXkckzn2fmdGQc3fkSxFMI/K0YajGeXOpPhzQ/LZ6V
X-Gm-Message-State: AOJu0Yxi0z1Qwja7b6nVgHW4HeWzKJr/vpLTLPORpTlF6FMSx+ydv0DU
	95k5x6xmpsmjhtbee+PodtDychw5GtHMgwcX12Cel6u11aFTVIxD
X-Google-Smtp-Source: AGHT+IEYClpcc2JB0wkn40mXXwzYlNasuTlZSZlGFYWxAd2QzUJBsoDR4nrPV/Qk0HVeQiS8uVPOSg==
X-Received: by 2002:a17:90a:e616:b0:2b6:214a:71ac with SMTP id 98e67ed59e1d1-2bd60353110mr1829100a91.3.1716020223591;
        Sat, 18 May 2024 01:17:03 -0700 (PDT)
Received: from localhost ([103.139.191.219])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2b67158c36dsm16543849a91.38.2024.05.18.01.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 May 2024 01:17:03 -0700 (PDT)
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
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: dt-bindings: mt6358: Convert to dtschema
Date: Sat, 18 May 2024 13:46:22 +0530
Message-Id: <20240518081621.63386-1-agarwala.kartik@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240518_011712_570467_09C09CCA 
X-CRM114-Status: GOOD (  13.41  )
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

Convert Mediatek MT6358 Audio Codec bindings from text to dtschema.

Signed-off-by: Kartik Agarwala <agarwala.kartik@gmail.com>
---
 .../bindings/sound/mediatek,mt6358.yaml       | 47 +++++++++++++++++++
 .../devicetree/bindings/sound/mt6358.txt      | 26 ----------
 2 files changed, 47 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/mt6358.txt

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
new file mode 100644
index 000000000..f57ef2aa5
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt6358.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek MT6358 Audio Codec
+
+maintainers:
+  - Kartik Agarwala <agarwala.kartik@gmail.com>
+
+description: |
+  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6358-sound
+      - mediatek,mt6366-sound
+
+  Avdd-supply:
+    description: power source of AVDD
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 0 means two wires, 1 means one wire. Default value is 0.
+    enum:
+      - 0 # one wire
+      - 1 # two wires
+
+required:
+  - compatible
+  - Avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    mt6358_snd {
+        compatible = "mediatek,mt6358-sound";
+        Avdd-supply = <&mt6358_vaud28_reg>;
+        mediatek,dmic-mode = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/mt6358.txt b/Documentation/devicetree/bindings/sound/mt6358.txt
deleted file mode 100644
index fbe9e55c6..000000000
--- a/Documentation/devicetree/bindings/sound/mt6358.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Mediatek MT6358 Audio Codec
-
-The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
-For more detail, please visit Mediatek PMIC wrapper documentation.
-
-Must be a child node of PMIC wrapper.
-
-Required properties:
-
-- compatible - "string" - One of:
-    "mediatek,mt6358-sound"
-    "mediatek,mt6366-sound"
-- Avdd-supply : power source of AVDD
-
-Optional properties:
-- mediatek,dmic-mode : Indicates how many data pins are used to transmit two
-	channels of PDM signal. 0 means two wires, 1 means one wire. Default
-	value is 0.
-
-Example:
-
-mt6358_snd {
-	compatible = "mediatek,mt6358-sound";
-	Avdd-supply = <&mt6358_vaud28_reg>;
-	mediatek,dmic-mode = <0>;
-};
-- 
2.34.1


