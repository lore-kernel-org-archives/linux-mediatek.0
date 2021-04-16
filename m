Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30745C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:42:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A279E6117A
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A279E6117A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3ipt5kH7Jv0EzlQf4bCogRg4OyAK6JOErJANjL28GiY=; b=AFvkJ005V4p8DPvSoiyg5b7I3
	e9tgWXLYGW41RO9ZWJDCMTVEWSaN+1HtR50abFSWC/bYCwTx4cZhGmvoWlBrjlqHbTJy+OT8tdjdn
	/YOWa1IKjr8EmEL0h2S2hgtFNlHG+nXHCtxjQJ0GrjkAg6N/2UnrwdcgzTco7gDJemTePps7trcj9
	YkF4hGhH0HwLBMOdPtwhgh7JTwJRf2KGhq+GWF2Y/yu3lGKwWbCwiLuQXprdikGxZGx8NtB7+iI+Z
	4+3oub1adBnHXgBA456AfOWXIB/09xNLcMrsTM3kRbSbY2eBJInhKf4Q795yGgG8afcx4DPyaz5Yx
	VX1gTcCgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRY2-002osp-U4; Fri, 16 Apr 2021 16:42:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWr-002obY-A2
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:41:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=q9pozfVOg+w2yPK6oVL3TgBUt4Buw/Zfb6b1gwkYvZE=; b=0CoLiV45WjZwrdUx6mVAZDZYGR
 N5iM5/4FErgh75RP+EwsH3lIrMH2rEmRlnJ+RqGrQy2d2WUc4mOyHTUKeRAu2XLXDBtZ11NBqw3D0
 lT+NlINifzitOh2ZPB2fNMHDfwIZJ+hlX7UhYvcIad8JUODPxXM+9tnZ8FGQYzfGxoWQion7z/vJD
 AEJJQHXfJR71bBZbRDFznjaAu8QU2s4kmffssBFNzbN7stqYM6hTb3LiBUMGakTP6pTwrn1T4fen7
 nlFJYFy1/PVNaCMpunmAD3ahW7uVv9hgY0+0+aNLWuYA5/CZph9Lt1wkqSdq8grKOnEDFqXMkwTUs
 LynnJqOg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWl-009YyR-M5
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:41:12 +0000
Received: by mail-pl1-x630.google.com with SMTP id u15so5729371plf.10
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q9pozfVOg+w2yPK6oVL3TgBUt4Buw/Zfb6b1gwkYvZE=;
 b=Q7Bemqlhot8j7D1/Cm3Gs/uVOBYrRvQkQdCoWAhYCFQ9jaSu4BfzJQnUKNFTaRhPKk
 y5/PmgzDgKCTlqKIIHgs+r21Tf8T26UlLfV5y5635z+RNN3R4UzUqi2rCnR0BuMRxD3y
 Gr68s85lN1H1Z8ZERZzO9JXL6R5BoCzngoUyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q9pozfVOg+w2yPK6oVL3TgBUt4Buw/Zfb6b1gwkYvZE=;
 b=GWMo813wJ5hBcdzg4iPuA0ntFdSklIqJZ/XuvkP2wCry+rN8LwghB2ngtw1xhBYwrG
 FAp2aDHS1THl53GCP5TnT72hH0ZQWlX/1zowJ17UV4/hTRHKh77kk8iAqDDW6PUTmeMG
 4mAajw1RipdUV1uGKXa6A0wF0OZOcSx+KcDWjYVp32eceIT3YQmmKXmQVyG5f/xjeVER
 KxP3S5+CyuYfUObixeXg0gtwUMDDnU0b81Y/P0apSGi6SmPU4D0t76mwvREd7yxdFta2
 8+pGErB2dXh5YXHzcneUStKznMBoZgUyIllH/gBkCQgH3M3CQx6aR1TZgsfboJoie5EQ
 89aA==
X-Gm-Message-State: AOAM530aZ6NOJAnap42XtTKKnPvH+b+vu6AnOjrf6D1D0w8JHIQKCnTL
 KHhNW9G26ydRX47BrVaBZ9H4EA==
X-Google-Smtp-Source: ABdhPJy6g24ppchac1Gu6Rxw7HpwbDX6ILuD3CgG1e/lsWborJqP+sxh9RaxdhENz650nGxRBWHmFQ==
X-Received: by 2002:a17:902:ec84:b029:ea:b28d:e53e with SMTP id
 x4-20020a170902ec84b02900eab28de53emr10072302plg.77.1618591267200; 
 Fri, 16 Apr 2021 09:41:07 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ccd5:218f:365:b90f])
 by smtp.gmail.com with ESMTPSA id g14sm6187186pjh.28.2021.04.16.09.41.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:41:06 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 5/8] arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
Date: Sat, 17 Apr 2021 00:40:52 +0800
Message-Id: <20210416164055.3223088-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416164055.3223088-1-hsinyi@chromium.org>
References: <20210416164055.3223088-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094107_738495_6B206272 
X-CRM114-Status: GOOD (  12.76  )
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
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
