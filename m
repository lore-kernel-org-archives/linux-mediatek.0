Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B115C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 13:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Yf0MtNAXJR5sVHoDdZUb8vL+9/OJhXtHzJtQPPYmfMs=; b=xRsRCnOe4S9os/eaKVcVFgit8K
	QXAR6381yF3XBkX5kEtw/uk8rKh7i8x/v8fRCe7RTGZehysg4x7TjArpbIsuJ3V71+SlRYF0TLF0m
	YDsY2IiDp2VbHIeSjtYp6wGRLvU6MSs86R9OLwy8h9RuPgs/GL465NBPNN4FKrxWC0wRJoQ5sxIYy
	3MRyvaUFwZM4QAhcReGerv8SOKkM3ERrx114gz/sBVwfUeVnpmtA3fQnijRZehp9NJZEhxL3gq59z
	wm4CbJUnxDI7+OVU11op2ieuy86ISSGAh9d+nvPX2e7ahnfBDkJl0leLcOd5fksQBIBrq9qUbjY/D
	vs1HfVsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXj67-002LRM-Ev; Thu, 02 Mar 2023 13:35:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXj64-002LPw-34; Thu, 02 Mar 2023 13:35:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id da10so67748259edb.3;
        Thu, 02 Mar 2023 05:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677764144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yf0MtNAXJR5sVHoDdZUb8vL+9/OJhXtHzJtQPPYmfMs=;
        b=DcqS7t4f8C7YXe9qA9b023TC/KQa23JP80zD6x99lNkqgnAUVcaBeTkTTAzvUn+kNE
         OXcDjv55WZwrX3G+2guV57T8ScuRdsVAktXwwzDwQatGS4TmdXsQhYkA1v0YzYXvC4ew
         nuORNmqbYsoXRQgLeNh+tB3AiQyvm+6CFMICcHK+NJ9hdda1QeqKAoImPOG4PSKi3xFc
         ERlANB7GZV6M7lrzofS5p67IYszjvhmZ23Xel4oejt46jCEsUFExnqK7F9cmULqydUwJ
         GahAZ8c1rdjws95m1ZvcZRwhqcK4jvcXT0tRkexs19ZWZlV2SMuNmA3aCMeMubk15w30
         xTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677764144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yf0MtNAXJR5sVHoDdZUb8vL+9/OJhXtHzJtQPPYmfMs=;
        b=VKuGjxno7eHuDn/QJ0ex9Gu3Vlh+2mS4aYRFjKObr4se0mV8KfdGKKZ59qOX0otg0I
         kFAzTLSi58UUaXnLJmUfUA+BEzmRCPEsJ7qq5w/4ILtt6IP8oQbN0qmeLgwP4vj8qUU3
         Ab0E35IcvDNtcWtdGgZolw7h+Z2vWT5XA0XkjuMoO+ZAWA8OtNcIQ9c/IdvlzUkAN0iu
         maCzUkUjZfO+mhGEuhu7U1/2Wj17Icdn+1wxvk0yaxlj2mUPccn7fCAKmcTVbm/cWgxA
         i/vFv2ugedvjp7ABMV0/ot9sYg3y/Ntbr8jvc50da+rOrKAkZwuRWPO3AyUP0mkcafpU
         WloA==
X-Gm-Message-State: AO0yUKWyv/EluXBv5quQ+qWkvo9lfCYJ8WmEhXcqBNBYPqrdTdkkWdP0
	q4f7/nA4Gp28uN/yExO3sY8=
X-Google-Smtp-Source: AK7set+tqNctmfdtXnkHqCokcKpzLNkCvdOXorc3HJXnrnmzL61/Ua+XESxTzkZ7Eairo+enHtTY1Q==
X-Received: by 2002:a17:906:6445:b0:8f7:48fe:319d with SMTP id l5-20020a170906644500b008f748fe319dmr2016089ejn.17.1677764144306;
        Thu, 02 Mar 2023 05:35:44 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id a26-20020a170906191a00b008e56a0d546csm7011833eje.123.2023.03.02.05.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 05:35:43 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: display: mediatek: Compatible list cleanup
