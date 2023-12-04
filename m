Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AD6C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UeadimO+asAMlIwlEDVtTPemzDyXZcW7R/h9zRWVnDY=; b=Hn1d1HXGSYiGLUPeJ4dcDJJ6Uf
	QomlOPLk39Lprr3LDtaSh2Wgfaueaaf2R3kbofmoKl0jB8xJYk4yLr42i5YbdP1eRp64TiB4E9sbt
	lGMC84pl4UhWS0AZUr1YW9gnMgg/93SOm4Ds27szpKjfUxhjoGFhVSYwKXkSlrlmXzKtM0cOF6a/m
	taBjZzfAtN7qdTMYoZc7DJQZ8VtS6NBrTxmKrvbo8RmPe5DMGIKAcnxqnotqp8eTAewXEVbxaJCcu
	P2UIy6gFfQ29BnL1LT7XAIQsYyAXAxDhXOrqLvwYktJ07uLAncFqusL2YUFqwGSSn7tTXzOZ0oHDI
	uYIUxjqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XB-003IMA-0B;
	Mon, 04 Dec 2023 08:42:33 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4X1-003IFG-2G
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1d076ebf79cso3904045ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679341; x=1702284141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UeadimO+asAMlIwlEDVtTPemzDyXZcW7R/h9zRWVnDY=;
        b=H1hc4E8q+TCCTNrBSa7eusgeRrrHfMiCps3S7dx5n+sez9HxaHLS5hG9wfDYTsWeLw
         GBiuMXVWlys35ZAi9+YybK45Yy7Dv9f0hAzwGg49Vg8AGsEc7uRKjCzOdED1wHwIqzI+
         OkqM8n8TG6mCG4eB+m0FeUIV4cGMfs6SEalU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679341; x=1702284141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UeadimO+asAMlIwlEDVtTPemzDyXZcW7R/h9zRWVnDY=;
        b=LBjdzb/aU7D9CSxKvseqvDy5wIFTYnEVCeGB0GXHH+98EyjaX0ElsSGF9ribNf0rib
         cINP7k3mAI8XRMn4w3bgVVt2e5EXA7jgLRr3VKwXuAaHjXpKGVTmrmVt8iCsYCsMgnuQ
         aajkfpWEZQ3vKn7qG4f+YcdJp/ZeJd1hCvuhqzwFDo4HbYGQyAjQPtQVGtlguzGZleCq
         GTcazUk1iJsUBDiMOTINFt500fEZywzg/0aMoPFYyTY8nrXLsHOsN68Nrjud75q6mBWu
         sZPLYctCBwngpOswaOn8KMZRWlkTTFh+AIMR6jovPrIahC2FcrOhC9b2pfm2D4ADIxc1
         +aKg==
X-Gm-Message-State: AOJu0YzT1iqBstc40i38Zxai0JgcAcn0ho0GJSnntZtHrnSSky8bjGhg
	5rAfIz3KniNOFaGHAz9113yPKA==
X-Google-Smtp-Source: AGHT+IGxDNPGZ8kuF2V6CGoFP9EOV/VGJ0sku+SAfHpjO7lCJMftTJChmR8JtnVVUqFQ7PJHa9Gk3w==
X-Received: by 2002:a17:902:8c97:b0:1d0:6ffd:ce96 with SMTP id t23-20020a1709028c9700b001d06ffdce96mr1370655plo.79.1701679341305;
        Mon, 04 Dec 2023 00:42:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:20 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/9] dt-bindings: arm: mediatek: Sort entries by SoC then board compatibles
Date: Mon,  4 Dec 2023 16:40:03 +0800
Message-ID: <20231204084012.2281292-2-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004223_739397_D0834761 
X-CRM114-Status: UNSURE (   9.84  )
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

Some of the new MediaTek board entries were inserted in a chronological
order, or just randomly. This makes it harder to search for an entry.

Sort the entries by first grouping by SoC, then sorting by board
compatible strings. Also add a comment at the top asking people to do
the same.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---
Changes since v2:
- none
Changes since v1:
- none

 .../devicetree/bindings/arm/mediatek.yaml     | 123 +++++++++---------
 1 file changed, 62 insertions(+), 61 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a5999b3afc35..60337b439744 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -17,6 +17,7 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      # Sort by SoC (last) compatible, then board compatible
       - items:
           - enum:
               - mediatek,mt2701-evb
@@ -129,71 +130,10 @@ properties:
           - enum:
               - mediatek,mt8173-evb
           - const: mediatek,mt8173
