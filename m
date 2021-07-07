Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC25C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:33:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42AF961C17
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42AF961C17
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFPqAQKPUEAy0/kC6yohITIWJ3EkAtIb7I83wiG63xc=; b=ri87tjhURXqcJi
	OR8j2cZr9sMiy681p4MWVGcJh6fHZ1eEbnmONNmUHCSGx1p9z1GjazgbE9bK4I32sa2y4jkD6SKXz
	25yaMDly+HB00AQk5x9O99n6gfkYIYNOw0YuIswO09O6RBvphmMEg/OZcFfSZTFozLSbo5WB6LVEi
	Tnrs5D5qklEFJy+Bm8A+Ly2ALHMpQNDVVa5zm6sfxbntZfh9BBWjrNdjUdT2V987BsajXKeNu1RPh
	d2eO00XEn6BWDbkhsT11O+wDkQgnAOFkP3wRAM5zqFJ5x3AkNjQ7Sccj7xbb86GNTq4aFOdED+bpA
	epVUusL1cP+BzpRR7uFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m117E-00DfuW-OU; Wed, 07 Jul 2021 06:33:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m116k-00Dfic-1y; Wed, 07 Jul 2021 06:32:32 +0000
X-UUID: cda61799afc0457fae488349651261a9-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=9BUxSeTJAY1PW8Mw8YLWZmMT3BA1pCp70BGOFKxZthA=; 
 b=q66H0Ar1D5cXRc3DWT1UABKCQAGwbJk5DyegVvlVA1Na4hAl0m6bybsk+Tn13OErBHB0x+3ewbIehTbY6ooKIYmK3WxAljhGpbS3r5gSLGFbogjzCkyykXcTqiRZoV2X2abTXHqiEOOm7t+1CVcHutXUOytXruUBejlOi0bJaoA=;
X-UUID: cda61799afc0457fae488349651261a9-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 443426349; Tue, 06 Jul 2021 23:32:26 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:22:26 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:19 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v1,
 04/14] dt-bindings: media: mtk-vcodec: Separate video encoder and
 decoder dt-bindings
Date: Wed, 7 Jul 2021 14:21:47 +0800
Message-ID: <20210707062157.21176-5-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_233230_159944_9D389177 
X-CRM114-Status: GOOD (  17.57  )
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

Decoder will use component framework to manage hardware, it is big
difference with encoder.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/mediatek-vcodec-decoder.txt         | 169 ++++++++++++++++++
 .../media/mediatek-vcodec-encoder.txt         |  73 ++++++++
 2 files changed, 242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
