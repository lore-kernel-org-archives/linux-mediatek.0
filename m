Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD59C369D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 10:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlwv3tgoeUy6P2c2ThKyW3Vg1sKyoas8gJ12eZIqlpo=; b=Mk1goskGbD4AdCIKElGH1Ghzx8
	DFDlgH2ed6th3b8w/NLHX7kRdfe9QC3pfW0gpz39Rbe1ldZTQsNyXfadPEvOmMhiCf0XMpxhFFd47
	UZ2CaaCSp5lubf791LdwsX1ukW5Buz/40/UCVGllf7oS6TMJO1L6m4dS2y7TNwByMELboohmtVr3k
	+X/B+asG0fizgYOuLuhrGeIEHm2O9FnL/1K1LbZ0k3eUU/TZKSFTslviyXPnok3UHyTJZr5FGCfXd
	Xc3GrqzkhtOXN6LfBGLqIygqtVGLfRnkcW//IUqceYRVzd2OsCa7RZlU5X995USX4F1oKzYvo2tre
	0NwD59lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XUR-0000000ACMn-1JWH;
	Wed, 23 Apr 2025 10:38:03 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WXP-00000009zu7-2AmW
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 09:37:04 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-aee773df955so646829a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 02:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1745401023; x=1746005823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xlwv3tgoeUy6P2c2ThKyW3Vg1sKyoas8gJ12eZIqlpo=;
        b=XXLo8Gv1BpD8kd9Y/eDQLakz5uD8udmsLpNw9GnLAkrxCVzSFgjf6b8m/DJtU7QFbd
         CFPaMGtEnH+SfDvWbmVOMN40X7w9V/ThO8d7ZqxG1yYdtg77JarBGcrxEEeTY+CI3+ZQ
         uKLusl5mSolLWppDnQkoz3uShf1N88X/nK1oUGO+bc/T0tDmhmqEThvK+MOGgJmtLJvF
         pkkIO8JHKZ847t1qHDCQHqC36Y5I+Ce6nCyYveRghLiERhBBlVZ6oRrHUMml1ThTbe38
         4k+fjaJGRIrvPMh5NqKFCntWVsvS2mp5E8wdn/s/Q/09N2Pr1Jd8SDGi98hGvxFCnT+p
         JwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745401023; x=1746005823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xlwv3tgoeUy6P2c2ThKyW3Vg1sKyoas8gJ12eZIqlpo=;
        b=XPL6D+zU7yPJAXou9P3kGdpHZl0e9uw77hp73hrO8USgx/WVA82/xSyDxOVmBJuS9k
         EbGD7CMTVZdMlVWB/dzE1MSxshPYzRjSle8ZXVQHqSNq6uVwj/sTCngcUiu0elIYiKsc
         foUQepPXajCZs57NjyQbsZj2AHP4bXpeCm6HjQGEMTlKEtW3aTendpJegiziS/4KE+Jt
         ddGL4oK8Xb0V7+qlzJ16YzsFn/IKpY3ZSVvkL7aquMmoOLM4w3krK9r5+Nebl7uUYq9/
         MS23bqFchL5NbzBjQ8JUP1JbmbgqucYkQUupmDW4hGBnG+0Vax5xWUG8g7i+QbFAjDdO
         wlrg==
X-Forwarded-Encrypted: i=1; AJvYcCXgymVVg7eU9lC/O+QHJH+kpNXf5CNwm2x08jenBWVEmxXdxmHmRASJ9j2FwFL/Q50g5X67RLh+gOvxEgHUQg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Jic56BvUobjQ84SFIN/Dy7bzBei7NPMlIEkIxlC5U9K1jgPd
	L7OSjKPvx2jEyYlATio/SesiPhk/un57wS61BOm1otiN+p4ZLSoyvIh9ahDfdEg=
X-Gm-Gg: ASbGncuwRxjdwYWXjGQxBQ3MfQbNTudKl0nJW9Hip180adSSIKjdMVmOIKs5QjBjyQO
	/gEzsm1iu2P4SyrJVq+17D85gmLjGm0tSwkwbp/x4l06XcLDVRPJsy421TOQyPu4gbTcEhaAv7u
	9GTPC+4xI3TnhstpaeQ4OU9MtHZUwcQvekO7EgQy167jM40uQmZ39fcC8cUYmWoCdVIqEP4ijaT
	/9G30GHkVp40gEGSBh+yP5c5EiPI2ozIfupQhkE3esBwePr1y+yHJPiaSFQIfLO0Sahrh4dSUTc
	LK/tqx7IX7e8Xcxp1E+TcRDhON/z7YWj2C0Asomdj35gr/smp1Z56jriEdo4KZBkrDzikhK0+OQ
	=
X-Google-Smtp-Source: AGHT+IGQ8xlsW4d+eBJ+oGBBq5d/ZFuItOWl7SCRrXOODg2nfq78c93h7SZdNc8Yj5tHMPnuXvvGnw==
X-Received: by 2002:a17:902:dac7:b0:21f:98fc:8414 with SMTP id d9443c01a7336-22da3387b8dmr31122275ad.26.1745401022942;
        Wed, 23 Apr 2025 02:37:02 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ecec54sm99557885ad.168.2025.04.23.02.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 02:37:02 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v10 2/2] arm64: dts: mediatek: Add MT8186 Ponyta Chromebooks
Date: Wed, 23 Apr 2025 17:36:47 +0800
Message-Id: <20250423093647.4074135-3-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_023703_556111_1B0DCD18 
X-CRM114-Status: GOOD (  14.92  )
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

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Changes in v10:
- No change.

Changes in v9:
- PATCH 2/2: Add sound model to fix the warning.
- Link to v8:https://lore.kernel.org/all/20240914063122.1622196-3-cengjianeng@huaqin.corp-partner.google.com/

Changes in v8:
- PATCH 2/2: Change the commit about ponyta.
- Link to v7:https://lore.kernel.org/all/20240913031505.372868-3-cengjianeng@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 2/2: Remove prototype sku.
- PATCH 2/2: Disable the other trackpad to enable one of them.
- Link to v5:https://lore.kernel.org/all/20240909023148.1677936-3-cengjianeng@huaqin.corp-partner.google.com/

Changes in v6:
- No change.

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
 .../mediatek/mt8186-corsola-ponyta-sku0.dts   | 18 +++++++
 .../mediatek/mt8186-corsola-ponyta-sku1.dts   | 22 +++++++++
 .../dts/mediatek/mt8186-corsola-ponyta.dtsi   | 49 +++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 58484e830063..3aa06476c6c0 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -64,6 +64,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-chinchou-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393216.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393217.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-magneton-sku393218.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-ponyta-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-starmie-sku1.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
new file mode 100644
index 000000000000..986498af4c70
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku0.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-ponyta.dtsi"
+
+/ {
+	model = "Google Ponyta sku0 board";
+	compatible = "google,ponyta-sku0", "google,ponyta", "mediatek,mt8186";
+};
+
+&i2c2 {
+	trackpad@15 {
+		status = "disabled";
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
new file mode 100644
index 000000000000..ff5eea0ddeb4
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta-sku1.dts
@@ -0,0 +1,22 @@
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
+	trackpad@2c {
+		status = "disabled";
+	};
+};
+
+&usb_c1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
new file mode 100644
index 000000000000..0abf69077089
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-ponyta.dtsi
@@ -0,0 +1,49 @@
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
+
+&sound {
+	model = "mt8186_rt1019_rt5682s";
+};
+
-- 
2.34.1


