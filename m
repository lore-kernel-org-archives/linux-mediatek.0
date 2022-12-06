Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB120C352A1
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Dec 2022 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lj5CWXIGuLtBuhK0tZMR3SP8BZ3ZoFXyfgCI59Jl6HI=; b=dFV9PlsdcdZPHVemmOC8ZcWcMQ
	hepdWM5R9JFkuAAEfRaLBA7PDlk3dHSjIy87fW+G325mmEbdzsqT0uuvW6oNuwTZRt83eHeh3EkbE
	iDg1wKjP6B7YvTCesl17tkAYhj6/myegsxovrVvtlocg4yL6CKQ4C02FwETNGCrzYoshOks3ooaRi
	dMJ4qZblFSBqVaQZeaqUp8ziZsCUKRM3ZmsXTK81L6XkNNrrf1D5V0hO7qluB0881q77FF+ludsVY
	TgE36c/QUdg7CF5kgNzOoWd4km5xVAtqpySZLvLP+2Eb7qcoQSw3kT10Zoit98zvfl5642PD/b47n
	LIvGEVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2SBl-003RNA-TP; Tue, 06 Dec 2022 07:16:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2SBj-003RHo-89; Tue, 06 Dec 2022 07:16:24 +0000
X-UUID: d26deebc8f9845708e4d1ba30dfcffdf-20221206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Lj5CWXIGuLtBuhK0tZMR3SP8BZ3ZoFXyfgCI59Jl6HI=;
	b=PM/5qZLRt8SroTSQD6VzBBaC6NPWtuIZJzk1293H3v5sfkWwTI/uDLgL034X2SJIY2wazguHINeCwgrRuMbHVh1cqKxzqSbbzWA6JNxUl4kxDz5v0zUCKlUcyY2FfU30pKeU3Z3NKD9FExhoQfk1qmXHPhfL9hHfwVLblKT/7vY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:0dedfac5-5cfc-43fc-ad36-e099c5cfec6b,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:f0baab16-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d26deebc8f9845708e4d1ba30dfcffdf-20221206
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 688749772; Tue, 06 Dec 2022 00:16:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 6 Dec 2022 14:45:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 6 Dec 2022 14:45:37 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Rob Herring <robh@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5,1/3] media: dt-bindings: media: mediatek: vcodec: adapt to the 'clock-names' of different platforms
Date: Tue, 6 Dec 2022 14:45:34 +0800
Message-ID: <20221206064536.16592-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_231623_309747_561BB97C 
X-CRM114-Status: UNSURE (   8.83  )
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

mt8195 and mt8192 have different clock numbers, separate 'clock-names'
according to compatible name.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
compared with v4:
- change min clocks and clock-names from 1 to 4
compared with v3:
- rewrite clock-names according to different platforms.

Reference series:
[1]: v5 of this series is presend by Allen-KH Cheng.
     message-id: 20221128143832.25584-4-allen-kh.cheng@mediatek.com
---
 .../media/mediatek,vcodec-subdev-decoder.yaml | 41 ++++++++++++++++---
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
index 7c5b4a91c59b..c56af1c1d9db 100644
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
@@ -159,6 +156,38 @@ then:
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


