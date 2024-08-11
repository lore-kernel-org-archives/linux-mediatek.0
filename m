Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CD9C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 18:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I1MOs4RlICrHo6+3Xh5oqbsEAM8Ad9zumEnWMGczaU=; b=Flob+b5EWDI5hThv/UlJRQzRyy
	eSU9Bpb2lXkxnoda2sfZXSEN+EoZ/Qg27Ca/IoAtzo1wp8dQemoGUt4yGtpdYw/fLsIl5MRh8OMti
	dQffk3XfjdGHeVsVlNpA5vS8HhFdOm7FOY02W7WDXAKwFYAnsJET0cqzJ7lmk2DzxjEWIoxWUvmRu
	9Z2iIn7J8v0bUq3Q0sAV719Gii/F+BTO44VvUy1rPQKNQs0A0YjF0QspIALNiuRjk/0IXXbZ5pqS1
	HTEhKpBp5YdkooS9Zh69yN+Z1yZWAsODuamUno9M7NaGO+/KSCvXy11u7vjNDSS2fnIH1P35MWu5r
	4P0D7YPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdDAz-0000000FwSX-4B2M;
	Sun, 11 Aug 2024 18:20:22 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdD8D-0000000FvTY-02OE
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Aug 2024 18:17:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2f149845fbaso38579241fa.3
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Aug 2024 11:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400247; x=1724005047; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4I1MOs4RlICrHo6+3Xh5oqbsEAM8Ad9zumEnWMGczaU=;
        b=pWJwhzY38gO7ekNFpdKpI+NPqJqG3Ug6DpuiLrFk+f+qtHxqx6knK57i9kh3G5JYou
         tM+1B9e8PHIJq/XQs3uf9bbHptKG5e4Sxr7jjw4qE3ywnop4qFagJvErz+i03FmvV8xA
         XbOPbQHFfju75LcDwB6Cg1VRua41YYJ0GSphg1GGDasa26Gw+I0Ws5gQa8HnkS7trbZI
         11BaL6x/VuJullrisWdA+fd/zyyFNLqnKgDonlOamvT+3mh1S/nr9f9xc/DGPFGTuKGN
         A1RlgaNApURuPNv19bGNcyMLqpXMwU/y3Q5EMD215Nbwa1ot7MccZ3m8CKgJavwfhJfs
         JEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400247; x=1724005047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I1MOs4RlICrHo6+3Xh5oqbsEAM8Ad9zumEnWMGczaU=;
        b=LQpp+ADrKSHlcB+SYihdjiRoMoys5YJDSkwZMCRtISbfFjiBDe4vR7hQVaNUcl6voz
         JC5YhP7QJRIgO03xEiyG8azFsDzuCs9UNmfKntD3jSVwvS+3pFIFrxkmwwPFot90KH6Z
         J1xXwWefOdTwx8IsNVDGdx+x/c2wi6IW5EHafGvjBU1gU9hlKdXXTWqf6ppDVWLgR4jm
         ijOiBnqyWscZxU2cXG+DisYHpPu4SxsipJJ93bAKN23t7+a6FEg4dvQCYes9IjkRmBq8
         2xnADrzDutBnIzWbT+ZVrKl04O7BmswMx3zDM2KCrP5v88vCYR2bWRqXySMu4Yef4w2E
         2cDg==
X-Forwarded-Encrypted: i=1; AJvYcCUyU/6Pp28Q/FYX86zTA1W9hdM77D10St+eKhKY7UoUbqGmLXyt6KHsjdBmWYrUObffFke7IM5eESYZKYANtYuJGVbnkazhnnAbWWPPjd147lF7
X-Gm-Message-State: AOJu0Yze3JDR7sIg8uJx57ktQVas0jYPI8hkpSeWnRsoL9kFfsPmQjou
	GNpRzZKok9eqcTq2+KMM199ei++I4auD+dopEGu9AseOK/Ae6QmXk3WRlRJ0UZA=
X-Google-Smtp-Source: AGHT+IGZk8tSp6TCMLyX7Nh8mlsOe+NTSYoLKUIveF7rdM/yJGip844M6WYN5Bdk4so7A4B+EQy7Tg==
X-Received: by 2002:a2e:b4b6:0:b0:2ee:8ea4:d649 with SMTP id 38308e7fff4ca-2f1a6d0d517mr51105321fa.16.1723400247459;
        Sun, 11 Aug 2024 11:17:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 11 Aug 2024 20:17:08 +0200
