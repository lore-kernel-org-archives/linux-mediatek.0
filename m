Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E5CECF31B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4eL/XnvWSRIF7ErhZle48teJZLAeJmMXd6nPwZPH1JI=; b=xHD93hy3V/wg5V
	RFRR8MXQHQ/rkOGsmX21yfPraAEHTudaEw1E60sgYfHMlIhn62DzGfEQuM4CtdTkPcR7orIoLw1tp
	wDRa+m4HLBZHp2BRLqi7IplazppeQG0GnPt7TFcJUIz7nTn/IlJRopcdbYxOOJFs1rSrVohe81xoN
	Dbp3kyT237oR+3hrH4M/u2F9mICqnFt3gB5JDc2rkBSYls7kKTYpJi3IBhzkFsr0jU2Us3c+GM3bp
	JsuDe4m0V411GHM9rO0BXzQpi52gZatUmqzn5va5nf2Krk9CXTkS2qCUdvCGEqxiy6JJphUey+0DR
	+aH6XXMGbA3eh7XXiSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxta-00000005j7u-1mrh;
	Wed, 02 Oct 2024 11:51:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxou-00000005hvz-0TJS
	for linux-mediatek@bombadil.infradead.org;
	Wed, 02 Oct 2024 11:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4eL/XnvWSRIF7ErhZle48teJZLAeJmMXd6nPwZPH1JI=; b=CMuyy/QDFNzJBiQXa77xSSGCZu
	d1Bkns869bX60zkgKQzLiwE0mlnBPZ1YltRSM4yzzVlaKWkdFOw6ewNDomzDcp0mGwbZlmwS/qdnJ
	XeHqQ6W4TPdiFtOlCe5hUzRLSR4+HB7wvKajzTIDN4QY7RORS3uHIUZ894Gq4DFDzyx7cNeb+IAMc
	GHy41hfy7dae88+vPYVDKqIaL/RH5KQpNCmIjbjqdUl6gpnhcNO/v2Kcz7V8UTom/p3nTB9XMxQNk
	b+WRp7fHFmlA9caIK1YPZ7vRxouRUjKJVagK54MB6PGPHdRYn6rBQEdcX4iDY6FIB0nGH+uwqLyF2
	iGN7mIYQ==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxoq-00000003Tif-2q2j
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:47:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71dd2b6cbe6so144902b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869619; x=1728474419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eL/XnvWSRIF7ErhZle48teJZLAeJmMXd6nPwZPH1JI=;
        b=fGTyCAGE5pRkkpIegOg6RCBiOZypSfY3+kNYZ4f+0iQlSCREx6KjEwckTr0hLQTD2p
         y2t6K/ikHCpnWxckV7mMpjYpvo77CkbXW9CvHaxzPgGK5+YN2DiG76oB7n22yt44DsWz
         ECJk1mToDMgcOt1K0mcnyXqZVut4wgMepGV40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869619; x=1728474419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4eL/XnvWSRIF7ErhZle48teJZLAeJmMXd6nPwZPH1JI=;
        b=VuiPUkp94TWHWKU53aqifqwpIWSH9AnE9xPrjrbliGwKD1XC0pmR6SnkoSAEa9tR2V
         h8iIAjR7EQu6RQxuELDFmfR08W4c0bLCPOR51ZUZJcqANbFnLwAwa85Se857kkaYWJ0K
         0oqfr/Bxn0gGrNq/923548sWT+D9GnL/xkeHExyxddXdjrGxXuOChO+Jxd6exncfj8u+
         UYZ297RoKHe3xuUjSkzwVW7I2DSBk1EF/dPBo39sol9YrS5+/RmDKeAfGrjdOZEer7gy
         +8uCFUhGYkq86/Q8h8w869o5IckFn8liHKpX3qoE3tUL79DE/6Fp4M0B4vHHyTgU0Qzh
         jEmg==
X-Forwarded-Encrypted: i=1; AJvYcCVjAh7OQXTom5LQ22CcYiNwkLrM/2wj/mgdWJbVkAmVT9z4M+v93vZVVhvlAd7S9srtqpgMSf7dux70tnSdIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZbX7uLAnojzC/mIeC7judeF3O/B8XwJdKymGs8kY92gxhJYkJ
	z2zuze1Au3WxbB8qfg9/yHhDM8+vTCZzIjiyfAGqnTgI/hCbOXtHpryj34g2ZA==
X-Google-Smtp-Source: AGHT+IGlwXsLd9Mr6AKVcGBEFrntudbL/edWj37XdM8N2RuC+afWpz1Bv27KcrpodULuJDiUNFgDoQ==
X-Received: by 2002:a05:6a00:9a0:b0:717:8da8:6ec1 with SMTP id d2e1a72fcca58-71dc5d425bcmr4815173b3a.17.1727869619267;
        Wed, 02 Oct 2024 04:46:59 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:46:58 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/9] arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
