Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389FDC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:27:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC9D060F41
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC9D060F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nC+OO1B+G5x4GV1hXwneEsKiYBX0qvzM8h+sx0UG48Y=; b=o+VR1bqhbXTcYy
	N3Cs6LpVxqvr/ZeeAtkFKYSLBnVFNWuPGhHDqe+RAkHjdcUHfDFKbd2OcNw9OUE9bpdFNZ5dYT8B4
	UbMS0iZ/xWncIHsq+7WJYdKUrSuPxvDg+OuCLz3X/Qr8UzdjP+lfaWJCLmXtR6KFGD5BYbF1Gco80
	1hFtXro3ESSvs1QUyCGHLAyt3oFkl6JoCowv+9F0AHJTRb/PCBy78F0a/ppvSbV7voX2F5VSQx0gL
	lq9z7Nc/UvUBsbp1V6fxK+aj1wQTb5nRI9833vxUEtLCJnaix5U7jvCpwRstqLAF52wwWOkK5HXQB
	11qvtu0FDGGL4FesK8Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiGQ-0008hf-57; Mon, 16 Aug 2021 19:27:14 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiF3-0008Gr-S5
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 19:25:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id q10so25143230wro.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 12:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cuwv4CvAhC05XO/EvjJwqQIYC9i7gmGCUO5hp62Mr0c=;
 b=CPlb/rsrvzBG23rv3SzKewzwWwNQQQzgWeP1HSmiCOTkXST7xpnMXkde39Vdx2WHW3
 P7GKNsJ6Q6WqB8edC93S0hQISFDowL1PW2EoLturEvfBtbsONxNH/R04V3qPNmmMv4UX
 h2u5MKhV2Tj0EpfRQQW5zmvRX38eG8d5kyFZu8FIKl8z2z3Mt008e0WVf577nGhAnA0X
 HJ+lTJ0zJC9NbjB2N2LFYJM1g2HBX3OYIhYeHxwzGl52Rs5oluRmFFq3Kc736geWmgtE
 MnfDcm4Hkk73cWKgJ6BoTtRndgetz8Toe+t+aU29J3TsJdgdLUQHdYXsM+f4XbUSE3ZF
 lqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cuwv4CvAhC05XO/EvjJwqQIYC9i7gmGCUO5hp62Mr0c=;
 b=fU4AbpDf21/Mn0jy52wu+K1Zl9SU/vecmEUkeQU96oNXLKt0kv/lHEiBuhSdSGoZvP
 8XS/BhStiYzrzOIW1YOcAUZa2LZcoXaJaaIivEsKEv4Ia4XlwZdeSULBa5lH3PxCEyfv
 tV2X9JOYtNb2LRGw9Z4QysgHstG/DK+N6MSG7IABJrwncAS6ZHGCOL9qrBDYkYFUbGTb
 4+UAQvvI9WGkGFMa9A18zDoVw7hQiCzdJFR7aNvMO+u6Eg6LR+TBM0sBPWEisN1MaoRS
 yNNqRPaiVKDK43quuDFGXgbUqIBbEezmCXVo0b1e3p/2nBZT9bFMo/iLW/aRTWJjlk8w
 ivAw==
X-Gm-Message-State: AOAM532xqlIxA1ihiV4gkaN0/X/zAaElwyglblu2P5k5VYKoLoGZ/290
 ZcSK7L7VJD6HCew7tuhREwwSKQ==
X-Google-Smtp-Source: ABdhPJyMWlB5Xjlg2TVVeZf98LQxRuHOrhJGqrDGXl3FSZ5HPt+73twdtLFI+5rzbw89BirDZTSthQ==
X-Received: by 2002:a5d:51cb:: with SMTP id n11mr38039wrv.221.1629141947284;
 Mon, 16 Aug 2021 12:25:47 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:47 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 1/5] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Date: Mon, 16 Aug 2021 21:25:19 +0200
Message-Id: <20210816192523.1739365-2-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816192523.1739365-1-msp@baylibre.com>
References: <20210816192523.1739365-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_122549_930402_4AEC7DB0 
X-CRM114-Status: GOOD (  11.30  )
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

DP_INTF is similar to the actual dpi. They differ in some points
regarding registers and what needs to be set but the function blocks
itself are similar in design.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../display/mediatek/mediatek,dpi.yaml        | 48 ++++++++++++++++---
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..de4bdacd83ac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: mediatek DPI Controller Device Tree Bindings
+title: mediatek DPI/DP_INTF Controller Device Tree Bindings
 
 maintainers:
   - CK Hu <ck.hu@mediatek.com>
@@ -13,7 +13,8 @@ maintainers:
 description: |
   The Mediatek DPI function block is a sink of the display subsystem and
   provides 8-bit RGB/YUV444 or 8/10/10-bit YUV422 pixel data on a parallel
-  output bus.
+  output bus. The Mediatek DP_INTF is a similar function block that is
+  connected to the (embedded) display port function block.
 
 properties:
   compatible:
@@ -23,6 +24,7 @@ properties:
       - mediatek,mt8173-dpi
       - mediatek,mt8183-dpi
       - mediatek,mt8192-dpi
+      - mediatek,mt8195-dpintf
 
   reg:
     maxItems: 1
@@ -37,10 +39,11 @@ properties:
       - description: DPI PLL
 
   clock-names:
-    items:
-      - const: pixel
-      - const: engine
-      - const: pll
+    description:
+      For dpi clocks pixel, engine and pll are required. For dpintf pixel, pll,
+      pll_d2, pll_d4, pll_d8, pll_d16, hf_fmm, hf_fdp are required.
+    minItems: 3
+    maxItems: 8
 
   pinctrl-0: true
   pinctrl-1: true
@@ -64,6 +67,39 @@ required:
   - clock-names
   - port
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-dpintf
+    then:
+      properties:
+        clocks:
+          minItems: 8
+          maxItems: 8
+        clock-names:
+          items:
+            - const: pixel
+            - const: pll
+            - const: pll_d2
+            - const: pll_d4
+            - const: pll_d8
+            - const: pll_d16
+            - const: hf_fmm
+            - const: hf_fdp
+    else:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: pixel
+            - const: engine
+            - const: pll
+
 additionalProperties: false
 
 examples:
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
