Return-Path: <SRS0=PvK4=BS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54491C433DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 03:05:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244642087C
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Aug 2020 03:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C6aQbVB1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BQgMpI/p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 244642087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U1pYzl7hWablPaX0v/gqK/FJdgi7aV2VQD/GgK+9uFY=; b=C6aQbVB17CZUoD1yffNcAUQmu
	qtx40twpw6Eh5stzxc7lWF618sb0x4W0qpNwdMNquSf1Nr8Hu5O6qTmICWg0qPH9/Hb2qPrqHTy+k
	V8scGfNMjLE9ali0/Fe+/6wc5LF+Rb7kkiFX2NSHiwzzm9RWomGcIp1c52yn52tNQF8erzyDsp+to
	WMR4FqVBzFONwTHJ8531DaGqWuwNHnVuuUmtCoPDDhZU5zEShvUltsOG68/h+v93RcKeSyi56a7Xd
	w5QNkp77RKP9BXf8hkoVoOTpPt5u3wtNjVWsNwlHmStcYAyxE5IEwUv3RWXgTruk59F2Idid/WD/8
	g7M3n1e9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4FAR-0007oV-KD; Sat, 08 Aug 2020 03:05:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4FAI-0007ig-FE; Sat, 08 Aug 2020 03:05:00 +0000
X-UUID: 169505a133064ae596c5810fed237b92-20200807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Grs5ZKo+Kb4nPk8FUoPPdvMh04ElZQ3N2JhQRc+vMC4=; 
 b=BQgMpI/pj/1IyoUSAmEe3blZtSz+o0ZAOtcWiwQU9TriTJGwXNyJUehXF4EkXixnaenpU4vAcOj6VzlKMed0Z2V5TbJ1o17rMugzQn+L6rUmKwRVsPyIxjE7yEDNBU2Dkt8t9c7B01nLZm9wY3HVl/ZjIJhkW3VwDqutyLKBs2M=;
X-UUID: 169505a133064ae596c5810fed237b92-20200807
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1439428861; Fri, 07 Aug 2020 19:04:49 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 19:54:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 Aug 2020 10:54:45 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 Aug 2020 10:54:44 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [RESEND v7, PATCH 7/7] arm64: dts: add display nodes for mt8183
Date: Sat, 8 Aug 2020 10:53:51 +0800
Message-ID: <1596855231-5782-8-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_230459_777977_2F84421E 
X-CRM114-Status: GOOD (  13.19  )
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
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 98 ++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 7b781eb..440cf22 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -31,6 +31,11 @@
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
@@ -707,9 +712,102 @@
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
+		};
+
+		ovl_2l0: ovl@14009000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+		};
+
+		ovl_2l1: ovl@1400a000 {
+			compatible = "mediatek,mt8183-disp-ovl-2l";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL1_2L>;
+		};
+
+		rdma0: rdma@1400b000 {
+			compatible = "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			mediatek,rdma_fifo_size = <5120>;
+		};
+
+		rdma1: rdma@1400c000 {
+			compatible = "mediatek,mt8183-disp-rdma";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+			mediatek,rdma_fifo_size = <2048>;
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
