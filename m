Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55FAC46CA2
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 15:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MkDekqAXqNqSyCz+/cVaWMtnSMsPpAtTud5OI2FYEUE=; b=OxlreUnpUj1YDLlZ9GjCsGUUC0
	zAerflHovrIft36xCkaZfeSg4fjQp7rSwJ0I5Nz07i3+zZxLwtCOrPcgKsOyOdnNfXrWtkQ/QURor
	RoZJJbY865dqPDX1xUjnHWpj4CMhBCbVpg2rsvsJ2/hjxm9jo+5ORmDT/RQYX4AVPnT9z+gcy5yxw
	j9RCN6kV1XYlrCS9gf/YaHe88R0lSpEJVc+7TsMAygkr76Ai+nY/FejNaBeZwdD357XiMrSKDbZ6o
	U8CgE7d4CUlkfIK9jTCJjT0VGU761Ni7VOl/zNkcDzt/lXOxqDigs2FUhi6AsfVHp+s86lVvFTAY9
	6SqRFmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnK-00F91u-1W;
	Wed, 13 Dec 2023 15:05:06 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQn9-00F8qd-1K
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 15:04:57 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d06819a9cbso40569795ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702479892; x=1703084692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkDekqAXqNqSyCz+/cVaWMtnSMsPpAtTud5OI2FYEUE=;
        b=JtoV93xAQv5PnHihNe0wARhk+rH/QdwrrNQ+WrTqXihgQ6YxTA6Shkg/yC9bIYSbyp
         TQU898QwXdmdhNve+NY09gcuSVcI506EscxawoQdcvgedvuu/ycttCHdZgiVZWOLGoTb
         v6/derMP8FNXvy3VDgrFTGr6zBf62vnQLQeeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479892; x=1703084692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkDekqAXqNqSyCz+/cVaWMtnSMsPpAtTud5OI2FYEUE=;
        b=aXg454HbL/C+wC1n2p9SlMwDXHHUkbStjLOhbzyT6mee/OniPVPqZirII+S0U7nhkt
         N2msTZAtoB3qyBjgtbVaAJEULFbNhwRWt9iAtFLzrR0o2j61Src/WkDAV+jQK8jEth9e
         NTtfD+EDFN6IuUXa3E1wX8kAwtDoCUVffhZUUymwRJJBnejT5YKDTIvImUX4c/+dtwKt
         VpkI0AmPj8tfjYYvfiXXQ/lD1pGvT7UGJgA+z9usbZi+g31uuio7KhmmKXhpCEjJkhP3
         ak60Tjb1of4brweeExRQL+MqvNuHPjBK/8VJxAZJTVjbwN1PUdAY83eNR8SIFQq62sAH
         yuqw==
X-Gm-Message-State: AOJu0YwrLP6rOMrntqFTt6hmrvKe2JYzotHylZu0SGY4q+E3LULNq8BG
	gLc+n/fUglZWYcjFvEaJgzGl2A==
X-Google-Smtp-Source: AGHT+IHuPKZbU48xMs/jN6pDfLmqb+wN8DW7c1EAjkTR1Tc/ThfubspLReOTlvwHdCResn22tFrprg==
X-Received: by 2002:a17:903:486:b0:1d3:4e4f:a182 with SMTP id jj6-20020a170903048600b001d34e4fa182mr450052plb.94.1702479892315;
        Wed, 13 Dec 2023 07:04:52 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1974:9e2:4915:58b0])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709027e8f00b001cc2dc61c99sm813808pla.22.2023.12.13.07.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:04:51 -0800 (PST)
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
Subject: [PATCH v4 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool Chromebooks
Date: Wed, 13 Dec 2023 23:04:26 +0800
Message-ID: <20231213150435.4134390-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213150435.4134390-1-wenst@chromium.org>
References: <20231213150435.4134390-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_070455_455881_1D9F2ADB 
X-CRM114-Status: GOOD (  10.73  )
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
 .../devicetree/bindings/arm/mediatek.yaml     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 60337b439744..709a1292bca7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -206,6 +206,32 @@ properties:
           - enum:
               - mediatek,mt8183-pumpkin
           - const: mediatek,mt8183
+      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
+        items:
+          - const: google,tentacruel-sku262147
+          - const: google,tentacruel-sku262146
+          - const: google,tentacruel-sku262145
+          - const: google,tentacruel-sku262144
+          - const: google,tentacruel
+          - const: mediatek,mt8186
+      - description: Google Tentacruel (ASUS Chromebook CM14 Flip CM1402F)
+        items:
+          - const: google,tentacruel-sku262151
+          - const: google,tentacruel-sku262150
+          - const: google,tentacruel-sku262149
+          - const: google,tentacruel-sku262148
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
2.43.0.472.g3155946c3a-goog


