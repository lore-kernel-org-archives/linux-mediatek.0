Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93CF606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 12:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kXdyxuf0;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z1rqgCJK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xjrOLeIgU+Jt8huWuao5zS5XaiEWZMlqxSTBKIn4L/k=; b=kXdyxuf0IyVmvX5vt0CCiavxKh
	QBn3xetnZHmcUTIER/SSNVqYEx8xzitQl9dOFzrzTCiSkGivpeVeGNk1ClwVi4baPr4dc6i9JoKyQ
	PPSp1DOunGKpde/i0zpZLoxPANBz/zsXNCTT5M4SCRIUJ0oing1RB5TuHORHdwsAPgr8v0u6DP/2l
	Jm6pJi97u0DElXyveLrpI6n/yGHvZbUNNpelnuiOnmvfab42rO1fTkQYRMi3eJg7QYIWyC225Him2
	xjXaP9XBLLcWBXUcyYgmZJKwXNDWKTnFyh9uLBpFNKXZ+Br1UIBuKZjokZHo6CO9JcMx2xibbl+Vg
	Hmcou9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYnK-0000000DBck-0zDC;
	Thu, 26 Nov 2026 12:41:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYn9-0000000DBGV-1iu7;
	Thu, 26 Nov 2026 12:41:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2D0D245FA5;
	Thu, 26 Nov 2026 12:41:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795696895;
	b=yapFUQs2mMdaIzFV4+u2moU/SINddpzum38bkdbUZScL7i/hzmbYHgA/sKHLQEmpYNmB
	 qiHc79bHRahpq3bqY+mIV2hBQLgP45iRkkqPDYTB9xuMZqWFIp2doVCgX/FhelDa7QmYZ
	 +bXswDfkvi7KLmF3qbWdkXazJD8TS7zCc/iLDcy5NoniF4OW31hG8ygRHlAXBUzaA32jE
	 E1PSTlX9EXxtNXN2YzsePPauMDil+mIZGgiKzYmemCcWflb52S+fWXQzqeXzYjwPwdjkb
	 5IXOZvW5EtiTivxSNzmJXZD4obsAy8nhqO65Od/qhRG3t0vEQ4JPkKQBduhRrvItGgQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795696895;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xjrOLeIgU+Jt8huWuao5zS5XaiEWZMlqxSTBKIn4L/k=;
	b=mGAlX/QvIlKiURH9kpwkIb3xgFKBKQRdlORoPIr0L+hD+SCX0lMlVqL1f1bTcXPiJ5hZ
	 6yvWNsC39MozAEPn3H+F9pLJ/j4MJxTFsS876JKY0ln7EPGrJFjdvEzFw2sxrtjW+RpUm
	 5vECCT0QMwisXfiWS43x1bMCuSniX+Qb/CW9nSQX4//hEyYyzQve+g1znjN9ismwsRJPr
	 3FgsqN7/NniKPORmB8rvjlMz3BYTIY3VGCXdpqMz4CT9ELy0lulFxMhHUcSRhw47rEBCi
	 PINdQ9Z46mjTA6hOoggVYsfvgSUdDpnNgMLoNqmnWYWscWsO89C5T/jjYaGaV4DAHWQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28CD81F00A01;
	Thu, 26 Nov 2026 12:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696895;
	bh=xjrOLeIgU+Jt8huWuao5zS5XaiEWZMlqxSTBKIn4L/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Z1rqgCJKhpKFRG2/1td8a55lngW/RECx61TqKt/qEhRhZqHPgl7AAC6bw8Iz4RXHh
	 U6wMtEC4zkRj3wjAhl9qI2qLTcaBZO6B5mWCzLmf6QEFFWVJQpZPsLjA/OtukSU3FN
	 NoEchxn3jUsAHB+Wv/ORMWM8qSLgKctWJHOd6HMpn0e9g72MIPsxRcPYNiDarYJ5o9
	 LK2CQHi2YZj3ivElYUzUaIF+sui7QOBLQUrBIe4PtDpJozIOllS6PNCL6LPQYoWoHg
	 JADj85zRHAwbICJMox41IKtNeNXDhyE8nEtzeMHOH0GakwhW6KOGUcmbngNQaOQlZj
	 pgOrXT9dwl34w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B2584D4E4;
	Thu, 26 Nov 2026 12:41:17 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:40:01 +0200
Subject: [PATCH 8/8] arm64: dts: mediatek: mt6768: add Xiaomi Redmi Note 9
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-6768-init-v1-8-abc364a2447e@protonmail.com>
References: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
In-Reply-To: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795696875; l=2173;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=ZShCzvXiUl5hDnYMk19Pl4AsLIEnkMmW90NbhX636XU=;
 b=ViSO2Xd7qbcrP7tQ7Atr+iYYMlaWMHJsqTCykJzxr0uCF8iTh/kzta/JBbCKByfGXu/q+i76N
 xu7CAp2Bv25AX3wx/KMpUMiLnMgY9UoN/v3UswcgIon89zN6d1xOCN9
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Xiaomi Redmi Note 9 is a budget phone released in 2020. It features up to
6 GB of LPDDR4X memory and 128 GB eMMC, powered by the MediaTek Helio G85
SoC.

Add initial devicetree support for this device. It can currently boot to
a UART shell and use the simple-framebuffer provided by U-Boot for
display output.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm64/boot/dts/mediatek/Makefile              |  1 +
 .../boot/dts/mediatek/mt6768-xiaomi-merlin.dts     | 42 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a86fb313b1a9..4fe50c95321f 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6768-xiaomi-merlin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-sony-xperia-m5.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6768-xiaomi-merlin.dts b/arch/arm64/boot/dts/mediatek/mt6768-xiaomi-merlin.dts
new file mode 100644
index 000000000000..f95bac31caf3
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6768-xiaomi-merlin.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2025-2026 Roman Vivchar <rva333@protonmail.com>
+ */
+
+/dts-v1/;
+#include "mt6768.dtsi"
+
+/ {
+	model = "Xiaomi Redmi Note 9";
+	compatible = "xiaomi,merlin", "mediatek,mt6768";
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
+		reg = <0 0x40000000 0 0>;
+	};
+
+	reserved-memory {
+		ranges;
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		/* 384 KiB reserved for ARM Trusted Firmware */
+		secmon@4ce00000 {
+			reg = <0 0x4ce00000 0 0x60000>;
+			no-map;
+		};
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.56.1



