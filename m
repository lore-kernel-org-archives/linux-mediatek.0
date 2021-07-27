Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFA6C4320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1714761155
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1714761155
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kMqyCiK9dz+7YpManfkcSoqO1Ex2GorWMRjaSCdTpME=; b=fsSpPVQiXWyxMj
	p7/cOhL8EaVU87S+q7XJVTfHq8O4qxKHSzyF5QWgcsZ2Yv1gIUUPgG6qMeEmpOFlTYIgX/a6Zm66D
	98XAGkXi28qqsKJAD2mfO9V2b7nBgVEIf1LIpIJw9cd4Q33Y59tDxmaMlEcW2SkAG9/eY5j76GEm4
	sue7OJQeQwpITb+9G+koQBMj+MHfVvqxxGZ77D6/2lNotmk3hOLTMmAFNJeOFHBIhNtvEmN/jzSA6
	0XHEPpnxYGBy5l4ytZ99t9AGbP1yOSGGnf+UKJl7vMLw1M5HGo8OzM5RUBCMXEPNCnsduhHB1PraC
	ucNJddxlKQaccCzQq8LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8KrG-00EXfN-Mc; Tue, 27 Jul 2021 11:02:46 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8KrE-00EXeH-75
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 11:02:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d17so15292462plh.10
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62cZorY/aqW6/nmoaXLGfSvBqflphL+XPQS97Zl3weY=;
 b=MilN6BFgMUc1fMRsL+GBnviiIuEZq41bfDVDgnvImZKTDMjr+zw0G+VGHf1XFX08nn
 TT3D8wraoknyERJ3meYs2GBWmJ/Q2RrEd4V06SMX1L35VPKo3Qz6+BodoZoirVyjPaJS
 lWLw0puHNt3DSLcI/H3lXrvY6Jx04cvy3+Guk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62cZorY/aqW6/nmoaXLGfSvBqflphL+XPQS97Zl3weY=;
 b=sYokkxUD6ieHJy3ZsWxtkeO97eYkYOMtIKKFo9CmUoL2pY8SaQttkjVexjJBMTb3Pu
 7EZwzfytGuO6SUcF7YpK3EV+qb4H5cVF4bXKQVYhf21i8SNKtiPhCCgf01/ZuyCo87aq
 aE/eJln4YgwBquEaaHYgVLjsPb+ILdcF7GgDxyQxEZ6SlwuWLMQDnVWk8dl1GOtMo2hQ
 YeCp+fR7C3xpnpDIKESQWHuvdHrFiwn9aqFSTpNtMID9AEP6WgFE/ZhUq4QaZ6DHlIBj
 cz9PmbycCmGCyw2I4mFzCvtewr5eYDNLaPWC8QPmyAVB+/ho6h7hia9T2zHG+8AgQV8w
 Qz3Q==
X-Gm-Message-State: AOAM53225kLjo6N/MGT/t8KVA1InetGr9+xXE5qcSNkvPSGc+qFF83mr
 W8arSDSUgykpt/5wow+Fi42F9A==
X-Google-Smtp-Source: ABdhPJxnSDI/sZWXmp6xkjw+XlVjQ4cwPwMrjvLXbVayACXXDVyNSipETcDQM0Ui9jBlYDCJBXsBag==
X-Received: by 2002:a17:90b:1195:: with SMTP id
 gk21mr21705514pjb.150.1627383762744; 
 Tue, 27 Jul 2021 04:02:42 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id 33sm3553683pgs.59.2021.07.27.04.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:02:42 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Tue, 27 Jul 2021 19:02:30 +0800
Message-Id: <20210727110232.2503763-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_040244_322011_9B3F626A 
X-CRM114-Status: GOOD (  10.51  )
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
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
