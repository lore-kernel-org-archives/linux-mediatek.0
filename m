Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0AACFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVWeCDa6r/g+qpS30FWGjNuOpH4g9qcvSdYTe3L1GXw=; b=vg6BNctZTOskLa
	ft6A+mLw5HVPhkdJeEZV8kK3lF217uOLIk0ptt8wktOLZO6F1DzXr99bo4/vBk0ZqaPspusqttVaY
	TyOqDQ5aI+hTJY4TclrgrelTrUq8s5quhJiQ8Vm+i28/U+M0vjnU+sMyKANLLf22t+5s2f9jcJPmf
	+Fis6ynKBsnJWdOe0G28qmN9FzW1dGDDuvxoaFoNPgxLFxbHDSfalR4YUN4gjsNZDLQDaCU5nMXXV
	x2Ma8e6eIxCFScdsm1DQicgpHFLY/73tiS74UfSc28KLpS/wYtjseV0kAVpGUSHFRv3zrbQWRB9zw
	+P9tNx7QsiKGQSTsuM0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swdXQ-0000000BNos-3ev5;
	Fri, 04 Oct 2024 08:19:48 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swdQl-0000000BM0C-0gzv
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Oct 2024 08:12:56 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20aff65aa37so15258415ad.1
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Oct 2024 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728029574; x=1728634374; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVWeCDa6r/g+qpS30FWGjNuOpH4g9qcvSdYTe3L1GXw=;
        b=Mj92CkstXo61vcQ16FAFEIIKkSSDefc2GF85Zm0ha/3WEnwRg1oRo0xcB3xTcPI8vV
         hhASCIstz/sd8BgxJLcucJ5kQhzA2pZkKaSi9re7RJsZtxfNZWD1StGojDad8UdnxMaA
         hapPAfD9X+YT+TNLa+ff6aszP8nN2zAj3/vNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029574; x=1728634374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVWeCDa6r/g+qpS30FWGjNuOpH4g9qcvSdYTe3L1GXw=;
        b=fSpMt/nobPZHWRoIYc/ygTl5BOMEtYtYB/laG6IcKB52bIbKpW9uxoBWIVJB4RHNjr
         14GtURsZD9L8AOk0DnZ8C6E7mD0khg+rTuGvPiiz+q/LTC/7xJB6TwfPs5Ky1GmZGl/b
         VS7tVRfuJSXPXTkHNNPaNmnvEOWeIlyXX/gRq4qWTyZZHLrpHcau/W2tgRuxHbyivmxP
         91sgzhdiK3sv3wqCL2lH3GGn5nxSn09qhgxpOHmaDsOwdl3kOp8T8+PV9ORVcxJEmlqD
         /vqtI5pJP22bhc8+78gq/t70UY4unQEpcYL9wFukXzypclmb1nDxrI8ACWoKUsx/pm5k
         ZqKw==
X-Forwarded-Encrypted: i=1; AJvYcCU+t1JcyDoKk2sd7HoG+LsqCm2abYCrfrED+HftLetwD4Li2wqVztysejNKzW/ME6RGQ2nkoeuCpdCPoWGSuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYFmK2/J+FY9ObqIVyDUqSDv/DpMae9oetroldDgUdfKBcfU3I
	ulsvz0vzxUdYFlRfH3I8snkiARv2O2OYt6LNFSVRjAaQ1lrUF2OjWiYp2IhrYg==
X-Google-Smtp-Source: AGHT+IGP0jvF/5pSOypEO+vc/qNSUNVQ+HbJ9vh7v4FjbPL7yc7D1XiNikXcjrWfP5UtVy01MXm7SA==
X-Received: by 2002:a17:902:ecc9:b0:20b:4f95:9325 with SMTP id d9443c01a7336-20bfdfb4cdbmr30094245ad.17.1728029573988;
        Fri, 04 Oct 2024 01:12:53 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:73bb:cecf:e651:2ce6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefad264sm19401305ad.205.2024.10.04.01.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 01:12:53 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
Date: Fri,  4 Oct 2024 16:11:55 +0800
Message-ID: <20241004081218.55962-4-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241004081218.55962-1-fshao@chromium.org>
References: <20241004081218.55962-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_011255_216599_82D561E5 
X-CRM114-Status: UNSURE (   9.96  )
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

Changes in v3:
- add the secondary MIPI DSI

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 51 ++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 3cc00a898cc9..d39940ed6f5c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1844,6 +1844,26 @@ pcieport: pcie-phy@0 {
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
@@ -2229,10 +2249,41 @@ larb19: smi@1a010000 {
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
2.47.0.rc0.187.ge670bccf7e-goog


