Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27744C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 03:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKFsWT6s1CaCUjz2dTEsJp3a3uRPvwHPq1oRJRwWPr8=; b=0cfsKdOZLs8NT1
	rdYAZ5Sp+wVYKJO3UtzIR+v/odEMMj7WSHrkDPL7gxhsfuw3bQ3HQZ2vXx62RjHJO/R/0mFuNn0yA
	fP1/m2G49Y+B+X/bf2aiHwJ5iI2dYqROn1IXE0I2EQC9c3P0cYzcmXhH1pFQmR+Sfca/ata83sKI0
	qLeX4MtWlG6Ln+7Nkv+xjDOzcqhO13L8Po0ps6iWHKNtkif9Buqafbu69ZaqJv9Ko6ELoLhG2YPLv
	V3fcSbEXwaAItlySyxD1rsNLsIPCz+QcErig+KTrHRn0IWLbdunZwIeIAZwtcLhvsn98Ox208bPH4
	G2de2O9WUMq+Z4lhgNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nR454-00FiKw-Ba; Mon, 07 Mar 2022 03:30:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nR44Y-00Fi8w-3W; Mon, 07 Mar 2022 03:30:12 +0000
X-UUID: 03b2056ce2c1455789762dfacac4335f-20220306
X-UUID: 03b2056ce2c1455789762dfacac4335f-20220306
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1611476027; Sun, 06 Mar 2022 20:30:05 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Mar 2022 19:30:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 7 Mar 2022 11:29:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Mar 2022 11:29:55 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v16 1/8] dt-bindings: soc: mediatek: move out common module
 from display folder
Date: Mon, 7 Mar 2022 11:28:52 +0800
Message-ID: <20220307032859.3275-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
References: <20220307032859.3275-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_193010_196037_E12787D8 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>,
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK
 Hu <ck.hu@mediatek.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>

AAL, COLOR, CCORR, MUTEX, WDMA could be used by other modules,
such as MDP, so move their binding document into the common folder.

Signed-off-by: jason-jh lin <jason-jh.lin@mediatek.corp-partner.google.com>
---
 .../{display => soc}/mediatek/mediatek,aal.yaml     | 13 ++++---------
 .../{display => soc}/mediatek/mediatek,ccorr.yaml   | 13 ++++---------
 .../{display => soc}/mediatek/mediatek,color.yaml   | 13 ++++---------
 .../{display => soc}/mediatek/mediatek,mutex.yaml   | 12 +++---------
 .../{display => soc}/mediatek/mediatek,wdma.yaml    |  9 ++-------
 5 files changed, 17 insertions(+), 43 deletions(-)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,aal.yaml (81%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,ccorr.yaml (80%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,color.yaml (83%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,mutex.yaml (82%)
 rename Documentation/devicetree/bindings/{display => soc}/mediatek/mediatek,wdma.yaml (85%)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
index 4fdc9b3283b0..08934b10b54e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,aal.yaml
@@ -1,22 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,aal.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display adaptive ambient light processor
+title: Mediatek adaptive ambient light processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display adaptive ambient light processor, namely AAL,
+  Mediatek adaptive ambient light processor, namely AAL,
   is responsible for backlight power saving and sunlight visibility improving.
-  AAL device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
similarity index 80%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
index 0ed53b6238f0..bf52b7b53475 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,ccorr.yaml
@@ -1,22 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,ccorr.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color correction
+title: Mediatek color correction
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color correction, namely CCORR, reproduces correct color
+  Mediatek color correction, namely CCORR, reproduces correct color
   on panels with different color gamut.
-  CCORR device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
similarity index 83%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
index 3ad842eb5668..91ff2adcf390 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,color.yaml
@@ -1,23 +1,18 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,color.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color processor
+title: Mediatek color processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color processor, namely COLOR, provides hue, luma and
+  Mediatek color processor, namely COLOR, provides hue, luma and
   saturation adjustments to get better picture quality and to have one panel
   resemble the other in their output characteristics.
-  COLOR device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
index 00e6a1041a9b..d334050105db 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
@@ -1,25 +1,19 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek mutex
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
   Mediatek mutex, namely MUTEX, is used to send the triggers signals called
-  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
-  data path or MDP data path.
+  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the data path.
   In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
   the shadow register.
-  MUTEX device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
similarity index 85%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
rename to Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
index 7d7cc1ab526b..a6f9e1b3268d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,wdma.yaml
@@ -1,22 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
+$id: http://devicetree.org/schemas/soc/mediatek/mediatek,wdma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Mediatek Write Direct Memory Access
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
   Mediatek Write Direct Memory Access(WDMA) component used to write
   the data into DMA.
-  WDMA device node must be siblings to the central MMSYS_CONFIG node.
-  For a description of the MMSYS_CONFIG binding, see
-  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
-  for details.
 
 properties:
   compatible:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