new file mode 100644
index 000000000000..e09c1d0b6820
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-decoder.txt
@@ -0,0 +1,169 @@
+Mediatek Video Decoder
+
+Mediatek Video Decoder is the video decode hw present in Mediatek SoCs which
+supports high resolution decoding functionalities. With component framework
+require master and component node properties:
+
+Required properties(no component framework):
+- compatible : must be one of the following string:
+  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- mediatek,larb : must contain the local arbiters in the current Socs.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: must contain "vcodecpll", "univpll_d2", "clk_cci400_sel"
+  "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- dma-ranges : describes the dma address range space that the codec hw access.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+Master properties(component framework):
+- compatible :
+  "mediatek,mt8192-vcodec-dec" for MT8192 decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+component properties(lat/core):
+- compatible :
+   "mediatek,mtk-vcodec-lat" for lat hardware decoder.
+  "mediatek,mtk-vcodec-core" core hardware decoder
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec", "vdec-top".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+Example:
+
+No component framework:
+vcodec_dec: vcodec@16000000 {
+    compatible = "mediatek,mt8173-vcodec-dec";
+    reg = <0 0x16000000 0 0x100>,   /*VDEC_SYS*/
+          <0 0x16020000 0 0x1000>,  /*VDEC_MISC*/
+          <0 0x16021000 0 0x800>,   /*VDEC_LD*/
+          <0 0x16021800 0 0x800>,   /*VDEC_TOP*/
+          <0 0x16022000 0 0x1000>,  /*VDEC_CM*/
+          <0 0x16023000 0 0x1000>,  /*VDEC_AD*/
+          <0 0x16024000 0 0x1000>,  /*VDEC_AV*/
+          <0 0x16025000 0 0x1000>,  /*VDEC_PP*/
+          <0 0x16026800 0 0x800>,   /*VP8_VD*/
+          <0 0x16027000 0 0x800>,   /*VP6_VD*/
+          <0 0x16027800 0 0x800>,   /*VP8_VL*/
+          <0 0x16028400 0 0x400>;   /*VP9_VD*/
+    interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_LOW>;
+    mediatek,larb = <&larb1>;
+    iommus = <&iommu M4U_PORT_HW_VDEC_MC_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PP_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_AVC_MV_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_RD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_PRED_WR_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_UFO_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD_EXT>,
+             <&iommu M4U_PORT_HW_VDEC_VLD2_EXT>;
+    mediatek,vpu = <&vpu>;
+    power-domains = <&scpsys MT8173_POWER_DOMAIN_VDEC>;
+    clocks = <&apmixedsys CLK_APMIXED_VCODECPLL>,
+             <&topckgen CLK_TOP_UNIVPLL_D2>,
+             <&topckgen CLK_TOP_CCI400_SEL>,
+             <&topckgen CLK_TOP_VDEC_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL>,
+             <&apmixedsys CLK_APMIXED_VENCPLL>,
+             <&topckgen CLK_TOP_VENC_LT_SEL>,
+             <&topckgen CLK_TOP_VCODECPLL_370P5>;
+    clock-names = "vcodecpll",
+                  "univpll_d2",
+                  "clk_cci400_sel",
+                  "vdec_sel",
+                  "vdecpll",
+                  "vencpll",
+                  "venc_lt_sel",
+                  "vdec_bus_clk_src";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>,
+                      <&topckgen CLK_TOP_CCI400_SEL>,
+                      <&topckgen CLK_TOP_VDEC_SEL>,
+                      <&apmixedsys CLK_APMIXED_VCODECPLL>,
+                      <&apmixedsys CLK_APMIXED_VENCPLL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>,
+                             <&topckgen CLK_TOP_UNIVPLL_D2>,
+                             <&topckgen CLK_TOP_VCODECPLL>;
+    assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
+  };
+
+With component framework:
+vcodec_dec: vcodec_dec@16000000 {
+	compatible = "mediatek,mt8192-vcodec-dec";
+	reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+	mediatek,scp = <&scp>;
+	iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+  };
+
+vcodec_lat: vcodec_lat@0x16010000 {
+    compatible = "mediatek,mtk-vcodec-lat";
+    reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
+    interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+    iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+             <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+	clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+             <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+             <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+             <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+             <&topckgen CLK_TOP_MAINPLL_D4>;
+	clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+                  "vdec-vdec", "vdec-top";
+	assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+	power-domains = <&spm MT8192_POWER_DOMAIN_VDEC>;
+  };
+
+vcodec_core: vcodec_core@0x16025000 {
+	compatible = "mediatek,mtk-vcodec-core";
+	reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
+	interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+	iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+             <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+	clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+             <&vdecsys CLK_VDEC_VDEC>,
+             <&vdecsys CLK_VDEC_LAT>,
+             <&vdecsys CLK_VDEC_LARB1>,
+             <&topckgen CLK_TOP_MAINPLL_D4>;
+	clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat",
+                  "vdec-vdec", "vdec-top";
+	assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+	assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+	power-domains = <&spm MT8192_POWER_DOMAIN_VDEC2>;
+  };
\ No newline at end of file
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
new file mode 100644
index 000000000000..e73682dc0c81
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
@@ -0,0 +1,73 @@
+Mediatek Video Encoder
+
+Mediatek Video Encoder is the video encode hw present in Mediatek SoCs which
+supports high resolution encoding functionalities.
+
+Required properties:
+- compatible : must be one of the following string:
+  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
+  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
+  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
+  "mediatek,mt8192-vcodec-enc" for MT8192 encoder.
+- reg : Physical base address of the video encoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- mediatek,larb : must contain the local arbiters in the current Socs.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: avc encoder must contain "venc_sel", vp8 encoder must
+  contain "venc_lt_sel".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- dma-ranges : describes the dma address range space that the codec hw access.
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+
+Example:
+
+vcodec_enc_avc: vcodec@18002000 {
+    compatible = "mediatek,mt8173-vcodec-enc";
+    reg = <0 0x18002000 0 0x1000>;
+    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+    iommus = <&iommu M4U_PORT_VENC_RCPU>,
+             <&iommu M4U_PORT_VENC_REC>,
+             <&iommu M4U_PORT_VENC_BSDMA>,
+             <&iommu M4U_PORT_VENC_SV_COMV>,
+             <&iommu M4U_PORT_VENC_RD_COMV>,
+             <&iommu M4U_PORT_VENC_CUR_LUMA>,
+             <&iommu M4U_PORT_VENC_CUR_CHROMA>,
+             <&iommu M4U_PORT_VENC_REF_LUMA>,
+             <&iommu M4U_PORT_VENC_REF_CHROMA>,
+             <&iommu M4U_PORT_VENC_NBM_RDMA>,
+             <&iommu M4U_PORT_VENC_NBM_WDMA>;
+    mediatek,larb = <&larb3>;
+    mediatek,vpu = <&vpu>;
+    clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    clock-names = "venc_sel";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL>;
+  };
+
+vcodec_enc_vp8: vcodec@19002000 {
+    compatible = "mediatek,mt8173-vcodec-enc-vp8";
+    reg =  <0 0x19002000 0 0x1000>;	/* VENC_LT_SYS */
+    interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
+    iommus = <&iommu M4U_PORT_VENC_RCPU_SET2>,
+             <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
+             <&iommu M4U_PORT_VENC_BSDMA_SET2>,
+             <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_RD_COMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
+             <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
+             <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+    mediatek,larb = <&larb5>;
+    mediatek,vpu = <&vpu>;
+    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    clock-names = "venc_lt_sel";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
+  };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
