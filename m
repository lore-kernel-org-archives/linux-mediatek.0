Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155DCC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:13:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D406C60EC0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 05:13:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D406C60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bi0LX0s8KZF2AjGQCt7QpR0DrMG2WSESpQXmHHXzUVo=; b=z4RSAvrOUD4CxN
	ghW+xReolvenmHjkOl2gPDodRLIOCOvjc09bSuV3z5XuGfAo0TAlM2835jI2kGded5EldSSa59HGE
	j0WLKX69NSwYpqk47ZvyYEkhq3uGkLxOsptxuh/5BbDK7+ruTftiI55diensJlGkZN4SmAZN4JIts
	3SgKyZ0E2b6tY5SUORFs8JJ7c7MRu9jU6Iwnl2ykBwaG71Z6k3iFoLv4Q3CEL1+GzAktl4PWJ9fS2
	UEjgD8FfuepIM24rUwMnasMonu72JAPrsH7CjiwllTjCV7Hqw2yOxs+x2UudWAJLKoCarSvcjPdQX
	4AqSJ/XSzspgr5WBSx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAmkF-0019Hy-Be; Tue, 03 Aug 2021 05:13:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAmkA-0019Fm-2U
 for linux-mediatek@lists.infradead.org; Tue, 03 Aug 2021 05:13:37 +0000
Received: by mail-pl1-x632.google.com with SMTP id q2so22268685plr.11
 for <linux-mediatek@lists.infradead.org>; Mon, 02 Aug 2021 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
 b=UTBe3IQVAlVhEdWXsxUvzz2ICfA2z/fzXCB4Q5r+4bdnmj6mJoVLFsQE2GZqliTgUA
 6raQ3ESffrnA6PFRdfN9nUwhzoiQlNbnvPQiGYKlHIzsoIpQEPi75Jq8wDIYDUI9+cBk
 ZSD5pN7WfoHn2au99FIOdL6aoYbAxI8arJ3dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A/eExhXdIB0K8jv2+SmtKO1+FtOUyPYgVYzl6RJq3V8=;
 b=p6NovBxP4fCcICuUJXYyWHTSyxXMUBwAku8d2UnKRmgkWC+Pmxsgi/+9uY1aa1znxf
 gKMe03uiK4DeKx43gqcRZzQvVJ3Uuuk+ayllq2ygPisPMFFkAsyCdsDkPYkHL43HpZvw
 L/3qs6Y7Gweny7g1GBb7gtLaQodjulkZ6fB+vfozDJgSj0mptllV7BVi/Gm3RMcXjip9
 LN79fcHqIKwuc1puM5XAW8ytHN4bpkKVWnZi51hNr93rrCEGTXh4nQUGY8aDoocHRBjP
 HzVJoxKFLceXXd6cLlibfePu9nAbIaNAfuutWbPv3IpwKKQpI+eS6f+9qnKCnwYKPWoG
 hSnQ==
X-Gm-Message-State: AOAM532tLPQtfWMKpSiHQNodO8PDs1y2tU3H05J6iGn8gRhA4cHrq4wi
 G09cRVEXO59lrgbJPxIDXDgOPA==
X-Google-Smtp-Source: ABdhPJzQt8TWRZsHH1uJM4CJVQw+lKk4RiXB/VDw+tt52D8vL7+IRXvqOexSWAwzK6UWFlXEaBzIUg==
X-Received: by 2002:a63:4e51:: with SMTP id o17mr949944pgl.126.1627967613386; 
 Mon, 02 Aug 2021 22:13:33 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c800:1b1d:5677:31a7])
 by smtp.gmail.com with ESMTPSA id x25sm115732pfq.28.2021.08.02.22.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 22:13:33 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] arm: dts: mt8183: Move pinfunc to
 include/dt-bindings/pinctrl
Date: Tue,  3 Aug 2021 13:13:17 +0800
Message-Id: <20210803051318.2570994-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210803051318.2570994-1-hsinyi@chromium.org>
References: <20210803051318.2570994-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_221334_181655_6C3F06B8 
X-CRM114-Status: GOOD (  11.70  )
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
