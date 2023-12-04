Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68403C10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RcS07JnvWd9BMDrKgMxSPHoHbXRrOeA/0qiEua/6c3Y=; b=JikGjMDYbH5IwQ6CCjrLeMruI0
	ZMs85y/8i3qpdFTG/wLgaUyU1GwZ88hJXFBP1MaJ6/4D514XKMTSnyLe5me1O5UJCro/rJvbROkT9
	JzhSB9WXwpRT84Thj0QJCETSofh7a1M8arl/BUPMivQQ+Xerj5MBs+JkvhAlWFmvhnqMqez7yOd0+
	GeqW8QZjr/J9cjToOZ3hgge2Vjql0Pi7VA96r3j/mNpGirGYupPRC9p0KZIwcAuVIBYImFqH43/5i
	Mg2Zy/XGPQAvSKp98FIgfwgblitRIvseFUNdi+dpIeXhD361aRz0tj1DNw7Iw/xjNmmAcr7ox+PXs
	xqyb/dnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XD-003INh-0F;
	Mon, 04 Dec 2023 08:42:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4X3-003IGJ-2Q
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:27 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d075392ff6so11371315ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679344; x=1702284144; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcS07JnvWd9BMDrKgMxSPHoHbXRrOeA/0qiEua/6c3Y=;
        b=fFCg88QTN5aH77BMU5jdn3WUacU62ssHWQgridf3S8ecjYg5YiWTIjzRaB4oDJ/zS2
         JHYAW18sDaFvMOgP63Tx3tx1qNLKR1s2+VicInC3dBurvDB6DhLUQUa+0Tg9Em9zMPpc
         czyhdIZl6crQRDdboJlIiYR/PT/msAVu5W8jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679344; x=1702284144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RcS07JnvWd9BMDrKgMxSPHoHbXRrOeA/0qiEua/6c3Y=;
        b=b16gEkI5zAdrFIunc/Vk7OFAn2pv6DbHAMmbYEGPsAVszhsKWVtQy8GVE3qzR0oIot
         iXDRDuLy6ShffkmwlDVcXGqI0AaLndvWFerb5HW2NwKUhG5ix2wGhSZYRdrfnPS7WV1G
         XJ9JioU0l319KfgvSE5Z8Qs1XX/+1EfWoJwT88RS5lCx6RSw3qlTquH+wylA45KnG+yk
         fKjEr0ei/Eu3cL/cRWSvncga7W9IEbO9nJjGNtSmeQR5gixhoP/rmoQr+kL5lsgeyRRU
         kPRmCMuxcXZ5jAgs+Dk98u6zrK0z+7yy3EnKuHDFIND0JWOEbDnZHzNzsyxURHmcLv9k
         hIIw==
X-Gm-Message-State: AOJu0YwFd5dTUugc5f5OIwmAaZ6os5UNdha7BMKjPWVFhVISYEMZ0/Zr
	rSqrQKxBKZ8cGJdXjHdFY/AGIA==
X-Google-Smtp-Source: AGHT+IHiGcGn+ZuGw9Sss/rws4YN9EdRsSAOdQ+GmAXf+Q/t8RLI7oy4ZFiupK4BG1Ci18tqVVJAPg==
X-Received: by 2002:a17:903:1248:b0:1d0:700b:3f87 with SMTP id u8-20020a170903124800b001d0700b3f87mr3651736plh.65.1701679343751;
        Mon, 04 Dec 2023 00:42:23 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:23 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool Chromebooks
Date: Mon,  4 Dec 2023 16:40:04 +0800
Message-ID: <20231204084012.2281292-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_004225_895013_8FDD0AAD 
X-CRM114-Status: GOOD (  10.88  )
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
---
Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.

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
2.43.0.rc2.451.g8631bc7472-goog


