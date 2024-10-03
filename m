Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F4FCF855E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4k2o/I2+UBi0xubeN2RcTfc2l9sMDWMvwW6OmAATdeU=; b=4xLD74Rn6rfTw+
	d7/uMC3EKgHtPKrzjJp6ZjrGa/PH0Qv/RGv1uZXxX+dU0PXmCFALDQwPBF5V5gEC14iFTFOkYpjY1
	FQwJLTbT4KhinUFLWHKaaYrLK2h+hQEpTqS/nxmm1rtCfB+8xgrHEBZPOuMpJVtp5Hhf+Mp39QBIf
	A1cZjNhOlTv9pWTscsc55HiLDEos/L6dsFu+omp8fmwf2POdRl2w+SJ1osBIJ4Z8s2s/t6+yc0oXl
	DfIFNV3y6Khz1dH+YeZYmRS4OEcG6siv22CI56V55o5bwD1X3jmt5gNLzFt1mIZHTHkhiw9c3LTW5
	Xs+s08ifzN2/91N7GN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swG1N-00000008Miy-11ft;
	Thu, 03 Oct 2024 07:13:09 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqg-00000008KYE-0WdR
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:02:08 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71dd8419b9aso384753b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938925; x=1728543725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4k2o/I2+UBi0xubeN2RcTfc2l9sMDWMvwW6OmAATdeU=;
        b=YxLl1OyGYwZ44trh2t4Sawjth3ekCk2lFzNRm7/w/xyKR2nm3JMghWZLazT19u4gK6
         5mDC7NVotagD/fok90Prr1QjXaAxQytL6sLZt5DCjdMizdr5veM9j3zIpG5g1AOuzl9a
         KpJ8+mH0ORlN3ulXXDziakAE6i2Q32+tn9yTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938925; x=1728543725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4k2o/I2+UBi0xubeN2RcTfc2l9sMDWMvwW6OmAATdeU=;
        b=XnzOG7EXDhSiVWzI4UmCOHzyfIvWsFzz0q0w6cikttwAAV2qIrpS8ew6IdMRg0Scmf
         8ymwhTdczVjsw/eYC4MtfIE7FwKDegHJZZfZiP8iAsUuH7sHIBoQIdwL2auFB+bAWvGj
         SecHJdGqmCDacUV/QSdRCZ4PzqiUxSjX8nSgXjlhOdLh38Otu2UqyCg77SGqKHC1oQYM
         UBhIvVly0snad6qIZt6kSzJbZoefNFMI0cMbNvDUImAyv3ghyjTsYjvY++2TnPsyWN5H
         dQNC/NGGR6fYPmSp7LJ9CioHdP6MCZpa1bHkqRlBgmyw74Uhp+Lg/BM0P7banSGS82Ej
         TY+A==
X-Forwarded-Encrypted: i=1; AJvYcCXn50PyD1lgmt0FaCN3HL4zg6FL1XurFGcq5iGmjdpOEOKghhUD5ir2oI75Ebv6OcHieD0/B/DApPZ7issJHw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7PUtg7lhqZ0rMCib7b7z8VSegzXTFO9FVUXQhzxjxRyZ0JNPo
	7TEauQIpEDJ7KO3bt7qgqUHSa1kBQvx5zd7Mj1zbfsOVzM+nuNLCbqgipLzmog==
X-Google-Smtp-Source: AGHT+IEEV+Twz/qRb0YWbMBXSzMpp2pPI6Y9wOqdXQYwZTiPE3gnTEKFIyoXDi3D3wWX8a/nRu+Lfw==
X-Received: by 2002:a05:6a00:2d94:b0:714:1f6d:11e5 with SMTP id d2e1a72fcca58-71dc5c67665mr9381827b3a.12.1727938924901;
        Thu, 03 Oct 2024 00:02:04 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:02:04 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 7/9] arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
Date: Thu,  3 Oct 2024 15:00:01 +0800
Message-ID: <20241003070139.1461472-8-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241003070139.1461472-1-fshao@chromium.org>
References: <20241003070139.1461472-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000206_256213_9F67EF37 
X-CRM114-Status: UNSURE (   9.51  )
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

Add the vdosys1 display nodes to support the external display pipeline.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 298 +++++++++++++++++++++++
 1 file changed, 298 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index c4026de18fd8..541eaed59e8b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -24,9 +24,32 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		ethdr0 = &ethdr0;
 		gce0 = &gce0;
 		gce1 = &gce1;
