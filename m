Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 927A660BD3
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 927A660BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdfff90rMEc9x5MoHoCb//4eeYNHWhUzn8OcyV0+cqA=; b=QKYPW8nl3RRaUq
	0lCHtfz6PhA3upYOLRLbj2OTH2dfuvU4+CbRQuasy/g8BxBrkjS6KpAZegcsYaWci+AYQtDjqRY/H
	CRmg3i4M9+VsIRuz5vsMhXU2Ctt+Hf/vVeUkokms+I0l6zeHXg7hOkMD51MNgBJt1GcHZmm832jBy
	Esh697hxYzgLgvILwdGc4SpJD9kYz4h8LCCyteQ18g9XZjL2RzSzXOrfPurouwizOlF2iIoOOjFsm
	AnQ8K3RxnHEjFIJUIRIm8tg07lSDYWHOrLdoNW5lLAqj66BdYBxnDvvjDaxfHZn0TEAOhAwY31PvN
	GUpgCLZDlXaKBAYlXH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNKQt-001leI-97; Mon, 06 Sep 2021 19:37:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNKQS-001lQy-2V
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 19:37:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q26so10248197wrc.7
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OpJK4P2F3fcoe9OUOgVh8n9rJy2vMiHA7cI1y8LkZwM=;
 b=or6fRqEk6kiYRl3xh3nfEzFiDQvnkOg5aZHN2AYaf4vCPVYLl9U3enQ48XqCZ5CWPr
 Ge6S/NTA6k/ZFNPOVHq41qcmNtx67hUz8llVFYYOKoJRdN6Feg675Z5llx6dKwgrnNS2
 79VABtBpK1cIfSY06E/WEwir0ykERmwwkk5J3VSrkUQVbOAiaRrTIFq/ajAQQFuuU9cY
 Dmjo83RiLmGEJmFdyDVt9raqaBDXsJu3+EkS7do8vI5Prs3W3ntoava1FHAkjZjAcL5S
 W1Ih5zG5TFbak9hnW81tl8E7bpHSQd7E2kaBHhx7PnhW9em4yklqPpMBRuPQwmqkt9wI
 H/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OpJK4P2F3fcoe9OUOgVh8n9rJy2vMiHA7cI1y8LkZwM=;
 b=tXaF4cKwfleoDzpfFKdbjg7ZpiPaKTZ+z83iTuZar17NxhLFCaJ9EXc+6RRSHLGi6v
 TyuCu027wwUu5bYe1maREAFCAukNKDT+JpBJXf+gwziFIWXGEaNA1KlFZ5RQG/97OlTl
 OghYZiRI6L2GBZCqEplJ/R/TWv18kUos/dDxAxhrV3zU51is7QQLdsdk+quaC5Z8r29y
 FjX43qzYyKQi47ZPCkPcRW936D3PoEJs7iavnCQxNFzqd5gSrKtvjVHCLpi6NYczdeg1
 8DqKgQ6xF7KlhbXq4Mr4VI+GXSQgFoU/WgqFOinFWsOKUGXFLROItD+0tAG/gTzcKgbo
 DLpA==
X-Gm-Message-State: AOAM532z46x89UvWkgLiDxBsbpuN1qOd0WdXu/7vOlF/a99oenAZiLhl
 tqGJcGhaE9votOkgWm0jVHPdAZuHHJPFdw==
X-Google-Smtp-Source: ABdhPJzIj6weOsG+HIDX0gJGaRslrN9Np5qExRczRcLdgQKklHzufSw5S8GQ2hwA3i6uUGpLOgtFAw==
X-Received: by 2002:adf:c3c8:: with SMTP id d8mr14855254wrg.143.1630957022647; 
 Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 2/6] dt-bindings: mediatek,dp: Add Display Port binding
Date: Mon,  6 Sep 2021 21:35:25 +0200
Message-Id: <20210906193529.718845-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906193529.718845-1-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_123704_157834_2069AD15 
X-CRM114-Status: GOOD (  14.38  )
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

This controller is present on different mediatek hardware. Currently
mt8195 and mt8395 have this controller without a functional difference,
so only one compatible is added.

The controller can be in two forms, for a normal display port and for
embedded display port.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---

Notes:
    I added the mediatek maintainers in the list of maintainers as I wasn't sure
    whom I should put there. Please let me know if I am supposed to add my mail
    there.

 .../display/mediatek/mediatek,dp.yaml         | 89 +++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
new file mode 100644
index 000000000000..f7a35962c23b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -0,0 +1,89 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/mediatek/mediatek,dp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek Display Port Controller
+
+maintainers:
+  - CK Hu <ck.hu@mediatek.com>
+  - Jitao shi <jitao.shi@mediatek.com>
+
+description: |
+  Device tree bindings for the Mediatek (embedded) Display Port controller
+  present on some Mediatek SoCs.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt8195-edp_tx
+      - mediatek,mt8195-dp_tx
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: faxi clock
+
+  clock-names:
+    items:
+      - const: faxi
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Input endpoint of the controller, usually dp_intf
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/mt8195-power.h>
+    dp_tx: edp_tx@1c500000 {
+        compatible = "mediatek,mt8195-edp_tx";
+        reg = <0 0x1c500000 0 0x8000>;
+        interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+        power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&edp_pin>;
+        status = "okay";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                edp_in: endpoint {
+                    remote-endpoint = <&dp_intf0_out>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                edp_out: endpoint {
+                	remote-endpoint = <&panel_in>;
+                };
+            };
+        };
+    };
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
