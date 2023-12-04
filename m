Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B757AC10DC1
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 08:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ljd2T3j+VnPx33d4ekX7y2D1w1JW97BW4rSuy9Dt1c=; b=MCJb/X/ZU+85FN+9GivUp4Ri90
	BQekJCqKtSNKMrlVDADw2hsqrlaHoTLwmO5ep1IDFEUQp7xetlkM+PiXPCRD3VfoChf5tEQNrbwSy
	xC97M3YFp9HXlUzmohOgD8hZGMqp/MNlB1qOO7EanDNzFpWmu1XX9TdPvsGlHTYf0J7w0u7j+B0kJ
	1fSTgEVf6sUPLcF7tkN010zz321wyT99ZvqKmRlBiEQzAxbowkeZR5Txpg85yW5HM57ocd8pXeOQw
	JsOetrbcx1F2te4vMONWDuqod2jjGuSOWL6ulrMp0uhawMst3gzQhkMtW9FkZTA2g6W/ItatPS4VR
	jAt8bRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XX-003Ifh-0s;
	Mon, 04 Dec 2023 08:42:55 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA4XL-003IQe-1i
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Dec 2023 08:42:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6cdde2aeb64so4132622b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Dec 2023 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701679358; x=1702284158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ljd2T3j+VnPx33d4ekX7y2D1w1JW97BW4rSuy9Dt1c=;
        b=iL/SVj9blkESamo0dnfvPVnj31XuHAAz4t8QkQuIVDey1KMK+kAuACcJvMfIdVEuXP
         hEK2C1jXgOZ48veVLWcvo8sOyXJshNU2FLTFbRcsa38sRs2xDhDWi/z11VGO1Ly46/Pd
         TbaHTUO7mcS+5UKVdAscAO+3hyiACsqNoUtFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701679358; x=1702284158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ljd2T3j+VnPx33d4ekX7y2D1w1JW97BW4rSuy9Dt1c=;
        b=WI5sXq+FcyJnILaeeQbjUDfYgIXSQ5iVB+pdnxfHYZp4SbemJ1idJJehx3nuLD1ilF
         tuG46y2PiB6J+zYTIrLIfkU4dlKrmngVCogmhTaJyUm+9b+DZoghWfHZiKQn3ngpu4eB
         Zmr/QJmxLMzY5d+upzCeJL7eEURoIh09vp1PYk7Ue1RGxrN2Geu5egwhMGQpgWQv4auM
         07myfVZnZ/Flwm6IDH2DVHwse+DE8aw3IZwZ6SgOkguYhRf7Uh6FQ6G1CRXGK2UAxnfS
         EI0HzpV5XRK+fVC8h7j7OdRDDwv7G9ZM3AHA/lNAHQvw81ZPlP2cUkMtuNNRtv/TBzXz
         Za1w==
X-Gm-Message-State: AOJu0YxK4tZh3XagN5vjYxdC3eTT1b//NyD8QZ3OpT78/nPO6v14kqzK
	aNWXxv/h6AQonMn7CLRvvjYpPg==
X-Google-Smtp-Source: AGHT+IG/GF8Pm6cp3cedzDbB0NGJWF0gnZO6NRRQ4bKoSNmp32TEAouKqNXVEdPy5ZsKsd52VrR9qQ==
X-Received: by 2002:a05:6a20:938d:b0:18f:97c:6165 with SMTP id x13-20020a056a20938d00b0018f097c6165mr4702348pzh.98.1701679358550;
        Mon, 04 Dec 2023 00:42:38 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6084:72e2:9ac2:f115])
        by smtp.gmail.com with ESMTPSA id p14-20020a1709028a8e00b001cfc3f73927sm7871795plo.9.2023.12.04.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:42:38 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 8/9] arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
Date: Mon,  4 Dec 2023 16:40:10 +0800
Message-ID: <20231204084012.2281292-9-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231204084012.2281292-1-wenst@chromium.org>
References: <20231204084012.2281292-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
---
Changes since v2:
- Picked up Conor's ack

Changes since v1:
- Reorder SKU numbers in descending order.
- Mark missing components as disabled instead of deleting the node

 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mt8186-corsola-rusty-sku196608.dts        | 26 +++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 7bd9471b89f9..6b05f1f2e645 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -43,6 +43,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
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
2.43.0.rc2.451.g8631bc7472-goog


