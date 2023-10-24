Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C757C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 00:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FubqupHpLqb2pDn4ndeupK3XOZHp/EqiYPXj4OW7V58=; b=0GNuNaSiJiSOHq
	+OTHt2A7Cc8nu+QHWNY69ubxNEsakjBwD3MckPaTFK8UwaaktIa30tVDLgZXxoxjzRK9UH9RrAn9F
	10d94Q4HJAbMuQve0PpGpR3E7KrxOkpj0q+VBWVqbfi1mKfZ32t/yaqHqNbQ/r2hiXSQSqBqusI8Q
	rSVcny+rYkqeS/yYgyHscivJGtEyLKDOQrsIKmr0wKuQ5do6IV7NhB4Adp81q789JZr/BB+P9OTBn
	KXJTLCR9Tgj7yno8xEHi5yeWUh/FbD2T/SXPwQguYrulBU6gUhMLqsdbQW29v3sJTXbvuUWugWvz4
	YSf/c6zHHUQwZ4S0NODg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xS-008Utk-37;
	Tue, 24 Oct 2023 00:07:42 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qv4xN-008Ung-2o
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 00:07:39 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1c9e072472bso25644555ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698106055; x=1698710855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FubqupHpLqb2pDn4ndeupK3XOZHp/EqiYPXj4OW7V58=;
        b=SmW0DNJk4P6RVaN4gg1tdEEUVD0ZyJS3wBAn+ahAXeO7/jtqw7f/OKibBopgS3qpAv
         Bl0L+GbSXC9gfTNSH0FW5c4FEaWy/4+6lfU7v67RT09Bg+iUJONTIgc22F6JjsbBVPb2
         qxxBQUKjF/3jOyAYghNP7+4EpC5dhP3RqnijQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698106055; x=1698710855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FubqupHpLqb2pDn4ndeupK3XOZHp/EqiYPXj4OW7V58=;
        b=fynu7TIrl2ZAfhvIKo9hRg642VFYDXg0kVDn2QUSJ2wfnUtfJmAZtNNL95rYSOVunV
         +2I9NTdV+XLq1X6nJwM0ff7izDecA/cgQASodYCM7B4YqENd/0z99WScHj2A2+XGjfrH
         UOHcytzRKZZkTrzg3UjP79B7Bvs8MJDhMyhN7UT58UyLPv4D23Cuv/Dx8WoewVxThKcQ
         JlyO1cTxhVA99OkJnib1dVevCTYOZ6Ht61gVwIY/veUzlGXoYabOe9gMBYO/tujtWQQM
         IbdjKkk1cCB4MTMFrN7lLmeKdB6FSJEB7kno4TWWeojDzM/SQJjDhAPVrpT1LeLrcZRv
         /8Kg==
X-Gm-Message-State: AOJu0Yze10Z9tfzAWWyo2tltQuC1+qAcEkPGh2mj9x8GgMbDZbLwT527
	5WH9lHhNTyxHEcPx3GRwTEqAVw==
X-Google-Smtp-Source: AGHT+IFSs+WghIauk4oRi2TEuZcbAqZ7IAK+F7XXY/BHNLidhvYR8UasV3y1B7a5WTf9vjbnqjtQbg==
X-Received: by 2002:a17:902:e402:b0:1c9:ca02:645c with SMTP id m2-20020a170902e40200b001c9ca02645cmr6318758ple.36.1698106054711;
        Mon, 23 Oct 2023 17:07:34 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:5a2d:c345:7f3f:d26c])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ecca00b001c5dea67c26sm6505510plh.233.2023.10.23.17.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 17:07:34 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 4/6] arm64: dts: mt8183: Add jacuzzi makomo board
Date: Mon, 23 Oct 2023 17:02:27 -0700
Message-ID: <20231024000724.57714-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
In-Reply-To: <20231024000724.57714-1-hsinyi@chromium.org>
References: <20231024000724.57714-1-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_170737_911810_8C344532 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

makomo is also known as Lenovo 100e Chromebook 2nd Gen MTK 2.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      | 25 +++++++++++++++++++
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      | 25 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
new file mode 100644
index 000000000000..b80be5dbcd7b
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
@@ -0,0 +1,25 @@
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
+	compatible = "google,makomo-rev4-sku0", "google,makomo-rev5-sku0",
+		     "google,makomo", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
+
+&mmc1_pins_uhs {
+	pins_clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
new file mode 100644
index 000000000000..46da8c50aaa9
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
@@ -0,0 +1,25 @@
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
+	compatible = "google,makomo-rev4-sku1", "google,makomo-rev5-sku1",
+		     "google,makomo", "mediatek,mt8183";
+};
+
+&qca_wifi {
+	qcom,ath10k-calibration-variant = "GO_FENNEL14";
+};
+
+&mmc1_pins_uhs {
+	pins_clk {
+		drive-strength = <MTK_DRIVE_6mA>;
+	};
+};
-- 
2.42.0.758.gaed0368e0e-goog


