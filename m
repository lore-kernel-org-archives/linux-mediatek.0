Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D36C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 07:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EAcYI/CYLMOX4av0b8XpGkBWaSTgZoZZDskRGhxULD8=; b=Og9CmfBGw9CTk3
	WqEJAOG3IiG8XX8ATMw8JBnoqZ1RkS3Lm+QB1WTk/N/80WUFUGIojFR6l8ej9ywbjdcA3ZaviSwjS
	YJECul9ukAWcIVSCe5ZBOT7+iY5B4f3fc9eiHOuffAUGEhuudA/q5wk1i+w0KzhBT7iemhYIqS8oI
	8aqKYLFklY1ImZ1ibCWfYjBuNN6k3RymlO3Q0mE2kq3NT22+JXGsG2eROw2eIbxZGL2SJ3OKGoDdI
	EQ6rl5sa1f5PKZwL76grm7IrlKRMCw7Ni/yCsgMdSmuSQRs1gMnJkQRRtyiz9FEc8aTr1+k34g16p
	FBDjHxrQwvyZsLhhnKwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nraOr-005TO9-Kw; Thu, 19 May 2022 07:16:45 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nraOm-005TJ0-Am
 for linux-mediatek@lists.infradead.org; Thu, 19 May 2022 07:16:43 +0000
Received: by mail-pg1-x532.google.com with SMTP id 137so4298983pgb.5
 for <linux-mediatek@lists.infradead.org>; Thu, 19 May 2022 00:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyJfxiPIz8g8A3U05r86isMDJTb4tby+2gyocMXQ0s0=;
 b=P8TJy0mWCyHIFuEVpcIwt+YXcwED7Y8P5hREbHFHwcEUK7qW67KgOICo3B9h2Zdhu/
 Nd/YRCcS/7Nn677WsvLvjvU6iC65Lnh6Kzqg0no+LMb/QjT8OpEUPtEuNp6ViU2TbhIr
 nIJw9ZbMMn849lWy2dTHbMtZPiWk2+4Rbk1Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oyJfxiPIz8g8A3U05r86isMDJTb4tby+2gyocMXQ0s0=;
 b=KOLVEuqrV2JIJEiYEQ6bzkCrRbjmoCAva9/fv1zrt84mLU7avmAIH6/WwVThv8VJex
 AFWHgOFCyYDHy+voGWvGtWNoss3gI1bK3owdBkuguNfKGEAgF0839a6drvX7J/FO6ow9
 WDvReuuXKdd1uKpCIZoDWFnHEQU6ei13F585RhJGmvmYG/IPfEjdMQZl+k2HAwhZbYah
 GajcWiAJowwnv9DmyokHASV5ugA5RMiXVIZ9IHmt9EAR014WikwgZcsquTQn5EnbqyEE
 MOdUFjLf7qUv5ElIKHTdREx/mxfmcxDykmeOrs4KAX31xk3I7LAOi7wVobPbMN5IdJvi
 wqBg==
X-Gm-Message-State: AOAM533zE9ce9QHrcy+OtU6UqdyEVVtwvQ4TunFF+z9bRfq7Fzreh5t1
 k4LQd5T05cgqwgcClt25A66qCw==
X-Google-Smtp-Source: ABdhPJyJQpD7kleyvNScef5SwunEcTily4VJr1/gxKpX7bJKMyn2Kvf4NYxv5cje6E66J3T38zAvfg==
X-Received: by 2002:a05:6a00:e8e:b0:518:287c:ce82 with SMTP id
 bo14-20020a056a000e8e00b00518287cce82mr3516187pfb.4.1652944597421; 
 Thu, 19 May 2022 00:16:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:2338:2871:9320:bed0])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902dac200b00160c970eeb7sm2972945plx.234.2022.05.19.00.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 00:16:36 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] clk: mediatek: Move to struct clk_hw provider APIs
