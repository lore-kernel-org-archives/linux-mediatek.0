Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC79D1267A
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Dec 2025 22:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnufJVfDk1ptEUUud8fdtVXsibf/Uz5iyVkPIydfnRI=; b=pA7uCbSucPxf3LPVSbkrJrLqWD
	B2vQ+hngbDN3KURYiij+s3xFTwjvQKy41vkGomIf1QPdwM56495ick/HLu4S5UBASOzLdcos3a+R5
	TjcAq3UonyJWuxhcSZZDKp7VwZLuScioj40TRBkgJM4rdqBQhoeuav0t+kI6tFOznly8bxrPm6omJ
	rSh7WOlui/CZpIuKGR2AUhiQCGtZryNaumGv+ijwgL4JpE3mZIa7a58r59E9zgKUUhJzp4yN6v4Co
	FiQf4F7ZJmpUq0yrXsf89UyzQgiOywZpNRtmCjAHIWZ/uim+4X15bOr9TdMEG8ZKNwcN1p79O/mQI
	n+jN3onQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYn-00000005stW-3w5f;
	Tue, 02 Dec 2025 22:09:25 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYYg-00000005slF-1kkN
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Dec 2025 22:09:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477b91680f8so54369175e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Dec 2025 14:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764713357; x=1765318157; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnufJVfDk1ptEUUud8fdtVXsibf/Uz5iyVkPIydfnRI=;
        b=BmzC3uJJlzFBkmflPlProvbhk9hnvflCKxx1L8TjLZ2i5rr4bRLCqvGPLENwT22kI/
         u/VkPHF6RVLC58+X2pOcU+skoL2BLxzA5sMV/vUgYRm3rchKZWB8nVifMTZZ2P8Q18H1
         qqUi40haOUmfGpONhd1ve/I2Q0waP1LWmJ3O/m/DBFEGrYuVuBe547cR26/XfKCnRosl
         zCd6HiqcN3KkJs2Re7sG7d7Sldt33bDvvYLXiEXaWRX21vOi8kt9qBnR9H1W6wicI13l
         3WDkGXcuupRChufGm2wHJThEvGTIlOQuqV6n7RUathpz14j6zTLB6wa+sXZYKg8C4zxP
         ttgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764713357; x=1765318157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EnufJVfDk1ptEUUud8fdtVXsibf/Uz5iyVkPIydfnRI=;
        b=OxD7lstmPwtNKz5IadW5GyFRTZWHXGj5DtfLsqcg7Do6Q4xFevL0aqhU6/k6MoNSLz
         QtMnzCXesObZz/va7CSfzRLsWxe8EysUIy7q6ifZlSjz1MHjT0HPxINWsC6dY4Db4aOv
         tofibuXdZqycYwiTVYFg30FQiDNx+JSswvOjOv6SVncML7NY849WNhZ31nG79YsNasDn
         u8cidG7+mcLzJr+hzmJXV/5h4ZvL2BHxMbxDQrZA5rOLIW0qjV9B0ijohM3uFmF34WRq
         iNnradFLCvJj8ksH8RhZMfif7/fgDSpvYF7MdTyE75S5h0fCnZfamZfaRiM6fGyUKSCj
         4QSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUlI+IBaIUDpVhdOXupgp73eyL2NSxbtCw1Tml3rV2K5XLQAAFwkUD7W9YiRyihybriLCn34+bNk/91cIHnw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyD5QdU4qrtBfkPWcmHqoFYMbV+G558/dHz/17o2edNoFRhy54u
	YvMz76EHAyNdBYCY5PeLWzXZ0/wtjVwHFINEwKIePRUpX9KZa8gThw9s
X-Gm-Gg: ASbGncvP2L9PBb84YBD4cwI6TEnTcO/r6qNeHkgdrzwJiYiRFOlruDpumWiKkFLvUAn
	2Z4qOUpJJt0mmbK8UP3wBiXFc267j12/UQepY9mNjh9vNA1RQ8Y+CMyzxQamzBs4c2o+etrYJUt
	GQEJsTa1goLRwS+EWgQlFjDE7WPTjTeQxo+ZlvxKxwlKBUt4HbMCMMuIh273E75F/eRvrkCDyBH
	EnkoQD+Cv0HKDRS8GuQHwmcsOIfgfcxqL/yOeytPuqyHOBLKyu1M+OXLa1908/H7MlIfEB0xss8
	WvQTl5hoOcRim1bRLsc0j/FvaqYZrySsuWVkQqwM5rKbyqVifgqAtWz402Ok3rtWxIPHNDDxRRp
	PbGI7YU5ubJfzjKQGmyyNEHeYdS3/iBke4c3YxHThUM//wgrrnRsHC0uqW018/vC1jEl2qMz2Wn
	zj1UJcptU6PMftzsb25+HFAkGb0Q==
X-Google-Smtp-Source: AGHT+IHSDGE02fY0dReRMJgCm6advPHO2AtM2RFxT6ONrmuhjEja/3cTZ0ta85Nk/vE45Cu4bcbUZw==
X-Received: by 2002:a05:600c:1907:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-4792aef70bbmr1969675e9.15.1764713356647;
        Tue, 02 Dec 2025 14:09:16 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:d253:f5eb:2f9c:dde7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a79760esm11534795e9.3.2025.12.02.14.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 14:09:16 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 02 Dec 2025 23:08:49 +0100
Subject: [PATCH v4 4/4] arm64: dts: mediatek: add device tree for Tungsten
 700 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-review-v4-4-93f5cd2a0d4a@gmail.com>
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
In-Reply-To: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764713347; l=2289;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=H+11TnPwC+Mq+Hq6buMg0dY1uoqQ3+P7dRfzirr9Mwg=;
 b=VK9xT5IUpCpuVlUok73URtudgickTfBUXpxDjkRquEMjWHUxg4j23A2ZA/QfcjVzPPvrT3K3H
 HlxmvWkwAgiC8tcVnO7VYQ/MdWh2T6tB1Hc1eu0DP2YChYJ/o/bUeBI
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_140918_567471_DD47DD69 
X-CRM114-Status: GOOD (  12.89  )
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
[2] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
[3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>

---
Changes in v2:
- None
Changed in v3:
- None
Changed in v4:
- None
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

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


