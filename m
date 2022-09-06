Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B52C38145
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usD1Nl+YfysSx3RtAHNYanmoavJYYNn756N4pdT+ReA=; b=lEhnpipD8qGpU2Sg6+rsLh17WI
	yjgrgDwu4Fs4vR8gOdogGfKtS0SKtl6ByYaPsrlWQjArYyWGNbeo8LiLdQPFFMfBc1t01iVcEyFLg
	o9VVf0pGoSo50XnUYoILJ69LRk5Xs99qJ+yKY0l75h51zjjetfAQjjfpqkwmRZXBPCmzMNQQwoUlk
	IwBN4ii8AaSos+bamlvZqVp3ZVMQvH4kxUMIe9a9ktE48R8/aT2q4wuvnEZZQlOeeitI/pQFmQTLc
	0W89yS6HxAE8EQwoBpN74+oWCF7nIQnKWcDB/DVVCVBnXHk1l0vUYRhxggNL7z5nkgl3e7Hd5X6Mc
	9At1L1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUEW-00BR3o-C3; Tue, 06 Sep 2022 08:47:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUDO-00BQMv-HB; Tue, 06 Sep 2022 08:46:02 +0000
X-UUID: d8ca2266409e47dfbd0082a762deca62-20220906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=usD1Nl+YfysSx3RtAHNYanmoavJYYNn756N4pdT+ReA=;
	b=Yd5HFLZvI9R4tngYvxsTph1wZBv24tADcbt3F/iia3kaTz4fm7qP4YrGR+haTyPu6AOM9f4b55Qy2BfLd7hWX6Kt/V6cUnFb034oLihbjJsQOet9UUArrySlzu+J455tDOJLt1MTZG0QONDf8kZF0zubeELlM53iB+aej39wT4w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:94695627-139f-4d99-bc2f-e584ed4b894d,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:9007cf56-e800-47dc-8adf-0c936acf4f1b,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d8ca2266409e47dfbd0082a762deca62-20220906
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nathan.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1003329511; Tue, 06 Sep 2022 01:45:42 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Sep 2022 16:45:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 6 Sep 2022 16:45:09 +0800
From: nathan.lu <nathan.lu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: "jason-jh . lin" <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Rex-BC
 Chen" <rex-bc.chen@mediatek.com>, Nathan Lu <nathan.lu@mediatek.com>, Moudy
 Ho <moudy.ho@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <wsd_upstream@mediatek.com>,
	<lancelot.wu@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 1/6] dt-bindings: mediatek: modify VDOSYS0 display device tree Documentations for MT8188
Date: Tue, 6 Sep 2022 16:44:44 +0800
Message-ID: <20220906084449.20124-2-nathan.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220906084449.20124-1-nathan.lu@mediatek.com>
References: <20220906084449.20124-1-nathan.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_014550_676763_388D0400 
X-CRM114-Status: UNSURE (   8.75  )
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


