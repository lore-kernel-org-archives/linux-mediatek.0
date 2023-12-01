Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087E7C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 07:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eaC0buh7aEVblHqvJfrsnZTUVZcIwutzgrSrvSUna1w=; b=c2zJdKwTwhrM82jcA+dxaOaP2U
	83VQcru+y6oVdi3qVqrQcgmVdbF+FPAgNixQ+/B1jpo/0kwupgSfyfdJDpt1g9fxWX5YhuDX8/iCS
	Rj9lOPLjtFszOb+133+EAEltywPi0kQAf7W/8sF2drnhpuiTm9cfarPiU3evrAcwPaD+oIk0c75lh
	vfC+BRHGSMMTSeQtHMnEWyZeULjFG8rh1Gf5ln2E176Pti8JnrAb7f4y5zGhcWJZjOV7JfeM6sv1R
	4m3D2TZ0Vg6eR9gCedaLJ9sVd4Bl5Mhy7I0iGZ/QqLeT0s5QmXDtA39mPIYHLvksR35+ODOs4qG+B
	yJHXC25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xde-00Cqyi-2r;
	Fri, 01 Dec 2023 07:08:38 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xcy-00CqZS-0q
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Dec 2023 07:07:58 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so164331a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Nov 2023 23:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701414475; x=1702019275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaC0buh7aEVblHqvJfrsnZTUVZcIwutzgrSrvSUna1w=;
        b=PHrZOBTXb0MVn0ov9d3DWqv4aZSennarDp4PaNhLUIDqBMRhttJrHgXlI+0XdhAh3B
         S+VaxEHMch3rp6l11oN2rdKBQdr62siN57/e0Xw9uWQojLjDoZnyNg3ObRrArwIiydWm
         u9rZdoHh7laNAhrlAf//sdDAyjMhvxhEI72VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701414475; x=1702019275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaC0buh7aEVblHqvJfrsnZTUVZcIwutzgrSrvSUna1w=;
        b=I3nCrhDa/J15raGkUyDhjZthbDFL8PD50fhhUfQGVpR0YtzAiPFH2XvgyYVg6g89DQ
         jnpfMBoRdrUaEfVsMf3GQ5r2t4uq+RUwhxPkmQ6fcwUqSIyzcoY8QtaGx38xESQjEo8F
         2HfMJ7Qdd3BBa52BO+bG/ZVhqcP1M8tDaCv/cnfz/yJWQUGssQIyW/gkl/+cT/cdN60m
         vMhhN8St9l71U0SDlZUnoCF7UISbW9V8n2tX1VLk6kbJdnOaS5xoV4EjFLeOsee9OBgn
         A8RtXGFNu16Ved34ZJI4yv5uTk9sNms+ZscefhfxuEffE9towZcMdJ0MmhLtDPvT/bhq
         6Mig==
X-Gm-Message-State: AOJu0Yxh2ztGIipfGfw2tAEUCsyHbT3rQM/eGlFtbMO/iABgQi411fuv
	zYoecujIOjBGGLGlXyos9d6vsA==
X-Google-Smtp-Source: AGHT+IHT4YSH9zK0GVooFrGQk5IfvBVb8uWpQf447as3BXXX4IM+f8biPC8Li1pf69Fd6heoaLDsFA==
X-Received: by 2002:a17:90b:1e4f:b0:285:a65c:64e7 with SMTP id pi15-20020a17090b1e4f00b00285a65c64e7mr18456103pjb.18.1701414474776;
        Thu, 30 Nov 2023 23:07:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:720a:d435:c253:2402])
        by smtp.gmail.com with ESMTPSA id y10-20020a1709027c8a00b001cfa0c04553sm2558684pll.116.2023.11.30.23.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:07:54 -0800 (PST)
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
Subject: [PATCH v2 8/9] arm64: dts: mediatek: Add MT8186 Steelix platform based Rusty
Date: Fri,  1 Dec 2023 15:07:12 +0800
Message-ID: <20231201070719.1229447-9-wenst@chromium.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201070719.1229447-1-wenst@chromium.org>
References: <20231201070719.1229447-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_230756_312496_F2BE501D 
X-CRM114-Status: GOOD (  14.09  )
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


