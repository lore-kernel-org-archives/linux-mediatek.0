Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C252AE7718D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2024 08:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DKiAgKyzVZ+yVhg6dILJiG6y+QvMidinDetzCMJeF3Y=; b=RQxxIKkxRddRdQJVAICgI6UiLF
	F37mNDCeZOgf2VqRahFc6HhF0r9q3hItuy2zTbU3mIPKi4NaPDL0iXYSY8xSuKKYpRvz0XPH/Yqw6
	xaBmManbDrf6F5NzcMV7S6KifbDQvNfV49OMOAtCbygIMzOnZe8D7CMkOedKgEMWqZiaV65JCWVns
	P19wBk1i/60d8GENKUGJpSqeiQs64W8y3HD4Pdjh8V5i4RP4sRHtaV5GFXfF5ptKkiC7XDxTt4Ez4
	e1MOebofB8UvwUMpQRDevifZZDuPEGJpOkbvhJuOVa839uS10M6pl2CIzkfenyf2TDK74/al05eM9
	60q61Oag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0au-0000000BWqT-3nUT;
	Tue, 24 Dec 2024 08:48:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ0as-0000000BWpS-2EHV
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Dec 2024 08:48:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21636268e43so61238855ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Dec 2024 00:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735030126; x=1735634926; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DKiAgKyzVZ+yVhg6dILJiG6y+QvMidinDetzCMJeF3Y=;
        b=oAXaprXx2ArlsBqzUsGO83yD/YNZAXO7guvpQdvy2TiCuJmsa6t9R8LML8y6jFLJWw
         eXYCtDcRhhNuo7rQq8f22AF3g9dIF+3Q9ilq7egVBVS+6u1Ne3wzobXGZ8c/XRogB1s3
         ze7zod68ndeEX4hspq5e0E74HZ1WJq1JiEAM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030126; x=1735634926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKiAgKyzVZ+yVhg6dILJiG6y+QvMidinDetzCMJeF3Y=;
        b=RtsLYrfSZFEHveClyL/DHryqM4Z3e8OeJ0maKQJpopkY5UnawQ3+E8yJKRLQtif2T5
         mptsNIkmMNEYJdTwd/Ez6C5h8IWCkUFwBJo9qMdke2v8wyucX9mKkMlYzBGsc/GLMj8E
         IBJ59qQZJfoFBjbRkjvYX/mvckI3jBTWQAtCFwWprx9V998dA8uw2uvVSQ56WTc1UBRy
         eqDs62a3GMc3kfZDuqiMfS3q5pD6rRGGCeSc/XtCuYh2i+5AHEQHfEMnzrrGYjEu7GuG
         4piYniyfybJ4f9hI13s39HcjWpg/yNME+wf69RsGHvZw45TLS4KBLdBAaRWxlvot0FDu
         ddyg==
X-Forwarded-Encrypted: i=1; AJvYcCVCQPWIsSCh4IxIhFqt3VPGTcqlmearvhIoNv8BmuBkti7hRkwQ+BR/xJOKwodu82EozA7Gp20tMpuSVZ/yhg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxM3sRDEJcQtmX0E+i8/LERuFj0cJ6n7H1AA4wSAaMVW37r9CFP
	pugKYQoR0s2pLcrQSw0NyGPZ5VHe/1dhkKVo9KYV8Deehcgsn96dRRT5jmqUdg==
X-Gm-Gg: ASbGncttMIO0Dv0QsxpEcDlyMJNGPi0YPQZTzY7hWSuzaAhmQE7P/mjdFVs3S3IARIy
	p/YndigfJgzu60Swjw8jXion79+EYaOatGZyshX6lDcwUHEXcshS00xa1lpTxx15RsY2W+MXicA
	SdGOjdCOCdfCwmirspFXMDAhJdhH0NEaUMtmC5ZnDbwf7L3SRhHW9qWwG2JJA14KKm3IzCn6iRu
	Rz2fjaQAWU2v+BAAg3v8Iqbw93TKbXzZKqKiP4q5OOjsMAzr3+2o30G+8uAzRut+0zxW2PR5qA=
X-Google-Smtp-Source: AGHT+IF6Wy9RxfKZv9MvppV9tdwcrpmy7JICFA5L0xxCj2pW2nZrKIeaOlDyLP7l6hYjccjkEykagA==
X-Received: by 2002:a05:6a20:8427:b0:1e0:ca95:3cb2 with SMTP id adf61e73a8af0-1e5e0458eb9mr28926443637.8.1735030125707;
        Tue, 24 Dec 2024 00:48:45 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:a4dc:753e:e6ca:9a68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbaa6sm9203156b3a.91.2024.12.24.00.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 00:48:45 -0800 (PST)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: mediatek: Drop MT8192 Chromebook variants that never shipped
Date: Tue, 24 Dec 2024 16:48:37 +0800
Message-ID: <20241224084839.2904335-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_004846_600178_DBFFD74A 
X-CRM114-Status: UNSURE (   6.87  )
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
Changes since v1:
- none

 Documentation/devicetree/bindings/arm/mediatek.yaml | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index da6af39caa9b..3ce34d68c213 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -370,12 +370,6 @@ properties:
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
@@ -384,11 +378,6 @@ properties:
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


