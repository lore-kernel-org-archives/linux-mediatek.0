Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6895CFA456
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 23:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=; b=G6jW1CS4/ATZ7eH2MSiqUKh3Mw
	LXMMPcbQIyw5C7p3xjWRbCmaxH7W+oLGkmuxpQvtKpJCyb3L0rtBxO7Pz7bul0VyTvxokq6197WlJ
	DwcZyJtmw7mPOCRJygW86BGy6V7cEnhsb5dnqz7GA5KdZfhi7RT+pi2Un0v3GqGO8MWA9EUm5oa4f
	YQBmRznFNzljd2avclaZm757MtpdkXhHd+oEYH9d7oLLNLVb08TnDRLigOZy4Oz+V7+AjNxrcCaSB
	RlchNsJCrpmfo+m/VKX/JstVYPhtIgDJ9H+NMbHTW0Xg/PavEhDlLBHl51oiKYYhzwUdZ5oKM9MUG
	KxqBg7Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6K-00000007ZHN-1IAk;
	Thu, 20 Nov 2025 23:30:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6H-00000007ZDr-1qVI
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 23:30:06 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4779a637712so9610815e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 15:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681403; x=1764286203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=VzgiVzyZtJeQLA4dHTRLX+bKdr9jU0bS4e5GjjKuOVu9SnpZriX2lbQQ0CDN4urDD6
         pIv8wwm6zK9CfMRAiFXl+Csz7BrpNOZ9MwXA0GJyjwOfVt9ZofkCM5i00H0xB+Vz+OtF
         YgtmxXHyKmy4ycs82QxuQrOAGwCGBdx1EtOpb5mfz9DXqWZJTZ+THkLujaZ6pUKUPkss
         es51vaN3O7Kf6Bz3glSkfbpgx/BJ8tCtXDSRs+yjJOXnQ1c4EFOAF05G9OloG8odAmF2
         rjgUz1HCZdfDlIbdwmIY4/EERB0gnkmzVDT+1LduurwAe/756XEvSicypsx1shaWZn3Z
         xghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681403; x=1764286203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3+/E1TIhpDRo8RKAqJEHauT5WqKU3CX8xyLt8d/UFSM=;
        b=hlfP7BSY1gWsL/5cOB8FxBY7NI84IsDfogoiGSo8fISjXKpQ/ftlU3paVqM1OedoDQ
         ZwnIgZ3g+x5NFQYxvpLfp+gOrIkXK2ijnvbd3VMZ0hZjih/Nwh6Xv2gVCexPjc8vd61p
         A45OANLegaLnHR7EDxlLMN4Fsm9VgD1F7xKGErx+yIdjkp+cKjjBuXZUtDAz0oaJIV1H
         2AFZz9fAxn+H2lhrI3oSCfw+69fdpaOFMSVSTnnTN/6EJ3GFgp+jvONYXBQHzDxf0a84
         JsMGG6p7TklotCNqEl1cHnXOWeMYNB73cw8Z6LTKdI5wvs8hwE5Rh9A/C5GrDGEssgkc
         hH9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9KQH6R0PExj4gD+FwO5x6lkAggLipGXaQSFleB3L/wHsr6wE/mvd3JoBgJU+mhGgX1ozzqTSNiRmW6Ndb/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8BNKNf94vCBW0ZxynIy/aYkn25/3qusZ8f8sWIQrn6uy0L3wu
	XXBh3ES4Xhe/au6WoZhGbPOFoK3EjsCn8AYW5IBfwwE/TZ5RXWgMS9Z/
X-Gm-Gg: ASbGncv0nZAojvVrYunqiN2cACiFfM11+tqU9Ds868PWCMdcYoZ3ojA2CRBxRasEJTD
	BbNHN2khhmZwrGhAhW1izxk5CQJHm6HcMFKFcvTbSkAllDxjs+Kcu0rhBJgg968zp3MNdUp/JUc
	JFlbK6uAP/QcehR4zZ4eW9gpyS7jVwstYV4JD8YIB37J/rJSaYyLiJVldKZgaI645utIUCRy8hk
	AcjUmg40PInOg9KW3XavuZbMk4RfA8shXoAJ8YaAyEeb0jXWzLlljjKc99dzyqu8SeLcuAeY82S
	5xyp7mFtZxptv3+bkChHSEclQ9O6/kOwfklOStDdGQwgSKnmyvFZfLl/tWUvq55Ev/KSsDf98Jl
	AeL7k1mIW3FsfNeeIvkcOdcaO15WeF4OvXktDbenNz7iD+epxE1Wefk7pfdb35AWg4ile7gRzdk
	HXrXiL2aHFohLM9921HHvZ1b/TbC9s5jw0/ARghMBTDZXsh/Y/q5g=
X-Google-Smtp-Source: AGHT+IHqEb8VCudY5XeW4oLvZSGAjMxNC8ruQ7rhvDVg5aKGaQnnkgzkoE9uKt2k4/hXUDSeMYg4Nw==
X-Received: by 2002:a05:6000:420e:b0:426:d5a0:bac8 with SMTP id ffacd0b85a97d-42cc1d19624mr85145f8f.56.1763681403285;
        Thu, 20 Nov 2025 15:30:03 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:30:02 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
Date: Fri, 21 Nov 2025 00:29:11 +0100
Message-ID: <20251120232913.32532-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251120232913.32532-1-ansuelsmth@gmail.com>
References: <20251120232913.32532-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_153005_521653_FC4312BB 
X-CRM114-Status: GOOD (  12.62  )
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

Add documentation for Airoha AN7581 AFE YAML schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml

diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
new file mode 100644
index 000000000000..ebeda0876280
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
@@ -0,0 +1,67 @@
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
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of AN7581 platform.
+        maxItems: 1
+    required:
+      - sound-dai
+
+  codec:
+    type: object
+    additionalProperties: false
+    properties:
+      sound-dai:
+        description: The phandle of wm8960 codec.
+        maxItems: 1
+    required:
+      - sound-dai
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - audio-routing
+  - platform
+  - codec
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
+
+...
-- 
2.51.0


