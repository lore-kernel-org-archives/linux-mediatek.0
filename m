Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D931EC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CA564E5C
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CA564E5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kTGRxG0OhaYrZiP2OxyipmBBzLS6oLZ8X2Bf8RiaCxE=; b=c27lCY0OFGH65k9ZItMYVFSoaf
	6/6ybdPBIdb68xzC5aUop3ZM/rJzeWFSkCq6Tw33BVB4gCpkUKvQ73msa0tLw2ZNmTrbsl+fMm1EC
	47A/ltkDKfn8oWDssvQTF//dfrxS5OMYmiZL18GnG4Ud+HukAUvrytsbDwJsoPSK3bucgbF3Cqj5L
	PvSeKWEboNyesenReGmm+5S89H7M7oPD0dbMz8V5VntzvygtvZiIedfhJrQucwL1qbzKqMEOm0DSa
	Lj166a2UFzBo+jwmIwZ6hjpIGHRneOSWM+diQ9HPuiIFcgNOVtCPh0vjjqiRaEBY1pKVfUde3X/JB
	T9w8IqvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QlL-0000aV-0Y; Fri, 29 Jan 2021 10:12:23 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QlF-0000XY-5q
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 10:12:18 +0000
Received: by mail-pg1-x52f.google.com with SMTP id n10so6315339pgl.10
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 02:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=foo+hiy0PVOVNEAZ7ck07E+mzuZnksJFIdmegm3YreQ=;
 b=XIVAikvMWAaG0JMqHiuRIGr1ESsqhgNUwr5vZTs5lt1g+KITHkvZKJ4xUdDOQ5SePL
 nBQIasG5zOSDbXRQlFSvgmvdORVTv7z1i16ifIbKJHSMeYEnp5O0BJgCHIuUpIbzCR1S
 XHdHz1X5skaxzdbGnfV0I2GCM250oFcihkcxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=foo+hiy0PVOVNEAZ7ck07E+mzuZnksJFIdmegm3YreQ=;
 b=WPxKV3oZfW1R65Vm6BVpqYBpxJIMGX0kCseQMhZ0aJY1ktDFcZ0Pa74anHEkPwMN4y
 gJ9jEkd/vq3VKyh+VUebEKv4ahQT7qNZ0x2IOmTUwWN9O+fo91lAJFctktaQ6ToU9mIm
 Ow1xK8UnZDnaTso3qYft8KEpsfMqi+8Mt5BJuDYUkMv8piyjkdbyddoNuFnwQw/9Qd3s
 CcTsmcvZHydRBk5tUeQl6KdiUEOMepG7JVHkyoqs8luffzTcEA7HcqPSJ3xJW7WuCCMB
 RVuj8cZEbPq6ufQvedfraRyLmveWzHBkWeOwuQdC1JIlKhUo32XtrX2LvbfhbpNQv5Id
 RuiQ==
X-Gm-Message-State: AOAM531/+2dRq1SJp4bt+jFzX1fY67LyAFNzogWFwLSkmPb/MNCoPfje
 CJivxoIg1tpOQRxUGezaIDg09g==
X-Google-Smtp-Source: ABdhPJzZVphQY+rGjKxKU5v/m4JjjB+x3N7M3+wA0fnFx4VUDQC/i0tvMlqXFtgecjBofCvOaLJNkw==
X-Received: by 2002:a63:ca0a:: with SMTP id n10mr4134092pgi.326.1611915134700; 
 Fri, 29 Jan 2021 02:12:14 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id a2sm7532533pjm.51.2021.01.29.02.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 02:12:14 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/3] Add domain supply for mtk power domains
Date: Fri, 29 Jan 2021 18:12:05 +0800
Message-Id: <20210129101208.2625249-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_051217_247571_4820F860 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some power domains (eg. mfg on mt8183) needs to turn on its domain
power supply before power on.

Otherwise readx_poll_timeout() in scpsys_power_on() would timeout.


Change since v2:
- add more comment in "soc: mediatek: pm-domains: Add domain regulator supply" patch


Hsin-Yi Wang (3):
  dt-bindings: power: Add domain regulator supply
  soc: mediatek: pm-domains: Add domain regulator supply
  arm64: dts: mediatek: mt8183: Add domain supply for mfg

 .../power/mediatek,power-controller.yaml      |  9 ++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  2 +-
 drivers/soc/mediatek/mt8183-pm-domains.h      |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c         | 42 ++++++++++++++++++-
 drivers/soc/mediatek/mtk-pm-domains.h         |  1 +
 6 files changed, 57 insertions(+), 2 deletions(-)

-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
