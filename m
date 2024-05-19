Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9ACC25B75
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 May 2024 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pO3NRJbXmJSf+e3cfxUxA2NqH4epjg+9R2AbvoM+0ZQ=; b=xIDoZWNnYFtsMJVTqnpwLEIafj
	RHaCEHjdIXuoYCgfHYmkwXJngwU2QTC9lnWKJfYZcj+NSQIRKuvlXgMpW8q/mVgK15S9aye4bagKD
	7pA9fjML4/+KjDwyyyP7PQostsf4ROG0//QD9w9jGftGQzZFWuDwey76HTj/kXO0rg1HJKo+do1J7
	EG99z70OArfkL3s85Os81toSt23KkQjbWtgkRtyuTcjCvhJLL4acuKg3PQ2ww48Xwi8//u0aPLat+
	/nDTT6LqA3EXyG6cJJSiG3+bjQaHj5pdqAY8ysh92/Onleppq3XTOCqLE0YPY1kdVg0yFw4GE4gfc
	+apnPJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUr-0000000CWXd-3LX8;
	Sun, 19 May 2024 18:43:01 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8lUZ-0000000CWJI-1cYX
	for linux-mediatek@lists.infradead.org;
	Sun, 19 May 2024 18:42:45 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a5a2c05006aso352323066b.0
        for <linux-mediatek@lists.infradead.org>; Sun, 19 May 2024 11:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716144161; x=1716748961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pO3NRJbXmJSf+e3cfxUxA2NqH4epjg+9R2AbvoM+0ZQ=;
        b=Hvwu/VEdWWIF2UrSK5ImlqWrh0MfEOp3/nS1/Y3OYlDcqKMCkhzy1KaM0SGp4TqFks
         mPsqV5RiBcTm1fXeKqwD/4D66hU6IEhbyn3pHvybdBGPgPS1BEXoy1kQj76NulmnbIB5
         tl+4zKMgiSpvmyeRQkn0cHaaX3IAKmugq5FeirB0XYM/IjdPNdx0XP4ozGM+dBSQ2tNI
         wuxukCi0cwbUb0+aP8I169l0TnRoGvHz8scNpLlgqoOqNhoMzbHusQabWCfHcD4jh9l4
         yNbjhNgpHwOcJ5kAwuJ6K4Avvz7c+f4TNBqOJfibXbqFqtloHDotmlxK9D+qu0aO+jgQ
         /Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716144161; x=1716748961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pO3NRJbXmJSf+e3cfxUxA2NqH4epjg+9R2AbvoM+0ZQ=;
        b=p4rU0TUoGb3CE3NdF8x1MM6xkRVnMFjgbssj1rn9g7TigoL9g8R323ccM3VQKIyLPg
         5WBRSSJk9FgMaoQn6FEhnvHE6BFEZK1XgdIetBcAuIMaarTHAhA/ipe6eTIQN2J3WklU
         cMLeqMO2iO2nqNlTsRtqWnitc7p7dbaTU0A38VxyOgej8IdVZCvZz7u/lVFhk0cFRfnp
         GZVXd1ESknM6lQHsg7/7x4QXDITf12JvSaWK2I7R/o4yWceOVVXv2/8Ne3ef6gXRuqCl
         Pdt55bd9zhrdQ3fJ79flcF5/b3bCbe4Ve5qnWWN5yEi+vkhPTfZS7pjQSn5ZxtrvGmgR
         PbLg==
X-Forwarded-Encrypted: i=1; AJvYcCWSdNUt4VGMuBK8H+UbuAjbUlzmd+Yu9kMQ+DTLcecYa8Ijgukdf/0mJhmL4z6Y9F+zl2Rw+UmmynbF71uYIXVOZ/i94MbntpwW7tfyaXpw3ja+
X-Gm-Message-State: AOJu0YzQUF+AO1n9LEbkeTW91Sqa/VcfbYQRI88QlYnukzCj8tIW3pIl
	kNVG9iF7AYISGB60jZywK9eGvGY94cHqqL1IZ5hNvWTT/0jKdf9oO2oMQobbouA=
X-Google-Smtp-Source: AGHT+IFNTIHL/HAyLtlYVOw2G80nM8amYN3Wp95SxozD0aVeP2XqqzO8ZCvlEpt6PEE1lQxrXtDAZA==
X-Received: by 2002:a50:d4dd:0:b0:572:a089:75cc with SMTP id 4fb4d7f45d1cf-5734d597e13mr23782682a12.5.1716144161651;
        Sun, 19 May 2024 11:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-575313d97desm1789397a12.41.2024.05.19.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 11:42:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 19 May 2024 20:42:19 +0200
