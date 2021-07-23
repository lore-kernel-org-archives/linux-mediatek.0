Return-Path: <SRS0=Y38d=MP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E4B7C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:03:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 655A960EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Jul 2021 09:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 655A960EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F05MmYC7VS5vUE2/qLMkOrH/wQsMkdawBow5Ba4hZSw=; b=tZoX5zuqT/TDY+
	ur99NfTMAfJaa9Vu7HxxEeUHjzQuomQlD0bBAnQgB/i2HHlVLnud/5R+GkgJbmJ3XBOXcyC7su7MR
	euV252NdUXDnLuOidVkhywZGv8FWolGZ+SZNHnh5SiVyHYn4kH1UODhE9QcBdbEFQ0QqRE383FRho
	ubLoHi9Mv7wWv94dDQnSj8l6LwvUeUnRh+xWi5db/V9gnx/WVowrOSxWRQRZ0eGliUOpN/GUP6mUT
	2wuaOLug9sabdJnfNNrGaGG0Dt72kKx+V+qvIk77UGtXkuFvjLDZmyt0KZkNRDkhjEjK5eXEhB7Qi
	FKuXMlBite5jf1fEIX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6r5J-00414n-4Q; Fri, 23 Jul 2021 09:03:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6r4r-0040vc-Lb; Fri, 23 Jul 2021 09:02:43 +0000
X-UUID: 48188c63336e4265b0f11852e5ff45c1-20210723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=V6VygWaIdyXqUODidlyRG2k60MgXGkPLmfZMnIV6jdc=; 
 b=cvJYcCOa1tYX3UmbIhU7qHagzYqjO7pTGJ50UKvKmOTDzJwgJzCIKiSTlKP6xhNIYuMx9FbUpNib+RAnhQi6H6XE8irz72UhX6nOaMyVxAhbJr14CkBl06KDoQ4Ywksq1RIop/ppFdV+XZgRnq9v7gdaKFh35nVvJvnXsItIqJM=;
X-UUID: 48188c63336e4265b0f11852e5ff45c1-20210723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1532188533; Fri, 23 Jul 2021 02:02:38 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 02:02:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Jul 2021 17:02:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 23 Jul 2021 17:02:35 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, <hsinyi@chromium.org>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 1/6] arm64: dts: mt8195: add display node for vdosys0
Date: Fri, 23 Jul 2021 17:02:28 +0800
Message-ID: <20210723090233.24007-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210723090233.24007-1-jason-jh.lin@mediatek.com>
References: <20210723090233.24007-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_020241_756686_5B91A8B8 
X-CRM114-Status: GOOD (  10.05  )
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
This patch is based on [1][2][3][4]

[1]arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts and Makefile
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210601075350.31515-2-seiya.wang@mediatek.com/
[2]arm64: dts: mt8195: add IOMMU and smi nodes
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
[3]arm64: dts: mt8195: add gce node
- https://patchwork.kernel.org/project/linux-mediatek/patch/20210705053429.4380-4-jason-jh.lin@mediatek.com/
[4]add mt8195 SoC DRM binding
- https://patchwork.kernel.org/project/linux-mediatek/list/?series=519597
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 111 +++++++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 04d3e95175fa..aa2a7849b822 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1155,9 +1155,120 @@
 			#clock-cells = <1>;
 		};
 
+		ovl0: disp_ovl@1c000000 {
+			compatible = "mediatek,mt8195-disp-ovl",
+				     "mediatek,mt8183-disp-ovl";
+			reg = <0 0x1c000000 0 0x1000>;
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x0000 0x1000>;
+		};
+
+		rdma0: disp_rdma@1c002000 {
+			compatible = "mediatek,mt8195-disp-rdma";
+			reg = <0 0x1c002000 0 0x1000>;
+			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x2000 0x1000>;
+		};
+
+		color0: disp_color@1c003000 {
+			compatible = "mediatek,mt8195-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1c003000 0 0x1000>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x3000 0x1000>;
+		};
+
+		ccorr0: disp_ccorr@1c004000 {
+			compatible = "mediatek,mt8195-disp-ccorr",
+				     "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1c004000 0 0x1000>;
+			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x4000 0x1000>;
+		};
+
+		aal0: disp_aal@1c005000 {
+			compatible = "mediatek,mt8195-disp-aal",
+				     "mediatek,mt8173-disp-aal";
+			reg = <0 0x1c005000 0 0x1000>;
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x5000 0x1000>;
+		};
+
+		gamma0: disp_gamma@1c006000 {
+			compatible = "mediatek,mt8195-disp-gamma",
+				     "mediatek,mt8173-disp-gamma";
+			reg = <0 0x1c006000 0 0x1000>;
+			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x6000 0x1000>;
+		};
+
+		dither0: disp_dither@1c007000 {
+			compatible = "mediatek,mt8195-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x1c007000 0 0x1000>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x7000 0x1000>;
+		};
+
+		dsc0: disp_dsc_wrap@1c009000 {
+			compatible = "mediatek,mt8195-disp-dsc";
+			reg = <0 0x1c009000 0 0x1000>;
+			interrupts = <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_DSC_WRAP0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c00XXXX 0x9000 0x1000>;
+		};
+
+		merge0: disp_vpp_merge0@1c014000 {
+			compatible = "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c014000 0 0x1000>;
+			interrupts = <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clocks = <&vdosys0 CLK_VDO0_VPP_MERGE0>;
+			mediatek,gce-client-reg =
+				 <&gce1 SUBSYS_1c01XXXX 0x4000 0x1000>;
+		};
+
+		mutex: disp_mutex0@1c016000 {
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
 		vdosys0: syscon@1c01a000 {
 			compatible = "mediatek,mt8195-vdosys0", "syscon";
 			reg = <0 0x1c01a000 0 0x1000>;
+			mboxes = <&gce1 0 CMDQ_THR_PRIO_4>;
 			#clock-cells = <1>;
 		};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
