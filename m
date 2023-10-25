Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD09FC25B6F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IgVE8V9oNi3xdvVjdEsgsiDw/vZuxOARiQ1okfqOrw=; b=CmzrDqD7cfAfFjeGJX9BAxp9Ni
	QigUxpLxphCgaBVkytkkSPqslhRNcG01ChwPG/XnadhYlIO11B5+ZflZayJmGabK8YGHp/WgRUb7t
	9yQgdtnYUamxwWFq0qt3sWdGWFaaI8OHA8umQwdOcwE61G9MbOysSLTNjMxojVunODJqC0PQLKP6y
	Nsl6P6DI7k1F9YCbGAUvoC4cMacgQ+RJnZfzPNJdYjpzgqdc1If7cb7DR0E7AJWdZHGMudEcuxuU9
	A0zlnW0FTukGhKWadovhQNi29oGst0GDDApYFeh8VPNxYcDjij9Tz9EVc+sRzcO4NrsCWfYKNxFT9
	fcfX0WnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqj-00DCqk-1x;
	Wed, 25 Oct 2023 21:55:37 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqd-00DCk2-2a
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 21:55:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c9e06f058bso10596135ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698270930; x=1698875730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+IgVE8V9oNi3xdvVjdEsgsiDw/vZuxOARiQ1okfqOrw=;
        b=PH2PD2yjjDMsbtxGLh9492gf1drYx0XZWSfwvdYsm6IVykuFafvNraaursrnLNNEy9
         +cI4XeNX97XXbPihYu7AK+SatzuR7lhBPfrTjvbn183G9FI/rvwvSiX4dqtosPDYli0h
         HO3ksrO7wlzqzriSr+IgouiEEp4pLDo/jvsa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270930; x=1698875730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+IgVE8V9oNi3xdvVjdEsgsiDw/vZuxOARiQ1okfqOrw=;
        b=tYCQu+EVGCpoLFnrtmYrSPWqqtVLe1N3xY3B6N0wPIqHfvruI/BuZeoeWItA59hGl7
         wzfR+Cq7y98+SrdL7Gwy1LFJxgR//mnResRs14iUQiMGWxU0q5OQeZ+04IADf2QJEmpq
         hmiB1b6qEn7yzLLrXUbo+mK9/dboFR9E3w5ZbmQz69n8Y+klEAEVahzPNJw7cWBI/pOz
         /oyr3lMMkernLffhm9fGSP5AiA6UmwdMqYfUDxhwAf/JFlr+1RPD7Al1NHmY+b+J1Oi7
         PSrdFBoo+GGSHGEsmEJOvIzI8zKgTPX9Khqu9DUxPs01zyCzekOICTY0tHv26tYjWPKO
         t61g==
X-Gm-Message-State: AOJu0YxacMFJtWvtivGREQEWtOn+xVNI3H998c8/z/qj2RTBj+RgOf3+
	QFgygo7/KN8Rj3hIxvkHCKlceA==
X-Google-Smtp-Source: AGHT+IGUky5MAfWp0SdV4lIAc4jZ2Ju3Zv19iKd2KnR9lPNqET2bmN33HonqYPNWIe5rKnsF73LnvA==
X-Received: by 2002:a17:90b:4a8e:b0:27d:5a7:3960 with SMTP id lp14-20020a17090b4a8e00b0027d05a73960mr1023181pjb.21.1698270929845;
        Wed, 25 Oct 2023 14:55:29 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id w14-20020a63160e000000b005b8ebef9fa0sm2994943pgl.83.2023.10.25.14.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:55:29 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 5/7] arm64: dts: mt8183: Add jacuzzi makomo board
Date: Wed, 25 Oct 2023 14:48:47 -0700
Message-ID: <20231025215517.1388735-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231025215517.1388735-1-hsinyi@chromium.org>
References: <20231025215517.1388735-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_145531_841256_5D9DCF89 
X-CRM114-Status: GOOD (  14.57  )
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

makomo is also known as Lenovo 100e Chromebook 2nd Gen MTK 2.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2->v3: remove rev since match on sku is sufficient.
---
 arch/arm64/boot/dts/mediatek/Makefile         |  2 ++
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      | 24 +++++++++++++++++++
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      | 24 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a13419e67e8e..1b85a8c12850 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -32,6 +32,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-fennel14-sku2.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku0.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-makomo-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
new file mode 100644
index 000000000000..4eb2a0d571af
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-da7219-rt1015p.dtsi"
+
+/ {
+	model = "Google makomo sku0 board";
+	chassis-type = "laptop";
+	compatible = "google,makomo-sku0", "google,makomo", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
new file mode 100644
index 000000000000..6a733361e8ae
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2023 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-fennel.dtsi"
+#include "mt8183-kukui-audio-ts3a227e-rt1015p.dtsi"
+
+/ {
+	model = "Google makomo sku1 board";
+	chassis-type = "laptop";
+	compatible = "google,makomo-sku1", "google,makomo", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
+
+&mmc1_pins_uhs {
+	pins-clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
-- 
2.42.0.758.gaed0368e0e-goog


