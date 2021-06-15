Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78879C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:35:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360C8611CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:35:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360C8611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lepMWxjKJM/2SRx5Cy9b3/oIXvislPLhtH37aOSUTOc=; b=ifuCpujVPXYOO6
	1SOPuF9iq8T1w8cu2VO7iw7z0e3WJhTeiMnuIdAr41XU/DIRjYVVfnAZd6ngIuZIZkB4ujMT4NLX4
	7yLSmUKLdLXPIy3OL0A/jhjsekHDXiDgrmpE05lfoKdTmfd4jIsWVxN5TNrv2RcDer/TX8iMg/xPv
	uszD2MawE0Cl6+/BiuMesTz6EFdDDlRYXwhYY1Z/98SlcEtdDh+83/5FtdJ2+SXik87TPNPl2HjBn
	AsU1XtFCCHrySyzaX+NJVnInHcHz35tYSjkuLOiLxyrozPwsGqRmRuMaLbxyJVWWwr7CzhkjSzHf9
	Ra9WGBrWE2y+DsPE6O0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGhx-003COE-0C; Tue, 15 Jun 2021 21:34:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltD5R-001pIp-8e; Tue, 15 Jun 2021 17:42:54 +0000
X-UUID: e34d75283658491699d196f0080daf23-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dgUB8PSLyIYhXMCEjw+E5RWoFKqzipl6+ftsgOKjvuU=; 
 b=J892xG6hpVfw4Xq+39VKWElm03SB82Jsnuw12MRHzJnKkGGo6rjQWNECwyp3WvpvlyMYkJWo8fs+7STUh1gHKGkYgLwPrmYrWLPc5GkiHPpUDEI6uGfs1CadAV/D+Joie3IQ/7bdXKQdPmdbrlegLCjAMgD9Bb9LEPIST0eyANM=;
X-UUID: e34d75283658491699d196f0080daf23-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1200042360; Tue, 15 Jun 2021 10:42:50 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:46 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Subject: [PATCH 22/27] arm64: dts: mt8195: add edp nodes
Date: Wed, 16 Jun 2021 01:32:28 +0800
Message-ID: <20210615173233.26682-22-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_104253_363568_7EB84605 
X-CRM114-Status: GOOD (  10.88  )
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

From: Jitao Shi <jitao.shi@mediatek.com>

add edp nodes for mt8195

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 59 +++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 256818c4c0bf..d7d2c2a8f461 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -23,6 +23,8 @@
 
 	aliases {
 		dpi1 = &disp_dpi1;
+		dp-intf0 = &dp_intf0;
+		dp-intf1 = &dp_intf1;
 	};
 
 	clocks {
@@ -1155,6 +1157,29 @@
 			status = "disabled";
 		};
 
+		disp_pwm0: disp_pwm0@1100e000 {
+			compatible = "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100e000 0 0x1000>;
+			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_LOW 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS0>;
+			#pwm-cells = <2>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM0_SEL>,
+					<&infracfg_ao CLK_INFRA_AO_DISP_PWM>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
+		disp_pwm1: disp_pwm1@1100f000 {
+			compatible = "mediatek,mt8183-disp-pwm";
+			reg = <0 0x1100f000 0 0x1000>;
+			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
+			#pwm-cells = <2>;
+			clocks = <&topckgen CLK_TOP_DISP_PWM1_SEL>,
+				<&infracfg_ao CLK_INFRA_AO_DISP_PWM1>;
+			clock-names = "main", "mm";
+			status = "disabled";
+		};
+
 		spi1: spi@11010000 {
 			compatible = "mediatek,mt8195-spi",
 				     "mediatek,mt6765-spi";
@@ -2397,6 +2422,30 @@
 			status = "disabled";
 		};
 
+		dp_intf1: dp_intf1@1c113000 {
+			compatible = "mediatek,mt8195-dp-intf";
+			reg = <0 0x1c113000 0 0x1000>;
+			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
+			clocks = <&vdosys1 CLK_VDO1_DP_INTF0_MM>,
+				 <&vdosys1 CLK_VDO1_DPINTF>,
+				 <&topckgen CLK_TOP_DP_SEL>,
+				 <&topckgen CLK_TOP_TVDPLL2_D2>,
+				 <&topckgen CLK_TOP_TVDPLL2_D4>,
+				 <&topckgen CLK_TOP_TVDPLL2_D8>,
+				 <&topckgen CLK_TOP_TVDPLL2_D16>,
+				 <&topckgen CLK_TOP_TVDPLL2>;
+			clock-names = "hf_fmm_ck",
+				      "hf_fdp_ck",
+				      "MUX_DP",
+				      "TVDPLL_D2",
+				      "TVDPLL_D4",
+				      "TVDPLL_D8",
+				      "TVDPLL_D16",
+				      "DPI_CK";
+			status = "disabled";
+		};
+
 		hdmi0: hdmi@1c300000 {
 			compatible = "mediatek,mt8195-hdmi";
 			reg = <0 0x1c300000 0 0x1000>;
@@ -2421,11 +2470,19 @@
 
 		edp_tx: edp_tx@1c500000 {
 			status = "disabled";
-			compatible = "mediatek,mt8195-dp_tx";
+			compatible = "mediatek,mt8195-edp_tx";
 			reg = <0 0x1c500000 0 0x8000>;
 			power-domains = <&spm MT8195_POWER_DOMAIN_EPD_TX>;
 			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
+
+		dp_tx: dp_tx@1c600000 {
+			compatible = "mediatek,mt8195-dp_tx";
+			reg = <0 0x1c600000 0 0x8000>;
+			power-domains = <&spm MT8195_POWER_DOMAIN_DP_TX>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+			status = "disabled";
+		};
 	};
 
 	hdmiddc0: ddc_i2c {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
