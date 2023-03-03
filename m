Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151A8C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 01:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d52g3hRZkl/a2eC5lgJWmYH122SOlYvP/ZU+/rzmV+8=; b=j7tnk2/Hd3K/p9aoX5aL8tTsl/
	RZdZRBtCI2Wxq3Lza8aJg9NDC15g84asHNKetzCGgPLl16lmeem/PrsYopGVT0fCSbLEq4jV7ZjmM
	8/u6u1t191aKHjHBGcYDqG79zVhmJwCyg83dvPz68QohjlXp93orF04menVUH489sJGiJ44VS8Km2
	7jBQ96GnWoCFDtJ01KMsLc8J8eb3MtaznKlELZCiZytVoDZ77/lsskAbmgZGas4eicwxtlbrf/Jvp
	OM90Mct1U3POS/XG0t9fNG9Hwc1i7jGY3aqgiaHWXAoRDaUKx6xcFeUQ0Sh5OXJEckkvNbKc0LWPx
	zF2IXvZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuP2-004DE0-O2; Fri, 03 Mar 2023 01:40:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXuOq-004D6S-1G; Fri, 03 Mar 2023 01:39:57 +0000
X-UUID: 48f325fab96411edbbe3f76fe852e059-20230302
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d52g3hRZkl/a2eC5lgJWmYH122SOlYvP/ZU+/rzmV+8=;
	b=lQ846jgKlZ0WjLrwr6tl0ieoNT7U5vKivqxGQtXHzBvLRgzPYbhw+y/SX0lifug4VnlWWj+DRjNd+GnhYzncBSjH6VUcDEXDHvemo3t55+JcQRkN5ZBmV6cAWxUwrBdOGxtxqBfqmwuk9vkKewlBaFbr3d5fw3RCUcMSN6mexHE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:5ca606d1-7626-4177-87b5-802b66c966d0,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.20,REQID:5ca606d1-7626-4177-87b5-802b66c966d0,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:25b5999,CLOUDID:ce910db2-beed-4dfc-bd9c-e1b22fa6ccc4,B
	ulkID:230303093901TRG18TP9,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: 48f325fab96411edbbe3f76fe852e059-20230302
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 662091089; Thu, 02 Mar 2023 18:39:49 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 3 Mar 2023 09:38:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 3 Mar 2023 09:38:46 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <yunfei.dong@mediatek.com>, "Allen-KH
 Cheng" <allen-kh.cheng@mediatek.com>
Subject: [RESEND 4/6] media: dt-bindings: media: mediatek: vcodec: adapt to the 'clock-names' of different platforms
Date: Fri, 3 Mar 2023 09:38:40 +0800
Message-ID: <20230303013842.23259-5-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
References: <20230303013842.23259-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_173956_084517_633B36F5 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

mt8195 and mt8192 have different clock numbers, separate 'clock-names'
according to compatible name.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 41 ++++++++++++++++---
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 7efc70ae4406..51c0ff7baa52 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
@@ -110,15 +110,12 @@ patternProperties:
           Refer to bindings/iommu/mediatek,iommu.yaml.
 
       clocks:
+        minItems: 4
         maxItems: 5
 
       clock-names:
-        items:
-          - const: sel
-          - const: soc-vdec
-          - const: soc-lat
-          - const: vdec
-          - const: top
+        minItems: 4
+        maxItems: 5
 
       assigned-clocks:
         maxItems: 1
@@ -160,6 +157,38 @@ then:
   required:
     - interrupts
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8192-vcodec-dec
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: sel
+            - const: soc-vdec
+            - const: soc-lat
+            - const: vdec
+            - const: top
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-vcodec-dec
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: sel
+            - const: vdec
+            - const: lat
+            - const: top
+
 additionalProperties: false
 
 examples:
-- 
2.18.0


