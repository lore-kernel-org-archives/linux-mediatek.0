Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D26CFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=51XTVsZzEt4mq71MSs0yqggO8rkXWZxGhVvPUO2dS4I=; b=mzblINy3fbyDef
	kvqadTtOJ1mG+aVGyBeYZyHKx2Yz2DepG2it4TiBkiCOmUNNbr1/xx/z8SfEVjKH5h5ta5D0S/dG4
	CIJjz6NzHKAh58NDQX9gphVMABG5H0hUeb5SWhE82+OvE7DUu+OKVg7S4LUjeJvp1jLdXdqkY0ZYq
	JhFzi4nS64NyW/FHJBa2xEa8Hm5em7QkoNyA4VLuqJXNRxouUJVi+CpMirWMM47F3c2NNcZN8/BT7
	8dAcCeXFbeLyLMwMzSGw8ql7IPE/T5ChAP+AB5a1SmoZvoHkCRpLKvH6xVyxSNHtZ5dJ3ELyImRYA
	o5YxFj6g+KxpHnwqUpDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdUz-0000000BNSq-1c8Q;
	Fri, 04 Oct 2024 08:17:17 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdQi-0000000BLz5-0j6o
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:12:53 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20b1335e4e4so17924695ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728029571; x=1728634371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=51XTVsZzEt4mq71MSs0yqggO8rkXWZxGhVvPUO2dS4I=;
        b=Ad5IKdXkRrPNTEb94WYZQXYRwGtCKoOneYIYJTR/GZKhk13y6Vark5sGVRVkHyRnzB
         VTZOFy+kpCNbDAP44npAF8u97ScKNlzVz0fT/WCAhAnYzy8BABTNSsITSwNsMUeiRX3F
         MX9i+tLE6GaV9fScFoptUzuHeObQTuswyXlnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029571; x=1728634371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51XTVsZzEt4mq71MSs0yqggO8rkXWZxGhVvPUO2dS4I=;
        b=pkcRE3pZ5gROjmiUOdVWF/aCCueYSoDvjFDAb2IhAWvrWNd7EBOA0oJr9Ga1UZyVwQ
         XaqY5SJy0kIy/RhV+900wNwepY008gU2tmidHh22ltDpgh9xWWD7oTiMxbTS5Aa2uErR
         +cgEydkGqu0eGvbfiQQfNMwWVsRHCWwYDsoKdxmylzksP/Lo9d/64sZFEcevT3aVvMu+
         y75rih1RL0jvapuzyI8ormSBnXRPnBfaiFbVOzqpKALehkTtzcm025G48Z8361ofHv+N
         wsqqFrx1mtqtL9qsPAFYHg6CnsoVgQrKHGo+b4RDmJ6P+S8IT0x65TNaWR2yzF8XvtRJ
         gsUg==
X-Forwarded-Encrypted: i=1; AJvYcCUXrJ7xyHa5jOF87NOHiBcMrJ3nZnYSQtSs5PWcimSfX5QIl+hIm1+g1S7v5PlW5WEpC4j4hV1KPZ7Xq9aT/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6R9v9CA7qPiEfeokKV1u7IDTDCBCkUOPwUP3TfqBBuF6YBUvc
	C7IIds4Q3Q/Sf5jqRnb4W1ty3i0gWsIhVLEfgEOY/xpBx+Ox6c/+/uMeVtJEbQ==
X-Google-Smtp-Source: AGHT+IFyMA3M/DNWq/zKUz0UfhJqSPFA7wlM693F6oloupjh2iNEoH5dRNi6WQAnKOnmbqg42ucsIA==
X-Received: by 2002:a17:903:32cc:b0:20b:a9f3:7996 with SMTP id d9443c01a7336-20bff17b269mr28842715ad.51.1728029571249;
        Fri, 04 Oct 2024 01:12:51 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:73bb:cecf:e651:2ce6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad264sm19401305ad.205.2024.10.04.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:12:50 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
Date: Fri,  4 Oct 2024 16:11:54 +0800
Message-ID: <20241004081218.55962-3-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
References: <20241004081218.55962-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_011252_239324_D799E7DD 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add PCIe node and the associated PHY node.
Individual board device tree should enable the nodes as needed.

Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v2)

Changes in v2:
- add linux,pci-domain to PCIe node
- add power domain to PCIe PHY node
  The binding patch:
  https://lore.kernel.org/all/20240926101804.22471-1-macpaul.lin@mediatek.com/

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index e216a0b40b9e..3cc00a898cc9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1766,6 +1766,54 @@ xhci0: usb@112b0000 {
 			status = "disabled";
 		};
 
+		pcie: pcie@112f0000 {
+			compatible = "mediatek,mt8188-pcie", "mediatek,mt8192-pcie";
+			reg = <0 0x112f0000 0 0x2000>;
+			reg-names = "pcie-mac";
+			ranges = <0x82000000 0 0x20000000 0 0x20000000 0 0x4000000>;
+			bus-range = <0 0xff>;
+			device_type = "pci";
+			linux,pci-domain = <0>;
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
@@ -1780,6 +1828,22 @@ nor_flash: spi@1132c000 {
 			status = "disabled";
 		};
 
+		pciephy: t-phy@11c20700 {
+			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
+			ranges = <0 0 0x11c20700 0x700>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
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
2.47.0.rc0.187.ge670bccf7e-goog


