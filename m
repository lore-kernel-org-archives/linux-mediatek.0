Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CE9C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PASUmfRYlfonkLjeWFZ6kVNaFYE4vLC0s6YENetFGok=; b=A3j5JsfwbQqR1b
	iXH/tWPAOAlaH3jvBbSosfTCcjBwGcDvj5ZOMQIQLyXo6GlnS+VxhP4DjxbsH5vLRzaNRhAYqhp46
	XH03GxLGDsFMzYCgKEmxVvsOXuyjNZwato4MQE2jQYdu1s7ESUuZZyAL4H8DFI2mcfcVX9n0OChhY
	ReRYcbdtwPKJwq3bSjVX8GGcYvloHTRp8+sGnfVtKGNmTWU3sfJRgZpnlXX4CDJ2WrVECdEldxTlr
	VNjbTgqGEYRZ050/U6QBTGL9O3THBaAdA2SqTMGZiEUjprC33+o8Imn6SH5tUj6W4XZiTKrantjgI
	f8QAL6dLrlLq1266jKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOxbe-00FWR3-R9; Tue, 01 Mar 2022 08:11:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOxbH-00FWKU-WC; Tue, 01 Mar 2022 08:11:17 +0000
X-UUID: 434ef0b1bca242bf90fdc40b4c56b983-20220301
X-UUID: 434ef0b1bca242bf90fdc40b4c56b983-20220301
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1939422690; Tue, 01 Mar 2022 01:11:11 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Mar 2022 00:01:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 1 Mar 2022 16:01:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Mar 2022 16:01:06 +0800
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
Subject: [PATCH V5 3/6] dt-bindings: display: mediatek: revise enum to const
Date: Tue, 1 Mar 2022 16:01:02 +0800
Message-ID: <20220301080105.31323-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
References: <20220301080105.31323-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_001116_051973_CE03493E 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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

There won't be more than 1 fallback for these bindings, so we modify
them to use const instead of enum.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 4 ++--
 .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 2 +-
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 4 ++--
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++--
 7 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 191b56e16bee..bc1c70d089ba 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -31,7 +31,7 @@ properties:
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
-          - enum:
+          - const:
               - mediatek,mt8173-disp-aal
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 6894b6999412..fc40e2981eaa 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -28,7 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-disp-ccorr
-          - enum:
+          - const:
               - mediatek,mt8192-disp-ccorr
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index bc83155b3b4c..22ed5d368cbe 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -32,14 +32,14 @@ properties:
           - enum:
               - mediatek,mt7623-disp-color
               - mediatek,mt2712-disp-color
-          - enum:
+          - const:
               - mediatek,mt2701-disp-color
       - items:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
-          - enum:
+          - const:
               - mediatek,mt8173-disp-color
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 9d89297f5f1d..2a82792b2625 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -28,7 +28,7 @@ properties:
           - enum:
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
-          - enum:
+          - const:
               - mediatek,mt8183-disp-dither
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 247baad147b3..45f88bdf07bb 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -29,7 +29,7 @@ properties:
           - enum:
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
-          - enum:
+          - const:
               - mediatek,mt8183-disp-gamma
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index e71f79bc2dee..88ba3f27b0e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -33,12 +33,12 @@ properties:
           - enum:
               - mediatek,mt7623-disp-ovl
               - mediatek,mt2712-disp-ovl
-          - enum:
+          - const:
               - mediatek,mt2701-disp-ovl
       - items:
           - enum:
               - mediatek,mt8195-disp-ovl
-          - enum:
+          - const:
               - mediatek,mt8183-disp-ovl
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 8ef821641672..56368c10d904 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -35,12 +35,12 @@ properties:
           - enum:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
-          - enum:
+          - const:
               - mediatek,mt2701-disp-rdma
       - items:
           - enum:
               - mediatek,mt8192-disp-rdma
-          - enum:
+          - const:
               - mediatek,mt8183-disp-rdma
 
   reg:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
