Return-Path: <SRS0=79RL=N6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3ADC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 140CB61026
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Sep 2021 06:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 140CB61026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkgLphNEXgRUK6kFig0ccCdyXSnLp7jtL5Rd9LaUqWg=; b=UjfZ0ANLj46zCO
	gYjtnfVlAU+Rdhmu7lyE/cKiSPJnq9iE/nthOL67YhKiLU7yhnhLBPoDXZaF34DFq41SufLxSPLAl
	V+U0JoVByQ6jWDx4cjDZafJZkLNqoTd+H6okZEISt+8LJdYRsO2yb8Y7ClPMob17ztTkbrWKkQEX1
	jyxyl6IjmYURh0EHHxhJEuIyUIBwqqNGKlGYciwHwhR035hHwcbYHEsnAF4Vdh++tlGu9JSrE3yva
	Doqt8/Pd0R8nsXLJLifQwKWMifGLLmOE06IJwVk852zfDSgb1ehMgoo1y2Wj7N+udqXZ5bdm7Du/6
	Mi50B2LdB6Tld4/hHsCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNqld-005TWP-4O; Wed, 08 Sep 2021 06:09:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNqlY-005TSI-Il; Wed, 08 Sep 2021 06:09:02 +0000
X-UUID: a5d912fc31194fda8118f8c633b60de4-20210907
X-UUID: a5d912fc31194fda8118f8c633b60de4-20210907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 118633049; Tue, 07 Sep 2021 23:08:46 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Sep 2021 23:04:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 14:04:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Sep 2021 14:04:10 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v10 08/17] dt-bindings: display: mediatek: add mt8195 SoC
 binding for vdosys0
Date: Wed, 8 Sep 2021 14:03:03 +0800
Message-ID: <20210908060312.24007-9-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_230900_676047_A5217612 
X-CRM114-Status: GOOD (  10.64  )
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

Add mt8195 SoC binding to AAL, CCORR, COLOR, DITHER, GAMMA, MERGE,
OVL and RDMA yaml schema for vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 5 +++++
 .../devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 .../bindings/display/mediatek/mediatek,dither.yaml           | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,merge.yaml | 2 ++
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 +++++
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 2 ++
 8 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 92a350ab9722..311bbf05a967 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -28,6 +28,7 @@ properties:
               - mediatek,mt2712-disp-aal
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
+              - mediatek,mt8195-disp-aal
           - enum:
               - mediatek,mt8173-disp-aal
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 7840e12d4caf..60752ce45d49 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -25,6 +25,11 @@ properties:
           - const: mediatek,mt8183-disp-ccorr
       - items:
           - const: mediatek,mt8192-disp-ccorr
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-ccorr
+          - enum:
+              - mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 7a249ba8584c..f6636869909c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -38,6 +38,7 @@ properties:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
+              - mediatek,mt8195-disp-color
           - enum:
               - mediatek,mt8173-disp-color
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 316374315962..d4fa75bb19a3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-dither
+              - mediatek,mt8195-disp-dither
           - enum:
               - mediatek,mt8183-disp-dither
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 1c53ce20a71e..8ce612b016ab 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8192-disp-gamma
+              - mediatek,mt8195-disp-gamma
           - enum:
               - mediatek,mt8183-disp-gamma
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
index 0fe204d9ad2c..5639650073b1 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.yaml
@@ -23,6 +23,8 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8173-disp-merge
+      - items:
+          - const: mediatek,mt8195-disp-merge
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 50552428150f..a6dbbd65166e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -35,6 +35,11 @@ properties:
               - mediatek,mt2712-disp-ovl
           - enum:
               - mediatek,mt2701-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt8195-disp-ovl
+          - enum:
+              - mediatek,mt8183-disp-ovl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 8393a25a3781..0dcde0749078 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -29,6 +29,8 @@ properties:
           - const: mediatek,mt8173-disp-rdma
       - items:
           - const: mediatek,mt8183-disp-rdma
+      - items:
+          - const: mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt7623-disp-rdma
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
