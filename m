Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D377C30653
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 20:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWrMTbomLnOgNeY87sbYoSf5iInm7iq8TRT+e58m7zU=; b=ywWovD8kK3KvTGZUVYZhUarrAv
	sswVjb7Fk3RZmpa11NmeTWfpjCGxbJ3sb1LUOKv4yqaYdQLlFDNHEBaAoq6knwkanOoGc+NJJfoz/
	HXbgEjK4KD0geDoXTYuCjIgP5xVShuGeznTo5lGf57mAbwq/53s/J2j3+t4sYMKLG01Lo6IgljSij
	cSOo7mQiRF7OtQ1/aERAs7L6FB1LomPePtForSX9coS4SMpNhuG6RdYQDieWI4SFFgROS1+hg7+g6
	xQMl+YOMOxt0DjU4DqLcvWv0ZTbC+EUnW215vkc6OnAxIOTyRSRPhAA5YlznP7tN/Zva1aZVYfCrd
	5ZCnTHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMZC0-00000008CHg-1xU8;
	Wed, 26 Jun 2024 20:24:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMZBu-00000008CEU-2iIC;
	Wed, 26 Jun 2024 20:24:34 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-424ad991c1cso13711625e9.1;
        Wed, 26 Jun 2024 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719433469; x=1720038269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tWrMTbomLnOgNeY87sbYoSf5iInm7iq8TRT+e58m7zU=;
        b=XEVN9X2Oh3WYbC9PZ1+eEnVi+zyAvz25wD3ALywC67vDNKhhpM2m1eGHQfrBug8KoA
         MbSxI95WKRwXBpxU4CnmXY7jKv8B5/oKb57eVQcBiZdpGSGDcYU2KNzvZHMZeKjv1D+c
         hiELiC+ehm9TtjXne9lmLAY0HNa1BEkmbJ+6UcmIQ9MijnAceEYvkerWjpmhxESXl7/z
         o3gVMU3GuhVgN0nw8Mw/yFoVrDuLoHOz+/LxYqF00gcqiCU25kK/rI40ATnsP9cO6yU4
         3c0o8vo7EE/Qp/6Rb2oijHBZtbjT2d81aIftnzf1ZTURgfhbOKniSa3WwPhJIhAAbG8i
         vbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719433469; x=1720038269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWrMTbomLnOgNeY87sbYoSf5iInm7iq8TRT+e58m7zU=;
        b=cBLyWwuTZcOefY70/xxDjLRuC943cAO2fH66eSPlwLPAsmDwDIgQIIiZ74ixBCxoVb
         Ig3l76fB15treRhYvyH3+9PmJ9orFfZfb1pn8kMXG9Kf0DNzHUA1dxhGAsu1rAsRiA6T
         HtXyPJFW+1Wx//3bsWQa3NTOLm8zI3IPEXRvUP9OeeEI9z9PbcLQUYztQNVBrxKoTwES
         Ul9jGN5aGSIAt5ps0xARUFawNgkT0s2BdWHDSmjLYDLAz6EU8+7cJshO7xOoqniFI4fe
         cg8fX1QWo96Y+46oDUhia2xhFhtTBMmgnCTurUYh16WPq35nkqVCgBqRmvI5T8/IArSY
         3rxg==
X-Forwarded-Encrypted: i=1; AJvYcCW/KGcZpl64YChAUZO1/tRnNr7S8dsmsxNXGoL0KL9qzCOwuiH/HuK5QezacsKv8pFTR91Jsv+aCGVHxWzQ9oJHqoqbkbfVEbiutHWHeYwx7j+nxH8/+UgAaLOqa9uaT+idz5gtRVYZyGI4j7ztw/IZzwzjFR/tZvk=
X-Gm-Message-State: AOJu0YxrqXh/a86FJuhQ88zr2P5t1ItyGIwzWjrNw4GQeiLFe/Rn+5NF
	DJMHAG0ub//4nDKbl5/LMfdWM6wNbJ7hp8XfxRdPrwub2TPZugHI
X-Google-Smtp-Source: AGHT+IG/W9ltBmUm9E1ZiZTKLJWKJKMSNjJcvpLrwkrHp/P7uVFcXIE3fWuHZPG6Os44lkA1/uPlpQ==
X-Received: by 2002:a7b:c3d7:0:b0:424:ab89:1106 with SMTP id 5b1f17b1804b1-424ab891275mr34210125e9.19.1719433468583;
        Wed, 26 Jun 2024 13:24:28 -0700 (PDT)
