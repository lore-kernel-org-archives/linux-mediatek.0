Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88474C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:11:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C1FE236FB
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C1FE236FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KVfUGr5yC3vLkfKCoZYd8POnXCsLllqqwQsk0LNEM0k=; b=qX3kWcwIHaw6gSH3cETNuf6J+
	/vGWBpJOnnu47c7qW5jYUTRJfaoI7S+LV4AZNrS9kM8YB7n6RP7cr6wXf3xCu4uW0IOFwvhlywNsg
	1InGsaHYtnsewh7vWXa4jXo7vj+CriaMKA687M9XuKceknzZFYacVseEGKpu9uT7zIjQLLxkY/LiV
	wImzWQu02zIxc+RCrFumvRzCFCMk7OzJ6DM/GYnBZJRMZXZWgDU6pMYYglBh/uyrLqMJtVcdSsxhX
	tuXmMQQLRcozLZKoqo8wJ90sAnJYDneh9+kjOsLHKbxeY3JMjsZ7L9VUzGkqZhk3YXZX91GfTU+zF
	F32RK7Vwg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxgIc-0007Pu-Gz; Fri, 08 Jan 2021 01:10:42 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxgIJ-0007GZ-F5
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 01:10:27 +0000
Received: by mail-pj1-x1029.google.com with SMTP id iq13so2755937pjb.3
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 17:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=LRt6wt6zwQgeeZf8xg4HcyENMcrZzQVkz9tGJoA6djOlZ1N3MP4kaflXq2plSxgFmc
 OlhEnQnmrC8TvP7M9bX4FqBN3JKXxILyCyrcCFl9eeA6qrVHyURp7SrTKiUiffsJq/QG
 R0gPecLoLZ4tk+CgPSbefZeAEnWiaCcVyEEQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=UiUcDOFEcGWQ1498aZBiByDO7m5wXrxGpnzPmIC+3Ww/AM3IMfWirU39vhQzZMizXs
 HtV+b7KKYfsGmPrVnl5T+8F6cNnGJkh8762XjzUUG/WVoe6+JtgU3HSZR4xresId2NBz
 28eDpE4sWPsq6HvONwC+5aXGSSJBuL4H79+uvKMitEUGv0rlmrSo2U6ZjZJv7Xi8iw9C
 wHXOxxOPwDs3a5Q/OsYlvVNVSpFicuy57DVv9o0qtRw2BDw/+4Vgwu734N2+jZccwnp0
 25OSh4j95+hlT4ZaOMm+5TKzGjvyewua3tl9ApyVM7exeVyqIZqB3OI36WNzcF03iYAJ
 hU2Q==
X-Gm-Message-State: AOAM530pHbVPIU427upFcUoyGYod0DcTOnZU/71ete3DdHLB85ZVMmh0
 j/rVO33tcQThH56FKPacsec1nA==
X-Google-Smtp-Source: ABdhPJwdO6ZcHG1U4ALrAyJ4b4UCm4nWNkd1/YwfnuNlNEfcdJ5LV471yb4CJzOXi1o8bg+Vgh3XJw==
X-Received: by 2002:a17:90a:7e18:: with SMTP id
 i24mr1163773pjl.72.1610068221365; 
 Thu, 07 Jan 2021 17:10:21 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id s1sm6400083pfb.103.2021.01.07.17.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:10:20 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v9 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Fri,  8 Jan 2021 09:10:08 +0800
Message-Id: <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210108011011.4061575-1-drinkcat@chromium.org>
References: <20210108011011.4061575-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_201023_597247_36183B2C 
X-CRM114-Status: GOOD (  10.91  )
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
Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
---

(no changes since v6)

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
