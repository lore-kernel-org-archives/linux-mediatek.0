Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495DAC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C4120874
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:23:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="poFTFdE6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="rpxj/6h7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C4120874
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ownVjucMjeck+tS9Le9/NrWUKMxuhJCHu4dGz67w1Js=; b=poFTFdE6LRfxDXY/aLwoUjOPTP
	GBq0abKqwqQw7/xvsz3Isw1qvTKpe8g98buZezB4k6mNWbqntsXn0ojQZobDyB2N9xS4TNwB+A50N
	3ROCHmVafdf/Y8ie1IenQ82LbDhqr0sUBbZyhvPIscXywdFRQM6HliaXFqtTyT5lyK9HOCPJuWZSs
	xwm4Yc8dC+OcAQifzWMRAKJJrXIt/uDb+jchW01VAmAI3MokEZQBfV9+JjmZYYHAtYZONGukyFsP6
	D58wAa9jsSKtd8YoNUkvLq9y8lgqPSLa2VRKXlcZuBXrGxcctR3xL/nR5kzDbe2iOEOMm6Mh5S/2A
	P+53aOUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqsdD-0003H3-Dv; Thu, 02 Jul 2020 06:23:35 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqsd9-0003Fy-S0
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 06:23:32 +0000
Received: by mail-qk1-x74a.google.com with SMTP id f79so12729374qke.9
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 23:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=POlxROtWP+TdhSt/IwD+NQVip9L3Y5x9YnPtFWg67x4=;
 b=rpxj/6h7LxbFJdRPv4XUXmB3CwjKxdzrNxrDw479CqOJvCJBa15OGqM6qLMrR+P2hV
 /ZnsX4v6hMyD7EThA1EX0nPBd92+MTQq4vMrWxCKUC6IiIPD/MHr4xj34XM0Izk3HgUZ
 yDd2TgxNnkowIC3h7jOoe7mNev/g75SAz4x1RxRc/m1Hqa2GqJUB/B2v/lK0HMBrRiZn
 ehiKDNUi05kNQiJtsQSDHt/ZY7KORFmfB5eedBikViLh061NVy0Ejfu2S7JLg+MxNaY1
 bYCE0U5smeuCVoWoApxKSkUbfIT3tDjD/y+M5jRqHDoy2G8EObzbhe6DDRCDqVyv8Y4D
 SeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=POlxROtWP+TdhSt/IwD+NQVip9L3Y5x9YnPtFWg67x4=;
 b=ZdSZejwtufpVgt14sD3BQMa16qmmuoorXBEgrmOhj5Gp1zgq8lZ8/VAvDfR78bKzoP
 aNoqEquuw0WC+sli+lc5SN9c3nJmmn9Sf9KjdOpKRFfmjcvlZBT9s16tFNbcWBASBOF1
 Hrg8kn40FCqv4Tins4eJiQL9UYYFKB5At7xTWTGWB0UfrbJ4rSON6vB26LkC8Dshtb0Z
 rOSrCGTy1Ux8ABKQRa7sDZBo5/tD4garoHaO+SRxGk7mJj7UP0yFw8ugGMmnBKzK9URS
 tCtwOvgHhCJY9rfhjTBd0OkLlpodnm90TkKoPP2W9TnOTvR+YGX21WPMNZ8iyOKPxAA2
 +ASg==
X-Gm-Message-State: AOAM530Xeuxek6fDrEU1aZDhRsdtD5CabGUrEG1fUiMGy1u6adB5Vm+W
 TG5c+UP55+9fupz460GiMJyHlCENH7QAllkiFz/hFudPF6ZNR/1dEFa/qoGMje5RiUGGZf5qrX2
 YEXsWNG3waP94aopoLe5MSrr8m9LhSL4LUBOAjS6UQBzrqxYSuPh1wkqJIx+/5/7E050TYQ9OfJ
 vyf9mW
X-Google-Smtp-Source: ABdhPJy5eHr/trRqCcGcW58GmHYqTpcc6XIc1oWgRIjo/XEkCmsHA7/SrT3ezbzBSGmGU44rU6GXmA+dLl80
X-Received: by 2002:ad4:4645:: with SMTP id y5mr29421993qvv.163.1593671008207; 
 Wed, 01 Jul 2020 23:23:28 -0700 (PDT)
Date: Thu,  2 Jul 2020 16:23:16 +1000
Message-Id: <20200702062320.2903147-1-amistry@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 0/4] regulator: mt6397: Implement of_map_mode
 regulator_desc function
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_022331_924534_056AC023 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Anand K Mistry <amistry@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset adds support for being able to change regulator modes for
the mt6397 regulator. This is needed to allow the voltage scaling
support in the MT8173 SoC to be used on the elm (Acer Chromebook R13)
and hana (several Lenovo Chromebooks) devices.

Without a of_map_mode implementation, the regulator-allowed-modes
devicetree field is skipped, and attempting to change the regulator mode
results in an error:
[    1.439165] vpca15: mode operation not allowed

Changes in v2:
- Introduce constants in dt-bindings
- Improve conditional readability

Anand K Mistry (4):
  regulator: mt6397: Move buck modes into header file
  dt-bindings: regulator: mt6397: Document valid modes
  regulator: mt6397: Implement of_map_mode
  arm64: dts: mediatek: Update allowed mt6397 regulator modes for elm
    boards

 .../bindings/regulator/mt6397-regulator.txt     |  3 +++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi    |  4 +++-
 drivers/regulator/mt6397-regulator.c            | 17 ++++++++++++++---
 .../regulator/mediatek,mt6397-regulator.h       | 15 +++++++++++++++
 4 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/regulator/mediatek,mt6397-regulator.h

-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
