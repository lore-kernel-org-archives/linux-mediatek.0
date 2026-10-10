Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA78CA9ECC
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 11:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=; b=EqU8HLh+EO7QjEo8Lga+bQt7U3
	CUqTOTcJdVYcRTO32+mDT7My/h6A5plinFWyBPOg/nXk/Nf2q4Q7VCW1iEjb8QPuk/i89sSTFWKd+
	Wc11q19SMVt0p+W4KhxyY9j/7cfGVRnuG25mG1c7XwUZeAsSddHX+rzdnuDioI2WPIFJR/d85oeVJ
	0ZdtwTU4YV7AH222oqeJZ8MNRmWxijDU9lUICGbpZZ0azVMo9Oo/xWlR8njfL5F9+wQESa2ffxqZv
	3kRboxDcZDe3be55/SdRlNYTKRLob70PPeyMbX5t+UCUprDio5uwHex6qXoPnoWHQPy0sovBC4ggT
	USBPeuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVhF-00000007ygb-1vc2;
	Sat, 10 Oct 2026 11:57:01 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVgY-00000007y5G-3dFY
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 11:56:21 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so6723585e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Oct 2026 04:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633377; x=1792238177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=;
        b=JWWTUbZIdg7WsyHda0Swm0t1BbxxN2aiFvRotTS908u2wnnWrCd1IBFUtJUpJ3W4T6
         P23G/x9Ookg4nmgFT6C1rL403I6ZjwCO4QGxuZyDhie6jVT1RxNIRHZiV+Ncyzxn7F/6
         cI9jLpeoI3SLUzvgk+H7HZ0fp4H8ptRjLyhpKKMGY9KeczryGmMqrNUj7BY+A0scZBBb
         QpP1F56pmaT+tmOekIeD4SxOPclGdVQ23GwFIqu7lzj6Dx5Wbjeb6oRmMejxM/7GgUBc
         kq981lwu+MBrXuOysUddNpdopitkQ1UYgvfx3+/UwResDUqamfb1Cjq4dcy2R6TksymE
         c7Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633377; x=1792238177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XawY6rGwERNjw0CFRz+0ONBwu0wfWrlBMNsKmysKmec=;
        b=wlF1uM9K3S3peT7K2ijaPJMyrJMyD0A6cZr84yeVF0mhBlD1X4hpm7fcBXu3mCdeN4
         Q6iCq9rZ7noMTpqFhuZPY07MxBdSaLYT8qkTXkH7IBaYxViXVaKYLIinCRVYm37v2JsQ
         25FzTGlrNOCgb6l9sf6p8ljPHizBaKO7NsC/9QVaSK2JdlxnUmOlRTwgZHpNOimNXGpc
         +Z41CM5Rw38dzXhd7xHjQ/ZlPJW89NjEDBQf3p8xQf+EgVnkBX7VmA1It6atPm34EFJs
         JArXkWMEQQxGy9/tWPFKEZtP5ZE5HApI+Hb5uoYg4nsBOSo0QSvwSTX24h5xc7ZGYU0D
         l+Eg==
X-Gm-Message-State: AFq9FYJ7xSKOumK7y3i8adGvZ/5w3hu6AnR3VwIagA8XYf+MbfBcAomO
	ZMpHYEiDsghymbWY+qB8vYtT1dqUfMp6+2Ady1UJ5OuZaVu3f07MZczJtiCZA2pl
