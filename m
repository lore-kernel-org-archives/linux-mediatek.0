Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00F9C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA9A600D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 09:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AA9A600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioUki1AABDMMM86g0qp+2NzE6nLv8ZCGgVVhFwOJU64=; b=ZES3Oogfhw2n20
	OzLWz0cW22Qtf903xt/RwfEVlxIIR4ZJTSNRsco8ISHllxHn2EXBkQkO9K+Ws8EnW422hv6LCfHoP
	jz8l0G87ldEQz0RhCIhCTSLPWyuA9El4futF/0jexziTqxViGoAuB7PXofq8Rnb/i1XqWJzzJJ/Wd
	j8L1a3gtL22fWWjMKZkzWEYlQZrYp07jXrjzb+rQGOkMPvYeovDFsQV2vySKDZZzuHjHr5j5uvafF
	qhjTxNNdYJTTj7tP9kd47Saq87aNn6QKcceCsxuJNAAyShGrdaKBYRlvCV22nB/9tM/sCp+HFgWtY
	UBSI/l1IOwiPzCq1weuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGHoo-004sHW-Fm; Wed, 18 Aug 2021 09:25:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGHj1-004pUb-JR; Wed, 18 Aug 2021 09:19:10 +0000
X-UUID: 4e0644b4fa8740349686235da103be34-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SzZY9oLikz4zmnsFriX1H3tMqpTNFEn35f8eEBrITkw=; 
 b=b6cZEu0uXWC+pjW5Nfz/Vj3ZxjGZTxWj1V+bj5jd8qOV/JTYJ176CqMcRzsciYoK2lfVdFJ7kTmX2xBy4Vx0uRb5PJs59NnG4uOra+3zLJ2Tqx/RnGnXlK7/cX7kjkcdDOX63tLQTLkVtJII3VNkyKKA8IqPSmvK+znso6kHLzg=;
X-UUID: 4e0644b4fa8740349686235da103be34-20210818
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1134842004; Wed, 18 Aug 2021 02:18:52 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 02:18:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 17:18:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 17:18:50 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v3 06/15] arm64: dts: mt8195: add display node for vdosys1
Date: Wed, 18 Aug 2021 17:18:38 +0800
Message-ID: <20210818091847.8060-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210818091847.8060-1-nancy.lin@mediatek.com>
References: <20210818091847.8060-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_021907_734403_EE96C3AB 
X-CRM114-Status: GOOD (  12.05  )
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

