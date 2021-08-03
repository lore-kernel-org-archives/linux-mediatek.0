Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC954C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:13:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA25760FC2
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA25760FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GlDQ7SwhZaQbrYQQ9pY3mCHIK9BGUmvjKexQQNCE+5k=; b=QAyJPpGUdTTHix
	1LApLGp1w6gcpjLL0uTS6uir8OXcbSLMJKaVkp4SiHrwHKcLpeucwu05SdqAZVHxwdRB1k22LhgYS
	l9acMguQEie853wS5cdhFkWaUCu964TLpi218TUlJvfTNRQ19tu9vWxZ/Hv5XpIpkRYeZNZiWKHQO
	muEDOZM4d75CIEUFkx4+ffA69VTx5qXrSHfvadjJUCmywNrKw5NBatuUi5sYel/IZRN18IT2MyBAd
	wdp/7l9/A1CXaBNW3NG8yQ0yKIwL198Ynnb4eGGX3leiJw2SC329aLwSZArHqMu7KhYAOp1LuW9Yl
	N7tqZ6hFZUP9ZYu1Qcpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAmkD-0019HG-MU; Tue, 03 Aug 2021 05:13:37 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAmk7-0019Ef-TL
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 05:13:35 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 s22-20020a17090a1c16b0290177caeba067so2297928pjs.0
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 22:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
 b=RoS1gW+/fNn3RB/dhB7nzScfvJQQsbjLIhYDsYTl4X0jCg/h6AdY/6PJ2cal4rof+Q
 97up+1FPQ2T64Co6AQXQiG1sD2aLoBpYSklNlcXon3aybN5XRHDKLLLG/mVlgPkBLdmy
 9OU0BiUeS5WVY1Zr85FSYBPV0B/PsMOTUCUFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
 b=RhrMkSiIvpx+CriTMtKfGET9BIXUkqJI1cnXab71FUDjaud5MLGxDmDHpdCNpGmB0A
 ODCY6kHSUCWzZOJ8xHn1iN4Z/HxBNn1ualvPulPe6WhVvjfEjrU8GcET20q/2dBE65k8
 AMfPtKcZ2nDCOEkwx97ekq6HN3RKnunoIOjtQ4QiC2bBhBklVT3J4Z0q92bDXMrOEQzV
 a9bkyW6VlLQd6n3KNyjeoo/J5m9ods+Jw3t2o4Ahle1cD6rJnYijRRPLas0yu26dErbk
 S3zjf6YWAPeys14oe22ez9vVd0O6qfMkFigfq5CwEnJnlvRuYNRW0uTe9E6vdjAnDl2c
 JmEg==
X-Gm-Message-State: AOAM531N5QQCIhpI1d6Ippi2HTRTEmio2ZUUvRIhZ8pHmquCSuLMuG5F
 E6wwpSwUlnv4kFtUuQGXx7/qsQ==
X-Google-Smtp-Source: ABdhPJwXpzsjl4OXSLsWVSfF8lTblrp6AM92riWciamL69PeJ7AqgmVERsB7T488R7e4C4w22/Mp9A==
X-Received: by 2002:a17:90b:1d8c:: with SMTP id
 pf12mr2499451pjb.130.1627967610468; 
 Mon, 02 Aug 2021 22:13:30 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c800:1b1d:5677:31a7])
 by smtp.gmail.com with ESMTPSA id x25sm115732pfq.28.2021.08.02.22.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 22:13:30 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Tue,  3 Aug 2021 13:13:16 +0800
Message-Id: <20210803051318.2570994-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_221332_027410_930E77E8 
X-CRM114-Status: GOOD (  10.65  )
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

Move mt8135-pinfunc.h into include/dt-bindings/pinctrl so that we can
include it in yaml examples.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm/boot/dts/mt8135.dtsi                                   | 2 +-
 .../boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {arch/arm/boot/dts => include/dt-bindings/pinctrl}/mt8135-pinfunc.h (100%)

diff --git a/arch/arm/boot/dts/mt8135.dtsi b/arch/arm/boot/dts/mt8135.dtsi
index 0e4e835026db0..a031b36363187 100644
--- a/arch/arm/boot/dts/mt8135.dtsi
+++ b/arch/arm/boot/dts/mt8135.dtsi
@@ -9,7 +9,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/mt8135-resets.h>
-#include "mt8135-pinfunc.h"
+#include <dt-bindings/pinctrl/mt8135-pinfunc.h>
 
 / {
 	#address-cells = <2>;
diff --git a/arch/arm/boot/dts/mt8135-pinfunc.h b/include/dt-bindings/pinctrl/mt8135-pinfunc.h
similarity index 100%
rename from arch/arm/boot/dts/mt8135-pinfunc.h
rename to include/dt-bindings/pinctrl/mt8135-pinfunc.h
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
