Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D37CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 23:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZL2qR43CHkvuuHjLtXEqq66Lhh+fHM/KJL5HBKVwIw=; b=gULxTQk4cB90FH1aCNy+JMw0B8
	c7UsUkT2/px3wOcC9dD3z9aqDzCqtqot7u1Q0dut4a1ynoazjyl8dpkpdLBFPocSkpVoBWOB6X+bx
	jsyHHlou/vQet2FrORudqaPeFaSisMn0jhZ/x0eE0D6ueVlcFc5k5q1t8bWodRTdUzDTRcaqI0n3O
	RUjwEYWQxsshK8EXg6G5QobnuE/Yat7BgqBGNHwOf3MDCQDjPAKouJ/kAVYrWLTkgnyT+9cqssBSs
	AEu5uMSd2nChBxSPV8rMFw1YaOTm2hdztHpIitYGlJPFO+3GhVdGwgB0+EPcN4qTplL7XxVktlHjf
	XZpiH8lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4iF-0023Aq-07;
	Thu, 12 Oct 2023 23:03:27 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr4hy-0022uO-0h
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 23:03:12 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5809d5fe7f7so1120042a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 16:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697151787; x=1697756587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZL2qR43CHkvuuHjLtXEqq66Lhh+fHM/KJL5HBKVwIw=;
        b=FJmc9+xsCELdO5bFq5sGke4pSKG+TAGUfSveaWWgBWMCvsO+RKcWYbg/aSerx0czdf
         pMTScvJMF+C/qf8PiZNP5UanQaFcMbsrJjM3sEa5T8skSmDrfqnKGpuFJ0ipBV7dV8XC
         O1tp2DL5GkU5eA688c26fJemTQS58t3PadKGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697151787; x=1697756587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZL2qR43CHkvuuHjLtXEqq66Lhh+fHM/KJL5HBKVwIw=;
        b=pqqV73UsrJVEobLT/khKsI1PqYMu9j0ZChWzLaGKKPJIXjoiXNTaE7AfU5hIN+NG3t
         Cf3yBK1Fl8OZDbECcEpAX6jORCxOGgTTwaAGdFHBxOcHJ+iyPVYYKhTL7bnzCYs1KW3c
         /GJNVkSMAHvZsOzTEhWcjYr0fB4RND/flY4qf9SZlAKKkZoB2TIbFzN/BD4RT/4b9R+z
         4rObSTFFXuPSJapVxLwK2CPOSMoMlrDy6u+GzSPEc8t4EU1UYN/fNRdvCtWnH+5ANNgH
         FU4d0xCDNUaiZ9nv7Bascaie92Lh1aGTh0AXLg1bIPkKv04lszh631LWEFasRyp8uxaL
         0PYg==
X-Gm-Message-State: AOJu0YwvOOiVXpJP0FcKY9cD7CSHAjPRJ31rkooy1H/ukUKAGuehpGmm
	lFelgZFpSCkgr0KOisZ4Uj4/nw==
X-Google-Smtp-Source: AGHT+IHNmLFSfXUvSCIZu97slh9dMsSIdN2phuDlOzogtcn/v4ql653OTqwp3qn3wC8meMvlaIr5PQ==
X-Received: by 2002:a17:902:b698:b0:1c8:791c:d797 with SMTP id c24-20020a170902b69800b001c8791cd797mr19017563pls.56.1697151787485;
        Thu, 12 Oct 2023 16:03:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7397:2561:ed13:bac8])
        by smtp.gmail.com with ESMTPSA id g11-20020a1709026b4b00b001c613091aeasm2494390plt.297.2023.10.12.16.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:03:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
Date: Fri, 13 Oct 2023 07:02:34 +0800
Message-ID: <20231012230237.2676469-9-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231012230237.2676469-1-wenst@chromium.org>
References: <20231012230237.2676469-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_160310_277834_1E7E343E 
X-CRM114-Status: GOOD (  14.10  )
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
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mt8186-corsola-rusty-sku196608.dts        | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
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
index 000000000000..02ab7eb11dcd
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-sku196608.dts
@@ -0,0 +1,21 @@
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
+	compatible = "google,steelix-sku196608", "google,steelix-sku196609",
+		     "google,steelix", "mediatek,mt8186";
+	chassis-type = "laptop";
+};
+
+/delete-node/ &gpio_keys;
+/delete-node/ &touchscreen;
+
+&i2c1 {
+	status = "disabled";
+};
-- 
2.42.0.655.g421f12c284-goog


