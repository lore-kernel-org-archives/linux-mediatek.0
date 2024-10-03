Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC96CF855E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aWjhvVZMIKZFWQGVvBTmWBQtbFvDraf8qJPfgaxmV8E=; b=udWqpRe7GOrMmV
	Su0NOLrayKYSVVL/YL9FDxNEH3H9wWL3TnuAJRKr+Nl3LiLXetCdIP9hoXa0fHZAssTkwVkDkDG30
	R5Ugs//mYzTCgE+JQ1Z5VFIHDHapAwFxBGxye/gFBhOqlWH7CjnvILxHf9p+93X6Ueua4PqrMHH3e
	QHQWVMJMQGBtRuIGvqwCL21CpPce0prtLpeKicUMDWAwjqz/yh2vdEPz2RwUKKnjYdknInueJqVC6
	gbRGy3LD2NBbYrzYhuv4LMT8W9QVMh/HsKOf4uLGpwfY++Z+dSlhwUaHjWRuy0//Y+eAaQ5YFP8DK
	K57QKTIoVXhC01f9QVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swFu1-00000008LKA-2o7H;
	Thu, 03 Oct 2024 07:05:33 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqT-00000008KRZ-04uC
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:01:55 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so1115895b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938912; x=1728543712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWjhvVZMIKZFWQGVvBTmWBQtbFvDraf8qJPfgaxmV8E=;
        b=dNL+7xDembzBoP1Poay0pUhQi2kq4eyP22+SYmUyUt5swR+cHrAlLzsPaKaY9IDb5M
         NdYF1dxH/iz7vzEyqMQa8RaDIbwBSx2UYDPBQrN5W/radA9Cy5v28dGGfCihGDSnvCxR
         pahPpksikqjViYwGrnY6jWSYV/WLWDNloPcaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938912; x=1728543712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWjhvVZMIKZFWQGVvBTmWBQtbFvDraf8qJPfgaxmV8E=;
        b=eIxgWemw5vht8Fu3xfrwqGVfGUVrpRhBw66eWLCDJG2BQoyUKx1fvR5SyD638uQdX8
         k6ws1z14w/3F0VPTW4ZUW9fJUORaiuY+Ua/jsbXFuPAkDs0FIDGDqt2t0eKP/NDiN7h6
         q8V7OV+9qGKU1vFgClzIPYYZBP+XC8+HTYGmsxbSl9Ggg5LO6I8jJt8GZMcJLMaIHCl6
         8oGHcFJ3saH6hpbN7bv0zFCFw7KA+sIqprNVhkErJFLUlMhmDUwtFzaXNSqMPmLOKiJf
         ux12GgUfJMRqhZrsfpedxYHOIIqZtoSoF1RIgklb7LHNHqDNND4Lq8Me3KdLGUmAJQob
         7kwg==
X-Forwarded-Encrypted: i=1; AJvYcCWrgZn3MG+QT/+7bOJUXD417v/iuLHHwC4wWXxMRtrOlQIwRUpsQF1M4yLo19qBWxhr8YZhTyhlrpGIHfB+jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOAYOBDWo+04ey5hvJJynhC7XqeDm3zSlT04kbajrQLuYXsmqu
	0XrGqky6MlpZY/LEihTt0IkwI0p2/Dd0sE9H010nVXmw4AUcQCXFvMEgEXqwwA==
X-Google-Smtp-Source: AGHT+IGhrhDbzrLuVxP6LwbUL6ZECwPUpOpG8SVbkabencZcbtS6o7ftPals6nEeuoFPkwElfXd0PA==
X-Received: by 2002:a05:6a20:c89b:b0:1d5:10c1:4713 with SMTP id adf61e73a8af0-1d6d3a8b86emr3319481637.14.1727938911986;
        Thu, 03 Oct 2024 00:01:51 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:01:51 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 2/9] arm64: dts: mediatek: mt8188: Add PCIe nodes
Date: Thu,  3 Oct 2024 14:59:56 +0800
Message-ID: <20241003070139.1461472-3-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241003070139.1461472-1-fshao@chromium.org>
References: <20241003070139.1461472-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000153_091265_2EA884F1 
X-CRM114-Status: GOOD (  10.74  )
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

Add PCIe node and the associated PHY node.
Individual board device tree should enable the nodes as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- add linux,pci-domain to PCIe node
- add power domain to PCIe PHY node.
  The binding patch:
  https://lore.kernel.org/all/20240926101804.22471-1-macpaul.lin@mediatek.com/

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
2.46.1.824.gd892dcdcdd-goog


