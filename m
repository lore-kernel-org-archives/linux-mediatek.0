Return-Path: <SRS0=HKXf=25=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09342C33C9E
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 05:24:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6EB20720
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2020 05:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OyfUS0ie";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ncdGwmPr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D6EB20720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oQXeP2+fjVZX2p8w3ZOllSA6pMHpZj6oXh/7ymDjLSA=; b=OyfUS0ieb51M+D
	Ya4tA4kGp9HdmZV4c0a2uaz6DYg1LBr0/aHQAzfgid720LK6z3T80HCJvWSMMgLqokwpj58deZmq1
	c9b80v4qTCLN1kxfqWEGTVJji/Lo3kLDxzABEBcE4lM9cJ7QU9YVGX4yxeVmJmvSM5rMWN/44MuOK
	5QkaliVW2/ZbuQ/tPK2zIK/v4WlnEs8VtmrKNXl9aPsureFybTfLWjC3OeU1BO9zmW3e0+Zo3SjSt
	yJwPeZyjPl7oGN8MdkdBbU/kyGlrRMeraBV3TQME3GaRtH15o5mooIrfXS/ZYrpTRaz7meDot/nqN
	nEL/NsONhyjMVrdyAPSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ip3pC-0004tP-33; Wed, 08 Jan 2020 05:24:10 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ip3p0-0004fa-Ph
 for linux-mediatek@lists.infradead.org; Wed, 08 Jan 2020 05:24:00 +0000
Received: by mail-pl1-x642.google.com with SMTP id f20so633961plj.5
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2020 21:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DM0aqT7mORcDNurEQApqfEBtkQorM/LzpTMTVlrl9aM=;
 b=ncdGwmPrHI55/SBDBh0DPZoQrK3Lo1SJ9dJj2j29oKPgH8ThCHSPN8yJdVWZ+MwCoh
 AQH8qdCIHUUUgK3eD0s2gZ7Scd8kIBUxEuPYi/tYu6vCjPnwJEUy+Ic4IhNL/dhbVFoJ
 n9tJAzlRy9Zb0V7jWB54FlbdHEoNXslhoaz2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DM0aqT7mORcDNurEQApqfEBtkQorM/LzpTMTVlrl9aM=;
 b=HCr89p2n8HJJIwB2sWGnabYx7WzLgoUFDOtQuIjn2rslD8B+uFjk3PrmMzMyIhi/Fy
 LZJWxk5zYe9kf2aotqRE0P+2kSn7XYlZtwryGf2/QgSjLt2h+Hk/l5b7LP7qbUv/6tWT
 RICnFqTt915teceCZdEpDDPUS+650RA0aJ2B9eHU45rBhy4sS5KCOWDey1pr97/DdxL4
 Kv30ZsWiMzUefSBH79vLeFlrqrnGz+JEnIryYQhgeEh9xItAj7q6t/9CDudb6Z+WjQW7
 tZT9FStq0+wPu68OhkEQ8zck1GUvo3MTCAXGP3hI3LEAaDQc2T0f1Afa6x0SfSj/9Cid
 bm8g==
X-Gm-Message-State: APjAAAWION7S6thrFekY4OtCndTudWlsHINjxJrrghg++lSFevL6H/ZQ
 v8Br9PQId3HFkJNZN/M+oSc093Hwq2c=
X-Google-Smtp-Source: APXvYqx6Kh3IRlEF2mYf7QKx3EM0H7n0giv6QuZmqNIaB7ToM5za17Tr8aM8sd8jKkiVpN89SHLohQ==
X-Received: by 2002:a17:902:6bca:: with SMTP id
 m10mr3635095plt.212.1578461038146; 
 Tue, 07 Jan 2020 21:23:58 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id n24sm387505pff.12.2020.01.07.21.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 21:23:57 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
Date: Wed,  8 Jan 2020 13:23:31 +0800
Message-Id: <20200108052337.65916-2-drinkcat@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
In-Reply-To: <20200108052337.65916-1-drinkcat@chromium.org>
References: <20200108052337.65916-1-drinkcat@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_212358_833454_B0439C7A 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Define a compatible string for the Mali Bifrost GPU found in
Mediatek's MT8183 SoCs.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---
 .../bindings/gpu/arm,mali-bifrost.yaml         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 4ea6a8789699709..9e095608d2d98f0 100644
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
@@ -62,6 +63,23 @@ allOf:
           minItems: 2
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
+      required:
+        - sram-supply
+        - power-domains
 
 examples:
   - |
-- 
2.24.1.735.g03f4e72817-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
