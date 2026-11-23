Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4342A606A31F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eNtSwPVP;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xfj6zsAi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=; b=eNtSwPVP5ZzfPu
	H5aXTN9XurB9Soul+1jT3H/oDSMGVounvcEmAhHVEU6RHd0snl96LqFBcU4a0g8r33TLlYy66fime
	6mBVdxJn+tLlyV7XH5dUP0R5XZgIMsEN2UsWd6Ez8EGUe4EE5UaqVMqb2cLISbB0romjZC/TRhD33
	u50C6V/Dc0DFjbVS6vIoFf1OA5VpVtQU3De5uR1fhTF42z3WVCfoilLZhIAO/epH7WvURYoa7QpBZ
	qzLD7ImbWIL/rCsu52pILT/5ndQjPafQizJ4fsL48+Teb9IYatysy3+XDrfNY7pBS342vCOp6GDII
	2u3mEzXnjWHaZu/0b0OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS67-000000037rL-2rKO;
	Mon, 23 Nov 2026 11:20:35 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVS4u-000000036wz-3QSD
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 11:19:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c515369b627so266703066b.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 03:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432758; x=1796037558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=xfj6zsAizAP7QRWFijPPri5i5Au+0PlEsTbTywVkT4C+saZudCeC/GMAfHWfvCFAEb
         zoJ9jhOuHDTNvdWoUK4s0Ai02Xrtgrr8096Wcd/taS83jlk+em4RbRPI13++grjyEans
         WNBgSEnQh2BBf/O3Oup/kB+/uiQxhtbmjlmdXND5mttrhyJrfPjCNDHkM7Au5ttA/1R0
         9jbbbuNZJmEcbXdM/Q3G2qsXt6Ltt0VO0lte9LwDDKHM5vS3gCvA+iNW+ycMs0pCEARe
         pVh5eAbOg6RT40oANXMOQTXCo7eaBVW7b7dhPF1ayMWPHVGUiOSr8uD4YaacK/PJLIlO
         uehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432758; x=1796037558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZTYyCf3yq+FPJgr8Karin0tCSx+qzJ4PS7WFFQlBVEg=;
        b=kMlwYOI29NVIfItssoStVYPYE8edDMlyzYJiAGB11OSpmb28cYqQl0LnYeIHV1X5Vk
         0VVxOgnzlKuCknLeksBxNNMGM0Euw13SGy++g7shEGncXFJDdddnv5CS0E+O2NrTfinm
         hcZJVyzlhX1IAE6UNSTdFpT6StHQFHVYEKW+qf4jKPd8nThDAZ/5UOQA/nRjS+McmHNA
         pB9TT9DZ3reqLYw0jzZLnSgunRLywDBAOv00KWVzTwCdSDBrhcaL+BKDpSd+xtW9KjvF
         ZFBoCmPpQgOKQ6LHZibUaXiYtlANEYj0wYxqQu64mkqQBo4W5ccIehlW1hGT7YAvIbym
         ZDCA==
X-Forwarded-Encrypted: i=1; AL+hErF7cHjL36Wv9vhh23LAJJXmOoe9NM5FFDFwC3gA1IQOUrPdiE+5qn9M6NOY3mJMyXXz9Uf5lZ8um1qJoUxq+A==@lists.infradead.org
X-Gm-Message-State: APuU4Z9btDPq0MbeioKBsTmvN/Zw7MuzTGcBdyIWtMtom0Y1b6bOGMam
	G8lK9rDCz40srPSXGNc6CCK/iOYqFEujTeLC/VgS9uiA0VIyAnq1he/s
X-Gm-Gg: AZFdTZe6m6VL0br5LgbkFtRcfe1INRQr+fVc9L1+0zwiw8pKm92YbH4cJWhq7M3ByGz
	lRxq2a4ncjaIF+nRu/ql6ZtH0kEvXtI7iV9hbdqzsnb7mz8c+Q6qgGTnUepUTh3Sb3UNijMJiNZ
	z5nr3P53BHZIMY0gfLOWof8BIVtGoTGHD80323y0d5eqOQ8CcHLIvcIFXUNDF0wox96UmTpcBpH
	fwWaYII2lYHM1cpRMggh2jwiqi+DsTu9OnWELIrawxM5eEdJaWpNXsw6SFtCJykyhQO/zQV1HoV
	6WlhTuEs87Gwje7RKdxSGlf4o+k9Cpmf61fJc44Wxz63EE5qGQC4LLpXTC2BPKTH/edibM/CZnY
	io52FRGs7xUl+7Z6CJlokiV7cuk03ucu0hPdCpy2cIzF5KdpImqI+kDxc0rxI4uyze7/GVPSRUf
	pDWYCfazLHCMGpAac9TiT1EDG7COmfXpyXeVKwPuw5nUGy72EesZYzH0vnHymREoTD2PDhOspgq
	iDdL2ODAVUPSa+GMxjq+H6dzIvotEPVyOp/wShty5TMZxz5+BpCa1eLgMoq3LStm9FcQEjYg8Dc
	o04gVchk79ZtIpG1K3e2/iYfkpK/TjJ6xwzp/Et5YFtkHNdkJUwlLNgkVsMkrPaB2Q==
X-Received: by 2002:a17:907:1396:b0:c48:a838:c16d with SMTP id a640c23a62f3a-c513ab4925bmr609639066b.30.1795432758535;
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
Received: from [10.120.183.232] ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afc679bsm392442266b.63.2026.11.23.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:19:18 -0800 (PST)
From: Alexander Letuchiy <asalde.le1@gmail.com>
Date: Mon, 23 Nov 2026 14:18:40 +0300
Subject: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
In-Reply-To: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Mattijs Korpershoek <mkorpershoek@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexander Letuchiy <asalde.le1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_031920_936871_40E42256 
X-CRM114-Status: GOOD (  17.52  )
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
index 000000000000..7bfe0d438803
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
+		/* The size will be filled in by the bootloader */
+		reg = <0x0 0x40000000 0 0>;
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
+			console-size = <0x40000>;
+			ftrace-size = <0x10000>;
+			pmsg-size = <0x10000>;
+			record-size = <0x10000>;
+		};
+	};
+};
+
+&keypad {
+	debounce-delay-ms = <32>;
+	keypad,num-columns = <1>;
+	keypad,num-rows = <1>;
+	linux,keymap = <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
+	pinctrl-0 = <&keypad_pins>;
+	pinctrl-names = "default";
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