Date: Thu, 19 May 2022 15:16:05 +0800
Message-Id: <20220519071610.423372-1-wenst@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_001640_457322_EA22F297 
X-CRM114-Status: GOOD (  18.72  )
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

This is v3 of part 2 of my proposed MediaTek clk driver cleanup work [1].
This is the final squashed version that is ready to be merged. If you
don't see all the patches on the mailing list, it's because the third
patch is over 100K and gets blocked by LAKML and linux-clk. Please
check LKML on lore.

The version is based on next-20220518. A couple non-clk patches that
fix usage for MT8183 Juniper were included in my branch, hence the
different base hash.

Changes since v2:
- Squahed patches 3~8 as one, and 9~10 as one

Changes since v1:
- Rebased and added coverage of new MT8186 clk drivers
- Split patch "clk: mediatek: Replace 'struct clk' with 'struct clk_hw'"
  into arbitrary pieces so that they don't bounce from the mailing lists

This was tested on MT8183 Juniper by me. Angelo tested on MT8173/92/95
and MT6795 devices, while Miles tested on MT6779.

Original cover letter from v1, with patch numbers fixed:

Part 2 involves moving the whole MediaTek clk driver library from the
old `struct clk` provider API to the new `struct clk_hw` provider API.

Parts of this series were done with coccinelle scripts, while others
were done by hand. To facilitate review, these parts are currently split
into different patches. As a result however, this series is not fully
bisectable. Later on, the related parts should be squashed together.

Patch 1 and 2 are minor cleanups around code that is touched by later
patches.

Patch 3 switches of the underlying data structure used to hold clocks
from `struct clk_onecell_data` to `struct clk_hw_onecell_data`.
This part is done partly by hand, and partly with coccinelle scripts.
The helpers used to allocate the data structures are changed, but none
of the actual call sites, nor the clk provider API usage.

Patch 4 moves most of the MediaTek clk driver library from clk_register*()
to clk_hw_register*, including all intermediate helpers, using
coccinelle scripts. A call site not covered is fixed by hand.

Patch 5 converts the last usage of clk_register*() in the MediaTek clk
drivers.

This series will likely conflict with Rex's "Cleanup MediaTek clk reset
drivers" that was posted earlier today. We'll see how these work out.

The next phase of the cleanup/improvement shall be to introduce some
variant of `struct clk_parent_data` to describe clk relationships
efficiently.

Please have a look and merge.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-clk/20220122091731.283592-1-wenst@chromium.org/

