Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EC0C3DA7F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jul 2024 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mTCTozL1kMNiDQohIkyeCe1qQLXGcgts2Oa5sMWeIQ=; b=fWijueBZYe4L7IwUpPKEEtxjQE
	LAvvI2o0cYsAe03Prp8rX0FkTUSMfIUgNl94K1hM55JfVj9mfZBweyRCCenJD3Blif5nlOyXQ3Mee
	aWSB7j807W4zzgFueY7GTFS/IgBg80tQAm8qUPca+lnOOeeqWAQqSZc8tWf291P2vznIiVnX8vSyb
	5Md1jVqva8raxwbqcvxZC03DdKz1jfy4SQ3Tf7SZoaf+6t8p5NFqgpKufpuK41FBH5C7ZEgE6jiGo
	D2vlE9fa7ZMElb+Lhr5C/Ta6758qxlc5neFf0pewJUrfhjyZFkC2jwVFMTSL99O5eY9+ODAq61Pjf
	UEPuHk9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2oI-0000000HXXU-1tu4;
	Wed, 31 Jul 2024 06:27:42 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ2nO-0000000HX68-03KS
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jul 2024 06:26:47 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-70d1cbbeeaeso3904323b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 23:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722407205; x=1723012005; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6mTCTozL1kMNiDQohIkyeCe1qQLXGcgts2Oa5sMWeIQ=;
        b=X65XbaPrZOTB+aG7d37gzjC3PHuI5e72OPP+rKrwJEfTCPTQ6A9o4ospLqEOBXJc/j
         J4rT/jrW+y19F/22ADeSoMD9FxIiESwq2Q0VmduulypFjUwXIb+BSgWk3JvGiEYG9VT8
         2Ak3ordZIM/Bz1n3f6V3asWehRqfp9QikxT9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722407205; x=1723012005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mTCTozL1kMNiDQohIkyeCe1qQLXGcgts2Oa5sMWeIQ=;
        b=khIo4eYqOLqokez/aLWx6p8afAx84j4VOUNT2OWWnWogHfDg6Jk5QcIxCGwMQeX+SX
         xvzXG3/MotDHkunYwZgQ4QDWbMNfEvKZKHY8JKRYxBuGgVo1dy5iocYCiymEXiS+Mdvp
         7nIJHEm2dKXbntVUJ3QW6oSGo5tzd8N4qKAAzyruiW2CaHcJ0+BFWSRZICe0Xg9hWLVG
         oECY9CjHdJrV5NzEHtCGy9gOFgiiT/M8pzNPj6mlqJZBoHPnOuSPyHqVR+ArMgcq0kkE
         n48zLHCUDnKHLSnlwmZo6Rp5/BDYy+vs3H+EQI6TD2a0q21RATYfTtWwHaZ8CFcvCepV
         jDYA==
X-Forwarded-Encrypted: i=1; AJvYcCWWcOduB82LuX0OpW7bQnYLofRGOx8rzJq1n7lHlxGDSNgpt4cwzwbuwqTEevxScllqygas+WemDH3JtT9wECvOLKzN4Sm+KR/S1lsjVqD6MB1E
X-Gm-Message-State: AOJu0YyJlV58C5EwPdzwDzB4XPuufX0z2wplcZgro1EMoNv9CcWKUWf1
	mJ8PWEOLFZwtSdnIZAELmFNT3TAX6AyVI+MNeGqIsLpcZEVr5zoSDwvfUFFmtA==
X-Google-Smtp-Source: AGHT+IFmp3+Q0xJ6154cwrPQLay9JBsUxdGaxHPITgVws1imP/cPhOraXxHtZKMmmYBhj+WRwQV++g==
X-Received: by 2002:a05:6a00:391e:b0:70d:3420:931e with SMTP id d2e1a72fcca58-70ecea2eea9mr11327502b3a.15.1722407205065;
        Tue, 30 Jul 2024 23:26:45 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (46.165.189.35.bc.googleusercontent.com. [35.189.165.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e1084sm9322308b3a.25.2024.07.30.23.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 23:26:44 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 31 Jul 2024 06:26:36 +0000
Subject: [PATCH v2 2/2] dt-bindings: arm64: mediatek: Add
 kukui-jacuzzi-cerise board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-jacuzzi_dt-v2-2-4995335daa30@chromium.org>
References: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
In-Reply-To: <20240731-jacuzzi_dt-v2-0-4995335daa30@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_232646_091386_82F54B24 
X-CRM114-Status: UNSURE (   9.37  )
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

Cerise is known as ASUS Chromebook CZ1.
Stern is known as ASUS Chromebook Flip CZ1.

They are almost identical. The only difference is that Cerise is a
clamshell device without touchscreen and Stern is a convertible device.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..087773a43673 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -146,6 +146,20 @@ properties:
         items:
           - const: google,burnet
           - const: mediatek,mt8183
+      - description: Google Cerise (ASUS Chromebook CZ1)
+        items:
+          - enum:
+              - google,cerise-sku0
+              - google,cerise-rev3-sku0
+          - const: google,cerise
+          - const: mediatek,mt8183
+      - description: Google Stern (ASUS Chromebook Flip CZ1)
+        items:
+          - enum:
+              - google,cerise-sku1
+              - google,cerise-rev3-sku1
+          - const: google,cerise
+          - const: mediatek,mt8183
       - description: Google Cozmo (Acer Chromebook 314)
         items:
           - const: google,cozmo

-- 
2.46.0.rc1.232.g9752f9e123-goog


