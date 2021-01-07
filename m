Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290AEC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:01:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CE32313B
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 09:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90CE32313B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KVfUGr5yC3vLkfKCoZYd8POnXCsLllqqwQsk0LNEM0k=; b=K/ud4xc2mdNdGv2iG08dJkA/a
	0qfreBM+zF8/BeAlRmYbDaydgIU/fgFMB5I39iXcm5ODKdDL8Uq0GHa7dsDt2toxJnFOx6I/svEF7
	pd3aTqjKAjHabfLCO0ofqG2g4eJRw6h/3JXnyVB93QGHOKQIHmGoT5ilmIGHM132QgAxWeFPE3NRy
	e7BnZ/4xwPdldedgtHnr2f8nkJpqpGZw9hx83/ABuSCWlZbyVeYhHDXTvQNw42LiffMIbX0n0ndeq
	vC+K4TQ+2G8fIoGQVhM3hzO2K38ES2Pi+10amZluSNECg+f3rr7VKKQFiBxRq5DJduIkHvXm77QuD
	mEAgL7GfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxRA2-0003MY-MJ; Thu, 07 Jan 2021 09:00:50 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxR9m-0003F9-LZ
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 09:00:38 +0000
Received: by mail-pf1-x434.google.com with SMTP id s21so3440363pfu.13
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 01:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=ceuRr2vCLfwVkTOq/VcGBU7S8g5DI6OExSxZXsevbMkMlUFTTtEoeSBdVJiKtsvpm9
 XXPR8oHJ/8FQKMWzYReFMSnjifWFx645G8tahx+ROxzworGzNcS5/oXqxCY8UDFGpHIS
 hHwliIjmTsby+Z8mXe3qcenaPnCKy3dd3McuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uW2DZ7++hBKvfAfIb4cUFZ4hOVC2XsuncgcT5bF8JnM=;
 b=CW3jKHh11/p2bLDMqXygzQzsEzK21fRRhKSj2VydXhtZfQXhnJerNIIe2t3xY+CC3+
 eV3aGFpnWPl+VrZ7FBZJX1qhPmjTxPmpImKd1nAKPdhmvXjpeG9tfPcWV3KFi6YywzGe
 PlsOu/8TBPPmXd3G1h49WgVU0NkvE5hwGt7j4IVZR4tZXu8cWJ2OtLi1ik4z7RtZF5CK
 CoGEse3snOJAlziHD+bKpI3XONXzIPmH8bf7TgaKXqQuv4I6oeSFm5TQ1cXC5sLJaqg8
 Ps+qEvmNVD56lHH69VXfOMqjcpgePS15H2aBlA9z0UPcoh8+vuF8fbqGe5kqELHUD3OX
 erKQ==
X-Gm-Message-State: AOAM530s/+Go7cxPb+e6yDQh72ismjMFCxd6ecqnoqrtVIxIcvp76/vY
 csALz4P3LLipInsCmb/9qyZstw==
X-Google-Smtp-Source: ABdhPJzNJimZ3cRtHZh+r/SU68IFYZuuwWPhKHKnlEFoewT1OQ4PW/o2cLbm4VXer0U6Lblk0QToRQ==
X-Received: by 2002:aa7:8d12:0:b029:1ae:4344:3b4f with SMTP id
 j18-20020aa78d120000b02901ae43443b4fmr7649594pfe.16.1610010032321; 
 Thu, 07 Jan 2021 01:00:32 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id a29sm5022421pfr.73.2021.01.07.01.00.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 01:00:31 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v8 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Thu,  7 Jan 2021 17:00:19 +0800
Message-Id: <20210107170017.v8.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107090022.3536550-1-drinkcat@chromium.org>
References: <20210107090022.3536550-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_040034_816228_01431039 
X-CRM114-Status: GOOD (  11.05  )
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
