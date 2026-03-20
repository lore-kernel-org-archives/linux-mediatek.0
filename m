Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4023A108B8F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 10:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hR/3Iy9Wlowf1KzCMFQLQDZRWz2rtZK8yylHv0B+bZY=; b=X8ya24rFoaUsN2s1VhxREcm4HS
	ujPmgcxFVZU/uEWaQEbjtcZeYXvKgBrKyk4C6CroA7R92ojb6c/SKAI+jZWpUJa9aSsoeL8Ld7hjG
	HF53Mxg6rXj/3C4/B3kHnyJccFNkMt4IXwP/hHV6JbIP9k3eYsoa4Vgf1YaXRQ/s7SIgX+ZCrEkPE
	/Ig5J9pomAJnEzXI/FFDztWyUuj6RU6gRPdES2RSjpOoQa8PUDdS/OiieMQwQGdd7f3Ne4Bka0047
	tymrRlgW8Tl15Tm+muUAxA1LTylG1rEsvy4T4xUaTSno++4PdNAPXr9+J6o2h5MWuREJCsetZ9sUM
	2J7OGWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYw-0000000CezL-1DK8;
	Fri, 20 Mar 2026 10:58:42 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3XYu-0000000Cexf-26cl
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 10:58:41 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2addb31945aso11555575ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774004320; x=1774609120; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hR/3Iy9Wlowf1KzCMFQLQDZRWz2rtZK8yylHv0B+bZY=;
        b=LyeL/ZWcaC9ErB5JvzLdhueHd7Nt1K8XRbxn+Ul3QakWSbRcrCWONbtfOiwh8cV8aA
         06GoiehqsVTZNUFGM2b1Ce7WSGRfyycdv9DiaGxWdwcBN9RHeA24GFHcDUUZZb9jWWWg
         /nwelk0OliBTP9tlG7SDJuR1hTzsivKJLZ+tqhsRE2IntUNeX6kHrdflZR9jYNJkptC9
         8a274phbJEZ4NFq5+i26m20xKiFLgH4pTRy2WyNoev8symkraebUfGmIMkfLqRH2/JYt
         KPs0DTFQgXRph/z5vNsviSJmZY7LngVuSnyEAhlrd/f9PY4V19WkTZPVzLZV6I68/wia
         9Eow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774004320; x=1774609120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hR/3Iy9Wlowf1KzCMFQLQDZRWz2rtZK8yylHv0B+bZY=;
        b=RnIWD6M9ZSQwMKCxhEtl+mm9Pf3fWazf7UCcUpj/z1GNJy9fxcHeUe6lcBK62fo0ag
         54/THIAdN/CkJvRi/kCX70ip7YyMh5tfFFYl9T5WqEyC1Do1oF6w4RsXiI/Ik2du57FG
         jj8SAe3Kdrlen7Zr+3f0mYSavZ0tv9uKnzFWfEH19lLNC6bVFEau6Tj1g13tQy9uj6tv
         NH+5tBOMtfZ6rOeJQiDq4sVelkCc/4HUZDk1l7DPuZKVW4qBdprmJQJk51xIG6zvR72v
         TJ7rCTazjHSl129JURYo5L0f5pOn1/4STrGazSTcmwD/8G5L8yPg7GHGhdaeWeqJTbs5
         PuIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJWZWcLwE2wGU7m9NUj9y8jkQtLDuHyPVt9nT1jimbXfSYcR4OF4S35s8Wa3Mo+SkKqXDG+dpXt1fq28DYXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxN77TuGfLa5ytRsX/ubMzNFl+0Ia07Q6CTh8ZErrXGtJgZrL63
	ml5wkOaSN60DQaKY5GAro6bFlBzyMTZjJ5WFk+M8UJmnIxKs9xpVprIX
