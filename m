Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594C2C47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 08:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuVCFtuO0yf5CMGsIkM1BwRpROvgF5wfnsTa+xBxY70=; b=XxUX9F3qLY0nSUY0ieVV7lf3kZ
	66A8aTMmxlTXnNZgWa+/UCqPTG9WxBwI57qTx+YJ2Ej+edH4igJHWCjlsswQBR36eT6q5f9M/BzWQ
	xxWm634t2WmocsNtDJp8r3ge1LZua9x4v2olfXsps5kSnoffim6EEi9fUfsvV2+BhIIYn0W29jdDg
	jBUkbF2RXDagNKG66WNd/98BXhly+I99jv3csHAiQq76m2kQSLtj37omoOCbukyoH3UZBbSjkdokp
	T1r+akVI4PZQOzqaClGxEUY2Wos2oXshQgNh7YnpT8Uhr3uHW48zaU1Tej2Kz+y1VxfQS1DJ7uso6
	lS9ahHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjw-00000003T5q-2rO2;
	Fri, 26 Jan 2024 08:39:08 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTHjO-00000003SmT-10ix
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 08:38:36 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d720c7fc04so688345ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jan 2024 00:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706258313; x=1706863113; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yuVCFtuO0yf5CMGsIkM1BwRpROvgF5wfnsTa+xBxY70=;
        b=fybvTeqBydTMXgin8pwsPvCkMIfcTXVnyWrgdd3Zj2zY6fBvWxdQ+DVK3uyC/+z3+J
         qTYhvYn3mBRnkdonhAwg36UIHKbn7PIwyNjxxpAnb6H/MEBuuAn6W13SdH88nJo63yup
         hlK43gYJy4ntNgsdbHwrfsAbvtkaA4rszSDAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706258313; x=1706863113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yuVCFtuO0yf5CMGsIkM1BwRpROvgF5wfnsTa+xBxY70=;
        b=kqhuCFziJ6g8x9ZIL40oTm3TMGfxA7hisClmdwUV/GDi/splLWiBzUp0xrSu9la/bT
         6nPet5sJyvZiV+u/xqUh0asW1JQLSulYhc13PNDxtjev1tGsckmBcEBuYhaVLRd5Pk5l
         QT/gGN69U+HyETH/8b7fWqUCfGmW62MvBoMsk7/JnLAiIZRYAuk+j97vDAwQZfF1bG6t
         ObK7Mr8vGuw7XwOOnfeJnwh7TOKx1zTE8Sp1UPBf4fYUrQo0voXNDvrTmsDpYzx8uopY
         l2i80Rd5luQ6amL3dppZAyu7uKEEMxEbf9ZI2G6JebXDHns0wM3d7fLTDy/MqfwGonL3
         CbHQ==
X-Gm-Message-State: AOJu0Ywlm19q87h9I1MWuJvyRRQnjdPR56cGcy2NBlRaypq3kJVLIL5x
	FuyPnH1Z0VmlDgZ9BbtpWW4todXuWOC5xbWxeckjm0mSCpz01zIm+AgfNfa8vQ==
X-Google-Smtp-Source: AGHT+IHSrPFiqGFADJBK++rSPTXc06dRJ9o2+Xh7a7ojGdGkkH+Y1KunO8QhaDk4aD58k+tm0JVFMw==
X-Received: by 2002:a17:903:546:b0:1d5:13b0:cf19 with SMTP id jo6-20020a170903054600b001d513b0cf19mr782904plb.63.1706258313640;
        Fri, 26 Jan 2024 00:38:33 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2614:bbbd:8db2:1f54])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902a9c200b001d6ff1795aesm589529plr.8.2024.01.26.00.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 00:38:33 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 8/9] arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
Date: Fri, 26 Jan 2024 16:37:57 +0800
Message-ID: <20240126083802.2728610-9-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240126083802.2728610-1-wenst@chromium.org>
References: <20240126083802.2728610-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_003834_510315_66375255 
X-CRM114-Status: GOOD (  14.35  )
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

MT8186 Rusty, otherwise known as the Lenovo 100e Chromebook Gen 4, is an
MT8186 based laptop. It is based on the "Steelix" design. Being a laptop
instead of a convertible device, there is no touchscreen or stylus.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
Changes since v4:
none

Changes since v3:
- Collected reviewed-by from Angelo

Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
- Mark missing components as disabled instead of deleting the node
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mt8186-corsola-rusty-sku196608.dts        | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 0daa1ad27c22..48327471de12 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -51,6 +51,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-rusty-sku196608.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131072.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-steelix-sku131073.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-corsola-tentacool-sku327681.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts b/arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts
new file mode 100644
index 000000000000..731b0d60228d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2022 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8186-corsola-steelix.dtsi"
+
+/ {
+	model = "Google Rusty board";
+	compatible = "google,steelix-sku196609", "google,steelix-sku196608",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+&gpio_keys {
+	status = "disabled";
+};
+
+&i2c1 {
+	status = "disabled";
+};
+
+&touchscreen {
+	status = "disabled";
+};
-- 
2.43.0.429.g432eaa2c6b-goog


