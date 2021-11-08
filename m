Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2247AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 00:09:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCEF761378
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 00:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DCEF761378
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q32iFTc4GvLUj+vN2heZw5d+gAMBztDkTFfgNfNIFoU=; b=WepFaiQt7m3tFh
	oPUUzsyYEnKR1KrDy4GsnwoxMNizbgCpw49AL/gI2YqDyatcBdqf1q5v5FJP9F+pd1Zyi4rqDozn/
	TBEE9kbmYcXpyBz4fWCrm6Cx3m/WbugvcSczQlcXHaCKrVKxJ9/i8iRnqBDT44kmrcW9LGhfZm9Ek
	PRsip2xooC88y95uTP4RaAYK/ocHRv2kovxpj9tTOWmYxRI14iaifnLDQeg1NitKi8U5lzsNS92yL
	xfjmqmNm1Sp0tPz+yCHB05P1ypfiRAYwCImeT/2Cx6y/bFWO//486DjpR8EwuFlaGx8CYG+iLf934
	Pm6TyEA2JdF/mzksyhKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjsDt-00F3tu-PO; Mon, 08 Nov 2021 00:09:17 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjsDe-00F3pr-M9
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 00:09:04 +0000
Received: by mail-wm1-x344.google.com with SMTP id
 b2-20020a1c8002000000b0032fb900951eso13848499wmd.4
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 16:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhZFGqY0zH/NSvPsKdWPPUF4NDL5AM7YBSNSnwu5lDM=;
 b=4rUNazAqhT/jtutRvM48m+nIXlRE+TG6A3Bq8x8xB6loMdtevnbgaAHyFjUIK0xzyi
 V/6OGUWdS4rL0en1axAg6C5QwB8WD+TMyh+tYE5A0wLB7+2xGqPWrXKU84fvPyC0ygGS
 6c/7o6T4RpNaJ+3M8GI8iV8nj7bH/jKJ8VoNdEWjFbFTzSzUX1hSjQHMjMIEEKlZsHNS
 PM0hXyO161CsJyn7cyGJRqg6ZbcxKFWpAhBt+aot/FjDmxZwx4FIJbBEcfQcK9oSZNff
 nnBUMOdi3EBR5PqULsADqNGHxBPGh5YXtpxXDSbWlTlzBYKftT8zMtz67YpP/J0ZczGs
 2jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PhZFGqY0zH/NSvPsKdWPPUF4NDL5AM7YBSNSnwu5lDM=;
 b=62NgeiwpXsH6r7m7ykhzzg7ENzwXUPHCjvOdTn21y/boZpQ3SigHFngJT8tmiohBvS
 aiKWVrZX+GQdgIcmqoVKWiRuKou9nlzaNiqi8H1C3BYWI6eOZxiLPXV01hE7D9Dkzh3l
 ruBxC2hDjwrerobm0aXczZvg3zcr/7x67f8cpN8alKF370fniyqUAneKE6b/a4xsSfYA
 bJJ5jTqiz7LMSGwOewwtL1eviR6TZU/uQ8oUG7Drl1ZWTTqEm35qDV0QTyi5D7KD+1a6
 7AX26d0TCe+bE5Q1BsU1e6Rrw+++q43jMs5brPujaieZ6hxdQb0PVzAveVFIUIlxc8SZ
 assw==
X-Gm-Message-State: AOAM532ylqzxeR7sRlfowNr62F93/GB+/qII96fMGEzWrFblq9IdMvBj
 pvGbrKqXGOL26GlfjGeajHLWgQ==
X-Google-Smtp-Source: ABdhPJymyhJiIWmugMw1/8khRjoCxJXIpO4FLFuB0QzdX5vsnG8J18gqY7Eg4H0XtUyDQ8uK5U2KWg==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr32598598wmf.185.1636330139694; 
 Sun, 07 Nov 2021 16:08:59 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8440-6241-67da-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6241:67da:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id a1sm17344278wri.89.2021.11.07.16.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:08:59 -0800 (PST)
From: Guillaume Ranquet <granquet@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH 0/2] drm/mediatek/hdmi : split legacy driver and add mt8195
Date: Mon,  8 Nov 2021 01:08:45 +0100
Message-Id: <20211108000847.14320-1-granquet@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_160902_801087_C1ECECCE 
X-CRM114-Status: GOOD (  23.91  )
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


Following the review of "[v1,4/4] drm/mediatek: add mt8195 hdmi TX support" [1] , I've been asked to try to merge the "legacy
HDMI driver with the "new" mt8195 HDMI driver. Though the registers and IPs are rather different, I've made an attempt at the
excercise on which I would like some comments before submitting a new version of the patchset.

I've created a new mtk_hdmi_common.{c,h} which contains what I could identify as common enough to be added in there.
I have not renamed the mtk_hdmi.{c,h} driver to something else yet.
I've then added mtk8195 hdmi driver on top of this work.

The code is still rather sketchy and I have some questions on best practices for that kind of exercices?
In no particular order, here's a bunch of random questions:

1 would you rather have:
- as presented here: a boolean with a bunch of if/else in the common code to handle the discrepencies between the two drivers
- function pointers, with an "ops" structure set in the drvdata... though the ops are a bit random and wouldn't really
make sense to be grouped together?

2 I'm not really happy with how the mt8195 driver and ddc are sharing the same __iomem regs and not sure how to exactly
handle this now that both hdmi drivers are tied together... it was hackish from the begining, but now I'm a bit out of
solutions to handle this peculiar "feature" of the mt8195 hdmi/ddc driver. any hints would be appreciated.

3 Should the "legacy" and mt8195 drivers be under the same menu entry?

4 I'm looking into the clock framework and I'm wondering if there would be benefits to switch to the "bulk" interface? as
both driver seem to request them all once and for all? the code might end up easier to read.

5 Would it be beneficial to further split the driver with audio on one side and video on the other? from what I understood,
the main complaint was that the driver was too big to review... that could help with that at least?


Thx for your patience... any further comment is welcome.

Thx,
Guillaume.

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210929094425.745-5-granquet@baylibre.com/

-- 
Guillaume Ranquet (2):
  drm/mediatek: extract common functions from the mtk hdmi driver
  drm/mediatek: add mtk8195 hdmi display driver

 drivers/gpu/drm/mediatek/Kconfig              |   10 +
 drivers/gpu/drm/mediatek/Makefile             |    5 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |  635 +-----
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  521 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |  258 +++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 1835 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |   26 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 +++++
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
 .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
 10 files changed, 3560 insertions(+), 609 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
