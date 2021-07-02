Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F6FEC11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35E6A613D2
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35E6A613D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/JZXUW5+JP21iSZ8qgzbn9Jk+OnXjidPdiyvfI0A2Y=; b=JM22vaL0ArT5gs
	bsjvZn53daXfNJQNlQmJt7gSkOgFD/z+EXh74tmuuQHKklCG3YWVipK9khfcghEWm11viJET9Grzh
	+4Rk3DAYL/cVY5nroA6rWMeMxoG+dytkXiX76zILR4ZbNkcwAyItoA2FBYOjD4Wa1GdKNx4UTpQc1
	9JX5Q1FIN4V0AamMWv/eenDIzZ3nd0fiqaXVna7HvAnLh5z9acqGNQK6PdZBKPH94hRRmzYUjjWET
	hl9WDYXNXQMDZHJk5hafnC+kFQh5tZGjmD8z5oy5oNr0POmndYxk2Fj+qUvLtRjx6cvitdCRPwl9X
	aYUlqztIaLwzhoNbWAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJT6-0039P3-B5; Fri, 02 Jul 2021 13:44:32 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJS3-00393g-U0
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 13:43:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso9111408wmh.4
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEhU8Um5f0JiN5UeHBJI5GyHDmhvUyYTxNlEBkR3UOo=;
 b=Olhx4UlCuIfRvcxRt/0zqVPZpQnQBNItBR/JKERv+Eev5CLysDIlTi2lcWT6kpawpK
 x4pfq3AcH7YHbC2ZTTdraCay59JnayrekmOCc0cCcIeD7fjGqlx2xLsxOx9Krx1l6KY8
 6kvCL5XcrRNOdqUoApmmPUUtebmR41JiiBlnnVFPeB/sY86Hhbun+gEZgyq0br9EXPS7
 dI8YRus3MYM3+Xsn8UPe0JQqN5Qspc1iExCcbKHHNVakYOe4m0OLpD5+kqXk4Plr+4n+
 9+ApgSFKmBEcpYkbN8qJZohcCL2+1yx5ZjENIwqKds/9oaV0casBgsmQMXtnD8QQWPx8
 sGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEhU8Um5f0JiN5UeHBJI5GyHDmhvUyYTxNlEBkR3UOo=;
 b=NpbYvHsUxR7kFsNDj+9LgT1fCVQtiN3TjZdRbw9+yqUdfyw1cdWQMkBUlvV2H473I4
 cs42eWAxNBCdLXbI6yu420HeEs6RdRKi2R/5PtALcloHLhfyfhy4xCVXxBwIO+JU1oXT
 1MorhN1WycGX5IonO/TqdslD17izbwtZtz6hUuNDg+ca4OLmcu37XF5BLvUcZClwY7Pb
 lzaD8kOpd2e/N05cFo9HBACsJOmcM2q6R2hxmqPWZ89AUV6q7UH7X9v0rOyKtb2v9lhz
 mgGRPdkWgrPxPmEfkadFfegczLkXEffWMKQO5VpU7BQFWNMi7gHuyDAB25foSgNLOlKx
 oE5Q==
X-Gm-Message-State: AOAM5304gDsTox+cRTgAlITA82p9kZ2fMxkwt0UBvTi4V2L1x8XLA+WV
 xktR6rtxfY89JVHS3pHpW8VsQQ==
X-Google-Smtp-Source: ABdhPJwnStGuaizhehaJ7yHxKMwHfg61nZmXZITfuPGPqNtQIfKaLtBLZH0EDnMdLDGsESkAkkkrww==
X-Received: by 2002:a05:600c:1c8f:: with SMTP id
 k15mr5646909wms.91.1625233406190; 
 Fri, 02 Jul 2021 06:43:26 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
 by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:43:25 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v3 4/4] arm64: dts: mt6358: add mt6358-keys node
Date: Fri,  2 Jul 2021 15:43:10 +0200
Message-Id: <20210702134310.3451560-5-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_064328_023281_60C54DE6 
X-CRM114-Status: GOOD (  11.00  )
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

This enables the power,home keys on MediaTek boards with a mt6358 pmic.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index fa159b20379e..a1b017a6a751 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020 MediaTek Inc.
  */
+#include <dt-bindings/input/input.h>
 
 &pwrap {
 	pmic: mt6358 {
@@ -356,5 +357,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
 		mt6358rtc: mt6358rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
+
+		mt6358keys: mt6358keys {
+			compatible = "mediatek,mt6358-keys";
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+			home {
+				linux,keycodes = <KEY_HOME>;
+			};
+		};
 	};
 };
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
