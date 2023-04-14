Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919C9C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w3FtZ9dci4dGhDGGxbjVvfgq7DYDIdQzDNghYvxCfzQ=; b=TTV0bzghmh8hu7M5r2VzbWKhBY
	81hcuFotNpgX2TMGtGdoBWoG7Ce0EMKHOlm7AwrCt8EwyDeSz2tJ+JQI6lfGZr7BvW0liWyIS5BIY
	XsiZ3uK640Pb46HNjr5jOsJ8rZC+hD8oxiYFY8oEfD0Q1mgL6h1UgK/PKqGVUvyFtNk89jgQk2U8V
	a6EkEzvztVSwEHLOq4gNdP5ui/fF/JRM+7mT9XqLT10vx0qlPuYk8vb3m1i5m8oqsFLueCfuNPQo3
	61lKzwpUwic7JrN4UkKXViD8Bx0UfOh5PfLqh5Y5UqP7O7gipR50yerLFrohybZkEM6tSjFiYOUEM
	kGmBEFCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEs3-008imm-0V;
	Fri, 14 Apr 2023 08:33:27 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnErs-008iiz-0T
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:33:25 +0000
Received: by mail-ej1-x635.google.com with SMTP id fy21so806839ejb.9
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681461194; x=1684053194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3FtZ9dci4dGhDGGxbjVvfgq7DYDIdQzDNghYvxCfzQ=;
        b=Q4TrIEiCLY582s9gOCKEmeVshUj4v3e4OzKFnjBIpz46uznJFoZM/KOVOGMHBr+h4m
         pMI8bdn52SkDCClu6SkV/WqhFk5ye+O5Skv7mHS2Xfs+UqAkB+LwjCbk+Yw1JdF8X7ML
         JJuGfzxOJ2k9mqG52C/xSUeMedxNuQSTYlRPMOJY7oOY6KjE+iuH26TwWC3HHnK2wHvt
         F20lCvk5ik7XzWW9hKvLNq8yRETMuN4NsRgqQqoHwb23l/tvCoykT8wSyqFtaH1sDKHw
         Yg0em/tbCVBAPMp+7sh/C2zGbxnE7s1WIPTBYWr++39IdfJz7+bbCHQTcoiXsL5CXbl2
         uVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681461194; x=1684053194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3FtZ9dci4dGhDGGxbjVvfgq7DYDIdQzDNghYvxCfzQ=;
        b=lRhreFN+9uGeEVOXWM47AGQskOyAKTHBiUZc1G3bOSWjCNsNUoTrI6lkpO3Z9OVVQU
         ZtRYUZItNWEKQlTJVWAit7XR90RXfGSeyXfX+Vo2NIk3h6+c09Vu628TAzSp9lL87mkR
         WxHa0RB/QArMyCBQJZrxR0EfgiadH9X7RviLB71AkyxmcDW3UVrkNp+aukkusHVgzYuE
         eO1jKn+3iHyEwtlc2hQ68VmVIpJUJX9Nl9V/WucUSR+cY5WP95O2aX4kqAnRO2cGqoiU
         qtvDMFhweAnydowlbtKoP0QIBUJvHddAf1Cz66vNZX3fe4/o9Y3ZgPu9KdzlhOjpbz6S
         skLA==
X-Gm-Message-State: AAQBX9c2Sk8urP1B4SLls9O/hozuyeFQM3Xe91xFZI7Ozi6b5Z+7OnXP
	Ivab4ueYNJC3/VD1F0PZ4EmupB10Lj8jFOZxvlU=
X-Google-Smtp-Source: AKy350aGQRs1vh6Pg/6HTptOMcYpNBCL9gg3bQMV+WAErgKSe7bXg5dCXM2lmhbw/J6OvxeA82mGbw==
X-Received: by 2002:a17:906:4f91:b0:932:83fa:d2fe with SMTP id o17-20020a1709064f9100b0093283fad2femr6035425eju.12.1681461194314;
        Fri, 14 Apr 2023 01:33:14 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id pg16-20020a170907205000b0094a85f6074bsm2121148ejb.33.2023.04.14.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 01:33:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: display: mediatek: simplify compatibles syntax
