Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659B0CDB474
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 23:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIH+YvGCzBPNtKNlT8wLBn/0tQkDSpCAQdxybdH6cwo=; b=exIvat8f21v1dxC4BG2Izh7tWL
	pNMbGFVFnkQ3fjlx0TUsPR9EcqgGDI0rmdeI56Sq8sy1gfcnGSnvDcDpRjoHWsSkZ2yjSvwQHCltP
	tqW9+0phjUwz+VvPtPbaQAR547tNdKjZ/1TdZhgV9O28m/eEkVY0YIZVlaPeLRDFFJsEWPhVFxxCR
	5JHEvgZudNTzypgkOR2Ombog201dsKEGqBxhl7+SdSSQLAAgBkhUm380MWaZjDAAWpQ3QgPAs+xep
	GTfR7bEyDxOkiVVJWzHgzAHRSb7BTDtD2JwxqiWCsGwfofIuNMPBaw3uoHxw6+AKb5ADmY7aazkqw
	E6/y994Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4i2-00230C-0R;
	Thu, 12 Oct 2023 23:03:14 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hp-0022nv-01
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 23:03:04 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c9d922c039so12692545ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 16:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697151780; x=1697756580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIH+YvGCzBPNtKNlT8wLBn/0tQkDSpCAQdxybdH6cwo=;
        b=JswYDD4/eiJxo0JXy5PnLZf/lTy+RYQPEHn9G6uJKSgiMVd4UbMOiHCMitxtAMZJ1N
         lONHwfODSFIi2JyTXn3qcBMNkKN99s821pAZOzBf8dZVe1gIW4DGgdZREMEHebdUAEwd
         iWuW7syABgLHgzZ2wQyQeSDGf8fcGQDxX+d8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151780; x=1697756580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIH+YvGCzBPNtKNlT8wLBn/0tQkDSpCAQdxybdH6cwo=;
        b=I6gkfhPosiLc+wSG73q2LzHCQ82LuoVMFOUcqBENDMGfmCn+X7bKZhzVK/otlLmB4j
         PFT6GZNt0n6h9QCRLk1334PxM1lAqc5TcXGwr3E0B6k26LAysphXqE/tTqCJGVZxdf4N
         MPbGmav3Cj0nkdJ4lVELnQo57krOfLXEnWJalpq1zR+UQ/HHB8YKN4taKZg7La1uaMV3
         6HcyOfkn9qPhJXI6Fraub1b5xVJU7rqJVhmNb4RDOj7PB+mhcoyThH+NTaVyVFq1IZYM
         fA7x9i80GhyZwPolFpTKjG+Rf4iWVcWp73kJivSf3RuZvi/6tQ7pcBCsN9xiN8g2rRyi
         OVgg==
X-Gm-Message-State: AOJu0Yxiel7Q28wXANnAoaZh14Vh3z8eFMuSR/4e6zTO1rIAzpGaAeu4
	cVKXArfuA3cfmSoZkUzdp8OL4w==
X-Google-Smtp-Source: AGHT+IFBHMMkJoSakpp1N70bOiH3PMSzDjXVxC2bq1hCrP6zNIw/kZcHm0z6MEySLozadGI5ljy7GA==
X-Received: by 2002:a17:902:f2d3:b0:1c9:ec98:217 with SMTP id h19-20020a170902f2d300b001c9ec980217mr1142980plc.41.1697151780553;
        Thu, 12 Oct 2023 16:03:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001c613091aeasm2494390plt.297.2023.10.12.16.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:03:00 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] dt-bindings: arm: mediatek: Add MT8186 Magneton Chromebooks
Date: Fri, 13 Oct 2023 07:02:31 +0800
Message-ID: <20231012230237.2676469-6-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231012230237.2676469-1-wenst@chromium.org>
References: <20231012230237.2676469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_160301_051986_859043D2 
X-CRM114-Status: GOOD (  11.16  )
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

Add entries for the MT8186 based Chromebooks, also collectively known
as the Lenovo IdeaPad Slim 3 Chromebook (14M868). It is also based on
the "Steelix" design. Being a laptop instead of a convertible device,
there is no touchscreen or stylus, which is similar to Rusty. However
Magneton does not have ports on the right side of the device.

Three variants are listed separately. These use different touchscreen
controllers, or lack a touchscreen altogether.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/arm/mediatek.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 5e5834d9865f..a4541855a838 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,24 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393216
+          - const: google,steelix-sku393219
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393217
+          - const: google,steelix-sku393220
+          - const: google,steelix
+          - const: mediatek,mt8186
+      - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (14M868))
+        items:
+          - const: google,steelix-sku393218
+          - const: google,steelix-sku393221
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196608
-- 
2.42.0.655.g421f12c284-goog


