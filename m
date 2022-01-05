Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1BC5C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvDiTNcHTO0KhnnHUomeHFH7uQQZ1sLzpPK9QdTntQE=; b=0iP1YyujM0lvxN
	wtpyKtYmVIG62nNSYYGUlSuKQjYJ7HHaLlRyW3W2qiLpz/+m+n5nUlx9Orhx4ybi7u4fAOS4AqSmF
	qqizOMvaaf92njIduBXP98ytofUVY5if+pgBcONRagluj0Ejm+uZra2E8JLV2HnnN21+liqNiMx0M
	lnW6E/ZLpcI4CJjfW8fR4u7pfPMwiEpLgUwa8MpaJD8afBgGvAQCRqSOKYE4U/aAbID1LhwwK5LaE
	yHoqkH9hTDCVeKBZtkLej1Mu3pCvqgiedcSGkLA3lPwM6LCE2ctEUumi3joO6HSsifLQj9OUs1s/p
	UUxHGyBjNnTBZQjUhRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n53IR-00ETol-Op; Wed, 05 Jan 2022 10:13:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n53I5-00ETgY-VF; Wed, 05 Jan 2022 10:13:11 +0000
X-UUID: e47d062d431f437684b1d8028033e39b-20220105
X-UUID: e47d062d431f437684b1d8028033e39b-20220105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2112997605; Wed, 05 Jan 2022 03:13:08 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 02:05:45 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 5 Jan 2022 18:05:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 Jan 2022 18:05:43 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Ryder Lee
 <ryder.lee@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 1/2] dt-bindings: reset: mt7986: Add reset-controller header
 file
Date: Wed, 5 Jan 2022 18:04:55 +0800
Message-ID: <20220105100456.7126-2-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220105100456.7126-1-sam.shih@mediatek.com>
References: <20220105100456.7126-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_021310_038656_5762F99B 
X-CRM114-Status: GOOD (  12.13  )
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

Add infracfg, toprgu, and ethsys reset-controller header file
for MT7986 platform.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>
---
 include/dt-bindings/reset/mt7986-resets.h | 55 +++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 include/dt-bindings/reset/mt7986-resets.h

diff --git a/include/dt-bindings/reset/mt7986-resets.h b/include/dt-bindings/reset/mt7986-resets.h
new file mode 100644
index 000000000000..af3d16c81192
--- /dev/null
+++ b/include/dt-bindings/reset/mt7986-resets.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Sam Shih <sam.shih@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT7986
+#define _DT_BINDINGS_RESET_CONTROLLER_MT7986
+
+/* INFRACFG resets */
+#define MT7986_INFRACFG_PEXTP_MAC_SW_RST	6
+#define MT7986_INFRACFG_SSUSB_SW_RST		7
+#define MT7986_INFRACFG_EIP97_SW_RST		8
+#define MT7986_INFRACFG_AUDIO_SW_RST		13
+#define MT7986_INFRACFG_CQ_DMA_SW_RST		14
+
+#define MT7986_INFRACFG_TRNG_SW_RST		17
+#define MT7986_INFRACFG_AP_DMA_SW_RST		32
+#define MT7986_INFRACFG_I2C_SW_RST		33
+#define MT7986_INFRACFG_NFI_SW_RST		34
+#define MT7986_INFRACFG_SPI0_SW_RST		35
+#define MT7986_INFRACFG_SPI1_SW_RST		36
+#define MT7986_INFRACFG_UART0_SW_RST		37
+#define MT7986_INFRACFG_UART1_SW_RST		38
+#define MT7986_INFRACFG_UART2_SW_RST		39
+#define MT7986_INFRACFG_AUXADC_SW_RST		43
+
+#define MT7986_INFRACFG_APXGPT_SW_RST		66
+#define MT7986_INFRACFG_PWM_SW_RST		68
+
+#define MT7986_INFRACFG_SW_RST_NUM		69
+
+/* TOPRGU resets */
+#define MT7986_TOPRGU_APMIXEDSYS_SW_RST		0
+#define MT7986_TOPRGU_SGMII0_SW_RST		1
+#define MT7986_TOPRGU_SGMII1_SW_RST		2
+#define MT7986_TOPRGU_INFRA_SW_RST		3
+#define MT7986_TOPRGU_U2PHY_SW_RST		5
+#define MT7986_TOPRGU_PCIE_SW_RST		6
+#define MT7986_TOPRGU_SSUSB_SW_RST		7
+#define MT7986_TOPRGU_ETHDMA_SW_RST		20
+#define MT7986_TOPRGU_CONSYS_SW_RST		23
+
+#define MT7986_TOPRGU_SW_RST_NUM		24
+
+/* ETHSYS Subsystem resets */
+#define MT7986_ETHSYS_FE_SW_RST			6
+#define MT7986_ETHSYS_PMTR_SW_RST		8
+#define MT7986_ETHSYS_GMAC_SW_RST		23
+#define MT7986_ETHSYS_PPE0_SW_RST		30
+#define MT7986_ETHSYS_PPE1_SW_RST		31
+
+#define MT7986_ETHSYS_SW_RST_NUM		32
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT7986 */
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
