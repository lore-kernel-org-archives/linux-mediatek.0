Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54062C27C79
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 12:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UWyVc4M7eTb5AGiP+8W1B/GV5kGh/LRVFNVuCTnSM0=; b=GDFHc4DpX4zXDEKWjgVv7EGQj5
	NvslqG9uUTYIw8fTekAUtXttYJXjelKImtcS9yBP8K/QbDW+7hKCyB45KHYmTwdAsz5AZWZVWivoT
	QhAjXSeO+dWqE/cIo5iHUdoHPpbZG96G62S06HXZTsHkJl02YN/vEfLjeyVIX7ukBOsVzOjpnpbcu
	U6NzwOKQ2Y/T/rQcYikCxz6MWhfIysKzSumMiRnHwHgiiLOlehk4abFCuHe5OM2Gqp3izw7r0ic+Q
	jB2ZMVBbpnt/UwRRKKQN1OZHdnjl63GBrhqL/mncY/FvdEc1Z9IZkJS5swliKn7MFliXVopkr/CUB
	qw3lQclw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBTn-0000000Ae8v-07Ko;
	Mon, 17 Jun 2024 12:28:59 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJBTi-0000000Ae6I-2f58;
	Mon, 17 Jun 2024 12:28:56 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-70601bcfddcso773838b3a.3;
        Mon, 17 Jun 2024 05:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718627333; x=1719232133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UWyVc4M7eTb5AGiP+8W1B/GV5kGh/LRVFNVuCTnSM0=;
        b=lWm4CrGuc+rtsRdrrle4JWpaAdU1h12MhtEStG7pYEwBe9kIoJZOmOWiA9hmrO9jJW
         tLvb844BjOZulvdA/X6AFNmhIddWGyLrJgz1ymil9D5KK6FXVuPdJffWDfXIJanz82HZ
         ByH+RxgKjAM4YdTZZ5WlnxkMmfLJTZwGs2SisvmztJH6esffwpIg3RQHVC1etkSECfzf
         O9qnaRe1l+RQseQuQn8u7K02qfN8pyjnrmjo+lggPX2ZfqjTt4sp/DRtBCpjijLEzK5k
         A5ycVE8u+scdZf1yjV/AwVF1Q3yoqCR/Gwic6Jz3SxCe+bepCsjVwl91Hx517fmnuAc0
         ATIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718627333; x=1719232133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UWyVc4M7eTb5AGiP+8W1B/GV5kGh/LRVFNVuCTnSM0=;
        b=ExW/6hGcFJP6jDqcAJPzwKfQ18RBORGdkmEvOwPQcMnv+nlsClX5Ab/vCNUYoNXunu
         jxz3Ox/vfmTwy2Lxwr7H8DWz8797G7E2n/CbGdFqk7uepW4ISdHb57sp3DsZOxMp8sec
         I1IPt+ZgffbW9Gj5wOhhAxUsxyAT5T6x70btbEK3RcrcmBMA1sOw8lcrVcT0UG+dhbVf
         WmKXlmwTO7+de/RRfgivmp+ryPyMBLBUl+kbRohbDBm5sTm/iU3aHMW4KdfWQ3nb6+xZ
         oWhmFR3uHLLpW5h2oYx3U/FyV7Nae56vMnI5xnd2sApQIowP5dzBfzLRxEeIleZ4j+oN
         NbtQ==
X-Forwarded-Encrypted: i=1; AJvYcCWflgNrwtKW4blhiNnNw8THdybFBtsm7afR15wfWZ5OwbBKfDdSLEFJ/C7NgNA3+lr0h07h99dAqliULsBARJ46JBHIh6F9cHCUFmv8toGrWsmAjYIN15oLZTOscOWmfRdnwH2xlMC8JGceRyZoLFQNuGppLfP73ow=
X-Gm-Message-State: AOJu0YxEnBcQWAZsZDJmLS+be+dUw0bvoR1W8dY5/YuM/oi+AsFj+oG6
	JLkv48bKxpcM3dDPYyLBhRbBNLF5HFB6iJ7L/VarXOCYo9Zjtv4j
X-Google-Smtp-Source: AGHT+IFX8izB3mF6o1tiQTdc5a0wzAqibuAMkHHzv5Ut0LqmOs9G8XhTl1gow2d9zNLssWlR5qsHrg==
X-Received: by 2002:a05:6a20:6a0e:b0:1b8:9d79:7839 with SMTP id adf61e73a8af0-1bae7effc98mr12104061637.29.1718627333484;
        Mon, 17 Jun 2024 05:28:53 -0700 (PDT)
