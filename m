Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399B3C4708C
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 03:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCjH5YadUbn/bYUrjP6jMIq0bvuigNDLqY4ql8OSZAo=; b=frWKBVSC+Y+mF/VWYmC+J2UhdN
	h7GCj5r2eJwyitx1FnMaO0DmqaoqHRT5BUZp4Qzc8sPvVo6ycRKRFCKUkbz9h/4L7admSsGBMWjhe
	StDy7X67bM3uSQWXHEFiTfIfr4i7ui3WC7bInStSvvEaFQbkSGAuqkhiqBPbsmMnnHKD1IcHX4A0S
	vgmHP5dMudZGjFO/YFjv1e4Wvak6fDiEsmIT3mEQAhjqaJ5t0a9pSJ9y9vJuNlxNBRkOoFHa5MLbE
	cUHn91/qWlYYMflYMgl39o1lHb5sPkTxoiN+2MXxtDMcglEY+0QuozXLrsRznSU49e9RTYlU1Rd9Z
	aFCVKDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ODK-00GDmH-Ua; Tue, 06 Dec 2022 03:01:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2ODH-00GDhc-Sc; Tue, 06 Dec 2022 03:01:45 +0000
X-UUID: a9fd3db92e6d412ba14831bd6390f4ae-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=qCjH5YadUbn/bYUrjP6jMIq0bvuigNDLqY4ql8OSZAo=;
	b=QaQw4oImkw1cOuNaP6JWeYOF+lGS1l2Ias/KklVsNFhNk7wDiaD41KgU+KoUzEtw8nEb5OpnY6nMP1W6TvbLX9W/8qLbJapKzCicb0mqpW35L5WLBXO7fv7JEE8BVzxIOSXyfptSsGcFo4qMtVi7G9CakzD06VOOzb4omD8LFtE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:160444b2-8cf2-443c-b291-e3d438a7f1a3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:0e98a316-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a9fd3db92e6d412ba14831bd6390f4ae-20221205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 442790262; Mon, 05 Dec 2022 20:01:36 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 10:00:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Dec 2022 10:00:57 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rex-BC
 Chen <rex-bc.chen@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho
	<moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 1/6] dt-bindings: mediatek: modify VDOSYS0 display device tree Documentations for MT8188
Date: Tue, 6 Dec 2022 10:00:41 +0800
Message-ID: <20221206020046.11333-2-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221206020046.11333-1-nathan.lu@mediatek.com>
References: <20221206020046.11333-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_190143_961906_A4A8123C 
X-CRM114-Status: UNSURE (   7.73  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nathan Lu <nathan.lu@mediatek.com>

modify VDOSYS0 display device tree Documentations for MT8188.

Signed-off-by: Nathan Lu <nathan.lu@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,color.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
 .../bindings/display/mediatek/mediatek,postmask.yaml          | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
 8 files changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index d4d585485e7b..92741486c24d 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-aal
+              - mediatek,mt8188-disp-aal
               - mediatek,mt8192-disp-aal
               - mediatek,mt8195-disp-aal
           - const: mediatek,mt8183-disp-aal
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index 63fb02014a56..fe444beff558 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -27,6 +27,7 @@ properties:
           - const: mediatek,mt8192-disp-ccorr
       - items:
           - enum:
+              - mediatek,mt8188-disp-ccorr
               - mediatek,mt8195-disp-ccorr
           - const: mediatek,mt8192-disp-ccorr
       - items:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index d2f89ee7996f..62306c88f485 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -37,6 +37,7 @@ properties:
           - enum:
               - mediatek,mt8183-disp-color
               - mediatek,mt8186-disp-color
+              - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
           - const: mediatek,mt8173-disp-color
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index 8ad8187c02d1..5c7445c174e5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -27,6 +27,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-dither
+              - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
               - mediatek,mt8195-disp-dither
           - const: mediatek,mt8183-disp-dither
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index a89ea0ea7542..a5c6a91fac71 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-gamma
+              - mediatek,mt8188-disp-gamma
               - mediatek,mt8192-disp-gamma
               - mediatek,mt8195-disp-gamma
           - const: mediatek,mt8183-disp-gamma
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index a2a27d0ca038..065e526f950e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -36,6 +36,7 @@ properties:
           - const: mediatek,mt2701-disp-ovl
       - items:
           - enum:
+              - mediatek,mt8188-disp-ovl
               - mediatek,mt8195-disp-ovl
           - const: mediatek,mt8183-disp-ovl
       - items:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
index 654080bfbdfb..27de64495401 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,postmask.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8186-disp-postmask
+              - mediatek,mt8188-disp-postmask
           - const: mediatek,mt8192-disp-postmask
 
   reg:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 0882ae86e6c4..3ade2ece3fed 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -31,6 +31,10 @@ properties:
           - const: mediatek,mt8183-disp-rdma
       - items:
           - const: mediatek,mt8195-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt8188-disp-rdma
+          - const: mediatek,mt8195-disp-rdma
       - items:
           - enum:
               - mediatek,mt7623-disp-rdma
-- 
2.18.0


