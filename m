Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64667C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZkYUMzldsB8G4n66QsGtbq+kWpLlKFbWXLtapcvVhg=; b=jiYs/Guhlvhg73
	+EUg3Jeu32tEvF2D9uHDjw78HqyWTrXF6op+3a/zSWfR8czy+YU3/11UAWKoioqoWWTZH1A4YbRip
	Hcz9wGN3b4UVlt/DXyViYcydPVnV/Lfb7r4fXnPfrdR5f9BlQcpsmgR5rU3hpg7kSNsXko1hgsJIL
	Lt/4NY5WKhI7Ok3J79YbBJkHhtH8JJc44ti+hoNuvPio3ldW8gGkEAqUclAesvPdVljB2UJQhk+mk
	OSr9+KzmTKhykvuXRv83maGTvgiJw3iqe2MMM4Pnd1EkKFoROwkaZCs7gC1nVEyqfH73+ELnnLTol
	uTYBYrIiHg3YeikzzNqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i1M-0036v6-Lq; Mon, 13 Jun 2022 11:14:12 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i0B-0036Iq-Q1; Mon, 13 Jun 2022 11:13:01 +0000
Received: by mail-pf1-x435.google.com with SMTP id 187so5441093pfu.9;
        Mon, 13 Jun 2022 04:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H0uTDh6aYM5COnk2LVf+hv3AKvxMR4j6qZouxZ1ZW08=;
        b=oMtXDMaL+3K41xX3wOjL+4cJPZPdia8pK0tBsbVNhsHMmgvlY2yDecUqMCbiNaC+Hn
         8cE8h6SDOvEYWn/WwmLZ7sMRWZcuF9sdzlzyVE8GzzvRuSA1/RBlFOfELSjinK69NNdo
         0RDq6mLN6SnRWd2YXZ3BS8V15ynLULjLSzLfjj62me3lSsdxEdTxpcK9sLqdtAL18ikn
         10+cvHGXBMsVmzKBDU7JNlm+oBJ2PwkYMBbXwe4ddFKqZ4oTzjFc8C/lw0j/6fCvtch2
         /PH0f1TQoGivWlVyZKddDusoDyGdaC3bO0lueeCM1l2VrOtE2glqpbHGcaZb9gaPcN3s
         3QSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H0uTDh6aYM5COnk2LVf+hv3AKvxMR4j6qZouxZ1ZW08=;
        b=Nw3i/RxNFhvD8h/vKiVzfI1upXILwUMFrcxm/aN262kq8xusWMvVEZ3FjK2zj/QrIf
         8wMx/LLVks6ru5GolMycqKkmp/ZjcN4oxE5lemKEOpNCmdaya5oH85niY73sFMCcdH1f
         y9kQPv0Knq2EeHxyRsn635xehGMFGvm8DeENEEWchgnJFzll/Oe0xk3LKtwLTdPQptl1
         dPwnS+/I7m4qEMb0+HZbXXwbsJ7snK/po3dWFX90vIJXHJ+JsF5P2b7V2XSArNbrHP3+
         hbO4nV5H7yjmFAdtk7QCtJDUFtWOn36wWLRuPoILonCq5QykOhQFBlZ5/421218ssLp3
         zVog==
X-Gm-Message-State: AOAM530lwNKf/GhUAn/ud/9A2Rc7RnsHBppUDLlxEWbb1Fa1VKOPhUvl
	BIJv6f7kFZFS/Mg4u4ONSu8=
X-Google-Smtp-Source: ABdhPJzUET+kWcvRpxcgqFcYe7H7yEtugI2dhw2yXyAzpnbUyW0Jye1NyMKd3NCLfMtc5qXAlEC96g==
X-Received: by 2002:a63:2f84:0:b0:408:9c77:7a7e with SMTP id v126-20020a632f84000000b004089c777a7emr68350pgv.191.1655118778405;
        Mon, 13 Jun 2022 04:12:58 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net. [42.72.115.109])
        by smtp.gmail.com with ESMTPSA id g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:12:58 -0700 (PDT)
From: ChiaEn Wu <peterwu.pub@gmail.com>
To: jic23@kernel.org,
	lars@metafoo.de,
	matthias.bgg@gmail.com,
	lee.jones@linaro.org,
	daniel.thompson@linaro.org,
	jingoohan1@gmail.com,
	pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370 current sink type LED indicator
Date: Mon, 13 Jun 2022 19:11:34 +0800
Message-Id: <20220613111146.25221-4-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_041259_896733_9A0BFF32 
X-CRM114-Status: GOOD (  11.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

Add Mediatek mt6370 current sink type LED indicator binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml

diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
new file mode 100644
index 000000000000..42b96c8047a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LED driver for MT6370 PMIC from MediaTek Integrated.
+
+maintainers:
+  - Alice Chen <alice_chen@richtek.com>
+
+description: |
+  This module is part of the MT6370 MFD device.
+  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM/Breath Mode
+
+properties:
+  compatible:
+    const: mediatek,mt6370-indicator
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^(multi-)?led@[0-3]$":
+    $ref: common.yaml#
+    type: object
+
+    properties:
+      reg:
+        description: |
+          Index of the LED.
+        enum:
+          - 0 # LED output ISINK1
+          - 1 # LED output ISINK2
+          - 2 # LED output ISINK3
+          - 3 # LED output ISINK4
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
