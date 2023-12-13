Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FB9C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 15:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJ9hqaoMyiM7ZfCjWXQMCYBCAnbmMeUlPLMQT4P9LXA=; b=UmvoKcffPNH59Afq6/FaNp/45P
	fvjwhwNbxwkZZGvZY8cnTO9JXgNTPTZIk7MclRWjOGVLFiVjr+Xidy8LoEToV/RoHcKklYF8W0ncZ
	tXrgQwtytD2Y3Lf+f8PNl/h+u8m15vSrbAVcwTfF/gHWmj9ybHOCZ0cobTX6pSCLK4LEl0WQew36t
	NP/fFPdCfgPZifCMsH2pmWKtBHjc038P9dWsXKzWj7FZ6lXqFWa+EdSEO6PB2Fbi/vihGl7T3fs5u
	0/MohKCpR+bk7rPXixahKxlmnBH9xMIkT1C4+RoPqs3tNmP2M0VbHopkcZ311hYO9vCnlMmRiLvrA
	Bcr6Ccjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnl-00F9MY-0N;
	Wed, 13 Dec 2023 15:05:33 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQnN-00F94R-0V
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Dec 2023 15:05:15 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d348653591so10435595ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Dec 2023 07:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702479908; x=1703084708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJ9hqaoMyiM7ZfCjWXQMCYBCAnbmMeUlPLMQT4P9LXA=;
        b=NBnntqFqmxAVBHQYuSBqDztkV8TMww+6K86cnHanLyx06XNjIy+V1WM0KC79Vrdwvc
         FrkCB9yGd8B2KcpSdFsXI82N89ndodsUyciSqeuWwcNiUQ90YDPpu8q1OAOWHlgREAx1
         NmHewqvYd6qCpU4SH2nGMtypvkE4JDrbYwDvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479908; x=1703084708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJ9hqaoMyiM7ZfCjWXQMCYBCAnbmMeUlPLMQT4P9LXA=;
        b=eTIvx8GluUWA+n/Ogkb/ex7QW3OYzAyP+aUEd7+WWjpfUj0PdnwOF2C3DOHiJCHS5t
         /vDblHGZPU6lHK0OHvZvdAbW9x698/JerBrUKHd8BRdOMe5vaaFV84EuLyw67KIiVBWK
         FXgIL+YYkGc8IIbIQCh1/+/yDp5HkNP85lsKN1nO7tzcdxlgkKIieSNDockM/JaDear5
         D0TIHsfHoY3XiXwuALwt/QUyPvjbtfZJBMZjbnzRNaiVsX77c12jjOcpKDGIviaBeDra
         5asy8hTLGPAOAWcUZyDUO6s4+hmr3gJPNHkRu5znhFImP4R5JxXkSobxIGqrYaJyuHim
         lN7w==
X-Gm-Message-State: AOJu0YzWnmqsiWK1hcbBFReFkQj0sGJyx3WUnpKAp7fM8Z/yAOTfDzKu
	g2EEYeA04smxpU00/amES1Dtgg==
X-Google-Smtp-Source: AGHT+IEJsXTRTpBCJ+k4Sm+U/ohAi4vv7jtFlylGNKtXBsgddORIXeBlfwVgmP/y5udDbKR6k0KXsQ==
X-Received: by 2002:a17:902:c943:b0:1d0:5357:f1ad with SMTP id i3-20020a170902c94300b001d05357f1admr12018029pla.18.1702479908617;
        Wed, 13 Dec 2023 07:05:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1974:9e2:4915:58b0])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709027e8f00b001cc2dc61c99sm813808pla.22.2023.12.13.07.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:05:08 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 8/9] arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
Date: Wed, 13 Dec 2023 23:04:32 +0800
Message-ID: <20231213150435.4134390-9-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213150435.4134390-1-wenst@chromium.org>
References: <20231213150435.4134390-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_070509_225016_BEBD0ECE 
X-CRM114-Status: GOOD (  14.02  )
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
2.43.0.472.g3155946c3a-goog


