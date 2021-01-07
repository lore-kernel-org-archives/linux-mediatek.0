Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71226C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 05:22:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39B6722DBF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 05:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39B6722DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MXjiCqFY+87Vrp71nZ7VkmoPqTFAqozMmhsPFNL9ENE=; b=j00NAFPpBsV7XwYzqOr9ahw2H
	fvYf6UCgxQinoKQUMqEsiA7ZOkofY4l6928qAhUY5zGcxxiaQE8Racz0AHOwM6K3+2wiKuxsg0ks8
	HVZ2FZtu9NVUYGwjPYcdrPXhxaSz3lDKIHn4hIB0FgKgW8/VpJ7ykPesnQJ79mqG57B9VhIOskd5A
	bh1kyWHV3lpytSES1APAs3MD+URPAyA+zlawRBqVypIulWQUm5szuF4XxVeoa3MsqMVVuF9yQmVCc
	rmOljyAZ3pxuuSu6pw22Kb5HxkaRygVN2Zsx863bdfVSVdRYIyjf3mO/SmwGxVtfeT75jHdyPgFPn
	jpNwuaKfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxNkZ-0003v1-Aj; Thu, 07 Jan 2021 05:22:19 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxNkV-0003tV-KK
 for linux-mediatek@lists.infradead.org; Thu, 07 Jan 2021 05:22:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id b5so3062745pjl.0
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 21:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=za0ag3gB6BLygdknHTVvvtS8ePIL/nwl6k31OOfDxZE=;
 b=Tnmzmw6gTBdTGrQLHVTJgg70+edzs3CwmWD24w5bKxEYd+cC6h+KH+WqeAgXhNKBC6
 9yGVmvX+9Vp12cpd96aW3er/3wAx6jbh5eCJ75e7Re3Z3RXY9+cwDtFSeA0/4k1KieEF
 pLd+5tiViTx4ii96oLIDQBlTC/pA6+q6EqnFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=za0ag3gB6BLygdknHTVvvtS8ePIL/nwl6k31OOfDxZE=;
 b=lTKZt3vo4j1x8CnwKv+GymtK5zRLISziz+DBL2bZMxjDt5dgKfioEmQ3GLJBg6eKcC
 gEia7sr/aLFZ9F3gVuWp5HZ7C0D3k9QxwpHO45T1XPrxXe+ZRfbjaqrMXaH2rw5Ke2kn
 UTs5tdCQb+bz7+2fKVHu4nH4gh6oH5trWx6fRZFwebdyrekAlYHVQB/sZplpDP/TaV4z
 upVY/o1f5ahKOU+fnpp1JY7sbheoXBJWvx36+AwQxhgFHbfomdVc8FCBTIT3UuY1JA58
 FAoVo6yMx5gTYdcKalkCE2ou6ZG7lVvTULT24izKqF6h32b+5xTB0K8vYaXz/m1tGX2Q
 0m4g==
X-Gm-Message-State: AOAM533jQAJ0DeArdvPgrvioLi//EM7TdgF/odSNMuhFLL6WQnr+b4OO
 5UNlMiNYZDr0agA2NTiliii3/Q==
X-Google-Smtp-Source: ABdhPJwS0OBQfa+LmuHpns922Cw47fL3IBS0sOudVb65hfbHUJOG8aWxpjmoXzGrZ+ZZXR3oDfIYjQ==
X-Received: by 2002:a17:902:654f:b029:da:347d:7af3 with SMTP id
 d15-20020a170902654fb02900da347d7af3mr7808509pln.18.1609996933598; 
 Wed, 06 Jan 2021 21:22:13 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id c5sm4824479pgt.73.2021.01.06.21.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 21:22:13 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: mt8183: Add krane-sku0 board.
Date: Thu,  7 Jan 2021 13:22:06 +0800
Message-Id: <20210107052206.2599844-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210107052206.2599844-1-hsinyi@chromium.org>
References: <20210107052206.2599844-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_002215_704843_B15A4EEA 
X-CRM114-Status: GOOD (  14.89  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Similar to krane-sku176 but using a different panel source.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change:
v2: move compatible to board dts
---
 .../devicetree/bindings/arm/mediatek.yaml     |  1 +
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 53f0d4e3ea982..3276f7a2ce672 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -120,6 +120,7 @@ properties:
           - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
+          - const: google,krane-sku0
           - const: google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 18f7b46c4095b..deba27ab76574 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
new file mode 100644
index 0000000000000..fb5ee91b6fe0e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2019 Google LLC
+ *
+ * Device-tree for Krane sku0.
+ *
+ * SKU is a 8-bit value (0x00 == 0):
+ *  - Bits 7..4: Panel ID: 0x0 (AUO)
+ *  - Bits 3..0: SKU ID:   0x0 (default)
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-krane.dtsi"
+
+/ {
+	model = "MediaTek krane sku0 board";
+	compatible = "google,krane-sku0", "google,krane", "mediatek,mt8183";
+};
+
+&panel {
+	status = "okay";
+	compatible = "auo,kd101n80-45na";
+};
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
