Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D29C71136
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jun 2025 08:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=; b=MCiOI/ZiowTpvBlzoAFg5fS3/d
	TU50p3OkYhbMuyH2cx2aDQlRIANtQv/I94OQ3YaB5m/h4BYX1Sc6LvDZ2UfSkpj7y1rqec3jh2aCo
	gX1DoHkEyXhz9cdGqRHUwjiBE4MNDu3D6PNaS0fEZNVKs/SdpFRdBhoIZtdUIXWBxzSNwG+pNyMMu
	u20UAPkqH274gipgDr8pAE/80xpRoaGgwVFYZGaFYLCoH6WxAXueNW0QyMgCHU703KeQHq1T7Zlx+
	KkmNbYxxzUc6JWt7uKx2Nl0Z9no6SNh9vbfTk1XUrwp2SDAFErHgZcahfKSkgRvgceWnJGDW/eAUW
	kGytqNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRso-00000006csY-1Rlz;
	Tue, 17 Jun 2025 08:41:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYa-00000006a31-31V5
	for linux-mediatek@bombadil.infradead.org;
	Tue, 17 Jun 2025 08:20:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=; b=D9qc/VQKWsKDxhgwgjrk2zcghr
	aYVdUwJH9QMpBztsATkCl5UEN5iC7bwImIaJz15pmg0UNEarK4DiWEtDimpJ3HStxxEm2vmJrLnoC
	TSxOCreWmHA3pdc6GNBOmb5gFCSCY93dfvO5W8HxLdg9i06rxCLoK4F+geslsmAqT4LYwddKz6s2I
	oFxEIUwXS/S/x91CT527yGNJDUQDEiudhULIkA7D1mji9wW6NXitII4CBPo8Ujrqm0AZL1dFHuB4S
	LRrcSYVLODfbznWID0FvRRPQh79Hi39MFGvDcfq/nM8gALm2nO8paWp546wblkWijb7BH23vA2UOY
	pI99aKVA==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRRYP-00000003k6T-1EMd
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Jun 2025 08:20:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-23508d30142so62166055ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Jun 2025 01:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750148421; x=1750753221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=;
        b=QnJng0Mzw/DudtQd7s4jD1z9E/7wtmF1GpusuqOgRhn9P8qloKKREPjomthC+tW3jf
         GrBJzJRhgHTbuneIS4EWA1h2rafOoHznEkkLfiQX+ruKOTZd43RlVUJ/KlG2EWE1G8KL
         2quMRXI7GCpB5dRT3nW+dInp+761sNi5jAi4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148421; x=1750753221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2ul8xxfJRC/IslU3NO7LvIavTukETIYjBPpB2s1Bks=;
        b=SDiH2GXl8sYrWvv9nYON1+M8oP3/FNSVNLw580TkoWedOIoh1X/0Q318d0sNlBbFRm
         oz9lbpX+lfs1X2WlpE53M9TmFEs+w8Fhdp2+pNAO4DEUlBn4JGScbsJaUbZ0upNr8K6Q
         U0hvdu6TI9RNWk85rx0FlmFFDCrSQyTyJSa+t954YEQAVeF1SC86XbZ1d80guDXXOcYy
         n47Z+6Ov1TrHEv0nuVErCMIGQhfYo2DlluovuP4DPdoC8z7RRy+aNDj1X8wHvDi6X6Yt
         DK6R0aOIFPFAoM7wmAWXh3XL1KpPt/IdEROMA9JVxj+hR0aBxzH0PJuOdlhA0XfYTuFY
         JwvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwRuZcEy/Zme2htjdfD795+N0WsIn6P/HnDgtcgOHHfxdR298ZhydlMnWr8+Chot5YYYSydtI7DoyHZW4fLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1NwWtsJD2O8Fi685F5lqQFfxcjhQDpW70Gt4whKu+Q5H4sh3c
	2AI5bByN7wRzH3Zl2ttP9NHczHk3DMYQC8Gl1Qj+LjalwAg9vopmhZK1ZGLC8G27SQ==
