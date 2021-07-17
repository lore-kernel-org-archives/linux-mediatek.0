Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19FB3C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8671613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8671613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1zEv3qJ/WJ+wpQRiz1+0q2g041oQzjfe5aS0buQ+bM=; b=TTkEdDb1OfLszq
	XWVIBJ2LwVEYqxzNkL2UmojD9ffeFU2/yZ0i2UHAS8e//if9u6cC6o0RXpGB1m1g2aeQTRVp9qzTc
	Em2HJr/RN2G4PyfzLN47uXMXejlICoQag7fy53rna+zByP6FaOdne5ShzNzVZhZzJ6F9EgcelNM6i
	r5WdmkKvybj0KcwcaSYYyd88azf0iVAyLPSlc+q8ULC3MPqLvPHJwBIEJcOe3A2XQEANOhkoPomdJ
	s5H0NvQuE9KRaQ7W4uZcJPr6S6xhax0tSjUTwqtYd4rGlOzVpWXl8UYHLWi8AUhVc55WnA7+p42f3
	tX9EUGaI+6FYnhPtkEVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gGO-006H5d-N1; Sat, 17 Jul 2021 09:05:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gFO-006GmX-Hn; Sat, 17 Jul 2021 09:04:36 +0000
X-UUID: cee821100cec458a93c543c092bde32c-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=8gNTJSCUlo5D+KBSmS0jJKBAuDgnmE7BlzbLgT44T3g=; 
 b=BFH6FuBtWlLhTel49XNon00v3bfvI/q8V6iU7aiwoVtxKQco7wdMRM/In0xxRRgkugpLLXpcceuhyh7ZNifdd+1r2ao2MrLgSTTr5/bcMhtj/yK8RCadEBWltb/G4PTWVBvBFuBbEkpjKYmmpP8PzSUuNzTFYHnCY+uxOHpiqco=;
X-UUID: cee821100cec458a93c543c092bde32c-20210717
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1199105800; Sat, 17 Jul 2021 02:04:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:04:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:24 +0800
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
Subject: [PATCH v1 03/10] arm64: dts: mt8195: add display node for vdosys1
Date: Sat, 17 Jul 2021 17:04:01 +0800
Message-ID: <20210717090408.28283-4-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_020434_645873_F8C64DCC 
X-CRM114-Status: GOOD (  10.01  )
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
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 206 +++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index aa2a7849b822..5dc9bf6edda0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -20,6 +20,21 @@
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
@@ -1275,8 +1290,199 @@
 		vdosys1: syscon@1c100000 {
 			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
+			mboxes = <&gce1 1 CMDQ_THR_PRIO_4>;
+			mediatek,gce-client-reg = <&gce1 SUBSYS_1c10XXXX 0x0000 0x1000>;
 			#clock-cells = <1>;
 		};
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
+			compatible = "mediatek,mt8195-vdo1-rdma", "mediatek,mt8195-disp-pseudo-ovl";
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
+		};
+
 	};
 
 	bring-up {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
