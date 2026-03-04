Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5699AEFCE3D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsB+Xdpfe1keNrhw/zldpf6GnRg/8hjm+EhbmvXeiAs=; b=a3G4WbTAHcD0rYrBj+ssVpdEvg
	+332gbpQ5LAGYzUtlOzA6UGw9IRnpkR8d0t1UsybRoSF/eXrKG5sa35MhTEtFT5FAAtwODfO11bvq
	iFfQ8duFqfDVFMDyET63e3GwWFrS6TOxSBAA9Xj5zIk/r7lw3yddErhqKRQX2uyd7sjegqTEm0AgG
	7SYR+cCvc0/Pm19eFvRNlZHcVj50FYC701qwfmQ9snDgvKbNvnqAhYlcVZoet6BOSpWgScukX/ujH
	8dmTdYXflurc7Pld/9QNrPTIpzpQ/CCtGH+L68OB7ND2j4AVRDKp4Sq91aClgEmyX1kP05S5PCVrU
	2F6ilsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpv-00000000OaU-1hMx;
	Wed, 04 Mar 2026 19:24:47 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrps-00000000OX3-2aTD
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 19:24:45 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-827390e8a3cso4716076b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 11:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652284; x=1773257084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsB+Xdpfe1keNrhw/zldpf6GnRg/8hjm+EhbmvXeiAs=;
        b=a7GzRMPpDI46axdGHqWx5Xabzj1aB8HO7D+kuXmOND54Id83UetwSHxTI9g7IXla2D
         wNUyqh/Lea/GbpN0m7yeZ0HKLYELj5V7zV9uHpqpLS5/WXfkq4GglYJ7Au4c3V0P57nX
         2mB2Emf3RXAzWzxV2l5LGhfppeGbgmKR+EHiGF4WuWQ98MzowvHxVa+kUhkUmZI/sg39
         EbwSQ1yiP3TwPzwQ58DcvfpT0GQ2QA0favNinkQ+KJQOnvGbDF3lE5P7XNOZkxVa2/IW
         ZJOnm7ZO1GrIzI/vhFUvvZyjuxFJFGSX5kWfSmUm1HIX7hi9Tqfjd/rL9xVeEuiK6lMR
         YzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652284; x=1773257084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FsB+Xdpfe1keNrhw/zldpf6GnRg/8hjm+EhbmvXeiAs=;
        b=E9EWOS7gyNONfcxjms0SH1f/Gx68Vm5sTwXa4YEXXfPogq/K1kMalzwunLZ4MForD9
         u3YKLBR4bzrT7TFWKcwsmwMb7lUfI902l4VvHSKOjmATaQ0EcbcaYOmTZngPxACHP8xs
         VprCBRiRAwegBdKmR5E8PWfisT/ImZyJO97QIFOHEmAoX3SIZCLBp3jQMBLxc8SnXgtP
         NnkiSzkaYFO4Ru1OkNW1amOYnXXh9SJdraGtaB1kvK3kUyKtrlDrb8BTs+VYwcZ5L16y
         HiygOEsvYV3eNc184/73XOv0dwvnc6IMA5vYDLJoIndVNkd/gAzNWyEZVwzSXJAwvZy3
         Z8lg==
X-Forwarded-Encrypted: i=1; AJvYcCUddMML3CSkYoDs0yM3YeUowcgppmPNUnYl8kSRraL/Uvl4rxkrR7MxduM4WJKTFSms2k7oZ1mr+gzJODtmRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylcY6E0JlCFeqoWwlxAa/F5NStd/M2dLgzfSniCqs5a4e7zL6V
	FEkF89bYZWe+niQWOCpQDsyy3v1oHlYjmOBR5jl2KypcB5itlwHhZFWg
X-Gm-Gg: ATEYQzzcUvstaPywSYI2p0bRuQetGurPfbklyXWugBrBc/eJyMimBgTLz82c91Lz244
	FCXKI4VxlmaSSuPLfSopM1WRYoA2zjx1gUh4HdkrwLdF/HUlkSr3FNVlKGA9CRkg/a3c/8bO4Pt
	PFU2WqpWRSNfCRMfdxQiYUr5BViu4e+Cytg9C/EMw69cQu0FS4yBljESCbf37XnIYSOrOs9H2kT
	I+IdqdQeyTA5vbnL2lSS20QJB0OPuEeqWe6jiAYHvdBiYMiH6o9o/GWJAD1YCgN7+lpcqqu2uPA
	DePpMRFpr/M/B/P2qEfveZ9MhU4qQUCHzO0AbU/qgT+C8Fc/SKqRCNzbs+TWRqEoc45st7laDnW
	+2gAtdApZn2J0ww4+s8OPrktAn1B2XsDJhr/MuG2fJ3O+6vBIVvjltxxoBHCtuT23S+rx9sneSi
	9Nu+9aLAyHkylibAIo4tl4w/yRNgnrL4fHt9FIXoDLEF/UR/YYllI71udEfsGUGfxPCq+vXwrSn
	Dzlkg8=
X-Received: by 2002:a05:6a00:3004:b0:826:ccfd:282e with SMTP id d2e1a72fcca58-8295d8447e8mr5694658b3a.2.1772652283484;
        Wed, 04 Mar 2026 11:24:43 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm20233563b3a.16.2026.03.04.11.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:43 -0800 (PST)
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
Subject: [PATCH 2/2] arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F
Date: Thu,  5 Mar 2026 04:24:17 +0900
Message-ID: <20260304192417.818211-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304192417.818211-1-akkun11.open@gmail.com>
References: <20260304192417.818211-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_112444_648059_D7418E3B 
X-CRM114-Status: GOOD (  15.49  )
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

Lenovo YOGA Tablet 10 (Wi-Fi) - B8000-F is a tablet which belongs
to the "blade" product family. It is powered by MT8125 SoC,
which is the tablet version of MediaTek MT6589, and has 1GB RAM.

Like other devices in the "blade" family, it uses a framebuffer
initialized by the bootloader at a consistent memory address and size.
This patch adds basic support including UART and simple-framebuffer.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 +++++++
 .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 39 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi

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
index 000000000000..2a83e023d2f2
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+#include "mt6589-lenovo-blade.dtsi"
+
+/ {
+	model = "Lenovo YOGA Tablet 10 (Wi-Fi)";
+	compatible = "lenovo,b8000-f", "lenovo,blade", "mediatek,mt6589";
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi b/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
new file mode 100644
index 000000000000..99af92539e93
--- /dev/null
+++ b/arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright (c) 2026 Akari Tsuyukusa <akkun11.open@gmail.com>
+ */
+
+/dts-v1/;
+#include "mt6589.dtsi"
+
+/ {
+	compatible = "lenovo,blade", "mediatek,mt6589";
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
+	memory@0x80000000 {
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
2.52.0


