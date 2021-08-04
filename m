Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83ADC4320A
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 04:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A615061029
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 04:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A615061029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GlDQ7SwhZaQbrYQQ9pY3mCHIK9BGUmvjKexQQNCE+5k=; b=A8JdwEpGO26jfS
	x9UK4/z9Yj6jjPKsigLXSVtcu4GDEcrNMUQgVEDn6qrHUP83CellmKXf5jy+fC4S0gs+DBYZpnn/U
	rKNUZnLaPNvNs1Nqv+ACCHiewsH4cy3xdYKHCMsUnTrK7Ep8hOpW2vVXDF+YtHM2AXuWYqzM58ZUF
	cUHNkINt9o17Tearw8S8bSSzIJ/FvCgA5hdFH8kqQhuY6OWbOKv4EjsyjlJ346BMmpurEM1vLY7lH
	XC10xRQg29a0cLyUBoRQ6LlcywpI7y1imuJCPGm7AMHMOzI8t3SvmbfF4p2v8ElIU30LVwilgpvzL
	5o2FgbxOlkb+cnA2OKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB8ht-004mxw-8S; Wed, 04 Aug 2021 04:40:41 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB8hq-004mwj-Ea
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 04:40:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 g23-20020a17090a5797b02901765d605e14so1823851pji.5
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Aug 2021 21:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
 b=C6y5SxeHxcQPbiYJNEuZUOdXAMN0f3Xc8xH9Ygbn/hNDSn14ghCz0sGQpITHos0BQa
 JrE3C1CglA2pwcaHfx7/EB6VvB87KaT0YahU+WcFsOJAhonOJmDG0QEomSkc79ULEe47
 N4E2PLpRaZTHaXuiPsG2pcdkhjy2EjYudYnaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9jhmmW00U1t6nu8Et2gPe9VWIRq7R6Jr8Ar5v9ZMFtg=;
 b=qi1XEgo1j11nUqwQmppmLdnNr5w0EeF3GWbKapya0iJaQ3RyJLyTCguWjKxzBapDRG
 P3vXPlUWa6cbykf428ljVxq0jPDOEckpXDK+8dlLOOb11+hBfG9UhSQxBSuTgc85QiNy
 sxFRlnDe7jzRAvudPAw1vuN1ugU/hQNA6W79dnTEaJgvf3h5PlaLhzkzeBTbElTLgDxf
 6GLPx3jf0V+qnqNJfx4HFG1urjj1UT4q1oSQgMQZe1K5jlRQ4f11dML4onC106ftoVde
 9hl0Fjq3vHyRx5n2rK44R8eJQE17I/jYy8ozUKv22tfbV8Kpe41yIsBS4CraJ1E8L9AM
 YI1w==
X-Gm-Message-State: AOAM531HTwjC/i9A/j9JhPwQ0mtvxvw1RLoVM85+chfFs+gOv8dfY4RS
 VgZbMntpLE0TRJyt0JQMNpKqqg==
X-Google-Smtp-Source: ABdhPJwRCZNNwOft/vBDSjHy8F7s60+dQbATz9EE8dK0AkmsFjq5q4WBV9dh1tP917W4u9TI2KWUaA==
X-Received: by 2002:a05:6a00:a18:b029:382:e172:653e with SMTP id
 p24-20020a056a000a18b0290382e172653emr25615508pfh.19.1628052037658; 
 Tue, 03 Aug 2021 21:40:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6fea:f7c3:8233:dc51])
 by smtp.gmail.com with ESMTPSA id t9sm1075355pgc.81.2021.08.03.21.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 21:40:37 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] arm: dts: mt8135: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Wed,  4 Aug 2021 12:40:31 +0800
Message-Id: <20210804044033.3047296-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_214038_549343_2C4E8667 
X-CRM114-Status: GOOD (  10.46  )
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
