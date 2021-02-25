Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B871C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 07:46:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AAC64E21
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 07:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AAC64E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+erj9gi0q6/N1xJDbPIKhJQcp41CYcUrODbaTumKE8=; b=oI4TrcuKfPQbub2rKKdndZMtRM
	XyH7lNJypqrVN1V2M9T9W6p4c7riaytt4YHGsPLjpirBS9fB6pMSj8r2jb8gWwdE6gNqI/xKyopJf
	KNROMC4SJ13yC1r0tMcOQ++BcqDv49SZHNZ4hwpYAmE2DQZaF1Csr3mM+Qchx6DdfDegrDU8uqxMP
	zZL9TziSyTGCN0sxeXCwCNWC2bVYkUlZlcnfJ5+m4JIbAO/PJbQJq+SlOC1/Gj0nXdBLL5aqKsmMY
	io5rYgfzIWoMdXnnhov52zy+4Vet1N15vDVaexLDF61GuOOwGwaBLUorOgAnkyxQYJ+b29nbBkRBQ
	+nLMB7bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFBLl-0004xC-Ky; Thu, 25 Feb 2021 07:46:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFBLj-0004wd-OT; Thu, 25 Feb 2021 07:46:16 +0000
X-UUID: 8f02305124834550a815be5bb368477b-20210224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=62Xc5TfMBiQvjEJZoG3nHFHxghSYchdE5f5J/ife1AM=; 
 b=R4ZcvfY4cQOMPz1EnVIBrAnOtz9CNjzp9xan+/C3L7jVW3YL4LZm1Oby+aR4kDwu+QHwCC7R5E5+hhP753EYxNQZQJZhMivpc6BJ1V9cbNyyQXDTA6TOPZGYPfUr2r1dMrlpC6RICUnUj9iXlzZVH71w7WU1Jrt5w/XlFaxhe+U=;
X-UUID: 8f02305124834550a815be5bb368477b-20210224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1186471415; Wed, 24 Feb 2021 23:46:12 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Feb 2021 23:36:10 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Feb 2021 15:36:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 15:36:07 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 <yong.wu@mediatek.com>
Subject: [PATCH v2,
 1/3] dt-bindings: media: mtk-vcodec: Separating mtk vcodec encoder
 node
Date: Thu, 25 Feb 2021 15:36:01 +0800
Message-ID: <20210225073603.5881-1-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_024616_028470_D11775C6 
X-CRM114-Status: GOOD (  13.35  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Irui Wang <irui.wang@mediatek.com>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Updates binding document since the avc and vp8 hardware encoder in
MT8173 are now separated. Separate "mediatek,mt8173-vcodec-enc" to
"mediatek,mt8173-vcodec-enc-vp8" and "mediatek,mt8173-vcodec-enc".

This is a preparing patch for smi cleaning up "mediatek,larb".

Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
Change since v1:
- rename compatible and device node
---
 .../bindings/media/mediatek-vcodec.txt        | 55 ++++++++++---------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8217424fd4bd..03209cbd7540 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -4,7 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
 supports high resolution encoding and decoding functionalities.
 
 Required properties:
-- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
+- compatible : must be one of the following string:
+  "mediatek,mt8173-vcodec-enc-vp8" for mt8173 vp8 encoder.
+  "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
 - reg : Physical base address of the video codec registers and length of
@@ -13,10 +15,10 @@ Required properties:
 - mediatek,larb : must contain the local arbiters in the current Socs.
 - clocks : list of clock specifiers, corresponding to entries in
   the clock-names property.
-- clock-names: encoder must contain "venc_sel_src", "venc_sel",,
-  "venc_lt_sel_src", "venc_lt_sel", decoder must contain "vcodecpll",
-  "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
-  "venc_lt_sel", "vdec_bus_clk_src".
+- clock-names:
+   encoder must contain "venc_sel";
+   decoder  must contain "vcodecpll", "univpll_d2", "clk_cci400_sel",
+   "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel", "vdec_bus_clk_src".
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
@@ -80,14 +82,10 @@ vcodec_dec: vcodec@16000000 {
     assigned-clock-rates = <0>, <0>, <0>, <1482000000>, <800000000>;
   };
 
-  vcodec_enc: vcodec@18002000 {
+vcodec_enc_avc: vcodec@18002000 {
     compatible = "mediatek,mt8173-vcodec-enc";
-    reg = <0 0x18002000 0 0x1000>,    /*VENC_SYS*/
-          <0 0x19002000 0 0x1000>;    /*VENC_LT_SYS*/
-    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>,
-		 <GIC_SPI 202 IRQ_TYPE_LEVEL_LOW>;
-    mediatek,larb = <&larb3>,
-		    <&larb5>;
+    reg = <0 0x18002000 0 0x1000>;
+    interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
     iommus = <&iommu M4U_PORT_VENC_RCPU>,
              <&iommu M4U_PORT_VENC_REC>,
              <&iommu M4U_PORT_VENC_BSDMA>,
@@ -98,8 +96,20 @@ vcodec_dec: vcodec@16000000 {
              <&iommu M4U_PORT_VENC_REF_LUMA>,
              <&iommu M4U_PORT_VENC_REF_CHROMA>,
              <&iommu M4U_PORT_VENC_NBM_RDMA>,
-             <&iommu M4U_PORT_VENC_NBM_WDMA>,
-             <&iommu M4U_PORT_VENC_RCPU_SET2>,
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
              <&iommu M4U_PORT_VENC_REC_FRM_SET2>,
              <&iommu M4U_PORT_VENC_BSDMA_SET2>,
              <&iommu M4U_PORT_VENC_SV_COMA_SET2>,
@@ -108,17 +118,10 @@ vcodec_dec: vcodec@16000000 {
              <&iommu M4U_PORT_VENC_CUR_CHROMA_SET2>,
              <&iommu M4U_PORT_VENC_REF_LUMA_SET2>,
              <&iommu M4U_PORT_VENC_REC_CHROMA_SET2>;
+    mediatek,larb = <&larb5>;
     mediatek,vpu = <&vpu>;
-    clocks = <&topckgen CLK_TOP_VENCPLL_D2>,
-             <&topckgen CLK_TOP_VENC_SEL>,
-             <&topckgen CLK_TOP_UNIVPLL1_D2>,
-             <&topckgen CLK_TOP_VENC_LT_SEL>;
-    clock-names = "venc_sel_src",
-                  "venc_sel",
-                  "venc_lt_sel_src",
-                  "venc_lt_sel";
-    assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>,
-                      <&topckgen CLK_TOP_VENC_LT_SEL>;
-    assigned-clock-parents = <&topckgen CLK_TOP_VENCPLL_D2>,
-                             <&topckgen CLK_TOP_UNIVPLL1_D2>;
+    clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    clock-names = "venc_lt_sel";
+    assigned-clocks = <&topckgen CLK_TOP_VENC_LT_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_VCODECPLL_370P5>;
   };
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
