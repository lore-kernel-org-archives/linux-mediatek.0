Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C7EC48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 09:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DE87613D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 09:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DE87613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XEBYez1lB6EWnVTlYC4jKxsQSuN5QMs06dHEGQZF2FY=; b=4cgwGcVEKwvlQQ
	JhatHUvk7Xd2ytDTa4Plicde9V0Ns3sUqO5b2+bAnFAiHbu76VorHUnPQf/bNuucxr1cBYYmpO56V
	s5YARN4oOyj7OTvfH7ADjUJ0WPN/etoqU61YjuGAX1MFqCQwoAiPXV6llvNu96VCjLgDh9qJldMg6
	MsKCYOkuvI2pt+R/f4kni4dHtcX3eKy7M7s5nlcjCUJ00YQ6jQpe2ViDwAVRRmVbC8umEL6ltvCyD
	ghfoKKRJUdUCnvhJdOg+fSp+Bk5uWSECE5OrDohvXFtAy4M3CD4pRCMirwcp0ZCIgtyekqAC4xxf1
	dVn/y1WJoNjPn7WapYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrdPW-004VcD-9U; Fri, 11 Jun 2021 09:25:06 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrdPS-004VaN-40
 for linux-mediatek@lists.infradead.org; Fri, 11 Jun 2021 09:25:04 +0000
Received: by mail-pj1-f42.google.com with SMTP id h16so5369651pjv.2
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Jun 2021 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UgBQrK5SlymCkI5jz+k5p8kag+QovCuycBqNVsBxvAM=;
 b=FwPbFhKxFYgWFpCahJKYBrhdtlcOgiLmCAJceVjIDXig9MrQM73N4ugumbv8xqaQbW
 9YynqByFEJxZdMEEGwe2L3ia27i5R3UYop+VZVpwUM1PChIOXECX6716ph3Vzf3geHqF
 0nuV0rksmeMjDB8kiHmBxkq/ISqkRWht5H5DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UgBQrK5SlymCkI5jz+k5p8kag+QovCuycBqNVsBxvAM=;
 b=kR8e+4hql+HyR9iQXDmdcfnsM+1lRFI6oTRz1yWsC3C1lQZHGp19+5MQqG01cSwBS6
 i6DU1+2IRz8f8Ao/phyujH1a7En+1T7oDcsB5FgSJuMs75hVbZ+5mPZYA1gOQvRzBhGm
 KYpptOVdbJpCn6OWzqGuqy/bSeq6XAnxZhPK5RrTv3GvMy7APFqS/iPLItMcapyUiWHY
 kUYtiTg5xDBUTu8fmqJ/Np9A5153a4D8GSuW7PBe/aROEU/oNO3pA3j6DzoQw7XHEDeY
 ft4Y0rJyfHAihFyX58OPSXGnTTl/R96aCAGvhGJl6yrF96Mq6vlBeC+hl0Mk7CqproRR
 4f4w==
X-Gm-Message-State: AOAM532O6JUfgoOu9SNORvK3O9PngMwYogUur4rb5b2GgxUd8HY+G4qb
 m/fMc6I/+fercTjQ3yhV1P3n+w==
X-Google-Smtp-Source: ABdhPJzhftfUCjMVu5l8LE/zu4J6Xy0U1HR/8TKZLifQgd/gR+DP0xfknF5i/OPekkWa4pSWKzDYBg==
X-Received: by 2002:a17:902:7401:b029:102:34f7:48f5 with SMTP id
 g1-20020a1709027401b029010234f748f5mr3095678pll.47.1623403441355; 
 Fri, 11 Jun 2021 02:24:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:73d3:4412:54cc:752d])
 by smtp.gmail.com with ESMTPSA id q68sm10394037pjq.45.2021.06.11.02.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 02:24:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v3 1/2] dt-bindings: mediatek: convert mtk jpeg
 decoder/encoder to yaml
Date: Fri, 11 Jun 2021 17:23:56 +0800
Message-Id: <20210611092357.2930310-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.272.g935e593368-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_022502_180519_9E2471AB 
X-CRM114-Status: GOOD (  17.11  )
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

Convert mediatek jpeg decoder and encoder bindings to yaml.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../bindings/media/mediatek-jpeg-decoder.txt  | 38 ---------
 .../bindings/media/mediatek-jpeg-decoder.yaml | 85 +++++++++++++++++++
 .../bindings/media/mediatek-jpeg-encoder.txt  | 35 --------
 .../bindings/media/mediatek-jpeg-encoder.yaml | 77 +++++++++++++++++
 4 files changed, 162 insertions(+), 73 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
