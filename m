Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A16C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:41:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D2022076D
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 11:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WKytWW83"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D2022076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aZuorgnWh2o5FEb0SrRsyfcDgFBux4vBC8YSGlrw5es=; b=WKytWW83GCOM3m8pTwFke4b1p
	A4m6QIIsHGFbIRQCVG/iiIKH81mXqfxCRC5WmVlY72pTrWlk6ODM7LiSXPvZR2GHk6I+C0uQ/XF6Q
	zvTAquq0JB13XIXoA5Dez4RNd/hBfNbij6XSyHCEvyi0nRrT/pAC7WnS5B03i6uujRrM71ic1j6wZ
	Py1NVNm88zf9ht1IWT5dU+SH47fyp8no6nuRIPCPCQiQSZIQTMz4GPSTH75aUobJN1Vtj+Js+QtU4
	daGYdfOExfOe8WZmDmZ/dzrbYXvu8Fihs8okobxP9UonfTgsDr4nJ/nIWHYlQVhATxc9vMfGvXaQP
	dAgFTRDAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYSmM-00033W-FR; Fri, 30 Oct 2020 11:41:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYSi4-0000zf-9H; Fri, 30 Oct 2020 11:36:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 915DB1F45EBC
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 14/16] dt-bindings: power: Add MT8192 power domains
Date: Fri, 30 Oct 2020 12:36:20 +0100
Message-Id: <20201030113622.201188-15-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030113622.201188-1-enric.balletbo@collabora.com>
References: <20201030113622.201188-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_073644_511471_FA9CFFD3 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org, weiyi.lu@mediatek.com,
 fparent@baylibre.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Weiyi Lu <weiyi.lu@mediatek.com>

Add power domains dt-bindings for MT8192.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../power/mediatek,power-controller.yaml      |  2 ++
 include/dt-bindings/power/mt8192-power.h      | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8192-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 8cae43412327..fd12bafe3548 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -25,6 +25,7 @@ properties:
     enum:
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
+      - mediatek,mt8192-power-controller
 
   '#power-domain-cells':
     const: 1
@@ -60,6 +61,7 @@ patternProperties:
           Power domain index. Valid values are defined in:
               "include/dt-bindings/power/mt8173-power.h" - for MT8173 type power domain.
               "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
+              "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
         maxItems: 1
 
       clocks:
diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
new file mode 100644
index 000000000000..4eaa53d7270a
--- /dev/null
+++ b/include/dt-bindings/power/mt8192-power.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2020 MediaTek Inc.
+ * Author: Weiyi Lu <weiyi.lu@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8192_POWER_H
+#define _DT_BINDINGS_POWER_MT8192_POWER_H
+
+#define MT8192_POWER_DOMAIN_AUDIO	0
+#define MT8192_POWER_DOMAIN_CONN	1
+#define MT8192_POWER_DOMAIN_MFG0	2
+#define MT8192_POWER_DOMAIN_MFG1	3
+#define MT8192_POWER_DOMAIN_MFG2	4
+#define MT8192_POWER_DOMAIN_MFG3	5
+#define MT8192_POWER_DOMAIN_MFG4	6
+#define MT8192_POWER_DOMAIN_MFG5	7
+#define MT8192_POWER_DOMAIN_MFG6	8
+#define MT8192_POWER_DOMAIN_DISP	9
+#define MT8192_POWER_DOMAIN_IPE		10
+#define MT8192_POWER_DOMAIN_ISP		11
+#define MT8192_POWER_DOMAIN_ISP2	12
+#define MT8192_POWER_DOMAIN_MDP		13
+#define MT8192_POWER_DOMAIN_VENC	14
+#define MT8192_POWER_DOMAIN_VDEC	15
+#define MT8192_POWER_DOMAIN_VDEC2	16
+#define MT8192_POWER_DOMAIN_CAM		17
+#define MT8192_POWER_DOMAIN_CAM_RAWA	18
+#define MT8192_POWER_DOMAIN_CAM_RAWB	19
+#define MT8192_POWER_DOMAIN_CAM_RAWC	20
+
+#endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
