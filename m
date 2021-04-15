Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28C2C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3105461158
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3105461158
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bA+q6Raf59eaYjennlN3jwSjsSyKKvF5f3GwAnWAVWs=; b=VR4Cxl9Gwr2LdYLOKramNJuZ1
	wmVLr4cRJi1TRnfmKcHbXYxNsf5ikzlo92Lr6odU8tXxwLNyp4Zz4KWZ3/aA6/uUhtCLNKGYMzk7+
	6OuEr6mkI+C05JYQpiJ68uRqDPEJ47+LoLxFH6R87AsDbLaHgG34DahtdGPxWuhu04ousIrHpRuVj
	Yjum8HRkk+3bDGm2TKPamMO1PvhPirJy/6u8FfLNDnOV4dIRrIiAyjA/6BhZKZ1gsl9dSyzrsWohb
	K0398xaiUY2OG7rbtX+c/KxRqGj+e6mLYbupEpyk5lxOuPz6HaW8eykWpdW4mnKl31VB9JuYwbpuq
	vyCeaHlxA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyQU-00FY0P-BH; Thu, 15 Apr 2021 09:36:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPP-00FXi9-LR
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wMjBnZVcviRSoI/fJCL0g5fel6FhaOBmtY6DkO6xXxY=; b=nWc8jDehGZHa0cC+MQ8IFTkloj
 5g/iffZz5fQoBxcTUJ9qYfCY6FrbVzkTn8qlPuq/C+3m/I+CCaz7ooK+YgG6TX1TnDXkKZG/K+ooT
 H4kxxPH3EaOtb282HZNOOJoyoiVFOcr/fV21YCPspaeMCfa03WNLgoFCFh4up79OkYbI8n5ckk+h+
 oo9u8OtGlesB4ca9NpNb34KMvUQ20Qx+UWicXDdP9aMNS1QZN9AH4qUcIwoP/3V9ROK1OquXUiMRX
 XiowKk2tJrxF/o0SEuJiTSeFG4EPFLPbPikkjywguM7UYBXELyvw/wHDad4a67u8R8U3lhNsHdQi+
 sZcpiB7Q==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyPM-008Qjl-L7
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:35:34 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 u14-20020a17090a1f0eb029014e38011b09so7543009pja.5
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wMjBnZVcviRSoI/fJCL0g5fel6FhaOBmtY6DkO6xXxY=;
 b=h7u0EG2oQomUTpNXieEyKJqrlltD5arbBXhy5eiszP06AOd2iO8qgA0l8phkMady0h
 RXy9ualjzfyUH1mVHjK6sWlRVzvyQzyz7FMmZOYklSvBZxeYa553SWRx6gDBlrF9QclM
 yaWAoKzrqK9iHo82ft0OdCffwP+vbZ3wyjwEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wMjBnZVcviRSoI/fJCL0g5fel6FhaOBmtY6DkO6xXxY=;
 b=inIFuhwYtjc1fDo/Pr6IqFNTI47BblMPrx3V01SFnxUIlwYiH32rGjFNGWl31C7qKC
 bPCesB7GYDa64gBqguEmZ79Fc1s0sXPzaA0efY2b0sOB1D7N51UXjqkzZulZ+hkC9imb
 QNkeFb//CGOhoXelBcvPe58cPdPgsCryP1zAiqYhPg+qYRuP+8FoJbvIL1+h0he04HyA
 ZLM7pqGVSSA/RtZqQDGvScmO1lcRnRJC7WOCrRm+w/G/nkLauhPZjiwlqzebOE+MbiY8
 TebsL8K++u2JN+HCCi/4Y+oYBxFMSz/DAdq+X8fTimRrUYTpaE5DLPGNvj8v9b2eNnec
 YRgw==
X-Gm-Message-State: AOAM5316j5AkCFOCZ/2LpCOpfM3dQusSPJiPBy1mqcCMxj3TO2WmfbT/
 02dq5iWKdEMIFeH7pFAXp0YlYQ==
X-Google-Smtp-Source: ABdhPJwKP4wSfoYB0NTaL8DCzzFiEbrj1tlgDGva13KPsgrDRbYyepCR8GYmJblM/4ysaLF0o+vdZQ==
X-Received: by 2002:a17:90a:f2cd:: with SMTP id
 gt13mr2815027pjb.43.1618479332053; 
 Thu, 15 Apr 2021 02:35:32 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6432:a6cb:91d2:5e32])
 by smtp.gmail.com with ESMTPSA id a13sm1849502pgm.43.2021.04.15.02.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:35:31 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 5/8] arm64: dts: mt8183: Add kukui-jacuzzi-kappa board
Date: Thu, 15 Apr 2021 17:35:16 +0800
Message-Id: <20210415093519.1920877-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210415093519.1920877-1-hsinyi@chromium.org>
References: <20210415093519.1920877-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_023532_708887_53A7D704 
X-CRM114-Status: GOOD (  13.47  )
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
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