Date: Thu,  2 Mar 2023 16:35:28 +0300
Message-Id: <20230302133528.124113-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_053548_201002_3EE46598 
X-CRM114-Status: GOOD (  10.01  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Several DT bindings of MediaTek display blocks make unnecessary use of
"oneOf" and "items", and have some enums with only 1 element. Remove
unnecessary "oneOf" and "items", and replace enums that have 1 element
with "const".	

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml  |  3 +--
 .../display/mediatek/mediatek,ccorr.yaml         | 10 ++++------
 .../display/mediatek/mediatek,color.yaml         | 10 ++++------
 .../display/mediatek/mediatek,dither.yaml        |  3 +--
 .../bindings/display/mediatek/mediatek,dsc.yaml  |  4 +---
 .../display/mediatek/mediatek,gamma.yaml         |  7 +++----
 .../display/mediatek/mediatek,merge.yaml         |  8 +++-----
 .../bindings/display/mediatek/mediatek,od.yaml   |  8 +++-----
 .../display/mediatek/mediatek,ovl-2l.yaml        | 10 ++++------
 .../bindings/display/mediatek/mediatek,ovl.yaml  | 16 ++++++----------
 .../display/mediatek/mediatek,postmask.yaml      |  3 +--
 .../bindings/display/mediatek/mediatek,rdma.yaml | 13 +++++--------
 .../display/mediatek/mediatek,split.yaml         |  4 +---
 .../bindings/display/mediatek/mediatek,ufoe.yaml |  4 +---
 .../bindings/display/mediatek/mediatek,wdma.yaml |  4 +---
 15 files changed, 39 insertions(+), 68 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 92741486c24d..d8d78abd6c6c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -25,8 +25,7 @@ properties:
           - mediatek,mt8173-disp-aal
           - mediatek,mt8183-disp-aal
       - items:
-          - enum:
-              - mediatek,mt2712-disp-aal
+          - const: mediatek,mt2712-disp-aal
           - const: mediatek,mt8173-disp-aal
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..e72d2884bb49 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -21,18 +21,16 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8183-disp-ccorr
-      - items:
-          - const: mediatek,mt8192-disp-ccorr
+      - enum:
+          - mediatek,mt8183-disp-ccorr
+          - mediatek,mt8192-disp-ccorr
       - items:
           - enum:
               - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
       - items:
-          - enum:
-              - mediatek,mt8186-disp-ccorr
+          - const: mediatek,mt8186-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 62306c88f485..d0ea77fc4b06 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -22,12 +22,10 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-color
-      - items:
-          - const: mediatek,mt8167-disp-color
-      - items:
-          - const: mediatek,mt8173-disp-color
+      - enum:
+          - mediatek,mt2701-disp-color
+          - mediatek,mt8167-disp-color
+          - mediatek,mt8173-disp-color
       - items:
           - enum:
               - mediatek,mt7623-disp-color
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 5c7445c174e5..9d74de63fe63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -22,8 +22,7 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8183-disp-dither
+      - const: mediatek,mt8183-disp-dither
       - items:
           - enum:
               - mediatek,mt8186-disp-dither
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 49248864514b..37bf6bf4a1ab 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -19,9 +19,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8195-disp-dsc
+    const: mediatek,mt8195-disp-dsc
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a5c6a91fac71..6c2be9d6840b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -21,10 +21,9 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-gamma
-      - items:
-          - const: mediatek,mt8183-disp-gamma
+      - enum:
+          - mediatek,mt8173-disp-gamma
+          - mediatek,mt8183-disp-gamma
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 69ba75777dac..c474ee6fa05b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -20,11 +20,9 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-merge
-      - items:
-          - const: mediatek,mt8195-disp-merge
+    enum:
+      - mediatek,mt8173-disp-merge
+      - mediatek,mt8195-disp-merge
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 853fcb9db2be..7e6bbf8b5c60 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -20,11 +20,9 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt2712-disp-od
-      - items:
-          - const: mediatek,mt8173-disp-od
+    enum:
+      - mediatek,mt2712-disp-od
+      - mediatek,mt8173-disp-od
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index 4e94f4e947ad..16944a817d63 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -21,13 +21,11 @@ description: |
 properties:
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt8183-disp-ovl-2l
+          - mediatek,mt8192-disp-ovl-2l
       - items:
-          - const: mediatek,mt8183-disp-ovl-2l
-      - items:
-          - const: mediatek,mt8192-disp-ovl-2l
-      - items:
-          - enum:
-              - mediatek,mt8186-disp-ovl-2l
+          - const: mediatek,mt8186-disp-ovl-2l
           - const: mediatek,mt8192-disp-ovl-2l
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 065e526f950e..c606cfb3f834 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -21,14 +21,11 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-ovl
-      - items:
-          - const: mediatek,mt8173-disp-ovl
-      - items:
-          - const: mediatek,mt8183-disp-ovl
-      - items:
-          - const: mediatek,mt8192-disp-ovl
+      - enum:
+          - mediatek,mt2701-disp-ovl
+          - mediatek,mt8173-disp-ovl
+          - mediatek,mt8183-disp-ovl
+          - mediatek,mt8192-disp-ovl
       - items:
           - enum:
               - mediatek,mt7623-disp-ovl
@@ -40,8 +37,7 @@ properties:
               - mediatek,mt8195-disp-ovl
           - const: mediatek,mt8183-disp-ovl
       - items:
-          - enum:
-              - mediatek,mt8186-disp-ovl
+          - const: mediatek,mt8186-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 27de64495401..12ec410bb921 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -21,8 +21,7 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8192-disp-postmask
+      - const: mediatek,mt8192-disp-postmask
       - items:
           - enum:
               - mediatek,mt8186-disp-postmask
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 3ade2ece3fed..42059efad45d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -23,14 +23,11 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt2701-disp-rdma
-      - items:
-          - const: mediatek,mt8173-disp-rdma
-      - items:
-          - const: mediatek,mt8183-disp-rdma
-      - items:
-          - const: mediatek,mt8195-disp-rdma
+      - enum:
+          - mediatek,mt2701-disp-rdma
+          - mediatek,mt8173-disp-rdma
+          - mediatek,mt8183-disp-rdma
+          - mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt8188-disp-rdma
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
index 35ace1f322e8..54b7b0531144 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -20,9 +20,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-split
+    const: mediatek,mt8173-disp-split
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index b8bb135fe96b..87523b45a210 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -21,9 +21,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-ufoe
+    const: mediatek,mt8173-disp-ufoe
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 7d7cc1ab526b..52f233fe1c0f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -20,9 +20,7 @@ description: |
 
 properties:
   compatible:
-    oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-wdma
+    const: mediatek,mt8173-disp-wdma
 
   reg:
     maxItems: 1
-- 
2.39.2


