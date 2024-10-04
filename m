Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2100CFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DhL+yqm4JWemXjqVREhHsRQssA7CSfL5kIS59CVyeA=; b=LMx4pJJBt2dWG6
	Fub+13+hGAGBK88xKuEUig+v3N0Wz/QPnIlGGmc4FKLPz8i9DpNy5kaNDZo+scsTgfwmPWk7P8Ffk
	f3nwkw1vn6UCMkYdPp34QqSY2gGw+j85rnyy2FaaG06yMgEh/CyEB+yh/2SVRqy6rRD/RZoYz+5vm
	dukW5ADM5+mD0H+SPnBfFjkquMP6nkudsGP6oTohJ3YAo7D4XnnTOXSMEUSAwiVKgZe+i7OlVdYK9
	Yw+FGC8Qxi7QFs9dNNejyUOUP7RKN8Cp7d3HPt3Jmy8/u2qHIEZttWmfMpepQwmnHfVw/HuHrOChO
	lQK6U4Ukf0uljIGbHDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdYf-0000000BO63-1UXi;
	Fri, 04 Oct 2024 08:21:05 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdQq-0000000BM2z-0us3
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:13:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20b58f2e1f4so12388195ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728029580; x=1728634380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DhL+yqm4JWemXjqVREhHsRQssA7CSfL5kIS59CVyeA=;
        b=aFWrrXhayPrJEO6g1zzGt7NNsDpHKjpouSYk0reHyIV2OHYob5BQxlwDh06+0QUF37
         VMgj5tHlNTO4zdHKNUhB1//fOxKvuACKCnNeVCVL+cUM64JC+je9KT03vvWkos0XnbEq
         kS3phdfdjLXZZekR8GabiBweWxP3TsbpXhAd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029580; x=1728634380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9DhL+yqm4JWemXjqVREhHsRQssA7CSfL5kIS59CVyeA=;
        b=j+ZEGmAuQAU/GQCNKq/1JbLA8+V8WOrBWgh7vINhjeVRrn0dhW/GGDWOSWJZaL12rr
         RuMntpjXVmARo+H9HFNjS9AJz+Gp6NqnQBVJJ0WQSCrJmA+4D+Q3Ohr9Ay11xWmS+viD
         qO8r04x7po9+Vosan7KFJsf39oxh+yYbmJt8P5jN/SxCxbSJPh3laoLk6RIwKM8Uk1M3
         w1oEmLlVyWfrTMfo4qC9oelMIwTKRvTjeKTsizEI+qKSd62piSvr2JN18knHTJb4NvjY
         ZWd+qLu2PvOJLqm/5VHmmJHDAMj+sOekQ3pqOFbt77FSXxdmQzxSEp5xwjIe1HHzWWYZ
         eAZA==
X-Forwarded-Encrypted: i=1; AJvYcCXyJPFXzSJKE8Rrpn8GqoQm+p3cIPetctJtStdArZiidvKIy6TiLhulHQZdf7j8EBPfyhrQosgWNAEKUYl90Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6UaBZDNwVTFqj0TjHsEyL6K6GfqRDUbaeoTqT3Dww9QxkcUBY
	RDq14PBHAz+vEa9AIs/Tbc5A2NbIS5zqzIZ8zR28QjH1RbPOUB24RrmGIQpJUg==
X-Google-Smtp-Source: AGHT+IH60gDoSksZRxBPYz8lE7yUsHBmH9SByFQjxJjyREMpraheTARQnyuSg3kqldf9evYR6R5/Lw==
X-Received: by 2002:a17:903:32cd:b0:20b:af36:ead with SMTP id d9443c01a7336-20bff194fd0mr27908675ad.44.1728029579648;
        Fri, 04 Oct 2024 01:12:59 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:73bb:cecf:e651:2ce6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad264sm19401305ad.205.2024.10.04.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:12:59 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 5/9] arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
Date: Fri,  4 Oct 2024 16:11:57 +0800
Message-ID: <20241004081218.55962-6-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
References: <20241004081218.55962-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_011300_298720_3B771105 
X-CRM114-Status: UNSURE (   8.60  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add JPEG encoder and decoder nodes for hardware-accelerated JPEG
decoding and encoding support.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index bb07d2629e08..a6a5d9cc875b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2332,6 +2332,35 @@ video_encoder: video-encoder@1a020000 {
 			mediatek,scp = <&scp>;
 		};
 
+		jpeg_encoder: jpeg-encoder@1a030000 {
+			compatible = "mediatek,mt8188-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x1a030000 0 0x10000>;
+			clocks = <&vencsys CLK_VENC1_JPGENC>;
+			clock-names = "jpgenc";
+			interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L19_JPGENC_Y_RDMA>,
+				 <&vdo_iommu M4U_PORT_L19_JPGENC_C_RDMA>,
+				 <&vdo_iommu M4U_PORT_L19_JPGENC_Q_TABLE>,
+				 <&vdo_iommu M4U_PORT_L19_JPGENC_BSDMA>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VENC>;
+		};
+
+		jpeg_decoder: jpeg-decoder@1a040000 {
+			compatible = "mediatek,mt8188-jpgdec", "mediatek,mt2701-jpgdec";
+			reg = <0 0x1a040000 0 0x10000>;
+			clocks = <&vencsys CLK_VENC1_LARB>,
+				 <&vencsys CLK_VENC1_JPGDEC>;
+			clock-names = "jpgdec-smi", "jpgdec";
+			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L19_JPGDEC_WDMA_0>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_BSDMA_0>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_WDMA_1>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_BSDMA_1>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_HUFF_OFFSET_1>,
+				 <&vdo_iommu M4U_PORT_L19_JPGDEC_HUFF_OFFSET_0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDEC0>;
+		};
+
 		disp_dsi0: dsi@1c008000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c008000 0 0x1000>;
-- 
2.47.0.rc0.187.ge670bccf7e-goog


