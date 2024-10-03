Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA48CF855A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEQbIZ1kOEPpCwOKFUVGo0GWUflsfubNyX6zy8z13EU=; b=1s77EIpJjfab9K
	p4ig6xHBvVP7J6WMo2pKFjC/9yXpnKNqhzNfyJBirwRjhhia/VRKiG+tOiVqULQjxqzPk4IjVLlsE
	8w55kl8p87V1q+2sTnuDVQ298e+O9prCwmVgk5GEvL8U5kl7IqEy2vyyd0pQ8a09WPDs/w62iA64i
	HxXXGN61bBSn6vfpy4ouER916YWHvzmVm7hAi4fpCoK5VHhsQj/BOx8hS+lWL/gSILupU99B65kCk
	8kAEo22RpIsNp+bBkvhwVzgMVNpDbKtFzH0/NUaz2nUYc882JP1+QVw/SzGn8Q/ocuXrGPNRA0WX0
	ykoOcsKLGDQwB89FI1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swFvE-00000008LRJ-0CMo;
	Thu, 03 Oct 2024 07:06:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqV-00000008KSu-2bdb
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:01:56 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7178df70f28so548317b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938914; x=1728543714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEQbIZ1kOEPpCwOKFUVGo0GWUflsfubNyX6zy8z13EU=;
        b=C+rTa8NrV9gloMgi1glvhCS6axsWDqrckWf+ZxT+D34Y4kyNVIvZv8n1LhK4H7uh2G
         QjWGWzc8vsj19VFX9F1AerHTggrO6SOy1tA8GPx0+Ou4/p2x8+sf++Ta006FdTOOinX3
         UCui1db61xvq2YIsGl1tkrEFu1u4JWX62pGzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938914; x=1728543714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HEQbIZ1kOEPpCwOKFUVGo0GWUflsfubNyX6zy8z13EU=;
        b=pcQeJA7oCea4jLntYkdqcSf6Rw5nwmGD0iD3KSO6d4azLPmikd5yEdoaDII2Ah/oyD
         VN6eIBYv+4WTKn7O1sL80C8ALZuz++G+qeL+U2C2fKwZyMlQY2QLqjge5eJs4QcznQim
         NkWzVP79DYPuW/tE4xcMaA/j55n94fmfVmSg+c80M1TnX2f4+YEKCYRdaoghgzenVByH
         ZTBHQW/+D+AduRjrcRxSCqC4LXav6s1Nqp05BiDpJanpQcXm+zmtAvCGvdT0Afuc6lGf
         eP7YK9yP0Ie8Pe4mhCC9CUSgHTK8ZgGF5xDkx8RUbdFBjoCn+19byW6NQ9P+VcUfXY50
         EQzw==
X-Forwarded-Encrypted: i=1; AJvYcCVKsPZUgcBQBKsyNHqFEuA88gAPpN3WHPCxf+ANIh5BcwK5Rt0vGh96dLye8wDK7ED4PM/239AV9RkZjV6KHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSOeAs75QpS+uw8JuuDzfBtQqJsLXbftCA8h0PNyc9X28ZPnQT
	AfPWMiyagxQIA0ZfSCzLPiaPXbE6mSTcE8EeKxD+C0kA6aR41HAgSBfuqslvmA==
X-Google-Smtp-Source: AGHT+IHOgHjrlMxD2zoM2IlOxDAItRRWCVLa9fyphfermgyfQ3vL8yGSyzT4jH4vijnNVzmVtvYQDQ==
X-Received: by 2002:a05:6a00:178c:b0:70d:2fb5:f996 with SMTP id d2e1a72fcca58-71dc5c67164mr8309063b3a.11.1727938914540;
        Thu, 03 Oct 2024 00:01:54 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:01:54 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 3/9] arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
Date: Thu,  3 Oct 2024 14:59:57 +0800
Message-ID: <20241003070139.1461472-4-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241003070139.1461472-1-fshao@chromium.org>
References: <20241003070139.1461472-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000155_703644_1B9C9311 
X-CRM114-Status: UNSURE (   9.93  )
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

Add MIPI DSI and the associated PHY node to support DSI panels.
Individual board device tree should enable the nodes as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 23101d316c4e..719d2409a7db 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1839,6 +1839,16 @@ pcieport: pcie-phy@0 {
 			};
 		};
 
+		mipi_tx_phy: dsi-phy@11c80000 {
+			compatible = "mediatek,mt8188-mipi-tx", "mediatek,mt8183-mipi-tx";
+			reg = <0 0x11c80000 0 0x1000>;
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
@@ -2224,10 +2234,26 @@ larb19: smi@1a010000 {
 			mediatek,smi = <&vdo_smi_common>;
 		};
 
+		disp_dsi: dsi@1c008000 {
+			compatible = "mediatek,mt8188-dsi";
+			reg = <0 0x1c008000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DSI0>,
+				 <&vdosys0 CLK_VDO0_DSI0_DSI>,
+				 <&mipi_tx_phy>;
+			clock-names = "engine", "digital", "hs";
+			interrupts = <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&mipi_tx_phy>;
+			phy-names = "dphy";
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			resets = <&vdosys0 MT8188_VDO0_RST_DSI0>;
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
2.46.1.824.gd892dcdcdd-goog


