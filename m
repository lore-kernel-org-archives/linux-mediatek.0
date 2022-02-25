Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E010C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 02:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hYc6sYo/vACNgqbTURevExNi7Mmz51JV8upiyGfbYyI=; b=PZwCshVKgTSdza
	fVQfLTl6dde0ctBOxzZcqwxFlJgzcCXXc7gAJG2GnyFV0zNeMzvNOJT8hjc7HWJsGJcde6pYtjVBy
	bQlyvzUOa2XzQemxRBJL6p9TB1aQZ7rCLGQ6Pv1pN1m/fwgEijm0ainhtqF231mlY8sRMJCBvCss4
	csTxrqWZ6MS4Tc/8EVCmQmIaKU9M4+aAS4PoXE/ZXilKmNwC6p7Iyvmuf45D4OI6MUynfqsDz1rpL
	j33JXimRzqMa69M9/+uWUoGa0hkfC06EEl9Ni74HWn+pnw1QIMvtTFU5evWfxrXjTMJtQx8Tn2dpr
	JJU/BEoniLIg6HBqi1QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNQIb-002zpl-VH; Fri, 25 Feb 2022 02:25:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNQIO-002zoa-W3; Fri, 25 Feb 2022 02:25:27 +0000
X-UUID: 38a23c34c9f640e99e25c29fd9e75d24-20220224
X-UUID: 38a23c34c9f640e99e25c29fd9e75d24-20220224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1112357188; Thu, 24 Feb 2022 19:23:24 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 18:15:38 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 25 Feb 2022 10:15:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Feb 2022 10:15:36 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>,
 <maciej.szmigiero@oracle.com>, David Matlack <dmatlack@google.com>, "Jing
 Zhang" <jingzhangos@google.com>, Marc Zyngier <maz@kernel.org>, "Bartosz
 Golaszewski" <bgolaszewski@baylibre.com>, Sean Wang <sean.wang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>, Seiya Wang
 <seiya.wang@mediatek.com>, <moudy.ho@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <Macpaul.Lin@mediatek.com>, jason-jh.lin
 <jason-jh.lin@mediatek.com>
Subject: [PATCH v2] arm64: dts: mt8195: add display node for vdosys0
Date: Fri, 25 Feb 2022 10:15:35 +0800
Message-ID: <20220225021535.2655-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_182525_066599_0A9970A4 
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

Add display node for vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
This patch depends on series [1]
[1] Add Mediatek Soc DRM (vdosys0) support for mt8195
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=608548

This patch is based on [2][3][4]

[2] arm64: dts: Add mediatek SoC mt8195 and evaluation board
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220112114724.1953-4-tinghan.shen@mediatek.com/
[3] arm64: dts: mt8195: add IOMMU and smi nodes
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
[4] arm64: dts: mt8195: add gce node
- https://patchwork.kernel.org/project/linux-mediatek/patch/20220126090109.32143-1-jason-jh.lin@mediatek.com/
---
Hi Angelo,

I'm sorry I couldn't find your last reply mail, so I reply you so late.

Thanks for the reviews!
I have fixed them.

Regards,
Jason-JH.Lin
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 123 +++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 75422c498309..afe747647575 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1067,5 +1067,128 @@
 			reg = <0 0x1b000000 0 0x1000>;
 			#clock-cells = <1>;
 		};
+
+		ovl0: ovl@1c000000 {
+			compatible = "mediatek,mt8195-disp-ovl",
+				     "mediatek,mt8192-disp-ovl";
+			reg = <0 0x1c000000 0 0x1000>;
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x0000 0x1000>;
+		};
+
+		rdma0: rdma@1c002000 {
+			compatible = "mediatek,mt8195-disp-rdma";
+			reg = <0 0x1c002000 0 0x1000>;
+			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
+		};
+
+		color0: color@1c003000 {
+			compatible = "mediatek,mt8195-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1c003000 0 0x1000>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x3000 0x1000>;
+		};
+
+		ccorr0: ccorr@1c004000 {
+			compatible = "mediatek,mt8195-disp-ccorr",
+				     "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1c004000 0 0x1000>;
+			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x4000 0x1000>;
+		};
+
+		aal0: aal@1c005000 {
+			compatible = "mediatek,mt8195-disp-aal",
+				     "mediatek,mt8173-disp-aal";
+			reg = <0 0x1c005000 0 0x1000>;
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
+		};
+
+		gamma0: gamma@1c006000 {
+			compatible = "mediatek,mt8195-disp-gamma",
+				     "mediatek,mt8173-disp-gamma";
+			reg = <0 0x1c006000 0 0x1000>;
+			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x6000 0x1000>;
+		};
+
+		dither0: dither@1c007000 {
+			compatible = "mediatek,mt8195-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x1c007000 0 0x1000>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x7000 0x1000>;
+		};
+
+		dsc0: dsc@1c009000 {
+			compatible = "mediatek,mt8195-disp-dsc";
+			reg = <0 0x1c009000 0 0x1000>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c00XXXX 0x9000 0x1000>;
+		};
+
+		merge0: merge0@1c014000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c014000 0 0x1000>;
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>;
+			mediatek,gce-client-reg =
+				 <&gce0 SUBSYS_1c01XXXX 0x4000 0x1000>;
+		};
+
+		mutex: mutex0@1c016000 {
+			compatible = "mediatek,mt8195-disp-mutex";
+			reg = <0 0x1c016000 0 0x1000>;
+			reg-names = "vdo0_mutex";
+			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
+			clock-names = "vdo0_mutex";
+			mediatek,gce-events =
+				 <CMDQ_EVENT_VDO0_DISP_STREAM_DONE_0>;
+		};
+
+		vdosys0: syscon@1c01a000 {
+			compatible = "mediatek,mt8195-vdosys0", "syscon";
+			reg = <0 0x1c01a000 0 0x1000>;
+			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
+			#clock-cells = <1>;
+		};
+
+		vdosys1: syscon@1c100000 {
+			compatible = "mediatek,mt8195-vdosys1", "syscon";
+			reg = <0 0x1c100000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 };
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
