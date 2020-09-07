Return-Path: <SRS0=DUBy=CQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90628C43461
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 11:02:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C380206D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Sep 2020 11:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0qEQkFq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="FSI2tvGb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C380206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u1ZMgpwzfc6IX8v/3palsgnsE7oIZfWXZR0FpNzaifU=; b=Y0qEQkFqRdliaBmvtyQ1gS3KxV
	BnSrQwpKHiQhekD2BEygixYcbEPzrMxF1YItPxXDmmXgk7QHQ17tKbIjX+0TPcVyDBdCxSdZhzdtw
	TDaZm2zJDSClvQQ/KOoh8OzlazcsRajYo15IwaX9R9+eeX/DmLJohZkbMQWCK2NZAopumts3dk96B
	upBesXgYnxkEcd2L/duiRC7XfskMmZth+aruSQ7q+e4HfJUN6RR6wG4Qs1lxpgWC0Gd/Wl5WjDCYj
	shQSU+Q7Fi7hvixv4QahhwXftKRBRQkoy/knr42SrwfNeTpHyKIg5JZknAj781IusAn56m8WYiEoo
	pRCncYmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFEuv-0002vj-6T; Mon, 07 Sep 2020 11:02:33 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFEup-0002td-Hd
 for linux-mediatek@lists.infradead.org; Mon, 07 Sep 2020 11:02:28 +0000
Received: by mail-wr1-x444.google.com with SMTP id e16so15353657wrm.2
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Sep 2020 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njSxaAkrShaev6nBmwWk4gz2+gzrgoVD7cG8Ur2KLZY=;
 b=FSI2tvGbCDcFLdRpiiybbNb4UiGRnVNftq8LrfnfRDbZB0bgyf9asszI7O09fQtHf4
 9KfwujbHAzz7fG/ok96HkfFth+HZM/ApW1FO6/B9kQbkQkV36nEJusYnj617lJqxXJ7J
 nuC3hhNe1MSis/mQWPeplAsiol7hpWBbi/PtTWjHqgzMSP5C/ZQLXxBoJDcSAgahQqI7
 sUb5+pokelyqRhxVA7pNdJ3zigIsU0tv8VOwKEKykD4t0X/cbP19ikXXORFNMyv1QdaZ
 6tDxptY4GLT04g1szxXUxU+VVoDoh9alnas+CpU1K8xynXhimcfV2PwMiyZPW1QoAve+
 lgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njSxaAkrShaev6nBmwWk4gz2+gzrgoVD7cG8Ur2KLZY=;
 b=rP9Iaqpuk8vcXcjQe8FaW1WsKbLUH0btqb+LZIuLD9iAjZ0jJJehZt3IOfi4dFAhTx
 ibmnXnfrngwNmFYPIMwxyAGBm1GCCsLzGX7SufKGe+YKg5xPBwK/0J3fnj+8JutergZU
 F5Dd0reRVhs9MxPzcJjgpA/BNdmlEXKlT0X7in/j1YZxlMmW2xgX+TKODhHNqyKuPL9Z
 YuyDFS6xGo8mJ8B3Odp/Bb92xbXc9EOnJKtKg6+4BEUcSTXVSsv2Cq2bRNLalAVA+Lx0
 nKWPXt4BV2aqwIN65DLKPBRjt6Njozuq0Ucs78AGjyDsXnYcNPOei+AFmB9nMVapxZ4r
 hdIA==
X-Gm-Message-State: AOAM531gVeEw4hwvy7myVFb3+h6/2Y1z8zP2nnfXxdIyd64qhY2mLIoz
 w0cfNeER0YoafCfdM9gB+9VWXQ==
X-Google-Smtp-Source: ABdhPJzOyuMiOAWKozCxyMN8m5sL4WTHm2Ix5ZGgYp4lsJ5S1lIv8ykGUEEGNH299l5r2VPmDA+mgA==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr22168295wru.326.1599476546279; 
 Mon, 07 Sep 2020 04:02:26 -0700 (PDT)
Received: from localhost.localdomain (122.105.23.93.rev.sfr.net.
 [93.23.105.122])
 by smtp.gmail.com with ESMTPSA id 2sm28909545wrs.64.2020.09.07.04.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 04:02:25 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 1/2] pinctrl: mt65xx: add OF bindings for MT8167
Date: Mon,  7 Sep 2020 13:02:20 +0200
Message-Id: <20200907110221.1691168-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_070227_604218_69CDBC50 
X-CRM114-Status: GOOD (  10.24  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 linus.walleij@linaro.org, robh+dt@kernel.org, sean.wang@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation of pinctrl-mt65xx for MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
index 205be98ae078..931a18cd1e23 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
@@ -10,6 +10,7 @@ Required properties:
 	"mediatek,mt7623-pinctrl", compatible with mt7623 pinctrl.
 	"mediatek,mt8127-pinctrl", compatible with mt8127 pinctrl.
 	"mediatek,mt8135-pinctrl", compatible with mt8135 pinctrl.
+	"mediatek,mt8167-pinctrl", compatible with mt8167 pinctrl.
 	"mediatek,mt8173-pinctrl", compatible with mt8173 pinctrl.
 	"mediatek,mt8516-pinctrl", compatible with mt8516 pinctrl.
 - pins-are-numbered: Specify the subnodes are using numbered pinmux to
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
