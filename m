Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03975C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nu/GyWGPzhGRnLpDBjd0L2P2RQXHWY3LpT8n2Ru61K4=; b=A/1BklrQz16hNa
	c7UL4aDNUa6Aq7fLO+cNTjrZEeo59bqZmtnZVTHjThV+CpShVtuvgMgt1dzXRv0QwsbmoXvxxVneU
	zFgQm0BaT8nRNMRi8VTxG8tt1tqwFwG7xrIEYyNc5hT0hP/4c12pfAP39LRr4310XdO7vyxIrRLWn
	5OPv5ppzuTsJ6C5OesFwOwBBWrCEW2KLiGJ48VaTEM8YJF5BO/I4qooS0Vtqpiz8t32S6yqs9fDfU
	kSa0eRM5liSehaCkcyEO2ZEkCVATRYMA7/ekvCS/zFSryLlMELwL8t+SKN0KHdLHg6yGipKYKbIMl
	PF0GhWvbn5nkCLvgofqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhnx-007lzp-2N; Thu, 19 May 2022 15:11:09 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrh4V-007OAW-Ve; Thu, 19 May 2022 14:24:14 +0000
Received: by mail-qk1-x72e.google.com with SMTP id i68so3574866qke.11;
 Thu, 19 May 2022 07:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AoC9q7cvfnd7EIJadA1kEw/o8A7aPnNrZiatZkduF8M=;
 b=W2c8prILdEbbbVv9PLjE1Lr42AbeD7zvhQVZfzqttwrWO4tIXnFiddS4Z1SUC8utkf
 3aowIUXgl22vr8eOMVw642BGCDDS+OzljTFEXw7gigyIe1DLTNXxMxqz1cUuVQm4Uuij
 WYlHb4R9SyjqddO9oBpiNP7S46UmiEyXVBCH4BBVx+m7bhLRzONoLcB+pEBMLKa/zLHQ
 NfvdZcRsYXRb4VJqAx5Xn+A9phoLzkcaBT2ZnvBwjYHFO1VMj0KJj2bL0BQIDfqW/w+9
 Y/qA5AcIVvtRAJWKXyy8CHOY5SrNnJoW//tqYL3zWzCcSt5592yeIxzQBBqdrGnAS+R2
 n2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AoC9q7cvfnd7EIJadA1kEw/o8A7aPnNrZiatZkduF8M=;
 b=8QlwpJ1TLlu9l8oXmylyPW7+wA7jLWG8X8YcJjMm6csLgNHU51Z1ijDaRmT638XRfX
 bI/xHZajaYXLRn828q/+5Xy8KJ32c/HUrh+nntiPgZu+A6BwvwP1bTZmRJHOGjAw92ui
 Ft+u5d/YJqsEXRMye9ulJ+FaHyFiaJPwnewOHsKzkTAz1MnjvExYxZEHTYE1spI0xmbG
 ASjCgj4E+geo98ZKQ6CQqsX26lvQXMYeTEzF9BX9ez9Ci01cp6GTZZBN9ZGxwpYK8jo9
 dP6dBVmaRe6MKsJTSHL+4IhRQdjUOt7L73aNKiiUij+n6zUcgpZuTD8U3eQt4XLIDWrM
 kLrA==
X-Gm-Message-State: AOAM530DR+yXf0SPTqp1NNmyfLCiLbjTalLKhOwOIgg2v7mdxW0P+z1e
 ZUmm3qgdV1gHoDgFb/Pr9G4=
X-Google-Smtp-Source: ABdhPJyY2Jlww0kNaOXMHCPJbz7OaTbwMLNHERG4ccYfF60NPojhO4W5NyBfkEbYnlotM9w1NNVIEQ==
X-Received: by 2002:a05:620a:3724:b0:6a0:162e:48c0 with SMTP id
 de36-20020a05620a372400b006a0162e48c0mr3188348qkb.720.1652970248835; 
 Thu, 19 May 2022 07:24:08 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 c15-20020ac85a8f000000b002f39b99f697sm1539342qtc.49.2022.05.19.07.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:24:08 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add Mediatek MT6735 clock bindings
