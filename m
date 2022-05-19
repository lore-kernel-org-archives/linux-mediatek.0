Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C945C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WRdhYc/DU6QJk3repe3iRw69p+uB2lvg19fSykpYbg=; b=ooWmPhgHEqPPuN
	eTe5iYnyz3r/niqSnleIaxKnjNazwWUslC30mao1FirYc2Ks6tJTiPE0xGnOqQ6ITNmZewGcpGLhZ
	z+aD9COFYyUSCRYBTwN28IXsvEpyxwraNzBR/EYw5fWIMMn3MK6i5w+c545wNbzK64pS/QRGANb8d
	88RthxKJQEsRpqJpkvgd2XCNZa8K+tZKS/LbUFw9+TwAxo1ZKlvHV1JYZcjcfdGgBHsEbUP4OaM7V
	jL/x4xBqSxOBpaZRkQFj7FXm9XR2kwrQm1TRauRW/xfxQdZ8ah5QzrGKQsegFTI3feIc6iMv4qXkL
	5gSKX8Hdony+h3iqDnfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhp4-007mj8-30; Thu, 19 May 2022 15:12:18 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrh4f-007OH9-PY; Thu, 19 May 2022 14:24:23 +0000
Received: by mail-qv1-xf33.google.com with SMTP id dm17so4706463qvb.2;
 Thu, 19 May 2022 07:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/F1u/RnNvoSA5Fg84LsZu/d0EEbrb1hnUkkpK7Edzrk=;
 b=FHsawpHykc055tRH2+HvevhWPIukCAcHue8zJygAKob7t8ucVvvdXBmgcJN07r0thP
 ojaGiV2ycq+q/opTKNIuHFf18i0iUZMsjsS8CqrEUwFEnlW130W6f8Eyw8wumLjrM2wO
 l2f21/PGYyjZITV1es+WcwgNMOAiqaALUydqevrS2w02O9ttnInXoymmHW7j9bgO+Eit
 sP6GyviQW1vVWPS/1lqBNsK//9qCQfcemYkx8D1ur4Iur/t0BuOrZA/jd+l19vo7VWQv
 DF8Ifw9VAHnqr7y6oXj2s4uGOZOkFaJkeaHu1aBPuplzpnYf56hQGS5n5Ds11+I8oWEw
 Z2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/F1u/RnNvoSA5Fg84LsZu/d0EEbrb1hnUkkpK7Edzrk=;
 b=OMjvezLbtsGtkZZ5HPpuk5XbNS0fe5NSMp5Ix2YVwFE/vhrSOpxBfzsH1ovmaZ323I
 H/im1Xu1lYH7NbYlshpLR57m8P4ePJ5f/3QDyeIVaJGiRxJtu529BWifKOL9QZKbhllb
 8EVjU0wJd7RvzHCTfCD8wLRp4lTVQnS6iWssn7CHCUHS+7pZCx/0g6soEr6KBSVqSBmT
 5JXQBdyXgQDdrH0D7ix5axhJpfXFe3hEv/OCra7nIGkixN7JWXivUYiNNHEHelCVEXNf
 TLc84a1ZDp7kuH7tKZQuz1mUEc8R9r+vw04yjTbuA5gfXzYoVioWpPysUnvHSZuuaH9P
 cunA==
X-Gm-Message-State: AOAM5321CCb+fPnNlfmNrxDi4e4XpTCTeW9hv7yel19fttN7FPf95JdX
 YmES7mW2fmA8grR2Rnwpvl4=
