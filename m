Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F867D1625C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkghV/5ttd0WEHIT0bzLSGy7WYCQ+WZI8ud8NY6MHoo=; b=0E+yj6iJmL9sbb
	LCKXKbYW2YvS/gtjmQyCs/PRamI7av1+EKxrhl5hrwCukExv2awg2REjBJAr7SNeZP742OUBSdtiY
	r83T0mccuv7ze7/xW9NzBvrnWpkEoer/Ne45998N0uXLAqCwqirftmwLNfHeOFGg+Mb3OnozaH4sk
	MJImd3/rLVMPlA7H6YZlpX8THLCCxKuHDbLxDy29IK+wuvqVp2yg0nMEcn6BgjmeOwczkaJjaw1xV
	kT67qQ8VEZJon5aNjxw+6J6SD2Cb9JpXSr7p/zbV7JVYLAFf4s5myniQ2kXds8TWS5PbEUTDkGb7T
	1S7xIdzutHf2e56XUQmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KVX-000000058b8-0MwM;
	Mon, 14 Oct 2024 12:49:07 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iyw-00000004rPc-1aBR
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:23 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20c803787abso27352075ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904281; x=1729509081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkghV/5ttd0WEHIT0bzLSGy7WYCQ+WZI8ud8NY6MHoo=;
        b=mwDSQSbaBnNyCpd7cPfQQKTSSpeMJIj2p73n87mjcMAZ1ALKABP3LpL+BAdIuq+7d9
         KHrzcqcIi/yQhcUDuZFBy6lcVns/HQL5i1xj6pW0NhEqusiD8MIjUW0XzM/AyDWb8l0f
         T9nQMJPozCLSMGvcvBvDRrQxl1tnxD4nWyBew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904281; x=1729509081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkghV/5ttd0WEHIT0bzLSGy7WYCQ+WZI8ud8NY6MHoo=;
        b=R2+xf0rbi1nO4vhrp1mNMBAM1Kh0knFkjbbGpfmXfOpp44aCuiUObYKzvqV4o35Y5f
         uMLy9S+JtuZ7pXSXEvcb5+23ZE3Cv6XKLKIHNkEQvQeYDcdfuzQL7OTI//MQC/4gn0RT
         ZJeDagAqCDBTkItnzNMv/Nw9hXxLpXz7aau9SiYedFeYn1NxEuk4VWKxMz30zOKICk1x
         QKUeyuUJxHinD7JjMvOuD1qnkNcq4CsBNF//AJ1z0c6BV0MnZr62kKhqm96EjFIVW950
         z1mybixw253yNvVaT+X+qD6xl1WdConK7VkK4rGgap8GiKQUZ0qB4xIT9+GoJsc15nbS
         3MpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbla1u0V3VIXdjqa0d8U7veu+aIQpynIpxmFZLF3vGO3twgfUkJJLXX07YT5T51cbT5tRcxSdMCX2h52zSLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3eXVn3rx125EOOs5cFbPSDtcdx8WtRK+xiJNUcmZZebs7v4s5
	hk9iZRZ13mDrqVt5mUyxHnIXQLKA2OUwnn8RsbYc2iCbGy179C2+laUZogIKug==
X-Google-Smtp-Source: AGHT+IFD/L/UxhmqAna8jISuEc+twRQsxJJY8QOemrVaeu+o5vzIXS4uSFcy/BW2Cy0JRyagrA7whQ==
X-Received: by 2002:a17:903:110e:b0:205:5d71:561e with SMTP id d9443c01a7336-20ca0402291mr171066115ad.26.1728904281409;
        Mon, 14 Oct 2024 04:11:21 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:20 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
Date: Mon, 14 Oct 2024 19:09:25 +0800
Message-ID: <20241014111053.2294519-4-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041122_496999_656BB7D7 
X-CRM114-Status: UNSURE (   9.64  )
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

Add two MIPI DSI nodes and the associated PHY nodes to support DSI
panels.
Individual board device tree should enable the nodes as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v3)

Changes in v3:
- add the secondary MIPI DSI

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 51 ++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 23101d316c4e..bd36320bc60c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1839,6 +1839,26 @@ pcieport: pcie-phy@0 {
 			};
 		};
 
+		mipi_tx_config0: dsi-phy@11c80000 {
+			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c80000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		mipi_tx_config1: dsi-phy@11c90000 {
+			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c90000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-output-names = "mipi_tx0_pll";
+			#clock-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		i2c1: i2c@11e00000 {
 			compatible = "mediatek,mt8188-i2c";
 			reg = <0 0x11e00000 0 0x1000>,
@@ -2224,10 +2244,41 @@ larb19: smi@1a010000 {
 			mediatek,smi = <&vdo_smi_common>;
 		};
 
+		disp_dsi0: dsi@1c008000 {
+			compatible = "mediatek,mt8188-dsi";
+			reg = <0 0x1c008000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DSI0>,
+				 <&vdosys0 CLK_VDO0_DSI0_DSI>,
+				 <&mipi_tx_config0>;
+			clock-names = "engine", "digital", "hs";
+			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&mipi_tx_config0>;
+			phy-names = "dphy";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			resets = <&vdosys0 MT8188_VDO0_RST_DSI0>;
+			status = "disabled";
+		};
+
+		disp_dsi1: dsi@1c012000 {
+			compatible = "mediatek,mt8188-dsi";
+			reg = <0 0x1c012000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DSI1>,
+				 <&vdosys0 CLK_VDO0_DSI1_DSI>,
+				 <&mipi_tx_config1>;
+			clock-names = "engine", "digital", "hs";
+			interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&mipi_tx_config1>;
+			phy-names = "dphy";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			resets = <&vdosys0 MT8188_VDO0_RST_DSI1>;
+			status = "disabled";
+		};
+
 		vdosys0: syscon@1c01d000 {
 			compatible = "mediatek,mt8188-vdosys0", "syscon";
 			reg = <0 0x1c01d000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c01XXXX 0xd000 0x1000>;
 		};
-- 
2.47.0.rc1.288.g06298d1525-goog


