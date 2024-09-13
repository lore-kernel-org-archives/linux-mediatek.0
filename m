Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859CEEED600
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 01:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPvN3QrjGq02f86hZYf9aco+Usfx+kruEilYioxOFMk=; b=QQYplKFzD7nm7nP3e18oLE6ae2
	X2KQnQ9ndEmoTgMr7jzvMRAwT0RRdboQ02syl6lLFnNmVQzBzctgkI1KJ2aVnilQfnemSvqHFQYtm
	FxUpYsVp+7MGGeMgqq4Ribw64YFpcKFVry79N+WoP9ORbO34q6Z5XxkMIFi/agqOzE+3QHPCHInsO
	P4tNUm3wwxk6T6poweOMXDgz+JGUa73suKnjt3e9YrK4yYix3kiUEA7931D+HqrsXN9GibWUQn4Kj
	3JMte/HajOs1TYiVCSiDd9ElnEkm2dB5ii5emj77tROe/EOcodk6eReweJmQ61kPGq/ndhkGgS4/+
	CcXBB0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovX0-0000000Eh9g-3ve6;
	Fri, 13 Sep 2024 01:55:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sovWv-0000000Eh4k-3KxG
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 01:55:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fc47abc040so14906535ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Sep 2024 18:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1726192525; x=1726797325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPvN3QrjGq02f86hZYf9aco+Usfx+kruEilYioxOFMk=;
        b=Phq/toDlZWoQybCmtw+NRdcY2rXzRaBtGS0ByzECLu9uExNnRCQFrGX7HkWNy5OTh8
         zq7kc/wWJJgca2zNIBesWvO9QEDhP0wJ1EGvzOzviH1me3khCHH/JZ7xjboxqw9IEr4l
         DHxmk2fuFlcmTJAbqADBTJbOQD0b/Vl5fJVOYJ+g8QFiUaqGeOpSlvZh30+aGKTcywd8
         WbGc5c46cLPPCXpDjS/vtcWzaEXsxGKxWpeUx6b9snTLyrBGJh7g3waoDp883ifKraHc
         SGKOAF86FbQ3o2au0hFCrtym+qv2gqD4mxMtjstA2simeQ3YdacpgbcVU/7RafUirSjk
         Xdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726192525; x=1726797325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RPvN3QrjGq02f86hZYf9aco+Usfx+kruEilYioxOFMk=;
        b=rGOD3rqhLE+CKZYBFvSqpsRbF9oHG1i9/MUWnSnh3pyLJVx6F+l9mIdB+KJw+LX4Ul
         kDroCTqBLuhdlDKVqzexs4mi3WBPp8Pr4/KkZ82yXzNBo6VK/Iffga4b4J7iZqdwfE1B
         aXUqNMzToNNQI/1X9dhcPQVk0lTJ0LRw678Atmz4efR+xRbW2DxlKGu8cJFE9d0FKU4i
         siXPz/cnK0PSZF6iNPTpKMlfuubJTE1JR8drFfaJtizSHOk1n5b3iF+bmsY9BX49Jjrm
         DxHpPecrY1bmW6rPueQOToEgB9gbmq0xxB0XlmS4B5POelFlZ0ggPwTls8+dc5iysyDa
         ZeKg==
X-Forwarded-Encrypted: i=1; AJvYcCW8WP59gQavfrvO7+ZM0j18vyQ5M+J451rAmNJhMJbhx2xXcS1idPjF3h8A/KEkFujY0Hp94mbJcBMxW3xoSw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEMJqaWW4y2ZGRZF4tq5cdG75KfkRZs8029oHc1DQ1yZ6SImlW
	ehooLj5LkwHH4k1G0wcC0599cU0dgL/cVKwsjK3CkST+iJp0PUw/kjYyejTXix8=
X-Google-Smtp-Source: AGHT+IHXk0XxSwev03jWrdCcxnbXBoYWIX5zOUw0pJsgtf/v83w1Mu5mNXdVgLktnksUG8khkgSYAQ==
X-Received: by 2002:a17:902:e5d1:b0:205:5f36:ffb1 with SMTP id d9443c01a7336-2076e412909mr58310905ad.37.1726192525022;
        Thu, 12 Sep 2024 18:55:25 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076af49210sm19896605ad.99.2024.09.12.18.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 18:55:24 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com,
	hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v6 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
