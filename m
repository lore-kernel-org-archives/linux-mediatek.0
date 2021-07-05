Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E8C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:48:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 107B8613E1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 107B8613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90CSjGlpoHmA2/KZrZLH9RD9ag7fnpvD3E+EVmrqM18=; b=ZCz3C2rX7dYDRi
	w/rWhDfd7ESz/pRAr3dJF0hl6rqxAZ+AfUl83KLeSe+4FrJNbvmYHg88OlReOINl/vxGH55aTTefw
	ZMP0TfSyFTZr6xdDnfm/iIWQuS1hISc4JA9el0kAl2RKU2DRIXmUaIYEgVTVMfEmv8lg7HHt7Kv9s
	CJTAuFAb6zsCrm8CcjJ5qwNlet5q/kmK26kbMgNspmLMmNlKtW/zDzs/2ODbId1VQMj6eQljZQTlJ
	iSGBvJ6EUOyVLYFPwvtbUH9d2tkzr2o8JuImrkq8oModQPchK9HsbgkrmlfJjEhkllAnQx7x0l/qk
	tqya3mkf8Q9cveKe2zeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HSi-007vgX-0Y; Mon, 05 Jul 2021 05:48:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HSd-007vf6-Bv; Mon, 05 Jul 2021 05:48:05 +0000
X-UUID: c1de3796727a4d919f65328ee6526fd3-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5ylQESNvbmc18Q2AP63eVK8uMIMOURqkmGDXrbDXVsQ=; 
 b=Biyhr0MOpnzsoooaEvO8mifC/QcADpwTTt1zgjRUlsBWdbcNlh4q9GirPW9SjwCORy0MtepvCiviy/V+InOAZ+/OS79U3ivv3Kq6Fop7jYWkD84Uqz2cg2vuQ9g1OJfw042YgeFILUcyycyUBECUWwoGc4RMWQnDjdKJJek21t8=;
X-UUID: c1de3796727a4d919f65328ee6526fd3-20210704
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1820873871; Sun, 04 Jul 2021 22:48:01 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 22:41:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 13:41:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 13:41:23 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v3 2/5] dt-bindings: power: Add MT8195 power domains
Date: Mon, 5 Jul 2021 13:41:08 +0800
Message-ID: <20210705054111.4473-3-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
References: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_224803_454506_179431FD 
X-CRM114-Status: GOOD (  12.72  )
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

Add power domains dt-bindings for MT8195.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