Date: Wed,  2 Oct 2024 19:41:44 +0800
Message-ID: <20241002114614.847553-5-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_124700_968039_DA202F94 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add video decoder and encoder nodes for hardware-accelerated video
decoding and encoding support.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 83 ++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index ff639418bebe..dbea562ee8ba 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2181,6 +2181,64 @@ ccusys: clock-controller@17200000 {
 			#clock-cells = <1>;
 		};
 
+		video_decoder: video-decoder@18000000 {
+			compatible = "mediatek,mt8188-vcodec-dec";
+			reg = <0 0x18000000 0 0x1000>, <0 0x18004000 0 0x1000>;
+			ranges = <0 0 0 0x18000000 0 0x26000>;
+			iommus = <&vpp_iommu M4U_PORT_L23_HW_VDEC_UFO_ENC_EXT>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			mediatek,scp = <&scp>;
+
+			video-codec@10000 {
+				compatible = "mediatek,mtk-vcodec-lat";
+				reg = <0 0x10000 0 0x800>;
+				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6>;
+				clocks = <&topckgen CLK_TOP_VDEC>,
+					 <&vdecsys_soc CLK_VDEC1_SOC_VDEC>,
+					 <&vdecsys_soc CLK_VDEC1_SOC_LAT>,
+					 <&topckgen CLK_TOP_UNIVPLL_D6>;
+				clock-names = "sel", "vdec", "lat", "top";
+				interrupts = <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&vpp_iommu M4U_PORT_L23_HW_VDEC_LAT0_VLD_EXT>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_LAT0_VLD2_EXT>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_LAT0_AVC_MV_EXT>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_LAT0_PRED_RD_EXT>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_LAT0_TILE_EXT>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_LAT0_WDMA_EXT>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_UFO_ENC_EXT>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_UFO_ENC_EXT_C>,
+					 <&vpp_iommu M4U_PORT_L23_HW_VDEC_MC_EXT_C>;
+				power-domains = <&spm MT8188_POWER_DOMAIN_VDEC0>;
+			};
+
+			video-codec@25000 {
+				compatible = "mediatek,mtk-vcodec-core";
+				reg = <0 0x25000 0 0x1000>;
+				assigned-clocks = <&topckgen CLK_TOP_VDEC>;
+				assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D6>;
+				clocks = <&topckgen CLK_TOP_VDEC>,
+					 <&vdecsys CLK_VDEC2_VDEC>,
+					 <&vdecsys CLK_VDEC2_LAT>,
+					 <&topckgen CLK_TOP_UNIVPLL_D6>;
+				clock-names = "sel", "vdec", "lat", "top";
+				interrupts = <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH 0>;
+				iommus = <&vdo_iommu M4U_PORT_L21_HW_VDEC_MC_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_UFO_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_PP_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_PRED_RD_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_PRED_WR_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_PPWRAP_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_TILE_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_VLD_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_VLD2_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_AVC_MV_EXT>,
+					 <&vdo_iommu M4U_PORT_L21_HW_VDEC_UFO_EXT_C>;
+				power-domains = <&spm MT8188_POWER_DOMAIN_VDEC1>;
+			};
+		};
+
 		larb23: smi@1800d000 {
 			compatible = "mediatek,mt8188-smi-larb";
 			reg = <0 0x1800d000 0 0x1000>;
@@ -2232,6 +2290,31 @@ larb19: smi@1a010000 {
 			mediatek,smi = <&vdo_smi_common>;
 		};
 
+		video_encoder: video-encoder@1a020000 {
+			compatible = "mediatek,mt8188-vcodec-enc";
+			reg = <0 0x1a020000 0 0x10000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			assigned-clocks = <&topckgen CLK_TOP_VENC>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
+			clocks = <&vencsys CLK_VENC1_VENC>;
+			clock-names = "venc_sel";
+			interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L19_VENC_RCPU>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_REC>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_BSDMA>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_SV_COMV>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_RD_COMV>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_CUR_LUMA>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_CUR_CHROMA>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_REF_LUMA>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_REF_CHROMA>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_SUB_W_LUMA>,
+				 <&vdo_iommu M4U_PORT_L19_VENC_SUB_R_LUMA>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VENC>;
+			mediatek,scp = <&scp>;
+		};
+
 		disp_dsi: dsi@1c008000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c008000 0 0x1000>;
-- 
2.46.1.824.gd892dcdcdd-goog


