Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5103FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=diuaqqvN+63B9a3Siga9TMxebBHj6DQM09YkAD5842k=; b=nphHoyeSB3Vjfy
	6mtM6HBOkxDt6xBCUHbWs/AKJ6W2KenLvLD2p0khApm0PHlhuagw8ddlC8CA7pLW/C+np/5nG2T1L
	YbusWBf9li/Wh3URHM8ik6LAUmNkY3gmJ6NdUTaitbZXSYZTcJFCdlFiHk3o2FXVsV32FeC0k2P4R
	OglMYJsjAiccSnciu/vN1OJl6/jTJ1p9UCAQXjZRzXvkAC1yEOgyvHSQkx8kt7WY+8Nqo/RvWnb9X
	2sbXWyflWznB0zLixLEQVaNPfj1ohYkth6oZy2R+osP1wWDbMTvehcyniRMb/gw6v6mPybOXQfqEa
	nCx5EJpMbQH/8ma7OdRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHPni-00DnHP-Pg; Tue, 08 Feb 2022 12:40:54 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHPne-00DnFZ-CV
 for linux-mediatek@lists.infradead.org; Tue, 08 Feb 2022 12:40:53 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so2604146pjb.1
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Feb 2022 04:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMrUAZQe9JUnVj5EUjsHzOkSwiZvLDAMScWPGf0Fm7Y=;
 b=Tv2sNlDXK1Ko6uI/SUxKmBShnZK1++IAMa8F4Lj3hYheLkNiKldHy6fSEfC2jyv7cp
 /MnlRv6jwo5QdrgVmIFVlPJWBTP2rY3pR1W9ymm3PL7ZbqftNLKV/+nhZCTFfyRTAzMf
 C55QO7PkMzxcNnw3dCqFlbGUrymPAr2fd3PhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KMrUAZQe9JUnVj5EUjsHzOkSwiZvLDAMScWPGf0Fm7Y=;
 b=mW+IRLbGn7ckt+PrQ3zoyqKLYmHpVzr1V8h1x1ZiTzHdhJsr19Osu7q8cIluHz4pRK
 mln2DsEl4+uFRVhXCMhOM61vAwTlxZewg9Ahu7HrosJkCLXT7x8aMyPZOc4cllTFLNLG
 6F0/prwK+AIJelqIIBuKvy7BadHgUvYxRnqr9bYmOAOBT5Fr7UFz0Zu88wVqX91pQF37
 F6OHokqDWoaduhUKg/2wjznu+mmjUO0FmfCCppDcuNDVpe2VQdg5D/lKgH9VNIAphRGi
 aYjk8/H2UM6KcleZIHs6ed3Sfm5B+4wIcJLYJasQdOHyWbZmByb4P/qBUtzEScgYGPt9
 x90g==
X-Gm-Message-State: AOAM530sfVAh3I7mEqJJjVEI+cmrZ7Yo2OprfTS994Lx9L15sEoHYj7w
 nb48HZt7F98HA5Dro9+lAsYg8w==
X-Google-Smtp-Source: ABdhPJy8bQUmp0LwZ6FrJof01Qa1olsgrYoahsed5EV70vn0DwuNDR2d0/b3XFrg2nh3rQtTCRo4HA==
X-Received: by 2002:a17:90a:780e:: with SMTP id
 w14mr1195661pjk.42.1644324049220; 
 Tue, 08 Feb 2022 04:40:49 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:41b6:813e:c823:609c])
 by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.40.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 04:40:49 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 00/31] clk: mediatek: Cleanups and Improvements - Part 1
Date: Tue,  8 Feb 2022 20:40:03 +0800
Message-Id: <20220208124034.414635-1-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220208_044050_461421_B2DE87A3 
X-CRM114-Status: GOOD (  22.64  )
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

Hi everyone,

This is version 3 of part 1 of planned work to cleanup, improve, and
modernize the MediaTek clk drivers. The full proposal can be found here:

