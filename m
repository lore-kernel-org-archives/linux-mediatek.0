Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F8CC4167D
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5iSRDewShTPXxKrQl9ZbdBaDFVN8OqSrgR14MEC1bo=; b=OuK8E6HqIZ0Ee++BkGJx6Mw2Sf
	0WHpaoe2jB4Hl2PFWTidZ/LZPWY1A3gJKcyxfUNocN5+4KGBI6CCMU1dAGgzDHN/BtjUSbTogBFc1
	sPsvF8XauxK8j5cuzwJE1JSESTw03duLWeqkg/p3fkECLhhCZeJ5HIZvFztNJsCbR+ehzFnzX0wtm
	7CdFAm3qo+HjNglOv3JNZCcFwhhd9fg1LpZOImwhxAbxMFwvDdhbUUN7Dy2t1z0QoWplaAJwDU5RH
	lfMCVvaAU7SbVq7JmTMk6JyVGgq/D3FIT1qaD4ppNBQ5zDCKrjFZDWmsBCRkG1rCgUtb6XfzhFTKZ
	/L18stFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnK-00F91Y-06;
	Wed, 13 Dec 2023 15:05:06 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQn9-00F8s9-1Z
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 15:04:57 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d3470496e2so13093925ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 07:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702479895; x=1703084695; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5iSRDewShTPXxKrQl9ZbdBaDFVN8OqSrgR14MEC1bo=;
        b=M879ZTH/aPOgEanUT8NOm302/3btAVizbR+oxcb6GsBzthLiYv2QNdD5yIW6OqZQC+
         Io2r9OvMit0qB2bfdnSwSa40fvHedpNvN2pY1As0vhD+Qy9wQ1jJ7J7sO6Y9Tibocja6
         sQQU2qzTp26zs+vX4tFtlj7IzetPYbZ4ePaCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479895; x=1703084695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5iSRDewShTPXxKrQl9ZbdBaDFVN8OqSrgR14MEC1bo=;
        b=husIP1tDr574b3vhMEIlDpYKi7XvEVU07+Qa9U9ggacgZYfnrgkzOImqabYNax+Oli
         p97v9bFnl3L+l0dZw5e95VeWARPOjGhLrpWpeyXVOF/MKOQkqBZd5H/HUMggycK7zRC9
         bOsKf6CfagUuzVGC99HnvVNfBq8ekoRcCsQLiauSX++fbTEHzS5D5/gUuWHDtpJUmNPT
         G0DbV9toAzb/QMKjYKEdgZB19vqMhXC/3EXeWGnfTyzS5aVSeL1idvbnGcfTsUznD1qS
         u98Ves019A6T7/VFTeU+nDMccDm4NoOoKfMsCMsz4LRdSOsEn7JAj9YxeCOIkRs/f1gC
         TWyQ==
X-Gm-Message-State: AOJu0YzVl2G0MBvzDTv3vjOrLdKsSir4aGBc3TwGTuLMG4lk1D6+rP8/
	q1909tMbKC+keK20RTsBXkMTDA==
X-Google-Smtp-Source: AGHT+IF2D6t1zTEzAvgIYyo0Wejm3JOajy+YfsbKc5W0Cj+mJTZHrPx+Rox/JQkhkLD6UyMsqVq3kg==
X-Received: by 2002:a17:902:eb88:b0:1d0:265:6a2c with SMTP id q8-20020a170902eb8800b001d002656a2cmr9652280plg.11.1702479894838;
        Wed, 13 Dec 2023 07:04:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1974:9e2:4915:58b0])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709027e8f00b001cc2dc61c99sm813808pla.22.2023.12.13.07.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:04:54 -0800 (PST)
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
Subject: [PATCH v4 3/9] dt-bindings: arm: mediatek: Add MT8186 Steelix Chromebook
Date: Wed, 13 Dec 2023 23:04:27 +0800
Message-ID: <20231213150435.4134390-4-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213150435.4134390-1-wenst@chromium.org>
References: <20231213150435.4134390-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_070455_528164_E94B8550 
X-CRM114-Status: UNSURE (   9.13  )
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

Add an entry for the MT8186 based Steelix Chromebook, also known as the
Lenovo 300e Yoga Chromebook Gen 4.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack
Changes since v1:
none
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 709a1292bca7..95d2b430ab17 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,13 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
+        items:
+          - enum:
+              - google,steelix-sku131072
+              - google,steelix-sku131073
+          - const: google,steelix
+          - const: mediatek,mt8186
       - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
         items:
           - const: google,tentacruel-sku262147
-- 
2.43.0.472.g3155946c3a-goog


