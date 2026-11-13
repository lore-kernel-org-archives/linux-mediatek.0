Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D174060A6F74
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 19:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QgVGr4Ha;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DxiFU5D0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=; b=QgVGr4Hac+3J2o
	SL1NJVWK9RQllTksI+hzGJYBHv5Yyfw+0JeejzcFwWMV7LoZ+XIwxdYcHvhJDmvcN1/T8DMBEh8LZ
	DKM+DjOcLwRFpOHaTns0NutbdtvJL6QV3xhICwmVvD13ZkhXI/hwsMgW7fLfsa7muZPvLEyBfoHoP
	8VmyNJv6is3OSyG16U0e75AuGEdI/2LSzV6ztPLlnhYGScyQUgHlGcRHDxNxoDU6mJfP7mgLhsSMX
	q9LfZWrVxDPYK7mBkMfZPxgqBCMm/Uqts0HttqiS/HJzSOacPTdkoMuhhLHTfrTUvk47bNxgec5l1
	3pV1UcR6MXMpqE2sXodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwdk-0000000E6SH-2Bdl;
	Fri, 13 Nov 2026 19:08:48 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwd7-0000000E5xc-1PB5
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Nov 2026 19:08:17 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c50a4a2132cso177909466b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Nov 2026 11:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794596888; x=1795201688; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=;
        b=DxiFU5D0ikMi9POe4QRM8bAu5zzA6nVKikpeFBFWPRhmLBgtmNLo4GR+S4BvCwHns8
         gJuuyMDqKh8TqMUQ5mdzIoflJYISaQ9k3wfto7/LcR3cBQbm6KZ8T1oGrArcy4Ip4iPs
         w7del8y+yWVH4+WesnLm4hF+FRrvXWGo/h/sQPjy7nKEhTWsJiutLldVphKI+CPAzDth
         IoqS1pwNKTTTsCA34mWxlbqWLdCOega3x3oCOt80lMldp0HKLu/35XOyGyyBaWF2a1WS
         uRZBTwoIho1kbsAJdQkdSMs4k7X9O672bLD2YjDsnhRd7eNmdjJFHzE6nz5HMAUZXUNH
         mBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596888; x=1795201688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbvwDyU+Acc05Vuh8BWsHE5JqO4e+EP9kLEpKSKS7JE=;
        b=nSNX0yXdYmWmz45c6BUjC1lvLA4XmtBbYjPzNSjGBt/gZhzacWFU+wEYxORdFLkG/F
         8TOxh60vXOPtIR2hG3rclmrLtNwt8J3OrrGNApwnpoT3mRPDCKWVAGObJx4OqmRIm0qi
         nGbgKzH9wrcYHVMm/kXjXpKCX0c8/n2MWCJ96MUqd/yaTTytbYMOvWbmmT/u86IJEm82
         Ku0p6MbQhSdNrtzUEI4rPWhva9fmLq9h9/nRgxqtGtpTcn9G+XRstGG6mk/6vKG20W2f
         gkCsyA/ZBKwlTGw5t8nnTDO9tFK0lrpUT281F9zQUSpWwHcKLMpoGIah9fq/sQR30IFu
         LdVw==
X-Forwarded-Encrypted: i=1; AL+hErFktIj4ZKHdrsANu2GvrTGL7+gQSExolp+HFFxZoSAdI3/BgUzfGn9C95Bo6xDwK02PLqGIWTE5sVraIeFDRw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/uX3H0IamXf+fwdfIxWcBOFnmPX/5p1Tc3vbgG0FItidBbhQmw
	H96lUcTzws/h9czcIRLjmnA4oI9nL7Fle1dkOA4N+rBpktepGwwroi9b