Subject: [PATCH 5/6] dt-bindings: bluetooth: reference
 serial-peripheral-props.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-5-1dba258b7492@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4621;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ODWT4GHR30t+QnDSZHKStQSpKmwtKvyvXE4vBLxh1WI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmuQAqOJOTxfm6MHExpo3dgYQ9SqbgDR4o/cpL6
 8ITUCeJOmaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrkAKgAKCRDBN2bmhouD
 1x0NEACAsDcv6D6/XYWk4Es7HPPW2CKoBfs2JObs/84LP24gWNYTG4vPD2kbpM8IEJAuwI2LUI6
 3+tUxQ80u2pm2yVqcooaCI9qGdr1MGrtbP74+dct5wdWzdu5B2eJO83Zu2YCClBQ5zdR/8SErcP
 5nNCKtK8GeOkcupUkK+IrP98Ahc4DwsR4oAP7kUzIMxD3i6sRFFCGHluLtn6MrgqDGqV6tDwucQ
 RyiE4kurOOLkY8+pMJZtzhAfS+i6JIqLgAEK7HJzod7wypE+i5Cd5zYpxSV2CTQ28MMZXdNx7ta
 bV8g0oByZxi2yOZdiTxOKVJQAC7kDT/WCkheov0k4mCdJ6vog4lj9EqHANJ7IqHAb7QcBK8uFRf
 Lx2UmPT9ZEjGUobHioIYbprCTADQLnsAQkvLAnoIiEZ9NjDIzDJcumx5/Cov5sfIl5OBwHLGMnx
 1R/C05mFXKulqUk6XuXRl/EQ4McsS1QlaA72sJo/ra+E3cXDSu42JuTzYZExbxLuGxEuwwAzcuH
 SD3EVCLnEXLRMbYRzaHsqhYnAF6HyShOi6zwXF8TRsN1nK+xBTbWUzq5HwzBZ9lAjfE+2Y+tPn2
 0Pl5cIPKBKY88wpKY1bQipWt4sQAKkJJmSnGDfAIIrTws2/S9aWvEsh8zxSQNNcnmvMbj02+C95
 ZnmGsbT4r2kWqMw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_111729_132887_BCA35FE4 
X-CRM114-Status: GOOD (  12.64  )
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

Reference common serial properties schema (for children of UART
controllers) to bring common definition of "current-speed" and
"max-speed" properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This patch should probably go via Rob's Devicetree tree.  It depends on
the serial patch adding serial-peripheral-props.yaml.
---
 .../bindings/net/bluetooth/brcm,bluetooth.yaml     | 31 +++++++++++-----------
 .../bindings/net/bluetooth/marvell,88w8897.yaml    |  4 +--
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  4 +--
 .../bindings/net/bluetooth/realtek,bluetooth.yaml  |  3 +++
 .../bindings/net/bluetooth/ti,bluetooth.yaml       |  3 +++
 5 files changed, 25 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
index e49e4146736f..3c410cadff23 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/brcm,bluetooth.yaml
@@ -119,29 +119,28 @@ properties:
     items:
       - const: host-wakeup
 
-  max-speed: true
-  current-speed: true
-
 required:
   - compatible
 
 dependencies:
   brcm,requires-autobaud-mode: [ shutdown-gpios ]
 
-if:
-  not:
-    properties:
-      compatible:
-        contains:
-          enum:
-            - brcm,bcm20702a1
-            - brcm,bcm4329-bt
-            - brcm,bcm4330-bt
-then:
-  properties:
-    reset-gpios: false
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - brcm,bcm20702a1
+                - brcm,bcm4329-bt
+                - brcm,bcm4330-bt
+    then:
+      properties:
+        reset-gpios: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/net/bluetooth/marvell,88w8897.yaml b/Documentation/devicetree/bindings/net/bluetooth/marvell,88w8897.yaml
index 60b90cd62013..2fc36874deb7 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/marvell,88w8897.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/marvell,88w8897.yaml
@@ -19,13 +19,13 @@ properties:
       - mrvl,88w8897
       - mrvl,88w8997
 
-  max-speed:
-    description: see Documentation/devicetree/bindings/serial/serial.yaml
+  max-speed: true
 
 required:
   - compatible
 
 allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 68c5ed111417..67f95e60ed3a 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -98,8 +98,7 @@ properties:
   vddwlmx-supply:
     description: VDD_WLMX supply regulator handle
 
-  max-speed:
-    description: see Documentation/devicetree/bindings/serial/serial.yaml
+  max-speed: true
 
   firmware-name:
     description: specify the name of nvm firmware to load
@@ -118,6 +117,7 @@ additionalProperties: false
 
 allOf:
   - $ref: bluetooth-controller.yaml#
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
   - if:
       properties:
         compatible:
diff --git a/Documentation/devicetree/bindings/net/bluetooth/realtek,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/realtek,bluetooth.yaml
index 993c607eaa49..7d567122bac9 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/realtek,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/realtek,bluetooth.yaml
@@ -46,6 +46,9 @@ properties:
 required:
   - compatible
 
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/net/bluetooth/ti,bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/ti,bluetooth.yaml
index 1f507ddccc3c..290abc22e18a 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/ti,bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/ti,bluetooth.yaml
@@ -74,6 +74,9 @@ properties:
 required:
   - compatible
 
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
 additionalProperties: false
 
 examples:

-- 
2.43.0


