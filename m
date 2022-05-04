Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006C3C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=raCMnZAc/AL7AgROmsudzNTLmrjt35CzXwXet6KvN2M=; b=aPxAtJk/oJUyvL
	SQoDtW9ioMReFGP3oxlJKcKC5KgdvgCep+zMr+f82FHHXEPKpNWsDjUWm6isLsO3+sJ9TV1wW58DU
	9A7LwS32WljGU9EpZIOkZlZcGWqFKMLbEuFx/BHS+txuAZKI/8r/5CgJkliWwX8UBWlL911onmTGh
	aZJS6fKkjkC9/Wq9+Rox8tSegXJINMlrPkHkhxlXCa39+N0F6AVe9KtudQduC3NRwSahJ7pXs+slm
	M5Udfx6msj+eI+rVlLsWyYgRGpnJG6ciWrG66xgeE3mv8LEuJ0ZQ5PKUzQabvZ3Jc6940snYblfXZ
	cswaki5VM3M3EYitQ8qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEB2-00Aj6k-Tf; Wed, 04 May 2022 12:32:20 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEB0-00Aj5n-C7; Wed, 04 May 2022 12:32:19 +0000
Received: by mail-ed1-x529.google.com with SMTP id z19so1509441edx.9;
 Wed, 04 May 2022 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=feVPqZbXWnpb3N/y0AoA7sANpQB5abG1IWtWghTvC7c=;
 b=f/BDfAnFci77f7zvNZEPiUh4aRBPSfzQCGEAHsx87VEjsBNnb2J6kJmoWM9mJvrTDQ
 2ua1vZGa4N7WiaM+m0VfiJVlH4GS4IKdeuGRXz72zrgYMXfGfwAAt32Gh3ka2aA2MhH+
 oFPoEYj82+9V9sRwFVbnHvMU7Xddq2g0nSLILP3e1YVlIpqxjheVPX+JTzCijY5SwPNE
 SAggvmTa/1+NaI/tv1BdIF/ZcEnw1JsBR497GQ0jOMv5Vzt9L/0NE8wUSohm2n8vKvvu
 iR5+PrcJPUQJyBlGFiKLgdMuCFLrqO+LU/DxPhOytnVH2wGn8PRpRK7KDgVPpQS1emta
 KdbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=feVPqZbXWnpb3N/y0AoA7sANpQB5abG1IWtWghTvC7c=;
 b=EQfqitURq+AG8IRcPlHc4wkSc07Gq+NYmdpfV5dECadtKdV03ejTRDkd9yX0lG1e4n
 QYFhQrqqGnpDMz0nQ+I0rLxEaLRwxkupZztxhI7YXa9rjRtSVioPT70enrLC+fL8a3el
 x4w2kogtFvgpg2s8osxYTAHxPsernafrZvqG5eiKzYxPeZFLTiVxcLTj+RYLcp9YPsaH
 /pVbdiUWsa5IJTPweLFjwJon1l6ACnPcuN3EVs2AlHiOmh9TqnGSgkjX3pBpAtgANTPk
 6rxLREm0MlpbX9UFx5Tp3l9CKYy9ncVXIZ6DskogZ9DQT4HLgQqaWPbpNOXwG4YJmgR/
 ZfZA==
X-Gm-Message-State: AOAM533Lxqk0sP2ZdloSfY1Rt75rrWMAGTwbgDCsgPv1xaobxEPzAjD9
 PW+42oIUz4IFiRrooBpNBFg=
X-Google-Smtp-Source: ABdhPJzF/xNiYH5RLr578pwt9gXMLQWyM5ygScC+vwVJu5AX1YUsz3Lhe5rNjNLzOScV3cV50bHHYg==
X-Received: by 2002:a05:6402:27cc:b0:427:b593:62ef with SMTP id
 c12-20020a05640227cc00b00427b59362efmr17610475ede.409.1651667537015; 
 Wed, 04 May 2022 05:32:17 -0700 (PDT)
Received: from localhost.localdomain
 (185-177-124-12.hosted-by-worldstream.net. [185.177.124.12])
 by smtp.gmail.com with ESMTPSA id
 ig1-20020a1709072e0100b006f3ef214e7asm5688693ejc.224.2022.05.04.05.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:32:16 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 02/13] dt-bindings: reset: Add MT6735 reset bindings
Date: Wed,  4 May 2022 16:25:51 +0400
Message-Id: <20220504122601.335495-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504122601.335495-1-y.oudjana@protonmail.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_053218_470937_B9E1EC73 
X-CRM114-Status: GOOD (  14.66  )
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
---
 MAINTAINERS                                   |  2 ++
 .../reset/mediatek,mt6735-infracfg.h          | 31 +++++++++++++++++++
 .../reset/mediatek,mt6735-pericfg.h           | 31 +++++++++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e917039b9d8c..de15c3d50d2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12446,6 +12446,8 @@ F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
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
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
