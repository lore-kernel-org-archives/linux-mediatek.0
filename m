Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B409C0218C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jan 2025 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=; b=yQq/Yc0F9M94dnDR9s3fvPSUSI
	1MPkSiy7eeqHfaD8LtkxeWBVxHnsqyJFwGFjGlmfdlralFdPxQhylkypdcZmmLz014Otx1nQ6WT1/
	0rS4Uzj6XGpsh9VXgJtrl2bDZsuJIv8mFLIyotTRDYN/1Twd0PVP7DKb0arzTqCttFTMIt3hPwqde
	p0WFd9g4AYU+6FScufkhfEalQbyU9UJ1+geX1LgVkDIvOP4rZ8+7ex3PKLn5zXuSIQ73SmieZbRtt
	vjTGY0gr9y3/ntZy6c7o8NiqwtK2gFJBPUnQ3AvfGlfZ87wMbWllO8kfo89NDedboKQx6LH70l6e2
	9vqbCW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tabMc-0000000AMzk-2vj5;
	Wed, 22 Jan 2025 14:05:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabGM-0000000ALyC-1HbI
	for linux-mediatek@bombadil.infradead.org;
	Wed, 22 Jan 2025 13:59:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=; b=nYVhRJfjTmXXbLSRKFX4vYn00E
	aswaNK02z1qmW+uRi1of6O/vDERjgqm80I9C4ejJHdHzBMKxsG+BRyAfAWvrZWDY1nMsuzpm0F+S1
	LjhrWYtXNsO7DUGCbLBEj4ATdzn92ZpcfH05kXjvZ1SOZVCM2ywwPMCjJ0pU7P5gVkTEX8dEvWrdj
	RcPq+uYxiRaGKDubuBIlcfbWD4s+mRbPyihkXTaiNEJqfC2BmJqLVpC7uXFFoGWTojmr15wbjG3GT
	qRkKenpphmNHvzAg38vGiYOkLMEtzeyPDXK0x3eLgnl7+1cEqQLs5LMIMjdTSh3Pv7YIwYjaPLVNo
	T4Uc5Gsw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tabGH-0000000DaGw-2C26
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jan 2025 13:59:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-386329da1d9so3855660f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jan 2025 05:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737554355; x=1738159155; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=;
        b=UfAVpeYCsBmUZT2DbawPB+JAhnNueEBta+Jh+IyX624zUDAN+NTblCDhdNloCo0WEv
         3zMAkeApEUktrYt+QPKmJWBetnwSRE5HGIUToNF7tBdBRLRJSENm5T9ebXXyCHU9/gFl
         zWdMLIkoW0jlgcIXk2J5nZz0TbHnbnX4HPCOnTxnc/MlG1GLhcXLYmpgJH9LZt3xmY4z
         wtS8qeUtIc15c+z3DWrcFCw9UHBl/TfmPswn+WBlr0/hdXYza5xOozLV4YPlM/3r79Es
         a9G6mdPPC1A3P4uVHi7zONjCHHOeGvfErYw2BuY8KusD2KHHT1H09IWvVGo7GjDfU+8f
         Y9lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737554355; x=1738159155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slHK6g+A3rv9otmptQvZeMFEpwk93d2jnoJ5fvlPAeI=;
        b=WbVjJDXTJNTgz7jHtYUPihMz1p7LNX4O686nzR71c/SNpaYlB4EqLNow2Z0pSTI9KW
         XYy5ms4+Lu31CSKqWoiIlcZw2ylPoXsRZ3mPpU08s+m9CG0U1MO4T8M3XBEpTBDihx+d
         SrEQG9KNDGbMAmnTnRIVXNSkEvuZb/kcQxmHaWME9B+EJqa67v8s0DdIOAAqGmzfxuLp
         ghvQqmFC/dXZ1Aw6RwSbKS8q0cwXBE8ydm5w+EEu1NjAxY2uarkjJnPoT4aw+tNbhur8
         PKffylto6uczzaGEyHUK1eTFl4Fqmd766Yo4/xd2a4Ua6T3wm8zflvAwvWf8s8a1Uhtq
         9d3g==
