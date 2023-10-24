Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02DA0C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 21:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT+66IxyTrpqd+XpQ36/yDuTAp9fjV5BitgE+rccN5g=; b=gUJtWuYG/UwNdj
	0B/pahgXy089ITbM10t0jEF3DK4w28+JXOPXy0QBqT0J+BQYawSpGrBQKa00vF0roBIp6mD9jCxXj
	dAo0kneQpak2X9SL6gLCDF6NNPUqj1k4mA6UHdykB75+NiYskQgYZm1sBuXxpodronZUWeHeGtI5c
	ALTG2bCF0hfLvSsC5C8/eG+Sb4jNpPlgx65igSPpFSidvUz1qtwsgleMxmjAMt1AaV9rAXlTPGv3+
	OTn508NbWYjeqrTuku+AdjEZ0T2ESmCnuInR5J3PZRvNOWmEGKGL3ffT/Lmo9hZSdaDUysl1XPM4O
	Igz1BsRw+/gATC9VsCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOvT-00AshJ-0D;
	Tue, 24 Oct 2023 21:26:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvOv2-00AsSs-1P
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 21:26:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c0ecb9a075so34636905ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 14:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698182791; x=1698787591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WT+66IxyTrpqd+XpQ36/yDuTAp9fjV5BitgE+rccN5g=;
        b=mLLtHebKPdn5T7gp/sYqU5JUx3R8mSOBvIBVEAr0pSi8Kp64c4XFYCzkX20G5GbeQi
         ksrbOFXmkZdkPkTwMrAQpNH0aB0ckDRpJxcicLSkDuo9lPf8zScXT7Q38H8Tr9rox57x
         VLH5esIHB4lqlarzdE0+0CkvuA24/9Dr8dQ3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698182791; x=1698787591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WT+66IxyTrpqd+XpQ36/yDuTAp9fjV5BitgE+rccN5g=;
        b=oKHtdIFEGZPZMhmQTb6o84pw+WVjjSD6OjfR0EHahINHxMDlIaUXltI9cp3OpDOfDd
         ou2BGlc37gS7S8JQs9VeVV47rVu0GurOICu5Sy4O04dcVyMHmuGvfCvQNFDV/oM7xa9N
         5UQBHqmC5XTds2gJqi4ZUAhfd3D3OlfT5xocY5poDJ3v/J4cBYG9ozp+q/HHgjL6ijkU
         rdfT/1IN9aylHl7ubCuLYL6Bv8s+JjsjCsBMjGbT7TcI+ALPmkZdeWDA9I4csANeJsDr
         JN03MIzpYrtNVYHqd+bnAouoC8p0BAXLlOECdh27xeaAf0vuB3rbjV4D1nIGCdB8Ls3y
         BO1g==
X-Gm-Message-State: AOJu0Yz8PV8jNK0stDzw3KU5AzmrVp5kGUv4ZQExZ7uWPHSqpVkolrKs
	pyn05nd4tD/g0WwmVVHXGLHKvw==
X-Google-Smtp-Source: AGHT+IGVLiHOuR2GYs8wtD+k2Vea4FG0aVST3WDGqFFF4fAgZggjmK9W2KiixVxe//eZy70KsoUejA==
X-Received: by 2002:a17:902:e851:b0:1c9:e3b1:1f4 with SMTP id t17-20020a170902e85100b001c9e3b101f4mr13859071plg.62.1698182790947;
        Tue, 24 Oct 2023 14:26:30 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id p9-20020a170902e74900b001b850c9d7b3sm7824140plf.249.2023.10.24.14.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 14:26:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 6/7] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-pico
Date: Tue, 24 Oct 2023 14:22:28 -0700
Message-ID: <20231024212618.1079676-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024212618.1079676-1-hsinyi@chromium.org>
References: <20231024212618.1079676-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_142632_510904_2D948092 
X-CRM114-Status: UNSURE (   8.96  )
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

Add pico (sku1) and pico6 (sku2).

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index af1037a95fd5..f7e2b742c798 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,13 @@ properties:
           - const: google,makomo-rev5-sku1
           - const: google,makomo
           - const: mediatek,mt8183
+      - description: Google Pico (Acer Chromebook Spin 311)
+        items:
+          - enum:
+              - google,pico-sku1
+              - google,pico-sku2
+          - const: google,pico
+          - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
         items:
           - enum:
-- 
2.42.0.758.gaed0368e0e-goog