-      - items:
-          - enum:
-              - mediatek,mt8183-evb
-          - const: mediatek,mt8183
-      - description: Google Hayato rev5
-        items:
-          - const: google,hayato-rev5-sku2
-          - const: google,hayato-sku2
-          - const: google,hayato
-          - const: mediatek,mt8192
-      - description: Google Hayato
-        items:
-          - const: google,hayato-rev1
-          - const: google,hayato
-          - const: mediatek,mt8192
-      - description: Google Spherion rev4 (Acer Chromebook 514)
-        items:
-          - const: google,spherion-rev4
-          - const: google,spherion
-          - const: mediatek,mt8192
-      - description: Google Spherion (Acer Chromebook 514)
-        items:
-          - const: google,spherion-rev3
-          - const: google,spherion-rev2
-          - const: google,spherion-rev1
-          - const: google,spherion-rev0
-          - const: google,spherion
-          - const: mediatek,mt8192
-      - description: Acer Tomato (Acer Chromebook Spin 513 CP513-2H)
-        items:
-          - enum:
-              - google,tomato-rev2
-              - google,tomato-rev1
-          - const: google,tomato
-          - const: mediatek,mt8195
-      - description: Acer Tomato rev3 - 4 (Acer Chromebook Spin 513 CP513-2H)
-        items:
-          - const: google,tomato-rev4
-          - const: google,tomato-rev3
-          - const: google,tomato
-          - const: mediatek,mt8195
-      - items:
-          - enum:
-              - mediatek,mt8186-evb
-          - const: mediatek,mt8186
-      - items:
-          - enum:
-              - mediatek,mt8192-evb
-          - const: mediatek,mt8192
-      - items:
-          - enum:
-              - mediatek,mt8195-demo
-              - mediatek,mt8195-evb
-          - const: mediatek,mt8195
       - description: Google Burnet (HP Chromebook x360 11MK G3 EE)
         items:
           - const: google,burnet
           - const: mediatek,mt8183
-      - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
-        items:
-          - enum:
-              - google,krane-sku0
-              - google,krane-sku176
-          - const: google,krane
-          - const: mediatek,mt8183
       - description: Google Cozmo (Acer Chromebook 314)
         items:
           - const: google,cozmo
@@ -244,6 +184,13 @@ properties:
               - google,kodama-sku32
           - const: google,kodama
           - const: mediatek,mt8183
+      - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
+        items:
+          - enum:
+              - google,krane-sku0
+              - google,krane-sku176
+          - const: google,krane
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
@@ -251,10 +198,64 @@ properties:
               - google,willow-sku1
           - const: google,willow
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8183-evb
+          - const: mediatek,mt8183
       - items:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - items:
+          - enum:
+              - mediatek,mt8186-evb
+          - const: mediatek,mt8186
+      - description: Google Hayato
+        items:
+          - const: google,hayato-rev1
+          - const: google,hayato
+          - const: mediatek,mt8192
+      - description: Google Hayato rev5
+        items:
+          - const: google,hayato-rev5-sku2
+          - const: google,hayato-sku2
+          - const: google,hayato
+          - const: mediatek,mt8192
+      - description: Google Spherion (Acer Chromebook 514)
+        items:
+          - const: google,spherion-rev3
+          - const: google,spherion-rev2
+          - const: google,spherion-rev1
+          - const: google,spherion-rev0
+          - const: google,spherion
+          - const: mediatek,mt8192
+      - description: Google Spherion rev4 (Acer Chromebook 514)
+        items:
+          - const: google,spherion-rev4
+          - const: google,spherion
+          - const: mediatek,mt8192
+      - items:
+          - enum:
+              - mediatek,mt8192-evb
+          - const: mediatek,mt8192
+      - description: Acer Tomato (Acer Chromebook Spin 513 CP513-2H)
+        items:
+          - enum:
+              - google,tomato-rev2
+              - google,tomato-rev1
+          - const: google,tomato
+          - const: mediatek,mt8195
+      - description: Acer Tomato rev3 - 4 (Acer Chromebook Spin 513 CP513-2H)
+        items:
+          - const: google,tomato-rev4
+          - const: google,tomato-rev3
+          - const: google,tomato
+          - const: mediatek,mt8195
+      - items:
+          - enum:
+              - mediatek,mt8195-demo
+              - mediatek,mt8195-evb
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8365-evk
-- 
2.43.0.rc2.451.g8631bc7472-goog


