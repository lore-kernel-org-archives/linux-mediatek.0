Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A37C6FA83
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0SGdeGxPSfgmPzoXpghs78M4KATohQn7tWSlIXxxmu0=; b=GK8PPzp+rNaPHOuUdz6batmp4u
	dfhPS2TtldOCyzL8RUw4Dqz9A5dPgk/jIlhjiGKTA5e74Du94uXo+diag8/bUnrMq7lJgLAMXuQdp
	i3FrdHHtchNpebSrnLfqqMoqAyZ4gy3iyY6H5vccW7yGQOVhYEVqte6Sak92d50QsK+aUwXWKRStG
	qfuY67qkLvxX6NHp6EHNOlpKf4VAfWLqcr2PDUzSC9VaosAHTAGdGzXwFa3kwDkO6vwyxvVh8y9LI
	mcl2iAoOBqG5omsWg4sJQTaQDEvUvvFLog+HKbyNkOOkDS5lXb8KMfNKdhSuX/H/CTc4Z3q6UIagr
	No46S56g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJR-0046M6-6n; Mon, 26 Sep 2022 10:26:09 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclIu-00466s-RE
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 10:25:39 +0000
Received: by mail-pf1-x431.google.com with SMTP id b23so6213400pfp.9
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 03:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=0SGdeGxPSfgmPzoXpghs78M4KATohQn7tWSlIXxxmu0=;
        b=J3XtwwiGn04xGBGF5757B1oFtDTeixKKD2CZ9ZPPzOdVT26SaixnJRYDHHkqrSGycq
         iprjQFQHKHmAfmIr95ebOe/MJgaMsexsdTqW84jgqEdoRsXDEYSn4+6VGtpubEB62NAR
         vdfZGCEwMeEUQ2s3/CwM+lITvKjDjEG9jDbis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=0SGdeGxPSfgmPzoXpghs78M4KATohQn7tWSlIXxxmu0=;
        b=pQnuQ6W40R9v9Lfjbyccm08K3DVrnUAptF+KIflwKvWHXXgcDDadcBxhJC2qaCSct8
         JAydXc+HlVG3p7g06cFEFXDXIeFwpdbHwpiEzPaj9wHvtnYpCt8ApNZ8WMC0CNqgWx1E
         5hhDcttfSlrqXL6zhfg4+5WE4DJ5C66YMmiqJfTUoZHXJguFaCvRyucu7Bkb/bs1Jsn8
         iS8XyEMAlpjl9LR/HSBPl/zAvrQcqHmcbcTeidZQ6b+L+riIExKrBl3S6JcGP2IlmwRe
         WESLUPuEKIf030yR7rlktBLVitRsA5tA2WUIR1ub8cx9ccPTBTRxJf+eenbLjQC4seuL
         +DHw==
X-Gm-Message-State: ACrzQf0TnEiVteyunN134bVSpRX1iTHhP4bchBuFnild4D2c78CM9Q/i
	3IflwB7qsM0jxiQB0eVhmR3mmg==
X-Google-Smtp-Source: AMsMyM4UA9RJ4j31Tk60EzVOIh2W+Ow8CAri0MOHZIk8ZChEjnJ232vP1SwnFwo2NvjYg1CUbJrJBQ==
X-Received: by 2002:a63:5762:0:b0:43c:c1b5:3e75 with SMTP id h34-20020a635762000000b0043cc1b53e75mr1487624pgm.380.1664187934413;
        Mon, 26 Sep 2022 03:25:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1340:7319:2f7a:3be9])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11750236pfp.163.2022.09.26.03.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:25:32 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miles Chen <miles.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] clk: mediatek: More cleanups
Date: Mon, 26 Sep 2022 18:25:17 +0800
Message-Id: <20220926102523.2367530-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_032537_007767_8CA61AFE 
X-CRM114-Status: UNSURE (   8.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Here's some more cleanups for the MedaiTek clk drivers.

Patches 1 and 2 fixes and cleans up some parts that were missed in the
previous clk_hw conversion series.

Patch 3 drops the duplicate registration of the top_early_divs clks for
MT8192. Currently this only contains a fixed divider.

Patch 4 prevents having a duplicate OF clk provider for the topckgen
controller, but removing the previously registered instance.

Patch 5 deduplicates the parent clock lists for MT8192.

Patch 6 adds proper error handling to the clock probe functions for
MT8192.


Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (6):
  clk: mediatek: fix unregister function in mtk_clk_register_dividers
    cleanup
  clk: mediatek: Migrate remaining clk_unregister_*() to
    clk_hw_unregister_*()
  clk: mediatek: mt8192: Do not re-register top_early_divs in probe
    function
  clk: mediatek: mt8192: Avoid duplicate OF clk provider for topckgen
  clk: mediatek: mt8192: deduplicate parent clock lists
  clk: mediatek: mt8192: Implement error handling in probe functions

 drivers/clk/mediatek/clk-mt8192-aud.c |  15 +-
 drivers/clk/mediatek/clk-mt8192-mm.c  |  17 +-
 drivers/clk/mediatek/clk-mt8192.c     | 296 +++++++++-----------------
 drivers/clk/mediatek/clk-mtk.c        |  12 +-
 4 files changed, 130 insertions(+), 210 deletions(-)

-- 
2.37.3.998.g577e59143f-goog