Date: Fri, 13 Sep 2024 09:55:03 +0800
Message-Id: <20240913015503.4192806-3-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20240913015503.4192806-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_185525_925264_8D29EC20 
X-CRM114-Status: GOOD (  14.22  )
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

MT8186 ponyta, known as huaqin custom label, is a
MT8186 based laptop. It is based on the "corsola" design.
It includes LTE, touchpad combinations.

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v6:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240909023148.1677936-3-cengjianeng@huaqin.corp-partner.google.com/

Changes in v5:
- PATCH 2/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-3-cengjianeng@huaqin.corp-partner.google.com/

Chage since v3:
- No change.

Changes in v2:
- PATCH 2/2: Modify the dtb name without rev2.
- Link to v1:https://lore.kernel.org/all/20240902125502.1844374-1-cengjianeng@huaqin.corp-partner.google.com/

---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 +
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 23 ++++++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 27 ++++++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 44 +++++++++++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 8fd7b2bb7a15..50b5cf04d3ae 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -58,6 +58,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
new file mode 100644
index 000000000000..f6448e91436a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-ponyta.dtsi"
+
+/ {
+	model = "Google Ponyta sku0/unprovisioned board";
+	compatible = "google,ponyta-sku0", "google,ponyta", "mediatek,mt8186";
+};
+
+&i2c2 {
+	touchpad@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
+		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&pp3300_s3>;
+		wakeup-source;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
new file mode 100644
index 000000000000..203ee109bbf7
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-ponyta.dtsi"
+
+/ {
+	model = "Google Ponyta sku1 board";
+	compatible = "google,ponyta-sku1", "google,ponyta", "mediatek,mt8186";
+};
+
+&i2c2 {
+	touchpad@15 {
+		compatible = "elan,ekth3000";
+		reg = <0x15>;
+		interrupt-parent = <&pio>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&pp3300_s3>;
+		wakeup-source;
+	};
+};
+
+&usb_c1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
new file mode 100644
index 000000000000..59594022331e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+&keyboard_controller {
+	function-row-physmap = <
+		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
+		MATRIX_KEY(0x03, 0x02, 0)	/* T2 */
+		MATRIX_KEY(0x02, 0x02, 0)	/* T3 */
+		MATRIX_KEY(0x01, 0x02, 0)	/* T4 */
+		MATRIX_KEY(0x03, 0x04, 0)	/* T5 */
+		MATRIX_KEY(0x02, 0x04, 0)	/* T6 */
+		MATRIX_KEY(0x01, 0x04, 0)	/* T7 */
+		MATRIX_KEY(0x00, 0x04, 0)	/* T8 */
+		MATRIX_KEY(0x00, 0x01, 0)	/* T9 */
+		MATRIX_KEY(0x02, 0x09, 0)	/* T10 */
+		MATRIX_KEY(0x01, 0x09, 0)	/* T11 */
+		MATRIX_KEY(0x01, 0x05, 0)	/* T12 */
+	>;
+
+	linux,keymap = <
+		CROS_STD_MAIN_KEYMAP
+		MATRIX_KEY(0x00, 0x02, KEY_BACK)
+		MATRIX_KEY(0x03, 0x02, KEY_REFRESH)
+		MATRIX_KEY(0x02, 0x02, KEY_ZOOM)
+		MATRIX_KEY(0x01, 0x02, KEY_SCALE)
+		MATRIX_KEY(0x03, 0x04, KEY_SYSRQ)
+		MATRIX_KEY(0x02, 0x04, KEY_BRIGHTNESSDOWN)
+		MATRIX_KEY(0x01, 0x04, KEY_BRIGHTNESSUP)
+		MATRIX_KEY(0x00, 0x04, KEY_PLAYPAUSE)
+		MATRIX_KEY(0x00, 0x01, KEY_MICMUTE)
+		MATRIX_KEY(0x02, 0x09, KEY_MUTE)
+		MATRIX_KEY(0x01, 0x09, KEY_VOLUMEDOWN)
+		MATRIX_KEY(0x01, 0x05, KEY_VOLUMEUP)
+	>;
+};
+
+&mt6366codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
-- 
2.34.1


