Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3D0C531F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=; b=1qDLJPF+p8vOlRh8y0pKdOkLQL
	sHrLK2X2ks0aMAuKrB9hM+2fmgASxoOEnLPffMdzqQe2OizR8XCCviNUr2TTKkpsH4yfY/2fo/GGj
	Up1Yf4Pcm5yL+l7ocgNl8g1srFABjBwTpYLawfE/p7onxgdfEpxNasgpGmaCY97vn/5ygkqnZrQVK
	RRWnhbde3adps5BN7XcJAU1UcwHfJ4SmahGPu6ktBY7gP74lFQ4fiN6yJ87aFthX/7HWnbhi1E1vV
	tB3GOtl2PZflYpQalXSrrQa3Ks5hUwM2kXB2nPKNkeFX4ShbgnYQsgrPo1wTAX1YNfz8yImxhBqP6
	pwdej5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWy-0000000FrNH-0Poo;
	Fri, 24 Jul 2026 08:45:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBWf-0000000Fr5t-2YqM
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 08:45:02 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so222152a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 01:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882701; x=1785487501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=KMlqViA7x/zTfYdguPGZ58D1pk65nvrTCfvutBRfst/AjEN4c8c6L6bC6aGIhJWZ53
         hzFzS1M1w/yOyjP0dGMnM1oQy6prJ3YbC0VYVCls/yPrcL86+dDIcx7tAYllMpWMvk+W
         3KVEyi/5TL3cDhFwniu1YBtTZmkfKHjSj1vM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882701; x=1785487501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HbHZBlGJIBZH9w4CnNEDqTFXqQ2V4R1HGaboHmDjj7s=;
        b=XNvGuj+YqkY7BuRQlsztPpE1sTutHpCeKLjbMQf/IX2AuLoPJq60zB6nYQAWmkuxXF
         2QDD8IIzTQhucYGE+gPJq4VQGK7pqcpUL6BQuiff0x4p5IP2i1bK33o5UKGWhxHkPpyJ
         rRnYiLOi9EShuYW/5gFm3CeK993qI70rRWr8SNtxVC18cCoJwRX0MFkCg7yd7qshKpvz
         WcGI24jAG00gqbWguCqHVTKgXFGGI4BLQS5FtTxXJZ2DZ2Q/7JTahFawM0RHgT87wSAd
         RS5wk9BBwcwG5qiqjCV8Zc+CpfvgIcu/T1RSQJjOPT7Ets9PktbwfJD9qaCFf3xUZ67Y
         lXKA==
X-Forwarded-Encrypted: i=1; AHgh+RqyyKrrdZcsFG7VqW9EF7knuGpviU1/3a1v7Oo3cduxOOB3laPBVBG2v8UzKNA87GvQ2Cl4BjhbIGO6WnF+FQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweDg0fw3YyHsHFqul+xnjv0fUq2yhJnLWne4Zwym6t1rt1Tc3x
	OH3v5+30AYc+Iwbzi575mW7/4sRaAwXEQnk0Nr8VfMH1D0pOcNo8QFwQX0CigtD3Jg==
X-Gm-Gg: AR+sD105KX50T04n2ayKGAHW/K7/ABXlYUOkK+U5uACMBWOdNIC6E6lSs6E28VhCxas
	6DzPjXhERS/nj1U4D4CrV0hhOwN+nxE4ygQzD3gJ7xwj04KcjhWNEFTUyXhIB9tauLJJFMLCdAb
	d84SZPwbuRKc+IMEeWG2/wx/Mz4Ck+mFbs+aaJEC30N0NR76B4EJmiFVo30oV8Th7OOves/PHPW
	8FZbMyTIxShLoZCJ/y9VwALHWuNJytoWxmZtel5pJd1Trp+BAST7MIY/Iu/Hv6AZ8qgmcvStLqF
	nJP3ej6nEJf7kupIUDFeuDD7EQhRagiGfbrn5MNm1HO6ZtlJ0DGtTCnEW+8y2mCEpzvoxr0Xgg5
	xtccf3lqzvy/l/5DNK2bGJS7oS8cixL35rrl0kmbLnyg4vEEflxOJrucukarzzbPHyorl8JkAo/
	GUq53X7PdWVT8+qA9Z5V8NDPXnhfoElNYBCarJu0hBMVZidCXwhJfBfItDdVo=
X-Received: by 2002:a17:90b:4d08:b0:38d:eaed:4adb with SMTP id 98e67ed59e1d1-38ec85cb1b9mr5733586a91.20.1784882700981;
        Fri, 24 Jul 2026 01:45:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:00 -0700 (PDT)
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
Subject: [PATCH v7 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to ports for USB connections
Date: Fri, 24 Jul 2026 16:43:20 +0800
Message-ID: <20260724084328.3943997-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014501_764595_5B98EB4B 
X-CRM114-Status: GOOD (  11.65  )
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
2.55.0.229.g6434b31f56-goog


