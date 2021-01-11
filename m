Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805B5C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:48:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2304B22A84
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 07:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2304B22A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d6L9SzjywpcRC1cKInjpAebpdSE1FPjHqST+4z8VIcc=; b=CvP5JqHjsIZefLHpauyfNGXFq
	q9iJ7J0yvuA5FBiE1dGkKj48130poQI5oxUlCBZK7b13tz8U7/0PClWAxiPUhWPxpp+C7SglSpzFe
	yDZmIaaAoo/CJZG0MSNje51Y9sdHzwrimP1lBaydlBZqHdCy5vutPT1iwMcpqIvhQa0ODO8AgevBn
	DqGOjJFTyqKann88+qS2vY88z8g+QEIsB0p0XPQ/bcysjzV25NrPzWD3E62OhDeOwnxfP1ai7/4d5
	GW2w/n3cCOnBjRHRbax7NmrrpeVCbc8ivcSUx/WmdaWZgnnruQCWJMm0Uraquj+pV3SgKrHyMIcyk
	YT2zKdXKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyrwR-0003Qu-8d; Mon, 11 Jan 2021 07:48:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyrvk-00034M-Bj; Mon, 11 Jan 2021 07:48:02 +0000
X-UUID: e1353f195c9a44708be4578df8927b1b-20210110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=IWMbWvL+f/AAWlu98QRYncZF+b8e6arUAcETTO+cxTQ=; 
 b=kFmzBiCZRX19twSIU0L08I95l4rtnbdmAVmzrf+sJRBoPCe/h/DsL6yDMPmVIp9oLJSvXxPEApsxX0XN58UQt6ngGSDXZnylcnLw/ChuoSme4RGc4+lohc8GHeb5hibntiENKUXKaNMW/yQa78qi+gIhNnbQq1Gosl85XIRX1V8=;
X-UUID: e1353f195c9a44708be4578df8927b1b-20210110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 897539664; Sun, 10 Jan 2021 23:47:54 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Jan 2021 23:43:59 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 15:43:58 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 15:43:57 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3, 03/15] arm64: dts: mt8192: add display node
Date: Mon, 11 Jan 2021 15:43:39 +0800
Message-ID: <1610351031-21133-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_024800_688564_8514C096 
X-CRM114-Status: GOOD (  12.33  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Hsin-Yi Wang <hsinyi@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add display node

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 134 +++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index e12e024..dcf9fdf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -15,6 +15,11 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		ovl2-2l2 = &ovl_2l2;
+		rdma4 = &rdma4;
+	};
+
 	clk26m: oscillator0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -508,5 +513,134 @@
 			#size-cells = <0>;
 			status = "disabled";
 		};
+		
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8192-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			//mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
+			//	 <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+                mutex: mutex@14001000 {
+			compatible = "mediatek,mt8192-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
+			//clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
+			//mediatek,gce-events = <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_0>,
+			//		      <CMDQ_EVENT_DISP_STREAM_DONE_ENG_EVENT_1>;
+		};
+
+		ovl0: ovl@14005000 {
+			compatible = "mediatek,mt8192-disp-ovl";
+			reg = <0 0x14005000 0 0x1000>;
+			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
+			//clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			//iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+		};
+
+		ovl_2l0: ovl@14006000 {
+			compatible = "mediatek,mt8192-disp-ovl-2l";
+			reg = <0 0x14006000 0 0x1000>;
+			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			//iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+		};
+
+		rdma0: rdma@14007000 {
+			compatible = "mediatek,mt8192-disp-rdma";
+			reg = <0 0x14007000 0 0x1000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
+			//clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			//iommus = <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
+			//mediatek,larb = <&larb0>;
+			//mediatek,rdma-fifo-size = <5120>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
+		};
+
+		color0: color@14009000 {
+			compatible = "mediatek,mt8192-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+		};
+
+		ccorr0: ccorr@1400a000 {
+			compatible = "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
+		};
+
+		aal0: aal@1400b000 {
+			compatible = "mediatek,mt8192-disp-aal";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+		};
+
+		gamma0: gamma@1400c000 {
+			compatible = "mediatek,mt8183-disp-gamma",
+				     "mediatek,mt8192-disp-gamma";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+		};
+
+		postmask0: postmask@1400d000 {
+			compatible = "mediatek,mt8192-disp-postmask";
+			reg = <0 0x1400d000 0 0x1000>;
+			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+		};
+
+		dither0: dither@1400e000 {
+			compatible = "mediatek,mt8192-disp-dither",
+				     "mediatek,mt8183-disp-dither";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+		};
+
+		ovl_2l2: ovl@14014000 {
+			compatible = "mediatek,mt8192-disp-ovl-2l";
+			reg = <0 0x14014000 0 0x1000>;
+			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
+			//iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
+			//	 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
+		};
+
+		rdma4: rdma@14015000 {
+			compatible = "mediatek,mt8192-disp-rdma";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
+			//power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//clocks = <&mmsys CLK_MM_DISP_RDMA4>;
+			//iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
+			//mediatek,rdma-fifo-size = <2048>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+		};
 	};
 };
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
