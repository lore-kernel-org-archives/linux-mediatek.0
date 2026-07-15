Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56A3C44507
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=; b=Ds8CkaVlzcSPfHEbhZRPODZ8Dy
	tyBlmrxDk44qtDScuoNeKFKHAPaBuJ0qIr2rkSmX4exLEoPWZh4GEDz/Uf86ZVXYcf9X3tTfAY/Bm
	dHkHWjFbLd7LiZmBhP3weBUSCQ8N8rxSfO5atqxqRlODxhEdEP6m3m85EifbvUOJ3P/5LU7iOj4s/
	/5gjh3fjhe+TJWLHQ+E0MbRaczKUzKbN9O+6GaG4VEszQvNIUjg/69dz3X6g6H1L9cyfRpgCjLaYm
	nzbdI7CK+qXO9SBovGEmW4TQ6B4haTusjXCA/+VYntMfnPHFT6O2sik/F5Rsiv4aS6TKxot8S1RlH
	V2gAOXuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOb-0000000EEBe-40q7;
	Wed, 15 Jul 2026 08:55:13 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvOZ-0000000EE6e-0GcV
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 08:55:12 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8484f229529so1342405b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105710; x=1784710510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=;
        b=V4V2eDflKKvWrJEZinT604iks8ME253E2SuDdH2BTlcyL0JNjDXjoK6obznhLqCv8o
         pFhpCQiJopU7dZ7toxT5jv+e1MyZRF0swzxf63/W5cr87qZs32veoFheHOngJ1pyyy6G
         cjUdJfM3g380zBC+Yclt9jtB5xZCAebqZUCsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105710; x=1784710510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRAxPjZgDa6ntXP4Zl1WhffxSqufwl7Pl3uMzQrQ3GY=;
        b=QUEYPeJVF2bWeIEgmP1SOTL/DaXz8cur8Y3Nc2evqcQGRBf081Zq5hnNFddNHHBt3F
         G6FLow/9ixvgW4cPOeRG0TfJh7IzfuC9IFGNK5HAMdeIP+rsK7tvvfeMoN4Dz0PIYs4u
         U47kUIASpC4rlBqhMyfQ33B6yC1i4JxfBE5nbuEDZlaBHtAUV2jg5D/JHr36QSnRmx8n
         Ve9sW2x5cshlg8g8SsymtCFN9GlPxT94PLKQ6tYa5X0q0SbyPI40T327hpNI06TpunZY
         kjhLpWnIWeCM9y21nRByjRz22dcSaOshHRBtrM5530T7wuDSb/FKSs/mqGkZ26qH7cX5
         xtAA==
X-Forwarded-Encrypted: i=1; AHgh+Rrdyof5e73H6EsSeWem3HP+xEtYDI9leA2zp9szRbqWmEu+FbPgLK5hwszCZnQPQqDzTQSdDH+EJiRRswrxWw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9awDdz4oDbXKhnrpNnfYjnAe/uoxPwGOiomVq1ikXo2O41El3
	agcQn/ICsVT/WLur/uGVVyLk0/NUwtZq4jk3JqskkA4rj7utwYRt2Rt6TKUgQZMXaHZZ1L/4HQN
	LNx8=
X-Gm-Gg: AfdE7clGhmfx+luv2KkY/F9Uip1xHK8JQNxDhstpGioUQRbz7HZvUbdWtbuXWEoUh16
	atdwyJE7KN0+KDs0UNXoYEjXSkVnsg3P7sFWYrdkP36pP+rrlpd001GG1Ba2+OVkzV8VtO5nIVx
	v74yRcSLOoPCWrolKkvU2bsw7j3her241vtRCvgKI74+lAsopOX32HM3nzP3lAoD7XmgWHNoyap
	glbgYMC4e9j6HzfSVzmHDoyncKRCCG0825T56plFXD6sb9CjjwrdlbByXY8ocYUP21+Kn13DWe3
	qKtD4hc3/AST9lwJirhsFE54T9tqBEkVPNVlnl1oDQUUHh7RARJFXRSakZzKUQuvwmuWsXek1Vi
	BvdNizALteZR6fZsv8iY80wFk7lB9SxrnYTNJPWgQHb0sWOYn1HjRp9HRYErWEVUsSP7a0PXR8B
	DTN9By0Wt3KEX/IUnDDDpEAGd5/HFTJE8j2SzejIlNnRPrwctnnqcDRv4dNqf5LrMRPZtvCg==
X-Received: by 2002:a05:6a00:1d90:b0:845:e9e8:6458 with SMTP id d2e1a72fcca58-84889703f26mr14531622b3a.20.1784105710178;
        Wed, 15 Jul 2026 01:55:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Wed, 15 Jul 2026 16:53:41 +0800
Message-ID: <20260715085348.3457359-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_015511_208782_C5784250 
X-CRM114-Status: GOOD (  11.91  )
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

This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability. The SSUSB controller
handles the device or gadget mode. Saying that SSUSB handles the HS
portion is wrong.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Switch to a "ports" sub-node for describing USB connections. Port 1 is
Super Speed if the controller is SS-capable, otherwise it is High Speed.
Port 2 is High Speed if SS-capable. This port mapping scheme directly
matches what the hardware returns in its capability registers.

Fixes: 454a1e3cd36c ("dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP")
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Squashed DT binding revert and addition together
- Dropped reviewed-by from Bartosz
---
 .../bindings/usb/mediatek,mtk-xhci.yaml         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 231e6f35a986..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -107,10 +107,6 @@ properties:
       - description: USB3/SS(P) PHY
       - description: USB2/HS PHY
 
-  port:
-    $ref: /schemas/graph.yaml#/properties/port
-    description: Super Speed (SS) Output endpoint to a Type-C connector
-
   vusb33-supply:
     description: Regulator of USB AVDD3.3v
 
@@ -188,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.55.0.795.g602f6c329a-goog


