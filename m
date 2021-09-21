Return-Path: <SRS0=xNtl=OL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E6BC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 15:57:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02ACB61090
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Sep 2021 15:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02ACB61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4a6lo8UVRvTK48wfmy4BW1zTj5tQGzRVXtnSYK32Y7o=; b=erDMv//WadzNV1
	0GL16nq1A1FO2yMtmVI5eSUC+xjyG8p1BCIkVeuuPzvimlxd9ztH84rcoDgu0+bjrTJHhwhggu+FM
	mAZ2YYGNtB+PSmRVILQcizyTSFx7Y5TgPVODJIJxWk9X/lqX8f7K88JbkMnvWN3caN7PuVI7/cNBH
	raeImZB+5WZ0pnBg1YwIkYaVeLWIo9vnBFFmBalLP2JL2m/WLa+/x+M6Dpo0PibOdbrxXcTwVPX9H
	pbj9wPq3TZep4thGX14lU5gNrqdyvx1EzZki0Lusphme1ZFa7fI7Mnm6QGRagj8bcj1XJWKGjIw2c
	UNmlanpTNTdGD28NSY2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSi9E-00519q-UC; Tue, 21 Sep 2021 15:57:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSi4b-004yPz-CA; Tue, 21 Sep 2021 15:52:50 +0000
X-UUID: 5d2f7520691f43acad48901ece9d2f67-20210921
X-UUID: 5d2f7520691f43acad48901ece9d2f67-20210921
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 508756897; Tue, 21 Sep 2021 08:52:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Sep 2021 08:52:30 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Sep 2021 23:52:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 21 Sep 2021 23:52:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <jason-jh.lin@mediatek.com>, Fabien Parent
 <fparent@baylibre.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v11 07/16] dt-bindings: arm: mediatek: move common module from
 display folder
Date: Tue, 21 Sep 2021 23:52:09 +0800
Message-ID: <20210921155218.10387-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
References: <20210921155218.10387-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_085245_482373_89777E5F 
X-CRM114-Status: GOOD (  11.55  )
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

AAL, COLOR, CCORR, MUTEX, WDMA could be used by other modules,
such as MDP, so move their binding document into the common folder.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../{display => arm}/mediatek/mediatek,aal.yaml      |  9 ++++-----
 .../{display => arm}/mediatek/mediatek,ccorr.yaml    |  9 ++++-----
 .../{display => arm}/mediatek/mediatek,color.yaml    | 11 +++++------
 .../{display => arm}/mediatek/mediatek,mutex.yaml    | 12 +++++-------
 .../{display => arm}/mediatek/mediatek,wdma.yaml     |  9 ++++-----
 5 files changed, 22 insertions(+), 28 deletions(-)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,aal.yaml (88%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,ccorr.yaml (87%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,color.yaml (86%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,mutex.yaml (85%)
 rename Documentation/devicetree/bindings/{display => arm}/mediatek/mediatek,wdma.yaml (90%)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
similarity index 88%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
index 311bbf05a967..ab6eb9b550a4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,aal.yaml
@@ -1,17 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,aal.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,aal.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display adaptive ambient light processor
+title: MediaTek adaptive ambient light processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display adaptive ambient light processor, namely AAL,
+  MediaTek adaptive ambient light processor, namely AAL,
   is responsible for backlight power saving and sunlight visibility improving.
   AAL device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
similarity index 87%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
index 60752ce45d49..de86e9ae35f3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ccorr.yaml
@@ -1,17 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,ccorr.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,ccorr.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color correction
+title: MediaTek color correction
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color correction, namely CCORR, reproduces correct color
+  MediaTek color correction, namely CCORR, reproduces correct color
   on panels with different color gamut.
   CCORR device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,color.yaml
similarity index 86%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,color.yaml
index f6636869909c..73be301b50d2 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,color.yaml
@@ -1,18 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,color.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,color.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display color processor
+title: MediaTek color processor
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display color processor, namely COLOR, provides hue, luma and
-  saturation adjustments to get better picture quality and to have one panel
+  MediaTek color processor, namely COLOR, provides hue, luma and saturation
+  adjustments to get better picture quality and to have one panel
   resemble the other in their output characteristics.
   COLOR device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
similarity index 85%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
index 6eca525eced0..713c7485e11a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mutex.yaml
@@ -1,19 +1,17 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,mutex.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mutex.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek mutex
+title: MediaTek mutex
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek mutex, namely MUTEX, is used to send the triggers signals called
-  Start Of Frame (SOF) / End Of Frame (EOF) to each sub-modules on the display
-  data path or MDP data path.
+  MediaTek mutex, namely MUTEX, is used to send the triggers signals called
+  Start Of Frame(SOF) / End Of Frame(EOF) to each sub-modules on the data path.
   In some SoC, such as mt2701, MUTEX could be a hardware mutex which protects
   the shadow register.
   MUTEX device node must be siblings to the central MMSYS_CONFIG node.
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
similarity index 90%
rename from Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
rename to Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
index 25f9a63fe7af..5222535d98c6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,wdma.yaml
@@ -1,17 +1,16 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/mediatek/mediatek,wdma.yaml#
+$id: http://devicetree.org/schemas/arm/mediatek/mediatek,wdma.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Mediatek display WDMA
+title: MediaTek WDMA
 
 maintainers:
-  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
-  - Philipp Zabel <p.zabel@pengutronix.de>
+  - Matthias Brugger <matthias.bgg@gmail.com>
 
 description: |
-  Mediatek display WDMA stands for Write Direct Memory Access.
+  MediaTek WDMA stands for Write Direct Memory Access.
   It can write the data in display pipeline into DRAM.
   WDMA device node must be siblings to the central MMSYS_CONFIG node.
   For a description of the MMSYS_CONFIG binding, see
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
