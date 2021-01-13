Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A8DC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:08:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E030523131
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E030523131
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9WyAZmRXQoxiiAG4PTAeMVbGOuHaPQ6n8w+Qh0cauzQ=; b=cTStUHbF7KgmNEkleA5GmdJ44
	YqExN1jMc/aBVh9UuRDwiyedh6ZU+/aQtnRMVASatPnSNOVWmmhqtPGT+JM9KREyj9ATbguyr9/zr
	7Leh7fPn3LcyHCaUd05MbIZaAGSZ7gj5D9wx4mwLOFwevNW+I+BnBsMucQs4eaYUYvLzbqACadArt
	7tTSjIcVvmJaDuiTLzSYBnC8Drhn8ThlcvYg6dPRncXOZYHKmrBQuRgwb2k13ewQpfnflvca8U2/v
	wqtzKs5vD1v+x4+mFHn+GFsVj/FNPulfFfDF2T7ClWb1ErBSJl1KmiBjgD2uwMai0fpLWgeYzzt4w
	ZMidz7fQQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzZKG-0001oP-HH; Wed, 13 Jan 2021 06:08:12 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzZJp-0001WH-57
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 06:07:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id q4so474818plr.7
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 22:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y4TBp5q5xBws0la/+DZ2ckUg4m79Non3qFa6SgDcWGg=;
 b=cDWSghPuufn3T/EV4JMXVWkh1S3fdRZCrnlPlTRZ16a14aNsXdZDxwWefE0Xp2/i+j
 I8I9yNwSp696MaDC4TjhRJzfP08lzdEYiByq63mRxRM6LmQ2/4dpovkrZkOH71TdzI9c
 OFE8vud+3hPk2DXiUW4WFGyysg9gj2TiPRvv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y4TBp5q5xBws0la/+DZ2ckUg4m79Non3qFa6SgDcWGg=;
 b=d7BT1cgAiHZ2k8ND1tvxRbWcgtvXHAd/XBDA6TKFJ2QZc32QrrpY9jIMu4Q9XclaWk
 p3kDqBq52CexP2ghbVuYFyjGsYE2+6zZSwTF8KXdwvu3eLLQjiDtgHzzFVP4bkAOUy/h
 7iHCrF7YzDHCFU4Gjam/QAm3fk7CGqLgdJxrJANROtjXRIhKGKRijtQYqNY738SzDG32
 lcGVDRVsMWEkddo3V6bxv4SjwEoxAlpeVYdY0kohLNbkCJ+kUtCc9WKOt/EbRntra4R0
 jqxb76nWSGAK4dXX6oQbbU/+bWJ1V3Xp/JIDz7FFw2umtlnhvpBe9AC532hUqOsI66Lp
 2QeQ==
X-Gm-Message-State: AOAM532d11bYcrNpJe57MR2KZxyT68OUKfsCCrGM1z7+IgfGiPMgDw3N
 seMXk8T/7FKo/p7STULQ59+H3A==
X-Google-Smtp-Source: ABdhPJwqMhVQ0Txr7qf6NuMmSKMEj9dyClnXj9xuJtJgQ8aqhJwQ6WKmInVyh+8BthBlx3DeNuntPQ==
X-Received: by 2002:a17:90a:e28c:: with SMTP id
 d12mr543887pjz.236.1610518062063; 
 Tue, 12 Jan 2021 22:07:42 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id y21sm1263556pfr.90.2021.01.12.22.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:07:41 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v10 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Wed, 13 Jan 2021 14:07:00 +0800
Message-Id: <20210113140546.v10.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113060703.3122661-1-drinkcat@chromium.org>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_010745_578295_E453BF29 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v6:
 - Rebased, actually tested with recent mesa driver.
 - No change

Changes in v5:
 - Rename "2d" power domain to "core2"

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)

Changes in v3:
 - No change

 .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..eac561582063 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - amlogic,meson-g12a-mali
+          - mediatek,mt8183-mali
           - realtek,rtd1619-mali
           - rockchip,px30-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
@@ -41,6 +42,8 @@ properties:
 
   mali-supply: true
 
+  sram-supply: true
+
   operating-points-v2: true
 
   power-domains:
@@ -87,6 +90,31 @@ allOf:
     then:
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8183-mali
+    then:
+      properties:
+        power-domains:
+          description:
+            List of phandle and PM domain specifier as documented in
+            Documentation/devicetree/bindings/power/power_domain.txt
+          minItems: 3
+          maxItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+      required:
+        - sram-supply
+        - power-domains
+        - power-domains-names
+    else:
+      properties:
+        sram-supply: false
 
 examples:
   - |
-- 
2.30.0.284.gd98b1dd5eaa7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
