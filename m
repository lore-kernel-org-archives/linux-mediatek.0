Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293E1C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:28:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED62361179
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED62361179
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XN/25/oFG79UXaEVxojYnUTNUGTEzqB3LOr12hY/Y7g=; b=XdXCypHQLULvlT
	Uji4gjqNB7bsJk34Pji6pbakb7PTjIMIWI8N5IDUA1PslQjaxnUYxP1H/OXU/qee2aDp/RQpB3eNN
	XUqJYGNxxIDu8NaXYQ4BBOVB7HgZDnsuwrH/O8gKQ6EQlhB9kz1gFIZh/nHjQkKNELy5s3YPMsWG9
	GzCiteLtsZXPuDVzSzuI8XtRMmFJLcttcW0OtCB3V6Fe90lFxLF1KbfX3T4INcm6s3nBd9hQyuROs
	HP6j4rxlTyTS+juWWiE3UnHuqPDuRlGOUpcwa+7TKSfXpGa8UywJra5O9tAaCd+MdkXddrvjLnHnz
	mBINLzAU3Bzuvakt4y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjz4T-00FZNW-NS; Mon, 08 Nov 2021 07:28:01 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjz3r-00FZ4k-S5
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 07:27:28 +0000
Received: by mail-pg1-x52a.google.com with SMTP id r80so4071689pgr.9
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 23:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mMyybJ8cedWreU7hFIqGdeFr06iYH5ttCqNwsXNo+Ug=;
 b=BlJ4p8MnCKRJrHov42Gw5KKXGTRYkmjY6+EH1ZkUsBlpQHSn1X3MArHfqqyICbpt8J
 ckBJBTOX1M7RNcLEX4+BBy5saGYqpvpVQDtiX6EgOU3R+pDDNCsYiY2H3XOSmlcBFFFS
 yPaiSqa+hYKrxoqtG0Csp1v1bWOsB8bznR7Rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mMyybJ8cedWreU7hFIqGdeFr06iYH5ttCqNwsXNo+Ug=;
 b=DnRH0uGuZE9sXUrOQa8z3p1YRElhjnix7aG33X4iQQ56M/fM4eyLyHWR1ljgRfje4e
 O5wbbqv4vH3+dz3Tkel8BZprhRnzE0bFvO5PD/55llcyrC5AE/R4lLycHwT9aB0nXyYH
 K+ZFn1F9iakL9S+ZqQ1PZeTWdnK5RsmZQ8cAF8Mri+RbnPVZg2G9DhYQYIXktJEfMBXl
 Xm2zdPVqfzc8Ht9PEkeuXE5Udu92gsI/AlksGbomTMbkecaQNhh9ZqB49tJg8kJtGfG4
 6/h9QKS8R6Och50+cTV4QXKDuFimSWCgHWXGkKMUSRrGrOU77UMuJWnJPrHRIQiMXSW+
 MYHg==
X-Gm-Message-State: AOAM532m/UVW9vDZUQVeUCZcYo8V1E2cuBG+8x5ivg+GlBABQ6LuzfGI
 ec8xIZwQN53HCNVOLGcQpB1JS16cFzbAdA==
X-Google-Smtp-Source: ABdhPJzGTEjdH6LyTtUqnt1Zognyi8VuOYKKerfR1nK0zQN7I97rN5Rl+Pi5/x087s9KQfDWroMIMg==
X-Received: by 2002:a63:af06:: with SMTP id w6mr58727268pge.436.1636356443295; 
 Sun, 07 Nov 2021 23:27:23 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f03:6a9b:24e8:3a2e])
 by smtp.gmail.com with ESMTPSA id e8sm11684972pgn.46.2021.11.07.23.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 23:27:23 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: mt8183: Add kakadu sku22
Date: Mon,  8 Nov 2021 15:27:08 +0800
Message-Id: <20211108072711.1628566-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211108072711.1628566-1-hsinyi@chromium.org>
References: <20211108072711.1628566-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_232723_935741_91367028 
X-CRM114-Status: GOOD (  13.08  )
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

Kakadu sku22 is using mediatek,mt8183_mt6358_ts3a227_rt1015p audio codec

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/Makefile         |  1 +
 .../mediatek/mt8183-kukui-kakadu-sku22.dts    | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 9834bd659d1530..1613259b686576 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -27,6 +27,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kenzo.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-willow-sku1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu-sku22.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku288.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts
new file mode 100644
index 00000000000000..3a724e6f915cd5
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-sku22.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-kakadu.dtsi"
+#include "mt8183-kukui-audio-rt1015p.dtsi"
+
+/ {
+	model = "MediaTek kakadu board sku22";
+	compatible = "google,kakadu-rev3-sku22", "google,kakadu-rev2-sku22",
+		     "google,kakadu", "mediatek,mt8183";
+};
+
+&sound {
+	compatible = "mediatek,mt8183_mt6358_ts3a227_rt1015p";
+};
+
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