X-Gm-Gg: ASbGncu44NQtvBVQuh/Nmhn2QJUfAajdiO06CsqNBmxuZp2jKOX1ICeHQsRB7fx0yLI
	ffa/JavbYNNteb47oxB8v8vZ05PyVSi5wqmoqTX81jid9aHc6V6VZhPdhRCh7j5mPn0S6/nRgEr
	aozCeFpdOtYk5VIUW76MkrmzBu6fpfiPaRkDjPUWHq7vUGKL9A7x8qfePwFt5K3DcLSb1VhAMcB
	nlL7nTODTC5iw1KMQJF6WBHAR/8x/UHYcO359HuZMd67uIC54oR8CBPIi6UD864CRXrOfmnfXMl
	f2wChQojwJrc5DCsQ2ek1MHpSZFTOU6kSJsKf40c4a3q366bd5Nx1o9rdDOz75iHxz5YFT6cXUA
	vP0cz
X-Google-Smtp-Source: AGHT+IEY70uZwkZ9fnRIDDmKpg9uBUC73hKP0ryT3ds2gfv9hOkjBFwKd6TZX/WRDjwEzvut9oH02w==
X-Received: by 2002:a17:902:da85:b0:235:ec11:f0ee with SMTP id d9443c01a7336-2366affb250mr198366645ad.14.1750148421026;
        Tue, 17 Jun 2025 01:20:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:24a1:2596:1651:13d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de781f7sm74598885ad.110.2025.06.17.01.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:20:20 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v3 5/6] arm64: dts: mediatek: mt8186: Merge Voltorb device trees
Date: Tue, 17 Jun 2025 16:20:02 +0800
Message-ID: <20250617082004.1653492-6-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
In-Reply-To: <20250617082004.1653492-1-wenst@chromium.org>
References: <20250617082004.1653492-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092025_397479_5170D5E9 
X-CRM114-Status: GOOD (  14.12  )
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

There are only two different SKUs of Voltorb, and the only difference
between them is whether a touchscreen is present or not. This can be
detected by a simple I2C transfer to the address, instead of having
separate device trees.

Merge the two device trees together and simplify the compatible string
list. The dtsi is still kept separate since there is an incoming device
that shares the same design, but with slightly difference components.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile               |  3 +--
 .../mediatek/mt8186-corsola-voltorb-sku589824.dts   | 13 -------------
 ...orb-sku589825.dts => mt8186-corsola-voltorb.dts} |  5 ++---
 3 files changed, 3 insertions(+), 18 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
 rename arch/arm64/boot/dts/mediatek/{mt8186-corsola-voltorb-sku589825.dts => mt8186-corsola-voltorb.dts} (76%)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index f68865d06edd..a8b8796276aa 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -76,8 +76,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327683.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262144.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacruel-sku262148.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589824.dtb
-dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb-sku589825.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-voltorb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku0.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
deleted file mode 100644
index d16834eec87a..000000000000
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589824.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: (GPL-2.0 OR MIT)
-/*
- * Copyright 2022 Google LLC
- */
-
-/dts-v1/;
-#include "mt8186-corsola-voltorb.dtsi"
-
-/ {
-	model = "Google Voltorb sku589824 board";
-	compatible = "google,voltorb-sku589824", "google,voltorb",
-		     "mediatek,mt8186";
-};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
similarity index 76%
rename from arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
rename to arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
index 45e57f7706cc..cc805408a8b7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb-sku589825.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dts
@@ -7,9 +7,8 @@
 #include "mt8186-corsola-voltorb.dtsi"
 
 / {
-	model = "Google Voltorb sku589825 board";
-	compatible = "google,voltorb-sku589825", "google,voltorb",
-		     "mediatek,mt8186";
+	model = "Google Voltorb board";
+	compatible = "google,voltorb", "mediatek,mt8186";
 };
 
 &i2c1 {
-- 
2.50.0.rc2.692.g299adb8693-goog


