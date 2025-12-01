Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB69CD116F9
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 08:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynOlGYR5qfFrdaiqwTIEwtb0mOltRrTgTI60G2801Ag=; b=dfFBhyeCkqvYIrTc+vnAuzfS2V
	YS7WXbk1RDqXHSMg62yp7M8u4e0j57KdYTKpnzIFj4WWa9Epm5w0iEnpcN3y1H+DrbUs2BuCiUkRf
	8vhnbMpFEL5KP+LLOTQPUy8gLxWL6ZXtJxBnklh8qu3eZ2P9gUo77WwJaZt8QxXvA6mns7rNUnPJC
	pwfOEQK3vNC09pNWXzMEdo/RETtyuVYNw6fk7MLM9YLARxtC02weWPZW2pBqMlra8GgEUE7JbUVyh
	2z6P6dW94OSPF0EN7G+HvFCxxiLIn/e6hTqZ8D6ZZghqDVrTMAyEBlIK+Frbm4Ny5Pf07ZeY2+BOh
	ub/uiDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzU0-000000038Eq-00zy;
	Mon, 01 Dec 2025 08:42:08 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPzTs-0000000385k-2RYd
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 08:42:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so21135755e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 00:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578508; x=1765183308; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynOlGYR5qfFrdaiqwTIEwtb0mOltRrTgTI60G2801Ag=;
        b=DRt2+wAXGqkbWWdFAuAphOmOLVdtKDynsSYf7Y64nrgjw2g917GCLN60P33if0F+SR
         1L7EhNfy0L2g9+6XdSCc8UlwiBajr1IGW36JyoRxbXOPmumreUkOS4dJEEEoyKv0NSJG
         Frt1JBshmUk+cRKm5UNS9CDePDD7AUKc1ElRguevPFw1MOJ894o2GpV2P1hCAg/426ji
         96UalfH4Y9ddzI557vRac71gbFtfHb8IK2dhGfj/yNKlGU2rV8YMA8Kea1+05NCsDdAx
         vUA8vzxjddmVGYL1BtGb0WO3l88XvcVjrhJpSYZjtt05nEAXldxNs/KLgAub/SklGDoZ
         Lxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578508; x=1765183308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ynOlGYR5qfFrdaiqwTIEwtb0mOltRrTgTI60G2801Ag=;
        b=wQPi/Ri6rYWazLTDneCoIaLBXZrWjFcEvXXfc4T721bd9eK5sNMb/mbxkKCp1reImH
         Hb2Y5RUioCkEsMXkc++T4P1ihXDkWL0vPTxu3dn1e/m7YT4FLrxizpQHUsNhBlUsKadC
         otOm9HJ/Appnj9EV1BveLJngqv4u3UN/3jdvNX99vBMXNZo8PdAtTOiDhdA2HAw+nOe/
         Ibfj/HKNsSqHcmeSk0sHB8+pE4PEJrImASX5QgJJ4swoZR//qRgh+4rDSFozd9NsaMR4
         SRjBZbF+FcaS+V5jVNGnJxu79oMUKT/o/PSPf6nSDURwgxezPPZCX5jFRPd60yp4BJAB
         8Esg==
X-Forwarded-Encrypted: i=1; AJvYcCWPquHuV9+JUEZMasp/9oZ0P2BNlzg3lkieHK2LpXti5T9rABM55qEnT2MfCnyFogkKTrOtj4hBZ214VpztTg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYz7EaxwdSUn2NgzPCG8/HoV5BBNho/tSr2EFO+iL8W0kuK0zj
	ablPaBJKaptIcOz2ozU7BWixPQpRSNLV36ZM4RhPXRd2OEDh6DLHZgoju39hxB7M
X-Gm-Gg: ASbGncvSM4oIkyKisKDucCpyMfvACd8Wwdi1iwqtIvMKMo9AAKevNmsEh3DMXIe8eH9
	QUwRaV+PI3/ufqzr1T49doGB4MEbMfFSMfWeatrKb3gsG4kDkn5/t+Kg2s/VlssGQ+rD9ULGfgv
	i+n9Y0yiXFzdymOLGb8eay5kIf5RX8mYBP2klbJbrpUspyhvSwDNAfwT3D4NFU9ezOpDQXLmBTO
	2dMH6X5HC4hGXWP7FjKDClZtLk60dtuBQ82VFGYlFG3LhfPwLGDgqEWkqxab4ROldb8qeRN67UO
	JnZIG0shVGqeTV5xCHaDGW6ra0moUa7CrLXFJ3ihgfQwx9oKYzHr7EOnHfDEf1bWbl0MHNXRKJ3
	DGUHdGNtMP8HlethlxCPTl2hEUhGPWqQc0905Y2L1ptpiNjkIf1UXfTIyLKEoxKtVM/lo34AWnG
	T4sB79xrpd4BQAgE+VVi0=
X-Google-Smtp-Source: AGHT+IECSZOOzFpRsQBwV4DiBbIBy+ZguLwshUjKK6DnwndqMxwWnIHiJCXqyIrDr0xEJyjk5tiDww==
X-Received: by 2002:a05:600c:468c:b0:477:79f8:daa8 with SMTP id 5b1f17b1804b1-477c01b219amr386219315e9.17.1764578508035;
        Mon, 01 Dec 2025 00:41:48 -0800 (PST)
Received: from owl5.. ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca1a4bbsm24186087f8f.21.2025.12.01.00.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 00:41:47 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Gary Bisson <bisson.gary@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH 5/5] arm64: dts: mediatek: add device tree for Tungsten 700 board
Date: Mon,  1 Dec 2025 09:41:40 +0100
Message-ID: <20251201084140.376058-6-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251201084140.376058-1-bisson.gary@gmail.com>
References: <20251201084140.376058-1-bisson.gary@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_004201_797030_261456DA 
X-CRM114-Status: GOOD (  12.92  )
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

Add device tree to support Ezurio Tungsten 700 (MT8390) SMARC SOM [1] +
Universal SMARC carrier board [2].
It includes support for the MIPI-DSI BD070LIC3 display which uses the
Tianma TM070JDHG30 panel + TI SN65DSI84 MIPI-DSI to LVDS bridge [3].

[1] https://www.ezurio.com/product/tungsten700-smarc
[2]
https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
[3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
Cc: angelogioacchino.delregno@collabora.com
Cc: robh@kernel.org
Cc: krzk+dt@kernel.org
Cc: conor+dt@kernel.org
Cc: matthias.bgg@gmail.com
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    | 22 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 30d169a31b10..85f338344dd3 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -102,6 +102,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-tungsten-smarc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-tungsten-smarc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
new file mode 100644
index 000000000000..f1cf2821107f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2025 Ezurio LLC
+ * Author: Gary Bisson <bisson.gary@gmail.com>
+ */
+/dts-v1/;
+#include "mt8188.dtsi"
+#include "mt83x0-tungsten-smarc.dtsi"
+
+/ {
+	model = "Ezurio Tungsten700 SMARC (MT8390)";
+	compatible = "ezurio,mt8390-tungsten-smarc", "mediatek,mt8390",
+		     "mediatek,mt8188";
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
-- 
2.43.0


