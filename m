Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC2EC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:04:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28C622A83
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 11:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E28C622A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/n15qyN3MNfGFhbI0cYF27jWPdjcg1ldHV5BSJA0kb0=; b=By/sk+7beN98qa2lzblgXrOo8
	+vkUeyJGD8cx58dwtQnchyXPT3KzP9ZhAKpSGXsz82InL6+BhJ3jEGf6GrqoKD+Z0WQxcDk4qTqyD
	76p+eEUe4GqicWaw1bQ04Bcv4l7sTuYKVJldPcJC1D+USAJ/bKA3edyRy8/11g1obLn5+e5Ldckh9
	M7RxYZnnPx5KrUMylKgctJEr0gJLFxEta9Bxu9XHxxanHxCoJav9FaefD6eYP7kZgo7u7b5/JbQal
	GF8/exzqisuRsOnkqvDaZ0G/D7Yuxy/bgRC2GNCNL+0axvN6yW97hrVD2NC5Tho+QTvPkp3kGX7VS
	on1cpTOlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzdxH-00050x-P5; Wed, 13 Jan 2021 11:04:47 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzdxF-0004yr-V6
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 11:04:46 +0000
Received: by mail-pf1-x436.google.com with SMTP id c12so995472pfo.10
 for <linux-mediatek@lists.infradead.org>; Wed, 13 Jan 2021 03:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3cAH/07vPZODQW/iF5DB+fIj9Loro7b2PieBM5y4hjk=;
 b=n73bBTV+qgeVERiT+pRZtp8rI/K5i4cyHtw0afjKRcKK0ymFGO5kUequSSD5KLvFj2
 7po2l5HB81nM/iOqshAEVC9fj8kfTo4ucbPqBA25fatG17f0rRLv0MZimfcWRXCbU2+i
 YY1cnAbZ2dJ7FZWeVsMPrTI2AXSYcgLvRGz8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3cAH/07vPZODQW/iF5DB+fIj9Loro7b2PieBM5y4hjk=;
 b=BnXi6VXTC29wHuAu2qIJSGt8J6wknhvlxbOWZT08YgEMGubzKXBGf0EClhUeS9geaB
 zfdDcTyNBe1FStFSEZA8sfNeK9m2DhrhL6mGYRea2/vtzG6UNoCi0JQAcy+L0fR6VGcO
 NofVvrmjwuF93SNc79j2A+UrvnZuzf4xeNNCxjzvvatthbSDLYzx/QowwTdJ7JbRvZTr
 PMMwBkAIgRyioON4N5B5MKny90MIrQ/ZEkHO8B4MhPeEYQlArvdpohOdnlo8q8HOAyoM
 ASmrFAg60JVkSjqeJJm8FrMnNbIm7JJR75+QAmQ6OGcrci3YKFQeyHs9ZR6LqEI4grRI
 kXTA==
X-Gm-Message-State: AOAM532UJqETfZgJsxX9GPBWXpa8dGfd77eI6NkpeTId/+QEjeahpfuH
 CarznN6zFgtWb7vxu2BC9zz1qA==
X-Google-Smtp-Source: ABdhPJzAwL/zxe8BmvIl7VPRxz3Tcvo0YpZLNZfElkxWbEJFN57r2m4HrDQlqzfVQ0DTfqBH5i1GCg==
X-Received: by 2002:a62:2bd4:0:b029:1ae:4d9f:60da with SMTP id
 r203-20020a622bd40000b02901ae4d9f60damr1731172pfr.20.1610535883826; 
 Wed, 13 Jan 2021 03:04:43 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id o129sm2114749pfg.66.2021.01.13.03.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 03:04:43 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 2/3] arm64: dts: mt8183: Add krane-sku0 board.
Date: Wed, 13 Jan 2021 19:04:01 +0800
Message-Id: <20210113110400.616319-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210113110400.616319-1-hsinyi@chromium.org>
References: <20210113110400.616319-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_060446_014076_9B873AEB 
X-CRM114-Status: GOOD (  14.67  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Similar to krane-sku176 but using a different panel source.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
change:
v4: split dt-binding to another patch
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../dts/mediatek/mt8183-kukui-krane-sku0.dts  | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 18f7b46c4095b..deba27ab76574 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
new file mode 100644
index 0000000000000..fb5ee91b6fe0e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku0.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2019 Google LLC
+ *
+ * Device-tree for Krane sku0.
+ *
+ * SKU is a 8-bit value (0x00 == 0):
+ *  - Bits 7..4: Panel ID: 0x0 (AUO)
+ *  - Bits 3..0: SKU ID:   0x0 (default)
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-krane.dtsi"
+
+/ {
+	model = "MediaTek krane sku0 board";
+	compatible = "google,krane-sku0", "google,krane", "mediatek,mt8183";
+};
+
+&panel {
+	status = "okay";
+	compatible = "auo,kd101n80-45na";
+};
-- 
2.30.0.284.gd98b1dd5eaa7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
