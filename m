Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B38EC11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 14:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 194316142C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 14:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 194316142C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAxsQ/4Irw7AKU8zInzVG3u0zroTZusfEN7LFQKZsgs=; b=JTdQ7hf3vsumer
	4sxb6CzvQCxL39L9QgXz0bRZ2QD2BxxvmDZm9Y1jUL7x286uNPm2BrATpU8AjDlAgxmOb3TpZuU8k
	nqtUKXYfvGDpy3tYjItWpHkITxekPj78Mwzc9ghfi1ne4waCpdC/KgdmvrsixxxIpGrTkVr2mspj7
	PIj/cXKgqJN/zPkRqaAoXT9CoWu74L5Hkzf3nC5iHMYzTVk5NtgaWSO/q1zfjfBXgP4p7h0h157Tf
	foyyBJPFy0EHdFOlXHpuZMPQO0E/zWhcW+TPc4OFASUJd5Q44GqqogKpP0xp1drD5BNEfoTm5KKuX
	EAcF+Xq+1AU3Mz5uSjSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lybem-00EWJM-Ep; Wed, 30 Jun 2021 14:57:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lybUQ-00ESos-OG; Wed, 30 Jun 2021 14:47:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 0CF001F435F0
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: jitao.shi@mediatek.com, chunkuang.hu@kernel.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, eizan@chromium.org, kernel@collabora.com,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Crystal Guo <crystal.guo@mediatek.com>, Guenter Roeck <linux@roeck-us.net>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/6] arm64: dts: mediatek: Move reset controller constants
 into common location
Date: Wed, 30 Jun 2021 16:46:41 +0200
Message-Id: <20210630164623.1.I514d9aafff3a062f751b37d3fea7402f67595b86@changeid>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210630144646.868702-1-enric.balletbo@collabora.com>
References: <20210630144646.868702-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_074700_615970_F4E6A958 
X-CRM114-Status: UNSURE (   8.87  )
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

The DT binding includes for reset controllers are located in
include/dt-bindings/reset/. Move the Mediatek reset constants in there.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8183.dtsi                        | 2 +-
 include/dt-bindings/{reset-controller => reset}/mt2712-resets.h | 0
 include/dt-bindings/{reset-controller => reset}/mt8183-resets.h | 0
 include/dt-bindings/{reset-controller => reset}/mt8192-resets.h | 0
 4 files changed, 1 insertion(+), 1 deletion(-)
 rename include/dt-bindings/{reset-controller => reset}/mt2712-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8183-resets.h (100%)
 rename include/dt-bindings/{reset-controller => reset}/mt8192-resets.h (100%)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 27b4947b609f..085e2c96b5f4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -11,7 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/memory/mt8183-larb-port.h>
 #include <dt-bindings/power/mt8183-power.h>
-#include <dt-bindings/reset-controller/mt8183-resets.h>
+#include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
 #include "mt8183-pinfunc.h"
diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset/mt2712-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt2712-resets.h
rename to include/dt-bindings/reset/mt2712-resets.h
diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset/mt8183-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt8183-resets.h
rename to include/dt-bindings/reset/mt8183-resets.h
diff --git a/include/dt-bindings/reset-controller/mt8192-resets.h b/include/dt-bindings/reset/mt8192-resets.h
similarity index 100%
rename from include/dt-bindings/reset-controller/mt8192-resets.h
rename to include/dt-bindings/reset/mt8192-resets.h
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