Received: from localhost.localdomain ([105.235.128.80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a2f8268sm16630315f8f.79.2024.06.26.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 13:24:28 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>,
	jason-ch chen <Jason-ch.Chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: clock: Add MediaTek MT6735 clock and reset bindings
Date: Wed, 26 Jun 2024 21:24:04 +0100
Message-ID: <20240626202406.846961-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240626202406.846961-1-y.oudjana@protonmail.com>
References: <20240626202406.846961-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_132430_825994_CB176C04 
X-CRM114-Status: GOOD (  18.70  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add DT bindings for for the main clock and reset controllers of MT6735
(apmixedsys, topckgen, infracfg and pericfg).

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 .../arm/mediatek/mediatek,infracfg.yaml       |  8 +-
 .../arm/mediatek/mediatek,pericfg.yaml        |  1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |  4 +-
 .../bindings/clock/mediatek,topckgen.yaml     |  4 +-
 MAINTAINERS                                   | 12 +++
 .../clock/mediatek,mt6735-apmixedsys.h        | 16 ++++
 .../clock/mediatek,mt6735-infracfg.h          | 25 ++++++
 .../clock/mediatek,mt6735-pericfg.h           | 37 +++++++++
 .../clock/mediatek,mt6735-topckgen.h          | 79 +++++++++++++++++++
 .../reset/mediatek,mt6735-infracfg.h          | 31 ++++++++
 .../reset/mediatek,mt6735-pericfg.h           | 31 ++++++++
 11 files changed, 243 insertions(+), 5 deletions(-)
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-topckgen.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
index 230b5188a88db..8e3bc240bafd9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
@@ -11,9 +11,10 @@ maintainers:
 
 description:
   The Mediatek infracfg controller provides various clocks and reset outputs
-  to the system. The clock values can be found in <dt-bindings/clock/mt*-clk.h>,
-  and reset values in <dt-bindings/reset/mt*-reset.h> and
-  <dt-bindings/reset/mt*-resets.h>.
+  to the system. The clock values can be found in <dt-bindings/clock/mt*-clk.h>
+  and <dt-bindings/clock/mediatek,mt*-infracfg.h>, and reset values in
+  <dt-bindings/reset/mt*-reset.h>, <dt-bindings/reset/mt*-resets.h> and
+  <dt-bindings/reset/mediatek,mt*-infracfg.h>.
 
 properties:
   compatible:
@@ -22,6 +23,7 @@ properties:
           - enum:
               - mediatek,mt2701-infracfg
               - mediatek,mt2712-infracfg
+              - mediatek,mt6735-infracfg
               - mediatek,mt6765-infracfg
               - mediatek,mt6795-infracfg
               - mediatek,mt6779-infracfg_ao
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
index 33c94c491828e..7fa2dc9bb6b9c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.yaml
@@ -20,6 +20,7 @@ properties:
           - enum:
               - mediatek,mt2701-pericfg
               - mediatek,mt2712-pericfg
+              - mediatek,mt6735-pericfg
               - mediatek,mt6765-pericfg
               - mediatek,mt6795-pericfg
               - mediatek,mt7622-pericfg
diff --git a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
index 685535846cbb7..ba66287fac68b 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description:
   The Mediatek apmixedsys controller provides PLLs to the system.
-  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h>
+  and <dt-bindings/clock/mediatek,mt*-apmixedsys.h>.
 
 properties:
   compatible:
@@ -34,6 +35,7 @@ properties:
           - enum:
               - mediatek,mt2701-apmixedsys
               - mediatek,mt2712-apmixedsys
+              - mediatek,mt6735-apmixedsys
               - mediatek,mt6765-apmixedsys
               - mediatek,mt6779-apmixedsys
               - mediatek,mt6795-apmixedsys
diff --git a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
index bdf3b55bd56fd..c080fb0a16181 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml
@@ -12,7 +12,8 @@ maintainers:
 
 description:
   The Mediatek topckgen controller provides various clocks to the system.
-  The clock values can be found in <dt-bindings/clock/mt*-clk.h>.
+  The clock values can be found in <dt-bindings/clock/mt*-clk.h> and
+  <dt-bindings/clock/mediatek,mt*-topckgen.h>.
 
 properties:
   compatible:
@@ -31,6 +32,7 @@ properties:
           - enum:
               - mediatek,mt2701-topckgen
               - mediatek,mt2712-topckgen
+              - mediatek,mt6735-topckgen
               - mediatek,mt6765-topckgen
               - mediatek,mt6779-topckgen
               - mediatek,mt6795-topckgen
diff --git a/MAINTAINERS b/MAINTAINERS
index e2d8fdda1737c..8a62cc391eab9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14217,6 +14217,18 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
 F:	drivers/mmc/host/mtk-sd.c
 
+MEDIATEK MT6735 CLOCK & RESET DRIVERS
+M:	Yassine Oudjana <y.oudjana@protonmail.com>
+L:	linux-clk@vger.kernel.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
+F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
+F:	include/dt-bindings/clock/mediatek,mt6735-pericfg.h
+F:	include/dt-bindings/clock/mediatek,mt6735-topckgen.h
+F:	include/dt-bindings/reset/mediatek,mt6735-infracfg.h
+F:	include/dt-bindings/reset/mediatek,mt6735-pericfg.h
+
 MEDIATEK MT76 WIRELESS LAN DRIVER
 M:	Felix Fietkau <nbd@nbd.name>
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h b/include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
new file mode 100644
index 0000000000000..3dda719fd5d53
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_APMIXEDSYS_H
+#define _DT_BINDINGS_CLK_MT6735_APMIXEDSYS_H
+
+#define ARMPLL				0
+#define MAINPLL				1
+#define UNIVPLL				2
+#define MMPLL				3
+#define MSDCPLL				4
+#define VENCPLL				5
+#define TVDPLL				6
+#define APLL1				7
+#define APLL2				8
+
+#endif
diff --git a/include/dt-bindings/clock/mediatek,mt6735-infracfg.h b/include/dt-bindings/clock/mediatek,mt6735-infracfg.h
new file mode 100644
index 0000000000000..a42be76c778d1
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-infracfg.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_INFRACFG_H
+#define _DT_BINDINGS_CLK_MT6735_INFRACFG_H
+
+#define CLK_DBG				0
+#define CLK_GCE				1
+#define CLK_TRBG			2
+#define CLK_CPUM			3
+#define CLK_DEVAPC			4
+#define CLK_AUDIO			5
+#define CLK_GCPU			6
+#define CLK_L2C_SRAM			7
+#define CLK_M4U				8
+#define CLK_CLDMA			9
+#define CLK_CONNMCU_BUS			10
+#define CLK_KP				11
+#define CLK_APXGPT			12
+#define CLK_SEJ				13
+#define CLK_CCIF0_AP			14
+#define CLK_CCIF1_AP			15
+#define CLK_PMIC_SPI			16
+#define CLK_PMIC_WRAP			17
+
+#endif
diff --git a/include/dt-bindings/clock/mediatek,mt6735-pericfg.h b/include/dt-bindings/clock/mediatek,mt6735-pericfg.h
new file mode 100644
index 0000000000000..72401f009176a
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-pericfg.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_PERICFG_H
+#define _DT_BINDINGS_CLK_MT6735_PERICFG_H
+
+#define CLK_DISP_PWM			0
+#define CLK_THERM			1
+#define CLK_PWM1			2
+#define CLK_PWM2			3
+#define CLK_PWM3			4
+#define CLK_PWM4			5
+#define CLK_PWM5			6
+#define CLK_PWM6			7
+#define CLK_PWM7			8
+#define CLK_PWM				9
+#define CLK_USB0			10
+#define CLK_IRDA			11
+#define CLK_APDMA			12
+#define CLK_MSDC30_0			13
+#define CLK_MSDC30_1			14
+#define CLK_MSDC30_2			15
+#define CLK_MSDC30_3			16
+#define CLK_UART0			17
+#define CLK_UART1			18
+#define CLK_UART2			19
+#define CLK_UART3			20
+#define CLK_UART4			21
+#define CLK_BTIF			22
+#define CLK_I2C0			23
+#define CLK_I2C1			24
+#define CLK_I2C2			25
+#define CLK_I2C3			26
+#define CLK_AUXADC			27
+#define CLK_SPI0			28
+#define CLK_IRTX			29
+
+#endif
diff --git a/include/dt-bindings/clock/mediatek,mt6735-topckgen.h b/include/dt-bindings/clock/mediatek,mt6735-topckgen.h
new file mode 100644
index 0000000000000..a771910a4b8a6
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-topckgen.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_TOPCKGEN_H
+#define _DT_BINDINGS_CLK_MT6735_TOPCKGEN_H
+
+#define AD_SYS_26M_CK			0
+#define CLKPH_MCK_O			1
+#define DMPLL				2
+#define DPI_CK				3
+#define WHPLL_AUDIO_CK			4
+
+#define SYSPLL_D2			5
+#define SYSPLL_D3			6
+#define SYSPLL_D5			7
+#define SYSPLL1_D2			8
+#define SYSPLL1_D4			9
+#define SYSPLL1_D8			10
+#define SYSPLL1_D16			11
+#define SYSPLL2_D2			12
+#define SYSPLL2_D4			13
+#define SYSPLL3_D2			14
+#define SYSPLL3_D4			15
+#define SYSPLL4_D2			16
+#define SYSPLL4_D4			17
+#define UNIVPLL_D2			18
+#define UNIVPLL_D3			19
+#define UNIVPLL_D5			20
+#define UNIVPLL_D26			21
+#define UNIVPLL1_D2			22
+#define UNIVPLL1_D4			23
+#define UNIVPLL1_D8			24
+#define UNIVPLL2_D2			25
+#define UNIVPLL2_D4			26
+#define UNIVPLL2_D8			27
+#define UNIVPLL3_D2			28
+#define UNIVPLL3_D4			29
+#define MSDCPLL_D2			30
+#define MSDCPLL_D4			31
+#define MSDCPLL_D8			32
+#define MSDCPLL_D16			33
+#define VENCPLL_D3			34
+#define TVDPLL_D2			35
+#define TVDPLL_D4			36
+#define DMPLL_D2			37
+#define DMPLL_D4			38
+#define DMPLL_D8			39
+#define AD_SYS_26M_D2			40
+
+#define AXI_SEL				41
+#define MEM_SEL				42
+#define DDRPHY_SEL			43
+#define MM_SEL				44
+#define PWM_SEL				45
+#define VDEC_SEL			46
+#define MFG_SEL				47
+#define CAMTG_SEL			48
+#define UART_SEL			49
+#define SPI_SEL				50
+#define USB20_SEL			51
+#define MSDC50_0_SEL			52
+#define MSDC30_0_SEL			53
+#define MSDC30_1_SEL			54
+#define MSDC30_2_SEL			55
+#define MSDC30_3_SEL			56
+#define AUDIO_SEL			57
+#define AUDINTBUS_SEL			58
+#define PMICSPI_SEL			59
+#define SCP_SEL				60
+#define ATB_SEL				61
+#define DPI0_SEL			62
+#define SCAM_SEL			63
+#define MFG13M_SEL			64
+#define AUD1_SEL			65
+#define AUD2_SEL			66
+#define IRDA_SEL			67
+#define IRTX_SEL			68
+#define DISPPWM_SEL			69
+
+#endif
diff --git a/include/dt-bindings/reset/mediatek,mt6735-infracfg.h b/include/dt-bindings/reset/mediatek,mt6735-infracfg.h
new file mode 100644
index 0000000000000..5d24c7a1317f8
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-infracfg.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_INFRACFG_H
+#define _DT_BINDINGS_RESET_MT6735_INFRACFG_H
+
+#define RST_EMI_REG			0
+#define RST_DRAMC0_AO			1
+#define RST_AP_CIRQ_EINT		3
+#define RST_APXGPT			4
+#define RST_SCPSYS			5
+#define RST_KP				6
+#define RST_PMIC_WRAP			7
+#define RST_CLDMA_AO_TOP		8
+#define RST_EMI				16
+#define RST_CCIF			17
+#define RST_DRAMC0			18
+#define RST_EMI_AO_REG			19
+#define RST_CCIF_AO			20
+#define RST_TRNG			21
+#define RST_SYS_CIRQ			22
+#define RST_GCE				23
+#define RST_M4U				24
+#define RST_CCIF1			25
+#define RST_CLDMA_TOP_PD		26
+#define RST_CBIP_P2P_MFG		27
+#define RST_CBIP_P2P_APMIXED		28
+#define RST_CBIP_P2P_CKSYS		29
+#define RST_CBIP_P2P_MIPI		30
+#define RST_CBIP_P2P_DDRPHY		31
+
+#endif
diff --git a/include/dt-bindings/reset/mediatek,mt6735-pericfg.h b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
new file mode 100644
index 0000000000000..90ee8ed8923fd
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_PERICFG_H
+#define _DT_BINDINGS_RESET_MT6735_PERICFG_H
+
+#define RST_UART0			0
+#define RST_UART1			1
+#define RST_UART2			2
+#define RST_UART3			3
+#define RST_UART4			4
+#define RST_BTIF			6
+#define RST_DISP_PWM_PERI		7
+#define RST_PWM				8
+#define RST_AUXADC			10
+#define RST_DMA				11
+#define RST_IRDA			12
+#define RST_IRTX			13
+#define RST_THERM			16
+#define RST_MSDC2			17
+#define RST_MSDC3			17
+#define RST_MSDC0			19
+#define RST_MSDC1			20
+#define RST_I2C0			22
+#define RST_I2C1			23
+#define RST_I2C2			24
+#define RST_I2C3			25
+#define RST_USB				28
+
+#define RST_SPI0			33
+
+#endif
-- 
2.45.1


