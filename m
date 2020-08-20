Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C17C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528EE207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OlId5xdA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aMgYTVKl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528EE207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fAUU49KZk3KtfpGKca4jZQ/09Oyn78c2xpPIMDCPaz4=; b=OlId5xdAJCar0E+jnQ1MHktZm
	pHGh5Q4BDHUEAYxEF56JTpp28BGb+8IXYbXHxgvIXjLHvt+8ayuwzJhYtHRDZhDrO/DHCWPozi1Jk
	T6ljMHjlJsRjc/xSk0XNppd5N+uyZfGhceXKBMwleTE3Z7t451SMWSmkoLPifnbXSRlDwkm78VhCZ
	YH8NipflXCS1h5mdziEADe9opT/Eu3Cz/nxBmZgS0aVqZuXjVzxQt0ArSsCxD33O/pOTVjEM8omIw
	q9bae7tCWThV/WJIWBXjDYR9ZINHLT5Yaq4J1L4vJwsFUacu99e1wiAirCdhtOqwewXV4u5edRKBY
	FhjaSqpDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dtz-0000nV-3L; Thu, 20 Aug 2020 06:18:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drm-00081Z-3a; Thu, 20 Aug 2020 06:16:18 +0000
X-UUID: c84656ed8f44461a959032c608319366-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VClb/Kq3fd5kbThEcOCKcrw4DxbEnAvW+xXoghjqqSM=; 
 b=aMgYTVKlzdqHMdIovhJEszhnX6jO2HnWqDFJHm9sZp1+9CqU6kHMJcMuqxpuGSfkb5J+1HLTCT0arcqoxDPl771ZAzfcY5XJyGCtxzo+/tQmJl6UP1uRwwlYIFGw73B+ELOTsb0Ew7h524bv00VZZA4qTbrvRllNAKsDnPasB7M=;
X-UUID: c84656ed8f44461a959032c608319366-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1095328771; Wed, 19 Aug 2020 22:15:48 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:06:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:58 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 21/21] arm64: dts: mt8192: add display node
Date: Thu, 20 Aug 2020 14:04:18 +0800
Message-ID: <1597903458-8055-22-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021602_362017_3F5C35AB 
X-CRM114-Status: GOOD (  13.81  )
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

add display node

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 126 +++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 931e1ca..d2a814d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -17,6 +17,13 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+        aliases {
+		ovl0 = &ovl0;
+		ovl_2l0 = &ovl_2l0;
+		ovl_2l2 = &ovl_2l2;
+		rdma0 = &rdma0;
+		rdma4 = &rdma4;
+	};
 	clk26m: oscillator@0 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -449,6 +456,125 @@
 			#clock-cells = <1>;
 		};
 
+                mutex: mutex@14001000 {
+			compatible = "mediatek,mt8192-disp-mutex";
+			reg = <0 0x14001000 0 0x1000>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&mmsys CLK_MM_DISP_CONFIG>,
+			         <&mmsys CLK_MM_26MHZ>,
+			         <&mmsys CLK_MM_DISP_MUTEX0>;
+		};
+		ovl0: ovl@14005000 {
+			compatible = "mediatek,mt8192-disp-ovl";
+			reg = <0 0x14005000 0 0x1000>;
+			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0>;
+			//iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
+			//	 <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x5000 0x1000>;
+		};
+
+		ovl_2l0: ovl@14006000 {
+			compatible = "mediatek,mt8192-disp-ovl-2l";
+			reg = <0 0x14006000 0 0x1000>;
+			interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
+			//iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
+			//	 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x6000 0x1000>;
+		};
+
+		rdma0: rdma@14007000 {
+			compatible = "mediatek,mt8192-disp-rdma";
+			reg = <0 0x14007000 0 0x1000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA0>;
+			//iommus = <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
+			mediatek,rdma_fifo_size = <5>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x7000 0x1000>;
+		};
+
+		color0: color@14009000 {
+			compatible = "mediatek,mt8192-disp-color",
+				     "mediatek,mt8173-disp-color";
+			reg = <0 0x14009000 0 0x1000>;
+			interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_COLOR0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x9000 0x1000>;
+		};
+
+		ccorr0: ccorr@1400a000 {
+			compatible = "mediatek,mt8192-disp-ccorr";
+			reg = <0 0x1400a000 0 0x1000>;
+			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xa000 0x1000>;
+		};
+
+		aal0: aal@1400b000 {
+			compatible = "mediatek,mt8192-disp-aal";
+			reg = <0 0x1400b000 0 0x1000>;
+			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xb000 0x1000>;
+		};
+
+		gamma0: gamma@1400c000 {
+			compatible = "mediatek,mt8192-disp-gamma";
+			reg = <0 0x1400c000 0 0x1000>;
+			interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
+		};
+
+		postmask0: postmask@1400d000 {
+			compatible = "mediatek,mt8192-disp-postmask";
+			reg = <0 0x1400d000 0 0x1000>;
+			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_POSTMASK0>;
+			//iommus = <&iommu0 M4U_PORT_L0_DISP_POSTMASK0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
+		};
+
+		dither0: dither@1400e000 {
+			compatible = "mediatek,mt8192-disp-dither";
+			reg = <0 0x1400e000 0 0x1000>;
+			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
+		};
+
+		ovl_2l2: ovl@14014000 {
+			compatible = "mediatek,mt8192-disp-ovl-2l";
+			reg = <0 0x14014000 0 0x1000>;
+			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_OVL2_2L>;
+			//iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2>,
+			//	 <&iommu0 M4U_PORT_L1_OVL_2L_RDMA2_HDR>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
+		};
+
+		rdma4: rdma@14015000 {
+			compatible = "mediatek,mt8192-disp-rdma";
+			reg = <0 0x14015000 0 0x1000>;
+			interrupts = <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&scpsys MT8192_POWER_DOMAIN_DISP>;
+			clocks = <&mmsys CLK_MM_DISP_RDMA4>;
+			//iommus = <&iommu0 M4U_PORT_L1_DISP_RDMA4>;
+			mediatek,rdma_fifo_size = <2>;
+			//mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
+		};
+
 		imgsys: imgsys@15020000 {
 			compatible = "mediatek,mt8192-imgsys", "syscon";
 			reg = <0 0x15020000 0 0x1000>;
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
