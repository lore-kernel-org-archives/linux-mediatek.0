Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83216C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 19:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F20E920738
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 19:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OkVSOdgF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="dzrKwlie"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F20E920738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TiRITquAOOpZJjN3fGCetAnTML4Xa33Xx7dT465SgrQ=; b=OkVSOdgFcUWNYL2Mi0+bC0Mpj
	q1V8QQZyvz3wGe3PtGLbHV1UsphR5tGFJgPg4gDgJvLNGbbg8oiWRd0k52KTbSCExiwuBY6GUR1Ef
	+C8VZ83h+lxR01/jRlSq+1ygOPkqCED1MjR5P2khJiZlB33Gq3qARhPItGXqaOip0dwwtbL/qHfJP
	JfEwrn0z9jnDslcfOAAjihhjcDj7qd2qnjibxRu3EodEEjnxs05S6ixgWB5qOzMI+514qN1rAZdli
	q3IM909rFA2gk4uPX4MQ4UZ8gFiCcnfvUlm19lB4TBqclSjp110Zw3SStly9HzjJB+KhCNzLzl4nm
	Te56uAYGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXUxq-0006MG-DZ; Tue, 27 Oct 2020 19:49:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXUxV-0006E6-Bs
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 19:48:49 +0000
Received: by mail-wm1-x344.google.com with SMTP id 13so2510275wmf.0
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 12:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OM5LInUEcm+wSfTxPM6NIPhrpwKnDjCgwYKH85O1BGM=;
 b=dzrKwlieZrRyqQhGY0/B384MnSh6q5j5qZdrKXCIsrATYhg38T8b4adxQMFpsE/G6c
 cnp9L+8Tzykok/k72SnOevf3SjhmgUJH7hC3usd/A7ZO02OKYETu471jWPrya1YIxDy/
 WdBnGCDKa48PAChUqtIdB/OnNQdPT/Fu9WEN35IHmEOeE0w3Byii75vq4lLS2BBrA15H
 sQaGOOKVQV0RW4/18KTLgN4xCsN+4UBZmxSEVj8elhwDjEKNsUmG2Y5CG5JuaqMgodRO
 SH03eT32d+Kg/3omAleMIrK3HJ1NFHXMae5GwhhzIxWi0UKQeuwvG6+Oht04O1Eb1nAD
 7VzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OM5LInUEcm+wSfTxPM6NIPhrpwKnDjCgwYKH85O1BGM=;
 b=kBQz1i9ni8Bxf082hkluUY+605uXI9d5gJHybs20tn9OnjS3y7i4ZKRYBIvW+QclE6
 8oDnJxC19tw+3pLQdTvVmUIzY1M6XtqI46oAj7+zg6HdwAyQXsdHSbKKsOWWOO8Grptz
 C2SMzZakI2nRfwAqcbfvyL6SiQC0bPYj14T05e+FYV+nwcKJWCs20uAA/Ei+jXUCdPYK
 vywr878/TpGNWLo2US/E/XGVmRJS07jY4nIv2Vd+KP74HbDWPlK6JatYId82+CbwII9T
 /OBQVXluio63icxhpst7F1f0B/270AzhKob1q6mSDpaNYFho4nRaLybJsxyv75lUcWQb
 XbTA==
X-Gm-Message-State: AOAM532rZ0CD0y3bmXZwLxXlLdFsSVn/ooQAGWs5+W317WIcpYWub4uY
 bilcCpr10NxZrZE5YATSSvp44Q==
X-Google-Smtp-Source: ABdhPJy6CncuhXQfiwvE/R48xeKNyaogkfdxWRMSh2NZq75O2YHmbHlVztooFbCDyF9nSFYcPtptsQ==
X-Received: by 2002:a1c:4d14:: with SMTP id o20mr4268431wmh.72.1603828120449; 
 Tue, 27 Oct 2020 12:48:40 -0700 (PDT)
Received: from localhost.localdomain (159.174.185.81.rev.sfr.net.
 [81.185.174.159])
 by smtp.gmail.com with ESMTPSA id h62sm323222wrh.82.2020.10.27.12.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:48:39 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/3] arm64: dts: mediatek: add MT8167 pumpkin board dts
Date: Tue, 27 Oct 2020 20:48:15 +0100
Message-Id: <20201027194816.1227654-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027194816.1227654-1-fparent@baylibre.com>
References: <20201027194816.1227654-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_154841_617690_21605847 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The pumpkin board is  made by Gossamer Engineering and is using
a MediaTek SoC. The board currently comes in two available version:
MT8516 SoC and MT8167 SoC.
The board provides the following IOs: eMMC, NAND, SD card, USB type-A,
Ethernet, Wi-Fi, Bluetooth, Audio (jack out, 2 PDM port, 1 analog in),
serial over USB, HDMI, DSI, CSI, and an expansion header.

The board can be powered by battery and/or via a USB Type-C port and
is using a PMIC MT6392.

The eMMC and NAND are sharing pins and cannot be used together.

This commit is adding the basic boot support for the Pumpkin MT8167
board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../boot/dts/mediatek/mt8167-pumpkin.dts      | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 3ee682c266cc..8012216987ef 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts
new file mode 100644
index 000000000000..774a2f3fb4b2
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8167-pumpkin.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 BayLibre, SAS.
+ * Author: Fabien Parent <fparent@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "mt8167.dtsi"
+#include "pumpkin-common.dtsi"
+
+/ {
+	model = "Pumpkin MT8167";
+	compatible = "mediatek,mt8167-pumpkin", "mediatek,mt8167";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+};
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
