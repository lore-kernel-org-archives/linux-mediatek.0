Return-Path: <SRS0=VH+m=2X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78D9C2D0DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:12:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAC6C20848
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2020 04:12:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eK0yPnwM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="R9AnG0FQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC6C20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69+UfI3B+uY+3jiilqHUiSupFGx+FmM3eIOmjNdVf8I=; b=eK0yPnwMDPwu6G
	bhIXhpzcDz7IPTJ4Z5Sh5Hww+9VTaMlkmR4xvC+/Np70NOiu4nRLlwWbFhnPvUFg/nEbwpp7YId5v
	0NDoxhsAz701dJ4g8ysU+mU3NoZhKNGwim2tx98S9xF2ZhVOHinRovdMchgfBsINjUWoDLCxc3zn+
	gGPp9S6evCTL6as2y/z4kSvDEAICEfoEatCKSLpsuUKvNB+u79VocBzaijdeuLelUHDMO2tl/MNIc
	CkDsrVIqqYVOWeYAj2M9qlJynR15mjEAh6Ri6/fUMUV9D7n2sGrUji0TPUWfUiUf//ynr6eauJG/b
	T+OP7jc7oytgPFGskOfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imrqs-0000NZ-8y; Thu, 02 Jan 2020 04:12:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imrqQ-0008He-Pg; Thu, 02 Jan 2020 04:12:24 +0000
X-UUID: 3bf9bb9463714947a65508245dbc1cfa-20200101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y+wnhftACJUbMqxqcT6o9ZJKyh318rnGWmRv6biQamY=; 
 b=R9AnG0FQM0jlg2ciX0ht0kXXz5+PwUO72BCPZ0yiF485d6IA5dp1RqBiJoLkvGAcH4OQceAgop6FdWBFohEPJGrHdQcrKocqgVHA00VnIEMMgUD3GTOWSI4fCcdVq87sNseU4om0eZpVUXRzjIHMGyP0hveIMjB1FLHqjaRmFtw=;
X-UUID: 3bf9bb9463714947a65508245dbc1cfa-20200101
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 823302382; Wed, 01 Jan 2020 20:12:17 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 1 Jan 2020 20:02:37 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 2 Jan 2020 12:01:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 2 Jan 2020 12:01:33 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6, 01/14] arm64: dts: add display nodes for mt8183
Date: Thu, 2 Jan 2020 12:00:11 +0800
Message-ID: <1577937624-14313-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1577937624-14313-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_201222_869615_15110EFF 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch add display nodes for mt8183

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 103 +++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 91217e4f..de1ea00 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -30,6 +30,11 @@
 		i2c9 = &i2c9;
 		i2c10 = &i2c10;
 		i2c11 = &i2c11;
+		ovl0 = &ovl0;
+		ovl_2l0 = &ovl_2l0;
+		ovl_2l1 = &ovl_2l1;
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
 	};
 
 	cpus {
@@ -648,9 +653,107 @@
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
 			#clock-cells = <1>;
 		};
 
+		ovl0: ovl@14008000 {
+			compatible = "mediatek,mt8183-disp-ovl";
+			reg = <0 0x14008000 0 0x1000>;
+			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			mediatek,larb = <&larb0>;
+		};
+
+		ovl_2l0: ovl@14009000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			mediatek,larb = <&larb0>;
+		};
+
+		ovl_2l1: ovl@1400a000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
+			mediatek,larb = <&larb0>;
+		};
+
+		rdma0: rdma@1400b000 {
+			compatible = "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			mediatek,larb = <&larb0>;
+			mediatek,rdma_fifo_size = <5>;
+		};
+
+		rdma1: rdma@1400c000 {
+			compatible = "mediatek,mt8183-disp-rdma1";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			mediatek,larb = <&larb0>;
+			mediatek,rdma_fifo_size = <2>;
+		};
+
+		color0: color@1400e000 {
+			compatible = "mediatek,mt8183-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+		};
+
+		ccorr0: ccorr@1400f000 {
+			compatible = "mediatek,mt8183-disp-ccorr";
+			reg = <0 0x1400f000 0 0x1000>;
+			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+		};
+
+		aal0: aal@14010000 {
+			compatible = "mediatek,mt8183-disp-aal",
+				     "mediatek,mt8173-disp-aal";
+			reg = <0 0x14010000 0 0x1000>;
+			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+		};
+
+		gamma0: gamma@14011000 {
+			compatible = "mediatek,mt8183-disp-gamma",
+				     "mediatek,mt8173-disp-gamma";
+			reg = <0 0x14011000 0 0x1000>;
+			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+		};
+
+		dither0: dither@14012000 {
+			compatible = "mediatek,mt8183-disp-dither";
+			reg = <0 0x14012000 0 0x1000>;
+			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+		};
+
+		mutex: mutex@14016000 {
+			compatible = "mediatek,mt8183-disp-mutex";
+			reg = <0 0x14016000 0 0x1000>;
+			interrupts = <GIC_SPI 217 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+		};
+
 		smi_common: smi@14019000 {
 			compatible = "mediatek,mt8183-smi-common", "syscon";
 			reg = <0 0x14019000 0 0x1000>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