Received: from localhost ([103.139.191.219])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-705cc96ad04sm7270453b3a.64.2024.06.17.05.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:28:53 -0700 (PDT)
From: Kartik Agarwala <agarwala.kartik@gmail.com>
Date: Mon, 17 Jun 2024 17:58:24 +0530
Subject: [PATCH v2 1/3] ASoC: dt-bindings: mt6358: Convert to dtschema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-mt6358-v2-1-5d9f0e99941e@gmail.com>
References: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
In-Reply-To: <20240617-mt6358-v2-0-5d9f0e99941e@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Kartik Agarwala <agarwala.kartik@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2904;
 i=agarwala.kartik@gmail.com; h=from:subject:message-id;
 bh=GviW3vyE7t+vL36TePuj3TAtuG/gJm5Rgr4v+yi5ads=;
 b=owEBbQKS/ZANAwAKAXiEk+OPlULqAcsmYgBmcCvzb44A13hQbJW0d9knuBiV2aIhmZMQt5B9b
 Li6sNgX6emJAjMEAAEKAB0WIQSJkbnrkCGnamD0k/R4hJPjj5VC6gUCZnAr8wAKCRB4hJPjj5VC
 6h7yEACO+1WuhhLpKGdAP1zmh186r4yNnl3tAWy0/iiH1rmNtLmooqWEB/6c2vr4MKJtQsihXvk
 y88oe4TCDC+dChZOlTTm2z+HaFg2315xokSnvewkjkctYYoJczspb8htCsgXy5mamSYqpNtTFpt
 FsM0vVGG/SLz3lVITh6jd+PWHWNnDFCSGvIIc/Kt/AWr86sxOy5RXoPx/FR7FgAxBNcAl1S9yPh
 8CfxuHz0IPso5X9PyUrCNpbhFUdquFoVPzsSKQPMk9KvAM1qhXlv5ZYs+E/+x436RFeqXRUvOhO
 hyAOWEMel7lHOsmP60TVqw7zR86Og6feoJDlBZkc7Q7e484tprwVcHJGABJNnXPZWd9XkoYvGsP
 0O2oiZF/wAZFhi17hn4QVL2tZ0xzxjjvlDfR6K+lJhsYT1yBpFYaVV6w4XqKZgbhaGCc0hkJPyL
 dtS0rQZxMh0TxjQhOMg1cc9FvecFmCMUM2kRpF85QdC9dAxaDForWax7uPIh/loaCg4HI2rOHTe
 Z5s6t/j7+mX/BaWZy8aPBUfIxc4f2Moqt8MKOv1gTabe28HQcOGIBEWl3o2/VJtIcclNeuJtl1H
 mSZivqkYIKAKBBYE14TiAvgZmb8BLlb99slcgHvSwu4N9ZoEvaR3Dv1MOYvdlz/Cf7+H8/5m9U1
 PNAR/fEp9snz31g==
X-Developer-Key: i=agarwala.kartik@gmail.com; a=openpgp;
 fpr=8991B9EB9021A76A60F493F4788493E38F9542EA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_052854_728790_8F802231 
X-CRM114-Status: GOOD (  13.98  )
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

Convert from txt to dtschema
---
 .../devicetree/bindings/sound/mediatek,mt6358.yaml | 51 ++++++++++++++++++++++
 Documentation/devicetree/bindings/sound/mt6358.txt | 26 -----------
 2 files changed, 51 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
new file mode 100644
index 000000000..336d2d969
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt6358.yaml
@@ -0,0 +1,51 @@
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
+description:
+  The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
+  For more detail, please visit Mediatek PMIC wrapper documentation.
+  Must be a child node of PMIC wrapper.
+
+properties:
+  compatible:
+    oneOf:
+      - const: mediatek,mt6358-sound
+      - const: mediatek,mt6366-sound
+      - items:
+          - const: mediatek,mt6366-sound
+          - const: mediatek,mt6358-sound
+
+  Avdd-supply:
+    description: power source of AVDD
+
+  mediatek,dmic-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Indicates how many data pins are used to transmit two channels of PDM
+      signal. 0 means two wires, 1 means one wire. Default value is 0.
+    default: 0
+    enum:
+      - 0
+      - 1
+
+required:
+  - compatible
+  - Avdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec {
+        compatible = "mediatek,mt6366-sound";
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


