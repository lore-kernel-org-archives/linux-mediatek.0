Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E6FC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 04:41:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA8CB60EFD
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 04:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA8CB60EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bi0LX0s8KZF2AjGQCt7QpR0DrMG2WSESpQXmHHXzUVo=; b=lY9TLUmnBEICiy
	WXX/P06F/GClIJAo5+9GBspLrodIByW3HA8gAVRpqObTnzWYOMWtoYxlLTzvHLupbwnOR+HoMWjlZ
	74YNB5EdvkUE+w23b+elydptBSSzCEQGzR1evWBB2h0M623JrxCTotzzsvfpTg/3HyxJFt1pQ7gJ8
	pAqxTYWiZKqJI2JbythSjiCnkr2ww6h2ZzebdZqhOIlzJ8K1JhQ+e8KBpf4vQ9QvaeROub7NvHutw
	0Ptf5R49iMPZ+zqqZwTDgzhMfeVMLFbU370h2afNvtcYnXQIIa0205eq8xAOHg3GMYNn+3s/0C9dV
	mM/dxBrz9zPWCbwdb4fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB8iG-004n4J-Lm; Wed, 04 Aug 2021 04:41:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB8ht-004mxt-F1
 for linux-mediatek@lists.infradead.org; Wed, 04 Aug 2021 04:40:42 +0000
Received: by mail-pl1-x631.google.com with SMTP id k2so1624664plk.13
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Aug 2021 21:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
 b=UX/UnOCuyTy3v0EXWLKoH7U8OPmiSc7yDpkVnsooOzcdNs1JtQ8bqMip4c0QiCTz4J
 3d17+yVN+tI+xJuUOin0E6/AhuuqqCwUpcvPim+x/pZ5zGNQHbK3mbWnNOEZGua1IVB3
 hQVtMuMxAv9QD8xQ1hzQWJaNjmNO/QmmwzuqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
 b=BJBSE9AmDzWeOhjifk4SujBadNo+V0TskTaOCnRPZx5JcgB0yT6jKfFATGZ4LWCEsL
 qmys4xkRoAxpYo696VcqQ1B0wE+fBxQiQs62FZr7RqkkbusrrKJeU+9itYALeEOxalQf
 M9zEJcoxAI8rxbU0TQ7g1bEcVVpJARz4BLyY5hUw/uMM83Y3ECGNBdZHPpVstNAmKiM2
 p0avqkcBubGn2VhhjclDoLB5z70r5WpZ32MgNr23XwQBktIWKJ46goGLoKZGyHinQG+A
 FqxXzFm0xKcpWRUGX1lQOx1ESZ0GBIEJcfr1qpyWVpSRjXv215Ot6UPjfO19kBxpA6SZ
 e34Q==
X-Gm-Message-State: AOAM532xUxZeBbPGAHdAqfcK454MgbGJV5Dc+v+hZw9aX9lmqdTk/0oo
 i+cIEX8hqK2RX1hQIbULV5/s0g==
X-Google-Smtp-Source: ABdhPJzu19nFqHAGY81WXc9rtIkcm7bpgnmaMZ5pk54JQzeoIfqI2plg+3Fu2VljFyZVRq6bHTRChg==
X-Received: by 2002:a17:90a:e647:: with SMTP id
 ep7mr7909438pjb.145.1628052040736; 
 Tue, 03 Aug 2021 21:40:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:6fea:f7c3:8233:dc51])
 by smtp.gmail.com with ESMTPSA id t9sm1075355pgc.81.2021.08.03.21.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 21:40:40 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] arm: dts: mt8183: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Wed,  4 Aug 2021 12:40:32 +0800
Message-Id: <20210804044033.3047296-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210804044033.3047296-1-hsinyi@chromium.org>
References: <20210804044033.3047296-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_214041_546195_777A4DC6 
X-CRM114-Status: GOOD (  11.33  )
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
