Return-Path: <SRS0=cnxW=N4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6B5C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 866A861050
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Sep 2021 19:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 866A861050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M8MnC8bu4lNaflLw+1cEGtKI/rTvVtt83h+DFMWeCcw=; b=LQtwuc0wYjWDrX
	0kxiHUVGf3hP8kqYd4wVxOsqLOXryd6Li9gJRv8GqcxD7uZgdG3ASU2DsiYqUFkrBEDWz/80tL8XT
	SZpT6QiDdKjRzNx2Yj6lzxInStzg+BC3zuhnBFw4oySwzJxml9DYs0TcFPkccXqurnjTXx0Zz2aaP
	VpmK4CHttMk3gl2wWO+W56s/+KeL8hnoYbhNecb/6ZQFQZhVTB/gZ8v6reaUuTrMl/Z0GhU8X3VhC
	7eYph9t9jrn2UGC8HBlYdSDvaoBfrQOsb4hL6ZcCE/5Qalrjuy+AOk2A/EG41aWFrdtL1NCbfMH/b
	kuR3FiUyEe88V6dZ6SOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNKR7-001liz-9V; Mon, 06 Sep 2021 19:37:45 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNKQS-001lQo-4q
 for linux-mediatek@lists.infradead.org; Mon, 06 Sep 2021 19:37:08 +0000
Received: by mail-wr1-x42f.google.com with SMTP id b6so11193501wrh.10
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Sep 2021 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8rhksTvVQ+Nq8KlfrbrTGziwnDodu5qGkrE8LAP3ErI=;
 b=qBXwqS4/FpUi8QmqOiyukUT2bdkyXa1o1yXUbFr/856oeRKngEb5EbGLQ4yu8J24MG
 +MOgpC0A+6BkEUKLBv06l70+6J16wiiEE8hB341v3qmk4NrARtC/Z5VaudenxVc+s7YV
 vBPCmk2S1czX6gkR+iBFGBXStUjPuR1Pm8jSBzktLIWBZP6usq6rBI0hHGYc7jogE+IH
 3zPVO6linsBCpj7TM/VUyxDKdT6un61DO+Y5JwaFuJPcWC75o/rJiFyDW/EbHbLOL2Jl
 XnmrqxkPFbO92mjZEZmQDLHRKKyi9kNR4z6vHWV+2qJl67o70KRuFuCBaEd5s3HUK/VE
 uwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8rhksTvVQ+Nq8KlfrbrTGziwnDodu5qGkrE8LAP3ErI=;
 b=oES7D4vQoiUaqeCjftVIWl0IfmsAQfKwww2iTuogv8tjpSZlOXuXFrBnDpKmC+cDXG
 z3QSgs3IUYlVnXDkfj4yVwQ+5yyeiupbSxd7fm/l6IO8m7eVXKSl159dtngwS9HmK2sI
 DCebnh+qTyYdJIi/vjqh9kZ9kfdo6MSklMJ6vqHsdlBdXww6Rir0pOvCY/lBH9y1m5lH
 UyWRI3SCQTUrArHmufi2M7i1/LwQ4j6fv9ZbKXvXFXm1nQuxIsgeYfUs13xrcKWO8W3t
 jTSXoIkjweSGmPoUdlQwzl/lXHDtdOJJRlSD7nd7UkA95ZNOGfSZ983OJXdLMp1afYeF
 +fOg==
X-Gm-Message-State: AOAM532Sw61TorExTsKk141CwYOr2BgMW58VOBL/jr1rz0XXK1IPuOm+
 JCP7IAlil3qCwx5cA4T25Vupdg==
X-Google-Smtp-Source: ABdhPJzP/DgsaBhy8hur2RweyMqFSFuzzpR0YUhyV79uSocm2gYrr3FEinvIh+6trQpHvfmzxoRiDg==
X-Received: by 2002:adf:c44b:: with SMTP id a11mr15049199wrg.416.1630957022035; 
 Mon, 06 Sep 2021 12:37:02 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w29sm8815202wra.88.2021.09.06.12.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 12:37:01 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 1/6] dt-bindings: mediatek,dpi: Add mt8195 dpintf
Date: Mon,  6 Sep 2021 21:35:24 +0200
Message-Id: <20210906193529.718845-2-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906193529.718845-1-msp@baylibre.com>
References: <20210906193529.718845-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_123704_247518_7601B026 
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

DP_INTF is similar to the actual dpi. They differ in some points
regarding registers and what needs to be set but the function blocks
itself are similar in design.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 .../display/mediatek/mediatek,dpi.yaml        | 43 ++++++++++++++++---
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..1a158b719ce6 100644
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
+      For dpi clocks pixel, engine and pll are required. For dpintf pixel,
+      hf_fmm and hf_fdp are required.
+    minItems: 3
+    maxItems: 3
 
   pinctrl-0: true
   pinctrl-1: true
@@ -64,6 +67,34 @@ required:
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
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: pixel
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
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
