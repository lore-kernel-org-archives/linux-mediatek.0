Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33836C47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cogi64Y0F2tp8CwfE9RTV56n6beiSf1YYbgAclTRDJg=; b=Ko9eB3cVJ2qnOeEGB3v44guHI6
	rDxvt3pGELV0Fusu2knYVQB1iyFc4+VK+i9a9RQWuPm8LRfz5DArST9e7XtNzWicwnvoALZJwRM7T
	GzbcF7pm+iLIKNCgsRE6p2R1WlKl06nO3ANsT6JAila70PFSpk+nHbHe2grrI1nfYH9/M907SmEHo
	4MFr/busqPm3D5WLEj+yPvSsLZjQ2t0uGmFzry64U2Br/aKM4ZNNUreIeVp06bBmyIKCahsu710P9
	0XMoxUhTzEYwa1WOfMJxm82apSrujjOYSWLUUf5wg9cQpdOSj/c3IcOkJACXsdfNMiNstVJuq+vzM
	USP07rdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjI-00000003SjD-23wz;
	Fri, 26 Jan 2024 08:38:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHj8-00000003Sdc-3Thz
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 08:38:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d73066880eso1095435ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 00:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706258298; x=1706863098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cogi64Y0F2tp8CwfE9RTV56n6beiSf1YYbgAclTRDJg=;
        b=X02oeFmPRf+aUrUNawFUcMDIyYoZx4UiUaQV+htuWy0OV25aeSjuJyFWBJ4TUIiL/Y
         lAQA0mQIWOxWSEPwp34kf6s9CmeLkhDv/IJGcxM4Ahwf5ELdjf6WL4C54xHQV/kTMy5o
         TtKprW+Ichf5yoVtvW15e6VOKrj36WVq8TAOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258298; x=1706863098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cogi64Y0F2tp8CwfE9RTV56n6beiSf1YYbgAclTRDJg=;
        b=gtyj24ltGoQp5SU6wvxhhQ8j7WG22X6UMHur4NeWlFXifNVtNUbguASMZ3UtmLOd/U
         chIMRyGfsDh8ih007kCL+5NOPBnoIkWS1sb2y9qBGQaHWOCfnRd50D5jDSkYNde4MWhK
         9coCc0ZNw/EZxMAc1F8HWoRyo9vs5OBC+78y2OyO8XJ7jcpTzI117Wl+EPLpeQQJ7NN1
         0453+1q2mDlf88MDWxFD7diQHICHb+88ehLdO6nHBHJc0L4ExCz1HtCEROdu/NUBX6+I
         Ln7OKbeMxl9zSEDNnH84oweFZxqDq427h3sSaVCqz+QduYPoUJTzqtgca5ctNINubGxv
         am+Q==
X-Gm-Message-State: AOJu0YxKqd/HUpwGLFsQJBrB2Pa5rbhO5c7Nnuw3adMiReHipPWrZwZH
	lfKB/s/gVdcjHa34mWff0E7lTiuJsV3BTfG410S78zCyTIn5XwraOH7IYpAAlQ==
X-Google-Smtp-Source: AGHT+IF0U9j/ZKLnUWSANBPy/KQZ3zWCgPlpALjoSGydw/Yn0Zd9JE0GDdtVYJQnpHfDdP9rJ6bjKA==
X-Received: by 2002:a17:902:ced0:b0:1d7:3d44:7a0e with SMTP id d16-20020a170902ced000b001d73d447a0emr1181869plg.11.1706258298357;
        Fri, 26 Jan 2024 00:38:18 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm589529plr.8.2024.01.26.00.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:38:18 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel / Tentacool Chromebooks
Date: Fri, 26 Jan 2024 16:37:51 +0800
Message-ID: <20240126083802.2728610-3-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126083802.2728610-1-wenst@chromium.org>
References: <20240126083802.2728610-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_003818_906829_4881A243 
X-CRM114-Status: GOOD (  11.24  )
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
source trackpad controller that shares the same address as the original,
but is incompatible.

The extra SKU IDs for the Tentacruel devices map to different sensor
components attached to the Embedded Controller. These are not visible
to the main processor.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v4:
- Minor: change "touchpad" to "trackpad" in description

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
index dd5240b03d6c..d9fdc1196b10 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -235,6 +235,32 @@ properties:
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
2.43.0.429.g432eaa2c6b-goog


