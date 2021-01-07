Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486B3C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 08:27:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF35723133
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 08:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF35723133
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CBIvWvP1eCxLIFlgmpldWuLT5m9g3qU/3MNE5/CkbrQ=; b=H32r8ZjDO5SsW1I0mbyMsIL3E
	f02bcBHg4M0AvIBcExBEGzsS9g6HaVffRhFOXFxaqfpuqvsbnzjW0HhYGSkD1FtxY83vAr0dITeWv
	tLZL52LDwtLP5hvSaqtQefNAhpuofImZMDQIKRvu9U3MNwKDVM3b0E9s75N68DblnfkZrNgXp8Zxw
	FTEHkk4Uk/cpCq5hOfnBbmzH0vC5BU72BLcV6h2D70SwB41rJkh2hbbZglgJzTe7uJNmvVQ35RH5D
	awGlwMQ4lRt6w7jf5s2tjuUaWM1AkWPlDTXvICgui6BTUDHiS7+6CyraWdgvA30HumpiRDlzUaMsf
	9FAVM48TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxQde-0007Rl-Dd; Thu, 07 Jan 2021 08:27:22 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxQdR-0007LS-4z
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 08:27:11 +0000
Received: by mail-pf1-x42e.google.com with SMTP id m6so3418143pfm.6
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 00:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XpndNtEhPNiPnJlNZJY14B7qFPqqFru+Jd25xhO0eCA=;
 b=CCIqzTVbaqQ4xH2qjUNPXVmi3/8fMX6PZZ9aRDj7LN3QiX7o5wP18sPAnYp/cQqw2l
 zWArJJlt/c1XprpPe/fibef8DtWX+l0eiohRN0M/6SMOwm5PXqi72F4kELz93iIb9Usg
 cL97G4vq2WyRMDgPBlO++jamO95iUbcGNFPl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XpndNtEhPNiPnJlNZJY14B7qFPqqFru+Jd25xhO0eCA=;
 b=agGp05+xh51pNsgPihCJUl/qQhVHqQQUcQRSrgNC94WNY0PFbF3FpRIhvPR14hhWPx
 riiPYby8sBSo/Vc1jjaTiNUMB/qB6P8PovoAbIKLffITdgKzBceEbwR20jM/ZcVJ9KWy
 4jAjwXTZuiDRRPyIaFCPuZSvv1nWuPbSdyhQb4bIaYRosBDobCrGYg3McbwAjS7w9yBn
 pRu+XYF4pD0/jb6Ct9gINV9NloWpE6F5f1UXydCN2hgOsYiwNI3Mvg3U9+id5QGEr/ev
 gRkCNiZTJazIfDEJDjze6khb2HID4lJpLxe4GZHBUowL2dFBxCGR2tLt+lWdLTEua9LT
 L7xg==
X-Gm-Message-State: AOAM530UpUiONOANi0r4UkbCr7V3oIrZD97WbmYhmSlOPulFTmN+Zcrj
 2Q8XOep5VzTY0Bm+aD40f9NUzw==
X-Google-Smtp-Source: ABdhPJyDRvZwDRdfn6gwo/sWqjBrwSNaAvcRYBsmcZtej2I+KzJ+rQjSlJkbD6E2xtI6RP8hdgHDDA==
X-Received: by 2002:a63:2fc5:: with SMTP id v188mr748878pgv.243.1610008027155; 
 Thu, 07 Jan 2021 00:27:07 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id o14sm5825580pgr.44.2021.01.07.00.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 00:27:06 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v7 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Thu,  7 Jan 2021 16:26:50 +0800
Message-Id: <20210107162632.v7.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107082653.3519337-1-drinkcat@chromium.org>
References: <20210107082653.3519337-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_032709_438967_C05969AB 
X-CRM114-Status: GOOD (  11.27  )
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

Changes in v7:
 - Fix GPU ID in commit message

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