https://lore.kernel.org/linux-clk/20220122091731.283592-1-wenst@chromium.org/


Changes since version 2:

- Collected review tags
- Moved platform_set_drvdata() in clk_mt8195_apusys_pll_probe() to the
  correct patch (patch 30)
- Corrected error path for clk_mt8195_apmixed_probe() in patch
  "clk: mediatek: mt8195: Implement error handling in probe functions"
  - Also dropped review tag for this patch

Changes since version 1:

- Added NULL pointer check against __clk_get_hw() return value in
  mtk_clk_unregister_pll()
- Added NULL pointer check against __clk_get_hw() return value in
  mtk_clk_unregister_composite()
- Copied MHZ macro into clk-pll.c and restored its usage
- Dropped extra semicolon in mtk_clk_register_plls()
  - Reported by kernel test robot <lkp@intel.com>


I also wanted to ask, what would be a good way to do the "struct clk" to
"struct clk_hw" API conversion?

A. Add new register/unregister APIs that use "struct clk_hw" instead of
   "struct clk". This would result in a lot of patches and a lot of
   churn though.

B. Replace "struct clk" with "struct clk_hw" (and "struct clk_onecell_data"
   with "struct clk_hw_onecell_data") and work around existing code with
   __clk_get_hw() or its opposite. This would result in a few huge
   pages, as to not break bisection, but would likely cause less churn.
   And it would cover all existing platforms in one go.


Thanks
ChenYu


Original cover letter sans full proposal as follows:

Part 1 involves cleaning up various parts of the MediaTek common clk
driver library:

- Code style cleanups in places touched by other changes
- Code for a given clk type that happened to be split between different
  files is consolidated
- Parts of the implementation, such as the internal data structures and
  registration/unregistration of a single clk, are internalized and no
  longer exported to other parts of the library
- Unregister APIs for all clk types in the library are added
- Remove function added for the simple driver case
- Error handling is added for all clk types
- MT8195 clk drivers cleaned up with error handling and removal support
  added

Adding error handling to the clk driver library results is a change in
its behavior, and might cause some breakage where the affected system
was originally somewhat working, but not completely. The failure would
result from a duplicated clk, either in name or ID. Old behavior was to
skip over these and ignore the error, whereas the new behavior is to
restore changes and error out.

To detect duplicate IDs, an additional warning will now be printed when
such occurrences happen. In a correct driver such things should not
happen though, so maybe we could consider wrapping that in some debug
Kconfig option. That's why I put it as the last patch in this series.

This series was tested on MT8195 with the series applied on the downstream
ChromeOS v5.10 kernel. Some other patches were applied to make this
series apply cleanly, but nothing The cpumux clk type changes were
not tested due to lack of related hardware. However the changes are
very similar to the other types, and I am confident there are no issues.


