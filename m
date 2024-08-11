Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E095DC52D7B
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+nOiSZVTAGXNGH6eneUy74cyMDNkjNt6P9eyPr5+K8=; b=TDk0U0nWdVQkgunNVXWSN4G3WL
	uwXNA3AkyzDhfyu/nDoGjhtGNmzbsQHkVLz93YG9W4LOLI/TVgb89X0bv+9UbiOtU8YMHjV4q997G
	HbYrL7yMEm9OpAVsL8+eg/2btACrglIKvJLcMVCVdDy1JPaqEyZGsxvIL1Zs8pe6tiDiD0uxC5C2M
	xxGC37Y9zIFTVBUWiOtt0r4a5suMJ0cg+JXIopjPKcyXP8hiS0zrHPyY/g9oRMKmuVElayqSHscXY
	56uh91+DsxKdJ0oRkRRH+utRlLQ6i5V/JmZd/iAenffgIAslZ/OQFJa6FPdGAQxHA4vkmOrmZuyLv
	i+biRHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD9q-0000000Fw24-1XNa;
	Sun, 11 Aug 2024 18:19:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD88-0000000FvQQ-0Uxx
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Aug 2024 18:17:26 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa63so4182303a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 11:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400242; x=1724005042; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+nOiSZVTAGXNGH6eneUy74cyMDNkjNt6P9eyPr5+K8=;
        b=ggyJHRPdkDj514gzLLITosgpekxff5X/X9yn/d6Q5s/XhzCfbUZsxxxDhXcrmPCysO
         fvDXEKf4YiwGm6xahD9a0T0AqE5SkeawtFKtquh77ut77NCerRmHFHmoxrCF5TFdbdAA
         9p/0W0KitxTDqWpYxy3W+uY4crq4tW5+tGbSpFVYIkJ3FmfxI3jptPalYGdXJEMjQJE+
         2CtqJ0/HLoS/rQVG9+0h9t1QBMo5EqBe+Xv2Uk+tNw6h0qXgaoaYWhbt43NxeFdXNCOW
         RLdjgtvwhRHkQSBZqX1agmCkAdarelvK9WppOfiagDSp/huudNy3smDrThh97g9zTN5K
         pOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400242; x=1724005042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+nOiSZVTAGXNGH6eneUy74cyMDNkjNt6P9eyPr5+K8=;
        b=mFgujks6q9esnQoPpq5CttCYKjdltYQAcuGSFWIGqLgym41+F8kqxAJtqnbA1nUuzu
         3gvndUE0eQeojLzSeq4EkHbA5ufW5mijwMJ9YBpEnzDZFMKb5phliJXVxEknNvyMvTfU
         qnx6qHnavUIEzmH+AjxglIN9OM1pngneK0HZnefGFJ4P9pFvjchuJuXRSm1G7LCdiTKB
         N7i4Pdff5COhOzcvdMkXmMfpo+wCk5fI4kswlFq3GKYwqnCbfPrysNKU7JZQXPCDgRu8
         IPr5BA3n40xSfa7LdrqE625vozKl3JUtYMRnJMlJNtSToNa0TweZuuxoKnYqgF/ADiFS
         p8cg==
X-Forwarded-Encrypted: i=1; AJvYcCU/lF58VMAg+UeXhJ20FnQF2layORqjFfHtytTTxK0CBJ/CeUqNlpIJwKHcCZO6kgqo9ElREO4Ay1MlW28clfIBBPeJP78AzXotWWoeXNiThmSp
X-Gm-Message-State: AOJu0YyweE8YdrrF+9/IVbe66b98qi+bEiFzLSbfCmauYDaRlLN2j89w
	csot7cgJW9PJRxfa2oCKSnvb3nQU3Es7OkVzrAICGnuoXE6PSivsbs3bj9ogW9g=
X-Google-Smtp-Source: AGHT+IE4wd/lzE9MdP0YQr2O7QtAWAX9rdSp6E7hYtxz3L9YKcOJCmCuv9Yp3oMvUw/jaUEBy1XhwQ==
X-Received: by 2002:a05:6402:40d4:b0:5a3:8c9:3c1d with SMTP id 4fb4d7f45d1cf-5bd0a598365mr4773119a12.14.1723400241969;
        Sun, 11 Aug 2024 11:17:21 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 11 Aug 2024 20:17:05 +0200