X-Forwarded-Encrypted: i=1; AJvYcCU/G62fffjtfDNhNzWAc1Gu1n+fCqs7GZOcxuEWVWRSIyWV96EysmlGG2nVJkjY+RyE9f/oDZ78ZhDTCuvtog==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Gezv8GFJrn+BOhe3P/SzwKy/vbf0KS66sdYSaE7ZM+N7PRdB
	MKRiTPokRvXP6bz+XgGAwX3Wa5Hh9WaP5rtgWfXPAIz66Lob9+ZL6E6WOaTDK2A=
X-Gm-Gg: ASbGncsbhtIDI6uVTAKhtk5WrTPB2GwQxgfVPBzhHzp73aVkIQEkvYqXYV8AJ3U87US
	af+0jyon0Aw33F/02+cfLg4XnFBvngeMwAWD1KC1FaAlU/JTD1PxfQIIszy7i0uGnrB3foZh85E
	NCJLOwviFh22nYVAkdiS2ZjQenlhzr4pL+ZhG5h6kkfdKTLUHONYjd0HXyaT+jpQw0JPah1AVid
	r/eMTPsCxRMcYcRjjF3ytTeKT/ZkrjuTlaxJeH63+hKb+G/b6EuTneJwnkEBgmqYCT7mlY04rEv
	aC9k7sj31QlFlrR8aFZDkIAK6HW3VBnrCNb8+5qg0V8gu8VsArcXvAjBwwQ4B3Xa
X-Google-Smtp-Source: AGHT+IF0hy1W+aOU+17Gl9ZkkzxB9r26l+V6pkPB5W+gpNC11wIBBPbUVioMHG0KQW/1aZTkvVvKsQ==
X-Received: by 2002:adf:f1cc:0:b0:38b:ed88:f045 with SMTP id ffacd0b85a97d-38bf566fb1bmr17093395f8f.33.1737554354727;
        Wed, 22 Jan 2025 05:59:14 -0800 (PST)
Received: from [192.168.42.0] (2a02-8428-e55b-1101-1e41-304e-170b-482f.rev.sfr.net. [2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3278f06sm16418985f8f.70.2025.01.22.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:59:13 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 22 Jan 2025 14:59:11 +0100
Subject: [PATCH v8 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-add-mtk-isp-3-0-support-v8-2-a3d3731eef45@baylibre.com>
References: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
In-Reply-To: <20250122-add-mtk-isp-3-0-support-v8-0-a3d3731eef45@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Phi-bang Nguyen <pnguyen@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_135918_079508_6A6A6533 
X-CRM114-Status: GOOD (  15.36  )
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

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This adds the bindings, for the ISP3.0 camsv module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..723df7c1a900ff6b72be084e09dfcf0190dee62f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek CAMSV 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The CAMSV is a video capture device that includes a DMA engine connected to
+  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-camsv
+
+  reg:
+    items:
+      - description: camsv base
+      - description: img0 base
+      - description: tg base
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: cam clock
+      - description: camtg clock
+      - description: camsv clock
+
+  clock-names:
+    items:
+      - const: cam
+      - const: camtg
+      - const: camsv
+
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to the SENINF output
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camsv@15050000 {
+            compatible = "mediatek,mt8365-camsv";
+            reg = <0 0x15050000 0 0x0040>,
+                  <0 0x15050208 0 0x0020>,
+                  <0 0x15050400 0 0x0100>;
+            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM>,
+                     <&camsys CLK_CAMTG>,
+                     <&camsys CLK_CAMSV0>;
+            clock-names = "cam", "camtg", "camsv";
+            iommus = <&iommu M4U_PORT_CAM_IMGO>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    camsv1_endpoint: endpoint {
+                        remote-endpoint = <&seninf_camsv1_endpoint>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a83db41ae0e9427e983e02f01aecb08193da3cd2..93d59c24befd990abd96ef585607992a6b231b72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14759,6 +14759,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 
 MEDIATEK SMI DRIVER

-- 
2.47.1