X-Google-Smtp-Source: ABdhPJwE5m/Py9T4+bhXUWHIeIFP3YAlsSzC0KWD4LbPYUa0sn3pNxKup3C9qwGpQHmEFnzA1rdEtw==
X-Received: by 2002:ad4:49b1:0:b0:461:f0fb:685 with SMTP id
 u17-20020ad449b1000000b00461f0fb0685mr4198310qvx.22.1652970259763; 
 Thu, 19 May 2022 07:24:19 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 c15-20020ac85a8f000000b002f39b99f697sm1539342qtc.49.2022.05.19.07.24.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:24:19 -0700 (PDT)
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
Subject: [PATCH v2 2/4] dt-bindings: reset: Add MT6735 reset bindings
Date: Thu, 19 May 2022 18:22:09 +0400
Message-Id: <20220519142211.458336-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519142211.458336-1-y.oudjana@protonmail.com>
References: <20220519142211.458336-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_072421_948602_4861C5D2 
X-CRM114-Status: GOOD (  14.51  )
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

Add reset definitions for Mediatek MT6735 resets provided by
infracfg and pericfg.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS                                   |  2 ++
 .../reset/mediatek,mt6735-infracfg.h          | 31 +++++++++++++++++++
 .../reset/mediatek,mt6735-pericfg.h           | 31 +++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a59069263cfb..1c0af554a7b6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12503,6 +12503,8 @@ F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
 F:	include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 F:	include/dt-bindings/clock/mediatek,mt6735-topckgen.h
+F:	include/dt-bindings/reset/mediatek,mt6735-infracfg.h
+F:	include/dt-bindings/reset/mediatek,mt6735-pericfg.h
 
 MEDIATEK MT76 WIRELESS LAN DRIVER
 M:	Felix Fietkau <nbd@nbd.name>
diff --git a/include/dt-bindings/reset/mediatek,mt6735-infracfg.h b/include/dt-bindings/reset/mediatek,mt6735-infracfg.h
new file mode 100644
index 000000000000..86448f946568
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-infracfg.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RST_MT6735_INFRACFG_H
+#define _DT_BINDINGS_RST_MT6735_INFRACFG_H
+
+#define EMI_REG_RST			0
+#define DRAMC0_AO_RST			1
+#define AP_CIRQ_EINT_RST		3
+#define APXGPT_RST			4
+#define SCPSYS_RST			5
+#define KP_RST				6
+#define PMIC_WRAP_RST			7
+#define CLDMA_AO_TOP_RST		8
+#define EMI_RST				16
+#define CCIF_RST			17
+#define DRAMC0_RST			18
+#define EMI_AO_REG_RST			19
+#define CCIF_AO_RST			20
+#define TRNG_RST			21
+#define SYS_CIRQ_RST			22
+#define GCE_RST				23
+#define MM_IOMMU_RST			24
+#define CCIF1_RST			25
+#define CLDMA_TOP_PD_RST		26
+#define CBIP_P2P_MFG			27
+#define CBIP_P2P_APMIXED		28
+#define CBIP_P2P_CKSYS			29
+#define CBIP_P2P_MIPI			30
+#define CBIP_P2P_DDRPHY			31
+
+#endif
diff --git a/include/dt-bindings/reset/mediatek,mt6735-pericfg.h b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
new file mode 100644
index 000000000000..6cdfaa7ddadf
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RST_MT6735_PERICFG_H
+#define _DT_BINDINGS_RST_MT6735_PERICFG_H
+
+#define UART0_SW_RST			0
+#define UART1_SW_RST			1
+#define UART2_SW_RST			2
+#define UART3_SW_RST			3
+#define UART4_SW_RST			4
+#define BTIF_SW_RST			6
+#define DISP_PWM_SW_RST			7
+#define PWM_SW_RST			8
+#define AUXADC_SW_RST			10
+#define DMA_SW_RST			11
+#define IRDA_SW_RST			12
+#define IRTX_SW_RST			13
+#define THERM_SW_RST			16
+#define MSDC2_SW_RST			17
+#define MSDC3_SW_RST			17
+#define MSDC0_SW_RST			19
+#define MSDC1_SW_RST			20
+#define I2C0_SW_RST			22
+#define I2C1_SW_RST			23
+#define I2C2_SW_RST			24
+#define I2C3_SW_RST			25
+#define USB_SW_RST			28
+
+#define SPI0_SW_RST			33
+
+#endif
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
