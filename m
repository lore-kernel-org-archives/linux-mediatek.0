Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B28CCA47B
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LH7P2bSH9zX3hC2xlijSl6cwWbnFDv+X6XyLhHulMyw=; b=UsxBhjorp45xFH
	auTUbNboWWmLIAlq0Ak4tvNvWfh58iWiBuNvw1SA2A20Kr5mLhF+oHttxTiQjBv+5h4Jp3IX/HotY
	PSlLS1e1LTa75mZs3Uy/iMISp95lKPDHm+oi183oT7vtzPnA7BuhKFBPJFweWOwUXTAhx7XXRYG9O
	7Er6CySF4CIPc/ngJlzlbjm9S6NWjZIj01GQ90gVmUL2X6CCLfh618v9BirCVC+1WZsMkzFowpYsB
	t5hMqX7+JxXxEP9p1qc4ERRjLARELT3+g2bKBG4wUm+2AZowMwJbizPKO7WH1JEJO1XXC0vQDdr/6
	pZFP/WFO87P+r3mcATeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i0L-0036O5-Lw; Mon, 13 Jun 2022 11:13:09 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0i02-0036Ff-TU; Mon, 13 Jun 2022 11:12:52 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 129so5256558pgc.2;
        Mon, 13 Jun 2022 04:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oqTkyZ/R9/aOjKZlhpbfjvDgfGSkULBZvX8wxg4YxyU=;
        b=EkfouFuwigzPeP3CaHjbjOBiWlhMunkQOLCaHKE2YU6uwGayAsPnUiKSAXGdXu18cJ
         v4gsLlJJlItr1BUXfBsqy4n/SJ3JfrJozMKwoYPdCNYzW3nIjUOr8xTpW2pnpdzMS6N3
         fU1tUtmrLaNU1SbFzyXbBnxLXiGR5p8MfWcLVM8ZECExJE9azVAatV/AqH5t25q8zpX3
         hhfuJLTyojZTZyemTeos0TFjLPWsXyMrWe7iM56nTK6jVjsQpTeVehX8WVnWFMOzDINC
         A/K/lWvB8Z/L9aRwVHBilttnT0nQc9JF1fuhIfPB9oUg8Paw8u8WsrP8Dvt6YEOmRlZP
         C7pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oqTkyZ/R9/aOjKZlhpbfjvDgfGSkULBZvX8wxg4YxyU=;
        b=Fw8BAnAiz7L+dEN5uGUc7K8b/O5mIIltOdRYmV4wzWYrEyAZsfDkI1AMN/3Df8eMmB
         oLML/Q1280CDbyvkEcYbL3RhyUtodPlCdgEtZBdSdY9u3MjE6lBF6UM2vlQRB7y4W4vh
         lFdqkK50Imy3mQcRirY2SY9X6gO+fIJmQFknIwMZP9ObbUMubivwmSCOoZ7v7O0/PXkF
         lpJqZZc/Bb65UjfCg26RbAV5nLyozaSzg9Y9TZz7DbHwV1Dcc/c6MVDc7VLJtaG1Q8wF
         8uyjdIoja1c25YorqMaMR/CQV8B6EPMxTwT0VZvhnySQPHISdXOQA8aYlfRnbUDHSnDp
         KUpQ==
X-Gm-Message-State: AOAM531zH5vqokx362pZSQRZKfCFQEZN2u6BgmDlUH+3HKN29/vcAbBg
	nJcivuFnrnb+LeC+blsu6tM=
X-Google-Smtp-Source: ABdhPJykU5u3d/PSqbUfSBIHCI7wMOPjK0kTGhhrXnoTs+pr7YZi4FLWyDRwJrY+TNdVd5Qu1JUYlg==
X-Received: by 2002:a65:67c1:0:b0:3fd:ebd6:5dab with SMTP id b1-20020a6567c1000000b003fdebd65dabmr30448557pgs.75.1655118769299;
        Mon, 13 Jun 2022 04:12:49 -0700 (PDT)
Received: from RD-3580-24288.rt.l (42-72-115-109.emome-ip.hinet.net. [42.72.115.109])
        by smtp.gmail.com with ESMTPSA id g17-20020a056a000b9100b0051b4e53c487sm5199989pfj.45.2022.06.13.04.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 04:12:49 -0700 (PDT)
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
Subject: [PATCH v2 01/15] dt-bindings: usb: Add Mediatek MT6370 TCPC
Date: Mon, 13 Jun 2022 19:11:32 +0800
Message-Id: <20220613111146.25221-2-peterwu.pub@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613111146.25221-1-peterwu.pub@gmail.com>
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_041250_996428_5F538A9B 
X-CRM114-Status: GOOD (  11.03  )
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

Add Mediatek MT6370 TCPC binding documentation.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 .../bindings/usb/mediatek,mt6370-tcpc.yaml    | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
new file mode 100644
index 000000000000..aa083e92bbba
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/mediatek,mt6370-tcpc.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/usb/mediatek,mt6370-tcpc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Mediatek MT6370 Type-C Port Switch and Power Delivery controller
+
+maintainers:
+  - ChiYuan Huang <cy_huang@richtek.com>
+
+description: |
+  Mediatek MT6370 is a multi-functional device.
+  It integrates charger, ADC, flash, RGB indicators,
+  regulators (DSV/VIBLDO), and TypeC Port Switch with Power Delivery controller.
+  This document only describes MT6370 Type-C Port Switch and
+  Power Delivery controller.
+
+properties:
+  compatible:
+    enum:
+      - mediatek,mt6370-tcpc
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - compatible
+  - interrupts
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