deleted file mode 100644
index 39c1028b2dfb4..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* Mediatek JPEG Decoder
-
-Mediatek JPEG Decoder is the JPEG decode hardware present in Mediatek SoCs
-
-Required properties:
-- compatible : must be one of the following string:
-	"mediatek,mt8173-jpgdec"
-	"mediatek,mt7623-jpgdec", "mediatek,mt2701-jpgdec"
-	"mediatek,mt2701-jpgdec"
-- reg : physical base address of the jpeg decoder registers and length of
-  memory mapped region.
-- interrupts : interrupt number to the interrupt controller.
-- clocks: device clocks, see
-  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "jpgdec-smi" and "jpgdec".
-- power-domains: a phandle to the power domain, see
-  Documentation/devicetree/bindings/power/power_domain.txt for details.
-- mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-  for details.
-- iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Example:
-	jpegdec: jpegdec@15004000 {
-		compatible = "mediatek,mt2701-jpgdec";
-		reg = <0 0x15004000 0 0x1000>;
-		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
-			  <&imgsys CLK_IMG_JPGDEC>;
-		clock-names = "jpgdec-smi",
-			      "jpgdec";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
-		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
-			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
-	};
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
new file mode 100644
index 0000000000000..43a611c17ed59
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-jpeg-decoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Decoder Device Tree Bindings
+
+maintainers:
+  - Xia Jiang <xia.jiang@mediatek.com>
+
+description: |-
+  Mediatek JPEG Decoder is the JPEG decode hardware present in Mediatek SoCs
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: mediatek,mt8173-jpgdec
+      - items:
+          - const: mediatek,mt2701-jpgdec
+      - items:
+          - enum:
+              - mediatek,mt7623-jpgdec
+          - const: mediatek,mt2701-jpgdec
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: jpgdec-smi
+      - const: jpgdec
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      Must contain the local arbiters in the current Socs, see
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+      for details.
+
+  iommus:
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - mediatek,larb
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt2701-larb-port.h>
+    #include <dt-bindings/power/mt2701-power.h>
+    jpegdec: jpegdec@15004000 {
+      compatible = "mediatek,mt2701-jpgdec";
+      reg = <0x15004000 0x1000>;
+      interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
+      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
+                <&imgsys CLK_IMG_JPGDEC>;
+      clock-names = "jpgdec-smi",
+                    "jpgdec";
+      power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+      mediatek,larb = <&larb2>;
+      iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
+               <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
+    };
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
deleted file mode 100644
index 5e53c6ab52d01..0000000000000
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* MediaTek JPEG Encoder
-
-MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
-
-Required properties:
-- compatible : "mediatek,mt2701-jpgenc"
-  followed by "mediatek,mtk-jpgenc"
-- reg : physical base address of the JPEG encoder registers and length of
-  memory mapped region.
-- interrupts : interrupt number to the interrupt controller.
-- clocks: device clocks, see
-  Documentation/devicetree/bindings/clock/clock-bindings.txt for details.
-- clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
-- power-domains: a phandle to the power domain, see
-  Documentation/devicetree/bindings/power/power_domain.txt for details.
-- mediatek,larb: must contain the local arbiters in the current SoCs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-  for details.
-- iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
-  for details.
-
-Example:
-	jpegenc: jpegenc@1500a000 {
-		compatible = "mediatek,mt2701-jpgenc",
-			     "mediatek,mtk-jpgenc";
-		reg = <0 0x1500a000 0 0x1000>;
-		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
-		clocks =  <&imgsys CLK_IMG_VENC>;
-		clock-names = "jpgenc";
-		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
-		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
-			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
-	};
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
new file mode 100644
index 0000000000000..e4e791d76cdaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek-jpeg-encoder.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek JPEG Encoder Device Tree Bindings
+
+maintainers:
+  - Xia Jiang <xia.jiang@mediatek.com>
+
+description: |-
+  MediaTek JPEG Encoder is the JPEG encode hardware present in MediaTek SoCs
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,mt2701-jpgenc
+          - mediatek,mt8183-jpgenc
+      - const: mediatek,mtk-jpgenc
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: jpgenc
+
+  power-domains:
+    maxItems: 1
+
+  mediatek,larb:
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+    description: |
+      Must contain the local arbiters in the current Socs, see
+      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+      for details.
+
+  iommus:
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - mediatek,larb
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt2701-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/memory/mt2701-larb-port.h>
+    #include <dt-bindings/power/mt2701-power.h>
+    jpegenc: jpegenc@1500a000 {
+      compatible = "mediatek,mt2701-jpgenc",
+                   "mediatek,mtk-jpgenc";
+      reg = <0x1500a000 0x1000>;
+      interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
+      clocks =  <&imgsys CLK_IMG_VENC>;
+      clock-names = "jpgenc";
+      power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+      mediatek,larb = <&larb2>;
+      iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
+               <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
+    };
-- 
2.32.0.272.g935e593368-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
