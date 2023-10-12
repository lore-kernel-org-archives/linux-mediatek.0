Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0837CDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 23:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yqkAgo/MWU32uTOpYWxBlk99kCXZj/R+2kdYHDmcPQ=; b=Tpps9zH7H2MKQkoTlyBC2Mchoe
	vIM801sCnZIUThFSpQw981IJaWoykfcsq7ayuHgwEhkB1dmkEJPxZos3wMTeqba0KNcykD1ZI2mdr
	r8TvnKSHIse2gH5hznzrv9gPzTjKhnlIm5iDKmEFbEtnD7AhyxiJT0ze0BQptXPEj0SJcLrF67oSF
	m8KMYl1MDKgHmNi9W/gX0nGeRMO0yK75zI4vrbGRTwsoGvqTPyPB49inwwbxbM7JwBPTM/AH7MvXD
	MwWFq9vxNpd9Tlg0GmMctxjHxW909oCQQ7YGENqKLjoYpnLrT+K3mcGLhEi2ucgPTLH8XrNqux5wy
	D/e+0AoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4ho-0022n5-1c;
	Thu, 12 Oct 2023 23:03:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hk-0022jc-2f
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 23:02:59 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c735473d1aso12091815ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 16:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697151774; x=1697756574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yqkAgo/MWU32uTOpYWxBlk99kCXZj/R+2kdYHDmcPQ=;
        b=NGaNPzBnP9w/5pIBvy0G42j53H7ieDhFLkg9fHaNcRsQLz/DJ1kAQqK/yo+8yN2VsU
         VTyTAHVupCalx/ri3ImRbGmkR7FVWyDhmV+BMuK3uYc0cXzJeLm1nV0OtPY2lzb1azXs
         686T49uHv0grJR/kBHDKKU12vj0crm3TRw1qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151774; x=1697756574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yqkAgo/MWU32uTOpYWxBlk99kCXZj/R+2kdYHDmcPQ=;
        b=O6fHxtBMj3t7hY+Uw/3qb2x6j543k2BHbHtJCQn6oqtWtPUTBNQXCUErXQfZnrL0cu
         ed3RWRZTAWDNB0OB+cczYYwTlALkP52K023BNUw2MqiyTGiR2RjCLfVoDilRHzSOMDEv
         vygo9IImvVicwVPB/DcmBIYSZSjXb/074HJrNKNE3Xj5opVgi240jvUSOLyp8/t1eZwC
         H42CWj/77TjeCDvqQScXfOHp5MmrKz5CKpvHVoHUmUBTn0nHopPmQ+U44P39UBED+khT
         cYciyWo8Mg06sAIk0MfiTomIQyQM4Lej3+fJXxP97VCJNGqTLALFw9q9d1Fq4/4iopnc
         pV1Q==
X-Gm-Message-State: AOJu0Yx6NvR+G2QV5lyeuMIn7TvDVQKlIwzXljIm2A4zDNM8N6868WjB
	VGSLpfiGf6pyShGeGAE9wE48bg==
X-Google-Smtp-Source: AGHT+IG4Jz3St0JSY+Xv22Ld5Lp75IMTOmETltc03cF5+vYAt26xlXAJR4aUtfFXw/keyYea6CEZbQ==
X-Received: by 2002:a17:902:e803:b0:1c6:2acc:62ea with SMTP id u3-20020a170902e80300b001c62acc62eamr28185711plg.57.1697151773931;
        Thu, 12 Oct 2023 16:02:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001c613091aeasm2494390plt.297.2023.10.12.16.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:02:53 -0700 (PDT)
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
Subject: [PATCH 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool Chromebooks
Date: Fri, 13 Oct 2023 07:02:28 +0800
Message-ID: <20231012230237.2676469-3-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231012230237.2676469-1-wenst@chromium.org>
References: <20231012230237.2676469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_160256_863028_D409683A 
X-CRM114-Status: GOOD (  11.07  )
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

Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. The two
are based on the same board design: the former is a convertible device
with a touchscreen, stylus, and some extra buttons; the latter is a
clamshell device and lacks these additional features.

The two devices both have two variants. The difference is a second
source touchpad controller that shares the same address as the original,
but is incompatible.

The extra SKU IDs for the Tentacruel devices map to different sensor
components attached to the Embedded Controller. These are not visible
to the main processor.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 60337b439744..aa7e6734b336 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,32 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
+        items:
+          - const: google,tentacruel-sku262144
+          - const: google,tentacruel-sku262145
+          - const: google,tentacruel-sku262146
+          - const: google,tentacruel-sku262147
+          - const: google,tentacruel
+          - const: mediatek,mt8186
+      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
+        items:
+          - const: google,tentacruel-sku262148
+          - const: google,tentacruel-sku262149
+          - const: google,tentacruel-sku262150
+          - const: google,tentacruel-sku262151
+          - const: google,tentacruel
+          - const: mediatek,mt8186
+      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
+        items:
+          - const: google,tentacruel-sku327681
+          - const: google,tentacruel
+          - const: mediatek,mt8186
+      - description: Google Tentacool (ASUS Chromebook CM14 CM1402C)
+        items:
+          - const: google,tentacruel-sku327683
+          - const: google,tentacruel
+          - const: mediatek,mt8186
       - items:
           - enum:
               - mediatek,mt8186-evb
-- 
2.42.0.655.g421f12c284-goog


