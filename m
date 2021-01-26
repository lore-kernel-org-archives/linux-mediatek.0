Return-Path: <SRS0=aDjs=G5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E792BC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:18:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4AA223104
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jan 2021 01:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4AA223104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+EUqCceh8QjiKJitO1CFeAS7nTlafHjhymkYzz8aHBg=; b=MyZNoeoc4/CrJKi/Gnzij4Sz0
	LPOf9x8G1uIOROC9fN/hg1T6e0LaCI+5IGrV5q5ZZ9Y3yONCDFc8nw55ie3sHq+G06aiKQkm+p7sr
	cH0QL3DI5R5BC05UY9e0uOeN5KfJdovinIBDr/Nlwl4FmCUTJ+HEimKJlGclY/nqJ4HYNo6fW+3e+
	HaCLJw8XRfpDS6qAhFrJgT5PsSYU+TBe2PKdtr3rxLf8bUPTkLPCoUa9BEdK/gwtjmB904hv5HsGz
	ptJ+hZhD/KqXB82Nay8EZfHLabqQplWO0aszSHgpJut/yjA3dTLccLzeNSI0eavj69d07GDOYrM3N
	GCzXTgd2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4D02-0007wK-2x; Tue, 26 Jan 2021 01:18:30 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4Czn-0007qY-QL
 for linux-mediatek@lists.infradead.org; Tue, 26 Jan 2021 01:18:20 +0000
Received: by mail-pj1-x102a.google.com with SMTP id g15so777541pjd.2
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Jan 2021 17:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BZifB+iVMGmxp83gSV8xBJi4ZuHE+jJzS5b46pYB0A=;
 b=buRZJlIfAEszu7DTDxrGpStS4yJ+JlArTcXt0x76ycaU2bjFQCHidprSrOBF3N1xve
 e2RNFHNjUFXkRgFexKzldGH0QtYp6XGsa/hwV2THVKhJrBrbOYGfciG0gbWd3kkjhV6l
 hJasfeZTmZ6+c6txPNSZExg1rsZfom+QZAd74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BZifB+iVMGmxp83gSV8xBJi4ZuHE+jJzS5b46pYB0A=;
 b=nE1jnbPAXDOjwZM0bXLgHqzvqgjFwlvMssA2krrSKe083VzN2CZXHFNlCrUdXqil+l
 qPm5RT27nckYmYW+qM6H2p6bOVvdZv5Q4xfgQxQ5YS4diDh66F1Iok3ue7uaT52RJ2W2
 +EtCkktvbyycp/acenMXzbzG5NLfm0yM9tBfFeLksVOQiI/RAstdk9U2lcO9a6jGF2K4
 aRcEkmkvFL3tefAZkxcFQ0ioQJ+9EQMqKWttEaIypra2pXQx0863qJEDa0pvEykqh5Cs
 DcmGQEFtAGumXpIeHEQpJXaTOGCZju9D6yz9/oU5GcDYruyA27S5UheCFXvswMTdGmRO
 lKSA==
X-Gm-Message-State: AOAM531jVcaiYXu76pB5oZDH9jXOeYzbUSWGWxiirpnwukbB/d27xIeZ
 s8O6Ubn+yIZ+5IrHXbr6lkjDOQ==
X-Google-Smtp-Source: ABdhPJzq03UOZA3rzW/Jku1UL/Q9+LLv9sYit5RxxJUopLFrSfRQH8oSRCQ/AdGoGrss8ksnQD4EKg==
X-Received: by 2002:a17:90a:77c1:: with SMTP id
 e1mr3157796pjs.141.1611623893652; 
 Mon, 25 Jan 2021 17:18:13 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:50cc:9282:4fdd:3979])
 by smtp.gmail.com with ESMTPSA id k9sm522248pji.8.2021.01.25.17.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 17:18:12 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Tue, 26 Jan 2021 09:17:56 +0800
Message-Id: <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210126011759.1605641-1-drinkcat@chromium.org>
References: <20210126011759.1605641-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_201815_942865_EC706D02 
X-CRM114-Status: GOOD (  11.42  )
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

Changes in v11:
 - binding: power-domain-names not power-domainS-names

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v9: None
Changes in v8: None
Changes in v7: None
Changes in v6:
 - Rebased, actually tested with recent mesa driver.

Changes in v5:
 - Rename "2d" power domain to "core2"

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)

Changes in v3: None
Changes in v2: None

 .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..3e758f88e2cd 100644
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
+        - power-domain-names
+    else:
+      properties:
+        sram-supply: false
 
 examples:
   - |
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
