Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D60C43460
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:09:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D9A613DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68D9A613DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+3gFhenYPf+9XwIKjPJ0kXacosaHl6NrC7+0UAnRrxk=; b=Tso2gNP9wVqs2AiHHv/zUYvNq
	3/+s83UE45fd4ES7wbpnzknH8YC6ATnvOb9Gg/EPKDV+QQMpS83lQ1ZDnLFcgCoVEa+mnJB5qFS5z
	nyMJ0bxuO6wgC1fW888V06C0Q7Oru1J9xoM3p6Q6LGhqXtUGpk5QG+s2RdheqqdNjTm8mIIo7Z8O5
	dWmFyaIDCtZFFj0ifZ6zYSbzghcWQvJiD7XD9YAhM+TLnADx01wTIPgSGI/h/cUplC/s+jDQnN/3E
	KPxW/6FTCGoff5Psig/9SlIu6gfg29OCYQFzG3y1dY79idu1pqLq5TG7GSa0zcbfKzxRQzuiltVHK
	TOJwXVkKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8qu-00E3gv-TX; Wed, 21 Apr 2021 09:08:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oV-00E2xZ-4Z
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=P57ROu+aYfuik8qrfPLtqSBm2rpbyMiEgmmbtJHdOFE=; b=nvqvhWv3E3kDywcQ80WFerrwYh
 uB+mOfuirNvDHUAwGl47Q9Y8UKBemGmMlaAZMLmjyeixOZC9YzphOPPvr8MssYIp6iQ15/VhllrGO
 WisO5yh2f6fUCAW6twW9INc2FZPnytdcQU/1CjXL3c9L8GLQzLgXou5HmD2J6sKKtXB7pReBi68/V
 MgQskEapr4trhe742OMOI5zBbqQPFeSpbNeK/mr4p8q6kLXGL1kdp1HpbuLyJ9wX+nijH3rez3JYv
 TII6gNfZgPKgY+H+xbaYKQncZAjmszgNDSbAaFDdq7Ql3+20ognFVn4Z7zVPgFsgBhYtnbs13PCui
 veSJIjRA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oP-00Cjgx-Do
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:25 +0000
Received: by mail-pf1-x433.google.com with SMTP id p67so23191421pfp.10
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P57ROu+aYfuik8qrfPLtqSBm2rpbyMiEgmmbtJHdOFE=;
 b=a5ERAKhqEwP0k4kUYBeBLluNoxQHnZ+aQNHev0yh1J0dSeCxIgaJKONIhLqnBpmKrI
 PiIBE7pRTAHnU+LJB7+5T1vXjQiUvGx5SBYU+PIgTyPwFir1tbeSOSMX5EdrH0+ds/is
 W/vDNCJYv0yhLXP+D1Zbyc04VTVunn5n8EvLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P57ROu+aYfuik8qrfPLtqSBm2rpbyMiEgmmbtJHdOFE=;
 b=sJynLxdaHvjZC0wBtphfOwCaJ5R8+Y9F6nENrmCHeaGkLgAzJeRMGxbNUsMYau43Tl
 mR9dYlLXdhK+5v+e7Ld7PUaZKqSbgprUtuj3RHLgLuU61QUHto+w/BvF86V20htq9VDx
 inJ0VRGTblqdVNXlaPbxCwYeK54GQ6b0BcQ3rEIi1yjB0oPfMw0d496N12OktNtS8DLG
 fD2GoVgh/XmcOeenz9hK4YC/M2JKBPPyllPt7ib025oB7mxzwvSOlJNzNdhoRsXS3al0
 /2FyPTmnlBZ3ByBDNAojWOjPt0bB8aBGEK/6y0ktBL7t5+vqvhMHcasntiPIqGgzvFjT
 o3jg==
X-Gm-Message-State: AOAM531ATm3FHnhg9G4eHj4iPnIGkGq4gxwtNR+RpAk2THEBKUsprpv2
 zf+fkQ4UGQgA4WI3jSD5VRpn0Q==
X-Google-Smtp-Source: ABdhPJyMrZzup7KcFDMZHzpav5zxNMmHKGUoGyFh1p9QTxHzNC4m4ozhoncxMr8idGj6+LcS0xl1Bg==
X-Received: by 2002:a17:90a:6407:: with SMTP id
 g7mr9610511pjj.206.1618995980953; 
 Wed, 21 Apr 2021 02:06:20 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:20 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 08/10] arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
Date: Wed, 21 Apr 2021 17:05:59 +0800
Message-Id: <20210421090601.730744-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020621_495932_C62ABD72 
X-CRM114-Status: GOOD (  13.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Burnet is known as HP Chromebook x360 11MK G3 EE

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 5f43bbc2ea72..b33d0bc58021 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
new file mode 100644
index 000000000000..a8d6f32ade8d
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+/ {
+	model = "Google burnet board";
+	compatible = "google,burnet", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
+&i2c0 {
+	touchscreen@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&touchscreen_pins>;
+		interrupts-extended = <&pio 155 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <200>;
+		hid-descr-addr = <0x0020>;
+	};
+};
+
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
