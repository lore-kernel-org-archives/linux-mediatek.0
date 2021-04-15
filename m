Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3052CC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:37:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EFAF61249
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EFAF61249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r5Mc5BT+dQYsvFGgHHLlpxm6OQekC3/CSXLILM3F8S8=; b=UF3Yen2YRpSfmkA3d3E8JzH81
	Svim94xSVigJxsEzSvCih43ZIY9eMP0vnWyL+fL6WaKF7rjITu68nesCzTeREnyRaC1RtMcUACWFe
	EMPQ5wzo+TIBOHbVwZdAZUti8/BjHD/IMqL6qGxZ3S+kVczz5whIrIm5Be3tvBQi1XwR1ZpKbESNB
	xiXIqQpT5maL/kbtxOldKUt16r7TPTvQTucSnKCu40/Q0+awTtc16+lFkyFMIxKAPjh7o87rA5I/f
	SHU6V6r7xtKwgpSC4OSkSHonNLVMtfp4AhHsHNmnGejLKdnLegMGpfPBgLq/YnGGwsoKvteuEfWzU
	7eBOZH5lQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyQr-00FYEd-Ke; Thu, 15 Apr 2021 09:37:06 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPU-00FXik-Pm
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CJGA7CCltoi4LLPzz1QAsIABRN6U35XVYBq+koWY01c=; b=TxpPrm6KgwaLx4l6TlG7AOgfPj
 q0PK4ckk3a3SY5j+/XAKV+i01uBO2eguBtc/pv9smoSIM8LWOiuyBNEZ6S47MG6aaxZhRrtQP+h/L
 U5ZyyYxKeL/r8FhjAkrtlExZ8tIBVjflmhl4Y5rC59F/hNGqKaHO9B3mEzDSBDLR9K2T6ooZg95CV
 GdKIpzdSU91GHH+6Yo+MNzxEqDc6bFQcSsm9rGrqBIMfIlJgs0cbIkOhAmbws62w5tNQ1cwvkiacV
 T1iC/LEjGzWeaXF2/2RuT2aol6MuHwDBuhuQv/hsRJVKwUutdKjp1W5o08WaHVAmyyTt9nNfDGJLo
 36uXRx0A==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPS-008Qlq-Ch
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id t22so11412570ply.1
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CJGA7CCltoi4LLPzz1QAsIABRN6U35XVYBq+koWY01c=;
 b=cENYPVud5PeRD1D7qHuukP+AksGsNcy/N6MKBCNIrvRMwZ7D4AmkT3YnJ0ZGxFvtre
 HfQb7ZL0JL4zUxRsbH0gJTkWBIUFkAU/683iyML2L1SHc+7BHBUNPK/qPt+lkccOfA0Y
 qURI0WOxyZyPQocKWPTdNCrGcwfXMuVE7EmPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CJGA7CCltoi4LLPzz1QAsIABRN6U35XVYBq+koWY01c=;
 b=L6fG4VbDL1VQxcZZ8IZEpDj0LW8PX/WHYT6Enm0falvPfXCVr5l5/1GT325JhCXOP6
 boAL/zYUzREZ2yXOp7DmqeSErWKtncMBJoBMbTRlRKwqr4QN2h/O1OMuxLyz7q1j59hh
 wbxOjnLzlCglvOVUsE2Yy0dY1bYCoe/VzXlkerJ3JowpaxeLxXqy0mSatWMqaZjpADc9
 o1iiA7YxJchFnCdy48t0CjIxPe/hXSnQ/8rtDAqzKmAu2CzW/vyrAV053N24JrZtvXV6
 uFmc3hx8ImkV2HDPjnC4+tpzUt9cc+UIeCw/tTpizRdpp121aGbpymRfCur+IXMDqQOo
 MxkA==
X-Gm-Message-State: AOAM530BboELn+fOyFp3b443ezX3CBh+cQJQzwsynhrx9FgAH6s7mO1v
 3Rht3+K5dqcwconFnb66DQnKqA==
X-Google-Smtp-Source: ABdhPJxgYrtlSJlROR24WiWfnuLX9r3uA+Pl2QHDNsh8eRJ+6V8MzWQzeTyRoA9+bjI23r0H4gMakw==
X-Received: by 2002:a17:903:1d2:b029:ea:e375:6a57 with SMTP id
 e18-20020a17090301d2b02900eae3756a57mr2926248plh.31.1618479337825; 
 Thu, 15 Apr 2021 02:35:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 8/8] arm64: dts: mt8183: Add kukui-jacuzzi-kenzo board
Date: Thu, 15 Apr 2021 17:35:19 +0800
Message-Id: <20210415093519.1920877-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023538_455682_C9309956 
X-CRM114-Status: GOOD (  13.15  )
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

Kenzo is known as Acer Chromebook 311.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile                |  1 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index b33d0bc58021..25770d83059d 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -17,6 +17,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-burnet.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
new file mode 100644
index 000000000000..6f1aa692753a
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi-juniper.dtsi"
+
+/ {
+	model = "Google kenzo sku17 board";
+	compatible = "google,juniper-sku17", "google,juniper", "mediatek,mt8183";
+};
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
