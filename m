Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C725C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhFqEUCbtejG4nYDMEBYPsRHzRltH+gTkmEzKf9fylo=; b=0LwvClNgKZHe+U
	4JWSoQAHZS3I8uJgvkmZny0A/OHvqpoBIFaoSlgtehjwsLYJfecV2hAF6O395u9gG2fOMu48geab9
	KuuwQituSQKvE81/HOeKLp1+UdpnQgKPDMvorYJuWM8WP4JeGoMFAGjB/7BsvEajQFNjlav4UEETT
	zZcaJAXvd49O6X80gloN0aucMJ4L67KLRAHhRMJuhml9fF+Of5h4f8WqSMeDikIKK++wp2TvUC7YY
	SnyR+43zuh0R9rqTI7dRu+xGk91Y1+PBf/Vp39jD2X5lwALDkNXc2QBfshvvgezim50Qqacz1SHm0
	ljlb8KMht10sayWft7og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKGA4-006CeT-8p; Wed, 16 Feb 2022 08:59:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKG96-006CAQ-SI; Wed, 16 Feb 2022 08:58:46 +0000
X-UUID: 5592b62c1b954badbb5edc2901d7b262-20220216
X-UUID: 5592b62c1b954badbb5edc2901d7b262-20220216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1971869553; Wed, 16 Feb 2022 01:58:37 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 00:48:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 16:48:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Feb 2022 16:48:33 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jassisinghbrar@gmail.com>, <fparent@baylibre.com>,
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH v3, 2/5] dt-bindings: display: mediatek: add MT8186 SoC binding
Date: Wed, 16 Feb 2022 16:48:28 +0800
Message-ID: <20220216084831.14883-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220216084831.14883-1-rex-bc.chen@mediatek.com>
References: <20220216084831.14883-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_005844_970478_FF16D507 
X-CRM114-Status: GOOD (  12.07  )
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

Add MT8186 SoC binding to AAL, CCORR, COLOR, DITHER, DPI, DSI,
GAMMA, MUTEX, OVL, POSTMASK and RDMA.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml | 5 +++++
 .../devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 .../bindings/display/mediatek/mediatek,dither.yaml           | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,dsi.txt    | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml | 2 ++
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 +++++
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 +++++
 .../bindings/display/mediatek/mediatek,postmask.yaml         | 5 +++++
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 1 +
 12 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 225f9dd726d2..7c27f61f336b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - mediatek,mt2712-disp-aal
               - mediatek,mt8183-disp-aal
+              - mediatek,mt8186-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 6894b6999412..8ac87b5896ac 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -30,6 +30,11 @@ properties:
               - mediatek,mt8195-disp-ccorr
           - enum:
               - mediatek,mt8192-disp-ccorr
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-ccorr
+          - enum:
+              - mediatek,mt8183-disp-ccorr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index bc83155b3b4c..d0a4b9eb71fd 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -37,6 +37,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8183-disp-color
+              - mediatek,mt8186-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 9d89297f5f1d..9a08514ed909 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -26,6 +26,7 @@ properties:
           - const: mediatek,mt8183-disp-dither
       - items:
           - enum:
+              - mediatek,mt8186-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index dd2896a40ff0..a73044c50b5f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -22,6 +22,7 @@ properties:
       - mediatek,mt7623-dpi
       - mediatek,mt8173-dpi
       - mediatek,mt8183-dpi
+      - mediatek,mt8186-dpi
       - mediatek,mt8192-dpi
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
index 36b01458f45c..c82b8b20de15 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
@@ -7,7 +7,7 @@ channel output.
 
 Required properties:
 - compatible: "mediatek,<chip>-dsi"
-- the supported chips are mt2701, mt7623, mt8167, mt8173 and mt8183.
+- the supported chips are mt2701, mt7623, mt8167, mt8173, mt8183 and mt8186.
 - reg: Physical base address and length of the controller's registers
 - interrupts: The interrupt signal from the function block.
 - clocks: device clocks
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 247baad147b3..6d96f6736d91 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -27,6 +27,7 @@ properties:
           - const: mediatek,mt8183-disp-gamma
       - items:
           - enum:
+              - mediatek,mt8186-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 6eca525eced0..55391b5c08c4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -34,6 +34,8 @@ properties:
           - const: mediatek,mt8173-disp-mutex
       - items:
           - const: mediatek,mt8183-disp-mutex
+      - items:
+          - const: mediatek,mt8186-disp-mutex
       - items:
           - const: mediatek,mt8192-disp-mutex
       - items:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index 611a2dbdefa4..f7f89485a5ae 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -25,6 +25,11 @@ properties:
           - const: mediatek,mt8183-disp-ovl-2l
       - items:
           - const: mediatek,mt8192-disp-ovl-2l
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-ovl-2l
+          - enum:
+              - mediatek,mt8192-disp-ovl-2l
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index e71f79bc2dee..110e6b2747bc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -40,6 +40,11 @@ properties:
               - mediatek,mt8195-disp-ovl
           - enum:
               - mediatek,mt8183-disp-ovl
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-ovl
+          - enum:
+              - mediatek,mt8192-disp-ovl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 6ac1da2e8871..22c333d09465 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -23,6 +23,11 @@ properties:
     oneOf:
       - items:
           - const: mediatek,mt8192-disp-postmask
+      - items:
+          - enum:
+              - mediatek,mt8186-disp-postmask
+          - enum:
+              - mediatek,mt8192-disp-postmask
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 8ef821641672..4f1c935cdf70 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -39,6 +39,7 @@ properties:
               - mediatek,mt2701-disp-rdma
       - items:
           - enum:
+              - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
           - enum:
               - mediatek,mt8183-disp-rdma
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