Subject: [PATCH 4/8] dt-bindings: soc: microchip: sparx5-cpu-syscon: Move
 to dedicated schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240519-dt-bindings-mfd-syscon-split-v1-4-aaf996e2313a@linaro.org>
References: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
In-Reply-To: <20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2709;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=sX/Xtm/fQMIFqgBRxKVvaSRYJ/1XiD5kxEcRC96ApDM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmSkgTzszfJvvn6dxdlgvQdJYbCuu2hWH8maiGi
 0mchpUi/KOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZkpIEwAKCRDBN2bmhouD
 19SzEACFyXW1D5nJ6zktVW0VlHljoq4UjhZqFWmx9NykeR+3MhUD2yednyILUzMvYPbVMda0vLF
 sF3u4OtPwU4yDAkqLYjMWtvVq1/nLRGjVmPEAp8wJCE2jN5OFKgO3QI+zjjsQX+K3a5/P93xPUN
 Jj62P5IJezthxuNBpUl08Bgqtx7UT2N1hliD8mEGDC9Yk3XgU8UbJbfCZVCQ0aWeeIC8wdte9+r
 jnyHkzOKJyLRkFc94vx0VfKEHh540EOOYiV0ZknCL0FI5mnjfqWwtqOMRZDeFhuc2dn/Cq90GAT
 gPNPA+qg0bXF+V5kOr//7fTojf5z5F1kPfNN/iauQy+iqrOTOEP3CtBp4aUSsmSRqvqRKpSfTeS
 lNek5mfC9vf6jJ55gvLQCZiBXeXKzS61ytB/SdnTH+opFveaY4znDfYxaJRVcNmMVUkNGL9qvAk
 WRUfeqzFG2g39GuHXYQFv0R8fvmCrtGcLtr3d8M25wSJd7rtF0MN6jTSP23YODWBA0VpDzlI/e4
 UTxgWuUXJuvYYDrPK8RNzlP8K+dHwANXXL58uSZ0oAuSf5xm0i+JnFoqxvmBieIgeTPyMoy9e+J
 XJ7FcwswIXaFIqg6UtzqOA9ffDyrtM4AyeNXj2WY1XwgSKhR7F/Cq4Mq3+ci+7EMA3JbCIt6E8n
 iqNMasqicJOIQdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_114243_518698_269E68A8 
X-CRM114-Status: GOOD (  14.57  )
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

microchip,sparx5-cpu-syscon is not a simple syscon device - it has
children and implements simple-mfd compatible - thus it should be fully
documented in its own binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Context might depend on
https://lore.kernel.org/r/20240510123018.3902184-1-robh@kernel.org
and also further patches here depend on this one.
---
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  1 -
 .../soc/microchip/microchip,sparx5-cpu-syscon.yaml | 49 ++++++++++++++++++++++
 2 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 5a0aeae24a50..91adf781e8ba 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -95,7 +95,6 @@ properties:
               - microchip,lan966x-cpu-syscon
               - microchip,sam9x60-sfr
               - microchip,sama7g5-ddr3phy
-              - microchip,sparx5-cpu-syscon
               - mscc,ocelot-cpu-syscon
               - mstar,msc313-pmsleep
               - nuvoton,ma35d1-sys
diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,sparx5-cpu-syscon.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,sparx5-cpu-syscon.yaml
new file mode 100644
index 000000000000..1f0b542d2296
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,sparx5-cpu-syscon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/microchip/microchip,sparx5-cpu-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip Sparx5 CPU Syscon
+
+maintainers:
+  - Lars Povlsen <lars.povlsen@microchip.com>
+
+properties:
+  compatible:
+    items:
+      - const: microchip,sparx5-cpu-syscon
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  mux-controller:
+    $ref: /schemas/mux/reg-mux.yaml#
+
+required:
+  - compatible
+  - reg
+  - mux-controller
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+        #address-cells = <2>;
+        #size-cells = <1>;
+
+        syscon@600000000 {
+            compatible = "microchip,sparx5-cpu-syscon", "syscon",
+                         "simple-mfd";
+            reg = <0x6 0x00000000 0xd0>;
+
+            mux: mux-controller {
+                compatible = "mmio-mux";
+                #mux-control-cells = <1>;
+                mux-reg-masks = <0x88 0xf0>;
+            };
+        };
+    };

-- 
2.43.0


