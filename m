Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1150C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7552160FEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7552160FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tabtaGRn5vwfokxzh9rQ7wCNTlopkIhpB+1rTKMWE3M=; b=XL9aSjUd4njUe0
	7hs2kvP8hr98KwRdtMqV3JAuLMpmLUXNfZM6njBI2FnLEV7OBAfkFa4JkDc5fj0GxdZbBmblaHDc2
	d+GGwsTIIfli53g7I1z9d4cCWa7/mlU2VFj5QqBO3Ug2CCrqgig/tXdf2ffwM9ymmBZ2C0sUVPxg7
	5D9/WXObfE3IqSMCxGzfw5Uoyz+gc9mSLn/WEOLItIfJTxrsm2GnhR+8wqtuVIM/a6ypfsfHlimPH
	m/lriG+BsYYowbxKSSXX0liOoWj4/aH+fPw2bZrBw0PD1yhUMyVmWdTwIQvmnY/OlKe0sVhrCoPHN
	mWxbWGghdgMMw5j6tWMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGVL-0036vm-NO; Tue, 15 Jun 2021 21:21:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvj-001lHp-O4; Tue, 15 Jun 2021 17:32:54 +0000
X-UUID: 624a7dc346d44688b2d22a33ab4b0123-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=L6p/c7J3RXhzjuwCCqDO2X6b/NdD9eCGkF+fj3E/PAc=; 
 b=olWL7TmktBqlB1DRmRQh5H2r1ZB5RhFP616pWDG4oc60XIn55bkIOkD29vSzgXhd+gmOtkFIbz75+hch4WeB6H3Asg4NlkR4XhfBQp/5TlsKVlweX09Dm+trqc5p8MvUfVxhDcOdoyMZEiDZTjYBvWCNBliOvO7ouHCqVo2W5v0=;
X-UUID: 624a7dc346d44688b2d22a33ab4b0123-20210615
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1696936507; Tue, 15 Jun 2021 10:32:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:43 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Kewei Xu
 <kewei.xu@mediatek.com>
Subject: [PATCH 08/27] arm64: dts: mt8195: add i2c dts
Date: Wed, 16 Jun 2021 01:32:14 +0800
Message-ID: <20210615173233.26682-8-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103251_893025_7D6FB6DE 
X-CRM114-Status: UNSURE (   9.28  )
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

From: Kewei Xu <kewei.xu@mediatek.com>

add i2c dts config for mt8195 soc.

Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 105 +++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5463e7ba1061..9b002bb6d344 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -879,12 +879,117 @@
 			};
 		};
 
+		i2c5: i2c@11d00000 {
+			compatible = "mediatek,mt8195-i2c",
+				     "mediatek,mt8192-i2c";
+			reg = <0 0x11d00000 0 0x1000>,
+			      <0 0x10220580 0 0x80>;
+			interrupts = <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH 0>;
+			clock-div = <1>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C5>,
+				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@11d02000 {
+			compatible = "mediatek,mt8195-i2c",
+				     "mediatek,mt8192-i2c";
+			reg = <0 0x11d02000 0 0x1000>,
+			      <0 0x10220680 0 0x80>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH 0>;
+			clock-div = <1>;
+			clocks = <&imp_iic_wrap_s CLK_IMP_IIC_WRAP_S_I2C7>,
+				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		imp_iic_wrap_s: syscon@11d03000 {
 			compatible = "mediatek,mt8195-imp_iic_wrap_s", "syscon";
 			reg = <0 0x11d03000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		i2c0: i2c@11e00000 {
+			compatible = "mediatek,mt8195-i2c",
+				     "mediatek,mt8192-i2c";
+			reg = <0 0x11e00000 0 0x1000>,
+			      <0 0x10220080 0 0x80>;
+			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH 0>;
+			clock-div = <1>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C0>,
+				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "okay";
+		};
+
+		i2c1: i2c@11e01000 {
+			compatible = "mediatek,mt8195-i2c",
+				     "mediatek,mt8192-i2c";
+			reg = <0 0x11e01000 0 0x1000>,
+			      <0 0x10220200 0 0x80>;
+			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
+			clock-div = <1>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C1>,
+				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@11e02000 {
+			compatible = "mediatek,mt8195-i2c",
+				     "mediatek,mt8192-i2c";
+			reg = <0 0x11e02000 0 0x1000>,
+			      <0 0x10220380 0 0x80>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
+			clock-div = <1>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C2>,
+				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@11e03000 {
+			compatible = "mediatek,mt8195-i2c",
+				     "mediatek,mt8192-i2c";
+			reg = <0 0x11e03000 0 0x1000>,
+			      <0 0x10220480 0 0x80>;
+			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
+			clock-div = <1>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C3>,
+				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@11e04000 {
+			compatible = "mediatek,mt8195-i2c",
+				     "mediatek,mt8192-i2c";
+			reg = <0 0x11e04000 0 0x1000>,
+			      <0 0x10220500 0 0x80>;
+			interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH 0>;
+			clock-div = <1>;
+			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_I2C4>,
+				 <&infracfg_ao CLK_INFRA_AO_APDMA_B>;
+			clock-names = "main", "dma";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		imp_iic_wrap_w: syscon@11e05000 {
 			compatible = "mediatek,mt8195-imp_iic_wrap_w", "syscon";
 			reg = <0 0x11e05000 0 0x1000>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
