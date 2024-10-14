Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C8AD1625C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwIS9I03C/lAU1nJtc47O9K/5Y8oWUHw3UUCf3xwMKQ=; b=fkHTUatj6q7MWG
	uFG/XOV/x0610izB6QUSowBtvOVBB1e0IMYIEKSzpCjfFj1LbW50q2WUqTtwleoiO1bimCSht3mtD
	HZbvARnLSTiqNSEG23obJHVdhofXT48L5R/8Zs2LKbkOF5DUl+HvCGiFSMsuVT0ghBHY0i7N5gmZs
	cOmKx6eD+ozy3ZqJ6Fr5n1TEDeBzUXl29q8k5dHtciEtIcT7GWuCWNgBqcDXjvR3+mIcA4oENN4Vr
	GxtfmESkQgc+JpEnW7Qos+1D5U8RDsK9zp+krIL/XhB7X/xIPfngM104i1/o4BgDUeEe3MJZBLRAm
	+wFlUWbbc7U9CPpyMnBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KVD-000000058TN-09wj;
	Mon, 14 Oct 2024 12:48:47 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iyt-00000004rNq-0rPp
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:20 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso28849325ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904279; x=1729509079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwIS9I03C/lAU1nJtc47O9K/5Y8oWUHw3UUCf3xwMKQ=;
        b=Q6YgdqtIT0Rb/pa9aCiOTFiMoFF+pvpKCaUFdIWWYJGN90X8PQcvoiSwQRv8/njgGq
         OvLZqtFYEO2dqUB4qywyY++0D6NZGcuQjuhEKwKZxRd1ciBF8Ha6je6DHOgqu1YdySYm
         +TzLlKCK6qm95gVvt0hCs7yBUiRqP1lSW6mio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904279; x=1729509079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwIS9I03C/lAU1nJtc47O9K/5Y8oWUHw3UUCf3xwMKQ=;
        b=gOpXu3gdMoSp2nbCswfkF5QTAQssyxSMCk5+2RsuiWOHQrMiFaE+hMSxFjkWzKKi/K
         JNSZU4mXN/IWRt3jTfqd9Lh+7cC0chImKvD7nlNcLlGkbBO0w5yfpWhtE7eBlU2XygCV
         7+cKqawEmdrQVRZdHHBKrLNcc89s3fxJ91KBsyV08mxTo+hef5t6WMJLnNNkdJV7dJza
         JNNk0y8zlvbKUHhDzF+tpKOYnYnuTMBD/s+M6isLrGK5TWUzcNEBDAOBtqoiAbFdoMrs
         DlULZepE/3UX37/Q9IO2jfN+cub6eGg2z14bNDlS6iEPoqLTqEaEGsOFkKj9cArEHTC4
         K2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCULWF9g6ZXPMPICdYKafQ12yjANkQAgImcQ9yM8OblWpfVmSZkehGOmxzXdhx8js4FofA9BoSYLYRNJ/kSRrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyorZRre+ulvf5yAMIM7gvyw51PvGJ6k4jTX+H+hbqgqxo0Wdqb
	UtRBWWcd7YpOeBGcRhh2ojAis+G0umR3jPUM+1qF+y+33COUNbXc5evZtAc07z5/mBqgmX0m4KJ
	TRg==
X-Google-Smtp-Source: AGHT+IFpFG9R++JpQbBp8jKqFx4zYvCgDM8kF47+6kRcMglDB5kru9b7NJ+CTGr+DS5hxHELONN6Sw==
X-Received: by 2002:a17:902:f64b:b0:20c:ecd9:960 with SMTP id d9443c01a7336-20cecd91365mr42931695ad.27.1728904278664;
        Mon, 14 Oct 2024 04:11:18 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:18 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
Date: Mon, 14 Oct 2024 19:09:24 +0800
Message-ID: <20241014111053.2294519-3-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041119_286084_932942AA 
X-CRM114-Status: GOOD (  10.18  )
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

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 10195a4e4e9d..23101d316c4e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1763,6 +1763,54 @@ xhci0: usb@112b0000 {
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
@@ -1775,6 +1823,22 @@ nor_flash: spi@1132c000 {
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
2.47.0.rc1.288.g06298d1525-goog


