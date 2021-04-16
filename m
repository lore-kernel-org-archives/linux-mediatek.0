Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6618C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:43:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A256610EA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:43:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A256610EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xdDi5E0coDawWhNQFmNlBrOnGyZhJm7plypeZZ/47Zc=; b=ZcfAxKglIhdaMLPtvluht6oUm
	dCDfcFEzK+P+Fjxtah+6Tt9qAn8uUBW7EwQh+1d1OsR8BV3sBHS1Mwmmuaj8pEgYuhzkYNjBgWmMZ
	V5tgNkB0gUS0ImL8syOLb6DZXBO5TD8k/yWP/MD1vBTj60oR8+sZEkz3EiimBt0+mNdn5We4ulCE8
	1HGXSkfLMe05JhBDfYzjSgSkEyCyqw/VP+/IjXhRh/eY/1ektCl0k2ksda1taZyB/Npsz2YyAbPcI
	Vy+a8gK8l8fHWTi6s4hYFq3fRP7VXoo5Us9WBE4yQSPGnz6QH6e+6VptNiIPMHFXZ9vc1XLtYXq0i
	YLEc+TE7g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRYK-002p1Y-Es; Fri, 16 Apr 2021 16:42:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWs-002obo-Gp
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=spxzACZ6tLjJ8yTyZF9QXTu+vxRnx53gQ9F9Skzy6Jk=; b=sVsOV2WK+nbFra6j+R7EGUDRHs
 6LAAuDzjGwu4mKIRsmVqWDTH+flbOTQd6kCtaT268o40XQxqttatKutgfeBKjJAvNyhAfp4132ozh
 afEphWaNCJRGDPOS2I1oYFa+xh0NRxT6XtLZ2OuRIV6dfQXOy2MRdgh35gwzZzaRWEu6VwcY3CD6i
 tzN6dhPMNhXuLhlDSSw4VrmRPfslNyD7BfkKF5vlQ9nBQWJPURPPqwDc8E/qd5iPyCAm8QHihHrK8
 Eg1fJ+7y/1pd33dTB03txLbeC8StOc8fQMTi+pR3h+IuXha8lhu4A5D+o+hid2BLHux7UDzKO1hgF
 NOJOpyKA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWp-009Yzv-GB
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:41:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id n10so3138479plc.0
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=spxzACZ6tLjJ8yTyZF9QXTu+vxRnx53gQ9F9Skzy6Jk=;
 b=UMLA0/Wd1bp29RC+CxF2M7Ws/lGGyDImlgiaXrKz2dSrZe8EWHshYYsET8ym/gBNB0
 PwaNtcSfQrmPE92zLV7x2fAPniQC6Tp1e9y/SB8Ijg3zMrP4VDjU1TQBXLyLgQp18Rbl
 XHwMNHxKKhnq6GWjXCxtA7E5QA/zqCz2pnw9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=spxzACZ6tLjJ8yTyZF9QXTu+vxRnx53gQ9F9Skzy6Jk=;
 b=bwyRQd2luyPL3Lci4TNu8+mEB2ZWdHVdLR1KIB9LP60nw7LjewLR7hs/wAfEGnI218
 bI3IF1K+bp0Nk04+tZIxi98Ks+qoD4TXPrCELywER155MzStcsuyqzxtw1kX2KYDIRb6
 rIyO/X90c7CwH75Vn219JXYQdqK3RoqDLSKsKEtx7/Lhbbq1AwrPLNSnLr8JOzrCXTO6
 W0x4fnbuvtjM6+HBLZR/cn6aCalDND27wULndOM/MVrB8N9S525nJ5MaLffWwM6gxMHm
 7/4xsPak8q09shsShbkLEf9VirHh07K0P8aVoiGqC/qlR2+nKL++cGG9kJ6TdfVwOtzt
 d1lw==
X-Gm-Message-State: AOAM530o+2TqRioujsoLCnW4uURN1ysRrVKIYQtUfCHnnex9cN4MwD+q
 1bPI72rnLSRcQqL7Hg/K+Y13ag==
X-Google-Smtp-Source: ABdhPJw1Cmm6Hm7vKDvQTatBejyiw90Nj6G5u/leTg+BObKAP5qQ0HWWQb9FzPxzH4m4KSnKOClO3Q==
X-Received: by 2002:a17:902:d706:b029:e6:90aa:24e0 with SMTP id
 w6-20020a170902d706b02900e690aa24e0mr10630209ply.42.1618591271058; 
 Fri, 16 Apr 2021 09:41:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ccd5:218f:365:b90f])
 by smtp.gmail.com with ESMTPSA id g14sm6187186pjh.28.2021.04.16.09.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:41:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 7/8] arm64: dts: mt8183: Add kukui-jacuzzi-burnet board
Date: Sat, 17 Apr 2021 00:40:54 +0800
Message-Id: <20210416164055.3223088-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416164055.3223088-1-hsinyi@chromium.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094111_560465_3E460B36 
X-CRM114-Status: GOOD (  13.22  )
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
 .../mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
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
index 000000000000..b97ca331970e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
@@ -0,0 +1,33 @@
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
+&i2c2 {
+	clock-stretch-ns = <4100>;
+};
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
