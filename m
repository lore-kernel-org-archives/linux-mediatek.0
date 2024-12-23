Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C267E7718B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2024 10:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IYylV8X3kG4etEmNRe4Z7PF9+9a1DSK0QLEu47Tihug=; b=I0mUNRz6GFQKRvXVTvkXSDa/dd
	GS4M0FU4uuXdMv+2Ki4gqE5VBxDk3T1Pwjxp5aMaKGiae+TYJWHf8Yf1q+EX+mTdeTqgcIMMyJeMV
	GbD6kuhFuM25oSCyo1oe0xnD2QmyJcxD72YcL7oUO4VQF2xO9bMXQ+DNg9K+0Zt7iZnqiTediag0w
	YsaXUqeRL0y86JjAKbj4n3PCTL7TFbXh3dQO3Wr92dvtrUaIyb60WHOewWygyay8pw36h4fPJFJi5
	nmJhYPcGl1FouS1XRX09ar7OmaJEL1dQyvYeNK05KH/ABYN5sLWbCfOLuB8kAFiTjfVOTVq2rPKrC
	G//phKyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfSZ-00000009lnB-30qa;
	Mon, 23 Dec 2024 10:14:47 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfSX-00000009lmG-2VOb
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Dec 2024 10:14:46 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2161eb94cceso25514275ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Dec 2024 02:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734948884; x=1735553684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IYylV8X3kG4etEmNRe4Z7PF9+9a1DSK0QLEu47Tihug=;
        b=R1cql95upXmBsxQCPF+ppwoa1PITDOMJY8iwRLCDK8d/AQ64rJArdRnB6rdWHqLcJM
         u7GmODtpPy8I1mycjm5WYnuCe2zl60tRdSqt291H61EZWumNlR3+6vsRyuY7Sw5hgBmw
         LzMeP/pC8ltcBjorCiTbmxM5rqAmLIRlNXAgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948884; x=1735553684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYylV8X3kG4etEmNRe4Z7PF9+9a1DSK0QLEu47Tihug=;
        b=BQM3EMkmtSBMUt1tRB+oXF7c3lzOerfVE9b7ceyBnHVn/HUbO1urwaZGFXMqWN5i/s
         a7elmeRp9pVL8Ab6yMjWa9qHbVe6WMgbRr2UKQ5bIW57kcgj/J5ZK8mirbY7ea2ZM+Pq
         hJNF1SbnYyR1GtgfVJftZmu5aDlCp7rQzzdshdHpWMMwlN50X0TnT1s/yC7K95D2MLk/
         z+XdRlHBRikGSp441++UdnoLArh7d/o3oW+B54ur48ocWUSeE1ipwPbZ2uQcKB82Dgcg
         xTB6uDE46FxPlbr+5d2p7/fKC28bZTgOOMoFoMo9JhH1h49O5FWtslt4+lt/9ktLaLA4
         2+5A==
X-Forwarded-Encrypted: i=1; AJvYcCUnuU87OqhSNZOvDT6BtsJAy78HZOXWoCvfggUcuq52b+chFoqAsg53ZvmHHR/ujXjz6O4TOs2fmrv9fF8FCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykGHTchhpCNbO8vg/+NvRoH0MBYx1c4JwTtdn7rgJdmQWJ7Maz
	5DtlOTh3mQWY9bLyAm7DjLfF4/asmlAZKIIx0/NYg72wC/yF20hyNTNY5L9KlA==
X-Gm-Gg: ASbGncsyUVI19aPn0balScOefNQN9Tt6ufy1LOTHvXSxogeHMX01ZDoDLICV2DJgs96
	C94JYZoqdUFy8MlWXRcawRksAldv6dZrG8eoUmrHSWQO1B46lBpBV+EmTVDOEtagNCiIQb3gF+f
	qI1bPQyFniaNJdu0hRFQgTAowcEPTbj+4j1LEkuKuKOVYFfZ8yEPpR3OIvffZZs9IP+KNLWIsQn
	WuS8MPzhXnQUXHXUfw8zmyKwMw19kj8Cgg7l1+LIWYGvgZf6D8k2Y8MpaXz97NkPcZDckPGCvw=
X-Google-Smtp-Source: AGHT+IGYdqL5qn01ogk9p/xgsJMLTtx9vs0gfy/O/5AgnXiCHLrB4hynGoXLmR8ilJTbmNz5Qv1kfg==
X-Received: by 2002:a17:902:e945:b0:215:4a4e:9262 with SMTP id d9443c01a7336-219e6e8c58amr194289615ad.8.1734948884572;
        Mon, 23 Dec 2024 02:14:44 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4fc4:9ee5:ceb8:cb2e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdde7sm70193325ad.149.2024.12.23.02.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:14:44 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: Drop MT8192 Chromebook variants that never shipped
Date: Mon, 23 Dec 2024 18:14:31 +0800
Message-ID: <20241223101434.2170166-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_021445_660974_5AA543B1 
X-CRM114-Status: UNSURE (   7.02  )
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

The Hayato rev5 sku2 and Spherion rev4 variants were designed in
anticipation of shortages of the headphone codec. This never happened.
As far as our records show: the variants were never produced or
shipped, and no such devices were deployed to any lab.

Drop them.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index b1687bbc57c2..2336070abaf4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -375,12 +375,6 @@ properties:
           - const: google,hayato-rev1
           - const: google,hayato
           - const: mediatek,mt8192
-      - description: Google Hayato rev5
-        items:
-          - const: google,hayato-rev5-sku2
-          - const: google,hayato-sku2
-          - const: google,hayato
-          - const: mediatek,mt8192
       - description: Google Spherion (Acer Chromebook 514)
         items:
           - const: google,spherion-rev3
@@ -389,11 +383,6 @@ properties:
           - const: google,spherion-rev0
           - const: google,spherion
           - const: mediatek,mt8192
-      - description: Google Spherion rev4 (Acer Chromebook 514)
-        items:
-          - const: google,spherion-rev4
-          - const: google,spherion
-          - const: mediatek,mt8192
       - items:
           - enum:
               - mediatek,mt8192-evb
-- 
2.47.1.613.gc27f4b7a9f-goog


