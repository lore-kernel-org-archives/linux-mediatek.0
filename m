Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF21AC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:03:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9353B619E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9353B619E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfRclsWCp4aP89em6nhi5u+/A8BDrxYTEo22S14xLf0=; b=X57mEqrXCM+Qmy
	zr7ozpFk2AHahMwxx7B8C2E/QGy8zoVAMOaqGncFlYhPzAL1XOBVBJTUjsuv8OYBjXZwTwYH6nlFA
	t2czsjh70pXxHPODq4utZho7BH3WZRg3NuvpZDAxmjPSPRNlIMfLfmv2uZzXfAsUhWAYrIRfr4woo
	4tvS2uFkC7gpV5H62gqOs1Or6TIkreEPNdbxw2kjXgnDM9ItTNWTJeeh5RDJ7T0NpSgJRW4vm2SUr
	jaNlhnueYu0QrPcrmWpQIyKJ2sYsox/3Tf3CyS34dhtrwbsl2HCPlv4kO8xmlz6W89RLuLLz/HtnK
	OEd5h67dX72y/OEvhmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8KrT-00EXj3-M2; Tue, 27 Jul 2021 11:02:59 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8KrG-00EXfJ-JL
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 11:02:47 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so3555733pja.5
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 04:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6xuRUHpcGQs5eq1jKvwySsSmC2GFWn67Q0w7eS6EPs=;
 b=cUb/2cDKn+kDycoRMgKRvfqgevtzh0aEeaAL28/IMmmBDtC7mEGslXSomHPZYTBaOY
 0MXBfR2wdJwdmuTBemay8bHU93O2YAkK+H70C05rg0XZ7nF1u+wNVxo5j0/V6xa/ba8Z
 OK2t0fjdO1FbSrwSeI6/1uIt1XEUJ2V4EVB4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6xuRUHpcGQs5eq1jKvwySsSmC2GFWn67Q0w7eS6EPs=;
 b=JSMYo9kj/PHOcyrKH7QdwgOAJuDQkpQ7zCllX4Wkyz8dPYICWO6eRTB6WoXWbV4O5E
 FX24J+Ast8siEET1CtlL/0ui0+YMp7cLcTNHE0T5mJkbMwcl+61wEXDs/rvbrYgSMCa5
 fBKyqOHFbW5+myOxUd54Q0J/13FZno0DesrnZXdXnq+l6qkdVQzGEubhyukHfRGaCvVG
 FJj4I8HDTA/joEVJppyzPdIXqUcyv0g97+c26YtRbmbNkoEiRlIRKMu+oOegpAH1Zd4E
 v2mwJIWiJZo4UK8XzwQ6OK0VVy6BPEN5+s2w6IsydeDdCZwbdE8QJU5Y/3z+EpcrSSpB
 b9jw==
X-Gm-Message-State: AOAM531Vy2RqF0ZuuYrgn9BfDp0PF/Sdi8zGl/h+kCNh2SRcBNGvyMIu
 t75kXQdIgwY6BGa5kRtLJhBLoA==
X-Google-Smtp-Source: ABdhPJykNwzx0rI8jjHQMeuyocw1gausM1uqd+GK6kNDets4ZJ7ARYHkxlBe8eY/0WNr0Q2ipWdfJA==
X-Received: by 2002:a65:6555:: with SMTP id a21mr23204572pgw.53.1627383766137; 
 Tue, 27 Jul 2021 04:02:46 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id 33sm3553683pgs.59.2021.07.27.04.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:02:45 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm: dts: mt8183: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Tue, 27 Jul 2021 19:02:31 +0800
Message-Id: <20210727110232.2503763-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210727110232.2503763-1-hsinyi@chromium.org>
References: <20210727110232.2503763-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_040246_661187_A1BE4D6B 
X-CRM114-Status: GOOD (  11.48  )
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
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
