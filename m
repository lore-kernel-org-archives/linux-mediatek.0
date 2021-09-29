Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 09:47:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F275613A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 09:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F275613A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KNRBvEr+XHQPgMfrPLEH8j6/qBfXij+5fatZlTWCkXQ=; b=yENnYL/CxVgqd3
	/d8N2MxEmLG15BP0cVDbvcSdUz/9SPacMDo8PojGU2Nt8gNGcERI3OX2r7VUDn3VaAAfYwv5lD5s8
	SXRRp4Zic+FqJA+AUvXX86leyWi+bLhPKl/lSOU95rT6UF8gBSkPzPZkIqGBjaMRFi9OZOxy9NHer
	iZKxi9PyNNaQKaYFkVOjC2Zt+CnbgxmlJOcnqQSKR3BfX1OhW/vVxFTVBwHyMMOhAGDipL8CLqm3m
	NztBFSj5TLPYGdpV2x6kK/bSCmwVxNk1CzUT1TIAXi0NbBLe2O5i2wPF46UCnNGyree7ezXr2YQV+
	hbL3h7Jz8RROJOvd0lJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVWBP-00AbaQ-Nm; Wed, 29 Sep 2021 09:47:23 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVWAw-00AbRb-HH
 for linux-mediatek@lists.infradead.org; Wed, 29 Sep 2021 09:46:57 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h15so1576498wrc.3
 for <linux-mediatek@lists.infradead.org>; Wed, 29 Sep 2021 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0TEsDRiyoS/4OSMn47r8BWf1M3rX4YjYUeKvcYaH4Lw=;
 b=N4Ij3KaqTN6lCzIHUNYiS0hXtG8BxP1YsyVEsbtdMh6naQw4xDybUjSQ0smteyfRFr
 h7i1lbPa5OCh5a0YSiwTRNgVYTWKurZw+xYghnggMg12SDdOfrcl9CpryfDAbYVTvJpY
 UGcfcp3pOIUbR1iyB+MmXbIz311XBBD4gq78zZA5wTsGRooYXf1ZDkDziGKUiV6cdhSk
 4ItFnGUVtxgdDiO+dqt8vIwANMVY5MgNL8nGEZCtBj96TX2MdxS22PBGr28/C9RtOKAs
 h9bUR9ZYCvJNgwvUKFn4dLcqQ+TxAVei/ilUgtWEltJL340kzv2/rY04SB1Kt+r6Ro3m
 DppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0TEsDRiyoS/4OSMn47r8BWf1M3rX4YjYUeKvcYaH4Lw=;
 b=KiDn2v0/Shu8b0t9uFc+fGPf0UfxolaTSp/Czny+9hbryERbyrLyRMe2J90CLVOHI6
 ac0Gnn/FHmiqBT1QRqSO3Idc5IWsd/iS6ArzrO/os9m9TBOOfxjHMhirQJK93Ye15CqH
 a69RtyHe+zlL2NSQSC/EQarbwr6uquIiN2iNCw90H6YvQv8Aqx7kWts9VRUmDKTo9TyC
 wPe77nkf/JmMGuyJ82AQxwXpxYlEhwklPop2+0dBz+IYV62MYS0nai29Po3nuot785FR
 sBuHoBUhWMULl0WdJ5z2A2Pfi8AzvxfEILjimkKKD/WvpgxpaeLTabAbmJvfkCPCNnUh
 HzVg==
X-Gm-Message-State: AOAM531Ajzd9G0rCB80PiUZEnQym2GcyntzymvpWupEFBkjoAhb51RWP
 HHu2WalWpHC4kJl8vYDNFG3sjQ==
X-Google-Smtp-Source: ABdhPJxoWBasUJskF/U8ajOUDOopKjdiX2cNUcJ5NjEaYxV81lHoLSDmAM6EpXMdEzCh/pwDTEXw7A==
X-Received: by 2002:adf:a115:: with SMTP id o21mr1617016wro.208.1632908813085; 
 Wed, 29 Sep 2021 02:46:53 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6240-2cf3-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6240:2cf3:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h7sm1751938wrx.14.2021.09.29.02.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 02:46:52 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/4] dt-bindings: phy: Add binding for Mediatek MT8195 HDMI
 PHY
Date: Wed, 29 Sep 2021 11:44:22 +0200
Message-Id: <20210929094425.745-2-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210929094425.745-1-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_024654_611082_B19184C9 
X-CRM114-Status: GOOD (  13.62  )
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
 .../phy/mediatek,mtk8195-hdmi-phy.yaml        | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
new file mode 100644
index 0000000000000..6b39bb8c9dfe7
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/mediatek,mtk8195-hdmi-phy.yaml
@@ -0,0 +1,70 @@
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
+    hdmi_phy: hdmi-phy@11d5f000 {
+        compatible = "mediatek,mt8195-hdmi-phy";
+        reg = <0 0x11d5f000 0 0x100>;
+        clocks = <&topckgen 77>;
+        clock-names = "hdmi_xtal_sel";
+        clock-output-names = "hdmi_txpll";
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
+
+...
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
