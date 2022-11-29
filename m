Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7605C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 07:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gtj4EzuHnodtWtwYDI9OOTsnptwEOETlUZBcz/3372k=; b=JUGEWX+VcViwYQ7WypBn/mvJlo
	Hq7/VBa9G17bWSHdb4B1+0NI5s6jTbPDHvTLW4mtnfbq2X94jwxlomsayzUp/CPChopyIcVVVfJOz
	p+8qODpVWYguVyFLVo9PCVUlpL8497nYwcejUx/5GbPXQG5DtgSotJGRP5SXlbYQ9tW0JflhkzVOU
	6YQRySYcrKNbG/lczABOfc63LNv34hwhpez8aEIBkIEuvWXwrl38wlrTTGqqZdq61N9K1e4br5FE3
	p4LryEUAuRbjIamDf4JLl4BKI0hTK46iD3mdhIeYq/wkOHUX7CibYMUMRGBh4ju2jkuWyiEtGc8tK
	lbUCOGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuoj-006qdv-0O; Tue, 29 Nov 2022 07:14:09 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozuof-006qc2-Of
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 07:14:07 +0000
Received: by mail-pj1-x1030.google.com with SMTP id e7-20020a17090a77c700b00216928a3917so16437051pjs.4
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Nov 2022 23:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtj4EzuHnodtWtwYDI9OOTsnptwEOETlUZBcz/3372k=;
        b=kyP4uiwGXyDgVqDTGoCaw/78YQeCD69XjjBrGYMopqpcuEDZIvInEx/Fi5b1U2XaTt
         b5bLElSN+j7jHnHXL9YnNcTRiwLiSn5Qeel81HL0/Sirj0H7SKVkWPDPFIOHE2BVaGvA
         eQDn91aQf44U+wMqG1CqjBF0o50njS8U7t3OA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtj4EzuHnodtWtwYDI9OOTsnptwEOETlUZBcz/3372k=;
        b=P4nvwl5bPftNJfb8eIhFfKQa9IWMZtt/404/e+HCdlXnQQSRubaHxiYdaeivW89MAS
         LyMXcWrl5CzH41BdZYDcsbMBMhb5sHwdTuinVmw8gm00jZamG1csn3Gmr4ffrrI9Geqw
         zaMWQHjnhd2/rSGSEueF14m9Q0YlIcZBaM9mENhz16xCUo+sIbu9l6okQ9aIdDz5zdPb
         5XuRlWYKAK1UXilpDKZmnaAgoqB44hm4ep3HUATn4IqmQTznpawFae8eoQ+OZkJRtm86
         D9bxIa6vwBWcksIbGJDH6J/vNRCLgoBX55+DRZ+eVxHBkivZCoxMq1FpPTDH4el87qqn
         y0Xg==
X-Gm-Message-State: ANoB5pmcExBIwscoITjeefJGwZ2I1wefHxPGsFMo3pYCNn2/ma+0YExU
	9n4PSxJjgM5dnV83h2cCmdvw7w==
X-Google-Smtp-Source: AA0mqf4fDGZ8xAyjEF56qfkDg0qbpzX9vPVE3FfOuM6JAorO5szAigWFaIUnXHiGPDQ6SLi/ln26nw==
X-Received: by 2002:a17:90b:4109:b0:219:f99:2809 with SMTP id io9-20020a17090b410900b002190f992809mr20095927pjb.36.1669706042752;
        Mon, 28 Nov 2022 23:14:02 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:ac4a:f96:259:b58a])
        by smtp.gmail.com with ESMTPSA id ik16-20020a170902ab1000b00172f6726d8esm9974908plb.277.2022.11.28.23.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 23:14:02 -0800 (PST)