Date: Fri, 14 Apr 2023 10:33:11 +0200
Message-Id: <20230414083311.12197-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_013316_231012_6B9FE914 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

Lists (items) with one item should be just enum because it is shorter,
simpler and does not confuse, if one wants to add new entry with a
fallback.  Convert all of them to enums.  OTOH, leave unused "oneOf"
entries in anticipation of further growth of the entire binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: angelogioacchino.delregno@collabora.com
---
 .../bindings/display/mediatek/mediatek,ccorr.yaml   |  7 +++----
 .../bindings/display/mediatek/mediatek,color.yaml   | 10 ++++------
 .../bindings/display/mediatek/mediatek,dither.yaml  |  4 ++--
 .../bindings/display/mediatek/mediatek,dsc.yaml     |  4 ++--
 .../bindings/display/mediatek/mediatek,gamma.yaml   |  7 +++----
 .../bindings/display/mediatek/mediatek,merge.yaml   |  7 +++----
 .../bindings/display/mediatek/mediatek,od.yaml      |  7 +++----
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml  |  7 +++----
 .../bindings/display/mediatek/mediatek,ovl.yaml     | 13 +++++--------
 .../display/mediatek/mediatek,postmask.yaml         |  4 ++--
 .../bindings/display/mediatek/mediatek,rdma.yaml    | 13 +++++--------
 .../bindings/display/mediatek/mediatek,split.yaml   |  4 ++--
 .../bindings/display/mediatek/mediatek,ufoe.yaml    |  4 ++--
 .../bindings/display/mediatek/mediatek,wdma.yaml    |  4 ++--
 14 files changed, 41 insertions(+), 54 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index b04820c95b22..dc22bd522523 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -21,10 +21,9 @@ description: |
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
index 5c7445c174e5..1588b3f7cec7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -22,8 +22,8 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8183-disp-dither
+      - enum:
+          - mediatek,mt8183-disp-dither
       - items:
           - enum:
               - mediatek,mt8186-disp-dither
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index 49248864514b..2cbdd9ee449d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -20,8 +20,8 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8195-disp-dsc
+      - enum:
+          - mediatek,mt8195-disp-dsc
 
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
index 69ba75777dac..2f8e2f4dc3b8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -21,10 +21,9 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-merge
-      - items:
-          - const: mediatek,mt8195-disp-merge
+      - enum:
+          - mediatek,mt8173-disp-merge
+          - mediatek,mt8195-disp-merge
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
index 853fcb9db2be..29f9fa8f8219 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,od.yaml
@@ -21,10 +21,9 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt2712-disp-od
-      - items:
-          - const: mediatek,mt8173-disp-od
+      - enum:
+          - mediatek,mt2712-disp-od
+          - mediatek,mt8173-disp-od
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index 4e94f4e947ad..c7dd0ef02dcf 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -21,10 +21,9 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8183-disp-ovl-2l
-      - items:
-          - const: mediatek,mt8192-disp-ovl-2l
+      - enum:
+          - mediatek,mt8183-disp-ovl-2l
+          - mediatek,mt8192-disp-ovl-2l
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl-2l
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 065e526f950e..92e320d54ba2 100644
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
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 27de64495401..11fe32e50a59 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -21,8 +21,8 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8192-disp-postmask
+      - enum:
+          - mediatek,mt8192-disp-postmask
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
index 35ace1f322e8..21a4e96ecd93 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
@@ -21,8 +21,8 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-split
+      - enum:
+          - mediatek,mt8173-disp-split
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
index b8bb135fe96b..62fad23a26f5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
@@ -22,8 +22,8 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-ufoe
+      - enum:
+          - mediatek,mt8173-disp-ufoe
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index 7d7cc1ab526b..991183165d29 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -21,8 +21,8 @@ description: |
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: mediatek,mt8173-disp-wdma
+      - enum:
+          - mediatek,mt8173-disp-wdma
 
   reg:
     maxItems: 1
-- 
2.34.1


