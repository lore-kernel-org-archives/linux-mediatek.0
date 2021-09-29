Return-Path: <SRS0=h0C2=OT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F07BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:38:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44254613C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Sep 2021 01:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44254613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iNuLn9wApfrawcu+GpOm95MA/EHoEkR0TcDCB+wm70U=; b=fSZ5k8KHt3WkUc
	ijBc44toj1D79JaOOjcf97YAlwaL/mJbqM51fLbytaw+OzALOxXhL2fYjpg4P9bkpuaSWtiGdS4rR
	YjpQq4+2u1fwHsLq1/wXNoHwbBSCBlZi8WjKrHSy/AHk66xOnNcVZ1Xt71l6YQyGT3jjj8HTZcjUY
	2yXQ90t9MpjF5cYB9p9/dbyq3DT2cXcX6qGYBpWfsO0qb1qfzfMc+phoCrlkzxmSqsb06DeLhJoJS
	Ap386frG4m877Gd7qnTZ3lTakrzQZcF6mjYV9CbsaUNACEwML534COXWZKLEsxggagHeUvNecRF7G
	olZtj1HGPDNcidUV6QcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVOXt-009ZEf-O5; Wed, 29 Sep 2021 01:38:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVOXZ-009Z4F-8o; Wed, 29 Sep 2021 01:37:48 +0000
X-UUID: d0739b3f7e9748e698eeea50735f82d4-20210928
X-UUID: d0739b3f7e9748e698eeea50735f82d4-20210928
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 205404534; Tue, 28 Sep 2021 18:37:40 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Sep 2021 18:37:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 29 Sep 2021 09:37:37 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Sep 2021 09:37:35 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Matthias Kaehlcke
 <mka@chromium.org>, <anan.sun@mediatek.com>, <yi.kuo@mediatek.com>,
 <acourbot@chromium.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Tiffany Lin <tiffany.lin@mediatek.com>, "Dafna
 Hirschfeld" <dafna.hirschfeld@collabora.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 <anthony.huang@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH v8 01/12] dt-binding: mediatek: Get rid of mediatek,
 larb for multimedia HW
Date: Wed, 29 Sep 2021 09:37:08 +0800
Message-ID: <20210929013719.25120-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210929013719.25120-1-yong.wu@mediatek.com>
References: <20210929013719.25120-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_183745_330377_9FEDEA78 
X-CRM114-Status: GOOD (  16.68  )
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

After adding device_link between the consumer with the smi-larbs,
if the consumer call its owner pm_runtime_get(_sync), the
pm_runtime_get(_sync) of smi-larb and smi-common will be called
automatically. Thus, the consumer don't need the property.

And IOMMU also know which larb this consumer connects with from
iommu id in the "iommus=" property.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Evan Green <evgreen@chromium.org>
---
 .../bindings/display/mediatek/mediatek,disp.txt          | 9 ---------
 .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml | 9 ---------
 .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml | 9 ---------
 Documentation/devicetree/bindings/media/mediatek-mdp.txt | 8 --------
 .../devicetree/bindings/media/mediatek-vcodec.txt        | 4 ----
 5 files changed, 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index fbb59c9ddda6..867bd82e2f03 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -61,8 +61,6 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
   the supported chips are mt2701, mt8167 and mt8173.
-- larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
@@ -91,7 +89,6 @@ ovl0: ovl@1400c000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_OVL0>;
 	iommus = <&iommu M4U_PORT_DISP_OVL0>;
-	mediatek,larb = <&larb0>;
 };
 
 ovl1: ovl@1400d000 {
@@ -101,7 +98,6 @@ ovl1: ovl@1400d000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_OVL1>;
 	iommus = <&iommu M4U_PORT_DISP_OVL1>;
-	mediatek,larb = <&larb4>;
 };
 
 rdma0: rdma@1400e000 {
@@ -111,7 +107,6 @@ rdma0: rdma@1400e000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA0>;
-	mediatek,larb = <&larb0>;
 	mediatek,rdma-fifosize = <8192>;
 };
 
