Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D11D1625C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iL6Ll4Ysc6FTv38HKkhsshD1MEymDLs6UY7fiaBMSNc=; b=kSpjKKwyvwGulM
	eBps7T81HEnOAt0H22qjBL6A6w0E+O2e5i45JSRfstCr0nIKb6ItYTF8wTY1eZOOk25BbfgUhLY+A
	BtEYvvr9LzyNiOX/s0cKmRBK/ptCLMafDD+QhOJ5Ex3FA7rAKSMnsoUazIj7oh3TdWmJ7IqG0jxhZ
	qniLjBHXTxBLU3jMY8iFdAmOgvH5MwYs0WFuau6mSANqtE53t88+nN+nMc5aNF4CGpF2lEdXczjTD
	lqDXKxmgI5+fdKf0e4rE9Y01LarX8wYVf2SrnIS6NPaMkxFxj+lzp5L/0q+MP+vEtLgr40iKJpWuq
	Zpz5X4QRc5lPdGyLSKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KVj-000000058kc-2Vkq;
	Mon, 14 Oct 2024 12:49:19 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iyz-00000004rR7-01pi
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20c70abba48so26213765ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904284; x=1729509084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iL6Ll4Ysc6FTv38HKkhsshD1MEymDLs6UY7fiaBMSNc=;
        b=R8whB+7VcxT03BXUYERmFXX2Ba/YfQJhI1tAMM9myZekMmZyu60tJVcZXmbUJDrR9S
         /4l5oiPoMIkvCPQXEUTi4RyvfVME75nu+ikGrv7mUx+yAuMmsINk/5sxlxONxSkSG83P
         lvtj+XXyKobM0xb2YYjx5h6OL+/kF7l40fLJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904284; x=1729509084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iL6Ll4Ysc6FTv38HKkhsshD1MEymDLs6UY7fiaBMSNc=;
        b=iojmlkpFNA44bu9qhHJASHtnoNbDe6G9Nd4YAqxVV2y3wwmsC6iSjEQuurq9F0xtGC
         8pw117KMG3MCoZ5DMgHPyKjn7/+iljqhImzhOaIjN8TiGpRbr4F0GDGtEGCT07K29lsC
         QiaYQWCG7gSqhKt34J48oXhbTFAPk5EjeBtjFuzT2wF8x8swoEZUUibkaZkPAicuWPvv
         rFIvteBdbk4NV8Nb1mj5I2pMQ2A8nAEHFKP5GocK4tuFtC11QEpLnuoBH5v5d+ri5TPC
         zb06inEaCxmsZqkAqT3lRWSnheVtrmwHuFfPnIqOlwCP5rk0E5IlJR6+lxSIUBZC3qIZ
         og4g==
X-Forwarded-Encrypted: i=1; AJvYcCX7LqlREHLjGx155IiTTH+mgEeC2jQPb/Dcbr6BR/E3YsdbAzogsWd9XiiJJjLO+sj8EUcb52R1isLmYe1lFg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1p99cjNJvsP1eBrYSpABuKxP+tE+iZPNLawCv5g9jsQ01MEws
	w2GhtD7cD0o/ucAjyuKKlh5LkAPhCmeyFyInOMwc96vCI58aWcGils0vUMGCsGJCBRem2Oo0Q0q
	eog==
X-Google-Smtp-Source: AGHT+IHvuP7BDvo01xYd1+A51amYcIILe1RYvH/diev/3+bm7d/T4ixY/iLFWN49N5MjxuBJzWd47A==
X-Received: by 2002:a17:902:d4cb:b0:20c:e2ff:4a2e with SMTP id d9443c01a7336-20ce2ff4bcdmr72930005ad.53.1728904284021;
        Mon, 14 Oct 2024 04:11:24 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:23 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 4/9] arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
Date: Mon, 14 Oct 2024 19:09:26 +0800
Message-ID: <20241014111053.2294519-5-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041125_057799_45943967 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add video decoder and encoder nodes for hardware-accelerated video
decoding and encoding support.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 83 ++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index bd36320bc60c..57f283be4402 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2193,6 +2193,64 @@ ccusys: clock-controller@17200000 {
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
@@ -2244,6 +2302,31 @@ larb19: smi@1a010000 {
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
 		disp_dsi0: dsi@1c008000 {
 			compatible = "mediatek,mt8188-dsi";
 			reg = <0 0x1c008000 0 0x1000>;
-- 
2.47.0.rc1.288.g06298d1525-goog


