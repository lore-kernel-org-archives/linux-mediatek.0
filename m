Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65937C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:31:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A105E6140F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A105E6140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1O3kuQS661PrIk0PpYa2jesomz19JyKnFmEVxRFHHh4=; b=UubcdatfEawzUy8VwTcBgdgRy
	GEhmq/uuLvAcFvpSLr9FrWTtPN97lpQ1JR+AHT7HiXvdZpR5iCxpLah05Ww1ePuTOmW6aQ0ldx/1P
	GBVXmXBdks4LsBtEbzuUKZVyk7dEblot6BG5kA8ziLCtKx+1wIJQH7wusir+XlXstTs0ZFZPQlXMg
	a1AtMzhBucSKufRltLSmLZ6WbpyLtksey0S6zH1wyiOmWDiTy8Mk6GmIs18y/bXBz+EYYMAqOsyIC
	29PNemBFHk/PeqFuxaFOUm6Tjj+LgUtexOjyEqxQTYVPvxKjnN2ZwmoFs6EFi5B+aazTv6BthV4d4
	/TFMVYDsw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ5Sh-00DiDo-RL; Wed, 21 Apr 2021 05:31:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5QE-00Di51-Mt
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 05:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kxnhLi78DPDSYFjxJIM+qzcCyplsSYCFm1pDPKchpRM=; b=CJt67AWZRok1cxCbs1Q10RCTXg
 TPdeG5giRkoaP9rtmrF5+4OOTVq3C5BBtT7PNDTHP/+iBvY/WSDECPI7StzRbpbeeo7NynngN1KXp
 SDqt/Q8ID4t/dHfErdO4d3Ys0mLTMtnqcygqZoAiE/eZ34MYBQZGVKj5cTviJJpz1ypZYisjbSIL4
 voyDVUcExvO8ELcby3U8Yp/mZMBAf7R6ABGpPrZm1uWc6us6KbfOXjRSXQLtonYZpo4j9/XlVZo2L
 ydG0MIRcd0HGpLbp+z5hA1FtbiHm0f7S/xDKQJWs61YZNh5F73oR6avyaIy9lv8ba1FAhI5NJoPHN
 0JTTx7eQ==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5Q9-00CbxU-Pp
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 05:29:09 +0000
Received: by mail-pg1-x52c.google.com with SMTP id p12so28675406pgj.10
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 22:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kxnhLi78DPDSYFjxJIM+qzcCyplsSYCFm1pDPKchpRM=;
 b=hmTmxKk7RkXuD+YrXgXMT7YbIC9neJ63/n1UtLtvvY3ocKbGWYT7FRURBUJSutrmJW
 qxVfRy5vX/W6NqaKXQNqwkiwlb7RR0HTYRciruFEEb8N2oQPOaTQsSbNON3gBZ2l/Bdi
 FZqMALQbvzzM42Np2JYnVdxQGwEWEkli7Uq6Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kxnhLi78DPDSYFjxJIM+qzcCyplsSYCFm1pDPKchpRM=;
 b=t5ZEiwF5qdnriaMHNoGLBdhuNZlsVoEUOrV9P+ngkq0SxBipAsKukdYomNzDVldiui
 RpKPa74AIkplr0hw3+yUUmbjbwtwASNt8IwBpklNdXUbvMRvhxBAY838loaT7I7L+26z
 n3jmvyAX+BlqoJcvRpT21oERmAdUmr5TfXN4sK60w/KDEJLjXf4p0Jf/CjZOq1pvTL+Y
 ZhVBzji8Ldycr36WvoMRk0ddXhIlv3gIB0Hhhdq2zYQ1+kIiCMJJtwqlN7UqsuXYExPg
 paNy5aEmydfR7oKu+erqnOV7lc1WumHrifp/PazPFeDbHxsun4o5C+q+M/XiOWf1PHfp
 P1NQ==
X-Gm-Message-State: AOAM532JdXuUeLsNF2c6lAcU3kwaX2v+vdQBDzSSoKLcqzo663fWIYec
 36yurNtxNsZMrk22XTXvLtW22g==
X-Google-Smtp-Source: ABdhPJyhb2uM0S9Pz4wG6iMzL3FZiBTC1btTNtARSLk++FAK0bWUnZI684adzhBP8AOcY3vu81YTNg==
X-Received: by 2002:a62:aa09:0:b029:25c:3c28:e2b with SMTP id
 e9-20020a62aa090000b029025c3c280e2bmr18791955pff.39.1618982945075; 
 Tue, 20 Apr 2021 22:29:05 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:b3e5:49c0:4843:2bbe])
 by smtp.gmail.com with ESMTPSA id b6sm602537pfa.185.2021.04.20.22.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 22:29:04 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: fshao@chromium.org, hsinyi@chromium.org, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, boris.brezillon@collabora.com,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v13 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Wed, 21 Apr 2021 13:28:52 +0800
Message-Id: <20210421132841.v13.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210421052855.1279713-1-drinkcat@chromium.org>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_222905_844925_B338558D 
X-CRM114-Status: GOOD (  11.22  )
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

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

(no changes since v12)

Changes in v12:
 - binding: Fix min/maxItems logic (Rob Herring)

Changes in v11:
 - binding: power-domain-names not power-domainS-names

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Changes in v5:
 - Rename "2d" power domain to "core2"

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)

 .../bindings/gpu/arm,mali-bifrost.yaml        | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..b22cd8f1b015 100644
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
@@ -41,10 +42,13 @@ properties:
 
   mali-supply: true
 
+  sram-supply: true
+
   operating-points-v2: true
 
   power-domains:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   resets:
     maxItems: 2
@@ -87,6 +91,30 @@ allOf:
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
+          minItems: 3
+        power-domain-names:
+          items:
+            - const: core0
+            - const: core1
+            - const: core2
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domain-names
+    else:
+      properties:
+        power-domains:
+          maxItems: 1
+        sram-supply: false
 
 examples:
   - |
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
