Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E553C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 09:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KsyeTIGoxeX8hbNGNba9fJ6I3vs8hxNtDqTr3RcQrKg=; b=O5R7hNJML6crMQ
	BA5eIydZfxj4daHypRC1is1mihv34dZD3x0Xb7IVXAwDS44OBEiM3klprlgZ4RNQ+HKFQDVgYk/7S
	UbZcGKy+9Y96yh9D+JbRkZKfWKd5iuYDeuWaqHdeTmiOYUnlYM+QHXAFX+FvIq3wx1+O689Zn52ZZ
	HpfJga5zitpK4Bo4i9E51ii8lefjzwPzKk4/fgrw90za3XHiHAkTi0Xb1KdiokCqrE8ImjYR6N7E+
	dylkGJQSYphWjdVdkAFJXCNYirA304fOyP4zDVH4VhavnipU0zk7hm5CiH9Zey1JBpjh7diOnJHdp
	mXv23vR5H6Z8OPADp6rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTgef-004i5y-M1; Mon, 14 Mar 2022 09:06:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTge6-004hrk-OV; Mon, 14 Mar 2022 09:05:46 +0000
X-UUID: fc56d9be56ff4c31a53c8990a64782f3-20220314
X-UUID: fc56d9be56ff4c31a53c8990a64782f3-20220314
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1201842953; Mon, 14 Mar 2022 02:05:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 02:00:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 14 Mar 2022 17:00:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 14 Mar 2022 17:00:35 +0800
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
Subject: [PATCH V7 2/5] dt-bindings: display: mediatek: revise enum to const
Date: Mon, 14 Mar 2022 17:00:30 +0800
Message-ID: <20220314090033.25773-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
References: <20220314090033.25773-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_020542_863894_D3E5C5FE 
X-CRM114-Status: UNSURE (   7.50  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml  | 3 +--
 .../bindings/display/mediatek/mediatek,ccorr.yaml           | 3 +--
 .../bindings/display/mediatek/mediatek,color.yaml           | 6 ++----
 .../bindings/display/mediatek/mediatek,dither.yaml          | 3 +--
 .../bindings/display/mediatek/mediatek,gamma.yaml           | 3 +--
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml  | 6 ++----
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 6 ++----
 7 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index 6c8c83988a24..eaf23428b30d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -31,8 +31,7 @@ properties:
               - mediatek,mt8183-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
-          - enum:
-              - mediatek,mt8173-disp-aal
+          - const: mediatek,mt8173-disp-aal
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 0ed53b6238f0..7766c806c102 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -28,8 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8195-disp-ccorr
-          - enum:
-              - mediatek,mt8192-disp-ccorr
+          - const: mediatek,mt8192-disp-ccorr
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index 3ad842eb5668..0c9095b0411e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -32,15 +32,13 @@ properties:
           - enum:
               - mediatek,mt7623-disp-color
               - mediatek,mt2712-disp-color
-          - enum:
-              - mediatek,mt2701-disp-color
+          - const: mediatek,mt2701-disp-color
       - items:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
-          - enum:
-              - mediatek,mt8173-disp-color
+          - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 6657549af165..8180ed0a89ff 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -28,8 +28,7 @@ properties:
           - enum:
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
-          - enum:
-              - mediatek,mt8183-disp-dither
+          - const: mediatek,mt8183-disp-dither
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 78442339314f..5f1825b4512b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -29,8 +29,7 @@ properties:
           - enum:
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
-          - enum:
-              - mediatek,mt8183-disp-gamma
+          - const: mediatek,mt8183-disp-gamma
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index f77094e61443..51f8235f1b1b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -33,13 +33,11 @@ properties:
           - enum:
               - mediatek,mt7623-disp-ovl
               - mediatek,mt2712-disp-ovl
-          - enum:
-              - mediatek,mt2701-disp-ovl
+          - const: mediatek,mt2701-disp-ovl
       - items:
           - enum:
               - mediatek,mt8195-disp-ovl
-          - enum:
-              - mediatek,mt8183-disp-ovl
+          - const: mediatek,mt8183-disp-ovl
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index e8c72afa0630..9a6756f185ee 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -35,13 +35,11 @@ properties:
           - enum:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
-          - enum:
-              - mediatek,mt2701-disp-rdma
+          - const: mediatek,mt2701-disp-rdma
       - items:
           - enum:
               - mediatek,mt8192-disp-rdma
-          - enum:
-              - mediatek,mt8183-disp-rdma
+          - const: mediatek,mt8183-disp-rdma
 
   reg:
     maxItems: 1
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