X-Gm-Gg: AYBFou2PA8shwmDnAJercgSlxM9dUGqLCKym+uPVVWEEprkbW0f7cYY81ewKgXAPZre
	pRnqNxbVUs/nOO5QyalijW1JH9e7WU2jvpvpdinQbVpb/NNc7tohCE0pysbqrNaHPBeWYO0boSK
	wbqrX0D1tslwfRbt20SQn9Nrwh15Y3lrHSL93btxDNSyalWbfLw1OfI4/LPLPKg03Ae8H+RbgVC
	/kQOXzKFCH38QV0iozEYdT26B3FXT5qdN9wWo2u16G7LpWP3IYO6z+dJK1osOi16O/ICfx2h59K
	8FkdKd+q75OzAAIXsVoB0+RuQRbtT9Sq/HjxS7nRra5ngQnQ+asOaGVhHo5hxgdto/0qbyYeXhC
	TkY600cG9f+Bgb8E+/MphcWHWmK6cUL9ydHtNPc2p5ZkjW88F3Jp9rwCe/pUHjFrs/26XemFi/t
	OR5B4OV0NR9QQ5lLQOYW+pRi1dVeX887sGugS575sw8qvfuxdKygFtJds5s6iGb5vi3CzsG9ZSu
	oqt2P3HB/Lw3WTkFPEOjOz3691sRbQw3yYtHbPuqbWEi0pgUozY327WAzczbOmN6yogAl1MQjHN
	o+2V2gitrowyfgefAB9gcvVCCIMlwWV+1x7qkb80eZC8u2GHrJr78P0IHTgEY5Ox
X-Received: by 2002:a17:907:8687:b0:c46:7645:86c with SMTP id a640c23a62f3a-c509641d1eamr287876866b.47.1794596887578;
        Fri, 13 Nov 2026 11:08:07 -0800 (PST)
Received: from [192.168.1.100] ([163.245.50.16])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b23b09sm129444166b.26.2026.11.13.11.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 11:08:07 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Fri, 13 Nov 2026 22:05:05 +0300
Subject: [PATCH v2 9/9] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-initial-mt6895-v2-9-4ab0aa9fa391@gmail.com>
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
In-Reply-To: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org, 
 Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_110812_235435_89B15A26 
X-CRM114-Status: GOOD (  17.49  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
console on UART0 and the volume down key on the SoC keypad. The power
and volume up keys are connected to the MT6363 PMIC, which isn't
supported yet.

The DT only describes the memory that Linux itself uses, which is the
ramoops region. The bootloader updates the /memory node and adds the
firmware carveouts to /reserved-memory, so their addresses are not
hardcoded here. This DT must not be booted with a bootloader that does
not do this, as Linux would then use memory owned by the firmware.

The ramoops zone sizes place the console zone at the offset where the
bootloader expects to find it.

Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 ++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..d73489149ab5 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6895-xiaomi-xaga.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7981b-cudy-wr3000-v1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
new file mode 100644
index 000000000000..8d529062eea1
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/input/input.h>
+
+#include "mt6895.dtsi"
+
+/ {
+	model = "Xiaomi Poco X4 GT";
+	compatible = "xiaomi,xaga", "mediatek,mt6895";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		/* The size is updated by the bootloader. */
+		reg = <0x0 0x40000000 0x2 0x0>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* The firmware carveouts are added by the bootloader. */
+
+		ramoops@48090000 {
+			compatible = "ramoops";
+			reg = <0 0x48090000 0 0xe0000>;
+			no-map;
+			record-size = <0x10000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+		};
+	};
+};
+
+&keypad {
+	pinctrl-0 = <&keypad_pins>;
+	pinctrl-names = "default";
+	debounce-delay-ms = <32>;
+	keypad,num-columns = <1>;
+	keypad,num-rows = <1>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
+
+	status = "okay";
+};
+
+&pio {
+	keypad_pins: keypad-pins {
+		pins-col {
+			pinmux = <PINMUX_GPIO107__FUNC_KPCOL0>;
+			bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
+			input-enable;
+		};
+	};
+
+	uart0_pins: uart0-pins {
+		pins-rx {
+			pinmux = <PINMUX_GPIO88__FUNC_URXD0>;
+			bias-pull-up;
+			input-enable;
+		};
+
+		pins-tx {
+			pinmux = <PINMUX_GPIO89__FUNC_UTXD0>;
+		};
+	};
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};

-- 
2.56.0