Subject: [PATCH 2/6] dt-bindings: serial: add common properties schema for
 UART children
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-2-1dba258b7492@linaro.org>
References: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
In-Reply-To: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4392;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fCBvR5l2kfQnmClu3hY5hsw9S1f2r9uHvUNX7tLyV3A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmuQAoN9Yt8uNW6oM1DQmDpVszXdEiFyOz3K0sA
 EqCIJvkLqKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrkAKAAKCRDBN2bmhouD
 1yCPD/9U+1jRz1m9m7eSRZa9w5LcjzvIpO5u0gAUYN2i7+4oSzeapPYO1x3GLVZXs+CNtSqnGsa
 CVg8HZ3UA5a2m/BeSUdEYBEIBVAF2hiQMop7GNFrAh/i4ci0knu/KnN8OhbFoEAgQFDh4r9ssvT
 9b7riBq5tjmjBJlKOOEGFSjdxyutpeR0nS/h56HFwHEPJ0p0QagC9u9PGUtQ7r4bHHl5Lod1Ifp
 4Q4n6xQlYvEp2/B8I+elkuoJX6xcPMK7OA7JuhtiLmyxD6yrlx3KGt5LuFOxZuFNW44Vulk0f13
 030ZkZqEnSMeYzOIxNLO6gKBYScLItTPL6bVll9dCm6p0aHOF6NSqZ2I2JZ2pDh36j3S93As6/J
 j2xkLjLf4UtuQsJLE7ff4XvgN4WOf7jGvh9em4o+X5tMOm3kXQY1r9tXg1L7ChySOd3Rm6Eb1s3
 /1MNOq9SdUoQkxEEEO7aYSceeyYVrydUothpc1cai6L38N8ebsNym42PeKhzLUVv9Gwjuw374ez
 RJNHdgRRD2obRNRIlm5dksIrJYR0zBl5BwQ0Pq0JrUS0SYBC8Hq6CVgbgaB4NOaAT6L0n+/hBl1
 PztglQZlN6QhDSheKlYJ+kl5JR/mAxi2Q1TlFIzySPqSQsE48lMkRheqw9IZiutKMXQK81xF16r
 1VCwrDNITQCU+jQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_111724_360904_C8AAA09B 
X-CRM114-Status: GOOD (  21.05  )
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

Properties should be defined in only one place, thus add new
serial-peripheral-props.yaml schema with definition of common properties
for UART-connected devices (children of UART controller): current-speed
and max-speed.  The schema can be referenced by individual devices using
these properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patch should probably go via Rob's Devicetree tree.
This is the dependency for all further patches.
---
 .../bindings/serial/serial-peripheral-props.yaml   | 41 ++++++++++++++++++++++
 .../devicetree/bindings/serial/serial.yaml         | 23 +-----------
 2 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/serial-peripheral-props.yaml b/Documentation/devicetree/bindings/serial/serial-peripheral-props.yaml
new file mode 100644
index 000000000000..b4a73214d20d
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/serial-peripheral-props.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/serial-peripheral-props.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Common Properties for Serial-attached Devices
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+  - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+description:
+  Devices connected over serial/UART, expressed as children of a serial
+  controller, might need similar properties, e.g. for configuring the baud
+  rate.
+
+properties:
+  max-speed:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The maximum baud rate the device operates at.
+      This should only be present if the maximum is less than the slave
+      device can support.  For example, a particular board has some
+      signal quality issue or the host processor can't support higher
+      baud rates.
+
+  current-speed:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The current baud rate the device operates at.
+      This should only be present in case a driver has no chance to know
+      the baud rate of the slave device.
+      Examples:
+        * device supports auto-baud
+        * the rate is setup by a bootloader and there is no way to reset
+          the device
+        * device baud rate is configured by its firmware but there is no
+          way to request the actual settings
+
+additionalProperties: true
diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index 40e05dd37826..30c85768d980 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -93,6 +93,7 @@ patternProperties:
       type: object
     then:
       additionalProperties: true
+      $ref: serial-peripheral-props.yaml#
       description:
         Serial attached devices shall be a child node of the host UART device
         the slave device is attached to. It is expected that the attached
@@ -104,28 +105,6 @@ patternProperties:
           description:
             Compatible of the device connected to the serial port.
 
-        max-speed:
-          $ref: /schemas/types.yaml#/definitions/uint32
-          description:
-            The maximum baud rate the device operates at.
-            This should only be present if the maximum is less than the slave
-            device can support.  For example, a particular board has some
-            signal quality issue or the host processor can't support higher
-            baud rates.
-
-        current-speed:
-          $ref: /schemas/types.yaml#/definitions/uint32
-          description: |
-            The current baud rate the device operates at.
-            This should only be present in case a driver has no chance to know
-            the baud rate of the slave device.
-            Examples:
-              * device supports auto-baud
-              * the rate is setup by a bootloader and there is no way to reset
-                the device
-              * device baud rate is configured by its firmware but there is no
-                way to request the actual settings
-
       required:
         - compatible
 

-- 
2.43.0