Date: Tue, 29 Nov 2022 15:13:59 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] MediaTek Clock Changes for 6.2
Message-ID: <Y4WxN+u0nB4gg39Z@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_231405_857068_080CD9A7 
X-CRM114-Status: GOOD (  13.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git tags/mtk-clk-for-6.2

for you to fetch changes up to a46315295489933209e902638cd287aeb5f982ab:

  clk: mediatek: fix dependency of MT7986 ADC clocks (2022-11-29 14:49:29 +0800)

----------------------------------------------------------------
MediaTek clk driver changes for 6.2

Some more cleanup work, and a new driver for frequency hopping
controller hardware.

- Remove flags from univ/main/syspll child fixed factor clocks across
  MediaTek platforms
  - The idea is to not have the clk core try to reconfigure the system
    PLLs, i.e. have them be stable
- Fix clock dependency for ADC on MT7986
- New driver for frequency hopping controller hardware on MT8186
  - This does frequency hopping and spread spectrum clocks in hardware

----------------------------------------------------------------
AngeloGioacchino Del Regno (10):
      clk: mediatek: clk-mtk: Allow specifying flags on mtk_fixed_factor clocks
      clk: mediatek: mt8186-topckgen: Drop flags for main/univpll fixed factors
      clk: mediatek: mt8183: Compress top_divs array entries
      clk: mediatek: mt8183: Drop flags for sys/univpll fixed factors
      clk: mediatek: mt8173: Drop flags for main/sys/univpll fixed factors
      clk: mediatek: mt6795-topckgen: Drop flags for main/sys/univpll fixed factors
      clk: mediatek: mt8192: Drop flags for main/univpll fixed factors
      clk: mediatek: mt8195-topckgen: Drop flags for main/univpll fixed factors
      clk: mediatek: mt8186-mfg: Propagate rate changes to parent
      clk: mediatek: mt8186-topckgen: Add GPU clock mux notifier

Daniel Golle (1):
      clk: mediatek: fix dependency of MT7986 ADC clocks

Johnson Wang (4):
      clk: mediatek: Export PLL operations symbols
      dt-bindings: clock: mediatek: Add new bindings of MediaTek frequency hopping
      clk: mediatek: Add new clock driver to handle FHCTL hardware
      clk: mediatek: Change PLL register API for MT8186

 .../bindings/clock/mediatek,mt8186-fhctl.yaml      |  53 ++++
 drivers/clk/mediatek/Kconfig                       |   8 +
 drivers/clk/mediatek/Makefile                      |   1 +
 drivers/clk/mediatek/clk-fhctl.c                   | 244 ++++++++++++++++++
 drivers/clk/mediatek/clk-fhctl.h                   |  26 ++
 drivers/clk/mediatek/clk-mt6795-topckgen.c         |  76 +++---
 drivers/clk/mediatek/clk-mt7986-infracfg.c         |   2 +-
 drivers/clk/mediatek/clk-mt8173.c                  |  76 +++---
 drivers/clk/mediatek/clk-mt8183.c                  | 216 ++++++----------
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c       |  66 ++++-
 drivers/clk/mediatek/clk-mt8186-mfg.c              |   5 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c         |  89 ++++---
 drivers/clk/mediatek/clk-mt8192.c                  |  76 +++---
 drivers/clk/mediatek/clk-mt8195-topckgen.c         |  78 +++---
 drivers/clk/mediatek/clk-mtk.c                     |   2 +-
 drivers/clk/mediatek/clk-mtk.h                     |   7 +-
 drivers/clk/mediatek/clk-pll.c                     |  84 +++----
 drivers/clk/mediatek/clk-pll.h                     |  55 +++++
 drivers/clk/mediatek/clk-pllfh.c                   | 275 +++++++++++++++++++++
 drivers/clk/mediatek/clk-pllfh.h                   |  82 ++++++
 20 files changed, 1135 insertions(+), 386 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt8186-fhctl.yaml
 create mode 100644 drivers/clk/mediatek/clk-fhctl.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl.h
 create mode 100644 drivers/clk/mediatek/clk-pllfh.c
 create mode 100644 drivers/clk/mediatek/clk-pllfh.h

