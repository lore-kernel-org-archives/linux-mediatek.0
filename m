Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 20:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NIIOQNOFo9BUcvNTf4j+/H7cLFNbSQtGHZJ3imtIcps=; b=VE2iohSY55mr+m
	6+Vc2AEfeMNbRKuwNBgxxZxHMegxRskF3iVaHxE+ZTMsHc8coEO4m7enpn/Zq2W+HqFr5TWgqjsfn
	ahKAXHpm6eHaVBcio7fNNw5Ld+lGv5fUGfrVW5aYjuRmkkpInHMDLWx+fPEqw5w537btxtgLDBHTC
	GpcFS0Yxg8pfGou+r72hYxMOUER555+LYHkpyluJZZ2zyCjQrgQHplE6+FP3+lJw/Jqq24FT0LRiB
	BOTtuQGCCVs1+/slc6dDn7rD1m6ZyO2w9izX+st5RJgvO3nqX5k1ZlIqcFqL5HeTHuhZMGs73KKLw
	f2M8SNV5jsZWB36146gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvlnf-0089RL-4Z; Mon, 30 May 2022 20:15:39 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvln7-0089Av-Jg
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 20:15:07 +0000
Received: by mail-wr1-x431.google.com with SMTP id e25so5386413wra.11
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x/Dp/zG0GUpVg5pylRpz2bBeewgylQW8uvOtIHZ+kQ4=;
        b=zlpOUy+1Wox7YTbXLaYC9kanMsm7CfiuU3NFzVSErocML+qCQqqmON+78BsSU/dqRX
         gyveAXELf6YPf4bA9OsUFOyvZPbRkcH00YF4h/Y3J+M+TqWyKgA0oRDRP24tzAs4ZPlD
         XusIO9vcyCtJPkTVsrkFfmFUCLFZ5gWPIOyRkRis6CxvND+s5geN/W0oQRsDrY0wtReu
         /rsnx4WHxnzzTUjXe5RpkOtg5vavCeh7kT+dVPJEm3nicPPEUkSg7tiZvadLj0AvKx9z
         wA+nBX6B6z4WiLN+ex3MrXDPJLyImxFFBIxbWuvTsMGSeUeg8JWeDcBiLTje/egA2Ydf
         RsNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x/Dp/zG0GUpVg5pylRpz2bBeewgylQW8uvOtIHZ+kQ4=;
        b=Rc/PfyzUgjsNlIaT8G9au23j8PSqljPFmmVfnWJ3DO+SkVo8l+cr/PQ2A6BU5yOEGa
         rOtVbQY5swM7p0Tnpdo6i9AAvIt8ikMYm2JGsI7RvJt3zYb5jPwiUlrL5Qr6F7JFMJh8
         v9X2jNkFJRuuy7VRjtdgJx3DZrhUmgj0hyjo8W/BlLhstK46dDq6AoWC9/JExAUJ0bH8
         3KSnJlAAF1hOL9/z/YqH48am0W3QvcxULdjEh+aUVe2JD4DlMae5Dl1fXE9up2WrmIph
         fjupmggA2ih2YmiG7Q4X7IYrdxFxYU7kBtB1bHiBX3P7oSiHocl3Xg79it7SJJp1ecKS
         +BDw==
X-Gm-Message-State: AOAM5301lsDZ3r2AcTW0aLIdujS4ymqFZyQ3LZ1HkCfqPYP/6SJ3tcAF
	x/9XvQ+UUeWoK7i8AnQDnfue5w==
X-Google-Smtp-Source: ABdhPJxkrVUg6pTK4pFvQWjJ1T9F9EWD/ezcY3p8Ii1GByIQAGMYQmy7kqTOhYXAiJ1eFSg67CETkg==
X-Received: by 2002:adf:f1c3:0:b0:210:3532:eb with SMTP id z3-20020adff1c3000000b00210353200ebmr5244751wro.196.1653941702332;
        Mon, 30 May 2022 13:15:02 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id t1-20020adfe101000000b0020d110bc39esm9770401wrz.64.2022.05.30.13.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 13:15:01 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: matthias.bgg@gmail.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 3/7] dt-bindings: display: mediatek: add bindings for MT8365 SoC
Date: Mon, 30 May 2022 22:14:32 +0200
Message-Id: <20220530201436.902505-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530201436.902505-1-fparent@baylibre.com>
References: <20220530201436.902505-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_131505_741217_F1A0149C 
X-CRM114-Status: GOOD (  11.09  )
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

Add MT8365 binding documentation for all the display components that are
compatible with the compatible string from other SoCs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../bindings/display/mediatek/mediatek,aal.yaml |  1 +
 .../display/mediatek/mediatek,ccorr.yaml        |  1 +
 .../display/mediatek/mediatek,color.yaml        |  1 +
 .../display/mediatek/mediatek,dither.yaml       |  1 +
 .../bindings/display/mediatek/mediatek,dsi.yaml | 17 +++++++++++------
 .../display/mediatek/mediatek,gamma.yaml        |  1 +
 .../display/mediatek/mediatek,mutex.yaml        |  1 +
 .../bindings/display/mediatek/mediatek,ovl.yaml |  1 +
 .../display/mediatek/mediatek,rdma.yaml         |  1 +
 9 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index d4d585485e7b..d47bc72f09c0 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt8186-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
+              - mediatek,mt8365-disp-aal
           - const: mediatek,mt8183-disp-aal
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 63fb02014a56..fc999e614718 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -32,6 +32,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ccorr
+              - mediatek,mt8365-disp-ccorr
           - const: mediatek,mt8183-disp-ccorr
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index d2f89ee7996f..9d081da433e8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -39,6 +39,7 @@ properties:
               - mediatek,mt8186-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 8ad8187c02d1..a7706cd65675 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -29,6 +29,7 @@ properties:
               - mediatek,mt8186-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
+              - mediatek,mt8365-disp-dither
           - const: mediatek,mt8183-disp-dither
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index fa5bdf28668a..d17ea215960c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -22,12 +22,17 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt2701-dsi
-      - mediatek,mt7623-dsi
-      - mediatek,mt8167-dsi
-      - mediatek,mt8173-dsi
-      - mediatek,mt8183-dsi
+    oneOf:
+      - enum:
+          - mediatek,mt2701-dsi
+          - mediatek,mt7623-dsi
+          - mediatek,mt8167-dsi
+          - mediatek,mt8173-dsi
+          - mediatek,mt8183-dsi
+      - items:
+          - enum:
+              - mediatek,mt8365-dsi
+          - const: mediatek,mt8183-dsi
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a89ea0ea7542..f54859cfc97b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -30,6 +30,7 @@ properties:
               - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
+              - mediatek,mt8365-disp-gamma
           - const: mediatek,mt8183-disp-gamma
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 3fdad71210b4..f4a12dfae77b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -32,6 +32,7 @@ properties:
       - mediatek,mt8186-disp-mutex
       - mediatek,mt8192-disp-mutex
       - mediatek,mt8195-disp-mutex
+      - mediatek,mt8365-disp-mutex
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index a2a27d0ca038..20e4ca4fc915 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -41,6 +41,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-ovl
+              - mediatek,mt8365-disp-ovl
           - const: mediatek,mt8192-disp-ovl
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 0882ae86e6c4..3bc914785976 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -40,6 +40,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