X-Gm-Gg: AYBFou2cQ1de8C2GrwWi82RgZJpwlCno0hXI07h0HoIoRzCN/XOs5cl5hcHIkJVJmi2
	dGpN6UKTp8CxrkfBXJB7lPuY5ghDD2HIHmYpjrFrl//A816Fk90fSvv/Lt6ZLAQBY+arrnA5wr4
	su2RcRXB5La0gwBi/9+RlShGbHPZh1qa0KgxFnGqQpE09/xhI4NTyAN6wDOEDdndXnPv5PYzzus
	I13rVlLhdLMnKv7NaXu5EDqz1tDSRvTCb4n92UXyXVxfWcoPcrikVPCZrrcCmo0lH2jEb6Djdl9
	Ix8g9N89nrqMPggaaBsAvmpO1fOV33M4A72fKu3r/lSeep7YE43mFrcpHhbvjgTIu6PvkKzSp79
	Am0WDzxMgj7A0qiu7plKIZpAg/Vswx0qfwJQUJyqQX+5tRizfgUBOB00CSLgAwQyNURpIWzN5IR
	+Yyxw6w2GU5mtcMV6y38F0flOx7o0d7AX4UBpCe1I02xjlxDS+fMxCkIYwUM6LDB4dEQ==
X-Received: by 2002:a05:600c:820a:b0:4a0:98c:e082 with SMTP id 5b1f17b1804b1-4a18e4a3f0dmr88323785e9.13.1791633377176;
        Sat, 10 Oct 2026 04:56:17 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:16 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/7] arm64: dts: mediatek: mt8167: Add HDMI display nodes
Date: Sat, 10 Oct 2026 13:54:07 +0200
Message-ID: <20261010115539.9237-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_045618_973741_E5AE2032 
X-CRM114-Status: UNSURE (   9.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the required nodes to drive HDMI output on the mt8167 SoC.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 62 ++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..ab76e0637eb1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -112,6 +112,27 @@ apmixedsys: apmixedsys@10018000 {
 			#clock-cells = <1>;
 		};
 
+		hdmi_phy: hdmi-phy@10018300 {
+			compatible = "mediatek,mt8167-hdmi-phy";
+			reg = <0 0x10018300 0 0x20>;
+			clocks = <&apmixedsys CLK_APMIXED_HDMI_REF>;
+			clock-names = "pll_ref";
+			clock-output-names = "hdmtx_dig_cts";
+			mediatek,ibias = <0xa>;
+			mediatek,ibias_up = <0x1c>;
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		cec: cec@1001a000 {
+			compatible = "mediatek,mt8167-cec", "mediatek,mt8173-cec";
+			reg = <0 0x1001a000 0 0xbc>;
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_26M_CEC>;
+			status = "disabled";
+		};
+
 		iommu: m4u@10203000 {
 			compatible = "mediatek,mt8167-m4u";
 			reg = <0 0x10203000 0 0x1000>;
@@ -120,6 +141,15 @@ iommu: m4u@10203000 {
 			#iommu-cells = <1>;
 		};
 
+		hdmiddc: i2c@11011000 {
+			compatible = "mediatek,mt8167-hdmi-ddc", "mediatek,mt8173-hdmi-ddc";
+			reg = <0 0x11011000 0 0x10>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&topckgen CLK_TOP_26M_HDMI_SIFM>;
+			clock-names = "ddc-i2c";
+			status = "disabled";
+		};
+
 		mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
@@ -145,6 +175,38 @@ smi_common: smi@14017000 {
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
 
+		hdmi: hdmi@1401b000 {
+			compatible = "mediatek,mt8167-hdmi";
+			reg = <0 0x1401b000 0 0x400>;
+			clocks = <&mmsys CLK_MM_HDMI_PXL>,
+				 <&mmsys CLK_MM_HDMI_PLL>,
+				 <&mmsys CLK_MM_HDMI_ADSP_BCK>,
+				 <&mmsys CLK_MM_HDMI_SPDIF>;
+			clock-names = "pixel", "pll", "bclk", "spdif";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_LOW>;
+			phys = <&hdmi_phy>;
+			phy-names = "hdmi";
+			mediatek,syscon-hdmi = <&mmsys 0x900>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					hdmi0_in: endpoint { };
+				};
+
+				port@1 {
+					reg = <1>;
+
+					hdmi0_out: endpoint { };
+				};
+			};
+		};
+
 		imgsys: syscon@15000000 {
 			compatible = "mediatek,mt8167-imgsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.43.0


