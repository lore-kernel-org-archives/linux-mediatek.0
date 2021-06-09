Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E93EC48BCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:42:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD44561375
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 10:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD44561375
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=blDVwsSO2YNTksnVfyZFbeXohQDlpJZzjJG4kf+KdTU=; b=2i5caODM7JbCuU
	oGfUNGp9i7EZqttfQZseXuAb4azXBt418WMWMzernrmoeNdnL5Z5iORHqPjIb1loxw64+hF0GiT7w
	BYIGcsMZ4TVH876j8gSmNAOybOCzN7fu2ewkURko8pb5qJ8MwYCxXr7aH+ZvcKsWpXAhI/CK+J8dQ
	YUk34TQ/O0qxzPe0P/qOqUuqQKBsKrS/vfxRT4EAnY83nk33jvebs1CXmkLabpzPGLsv2mXcO+hIv
	ixPAJqYX7sFOchIvPwlkgl1dahoQdYyaJ51xelojhChXIXx9wMHaE9Iga70NLlWWmMXIsa1b1L0jE
	tXVIf3Af6l1mpKlNNAWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvfG-00D51k-QV; Wed, 09 Jun 2021 10:42:26 +0000
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvet-00D4uj-SR
 for linux-mediatek@lists.infradead.org; Wed, 09 Jun 2021 10:42:05 +0000
Received: by mail-pf1-f171.google.com with SMTP id u18so18060322pfk.11
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Jun 2021 03:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3KSqDVs9YRSwE4rOwA0va7NCLHw84o+H5YF3VkLQdM=;
 b=JtSlkmTPs+H1JCpMlMT4IMsfQa8AN05+Jwzr9y0eMBoFqPN3OLlDF/sSIU2wdbnafj
 Bvwc8QVi2hybfJT8seIRU25PwWiVOUXoe3zAOyP1PsE0Jbs8WypZ6B02spebC97i8YPP
 dCTZsIfDepmonyk02MH7akhX/22srZngJ2VAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o3KSqDVs9YRSwE4rOwA0va7NCLHw84o+H5YF3VkLQdM=;
 b=AlvEw1fuQ5Bp4pHSjqvbqI0Yqln/MFp6v0aVGCiFybi+PW+vluCIPtsNym+iqGYko2
 cylveS90z25vnzx1/P58riswRL3VyVEYIM4D5SNR7j8SOFwi5mjzSMHKBsCiRKN/dOWJ
 cvVwx0IC/F5lbQ4QD/5wzEjq/5EZXZWwuIfYXjfF9I44+weHuDrunxPKX5EamRs66ckN
 q0Xq+8AmCeLfIdwSRmBntEAp6Vez+Ewe40b+SeZmTOvVFytV1X/eUZxFho/ybMGOqRe0
 DlliHXW5QXJjoSqp0B6TRkvzKptDY+xIIW0CuVHYo1O9NCUdAzn4JkXLKz37qQCSyBFk
 mRWQ==
X-Gm-Message-State: AOAM533u8mRf388OwWefLDpdVflXfG/sQ9iNpRB6ZOc3hiI/6gSbrq50
 E9RHNnp4M4bMEL2fS2p6xEcWLQ==
X-Google-Smtp-Source: ABdhPJxeWSnFVRMewe1zjN1xVuTUbrFOPSw8XzwNwPRTj6Pvhj8lQCDm/w6gJDaJPdNL+Nt/nRAF9A==
X-Received: by 2002:a63:f245:: with SMTP id d5mr3191835pgk.416.1623235262439; 
 Wed, 09 Jun 2021 03:41:02 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:83f0:56eb:3535:6bd5])
 by smtp.gmail.com with ESMTPSA id k1sm13223904pfa.30.2021.06.09.03.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 03:41:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH] dt-bindings: mediatek: convert mtk jpeg decoder/encoder to
 yaml
Date: Wed,  9 Jun 2021 18:40:54 +0800
Message-Id: <20210609104053.617751-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_034203_962321_9761C749 
X-CRM114-Status: GOOD (  11.94  )
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
mediatek,larb in the original file will be removed after this series[1]
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210410091128.31823-2-yong.wu@mediatek.com/
---
 .../bindings/media/mediatek-jpeg-decoder.yaml | 73 +++++++++++++++++++
 .../bindings/media/mediatek-jpeg-encoder.yaml | 65 +++++++++++++++++
 2 files changed, 138 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml

diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
new file mode 100644
index 0000000000000..812f366163d8a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -0,0 +1,73 @@
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
+        - const: mediatek,mt8173-jpgdec
+      - items:
+        - const: mediatek,mt2701-jpgdec
+      - items:
+        - enum:
+            - mediatek,mt7623-jpgdec
+        - const: mediatek,mt2701-jpgdec
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
+  iommus:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    jpegdec: jpegdec@15004000 {
+      compatible = "mediatek,mt2701-jpgdec";
+      reg = <0 0x15004000 0 0x1000>;
+      interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
+      clocks =  <&imgsys CLK_IMG_JPGDEC_SMI>,
+                <&imgsys CLK_IMG_JPGDEC>;
+      clock-names = "jpgdec-smi",
+                    "jpgdec";
+      power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+      iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
+               <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
+    };
+
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
new file mode 100644
index 0000000000000..8ffc17fe576d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -0,0 +1,65 @@
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
+  iommus:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    jpegenc: jpegenc@1500a000 {
+      compatible = "mediatek,mt2701-jpgenc",
+                   "mediatek,mtk-jpgenc";
+      reg = <0 0x1500a000 0 0x1000>;
+      interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_LOW>;
+      clocks =  <&imgsys CLK_IMG_VENC>;
+      clock-names = "jpgenc";
+      power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
+      iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
+               <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
+    };
+
-- 
2.32.0.rc1.229.g3e70b5a671-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
