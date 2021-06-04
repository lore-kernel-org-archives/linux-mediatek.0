Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1077C4708F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 05:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE37E6140F
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 05:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE37E6140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P9FI/qiRgMibrXRPOaxVMGE/pI5sAoNmFmQRlO5HVqE=; b=l3cMLGHFkHUcVR
	B6gd9ZgSybB2cmxpiQ0JngfmWfwqmbQsbN0wuruMpKeeBwbzZSIcH0oBTe1ofE38Z6Ir+jOPVU7+8
	KbQr+BpR5n1ecnebp4SCbFK5pTOKFxO7IcJ+r+1koACPfHvo+9GwgPz07DBEGBCWobsyk54PZRJK9
	V8UTK8swR5JvXO1Bp0KAg3p7f9HtF4/W6PwZaDk52I9vEJKVemadz4UXpD2zJ5C/9e3qfNKRLew80
	++0GaJHVdlCmaFwVf4VY4r9AACAf5MdQAMd/acrpeJhZrxRMUiP/3f00Wf5CeJ8s0ZFp5viTCdNvT
	2nh6BgzSfRe1N5aoxc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp2Kg-00BamK-IN; Fri, 04 Jun 2021 05:25:22 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp2Ke-00BaO3-Ms
 for linux-mediatek@lists.infradead.org; Fri, 04 Jun 2021 05:25:21 +0000
Received: by mail-pg1-x52f.google.com with SMTP id n12so6904672pgs.13
 for <linux-mediatek@lists.infradead.org>; Thu, 03 Jun 2021 22:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YYQmUG4DsHmPA+zkHmttsjSXSwGBtSrBYgBxvV1HNiU=;
 b=Cqp3oyvRrxe5qTI1SQ1IzQH9MxtDQebkaqbWUHmb6xHWteqVinS0BHTgXnkThAh366
 0M94lKOjiD2J2i13+bclIsPAMAPSvu7Cu9J2mKfGpYZJ6j2ls5szyRl4YkQ+UNF6CYRv
 npUchitfRWwT01KJFs4f+nRR/+kTifabwPtiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YYQmUG4DsHmPA+zkHmttsjSXSwGBtSrBYgBxvV1HNiU=;
 b=OGoLTHMW+7JEdJ6WbDOxRoz4e8gZzy/DvVAZvZQN7hlEYrxNvarnFYll6AasGlC9dt
 w5aDwQnsNxQthwPueR0IssYM7NDdWbfIdLS+kFx7aUmViKPFbVDOTZC3tiNJudb41Inl
 Z6M8MoZeiI/6rb6dBPDgBwma5SnKf9IC+/cEWwgTyNLuFnubLKmTz7Jvj1RbxLagZyy8
 7qt8naR+wT+F+tvuBUCsfavbgmHyqarbDGEyyvR+XO7pHfxB/ggVSqe/hRHGhzGIxP7T
 jGfb9O6kFGneGwhTAwWceFPQYbjH7wkdZpVZ5JCrCScUp+6jiQPdAbJwgRSBU4RX+LHL
 I7Qg==
X-Gm-Message-State: AOAM531wsYkdXkg7UJzNi9/T7PGPlqB3stdw3LkNsVKNny2rzlft38CM
 0iQAz4sCZGjEg1fufvDo0paHtA==
X-Google-Smtp-Source: ABdhPJwkoTfteLnQca40WwoFSueBfc2axxyDCZ89N6e70e3n6MyQF8YGypiCLMVVGQXt7c/KyxMxCw==
X-Received: by 2002:a65:550e:: with SMTP id f14mr3223846pgr.160.1622784198461; 
 Thu, 03 Jun 2021 22:23:18 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:886f:8bd0:e6e2:4e47])
 by smtp.gmail.com with ESMTPSA id c15sm754014pgt.68.2021.06.03.22.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 22:23:18 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 2/2] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-cerise
Date: Fri,  4 Jun 2021 13:23:12 +0800
Message-Id: <20210604052312.1040707-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
In-Reply-To: <20210604052312.1040707-1-hsinyi@chromium.org>
References: <20210604052312.1040707-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_222520_781588_AC3FCFD1 
X-CRM114-Status: UNSURE (   8.95  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Cerise is known as ASUS Chromebook CZ1.
Stern is known as ASUS Chromebook Flip CZ1.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 80a05f6fee85b..02c0653737648 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -126,6 +126,15 @@ properties:
         items:
           - const: google,burnet
           - const: mediatek,mt8183
+      - description: Google Cerise (ASUS Chromebook CZ1) / Stern (ASUS Chromebook Flip CZ1)
+        items:
+          - enum:
+              - google,cerise-sku0
+              - google,cerise-sku1
+              - google,cerise-rev3-sku0
+              - google,cerise-rev3-sku1
+          - const: google,cerise
+          - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
           - enum:
-- 
2.32.0.rc1.229.g3e70b5a671-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
