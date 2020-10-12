Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A71EC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:22:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFB9E2076E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 11:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jS7qrcUA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LP/RlWXW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFB9E2076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZCLxr8GkkWGmRT/1ISFfk1sWMSWKI9cUmwLdsInwVDk=; b=jS7qrcUAQWHOZ1yeleRam4wnfv
	LnX2OFTgk8NwTozhAgDmy6WS3S+hXRz/1Ot+rlP0/AERbCuX95d3ujt+hvWj5cA8F3jKx/M4ciik1
	eL+ri+4pjuSmoJ2SfqSuSeS/q4J8PpWAOSEab0xNNWF7qLY2KjZ9TZa0C59jgy6peAbbskKISspVh
	GDNDTJSzJT6XGKxjXl9mJmZGxG8yobY4YcLbPqEkg0SSPrn8ukCPob7NS8owsnP7mKsJ3ct3nkP8H
	2EsQesMUq/gkOBlhjmgx0bkEh6+1XMZeCOC8e4U1D32g39PZ+Cf6+SkogsMqni40WUmZmqBxbvTpn
	bEJVXrcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRvtr-0006ad-GH; Mon, 12 Oct 2020 11:21:55 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRvtl-0006YU-B4
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 11:21:52 +0000
Received: by mail-wr1-x441.google.com with SMTP id g12so18723362wrp.10
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2020 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E+2fT5wM+IZ7ws6Rc2lCDmiMKB5AnOCmm2bmSr1dNrg=;
 b=LP/RlWXWcERt5aI6VpTOqijkZ7kCphkElXxTeY0p+mODOEgJlmcq7X3ctDuFRXDhBd
 xf94uxbwszQ1N/RlJPGQVTrxA9cXN5JQbReolAkkmKpKl7rD78q1fHCbiVBN0SUumrjI
 stzhH02E2fJh5e+sueJ7QDfJpr5+bO7NIWcLTUdv2QgssH7aH97wIPByj376Ekh1Wahd
 JORn7IE2Lpxg/RCii9rcVhk5ym1wPxOydVEYr77n0oeO/r0lNSDNF6239XR4rpPoR1Ae
 v34z/3Ib+BaChQEdRPFatO7OVv+8Kmgk1qocLboSHdDzEv53+VcSKkwJsCz2Fw5YW6Em
 l+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E+2fT5wM+IZ7ws6Rc2lCDmiMKB5AnOCmm2bmSr1dNrg=;
 b=IFQrjBCgLVFpq0hugSI8q/5J+rA5BPiQLchVcl9qoa89fQRrXR5z1AXxQJYvU7MIeX
 lQ8JUojikmwmrdwBWLXyYVYlNseakPxA7ys8wrE21EyYJiNrVD1bDefY0QamAhRsU/vw
 0ZkKFSLAd67BG/0wmWRw24DUjGsB9NUohsoV7XBz7vlb9836LRcD2V/raRgT0V00Wytx
 OaP5RIMHUQxdGfm6IVPtwkjPVRmQso/h8KPZoii3lxoA8CpwTN0pdETm9owZN3dHoaaD
 HjDCz9E2ZjtnvdZmNTbnNdLFHRN+Zt6QJ6LWpsep/3nOQtTUjyyAN+V/Vf1uBtPXw2QQ
 MsFw==
X-Gm-Message-State: AOAM531HnWQ1LYlDm1RpH8p4hSpia6TODjvAPknvE19yADVBTOhEjA3Z
 T2Xm7rAMzVFGmHb3gNzecrpy+1WRo6Wm3A==
X-Google-Smtp-Source: ABdhPJyQIhEEaWJAbTeWxA8liIvffJCGZhNc3MKWlvUOboz2e6l6gT04lGubQt34YQcPOcgbRstxpg==
X-Received: by 2002:a5d:680a:: with SMTP id w10mr30369143wru.5.1602501706529; 
 Mon, 12 Oct 2020 04:21:46 -0700 (PDT)
Received: from localhost.localdomain (170.175.185.81.rev.sfr.net.
 [81.185.175.170])
 by smtp.gmail.com with ESMTPSA id j17sm24714845wrw.68.2020.10.12.04.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 04:21:45 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, sboyd@kernel.org
Subject: [PATCH v2 RESEND 1/2] dt-bindings: clock: mediatek: add bindings for
 MT8167 clocks
