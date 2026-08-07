Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C32C5AC80
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 20:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=; b=xP1Tpqn9nRli0BBJowXxQSm7Ot
	6Gho2N3JT9TUKwDMCOoI3/x70nIsrApSZ+iNtrnqUozCp2by7x0nNfPEeGd9I448kn8M969W41JRm
	WtiDfZlqNXTefy5Y9UNEqSYc+QDjhC6AZRvE7M96xvKx+c+DOCfjaQHc6yr2kO8XxHBiYhNmFP63l
	4lhT3g/wieOUZXOLyUsXMG7VP3QsVvcsWsVfJ22u8+LpmHDRN5IdrYienCZzDtKpco2QrQZDvQT8V
	po/w6t7P1CswsK2XEzKbJFsK9EDPEYC9ja7Pl2WZjs0ZBa0uVbTZB7KLEhQOyeK3oTpprbKsyYh6Q
	hWXa8E1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt7-00000008hLF-0yJi;
	Fri, 07 Aug 2026 20:09:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt3-00000008hHh-3h81
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 20:09:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4980dc26022so37692345e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 13:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133388; x=1786738188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=duhbJavEZKCSp0NjaNOXMuNu5N4YGq/klgZVD+ljjIeSBC1bffF9czUcV/DV8Q1qpR
         y2EAoeJn6IDPEUtXjmLUmrW1mW3U/ZIVUYICAz3/kWhAD8wb0DxQ6iTQbu8Vri6Lpc6F
         tNqsqKQMeJtZvfE4DL1NDgl3Kub3NRroGXuwtDVcky+whaF+AdWDGv4O7Dvv67q1vGBc
         43G6PxIBLm+1YFM4ZH16QdtHx7ziHdkIa0tNj0PpKXTc/wwj6B6WxrYu2LMkL6xeIiWe
         xlHyrIM/X2eRksg8sQ4NMnN69DHwYHN2HPpZq8bm1PyRO+6ZX5y+wSup/m7AC9IXCa7w
         Aw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133388; x=1786738188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDFqPj8lYrNqkm6rPond2RAeUqExmlqhsFWYW68q/vg=;
        b=VAnwCKm/I7XXnhqVxN1kn1CNMlg/XyxJOnyuVDys0meCUZ4OOhKp+Bs+KNhiFCQPpV
         4Ecb2//5M+SCf8a/B7m06n3xuVAYm6XuqOkybHLguG5kX6N9Ntry1lHjYD0D/xzKRwLw
         kE4geFeHDRcGs6MYQMe8dTV04fjQqsdwX62YrgjlnELBW5pSNeca7b0Fs2Y7oOtJBSSq
         3ksdQVt5UoZh0NhbHIeRJgpNr3hXAKHGQoh8UtZL85hscRQDOW8rjKg182H7JXAWVhrv
         k9CG+ldHVi19y+AmWefvbXWnSx9Nw+ALXgqTbb0S7GQylkFkt+LtGkVOGBdXf80m/Fdg
         Jlug==
X-Forwarded-Encrypted: i=1; AHgh+Rq2wnHG8uAyIstwGI7WJG8VZ70i4rmbjaNOnOmYpKOO4Nl64E0170OvFjY/PF+4P5joWebc4WBeCkuduKzlpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfrVWtzObDOd+Sm/2YzOOLCiyTt4xAb7Qeh5Lk7JTbYJ6L2EJl
	d/XYH1WDGJZ+DHToUf3qaPV+XtiJsW3hYOXVsQ2GARPGaTkupmok3SRa
X-Gm-Gg: AR+sD13O59K4a/LD4VdtavnPM9Qbyq+N8XOUcnOFhXy9UH1HQMP/ZGDISeJT2DQ/hzu
	0UgqgkJEDPdqi9usS1AfnOazAMi9GPtsi3wRgjKyftGNOGiFDD3Q/Gl1i/Gb/8frZ6e1Q0A0rD0
	8Pz9IqL4g4cMujaIuwIMqpVJVXttrrpHmsBYv6sU7Phxlg9K56saCzDpuOmVP20sHffAefYDD7X
	15p9HV0HsvXLjzdGYbaFTWJGACg76QSSBcf8W8k+xGUwyAAKD6pl3LUA2JSIpvFPktVwjGdn8fZ
	veV6ZaN79t6oSBgprhMqI+aUhqCXo3TT8QZdjbCWddOcwg1/yABwWJZMyZ5xl86Ij6LWZozawbw
	a0C15aMW3qCT+j7WYQShBt8Z8/Tkaq53cGbI2eBJBVUr8tVM5jfvQ9iKcb9Wf6m6sTq+7jQvVNM
	+48RCcGMQ2eWV1oIpcxzWWhD5k00keNhPrens8TSw2IZJNWlVtYtd+T2xlrSCFhxNK8g9sSvs7A
	Fjk+CGov2Dp0JiBlaN2As8MlsOtMEMe6SuL40ErYh/NoFtPxh6xFg==
X-Received: by 2002:a05:600c:1f8c:b0:493:f5bf:4dc6 with SMTP id 5b1f17b1804b1-4994e7a820dmr312951345e9.7.1786133388229;
        Fri, 07 Aug 2026 13:09:48 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:47 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 2/4] ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
Date: Fri,  7 Aug 2026 22:09:32 +0200
Message-ID: <20260807200936.201827-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807200936.201827-1-ansuelsmth@gmail.com>
References: <20260807200936.201827-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_130949_938983_DCADD586 
X-CRM114-Status: GOOD (  12.38  )
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

Add DT schema for Airoha AN7581 Sound Card with the specific WM8960
i2c Codec.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..8886fbb6b43c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 sound card with WM8960 codec
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+allOf:
+  - $ref: sound-card-common.yaml#
+
+properties:
+  compatible:
+    const: airoha,an7581-wm8960-sound
+
+  platform:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of AN7581 platform.
+
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+
+    additionalProperties: false
+
+    properties:
+      sound-dai:
+        items:
+          - description: The phandle of WM8960 i2c codec.
+
+    required:
+      - sound-dai
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "airoha,an7581-wm8960-sound";
+        model = "an7581-wm8960";
+        audio-routing =
+            "Headphone", "HP_L",
+            "Headphone", "HP_R",
+            "LINPUT1", "AMIC",
+            "RINPUT1", "AMIC";
+
+        platform {
+            sound-dai = <&afe>;
+        };
+
+        codec {
+            sound-dai = <&wm8960>;
+        };
+    };
-- 
2.53.0