@@ -122,7 +117,6 @@ rdma1: rdma@1400f000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA1>;
-	mediatek,larb = <&larb4>;
 };
 
 rdma2: rdma@14010000 {
@@ -132,7 +126,6 @@ rdma2: rdma@14010000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_RDMA2>;
 	iommus = <&iommu M4U_PORT_DISP_RDMA2>;
-	mediatek,larb = <&larb4>;
 };
 
 wdma0: wdma@14011000 {
@@ -142,7 +135,6 @@ wdma0: wdma@14011000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_WDMA0>;
 	iommus = <&iommu M4U_PORT_DISP_WDMA0>;
-	mediatek,larb = <&larb0>;
 };
 
 wdma1: wdma@14012000 {
@@ -152,7 +144,6 @@ wdma1: wdma@14012000 {
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_DISP_WDMA1>;
 	iommus = <&iommu M4U_PORT_DISP_WDMA1>;
-	mediatek,larb = <&larb4>;
 };
 
 color0: color@14013000 {
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
index 9b87f036f178..052e752157b4 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.yaml
@@ -42,13 +42,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,larb:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: |
-      Must contain the local arbiters in the current Socs, see
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-      for details.
-
   iommus:
     maxItems: 2
     description: |
@@ -63,7 +56,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - mediatek,larb
   - iommus
 
 additionalProperties: false
@@ -83,7 +75,6 @@ examples:
       clock-names = "jpgdec-smi",
                     "jpgdec";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-      mediatek,larb = <&larb2>;
       iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
                <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
     };
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
index fcd9b829e036..8bfdfdfaba59 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
@@ -35,13 +35,6 @@ properties:
   power-domains:
     maxItems: 1
 
-  mediatek,larb:
-    $ref: '/schemas/types.yaml#/definitions/phandle'
-    description: |
-      Must contain the local arbiters in the current Socs, see
-      Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-      for details.
-
   iommus:
     maxItems: 2
     description: |
@@ -56,7 +49,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - mediatek,larb
   - iommus
 
 additionalProperties: false
@@ -75,7 +67,6 @@ examples:
       clocks =  <&imgsys CLK_IMG_VENC>;
       clock-names = "jpgenc";
       power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-      mediatek,larb = <&larb2>;
       iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
                <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
     };
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index caa24943da33..53ef26e2c857 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -27,9 +27,6 @@ Required properties (DMA function blocks, child node):
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
-- mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-  for details.
 
 Example:
 	mdp_rdma0: rdma@14001000 {
@@ -40,7 +37,6 @@ Example:
 			 <&mmsys CLK_MM_MUTEX_32K>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-		mediatek,larb = <&larb0>;
 		mediatek,vpu = <&vpu>;
 	};
 
@@ -51,7 +47,6 @@ Example:
 			 <&mmsys CLK_MM_MUTEX_32K>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_RDMA1>;
-		mediatek,larb = <&larb4>;
 	};
 
 	mdp_rsz0: rsz@14003000 {
@@ -81,7 +76,6 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WDMA>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WDMA>;
-		mediatek,larb = <&larb0>;
 	};
 
 	mdp_wrot0: wrot@14007000 {
@@ -90,7 +84,6 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WROT0>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WROT0>;
-		mediatek,larb = <&larb0>;
 	};
 
 	mdp_wrot1: wrot@14008000 {
@@ -99,5 +92,4 @@ Example:
 		clocks = <&mmsys CLK_MM_MDP_WROT1>;
 		power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 		iommus = <&iommu M4U_PORT_MDP_WROT1>;
-		mediatek,larb = <&larb4>;
 	};
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index ad1321e5a22d..71237355cc7e 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -13,7 +13,6 @@ Required properties:
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- mediatek,larb : must contain the local arbiters in the current Socs.
 - clocks : list of clock specifiers, corresponding to entries in
   the clock-names property.
 - clock-names: avc encoder must contain "venc_sel", vp8 encoder must
@@ -46,7 +45,6 @@ vcodec_dec: vcodec@16000000 {
           <0 0x16027800 0 0x800>,   /*VP8_VL*/
           <0 0x16028400 0 0x400>;   /*VP9_VD*/
     interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-    mediatek,larb = <&larb1>;
     iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
              <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
              <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
@@ -99,7 +97,6 @@ vcodec_enc_avc: vcodec@18002000 {
              <&iommu M4U_PORT_VENC_REF_CHROMA>,
              <&iommu M4U_PORT_VENC_NBM_RDMA>,
              <&iommu M4U_PORT_VENC_NBM_WDMA>;
-    mediatek,larb = <&larb3>;
     mediatek,vpu = <&vpu>;
     clocks = <&topckgen CLK_TOP_VENC_SEL>;
     clock-names = "venc_sel";
@@ -120,7 +117,6 @@ vcodec_enc_vp8: vcodec@19002000 {
              <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
              <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
              <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
-    mediatek,larb = <&larb5>;
     mediatek,vpu = <&vpu>;
     clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
     clock-names = "venc_lt_sel";
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