Date: Mon, 12 Oct 2020 13:21:42 +0200
Message-Id: <20201012112143.368863-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_072149_389718_210747A0 
X-CRM114-Status: GOOD (  14.31  )
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
Cc: Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 masahiroy@kernel.org, krzk@kernel.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, macpaul.lin@mediatek.com, enric.balletbo@collabora.com,
 owen.chen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for topckgen, apmixedsys, infracfg, audsys,
imgsys, mfgcfg, vdecsys on MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

ChangeLog:
	V2: no changes

 .../arm/mediatek/mediatek,apmixedsys.txt      |   1 +
 .../bindings/arm/mediatek/mediatek,audsys.txt |   1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt |   1 +
 .../arm/mediatek/mediatek,infracfg.txt        |   1 +
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt |   1 +
 .../arm/mediatek/mediatek,topckgen.txt        |   1 +
 .../arm/mediatek/mediatek,vdecsys.txt         |   1 +
 include/dt-bindings/clock/mt8167-clk.h        | 131 ++++++++++++++++++
 8 files changed, 138 insertions(+)
 create mode 100644 include/dt-bindings/clock/mt8167-clk.h

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
index bd7a0fa5801b..ea827e8763de 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
@@ -15,6 +15,7 @@ Required Properties:
 	- "mediatek,mt7623-apmixedsys", "mediatek,mt2701-apmixedsys"
 	- "mediatek,mt7629-apmixedsys"
 	- "mediatek,mt8135-apmixedsys"
+	- "mediatek,mt8167-apmixedsys", "syscon"
 	- "mediatek,mt8173-apmixedsys"
 	- "mediatek,mt8183-apmixedsys", "syscon"
 	- "mediatek,mt8516-apmixedsys"
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index 38309db115f5..b32d374193c7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -11,6 +11,7 @@ Required Properties:
 	- "mediatek,mt6779-audio", "syscon"
 	- "mediatek,mt7622-audsys", "syscon"
 	- "mediatek,mt7623-audsys", "mediatek,mt2701-audsys", "syscon"
+	- "mediatek,mt8167-audiosys", "syscon"
 	- "mediatek,mt8183-audiosys", "syscon"
 	- "mediatek,mt8516-audsys", "syscon"
 - #clock-cells: Must be 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
index 1e1f00718a7d..dce4c9241932 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
@@ -12,6 +12,7 @@ Required Properties:
 	- "mediatek,mt6779-imgsys", "syscon"
 	- "mediatek,mt6797-imgsys", "syscon"
 	- "mediatek,mt7623-imgsys", "mediatek,mt2701-imgsys", "syscon"
+	- "mediatek,mt8167-imgsys", "syscon"
 	- "mediatek,mt8173-imgsys", "syscon"
 	- "mediatek,mt8183-imgsys", "syscon"
 - #clock-cells: Must be 1
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
index 49a968be1a80..eb3523c7a7be 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
@@ -16,6 +16,7 @@ Required Properties:
 	- "mediatek,mt7623-infracfg", "mediatek,mt2701-infracfg", "syscon"
 	- "mediatek,mt7629-infracfg", "syscon"
 	- "mediatek,mt8135-infracfg", "syscon"
+	- "mediatek,mt8167-infracfg", "syscon"
 	- "mediatek,mt8173-infracfg", "syscon"
 	- "mediatek,mt8183-infracfg", "syscon"
 	- "mediatek,mt8516-infracfg", "syscon"
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
index ad5f9d2f6818..054424fb64b4 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
@@ -8,6 +8,7 @@ Required Properties:
 - compatible: Should be one of:
 	- "mediatek,mt2712-mfgcfg", "syscon"
 	- "mediatek,mt6779-mfgcfg", "syscon"
+	- "mediatek,mt8167-mfgcfg", "syscon"
 	- "mediatek,mt8183-mfgcfg", "syscon"
 - #clock-cells: Must be 1
 
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
index 9b0394cbbdc9..5ce7578cf274 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
@@ -15,6 +15,7 @@ Required Properties:
 	- "mediatek,mt7623-topckgen", "mediatek,mt2701-topckgen"
 	- "mediatek,mt7629-topckgen"
 	- "mediatek,mt8135-topckgen"
+	- "mediatek,mt8167-topckgen", "syscon"
 	- "mediatek,mt8173-topckgen"
 	- "mediatek,mt8183-topckgen", "syscon"
 	- "mediatek,mt8516-topckgen"
diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
index 7894558b7a1c..98195169176a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
@@ -11,6 +11,7 @@ Required Properties:
 	- "mediatek,mt6779-vdecsys", "syscon"
 	- "mediatek,mt6797-vdecsys", "syscon"
 	- "mediatek,mt7623-vdecsys", "mediatek,mt2701-vdecsys", "syscon"
