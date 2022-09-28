Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 558E7C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 08:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3txHfYx6L/pUnyaXZi6QKUFvMFtdde5IzAgob7S44Rk=; b=EwqIEa/vPq4ZnG26tM9JhDzwNL
	L8BvBBTjdhvb/F5AkO1m55gmDhp/0JPaF6HEi6xkeLQF5Cnp29MZTg4g7ZZ7kvGepBqzEUbrmMeEK
	bhE/3zfDBOAU/yA4DnVIr6BwL+wAkrPDuL69ZfX27Vuzw1jAFOnqUffMH3QTVO8QK4NlpbopCgai5
	kwrh19vi8SP1GAfScKeGR4hv2zXqXSRFfoFSNtSeGjmDzBrg55NpPhpaWirj752KLdKqJDS45C9VS
	VL7pjBWUSx+MJnJYYUHIHHuq/hbFHdbyVGPSjv/ACOm94PuZUkhisylQSv/0MLJtDLQvh75vDKrWz
	Qev4UiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSfV-00ExqK-EB; Wed, 28 Sep 2022 08:43:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odSfQ-00Exkr-Vb; Wed, 28 Sep 2022 08:43:46 +0000
X-UUID: 3058d4c5aff54f18bc51bb38caa5018d-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=3txHfYx6L/pUnyaXZi6QKUFvMFtdde5IzAgob7S44Rk=;
	b=Va//lpnpiKZqLgiEgw3ONtljbSrfNruR3UVPFMVGSmCFsWNDkjRYHzDXx1eCjfiBPxUM3QAGvBG5fxBzYdgH8LyB14KcFMS8XapmZA18A5MgnoTWm9z586ATgsRZWm9dQ4zCUtgFMMgLk70uZLfe1XtvZtni+YVNvhJreZQ95cs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:360d4371-afed-4556-a03b-a53b7a2f1fc3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:84ad4c07-1cee-4c38-b21b-a45f9682fdc0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3058d4c5aff54f18bc51bb38caa5018d-20220928
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 537679682; Wed, 28 Sep 2022 01:43:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 28 Sep 2022 16:43:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Sep 2022 16:43:21 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: power: Add MT8188 power domains
Date: Wed, 28 Sep 2022 16:43:14 +0800
Message-ID: <20220928084315.29187-2-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220928084315.29187-1-Garmin.Chang@mediatek.com>
References: <20220928084315.29187-1-Garmin.Chang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_014345_050891_8C011C67 
X-CRM114-Status: GOOD (  13.27  )
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

Add power domains dt-bindings for MT8188.

Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
---
 .../power/mediatek,power-controller.yaml      |  2 +
 .../dt-bindings/power/mediatek,mt8188-power.h | 44 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt8188-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 605ec7ab5f63..c9acef80f452 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -28,6 +28,7 @@ properties:
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
       - mediatek,mt8186-power-controller
+      - mediatek,mt8188-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
 
@@ -84,6 +85,7 @@ $defs:
               "include/dt-bindings/power/mt8167-power.h" - for MT8167 type power domain.
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
+              "include/dt-bindings/power/mediatek,mt8188-power.h" - for MT8188 type power domain.
               "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
               "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
         maxItems: 1
diff --git a/include/dt-bindings/power/mediatek,mt8188-power.h b/include/dt-bindings/power/mediatek,mt8188-power.h
new file mode 100644
index 000000000000..57e75cf3aa2c
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt8188-power.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Garmin Chang <garmin.chang@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8188_POWER_H
+#define _DT_BINDINGS_POWER_MT8188_POWER_H
+
+#define MT8188_POWER_DOMAIN_MFG0			0
+#define MT8188_POWER_DOMAIN_MFG1			1
+#define MT8188_POWER_DOMAIN_MFG2			2
+#define MT8188_POWER_DOMAIN_MFG3			3
+#define MT8188_POWER_DOMAIN_MFG4			4
+#define MT8188_POWER_DOMAIN_PEXTP_MAC_P0		5
+#define MT8188_POWER_DOMAIN_PEXTP_PHY_TOP		6
+#define MT8188_POWER_DOMAIN_CSIRX_TOP			7
+#define MT8188_POWER_DOMAIN_ETHER			8
+#define MT8188_POWER_DOMAIN_HDMI_TX			9
+#define MT8188_POWER_DOMAIN_ADSP_AO			10
+#define MT8188_POWER_DOMAIN_ADSP_INFRA			11
+#define MT8188_POWER_DOMAIN_ADSP			12
+#define MT8188_POWER_DOMAIN_AUDIO			13
+#define MT8188_POWER_DOMAIN_AUDIO_ASRC			14
+#define MT8188_POWER_DOMAIN_VPPSYS0			15
+#define MT8188_POWER_DOMAIN_VDOSYS0			16
+#define MT8188_POWER_DOMAIN_VDOSYS1			17
+#define MT8188_POWER_DOMAIN_DP_TX			18
+#define MT8188_POWER_DOMAIN_EDP_TX			19
+#define MT8188_POWER_DOMAIN_VPPSYS1			20
+#define MT8188_POWER_DOMAIN_WPE				21
+#define MT8188_POWER_DOMAIN_VDEC0			22
+#define MT8188_POWER_DOMAIN_VDEC1			23
+#define MT8188_POWER_DOMAIN_VENC			24
+#define MT8188_POWER_DOMAIN_IMG_VCORE			25
+#define MT8188_POWER_DOMAIN_IMG_MAIN			26
+#define MT8188_POWER_DOMAIN_DIP				27
+#define MT8188_POWER_DOMAIN_IPE				28
+#define MT8188_POWER_DOMAIN_CAM_VCORE			29
+#define MT8188_POWER_DOMAIN_CAM_MAIN			30
+#define MT8188_POWER_DOMAIN_CAM_SUBA			31
+#define MT8188_POWER_DOMAIN_CAM_SUBB			32
+
+#endif /* _DT_BINDINGS_POWER_MT8188_POWER_H */
-- 
2.18.0


