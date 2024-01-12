Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C586C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8XutvpXDzqORzzWXFSgOTtvqJypfYxjtC3RldXwbbz8=; b=1uO4DMXS9ElfjZVCZ/shTIL0rC
	hILDGJ3Fs3eaknf1JwUGRbXf24hsqg1uVKgy7r9pUJJEYxjIxQ/ye8QlrFI6ZU5KjLtu0pBG864fj
	XK5fsiq9R+1xk2sGgtJRbdONwMKaMN6rSp5n+TRZgoOleCwVChHMWSp5UMLTE2BEoSlYXQ4cayf1g
	XuhE1Oz/Jpd6zsxrkMyr4FCu60/WJ7bVlDMelKIoyccWQHUN0LhKkypEdkcNILd5w/uo3bgX8vZIl
	W1IzCiL/hniCHSPdVk+MAYlCHbGZtBXhEYPqBn7tDh72yL1VSaXNXbxW9lWcCcYFtow6WYirvRyDp
	0eky7GjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7n-002NCV-0g;
	Fri, 12 Jan 2024 09:46:51 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7d-002N68-2A;
	Fri, 12 Jan 2024 09:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052800;
	bh=Cpdhb43aC00QlOu8A2culCbQWTW6zeF1QAA1l5ICLYc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ilhhnwa54Iq3p/sN7pvE4ktJ6L81gFK4r2CBA6sHwuOMQmOq0o9+crnxqeo38zKR4
	 6PAzHxO0hFO+vfXZHjhQtIW15c7GSpwT9brStWmvk87b0d1s/08s/ZHZAy17pwFuiP
	 klmxkz6LLCr2Gw0dX9uTXH5Cxo90ZKiCZhTnSbi9rvMciNiPgUqH19Sv9QZSLMxPp1
	 g9EBBEvq6VTl5hjstLWQFsB7OuUYYoYTryPCi9YmnoitZ8cGeKrvsS7wSIVj58L6U4
	 AYzwC2LPBSo+y2Zc5+S0LWOj2zMd8I7XiRm+j1UcgzHrON/w7r0s/5LsSUfUh8eQ+a
	 Y5/0W6QpX3uPA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A3FFB378202D;
	Fri, 12 Jan 2024 09:46:39 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 02/15] arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board
Date: Fri, 12 Jan 2024 10:46:19 +0100
Message-ID: <20240112094632.66310-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014641_838116_48CD46E6 
X-CRM114-Status: GOOD (  13.22  )
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

Add an initial devicetree for the Radxa NIO 12L SBC, powered by the
MT8395 Genio 1200 SoC.

This achieves a console boot.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 679dddb09966..cf997191d046 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -76,4 +76,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
new file mode 100644
index 000000000000..2c4d6805b668
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 MediaTek Inc.
+ * Copyright (C) 2024 Collabora Ltd.
+ * Author: Ben Lok <ben.lok@mediatek.com>
+ *	   Macpaul Lin <macpaul.lin@mediatek.com>
+ *         AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include "mt8195.dtsi"
+#include <dt-bindings/pinctrl/mt8195-pinfunc.h>
+
+/ {
+	model = "Radxa NIO 12L";
+	chassis-type = "embedded";
+	compatible = "radxa,nio-12l", "mediatek,mt8395", "mediatek,mt8195";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	firmware {
+		optee {
+			compatible = "linaro,optee-tz";
+			method = "smc";
+		};
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0x1 0x0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/*
+		 * 12 MiB reserved for OP-TEE (BL32)
+		 * +-----------------------+ 0x43e0_0000
+		 * |      SHMEM 2MiB       |
+		 * +-----------------------+ 0x43c0_0000
+		 * |        | TA_RAM  8MiB |
+		 * + TZDRAM +--------------+ 0x4340_0000
+		 * |        | TEE_RAM 2MiB |
+		 * +-----------------------+ 0x4320_0000
+		 */
+		optee_reserved: optee@43200000 {
+			reg = <0 0x43200000 0 0xc00000>;
+			no-map;
+		};
+
+		scp_mem: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+
+		vpu_mem: memory@53000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x53000000 0 0x1400000>; /* 20 MB */
+		};
+
+		/* 2 MiB reserved for ARM Trusted Firmware (BL31) */
+		bl31_secmon_mem: memory@54600000 {
+			reg = <0 0x54600000 0x0 0x200000>;
+			no-map;
+		};
+
+		afe_mem: memory@60000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x60000000 0 0x1100000>;
+			no-map;
+		};
+
+		apu_mem: memory@62000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x62000000 0 0x1400000>; /* 20 MB */
+		};
+	};
+};
+
+&pio {
+	uart0_pins: uart0-pins {
+		pins-bus {
+			pinmux = <PINMUX_GPIO98__FUNC_UTXD0>,
+				 <PINMUX_GPIO99__FUNC_URXD0>;
+		};
+	};
+};
+
+&uart0 {
+	/* Exposed at 40 pin connector */
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.43.0


