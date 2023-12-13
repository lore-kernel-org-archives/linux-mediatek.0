Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894B3C3A59D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHQKk4d8ddwdrjZBqESFWwMSVagHkFt89kWPhTD7Nn4=; b=KEmP3CDJIO0rQ9ToYj00sn7WV/
	s2+QCmAEbaZOFbjhqscuHQ5D6qbUIk2LFbCtR5ibhqhzreAOrc6tJuhXF2bgobzJoz+Y0NVIGknDe
	2sUnnDf6QSerAGTiO6u2c8gSCCdJakgho2EONGbq7RdmT0y6B+tOI3pBKQHF3Zz2LvcAufYgXaTeI
	2Fcl75dLcVvOD7dPQkC+kOIxwQL9P1ngLflXs4GrmKze7gzguWmcIk5KyIAQVOoVVstf4Fnmjt+/l
	OTDeU7b6dyKdRdCWFCcFLOcej/kxwB3QNTG/DHN2rGpGx1mNjGkdl/dTL2b6wr79bIVq09EVFOh8/
	OdZYExMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnK-00F92R-2x;
	Wed, 13 Dec 2023 15:05:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnC-00F8uS-13
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 15:05:00 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d2f1cecf89so24686975ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702479898; x=1703084698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHQKk4d8ddwdrjZBqESFWwMSVagHkFt89kWPhTD7Nn4=;
        b=cT8Kh5pIw0micA3LSXHggd/SbVRot/j+fVEMnMdjm7QT5ZOixfNQD2pQYnsIvt10ri
         dg99zl2FU4PgqgCGHqlFQs9IUoCItgIr8x4Ua2V4DspszPA8MBDaHZKmsOERNY0D0T1y
         CFokv860Ioh2wnsYJPCb3/RoioYlm+j29K51g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479898; x=1703084698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHQKk4d8ddwdrjZBqESFWwMSVagHkFt89kWPhTD7Nn4=;
        b=wqTq7JJUtbJZEj16BQgYDHetfVmFV3QhGo9ZXJZ+amLpL15sATD44xXIOw27qN9AwN
         IeODQOzj35syu4ni0NCqwqa78qcejZnbyihKGHZFlIK8g8nEO1m9MVp8re5ZLSdAJR6p
         mWGKTpGHCATKjuugnnW5q2Qw8k33u3mgZEFLt/D3xygIS7wdB1DDVQN2PI9TyPJYBgre
         tlROqe2P6y77fZxnef5HgP7MxbL16Badmr0rROim6GuHBjfBvs24KV+J7b2+0REK+0dz
         zT1TZ/HYChjwbYV05PESYo6+Usrfb2EUjRKFWj98M4EHeAKytNi3/94c0V19WpIFZbzu
         Wqgg==
X-Gm-Message-State: AOJu0Yw5GkHvOMNhtnqZW1TxMTpqbzqXX7PPy2yv1H5avN/DmPxupire
	aV5m3FnnwY3VDgnUj4cUxm4yQQ==
X-Google-Smtp-Source: AGHT+IGkHAOSAbKahJZ+Rvzu3EviFtnKBG06cWxjCCSZxriqnyEZUPbnctUK9bg7P+z3snWvZmTsTA==
X-Received: by 2002:a17:902:bf06:b0:1d0:a663:20f5 with SMTP id bi6-20020a170902bf0600b001d0a66320f5mr2807931plb.67.1702479897768;
        Wed, 13 Dec 2023 07:04:57 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1974:9e2:4915:58b0])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709027e8f00b001cc2dc61c99sm813808pla.22.2023.12.13.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:04:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 4/9] dt-bindings: arm: mediatek: Add MT8186 Rusty Chromebook
Date: Wed, 13 Dec 2023 23:04:28 +0800
Message-ID: <20231213150435.4134390-5-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213150435.4134390-1-wenst@chromium.org>
References: <20231213150435.4134390-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_070458_391322_7AF9BE3C 
X-CRM114-Status: UNSURE (   8.72  )
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

Add an entry for the MT8186 based Rusty Chromebook, also known as the
Lenovo 100e Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 95d2b430ab17..85d394e390f0 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,12 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
+        items:
+          - const: google,steelix-sku196609
+          - const: google,steelix-sku196608
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.43.0.472.g3155946c3a-goog