Chen-Yu Tsai (5):
  clk: mediatek: Make mtk_clk_register_composite() static
  clk: mediatek: apmixed: Drop error message from clk_register() failure
  clk: mediatek: Replace 'struct clk' with 'struct clk_hw'
  clk: mediatek: Switch to clk_hw provider APIs
  clk: mediatek: mt8173: Switch to clk_hw provider APIs

 drivers/clk/mediatek/clk-apmixed.c           |  12 +-
 drivers/clk/mediatek/clk-cpumux.c            |  50 +++---
 drivers/clk/mediatek/clk-cpumux.h            |   6 +-
 drivers/clk/mediatek/clk-gate.c              |  52 +++---
 drivers/clk/mediatek/clk-gate.h              |   8 +-
 drivers/clk/mediatek/clk-mt2701-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-bdp.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-eth.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-g3d.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-hif.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt2701-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt2701-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt2701.c            |  26 +--
 drivers/clk/mediatek/clk-mt2712-bdp.c        |   4 +-
 drivers/clk/mediatek/clk-mt2712-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt2712-jpgdec.c     |   4 +-
 drivers/clk/mediatek/clk-mt2712-mfg.c        |   4 +-
 drivers/clk/mediatek/clk-mt2712-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt2712-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt2712-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt2712.c            |  28 +--
 drivers/clk/mediatek/clk-mt6765-audio.c      |   4 +-
 drivers/clk/mediatek/clk-mt6765-cam.c        |   4 +-
 drivers/clk/mediatek/clk-mt6765-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt6765-mipi0a.c     |   4 +-
 drivers/clk/mediatek/clk-mt6765-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt6765-vcodec.c     |   4 +-
 drivers/clk/mediatek/clk-mt6765.c            |  12 +-
 drivers/clk/mediatek/clk-mt6779-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-cam.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-ipe.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-mfg.c        |   4 +-
 drivers/clk/mediatek/clk-mt6779-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt6779-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt6779-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt6779.c            |  12 +-
 drivers/clk/mediatek/clk-mt6797-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt6797-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt6797-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt6797-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt6797.c            |  22 +--
 drivers/clk/mediatek/clk-mt7622-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt7622-eth.c        |   8 +-
 drivers/clk/mediatek/clk-mt7622-hif.c        |   8 +-
 drivers/clk/mediatek/clk-mt7622.c            |  30 ++--
 drivers/clk/mediatek/clk-mt7629-eth.c        |   8 +-
 drivers/clk/mediatek/clk-mt7629-hif.c        |   8 +-
 drivers/clk/mediatek/clk-mt7629.c            |  30 ++--
 drivers/clk/mediatek/clk-mt7986-apmixed.c    |   6 +-
 drivers/clk/mediatek/clk-mt7986-eth.c        |  12 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c   |   4 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c   |  16 +-
 drivers/clk/mediatek/clk-mt8135.c            |  18 +-
 drivers/clk/mediatek/clk-mt8167-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt8167-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt8167-mfgcfg.c     |   4 +-
 drivers/clk/mediatek/clk-mt8167-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8167-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt8167.c            |  12 +-
 drivers/clk/mediatek/clk-mt8173-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8173.c            |  69 ++++----
 drivers/clk/mediatek/clk-mt8183-audio.c      |   4 +-
 drivers/clk/mediatek/clk-mt8183-cam.c        |   4 +-
 drivers/clk/mediatek/clk-mt8183-img.c        |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu0.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu1.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu_adl.c    |   4 +-
 drivers/clk/mediatek/clk-mt8183-ipu_conn.c   |   4 +-
 drivers/clk/mediatek/clk-mt8183-mfgcfg.c     |   4 +-
 drivers/clk/mediatek/clk-mt8183-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8183-vdec.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183-venc.c       |   4 +-
 drivers/clk/mediatek/clk-mt8183.c            |  25 +--
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c |   6 +-
 drivers/clk/mediatek/clk-mt8186-mcu.c        |   6 +-
 drivers/clk/mediatek/clk-mt8186-mm.c         |   6 +-
 drivers/clk/mediatek/clk-mt8186-topckgen.c   |   6 +-
 drivers/clk/mediatek/clk-mt8192-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt8192-mm.c         |   4 +-
 drivers/clk/mediatek/clk-mt8192.c            |  21 +--
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c |   6 +-
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c |   6 +-
 drivers/clk/mediatek/clk-mt8195-topckgen.c   |   6 +-
 drivers/clk/mediatek/clk-mt8195-vdo0.c       |   6 +-
 drivers/clk/mediatek/clk-mt8195-vdo1.c       |   6 +-
 drivers/clk/mediatek/clk-mt8516-aud.c        |   4 +-
 drivers/clk/mediatek/clk-mt8516.c            |  12 +-
 drivers/clk/mediatek/clk-mtk.c               | 173 +++++++++----------
 drivers/clk/mediatek/clk-mtk.h               |  25 ++-
 drivers/clk/mediatek/clk-mux.c               |  50 +++---
 drivers/clk/mediatek/clk-mux.h               |   6 +-
 drivers/clk/mediatek/clk-pll.c               |  52 +++---
 drivers/clk/mediatek/clk-pll.h               |   6 +-
 95 files changed, 543 insertions(+), 554 deletions(-)

-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
