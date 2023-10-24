Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1E7C25B47
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nPMghuwp+tPA5DuqxMPybyD0q/nbyVUGg3y+BUmnhAU=; b=GAmLBNDZ20bcIX
	9n9h959lLoNJaDvWIhYbG8GlhmFgp8f7ch6+jqDXA/gvFFjOHIcWpIzNsy823ZHbzym7FIfB+WZCX
	7lQDkJczOZAHM3MisxcfUlKJktT2kYweY9TWAtWEcBMgeCvA0dNl/mu/ewzX0ChDirldk9TCjPcfW
	BueDp6zuVjSKi1wPRCPqScLuoDqQzWmQC0bO5PBfnacu3yuEDOVq0MxOqj1m6sA0Lm/+zGXpI8CS9
	Gt+zMd6Gs/RBRw6uTbSVKCoDZqFm9Q/ZnH38XMXUrEVRNdILBoHmrnU7a0ujc3Lyr8MvLtdR4JpMa
	H3u74tNCgMp5gpU+ceDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOvS-00Asgy-27;
	Tue, 24 Oct 2023 21:26:58 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOv2-00AsQK-1N
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 21:26:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c77449a6daso41880865ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 14:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698182785; x=1698787585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPMghuwp+tPA5DuqxMPybyD0q/nbyVUGg3y+BUmnhAU=;
        b=e6RMTAfa+ob0VAAwmckSjWvsWyvPWf7lhEu+hbwZcQAkFt0+yCit6Nr5eBaWLNwA7M
         ra3QLiS4wA+R62fgu+wk1grumOIqz0eXOOfREcFO1Soa0Xqkwd1hn6UApYtqJLpmsEOy
         Oy6lSCNdoiLJh7xKyOmAngklrYwHajoT74uwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698182785; x=1698787585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nPMghuwp+tPA5DuqxMPybyD0q/nbyVUGg3y+BUmnhAU=;
        b=CU840tYeXOHTxQit80pw5o6ianfkz+7tnGOCi7Q/3+M/kJTiYEXvqzZDm2iI8/IAkL
         KHIfYSRJXld9bacXuZOBQRQ1sg0YfGAXFLW9ZisP9KLHg6OKDpNivf8wHqPimWhikf2C
         6HqMF3DbiiDa5XMI2FtAmTn2luVl+HTxlMBx0Shrp0JjyPgTccIZm8kUlgyC+IP91fWT
         BG8SC9k6dLTvuF66yOEoTfFdliy/gz7Ew5FoE9Dhr85AkksIo9qrH+q0VUqlZuEHAPdR
         zHC0z5vpL0zH1DH8pSNTXn2lKduK2+7/aiqnUWs/zcgS1E9THkLZf3L7zezPx42W9eUu
         reGA==
X-Gm-Message-State: AOJu0YyyvqXdIFEHWlppYgtFFaXt1/iPFqcPVjdpD7jarZHRSXnRanVI
	fn2uXnweyZRFg/f1GIZdsZ45aA==
X-Google-Smtp-Source: AGHT+IFmCsigqtOmK3pF3vfTppVXjAMhmh8TLrWxud/qg3KLT70MRIgtqngZr0IQmbvT4J7nmCwjDA==
X-Received: by 2002:a17:903:200b:b0:1ca:8e79:53a2 with SMTP id s11-20020a170903200b00b001ca8e7953a2mr12674948pla.46.1698182785720;
        Tue, 24 Oct 2023 14:26:25 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902e74900b001b850c9d7b3sm7824140plf.249.2023.10.24.14.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:26:25 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/7] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
Date: Tue, 24 Oct 2023 14:22:24 -0700
Message-ID: <20231024212618.1079676-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024212618.1079676-1-hsinyi@chromium.org>
References: <20231024212618.1079676-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_142632_483732_0C86686D 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add katsu sku32 and sku38 which uses different audio codec.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v1->v2: non sku38 is sku32
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a5999b3afc35..4fe58cfe6f1b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,13 @@ properties:
         items:
           - const: google,kappa
           - const: mediatek,mt8183
+      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
+        items:
+          - enum:
+              - google,katsu-sku32
+              - google,katsu-sku38
+          - const: google,katsu
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


