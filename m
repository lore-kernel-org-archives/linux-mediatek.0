Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC7CC07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:33:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE7561CAA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 06:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE7561CAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpqjl43/PHuRjQXtEH1LMVjHkeTPcnuXdg7caGvuxD0=; b=A+6lh5WfrhDotp
	S4Ngsl0GQjCbreDIfsWAwKAt2mW8uXqBm8aZxAm+D0peAMBQnL4NO6tusEAUKHzGC4i2evU9K2N8a
	liYbS0149d4rvFS7VEfiCpxFR7uRDPunXAJyZaTDDSftygYe+dgzwftXSB/kmmm87K0uA3wB4at7A
	VhYDpvayDkFwvYcPlUsF5Jmj6hf14kSE/sPRm2f6KGbDPg2qYLbFbtxUaVGLvohVY2wl2oeN6/GSj
	vq5oIQ2P+Ycd0VuvrFd1wXWuzAuSomQYPHFCaEoPgD1ZWEL4CbFK6vBt1qqBuMZP/rxpRA0epMGMH
	DwrNRd6K10XbDW6PTcQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m117R-00DfzV-RF; Wed, 07 Jul 2021 06:33:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m116l-00DfhO-D0; Wed, 07 Jul 2021 06:32:32 +0000
X-UUID: 2da4e91c92f548c58562423d72f01444-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=tAVhCJYExvKiFWaB3vMBRRRrAqCZ5Cq+LN9x6uaC3pk=; 
 b=hSXfDMcpVIn1qTXJkOgybd9pdaHD1Ht3E5IMl6PIM542iuTM56mwjJ8wJz305KYxBJrGxBzaIUkfkWWPBtVzMH0ehNVwO+iRfhi3GteHrlfBhI8w+Dvaipld8rhnnnAocwEJbWUyS8h29Frn1KVSWeqKvoBFIWFFaI0Ob/QZweI=;
X-UUID: 2da4e91c92f548c58562423d72f01444-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1902835562; Tue, 06 Jul 2021 23:32:26 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 23:22:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 14:22:31 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 14:22:30 +0800
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
 12/14] dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for
 mt8192
Date: Wed, 7 Jul 2021 14:21:55 +0800
Message-ID: <20210707062157.21176-13-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210707062157.21176-1-yunfei.dong@mediatek.com>
References: <20210707062157.21176-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_233231_474650_3E7EA757 
X-CRM114-Status: GOOD (  15.32  )
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

Adds decoder dt-bindings for mt8192.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/mediatek-vcodec-comp-decoder.txt    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt
new file mode 100644
index 000000000000..941428cb2f08
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.txt
@@ -0,0 +1,93 @@
+Mediatek Video Decoder With Component
+
+Mediatek Video Decoder is the video decode hw present in Mediatek SoCs which
+supports high resolution decoding functionalities. Required  master and
+component node properties:
+
+Master properties:
+- compatible :
+  "mediatek,mt8192-vcodec-dec" for MT8192 decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- mediatek,scp : the node of the SCP unit, if using SCP.
+
+component properties(core and lat):
+- compatible(core) : "mediatek,mtk-vcodec-core" core hardware decoder
+  "mediatek,mtk-vcodec-core" for core hardware decoder.
+- compatible(lat) : "mediatek,mtk-vcodec-lat" lat hardware decoder
+  "mediatek,mtk-vcodec-lat" for lat hardware decoder.
+- reg : Physical base address of the video decoder registers and length of
+  memory mapped region.
+- interrupts : interrupt number to the cpu.
+- clocks : list of clock specifiers, corresponding to entries in
+  the clock-names property.
+- clock-names: decoder must contain "vcodecpll", "univpll_d2",
+  "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll", "venc_lt_sel",
+  "vdec_bus_clk_src".
+- iommus : should point to the respective IOMMU block with master port as
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  for details.
+- dma-ranges : describes how the physical address space of the IOMMU maps
+  to memory.
+
+vcodec_dec: vcodec_dec@16000000 {
+    compatible = "mediatek,mt8192-vcodec-dec";
+    reg = <0 0x16000000 0 0x1000>;		/* VDEC_SYS */
+    mediatek,scp = <&scp>;
+    iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+  };
+
+vcodec_lat: vcodec_lat@0x16010000 {
+    compatible = "mediatek,mtk-vcodec-lat";
+    reg = <0 0x16010000 0 0x800>;		/* VDEC_MISC */
+    interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH 0>;
+    iommus = <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_VLD2_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_AVC_MV_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_PRED_RD_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_TILE_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_WDMA_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_LAT0_RG_CTRL_DMA_EXT>,
+         <&iommu0 M4U_PORT_L5_VDEC_UFO_ENC_EXT>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+    clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+         <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+         <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+         <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+         <&topckgen CLK_TOP_MAINPLL_D4>;
+    clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec", "vdec-top";
+    assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+    power-domains = <&scpsys MT8192_POWER_DOMAIN_VDEC>;
+  };
+
+vcodec_core: vcodec_core@0x16025000 {
+    compatible = "mediatek,mtk-vcodec-core";
+    reg = <0 0x16025000 0 0x1000>;		/* VDEC_CORE_MISC */
+    interrupts = <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH 0>;
+    iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_UFO_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PP_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PRED_RD_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PRED_WR_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_PPWRAP_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_TILE_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_VLD_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_VLD2_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_AVC_MV_EXT>,
+         <&iommu0 M4U_PORT_L4_VDEC_RG_CTRL_DMA_EXT>;
+    dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
+    clocks = <&topckgen CLK_TOP_VDEC_SEL>,
+         <&vdecsys CLK_VDEC_VDEC>,
+         <&vdecsys CLK_VDEC_LAT>,
+         <&vdecsys CLK_VDEC_LARB1>,
+         <&topckgen CLK_TOP_MAINPLL_D4>;
+    clock-names = "vdec-sel", "vdec-soc-vdec", "vdec-soc-lat", "vdec-vdec", "vdec-top";
+    assigned-clocks = <&topckgen CLK_TOP_VDEC_SEL>;
+    assigned-clock-parents = <&topckgen CLK_TOP_MAINPLL_D4>;
+    power-domains = <&scpsys MT8192_POWER_DOMAIN_VDEC2>;
+ };
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
