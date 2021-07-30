Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC90C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADA6E61042
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ADA6E61042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GlDQ7SwhZaQbrYQQ9pY3mCHIK9BGUmvjKexQQNCE+5k=; b=K5v1N7Vqz9KAlm
	jF4L2rHgW/irukCLK1d5rQ6NdVIgezoCv1farjQC5h3C0fgiMuplWO8IujT+7LuGd1agFzqph1HC7
	BCZHabjYTn6qAw985ZI875OVZn03OpS7Y0ICe3ry8QUChgVvbk8VND6Ad2+0gwq+ueB2egFyVShlO
	X5sQX1OFTD6Fh7Rj8onUWFmaLCgt4LjUwC2nJWpm14dLr8QM2GBXNN0zWw4icW3m8r+mwRoeJbjOz
	NDBKgRKflY2LApowWCCxPhGnNmXpITnbV4WFMCakYuNVNPSpbgCb4G0/SWjnZvrZnpgjSQdaY07jf
	we2Xm+ibZ531U+oJCoXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9RL3-008VcE-52; Fri, 30 Jul 2021 12:10:05 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9RKk-008VVd-Uw
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 12:09:48 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 ds11-20020a17090b08cbb0290172f971883bso20515471pjb.1
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 05:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
 b=VgT+e2A0IF77HhCmq2v6gbviN4IFKA14+DyHg8G0xXNc0t531MsdMsNgKTJhiUViYc
 ggx33OQt6gRHAzv/ahTT5A6vhoFV36OjYD4WTGda6NKOqY8jeXrwa6D+n3QeM+2d9vxi
 aKgXY76W0OMXpUKyeu4ztuhnxxFUYijR1+F6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
 b=jwFCJUqGagkb1orhT4wMm8XbLvaOpRo5d7x6sc7B09xFcbQ6trDfVevIFSUfM4rvPt
 71sx83me04uRF6eNsRUi5YBI5ypS7P3/RGF27UQVZrpGfcF8zGdQYdxHEUW/nl2V1mht
 OcRTdCN6YXnRMv+/LzlAoc7NDQkKyDl+O2TwwqVSCTsHSB7cqnxNPyZAN8alQ8m8b5O5
 dXRaB5ezfrA0XE8Z0riQu7aPcv+VjvSg1L+R9lxtekqIN+rQ85P+LQb6/KRV+AErIBVM
 /48sMHBdlbgKZ2Gt0O8KeBxxK7U0gmcS23bzoDPauoK+zXBpaYSE607as2QyPI0hSYb1
 VoEQ==
X-Gm-Message-State: AOAM533t8VRInbkNyvHykSQGOj8nTzCD5DeTl6hdmoEZp+BO6fnT2sUQ
 tIQWGxC2BcDX51lHsPPLbIS4uQ==
X-Google-Smtp-Source: ABdhPJyUiLCxqCC6f1d5CYwKUP8Qk7BYcm75N+d9XbtZsZfdM08Fxck+IkBKHdeny9OLqapp+4YTTQ==
X-Received: by 2002:a62:8f0b:0:b029:356:ba53:a041 with SMTP id
 n11-20020a628f0b0000b0290356ba53a041mr2443083pfd.10.1627646985133; 
 Fri, 30 Jul 2021 05:09:45 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c144:3a3e:e06f:59])
 by smtp.gmail.com with ESMTPSA id a9sm2182071pjs.32.2021.07.30.05.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 05:09:44 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Fri, 30 Jul 2021 20:09:35 +0800
Message-Id: <20210730120937.1435204-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_050947_089190_36212689 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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
