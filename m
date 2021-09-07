Return-Path: <SRS0=gwp9=N5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF95FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82BE060F45
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Sep 2021 08:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82BE060F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7abBK43SOK1XKmKP2+IyUxo8UyAOSbEOYr171U2Gb0U=; b=hY6SjBWvl9px5j
	/YBWCKveMyi4m3K0t6sYFXdAIUR7tR+Jgj3eFc4G8UQ1Lz2QdiCNmKpnXoq99VmgoBPzcB55PjZnK
	THA4d4GtZiL9M0dMLv4oBzR/K6RO4Zlltlm7s7KufkOzgsggK8EWmodRXYbhNOSHewk9/SutIowoH
	ubvdHaPvq68KGBjMQzzeAEenV3TZme8BVMZ3SzudDB0T4Dd67u+YQyg0p23Tiha/T42pOocwe+lXV
	6DCLjNFaVR2V57y6bHTgyfkEVEHoPXYQXiNxEiqPHC95eZqZVSowsdgJiqUXUbkcTU/KpIhyAyKIw
	jZyz0/Yg19Zq+J4pE+pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNWeb-002tr4-7d; Tue, 07 Sep 2021 08:40:29 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNWdk-002tQ4-7N
 for linux-mediatek@lists.infradead.org; Tue, 07 Sep 2021 08:39:40 +0000
Received: by mail-wr1-x443.google.com with SMTP id u16so13231691wrn.5
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Sep 2021 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oz+Hr4rbZnT8MxqfF16y/QcdvWXwOuV/sANx8R9T0v0=;
 b=ttURaYZ3GOJrLfiRPVgP6FVt1sTn4/VjQ3JvUq4LS0dEDBsGsWxw1syT5yrRjMnusR
 ZXTp0q+DB+1ZHvy/fjom9NJV7cJBn7L8Ylqgw1rEmRCYk9Vr/pclGjEWmJNe48UmpO6F
 9Pilf3J37Uac9vF59TO/60Icd3P39suwl9BO6BfWJVRH0tXmh8/kk/6r6st0fVhySvuL
 F4rVlFtvAJxLrMO5rFu0DBikqxvljKrHI8Ia4r6FDoUoD1DJGMm7+A/M4IILsWtix8oF
 DZwIn2pd4TxcA1gjAvH0QkKcsr/5ovIJHsVgK35NoqpYrBp+6eJ6qbCHYSoykacMlB6D
 paHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oz+Hr4rbZnT8MxqfF16y/QcdvWXwOuV/sANx8R9T0v0=;
 b=ChUdKQd8TMI6p5gcpIEeHbCmcLNL/veYvrjbbMg1WXZkbUAuUbNx35wa2/KMDVtyKT
 SniGuVe5R1RYH5aZNSVewDxGxKkA773bafzMQgwnVB03gzMDZPbrmK+y2t6cz93DwdM4
 u3w2WVXfzOZfjWnPWp8xgMUx0ilwqbDpIvBTNrHnIuB29hFAOPY/x1MPBnwBFAyknk0z
 xBypqdsd4wx2wr2lLEKuF0yn1MydMJgwpM0r2Tg8LiZ86LQYSOmlxffKc84VbwYD77SH
 OLc2O+RE4dbLuH5gT7v38OMb+4Vqv/6Qop5zK8xhvhmfO6dHw/BwS7BcQ0ote7A2LmfR
 ASMA==
X-Gm-Message-State: AOAM530LpgB4e5w8DsRkBTlUoVMSpyLHxCQYRcaB+C7xXn16g8D+Bi4Z
 EL44Pkl/ae+pubKxfGZLcu2YPQ==
X-Google-Smtp-Source: ABdhPJzoBZMmsSD6ztdMvt5juS04ZdEQi35jGlbPEby6MJaVuXCnGNXgqWHtQvmCP6Ssf+r4FgiM4Q==
X-Received: by 2002:adf:de8f:: with SMTP id w15mr17787801wrl.277.1631003975036; 
 Tue, 07 Sep 2021 01:39:35 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6141-3317-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6141:3317:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id m186sm1737027wme.48.2021.09.07.01.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 01:39:34 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH 3/4] dt-bindings: phy: Add binding for Mediatek MT8195 HDMI PHY
Date: Tue,  7 Sep 2021 10:37:20 +0200
Message-Id: <20210907083723.7725-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907083723.7725-1-granquet@baylibre.com>
References: <20210907083723.7725-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_013936_376979_6E54E877 
X-CRM114-Status: GOOD (  15.07  )
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

Add bindings to describe Mediatek MT8195 HDMI PHY

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
new file mode 100644
index 000000000000..f03bd3af7fd8
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2020 MediaTek
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek High Definition Multimedia Interface (HDMI) PHY binding for mt8195
+
+maintainers:
+  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
+  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Chunfeng Yun <chunfeng.yun@mediatek.com>
+
+description: |
+  The HDMI PHY serializes the HDMI encoder's three channel 10-bit parallel
+  output and drives the HDMI pads.
+
+properties:
+  $nodename:
+    pattern: "^hdmi-phy@[0-9a-f]+$"
+
+  compatible:
+    - const: mediatek,mt8195-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PLL reference clock
+
+  clock-names:
+    items:
+      - const: hdmi_xtal_sel
+
+  clock-output-names:
+    items:
+      - const: hdmi_txpll
+
+  "#phy-cells":
+    const: 0
+
+  "#clock-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
+  - "#phy-cells"
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8195-clk.h>
+    hdmi_phy: hdmi-phy@11d5f000 {
+        compatible = "mediatek,mt8195-hdmi-phy";
+        reg = <0 0x11d5f000 0 0x100>;
+        clocks = <&topckgen CLK_TOP_HDMI_XTAL>;
+        clock-names = "hdmi_xtal_sel";
+        clock-output-names = "hdmi_txpll";
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
+
+...
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