X-Gm-Gg: ATEYQzw61ysG1klHaQXvXWpd7uiYJBe5Eor/rq/Fq8Ocu3ZK8nUdiA+UtmGvv3iiQxG
	vMUbxY3uWyDkBBwam5aod5KGofMC6avgEAKeWlsM7TigJbppek0ghBX4EwQ2sdMJIuMgaooO/wC
	GriF5hBd3GnI327EvxoztfhGc2P25QSbu4jyQBaCDANSoh6vwC5YSleHGZ1vbQNdWdOAzu329HJ
	VyRbfNc1AMmXeUDkhEdHorY90mYaSKRhpfbxgYx9aQxgfNuGTeDHYst4Aukjl8gnZfzCl5p2Zzd
	2zzABcVTRXlF7DfVDeg/WXvK/fkYIaxNhK1GqoW+hdb7u/aDS2QCuK3j+uSKdlDn4MHv7jGF6DR
	X/jMCsionNu2iU1GBtmf1u65kjA9NVl50EoPh6A/BmGYHY6821VY6NT/vWHnYSM90v0+CeJH7qo
	B82c2MqSWJsxxH42z73bfre69o50i+ClERyW419jC0rZcChDUWC4WT3bTr7RuPmZvCtDSrOOy5c
	D0MDho=
X-Received: by 2002:a17:902:c950:b0:2b0:60f1:de58 with SMTP id d9443c01a7336-2b0827d1a18mr23865375ad.45.1774004319672;
        Fri, 20 Mar 2026 03:58:39 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516eacsm25636405ad.15.2026.03.20.03.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 03:58:39 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v3 2/2] arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F
Date: Fri, 20 Mar 2026 19:58:22 +0900
Message-ID: <20260320105822.447337-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320105822.447337-1-akkun11.open@gmail.com>
References: <20260320105822.447337-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_035840_550195_8ED8E2F7 
X-CRM114-Status: GOOD (  16.33  )
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

Lenovo YOGA Tablet 10 (Wi-Fi) - B8000-F is a tablet from the "blade"
product family. It is powered by MediaTek MT8125 SoC, (a tablet variant
of MT6589), and features 1GB of RAM.

The "blade" family consists of several variants based on screen size
and connectivity:
- YOGA Tablet 8 (8"): B6000-F (Wi-Fi), B6000-H/HV (3G)
- YOGA Tablet 10 (10"): B8000-F (Wi-Fi), B8000-H (3G)

This patch adds basic support, including a simple-framebuffer that
uses the panel already initialized by the bootloader.

While many parts of this Device Tree are expected to be common across
other "blade" family boards, they are kept within the B8000-F specific
file for now as it is the only supported device.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
Changes in v3
- Drop UART node
  It was probably correct, but I'm not sure and haven't tested it
  so I removed it.
- Remove "mt6589-lenovo-blade.dtsi"
  There are currently no plans to add support for variants other
  than b8000-f, and the Device Tree is also small and there is no point
  in dividing it, so I deleted it and merged it
  into "mt6589-lenovo-b8000-f.dts"

 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts

diff --git a/arch/arm/boot/dts/mediatek/Makefile b/arch/arm/boot/dts/mediatek/Makefile
index 37c4cded0eae..b67b94b7cbd0 100644
--- a/arch/arm/boot/dts/mediatek/Makefile
+++ b/arch/arm/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
 	mt6582-prestigio-pmt5008-3g.dtb \
 	mt6589-aquaris5.dtb \
 	mt6589-fairphone-fp1.dtb \
+	mt6589-lenovo-b8000-f.dtb \
 	mt6592-evb.dtb \
 	mt7623a-rfb-emmc.dtb \
 	mt7623a-rfb-nand.dtb \
diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts b/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
new file mode 100644
index 000000000000..b1f622ecf6fd
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+/dts-v1/;
+#include "mt6589.dtsi"
+
+/ {
+	model = "Lenovo YOGA Tablet 10 (Wi-Fi)";
+	compatible = "lenovo,b8000-f", "mediatek,mt6589";
+
+	chosen {
+		framebuffer0: framebuffer@bf600000 {
+			compatible = "simple-framebuffer";
+			memory-region = <&framebuffer_reserved>;
+			width = <1280>;
+			height = <800>;
+			stride = <(1280 * 2)>;
+			format = "r5g6b5";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		ranges;
+
+		framebuffer_reserved: memory@bf600000{
+			reg = <0xbf600000 0xa00000>;
+			no-map;
+		};
+	};
+};
-- 
2.53.0


