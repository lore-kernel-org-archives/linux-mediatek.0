Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4FDC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF56C61425
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF56C61425
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0qsAzTpAd+a4Xmw0vDjnU25MdcVeUW1dsBEWLkxkp0Q=; b=TV6JkhEQ8qlXnrbJUVXiVTvRq
	ELsvO4H+V7BkVyN1CNHEQVt8DBPIY9kABB1PBiOPBiTYwE/W0ku1WLGoNmYLXGkjXi2Q2eKQaghQt
	IBw759a/6xAT6CIs+LSOpiYC3uq8DrBCH0CbORyNHxUYNTOA/BQEg234Q3BsqWoamJgtdGUxjd+g3
	eSTq7b5w1AE+9xUSZ0vW9P3reZDJckiFZTvpGrMbQ/g8A5W4IJNRTrxJRwdsqR0Iubmt+hsNCsaY+
	RcII/bA8mFt0n5qOiRXDZnE1wd3e6ZsDturdKL62okBO7u89PqzE4NyaULAPwVQFtrSmw2LvOAihi
	AhEE7agGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8pR-00E38w-SO; Wed, 21 Apr 2021 09:07:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oR-00E2wY-Ch
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=29WL9WcrwDBcvwU9CHsWxL8ARjysbuxzxp0JmGVr/ck=; b=H9um+DWT2eGc49PLa366wlGfBL
 UjNQBTY9HS07FQ726P6gbPdtay/Q/ZtcEo/L6DcCWkTjwBC2fmnEzW00Wsbsbx+sYJIzOeghY7S7f
 dK3Ox3yvVdPQP2fBmTscH7G1PjIfbCRzeUDm7O/SvdYl8npIO2GbmGZYU4U8mvMehCB8BKMCHiwkc
 CsalxDJGPJXy7BjcPjMvno8LRZmP51JemO/kr1g6fmqeyvrosPwbPPaUF+cYh4Cpz7MHNbQDGzqa0
 hG3GlcqLdhIkeLfzrQ5yPqCx5D/+jm/bvfeqInvnHy/DmsYTS2ROSLXFhDykrxegvN6cONa8DGVxO
 kG5s8XAQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oM-00Cjfb-5s
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:22 +0000
Received: by mail-pf1-x432.google.com with SMTP id c3so9346662pfo.3
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29WL9WcrwDBcvwU9CHsWxL8ARjysbuxzxp0JmGVr/ck=;
 b=Q3Kk9sZfM9zyqZa92zu/EXFefTZU0c6mxVemVXFHd6jqMDwJYVSPMAOYjgt7aMMuoa
 khgZQkAQC8iA659EZ3AzwJZVpXhNLheWc3EasJ54Ianz7wWH1l5+HYYp8Qxjrs9IZO6D
 OHNDNGxkDIVcmVGhLubBI97Batoq/XmqZ74ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29WL9WcrwDBcvwU9CHsWxL8ARjysbuxzxp0JmGVr/ck=;
 b=iSVKtL++pro7IAatENb9mbUu3IbwfBuF0McFLTBDrh3bkUzDOLy8vKn5KQAOuCLegv
 q475Ugpalxlc78mxy5dxfUXCctYdiyGVBo6A5MHsizkDpPgU9NG8JJMDLmN1cfFj9Pp3
 i6X2Zslv7M15Xl/JzPBj4UxsrR5Tg+iVDKFLnGWV54wvKUoonlDcnzz7SSeU2xVESrbh
 DVmZlkfqHgdekZ3s3g6/HzqXUyb4NSIze1HQkL9E1Icp8Y5PmsQ+8i4GtWwjs3cypcFK
 xY43XtC/b2U2nXlpMrbZ8Yt/Vx9Dsibb5hoOPCvcXl53eJl83Zvwha/tkxvkGkuw5kna
 XltQ==
X-Gm-Message-State: AOAM531id5hYUZ2+IdEJgAiSgFZksrWqvHaSI0Bs+lTJ+o6/KQR757uN
 bp/ZYQwl4h/suWkzPm5qsZhlNg==
X-Google-Smtp-Source: ABdhPJwMiHAm0cjAr/V0MrgbdGFSie0qrxv5/XcqGLoVu9sLew1oGgn109yA4dnoeKqa/+TYSH3FgA==
X-Received: by 2002:aa7:934f:0:b029:25f:35d6:a1ed with SMTP id
 15-20020aa7934f0000b029025f35d6a1edmr14994259pfn.1.1618995977132; 
 Wed, 21 Apr 2021 02:06:17 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:16 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 06/10] arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
Date: Wed, 21 Apr 2021 17:05:57 +0800
Message-Id: <20210421090601.730744-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020618_224640_B345E554 
X-CRM114-Status: GOOD (  13.06  )
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

Kappa is known as HP Chromebook 11a

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/Makefile            |  1 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts  | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a1c50adc98fa..df70674949ce 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -15,6 +15,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-damu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-juniper-sku16.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-jacuzzi-kappa.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kakadu.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku16.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku272.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
new file mode 100644
index 000000000000..b3f46c16e5d7
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Google LLC
+ */
+
+/dts-v1/;
+#include "mt8183-kukui-jacuzzi.dtsi"
+
+/ {
+	model = "Google kappa board";
+	compatible = "google,kappa", "mediatek,mt8183";
+};
+
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