+	- "mediatek,mt8167-vdecsys", "syscon"
 	- "mediatek,mt8173-vdecsys", "syscon"
 	- "mediatek,mt8183-vdecsys", "syscon"
 - #clock-cells: Must be 1
diff --git a/include/dt-bindings/clock/mt8167-clk.h b/include/dt-bindings/clock/mt8167-clk.h
new file mode 100644
index 000000000000..a96158edd817
--- /dev/null
+++ b/include/dt-bindings/clock/mt8167-clk.h
@@ -0,0 +1,131 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 MediaTek Inc.
+ * Copyright (c) 2020 BayLibre, SAS.
+ * Author: James Liao <jamesjj.liao@mediatek.com>
+ *         Fabien Parent <fparent@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_MT8167_H
+#define _DT_BINDINGS_CLK_MT8167_H
+
+/* MT8167 is based on MT8516 */
+#include <dt-bindings/clock/mt8516-clk.h>
+
+/* APMIXEDSYS */
+
+#define CLK_APMIXED_TVDPLL		(CLK_APMIXED_NR_CLK + 0)
+#define CLK_APMIXED_LVDSPLL		(CLK_APMIXED_NR_CLK + 1)
+#define CLK_APMIXED_HDMI_REF		(CLK_APMIXED_NR_CLK + 2)
+#define MT8167_CLK_APMIXED_NR_CLK	(CLK_APMIXED_NR_CLK + 3)
+
+/* TOPCKGEN */
+
+#define CLK_TOP_DSI0_LNTC_DSICK		(CLK_TOP_NR_CLK + 0)
+#define CLK_TOP_VPLL_DPIX		(CLK_TOP_NR_CLK + 1)
+#define CLK_TOP_LVDSTX_CLKDIG_CTS	(CLK_TOP_NR_CLK + 2)
+#define CLK_TOP_HDMTX_CLKDIG_CTS	(CLK_TOP_NR_CLK + 3)
+#define CLK_TOP_LVDSPLL			(CLK_TOP_NR_CLK + 4)
+#define CLK_TOP_LVDSPLL_D2		(CLK_TOP_NR_CLK + 5)
+#define CLK_TOP_LVDSPLL_D4		(CLK_TOP_NR_CLK + 6)
+#define CLK_TOP_LVDSPLL_D8		(CLK_TOP_NR_CLK + 7)
+#define CLK_TOP_MIPI_26M		(CLK_TOP_NR_CLK + 8)
+#define CLK_TOP_TVDPLL			(CLK_TOP_NR_CLK + 9)
+#define CLK_TOP_TVDPLL_D2		(CLK_TOP_NR_CLK + 10)
+#define CLK_TOP_TVDPLL_D4		(CLK_TOP_NR_CLK + 11)
+#define CLK_TOP_TVDPLL_D8		(CLK_TOP_NR_CLK + 12)
+#define CLK_TOP_TVDPLL_D16		(CLK_TOP_NR_CLK + 13)
+#define CLK_TOP_PWM_MM			(CLK_TOP_NR_CLK + 14)
+#define CLK_TOP_CAM_MM			(CLK_TOP_NR_CLK + 15)
+#define CLK_TOP_MFG_MM			(CLK_TOP_NR_CLK + 16)
+#define CLK_TOP_SPM_52M			(CLK_TOP_NR_CLK + 17)
+#define CLK_TOP_MIPI_26M_DBG		(CLK_TOP_NR_CLK + 18)
+#define CLK_TOP_SCAM_MM			(CLK_TOP_NR_CLK + 19)
+#define CLK_TOP_SMI_MM			(CLK_TOP_NR_CLK + 20)
+#define CLK_TOP_26M_HDMI_SIFM		(CLK_TOP_NR_CLK + 21)
+#define CLK_TOP_26M_CEC			(CLK_TOP_NR_CLK + 22)
+#define CLK_TOP_32K_CEC			(CLK_TOP_NR_CLK + 23)
+#define CLK_TOP_GCPU_B			(CLK_TOP_NR_CLK + 24)
+#define CLK_TOP_RG_VDEC			(CLK_TOP_NR_CLK + 25)
+#define CLK_TOP_RG_FDPI0		(CLK_TOP_NR_CLK + 26)
+#define CLK_TOP_RG_FDPI1		(CLK_TOP_NR_CLK + 27)
+#define CLK_TOP_RG_AXI_MFG		(CLK_TOP_NR_CLK + 28)
+#define CLK_TOP_RG_SLOW_MFG		(CLK_TOP_NR_CLK + 29)
+#define CLK_TOP_GFMUX_EMI1X_SEL		(CLK_TOP_NR_CLK + 30)
+#define CLK_TOP_CSW_MUX_MFG_SEL		(CLK_TOP_NR_CLK + 31)
+#define CLK_TOP_CAMTG_MM_SEL		(CLK_TOP_NR_CLK + 32)
+#define CLK_TOP_PWM_MM_SEL		(CLK_TOP_NR_CLK + 33)
+#define CLK_TOP_SPM_52M_SEL		(CLK_TOP_NR_CLK + 34)
+#define CLK_TOP_MFG_MM_SEL		(CLK_TOP_NR_CLK + 35)
+#define CLK_TOP_SMI_MM_SEL		(CLK_TOP_NR_CLK + 36)
+#define CLK_TOP_SCAM_MM_SEL		(CLK_TOP_NR_CLK + 37)
+#define CLK_TOP_VDEC_MM_SEL		(CLK_TOP_NR_CLK + 38)
+#define CLK_TOP_DPI0_MM_SEL		(CLK_TOP_NR_CLK + 39)
+#define CLK_TOP_DPI1_MM_SEL		(CLK_TOP_NR_CLK + 40)
+#define CLK_TOP_AXI_MFG_IN_SEL		(CLK_TOP_NR_CLK + 41)
+#define CLK_TOP_SLOW_MFG_SEL		(CLK_TOP_NR_CLK + 42)
+#define MT8167_CLK_TOP_NR_CLK		(CLK_TOP_NR_CLK + 43)
+
+/* MFGCFG */
+
+#define CLK_MFG_BAXI			0
+#define CLK_MFG_BMEM			1
+#define CLK_MFG_BG3D			2
+#define CLK_MFG_B26M			3
+#define CLK_MFG_NR_CLK			4
+
+/* MMSYS */
+
+#define CLK_MM_SMI_COMMON		0
+#define CLK_MM_SMI_LARB0		1
+#define CLK_MM_CAM_MDP			2
+#define CLK_MM_MDP_RDMA			3
+#define CLK_MM_MDP_RSZ0			4
+#define CLK_MM_MDP_RSZ1			5
+#define CLK_MM_MDP_TDSHP		6
+#define CLK_MM_MDP_WDMA			7
+#define CLK_MM_MDP_WROT			8
+#define CLK_MM_FAKE_ENG			9
+#define CLK_MM_DISP_OVL0		10
+#define CLK_MM_DISP_RDMA0		11
+#define CLK_MM_DISP_RDMA1		12
+#define CLK_MM_DISP_WDMA		13
+#define CLK_MM_DISP_COLOR		14
+#define CLK_MM_DISP_CCORR		15
+#define CLK_MM_DISP_AAL			16
+#define CLK_MM_DISP_GAMMA		17
+#define CLK_MM_DISP_DITHER		18
+#define CLK_MM_DISP_UFOE		19
+#define CLK_MM_DISP_PWM_MM		20
+#define CLK_MM_DISP_PWM_26M		21
+#define CLK_MM_DSI_ENGINE		22
+#define CLK_MM_DSI_DIGITAL		23
+#define CLK_MM_DPI0_ENGINE		24
+#define CLK_MM_DPI0_PXL			25
+#define CLK_MM_LVDS_PXL			26
+#define CLK_MM_LVDS_CTS			27
+#define CLK_MM_DPI1_ENGINE		28
+#define CLK_MM_DPI1_PXL			29
+#define CLK_MM_HDMI_PXL			30
+#define CLK_MM_HDMI_SPDIF		31
+#define CLK_MM_HDMI_ADSP_BCK		32
+#define CLK_MM_HDMI_PLL			33
+#define CLK_MM_NR_CLK			34
+
+/* IMGSYS */
+
+#define CLK_IMG_LARB1_SMI		0
+#define CLK_IMG_CAM_SMI			1
+#define CLK_IMG_CAM_CAM			2
+#define CLK_IMG_SEN_TG			3
+#define CLK_IMG_SEN_CAM			4
+#define CLK_IMG_VENC			5
+#define CLK_IMG_NR_CLK			6
+
+/* VDECSYS */
+
+#define CLK_VDEC_CKEN			0
+#define CLK_VDEC_LARB1_CKEN		1
+#define CLK_VDEC_NR_CLK			2
+
+#endif /* _DT_BINDINGS_CLK_MT8167_H */
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
