Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F66C48BCD
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 02:39:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F119261410
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 02:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F119261410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=stSiEVGiIdSV/NYi8AVJQYKv7ot3w2/oIeaQjBrXmvQ=; b=LKLDp6jCHn41Sn
	FD49G7CCnP1EmkPLjZbXSHEgbVBMTSpI9/PWyvHIneDf/11M2ccUmj2Cdy8zKmxckj2gVRF/No47G
	bv9VD/VVX/AwNqT4FNp1FTSxQLIsm36r8oU378vBCuqL4GUH2Hy2LWOp8ZKBLMgb5PoXKt5M3bQnm
	+xLRr5TssQCbSNX1pfaF/LYh6niA/K5LF2uQ293mPrImv3ufdK4o+hB4Vfl/pLPsSH1U7TaEx2DUf
	C3iyLSnt/JQ7Y4T28xcXF8uCqeugTAQDW3ISJcx3SED4V7OxUu+pFD81K4FXzbZ0B2WNziE4jL2fG
	AK7SlHfTVXemN1s1Go9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrAax-00GTcg-Vo; Thu, 10 Jun 2021 02:39:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrAab-00GTVA-MX; Thu, 10 Jun 2021 02:38:39 +0000
X-UUID: 49c50f4ba9b0436c857af7984d56e07a-20210609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=AwyxGnoAu543CZOjB1qDRMRpiSDkBEbLs/wandh+CnI=; 
 b=ZfONWEvnFyOhGVvNWxRnOHDDM/WMMWZZIbkJO6MMuILLKQMvKWzbhQke19Nb2tUkQwqbHBbrLjejR6sIE0FW1p9NdEjtG1HVJ+4U5RC88MXAA9hesp/l4XjeZqPuEw3kNr6t+Ac1H5bzVRvJhPNcHfSTPvbnoi2iLQq6r/feYb4=;
X-UUID: 49c50f4ba9b0436c857af7984d56e07a-20210609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1195954948; Wed, 09 Jun 2021 19:38:37 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Jun 2021 19:38:35 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 10:38:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 10 Jun 2021 10:38:33 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, chun-jie.chen
 <chun-jie.chen@mediatek.com>
Subject: [PATCH 2/3] dt-bindings: power: Add MT8195 power domains
Date: Thu, 10 Jun 2021 10:36:13 +0800
Message-ID: <20210610023614.5375-3-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210610023614.5375-1-chun-jie.chen@mediatek.com>
References: <20210610023614.5375-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_193837_766798_A049EF31 
X-CRM114-Status: GOOD (  13.42  )
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

From: "chun-jie.chen" <chun-jie.chen@mediatek.com>

Add power domains dt-bindings for MT8195.

Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
---
 .../power/mediatek,power-controller.yaml      |  2 +
 include/dt-bindings/power/mt8195-power.h      | 51 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8195-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index f234a756c193..d6ebd77d28a7 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -27,6 +27,7 @@ properties:
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
       - mediatek,mt8192-power-controller
+      - mediatek,mt8195-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -64,6 +65,7 @@ patternProperties:
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
+              "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
         maxItems: 1
 
       clocks:
diff --git a/include/dt-bindings/power/mt8195-power.h b/include/dt-bindings/power/mt8195-power.h
new file mode 100644
index 000000000000..43fd36e1f538
--- /dev/null
+++ b/include/dt-bindings/power/mt8195-power.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8195_POWER_H
+#define _DT_BINDINGS_POWER_MT8195_POWER_H
+
+#define MT8195_POWER_DOMAIN_PCIE_MAC_P0		0
+#define MT8195_POWER_DOMAIN_PCIE_MAC_P1		1
+#define MT8195_POWER_DOMAIN_PCIE_PHY		2
+#define MT8195_POWER_DOMAIN_SSUSB_PCIE_PHY	3
+#define MT8195_POWER_DOMAIN_CSI_RX_TOP		4
+#define MT8195_POWER_DOMAIN_ETHER		5
+#define MT8195_POWER_DOMAIN_ADSP		6
+#define MT8195_POWER_DOMAIN_AUDIO		7
+#define MT8195_POWER_DOMAIN_AUDIO_ASRC		8
+#define MT8195_POWER_DOMAIN_NNA			9
+#define MT8195_POWER_DOMAIN_NNA0		10
+#define MT8195_POWER_DOMAIN_NNA1		11
+#define MT8195_POWER_DOMAIN_MFG0		12
+#define MT8195_POWER_DOMAIN_MFG1		13
+#define MT8195_POWER_DOMAIN_MFG2		14
+#define MT8195_POWER_DOMAIN_MFG3		15
+#define MT8195_POWER_DOMAIN_MFG4		16
+#define MT8195_POWER_DOMAIN_MFG5		17
+#define MT8195_POWER_DOMAIN_MFG6		18
+#define MT8195_POWER_DOMAIN_VPPSYS0		19
+#define MT8195_POWER_DOMAIN_VDOSYS0		20
+#define MT8195_POWER_DOMAIN_VPPSYS1		21
+#define MT8195_POWER_DOMAIN_VDOSYS1		22
+#define MT8195_POWER_DOMAIN_DP_TX		23
+#define MT8195_POWER_DOMAIN_EPD_TX		24
+#define MT8195_POWER_DOMAIN_HDMI_TX		25
+#define MT8195_POWER_DOMAIN_HDMI_RX		26
+#define MT8195_POWER_DOMAIN_WPESYS		27
+#define MT8195_POWER_DOMAIN_VDEC0		28
+#define MT8195_POWER_DOMAIN_VDEC1		29
+#define MT8195_POWER_DOMAIN_VDEC2		30
+#define MT8195_POWER_DOMAIN_VENC		31
+#define MT8195_POWER_DOMAIN_VENC_CORE1		32
+#define MT8195_POWER_DOMAIN_IMG			33
+#define MT8195_POWER_DOMAIN_DIP			34
+#define MT8195_POWER_DOMAIN_IPE			35
+#define MT8195_POWER_DOMAIN_CAM			36
+#define MT8195_POWER_DOMAIN_CAM_RAWA		37
+#define MT8195_POWER_DOMAIN_CAM_RAWB		38
+#define MT8195_POWER_DOMAIN_CAM_MRAW		39
+
+#endif /* _DT_BINDINGS_POWER_MT8195_POWER_H */
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
