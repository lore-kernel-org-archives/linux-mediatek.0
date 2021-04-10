Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A24C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:12:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C1F761165
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C1F761165
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eAsCJF10W+It/K0wcJLO1CPFxuCcJeV5rroX6Ho/UDw=; b=VrBOV5uYZYpe58Gsbep5rYEyJ
	XFVsM7sHW7Prtnj/iJof4iuc77fEw16bggm4GRMQMmjUYkNbkag0Vw7yHte/H2kEdF4ufhFKjr9+o
	6zbgPJ9AiOnrZM5VVzdeXLYYj/QCW3Mokzv8+OBY5mJRDR1hBJgWNvOx6SSq132WbP7aeYaivrxPT
	ywbSpgIPZFfn1aHIn1dw8GO5QlrEREMHp7ZnHUtXrmMbFLLiD4En9rIkBCS8P3WWQz+irnoLqc4vZ
	MSg1X7SaPxc9d6CzPTM2G1NOAW+0eUM/q+wAByPhkPauWUWIVStJUaC4VoKl64CfBmuuFPmFZn/Sy
	FSTVNVmAQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV9f9-002Ufd-CP; Sat, 10 Apr 2021 09:12:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9em-002Udf-GC; Sat, 10 Apr 2021 09:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=wztrwZI+KvCjW6FetCyVo9bEcTEG+XOzFMhcXcKB0G4=; b=pm1Xa29JO+kkTEcvkQBPDG0dOV
 4G/QHoBf6pXMgT4TjPfQQJbKSCVDG6nuCWcAsDxv0qm3O+PIXD1yTWsVdtZHdSMi/eyVzkO0NwI+V
 4L/ed1UW4ZYGs9SElvNFtVrOszomjI+b8LdiW6ly/nc0zjUYi1ebv/vmt/Uyk/gWbMnPpozt8mZAB
 h8tCBURm2TR1lyeM4Zqh0gGjFdFHn/6f8rKGCYYQbox11cL5MZ5JcNDxvunO4RqIu7+okzfbts24F
 C2cr4VHr7XvTEeF4sTZHSVEroQZ0ZI+hkB7PRN8oK54N/KbHx9A30kBq/DX4AEjX5tSDUyuN0gtRB
 veewwrsw==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9ej-0050EH-HE; Sat, 10 Apr 2021 09:11:55 +0000
X-UUID: 2dc51ed9ad864bf48794f7c0e06339b3-20210410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wztrwZI+KvCjW6FetCyVo9bEcTEG+XOzFMhcXcKB0G4=; 
 b=TiqrbhVXVEfiDjrENNrSrQ4P+vAIx8wYhcHX88yYlv+MVACJWkbjfXj0O8eQvVU0LF39Lfl739dS5yX1BRlQSzC9CuDNpZ6DuRFdCKUTnAAtwr2EtGtCeloU1XsB0wQCQOQ1cv2mVpz4A0bReAps5IOlYjLE1CQiC7BsO2czGwU=;
X-UUID: 2dc51ed9ad864bf48794f7c0e06339b3-20210410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 325171102; Sat, 10 Apr 2021 02:11:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 02:11:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 17:11:46 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 17:11:45 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>
Subject: [PATCH v5 01/16] dt-binding: mediatek: Get rid of mediatek,
 larb for multimedia HW
Date: Sat, 10 Apr 2021 17:11:13 +0800
Message-ID: <20210410091128.31823-2-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210410091128.31823-1-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_021153_604609_1C16A4C4 
X-CRM114-Status: GOOD (  14.85  )
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
 .../devicetree/bindings/media/mediatek-jpeg-decoder.txt  | 4 ----
 .../devicetree/bindings/media/mediatek-jpeg-encoder.txt  | 4 ----
 Documentation/devicetree/bindings/media/mediatek-mdp.txt | 8 --------
 .../devicetree/bindings/media/mediatek-vcodec.txt        | 4 ----
 5 files changed, 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 93b160df3eec..6336bae8a6d7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -61,8 +61,6 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-rdma"
 	"mediatek,<chip>-disp-wdma"
   the supported chips are mt2701, mt8167 and mt8173.
-- larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
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
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
index cf60c5acc0e4..7978f210e3d4 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
@@ -15,9 +15,6 @@ Required properties:
 - clock-names: must contain "jpgdec-smi" and "jpgdec".
 - power-domains: a phandle to the power domain, see
   Documentation/devicetree/bindings/power/power_domain.txt for details.
-- mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-  for details.
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
@@ -32,7 +29,6 @@ Example:
 		clock-names = "jpgdec-smi",
 			      "jpgdec";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGDEC_WDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGDEC_BSDMA>;
 	};
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
index acfb50375b8a..4b3664987362 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -13,9 +13,6 @@ Required properties:
 - clock-names: must contain "jpgenc". It is the clock of JPEG encoder.
 - power-domains: a phandle to the power domain, see
   Documentation/devicetree/bindings/power/power_domain.txt for details.
-- mediatek,larb: must contain the local arbiters in the current SoCs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
-  for details.
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
@@ -29,7 +26,6 @@ Example:
 		clocks =  <&imgsys CLK_IMG_VENC>;
 		clock-names = "jpgenc";
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_ISP>;
-		mediatek,larb = <&larb2>;
 		iommus = <&iommu MT2701_M4U_PORT_JPGENC_RDMA>,
 			 <&iommu MT2701_M4U_PORT_JPGENC_BSDMA>;
 	};
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index f4798d04e925..df69c5a06250 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -27,9 +27,6 @@ Required properties (DMA function blocks, child node):
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
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
index 8318f0ed492d..ad7ba4bf23fe 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -12,7 +12,6 @@ Required properties:
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- mediatek,larb : must contain the local arbiters in the current Socs.
 - clocks : list of clock specifiers, corresponding to entries in
   the clock-names property.
 - clock-names: avc encoder must contain "venc_sel", vp8 encoder must
@@ -44,7 +43,6 @@ vcodec_dec: vcodec@16000000 {
           <0 0x16027800 0 0x800>,   /*VP8_VL*/
           <0 0x16028400 0 0x400>;   /*VP9_VD*/
     interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
-    mediatek,larb = <&larb1>;
     iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
              <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
              <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
@@ -97,7 +95,6 @@ vcodec_enc_avc: vcodec@18002000 {
              <&iommu M4U_PORT_VENC_REF_CHROMA>,
              <&iommu M4U_PORT_VENC_NBM_RDMA>,
              <&iommu M4U_PORT_VENC_NBM_WDMA>;
-    mediatek,larb = <&larb3>;
     mediatek,vpu = <&vpu>;
     clocks = <&topckgen CLK_TOP_VENC_SEL>;
     clock-names = "venc_sel";
@@ -118,7 +115,6 @@ vcodec_enc_vp8: vcodec@19002000 {
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