+		merge0 = &merge0;
+		merge1 = &merge1;
+		merge2 = &merge2;
+		merge3 = &merge3;
+		merge4 = &merge4;
 		mutex0 = &mutex0;
+		mutex1 = &mutex1;
+		padding0 = &padding0;
+		padding1 = &padding1;
+		padding2 = &padding2;
+		padding3 = &padding3;
+		padding4 = &padding4;
+		padding5 = &padding5;
+		padding6 = &padding6;
+		padding7 = &padding7;
+		vdo1-rdma0 = &vdo1_rdma0;
+		vdo1-rdma1 = &vdo1_rdma1;
+		vdo1-rdma2 = &vdo1_rdma2;
+		vdo1-rdma3 = &vdo1_rdma3;
+		vdo1-rdma4 = &vdo1_rdma4;
+		vdo1-rdma5 = &vdo1_rdma5;
+		vdo1-rdma6 = &vdo1_rdma6;
+		vdo1-rdma7 = &vdo1_rdma7;
 	};
 
 	cpus {
@@ -2507,6 +2530,16 @@ vdosys1: syscon@1c100000 {
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0 0x1000>;
 		};
 
+		mutex1: mutex@1c101000 {
+			compatible = "mediatek,mt8188-disp-mutex";
+			reg = <0 0x1c101000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DISP_MUTEX>;
+			interrupts = <GIC_SPI 494 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x1000 0x1000>;
+			mediatek,gce-events = <CMDQ_EVENT_VDO1_STREAM_DONE_ENG_0>;
+		};
+
 		larb2: smi@1c102000 {
 			compatible = "mediatek,mt8188-smi-larb";
 			reg = <0 0x1c102000 0 0x1000>;
@@ -2528,5 +2561,270 @@ larb3: smi@1c103000 {
 			mediatek,larb-id = <SMI_L3_ID>;
 			mediatek,smi = <&vpp_smi_common>;
 		};
+
+		vdo1_rdma0: rdma@1c104000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c104000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA0>;
+			interrupts = <GIC_SPI 495 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L2_MDP_RDMA0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x4000 0x1000>;
+		};
+
+		vdo1_rdma1: rdma@1c105000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c105000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA1>;
+			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vpp_iommu M4U_PORT_L3_MDP_RDMA1>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x5000 0x1000>;
+		};
+
+		vdo1_rdma2: rdma@1c106000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c106000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA2>;
+			interrupts = <GIC_SPI 497 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L2_MDP_RDMA2>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x6000 0x1000>;
+		};
+
+		vdo1_rdma3: rdma@1c107000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c107000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA3>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vpp_iommu M4U_PORT_L3_MDP_RDMA3>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x7000 0x1000>;
+		};
+
+		vdo1_rdma4: rdma@1c108000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c108000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA4>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L2_MDP_RDMA4>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x8000 0x1000>;
+		};
+
+		vdo1_rdma5: rdma@1c109000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c109000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA5>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vpp_iommu M4U_PORT_L3_MDP_RDMA5>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0x9000 0x1000>;
+		};
+
+		vdo1_rdma6: rdma@1c10a000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10a000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA6>;
+			interrupts = <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vdo_iommu M4U_PORT_L2_MDP_RDMA6>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xa000 0x1000>;
+		};
+
+		vdo1_rdma7: rdma@1c10b000 {
+			compatible = "mediatek,mt8188-vdo1-rdma", "mediatek,mt8195-vdo1-rdma";
+			reg = <0 0x1c10b000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_MDP_RDMA7>;
+			interrupts = <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vpp_iommu M4U_PORT_L3_MDP_RDMA7>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			#dma-cells = <1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xb000 0x1000>;
+		};
+
+		merge0: merge@1c10c000 {
+			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10c000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE0>,
+				 <&vdosys1 CLK_VDO1_MERGE0_DL_ASYNC>;
+			clock-names = "merge", "merge_async";
+			interrupts = <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			resets = <&vdosys1 MT8188_VDO1_RST_MERGE0_DL_ASYNC>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xc000 0x1000>;
+			mediatek,merge-mute;
+		};
+
+		merge1: merge@1c10d000 {
+			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10d000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE1>,
+				 <&vdosys1 CLK_VDO1_MERGE1_DL_ASYNC>;
+			clock-names = "merge", "merge_async";
+			interrupts = <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			resets = <&vdosys1 MT8188_VDO1_RST_MERGE1_DL_ASYNC>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xd000 0x1000>;
+			mediatek,merge-mute;
+		};
+
+		merge2: merge@1c10e000 {
+			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10e000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE2>,
+				 <&vdosys1 CLK_VDO1_MERGE2_DL_ASYNC>;
+			clock-names = "merge", "merge_async";
+			interrupts = <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			resets = <&vdosys1 MT8188_VDO1_RST_MERGE2_DL_ASYNC>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xe000 0x1000>;
+			mediatek,merge-mute;
+		};
+
+		merge3: merge@1c10f000 {
+			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c10f000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE3>,
+				 <&vdosys1 CLK_VDO1_MERGE3_DL_ASYNC>;
+			clock-names = "merge", "merge_async";
+			interrupts = <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			resets = <&vdosys1 MT8188_VDO1_RST_MERGE3_DL_ASYNC>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xf000 0x1000>;
+			mediatek,merge-mute;
+		};
+
+		merge4: merge@1c110000 {
+			compatible = "mediatek,mt8188-disp-merge", "mediatek,mt8195-disp-merge";
+			reg = <0 0x1c110000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
+				 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
+			clock-names = "merge", "merge_async";
+			interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			resets = <&vdosys1 MT8188_VDO1_RST_MERGE4_DL_ASYNC>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x0000 0x1000>;
+			mediatek,merge-fifo-en;
+		};
+
+		ethdr0: ethdr@1c114000 {
+			compatible = "mediatek,mt8188-disp-ethdr", "mediatek,mt8195-disp-ethdr";
+			reg = <0 0x1c114000 0 0x1000>,
+			      <0 0x1c115000 0 0x1000>,
+			      <0 0x1c117000 0 0x1000>,
+			      <0 0x1c119000 0 0x1000>,
+			      <0 0x1c11a000 0 0x1000>,
+			      <0 0x1c11b000 0 0x1000>,
+			      <0 0x1c11c000 0 0x1000>;
+			reg-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				    "vdo_be", "adl_ds";
+
+			clocks = <&vdosys1 CLK_VDO1_DISP_MIXER>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE>,
+				 <&vdosys1 CLK_VDO1_26M_SLOW>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 CLK_VDO1_HDR_VDO_BE_DL_ASYNC>,
+				 <&topckgen CLK_TOP_ETHDR>;
+			clock-names = "mixer", "vdo_fe0", "vdo_fe1", "gfx_fe0", "gfx_fe1",
+				      "vdo_be", "adl_ds", "vdo_fe0_async", "vdo_fe1_async",
+				      "gfx_fe0_async", "gfx_fe1_async", "vdo_be_async", "ethdr_top";
+
+			interrupts = <GIC_SPI 566 IRQ_TYPE_LEVEL_HIGH 0>;
+			iommus = <&vpp_iommu M4U_PORT_L3_HDR_DS_SMI>,
+				 <&vpp_iommu M4U_PORT_L3_HDR_ADL_SMI>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			resets = <&vdosys1 MT8188_VDO1_RST_HDR_VDO_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8188_VDO1_RST_HDR_VDO_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8188_VDO1_RST_HDR_GFX_FE0_DL_ASYNC>,
+				 <&vdosys1 MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC>,
+				 <&vdosys1 MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC>;
+
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x4000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x5000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x7000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0x9000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xa000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xb000 0x1000>,
+						  <&gce0 SUBSYS_1c11XXXX 0xc000 0x1000>;
+		};
+
+		padding0: padding@1c11d000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c11d000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0xd000 0x1000>;
+		};
+
+		padding1: padding@1c11e000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c11e000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING1>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0xe000 0x1000>;
+		};
+
+		padding2: padding@1c11f000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c11f000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING2>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0xf000 0x1000>;
+		};
+
+		padding3: padding@1c120000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c120000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING3>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x0000 0x1000>;
+		};
+
+		padding4: padding@1c121000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c121000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING4>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x1000 0x1000>;
+		};
+
+		padding5: padding@1c122000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c122000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING5>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x2000 0x1000>;
+		};
+
+		padding6: padding@1c123000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c123000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING6>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x3000 0x1000>;
+		};
+
+		padding7: padding@1c124000 {
+			compatible = "mediatek,mt8188-disp-padding";
+			reg = <0 0x1c124000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_PADDING7>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x4000 0x1000>;
+		};
 	};
 };
-- 
2.46.1.824.gd892dcdcdd-goog


