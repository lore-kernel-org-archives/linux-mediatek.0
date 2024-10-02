Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202C0CF31B8
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zqcv24UnbKvuBwfI70WgH+r7YGyISN8r86eb90rkpPo=; b=u9hDUYpDoW7TZW
	08h+b/Xr2K+6d9rGM3Z/+pbac4xqb5C3PNayMzIG8EwHeha+Fpg/L2z2slrBuveitQXU/m5z5l3AV
	r93OkT1Y24VlBl3M59bIYL+P6s2nuTZfAT8x6ALK0wXAAIKWO5bqXiRteTJfaZdF4c+mJ9r2F0I3F
	8HS4n4zLMFetICGDAme5ackCL90wRMtaAEK0ksIQcaIgjH+kubq9BYWnY/eBKBiEwDr3mYho+MQK2
	73DxiPYmirFGg85fS2mokllnNlsdJWLG6GfIW4Ye+xZwFYbLL8bt+CsnFwxMRvJeI61imlg7CahBu
	ekols5N9R8LDgFfCuKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svxrB-00000005igT-3UEP;
	Wed, 02 Oct 2024 11:49:25 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxok-00000005ht0-486B
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:46:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71970655611so6073674b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869614; x=1728474414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zqcv24UnbKvuBwfI70WgH+r7YGyISN8r86eb90rkpPo=;
        b=k6ETncH57Z6B0g0oqgvZ/Oyi9CUUMtOrlhaZdoIvGqaLdLGLS9k5iK484ZIsufgidZ
         cqmd3HngUYSDlGEAcJ6LdRhZmGeWQPDixyjcv9I95tGXHsYid2gsJvAzOD6FgnXNjPZO
         C5bbhldILAMATbQT8SaUUTNwylvmxPUHVJsuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869614; x=1728474414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zqcv24UnbKvuBwfI70WgH+r7YGyISN8r86eb90rkpPo=;
        b=WIkmdqW0mzXA5GCl1giAGTtuMjg6Y8Yztf7wLoSEZYqE1XdIy64eCdwMVxjUFvdIc1
         OBmtXj2AJNUDX+psqZ22HS+grcYo51XauzZ3F3BXh2h+QZ0PkHNYphG8miz5D91rt6qh
         hKr25nsHVIe5+SYzrz4epGqp2LHjbDl56IWMJZQSKLQpq/61W4O029OWAEDm2RIVaiA6
         GNuFDbaKQVD20xSCAooaJnZthAejs/o8vW4tf1B6aLeAGwFiTQ8yspq7rdC9hf+q7AQp
         WKkp85Q6bjQDJa2abkqD/Cn1/IrebD30xET+p01oyUlarsQZs67+e4nxBaJv2MTYR8n0
         cmZg==
X-Forwarded-Encrypted: i=1; AJvYcCWKC3REAUff33LLJVh/fAViFaAhTwYt6W6LlxZuBwjanZbHpErXhxntDfIuxnmQCqSL0KncY5zHiiYUGIkG2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNBjZpmZqHjtnQIgC3j8aXBoFdG7faZii0wabTS3lwO2wsz/qK
	grcmPAM1u6IB69d4ZoStiL8zX3y5CWe7UtDqIhU4/XW7I/UDknBBlzb20LjvyA==
X-Google-Smtp-Source: AGHT+IEwomWwgrAa/H+NP+99BGuS6Y7BDAEuXzdKPzHGURnkcArLhqtRMWXVinDRUNBZF2+LAcqmbg==
X-Received: by 2002:a05:6a00:4f90:b0:717:8deb:c195 with SMTP id d2e1a72fcca58-71dc5d429cbmr4642019b3a.21.1727869613991;
        Wed, 02 Oct 2024 04:46:53 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:46:53 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
Date: Wed,  2 Oct 2024 19:41:42 +0800
Message-ID: <20241002114614.847553-3-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_044655_045651_3EB0BB2C 
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add PCIe node and the associated PHY node.
Individual board device tree should enable the nodes as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 10195a4e4e9d..9431f3c5c228 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1763,6 +1763,53 @@ xhci0: usb@112b0000 {
 			status = "disabled";
 		};
 
+		pcie: pcie@112f0000 {
+			compatible = "mediatek,mt8188-pcie", "mediatek,mt8192-pcie";
+			reg = <0 0x112f0000 0 0x2000>;
+			reg-names = "pcie-mac";
+			ranges = <0x82000000 0 0x20000000 0 0x20000000 0 0x4000000>;
+			bus-range = <0 0xff>;
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
+				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
+				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>;
+			clock-names = "pl_250m", "tl_26m", "tl_96m", "tl_32k",
+				      "peri_26m", "peri_mem";
+
+			#interrupt-cells = <1>;
+			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-map = <0 0 0 1 &pcie_intc 0>,
+					<0 0 0 2 &pcie_intc 1>,
+					<0 0 0 3 &pcie_intc 2>,
+					<0 0 0 4 &pcie_intc 3>;
+			interrupt-map-mask = <0 0 0 7>;
+
+			iommu-map = <0 &infra_iommu IFR_IOMMU_PORT_PCIE_0 0xffff>;
+			iommu-map-mask = <0>;
+
+			phys = <&pcieport PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+
+			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
+
+			resets = <&watchdog MT8188_TOPRGU_PCIE_SW_RST>;
+			reset-names = "mac";
+
+			status = "disabled";
+
+			pcie_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
 		nor_flash: spi@1132c000 {
 			compatible = "mediatek,mt8188-nor", "mediatek,mt8186-nor";
 			reg = <0 0x1132c000 0 0x1000>;
@@ -1775,6 +1822,21 @@ nor_flash: spi@1132c000 {
 			status = "disabled";
 		};
 
+		pciephy: t-phy@11c20700 {
+			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
+			ranges = <0 0 0x11c20700 0x700>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			pcieport: pcie-phy@0 {
+				reg = <0 0x700>;
+				clocks = <&topckgen CLK_TOP_CFGREG_F_PCIE_PHY_REF>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+		};
+
 		i2c1: i2c@11e00000 {
 			compatible = "mediatek,mt8188-i2c";
 			reg = <0 0x11e00000 0 0x1000>,
-- 
2.46.1.824.gd892dcdcdd-goog


