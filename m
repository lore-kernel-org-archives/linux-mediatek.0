Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCC4C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:12:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 742682255F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 742682255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/gS69u5dHjy9ABMet6oYslP5RGBE3T0rKIFyRNleN78=; b=BguBiXP6YCSEiUvlKUmIeIiVP
	9vEkw8VRa0EgarKHMwrj5MNIxvn4lKVY8BbfbKOZQN/FSRz3lisUDOnVN4AQUeOrhq3Hnmq/icdjF
	h12xEdmoAvapoQHhruVJEFyeS1dD379q9HNf5lRVS6hzpuG3Vp3aJhyvhwjRORigsCupEFTxsYdwq
	SSvO8Eb0U4tVIEjWTHjLbTyo598SqY2Krtl+mZdQtarVmNODlNv9ES/8lbywH0mp4z2xOFmXm93fz
	/lDAvq7LJ+VxuhXelEytpi1lA81kdRj+yG3l12gwZcFtzeMvbMgoXkgp9h5S3J8dRq901Wfg2ATjS
	O7h7gBYNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwZwx-0004v6-HG; Tue, 05 Jan 2021 00:11:47 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwZwr-0004s1-Vn
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 00:11:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id j13so624123pjz.3
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 16:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iIOxwRKuhHymsIpzTy5z9PcoEZ/PEx0lJ3uU4FYFr3k=;
 b=dXNP2gmNI5tB6JUO6iNPcR87fSW6UqEnHqLX3343UNHXotTDXpx/PEMG3bg0a64UkF
 hh5dEBf6XSCut6hfeQDKHDIAGK2wnpcRG1Zo7MOaVsVL8iOn8AE/n85ANWlhD65ZOSXn
 cGL5NFbebs19QVAX4/SwESvl7Vai5UrnI8H/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIOxwRKuhHymsIpzTy5z9PcoEZ/PEx0lJ3uU4FYFr3k=;
 b=G7tEtFcCX0xZFL3okkSr4aNiBKQaMlCx8Yd4DgORktdS5vKdT3la0m8pH2EffffCj8
 D0tToZymTASgRbKR4jnRtPxV9Je/7WXDGQqLsRuOGbta9KCgRhHNMzD3U9FUuE5KBm5O
 wSGqmDFVpo/7PQ45NXCaAvc1YY+6Y4STcgikyADUWYsTRYUZSEVXPeaFyeEI+qQHXGwW
 QybpeVBaN3pVMZ+/XaJPmCYpATk+PaFw9XL4sDO+G9vwMPhH85xzGwx7QgZ8p2tQXffV
 rvXA3T+f412YP8QBbrxvpkmhyEZSYuQBEFUVX1enjraNrKrFv/KyM0vILwiWGxXiiS91
 kXiw==
X-Gm-Message-State: AOAM530NOOoNAFV7rQDsx2F/nUF+nxGZ/BK3wOPISmLprCtIRJvThD11
 9CKEmG8I6GPSf/B4gKD6y36p4Q==
X-Google-Smtp-Source: ABdhPJyBJjIRXHDrXV1bkJfJwg71OPsxDv4EXm0yAXVTlTDPkFU2JGpPkmkhU3UlP5FXMeagOcnQug==
X-Received: by 2002:a17:90a:ae02:: with SMTP id
 t2mr1311186pjq.169.1609805499885; 
 Mon, 04 Jan 2021 16:11:39 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id bf3sm465620pjb.45.2021.01.04.16.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:11:39 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v6 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Tue,  5 Jan 2021 08:11:16 +0800
Message-Id: <20210105081111.v6.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210105001119.2129559-1-drinkcat@chromium.org>
References: <20210105001119.2129559-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_191142_037394_C164A521 
X-CRM114-Status: GOOD (  11.20  )
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
 fshao@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 boris.brezillon@collabora.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

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

 .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 184492162e7e..71b613ee5bd7 100644
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
@@ -87,6 +88,30 @@ allOf:
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
+        sram-supply: true
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
+
+      required:
+        - sram-supply
+        - power-domains
+        - power-domains-names
 
 examples:
   - |
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
