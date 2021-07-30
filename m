Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB360C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:10:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB9A60C41
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 12:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7BB9A60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bi0LX0s8KZF2AjGQCt7QpR0DrMG2WSESpQXmHHXzUVo=; b=Hk80G+0lqKMnar
	NKcMc5Wvjuv4WIBbJYu+Rlh9lvQhehT3RagJtejWMXDjTInrpWy5ljLuXIJCibrDsw+UPyepe0s6i
	dSXVL3/wK4+5FmMAWVoDsfCcbtHuA+mcNtu0b7DL19FtviC9xBj+v/iS/1/oM0TMQJYCz6Ncn+BGF
	9nbKCnITs2RBqpj4RxqUloPMPbwZAOCyrrsIKJr8EHXdLL/nGVHM6HNi6QV+EEe+Rc2QtVJ4uUwvl
	gqIrnOIdtwZZMl8nhLYqxEk5euawP/1VgauIbKHGmaqQUNoyVLTn+lkAj2IuC17eLxseE1sPpt2QJ
	uGEPQFeJf2m+N0xX61zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9RLJ-008VhC-DL; Fri, 30 Jul 2021 12:10:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9RKn-008VWn-4B
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 12:09:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d1so10868579pll.1
 for <linux-mediatek@lists.infradead.org>; Fri, 30 Jul 2021 05:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
 b=QRJz5lVdjRsvWISh2iV2BSbzouh75mPkyhUJhTIBAgiabqTwhFKu2CNTn5uW1GSAbF
 PIdyIdyddC137sV65D8pSc7pAtBLyB0FehzbL5Iq9nXGn6QEJZPbdQPD53BKfiv38HcX
 GfB0hSiNCUrRywKrRFHSFvA72qqnDuemCUmy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
 b=pqRJU/js7BM1eoknUcqAg/aFDMqXyi3G86ap5Rqrjg17XKShM79Gw6Rgikar5ho0JS
 kJpbNeDLy5RJALK6sHEPUUB5tlZP5JgIPYFLXmcsR0RqTjb3qu9uP0hImWYIEkC+dLzj
 9BEK834Gm4rI7r/gRUG2d0Gxr8N0gM9kd2jhE+1zTQvV0txDOKK++VSXdHdWgsRmi7tV
 QmPUJIJbW6ClLx5RCZd67phOVMP74DZH93diDJGfTTvi3yDOEGoAaEd4QRbbOZ9l9AcW
 0sfxUXg3xW6WVF1qKZHYna9s0PhRT959R0t7ZENFlKzywjd3eSlELEzAUahrqU/6TBNb
 QGYg==
X-Gm-Message-State: AOAM530lOXUusnohuEA28H8qsJH9O7Zn/g5d2oErlRcqO9x9J66AZ2Ut
 gbfe/2rFtdIPsBOFhuW6YAsDqw==
X-Google-Smtp-Source: ABdhPJwYYlJ/bHg3Ia2iSzowLObpVO3bMpgvCuXtEZnF/wZSyLvxIbXfeCaP4TVBTVk2ugT6ZnFGyg==
X-Received: by 2002:a05:6a00:124b:b029:358:fcd2:fa37 with SMTP id
 u11-20020a056a00124bb0290358fcd2fa37mr2597130pfi.35.1627646988084; 
 Fri, 30 Jul 2021 05:09:48 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c144:3a3e:e06f:59])
 by smtp.gmail.com with ESMTPSA id a9sm2182071pjs.32.2021.07.30.05.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 05:09:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] arm: dts: mt8183: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Fri, 30 Jul 2021 20:09:36 +0800
Message-Id: <20210730120937.1435204-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730120937.1435204-1-hsinyi@chromium.org>
References: <20210730120937.1435204-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_050949_252734_E0B7CE39 
X-CRM114-Status: GOOD (  10.85  )
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

Move mt8183-pinfunc.h into include/dt-bindings/pinctrl so that we can
include it in yaml examples.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                        | 2 +-
 .../mediatek => include/dt-bindings/pinctrl}/mt8183-pinfunc.h   | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {arch/arm64/boot/dts/mediatek => include/dt-bindings/pinctrl}/mt8183-pinfunc.h (100%)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c088..1933045da95de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -14,7 +14,7 @@
 #include <dt-bindings/reset-controller/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
-#include "mt8183-pinfunc.h"
+#include <dt-bindings/pinctrl/mt8183-pinfunc.h>
 
 / {
 	compatible = "mediatek,mt8183";
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h b/include/dt-bindings/pinctrl/mt8183-pinfunc.h
similarity index 100%
rename from arch/arm64/boot/dts/mediatek/mt8183-pinfunc.h
rename to include/dt-bindings/pinctrl/mt8183-pinfunc.h
-- 
2.32.0.554.ge1b32706d8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
