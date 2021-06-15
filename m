Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDB1C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:36:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA6B611CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA6B611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQNKqwWI9+8cVdHeyArIR5a/qykZwZxex6+KEZ9Rz10=; b=uPZXIle96ku/Gq
	xGNbxPIxBEfqH3u/LcvEgB/TZY4uymI0xiweagQfADsGJrrCPr0CMwYlRTxfGLZA/ia5COZjSJo3J
	Uas1wRXW2srwhcdGL1UAJN8852qO8TI7oIrJ658zoTmFD1XZqQXwuMZ4VVbE3LnENXHzZd0/jqbF+
	g76iqi3kw0ZwO6a3AITvqDQFlEHxhGOFtiN6L0dr7h4eUmkuJvyZLvac+tczbn63cGmozJMcFMq3v
	d4L7mgcTTyD2OVYJNcWtj7akAEXVvtB1JnfIfD4GlEQEYdNL8hxaNErw23i3t0XXHi/KhqkPjpWEH
	OnbgH1y9KtRgvIBtUobw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGjX-003DbM-3e; Tue, 15 Jun 2021 21:36:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltD5W-001pL0-HY; Tue, 15 Jun 2021 17:43:00 +0000
X-UUID: d65e21a7c2b646d58089ed5ef7e6e5db-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HO/9pl9hqzKKPjnw2up11hg0Tivk0kR3l275OjxnrEQ=; 
 b=B1beCZy64W1Qp4Iq0FIF4L18f2fe/7zPPJGQRANK7Nd5fSm7Bj2F2CR2OlURDbAFUAq/W/p6lsoXf8/GOZr7dg6j3pcJ4i88XybA2fr867g3L3/tzMQcoWmLN8Y0zZtOpiSqto4o83rU7kNkeO3lHmWqmGCrbU8tu4Y8+kxqSZ0=;
X-UUID: d65e21a7c2b646d58089ed5ef7e6e5db-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 452632384; Tue, 15 Jun 2021 10:42:55 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:45 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>
Subject: [PATCH 16/27] arm64: dts: mt8195: add display node
Date: Wed, 16 Jun 2021 01:32:22 +0800
Message-ID: <20210615173233.26682-16-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_104258_698986_082A3BC4 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

From: Jason-JH Lin <jason-jh.lin@mediatek.com>

add display node.

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 76 ++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 856b0e938009..f362288ad828 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1911,6 +1911,82 @@
 			#clock-cells = <1>;
 		};
 
+		vdosys_config@1c01a000 {
+			compatible = "mediatek,mt8195-vdosys";
+			reg = <0 0x1c01a000 0 0x1000>;
+			reg-names = "vdosys0_config";
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+		};
+
+		mutex: disp_mutex0@1c016000 {
+			compatible = "mediatek,mt8195-disp-mutex";
+			reg = <0 0x1c016000 0 0x1000>;
+			reg-names = "vdo0_mutex";
+			clocks = <&vdosys0 CLK_VDO0_DISP_MUTEX0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			clock-names = "vdo0_mutex";
+			interrupts = <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
+		ovl0: disp_ovl@1c000000 {
+			compatible = "mediatek,mt8195-disp-ovl";
+			reg = <0 0x1c000000 0 0x1000>;
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_OVL0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_OVL0_RDMA0>;
+		};
+
+		rdma0: disp_rdma@1c002000 {
+			compatible = "mediatek,mt8195-disp-rdma";
+			reg = <0 0x1c002000 0 0x1000>;
+			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			iommus = <&iommu_vdo M4U_PORT_L0_DISP_RDMA0>;
+		};
+
+		color0: disp_color@1c003000 {
+			compatible = "mediatek,mt8195-disp-color";
+			reg = <0 0x1c003000 0 0x1000>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_COLOR0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+		};
+
+		ccorr0: disp_ccorr@1c004000 {
+			compatible = "mediatek,mt8195-disp-ccorr";
+			reg = <0 0x1c004000 0 0x1000>;
+			interrupts = <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_CCORR0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+		};
+
+		aal0: disp_aal@1c005000 {
+			compatible = "mediatek,mt8195-disp-aal";
+			reg = <0 0x1c005000 0 0x1000>;
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_AAL0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+		};
+
+		gamma0: disp_gamma@1c006000 {
+			compatible = "mediatek,mt8195-disp-gamma";
+			reg = <0 0x1c006000 0 0x1000>;
+			interrupts = <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_GAMMA0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+		};
+
+		dither0: disp_dither@1c007000 {
+			compatible = "mediatek,mt8195-disp-dither";
+			reg = <0 0x1c007000 0 0x1000>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&vdosys0 CLK_VDO0_DISP_DITHER0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+		};
+
 		smi_common0: smi@1c01b000 {
 			compatible = "mediatek,mt8195-smi-common";
 			mediatek,common-id = <0>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