Chen-Yu Tsai (31):
  clk: mediatek: Use %pe to print errors
  clk: mediatek: gate: Consolidate gate type clk related code
  clk: mediatek: gate: Internalize clk implementation
  clk: mediatek: gate: Implement unregister API
  clk: mediatek: gate: Clean up included headers
  clk: mediatek: cpumux: Implement unregister API
  clk: mediatek: cpumux: Internalize struct mtk_clk_cpumux
  clk: mediatek: cpumux: Clean up included headers
  clk: mediatek: mux: Implement unregister API
  clk: mediatek: mux: Internalize struct mtk_clk_mux
  clk: mediatek: mux: Clean up included headers
  clk: mediatek: pll: Split definitions into separate header file
  clk: mediatek: pll: Implement unregister API
  clk: mediatek: pll: Clean up included headers
  clk: mediatek: Implement mtk_clk_unregister_fixed_clks() API
  clk: mediatek: Implement mtk_clk_unregister_factors() API
  clk: mediatek: Implement mtk_clk_unregister_divider_clks() API
  clk: mediatek: Implement mtk_clk_unregister_composites() API
  clk: mediatek: Add mtk_clk_simple_remove()
  clk: mediatek: mtk: Clean up included headers
  clk: mediatek: cpumux: Implement error handling in register API
  clk: mediatek: gate: Implement error handling in register API
  clk: mediatek: mux: Reverse check for existing clk to reduce nesting
    level
  clk: mediatek: mux: Implement error handling in register API
  clk: mediatek: pll: Implement error handling in register API
  clk: mediatek: mtk: Implement error handling in register APIs
  clk: mediatek: Unregister clks in mtk_clk_simple_probe() error path
  clk: mediatek: mt8195: Hook up mtk_clk_simple_remove()
  clk: mediatek: mt8195: Implement error handling in probe functions
  clk: mediatek: mt8195: Implement remove functions
  clk: mediatek: Warn if clk IDs are duplicated

 drivers/clk/mediatek/clk-apmixed.c            |   2 +-
 drivers/clk/mediatek/clk-cpumux.c             |  69 +++-
 drivers/clk/mediatek/clk-cpumux.h             |  13 +-
 drivers/clk/mediatek/clk-gate.c               | 148 +++++++--
 drivers/clk/mediatek/clk-gate.h               |  59 ++--
 drivers/clk/mediatek/clk-mt2701.c             |   5 +-
 drivers/clk/mediatek/clk-mt2712.c             |   3 +-
 drivers/clk/mediatek/clk-mt6765.c             |   3 +-
 drivers/clk/mediatek/clk-mt6779.c             |   3 +-
 drivers/clk/mediatek/clk-mt6797.c             |   3 +-
 drivers/clk/mediatek/clk-mt7622.c             |   5 +-
 drivers/clk/mediatek/clk-mt7629.c             |   5 +-
 drivers/clk/mediatek/clk-mt7986-apmixed.c     |   4 +-
 drivers/clk/mediatek/clk-mt8135.c             |   3 +-
 drivers/clk/mediatek/clk-mt8167.c             |   3 +-
 drivers/clk/mediatek/clk-mt8173.c             |   5 +-
 drivers/clk/mediatek/clk-mt8183.c             |   3 +-
 drivers/clk/mediatek/clk-mt8192.c             |   3 +-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c  |  30 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c  |  25 +-
 drivers/clk/mediatek/clk-mt8195-cam.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-ccu.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-img.c         |   1 +
 .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    |   1 +
 drivers/clk/mediatek/clk-mt8195-infra_ao.c    |   1 +
 drivers/clk/mediatek/clk-mt8195-ipe.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-mfg.c         |   1 +
 drivers/clk/mediatek/clk-mt8195-peri_ao.c     |   1 +
 drivers/clk/mediatek/clk-mt8195-scp_adsp.c    |   1 +
 drivers/clk/mediatek/clk-mt8195-topckgen.c    |  69 +++-
 drivers/clk/mediatek/clk-mt8195-vdec.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-vdo0.c        |  20 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c        |  20 +-
 drivers/clk/mediatek/clk-mt8195-venc.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-vpp0.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-vpp1.c        |   1 +
 drivers/clk/mediatek/clk-mt8195-wpe.c         |   1 +
 drivers/clk/mediatek/clk-mt8516.c             |   3 +-
 drivers/clk/mediatek/clk-mtk.c                | 304 +++++++++++++-----
 drivers/clk/mediatek/clk-mtk.h                | 105 ++----
 drivers/clk/mediatek/clk-mux.c                |  89 ++++-
 drivers/clk/mediatek/clk-mux.h                |  17 +-
 drivers/clk/mediatek/clk-pll.c                | 100 +++++-
 drivers/clk/mediatek/clk-pll.h                |  57 ++++
 drivers/clk/mediatek/reset.c                  |   3 +-
 45 files changed, 903 insertions(+), 292 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-pll.h

-- 
2.35.0.263.gb82422642f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
