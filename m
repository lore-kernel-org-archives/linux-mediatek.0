Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Jan 2022 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/L+WHhxxD9N9D+Eqo1VisVdenIZfQm7mLBYYueH/k8=; b=Vk2YB/lH9VLMx5
	P2pdgOzrOsQhlftwby4QzDqtng7t1VKnhhwF/Rl7eRDHYb9HGiRbqZ8O2I5cFXEaLhAb1P4CMGmuy
	QiUPNa9Zdjk9a5yTQuMuZ9WB1Fs50leqbOMZj9HS7Dbh7fWaOmh71KDijkFyQLzcouIJ9RG/Kawh0
	l6adx73z3BjZRtOMtpvyJGmFUv8T10wPPcQGip/dRRcKnEkdnmmil2iJbLKVJQ2JlEJ8hqOhC0ADR
	67OXFDcEF4XBRhrRUYQxJWbZatjSZnIL1zPke/OHNc+7jQTNkBD4F+LR40XMjr6NkxnQvMw6ty+vC
	htUI+eKR+0iIgDmFojQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6Be7-006TNF-Sg; Sat, 08 Jan 2022 13:20:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6Bdp-006TIA-A7; Sat, 08 Jan 2022 13:20:18 +0000
X-UUID: 4a092835f73249ae8440068acc98ff49-20220108
X-UUID: 4a092835f73249ae8440068acc98ff49-20220108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 884392989; Sat, 08 Jan 2022 06:20:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Jan 2022 05:20:11 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 8 Jan 2022 21:20:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 8 Jan 2022 21:20:09 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chun-Jie Chen
 <chun-jie.chen@mediatek.com>
Subject: [v1 1/2] dt-bindings: power: Add MT8186 power domains
Date: Sat, 8 Jan 2022 21:19:52 +0800
Message-ID: <20220108131953.16744-2-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
References: <20220108131953.16744-1-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220108_052017_384710_68F04D4A 
X-CRM114-Status: GOOD (  12.19  )
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

Add power domains dt-bindings for MT8186.

Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
---
 .../power/mediatek,power-controller.yaml      |  1 +
 include/dt-bindings/power/mt8186-power.h      | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 include/dt-bindings/power/mt8186-power.h

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index d6ebd77d28a7..135c6f722091 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -26,6 +26,7 @@ properties:
       - mediatek,mt8167-power-controller
       - mediatek,mt8173-power-controller
       - mediatek,mt8183-power-controller
+      - mediatek,mt8186-power-controller
       - mediatek,mt8192-power-controller
       - mediatek,mt8195-power-controller
 
diff --git a/include/dt-bindings/power/mt8186-power.h b/include/dt-bindings/power/mt8186-power.h
new file mode 100644
index 000000000000..ca8ea2d24801
--- /dev/null
+++ b/include/dt-bindings/power/mt8186-power.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
+ */
+
+#ifndef _DT_BINDINGS_POWER_MT8186_POWER_H
+#define _DT_BINDINGS_POWER_MT8186_POWER_H
+
+#define MT8186_POWER_DOMAIN_MFG0			0
+#define MT8186_POWER_DOMAIN_MFG1			1
+#define MT8186_POWER_DOMAIN_MFG2			2
+#define MT8186_POWER_DOMAIN_MFG3			3
+#define MT8186_POWER_DOMAIN_SSUSB			4
+#define MT8186_POWER_DOMAIN_SSUSB_P1			5
+#define MT8186_POWER_DOMAIN_DIS				6
+#define MT8186_POWER_DOMAIN_IMG				7
+#define MT8186_POWER_DOMAIN_IMG2			8
+#define MT8186_POWER_DOMAIN_IPE				9
+#define MT8186_POWER_DOMAIN_CAM				10
+#define MT8186_POWER_DOMAIN_CAM_RAWA			11
+#define MT8186_POWER_DOMAIN_CAM_RAWB			12
+#define MT8186_POWER_DOMAIN_VENC			13
+#define MT8186_POWER_DOMAIN_VDEC			14
+#define MT8186_POWER_DOMAIN_WPE				15
+#define MT8186_POWER_DOMAIN_CONN_ON			16
+#define MT8186_POWER_DOMAIN_CSIRX_TOP			17
+#define MT8186_POWER_DOMAIN_ADSP_AO			18
+#define MT8186_POWER_DOMAIN_ADSP_INFRA			19
+#define MT8186_POWER_DOMAIN_ADSP_TOP			20
+
+#endif /* _DT_BINDINGS_POWER_MT8186_POWER_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