Add display node for vdosys1.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 217 +++++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index aa2a7849b822..b2e377515a52 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/power/mt8195-power.h>
+#include <dt-bindings/reset/mt8195-resets.h>
 
 / {
 	compatible = "mediatek,mt8195";
@@ -20,6 +21,21 @@
 	aliases {
 		gce0 = &gce0;
 		gce1 = &gce1;
+		mutex0 = &mutex;
+		mutex1 = &mutex1;
+		merge1 = &merge1;
+		merge2 = &merge2;
+		merge3 = &merge3;
+		merge4 = &merge4;
+		merge5 = &merge5;
+		vdo1_rdma0 = &vdo1_rdma0;
+		vdo1_rdma1 = &vdo1_rdma1;
+		vdo1_rdma2 = &vdo1_rdma2;
+		vdo1_rdma3 = &vdo1_rdma3;
+		vdo1_rdma4 = &vdo1_rdma4;
+		vdo1_rdma5 = &vdo1_rdma5;
+		vdo1_rdma6 = &vdo1_rdma6;
+		vdo1_rdma7 = &vdo1_rdma7;
 	};
 
 	clocks {
@@ -1275,7 +1291,208 @@
 		vdosys1: syscon@1c100000 {
 			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
+			mboxes = <&gce1 1 CMDQ_THR_PRIO_4>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x0000 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
+		mutex1: disp_mutex0@1c101000 {
+			compatible = "mediatek,mt8195-disp-mutex";
+			reg = <0 0x1c101000 0 0x1000>;
+			reg-names = "vdo1_mutex";
+			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
+			clock-names = "vdo1_mutex";
+			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
+		};
+
+		vdo1_rdma0: vdo1_rdma@1c104000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c104000 0 0x1000>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA0>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x4000 0x1000>;
+		};
+
+		vdo1_rdma1: vdo1_rdma@1c105000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c105000 0 0x1000>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA1>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x5000 0x1000>;
+		};
+
+		vdo1_rdma2: vdo1_rdma@1c106000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c106000 0 0x1000>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA2>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA2>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x6000 0x1000>;
+		};
+
+		vdo1_rdma3: vdo1_rdma@1c107000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c107000 0 0x1000>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA3>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA3>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x7000 0x1000>;
+		};
+
+		vdo1_rdma4: vdo1_rdma@1c108000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c108000 0 0x1000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA4>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA4>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x8000 0x1000>;
+		};
+
+		vdo1_rdma5: vdo1_rdma@1c109000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c109000 0 0x1000>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA5>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA5>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x9000 0x1000>;
+		};
+
+		vdo1_rdma6: vdo1_rdma@1c10a000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10a000 0 0x1000>;
+			interrupts = <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA6>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vdo M4U_PORT_L2_MDP_RDMA6>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xa000 0x1000>;
+		};
+
+		vdo1_rdma7: vdo1_rdma@1c10b000 {
+			compatible = "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10b000 0 0x1000>;
+			interrupts = <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA7>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_MDP_RDMA7>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xb000 0x1000>;
+		};
+
+		merge1: disp_vpp_merge@1c10c000 {
+			compatible = "mediatek,mt8195-vdo1-merge";
+			reg = <0 0x1c10c000 0 0x1000>;
+			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+				 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xc000 0x1000>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
+		};
+
+		merge2: disp_vpp_merge@1c10d000 {
+			compatible = "mediatek,mt8195-vdo1-merge";
+			reg = <0 0x1c10d000 0 0x1000>;
+			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE1>,
+				 <&vdosys1 CLK_VDO1_MERGE1_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xd000 0x1000>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC>;
+		};
+
+		merge3: disp_vpp_merge@1c10e000 {
+			compatible = "mediatek,mt8195-vdo1-merge";
+			reg = <0 0x1c10e000 0 0x1000>;
+			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE2>,
+				 <&vdosys1 CLK_VDO1_MERGE2_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xe000 0x1000>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC>;
+		};
+
+		merge4: disp_vpp_merge@1c10f000 {
+			compatible = "mediatek,mt8195-vdo1-merge";
+			reg = <0 0x1c10f000 0 0x1000>;
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE3>,
+				 <&vdosys1 CLK_VDO1_MERGE3_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0xf000 0x1000>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC>;
+		};
+
+		merge5: disp_vpp_merge5@1c110000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c110000 0 0x1000>;
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
+				 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
+			clock-names = "merge","merge_async";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000>;
+			mediatek,merge-fifo-en = <1>;
+			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
+		};
+
+		disp_ethdr@1c114000 {
+			compatible = "mediatek,mt8195-disp-ethdr";
+			reg = <0 0x1c114000 0 0x1000>,
+			      <0 0x1c115000 0 0x1000>,
+			      <0 0x1c117000 0 0x1000>,
+			      <0 0x1c119000 0 0x1000>,
+			      <0 0x1c11A000 0 0x1000>,
+			      <0 0x1c11B000 0 0x1000>,
+			      <0 0x1c11C000 0 0x1000>;
+			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				    "vdo_be", "adl_ds";
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x4000 0x1000>,
+						  <&gce1 SUBSYS_1c11XXXX 0x5000 0x1000>,
+						  <&gce1 SUBSYS_1c11XXXX 0x7000 0x1000>,
+						  <&gce1 SUBSYS_1c11XXXX 0x9000 0x1000>,
+						  <&gce1 SUBSYS_1c11XXXX 0xA000 0x1000>,
+						  <&gce1 SUBSYS_1c11XXXX 0xB000 0x1000>,
+						  <&gce1 SUBSYS_1c11XXXX 0xC000 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+				 <&vdosys1 CLK_VDO1_26M_SLOW>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+				 <&topckgen CLK_TOP_ETHDR_SEL>;
+			clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				      "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+				      "gfx_fe0_async", "gfx_fe1_async","vdo_be_async",
+				      "ethdr_top";
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			iommus = <&iommu_vpp M4U_PORT_L3_HDR_DS>,
+				 <&iommu_vpp M4U_PORT_L3_HDR_ADL>;
+			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH 0>; /* disp mixer */
+			resets = <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8195_VDOSYS1_SW1_RST_B_HDR_VDO_BE_DL_ASYNC>;
 		};
 	};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