Date: Thu, 19 May 2022 18:22:08 +0400
Message-Id: <20220519142211.458336-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519142211.458336-1-y.oudjana@protonmail.com>
References: <20220519142211.458336-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_072412_214006_C7989DBE 
X-CRM114-Status: GOOD (  15.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add clock definitions for Mediatek MT6735 clocks provided by
apmixedsys, topckgen, infracfg and pericfg.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS                                   | 10 +++
 .../clock/mediatek,mt6735-apmixedsys.h        | 16 ++++
 .../clock/mediatek,mt6735-infracfg.h          | 25 ++++++
 .../clock/mediatek,mt6735-pericfg.h           | 37 +++++++++
 .../clock/mediatek,mt6735-topckgen.h          | 79 +++++++++++++++++++
 5 files changed, 167 insertions(+)
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-topckgen.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6516f9c6d28e..a59069263cfb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12494,6 +12494,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
 F:	drivers/mmc/host/mtk-sd.c
 
+MEDIATEK MT6735 CLOCK DRIVERS
+M:	Yassine Oudjana <y.oudjana@protonmail.com>
+L:	linux-clk@vger.kernel.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
+F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
+F:	include/dt-bindings/clock/mediatek,mt6735-pericfg.h
+F:	include/dt-bindings/clock/mediatek,mt6735-topckgen.h
+
 MEDIATEK MT76 WIRELESS LAN DRIVER
 M:	Felix Fietkau <nbd@nbd.name>
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h b/include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
new file mode 100644
index 000000000000..3dda719fd5d5
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
index 000000000000..979a174ff8b6
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-infracfg.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_INFRACFG_H
+#define _DT_BINDINGS_CLK_MT6735_INFRACFG_H
+
+#define DBGCLK				0
+#define GCE				1
+#define TRBG				2
+#define CPUM				3
+#define DEVAPC				4
+#define AUDIO				5
+#define GCPU				6
+#define L2C_SRAM			7
+#define M4U				8
+#define CLDMA				9
+#define CONNMCU_BUS			10
+#define KP				11
+#define APXGPT				12
+#define SEJ				13
+#define CCIF0_AP			14
+#define CCIF1_AP			15
+#define PMIC_SPI			16
+#define PMIC_WRAP			17
+
+#endif
diff --git a/include/dt-bindings/clock/mediatek,mt6735-pericfg.h b/include/dt-bindings/clock/mediatek,mt6735-pericfg.h
new file mode 100644
index 000000000000..16f3c6a9a772
--- /dev/null
+++ b/include/dt-bindings/clock/mediatek,mt6735-pericfg.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_CLK_MT6735_PERICFG_H
+#define _DT_BINDINGS_CLK_MT6735_PERICFG_H
+
+#define DISP_PWM			0
+#define THERM				1
+#define PWM1				2
+#define PWM2				3
+#define PWM3				4
+#define PWM4				5
+#define PWM5				6
+#define PWM6				7
+#define PWM7				8
+#define PWM				9
+#define USB0				10
+#define IRDA				11
+#define APDMA				12
+#define MSDC30_0			13
+#define MSDC30_1			14
+#define MSDC30_2			15
+#define MSDC30_3			16
+#define UART0				17
+#define UART1				18
+#define UART2				19
+#define UART3				20
+#define UART4				21
+#define BTIF				22
+#define I2C0				23
+#define I2C1				24
+#define I2C2				25
+#define I2C3				26
+#define AUXADC				27
+#define SPI0				28
+#define IRTX				29
+
+#endif
diff --git a/include/dt-bindings/clock/mediatek,mt6735-topckgen.h b/include/dt-bindings/clock/mediatek,mt6735-topckgen.h
new file mode 100644
index 000000000000..a771910a4b8a
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
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
