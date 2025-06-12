Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD405C61CE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jun 2025 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=; b=oJzsk1zdvH2V0nVC/gn0VkNF+W
	OqFoEB6COnXtQlVj5zZPb+MINlVC2H2liLrK00kAa3QVWnpMdYIE0kGqhFWSLfubjpmKpuKpS3Sed
	1abKllBDCnTuQYD0wpYXWYqlVDaU8l1zqNwVx3GvKFEO33gpwO7UUkxYQ15mNEObaJH1Mbg3c6sZo
	RkktopyKIErzYNDWjJ7vMrfQIhcJzp/KsqIWkcf0A4Txuhw2YHIXdgx9cIEKO3NkkRSugOaakW+86
	9Nyf9FlKQBtIx/q9siK6+5kb+TWJ1NmJWA9XvYPBnzBOC0y7UYfbZDQgV4UngA6Dl+DED4BRBol+7
	F0fhQHLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPd8e-0000000Can8-2u9J;
	Thu, 12 Jun 2025 08:18:20 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPcge-0000000CVQ1-0S8Z
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Jun 2025 07:49:25 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-236377f00a1so5753335ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jun 2025 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749714563; x=1750319363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=;
        b=fNLmz3ABL4/0/+ADQkEQ24CjGbjiW7I7KWN9692P6VVZ5LrEuIVxVTt0t+zae11Jyt
         cDwHcFmD+48qtoWPDRKnoLf2IqcbwqKzN6I2+4xBSKzJxOj63eRk6lpry6c22ENMugo8
         7ymO0OrUg3TrXlY3O7mXZ4nXGvjBNWg9JLE/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714563; x=1750319363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8rmXxgdE5Y76+Q2Sd3HDIMfBzQR9l3cd66jsguV0wzs=;
        b=ZH0M/AmtKULcE7gsygimrIzAKss222PlR/1reLG04IzYCFZbdSTobJwf0HEkGEAJRI
         g774yNGtdyNgCiypStMN2vuoOGu8UAyY4KWTERJkn50w2hm/Buodfdk519NGSbHgQiKW
         bb3eMONga+DvQdmh/EY2CKM2NAiP2vgLo234E6uu9qfxDGhkNPbEPTntfklXff+TROkV
         pJUMHtDJVR5GGt/ESUW8N7konSyCk4GPEQWnhEjyG0ARSCVGDdWYt14O2KX/mhD+uBfj
         QzRakbNiTNTYQcuHp17A6IYxAE5akC81iedAcywECKFaAPki6XD8O9t7H3g+yv9QfT2o
         r3fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtmCWnHf5qWIUghPygybDNZV3F/nKa6HkdQS17KRCE0yxVSlVuJtiZhBhu+o/JcCg5oDoCgIsng97XvnS4/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLay16TYUetWNxnQFoleT+pfY9ElB+aUI4fw1d4NdGY+Wvs++W
	wxCGTmnWn6hgm+pzLQ/b3fh6EqRL0ahXb588I7zlrNcMcKbe6sbkJFJ7tGbiNkFKZg==
X-Gm-Gg: ASbGnctmv/gqlEu2vr+ciPkbKga8bWrP6nDaOTkLaXkQjEY1DhJCW3H8UdAAi8SAz+f
	wWASzqILr9RjI6Ycj6dHWvoviAo1dgbWSo9zxj5Or2LBdoBy3RspaYbBxVyKaFb+zbgboXooLvL
	DATnI9UiAq6gqRYL8wdwAJzqMRh5gYQbROfZqfAFjjH/ULNQ51nZZcjodXVAbuzl/yugA9VeOFY
	1lZeQxwYQO2Ee2DTuCtsGoqah5TCl2kinxtkLrt0s4WS7Ne2Zm09l1ab1pjBN5tu/jrt2OXdnjK
	+HewplOrTbLDHgKPO5v2Rx1rFdX8lyY4UKKwRbk2TLRVs/1rvsF1vKoy5SCKFGm8mQz8polJqVO
	MKRw=
X-Google-Smtp-Source: AGHT+IETZGBfj/YzdDSsonxEfwWc/CcthND9zSTKGdklyqrJnMUaY4T2coeXgqpNXh9qqeHQt9lwGA==
X-Received: by 2002:a17:902:d2c6:b0:234:c65f:6c0f with SMTP id d9443c01a7336-23641aa245dmr76936875ad.8.1749714563347;
        Thu, 12 Jun 2025 00:49:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:5b9:e73a:2e58:5a47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e63d42esm7893295ad.74.2025.06.12.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:49:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] ASoC: dt-bindings: mt8173-afe-pcm: Allow specifying reserved memory region
Date: Thu, 12 Jun 2025 15:48:54 +0800
Message-ID: <20250612074901.4023253-4-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250612074901.4023253-1-wenst@chromium.org>
References: <20250612074901.4023253-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_004924_144385_83A989DC 
X-CRM114-Status: GOOD (  11.17  )
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

It is desirable to reserve memory for the audio frontend.

Allow the "memory-region" property, to be used to point to a reserved
memory region.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
index 666408d32f5c..d8993b5d457a 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8173-afe-pcm.yaml
@@ -48,6 +48,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    description: memory region for audio DMA buffers
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -90,4 +94,5 @@ examples:
                        "i2s2_m",
                        "i2s3_m",
                        "i2s3_b";
+          memory-region = <&afe_dma_mem>;
     };
-- 
2.50.0.rc1.591.g9c95f17f64-goog


