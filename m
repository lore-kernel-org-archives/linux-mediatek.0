Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18289C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KEvWZitGPcOMbds/szdlyRQVSvCbw6ygyu/in0oo5OM=; b=T+BGBc8jzGcQPP
	lt8Wr3+cZIhJ6JjZgPhURdCXQdVuZsPsEqjJRCgo9k7RT3gDtgyf2OmeOV8ZnLzRe5ilTst4MDUKt
	2Mz4sT8v0S7Aaj+vuKw70korJ/lnmPOC5D+RhH+MGaalFgGkBFN1qEUnhEcL7ok0M87FRMYuz6pl9
	JDmnrZEiLX1ELb4165CIsZC5ZufIi9xYvFIthJhBa3UewoBj5phM4S17MSaVT9mxkHDqz5XLwtxsE
	Afp6nC39ylONX4dQ3yjXpXDMq+EzPrWXmJI0nAUI3tUbXR1inNMpyy1jkCAe+pQFJif8MNvDKQCuq
	2IhSKDm4zk+RY3I2mjCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGZP-007UG2-2n; Mon, 21 Mar 2022 11:51:31 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGZ8-007U6m-18
 for linux-mediatek@lists.infradead.org; Mon, 21 Mar 2022 11:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=4S4Px63e2+0FVo0SEWjX4AYw/Zi
 RThDbqzQpdXY0uk8=; b=oAESevOu8MJwUG4o1adMH4KtpWH/2eoSmcbwjO+TA6a
 lGEZ8rUQjQZl1MfxvSzBiy3fAd0gwqzMWEeOtzhQbUH+mntJ6x+4KhSO6kL0y7/R
 vDJOP8mgSH4whimqnpvNWnAMtcn0K6Zt+5CKKMjWEzEhQbvxiJEy/7Rgh8TG52l4
 =
Received: (qmail 860167 invoked from network); 21 Mar 2022 12:51:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 21 Mar 2022 12:51:05 +0100
X-UD-Smtp-Session: l3s3148p1@EjOBHLnaAKcgAQnoAFxnAN8BywfgXJ9V
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 ath10k@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 brcm80211-dev-list.pdl@broadcom.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com
Subject: [RFC PATCH 00/10] mmc: improve API to make clear {h|s}w_reset is for
 cards
Date: Mon, 21 Mar 2022 12:50:46 +0100
Message-Id: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_045114_715983_159E2283 
X-CRM114-Status: GOOD (  14.41  )
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

As discussed in 2020 [1], Ulf and I agreed that it would be easier to
understand the {h|s}w_reset mechanisms if it was clear that they are for
cards. This RFC series implements that by adding 'card' to the function
names and changing the parameter to mmc_card where apropriate. Note that
I only changed the MMC core. The SDHCI driver still uses hw_reset in its
ops, I leave it to the SDHCI maintainers if they want to change that.
Also, I didn't convert CAP_HW_RESET to CAP_CARD_HW_RESET yet although it
should be done IMHO. However, we need an agreement on that first.
Finally, I also did not check if all the host drivers are really doing a
card reset or a controller reset. I tried but it was often not obvious
what is actually happening in these functions without proper manuals.

I tested it with my Renesas boards, so far no regressions. Buildbots are
currently checking the series. For this RFC, I sent this as one series
so people can get an overview and comment on that. For a proper release,
I think patches 1-5 should be one series, and 7-10 probably. Patch 6
could then be applied once patches 2-4 hit the net tree. That's my
proposal.

This series is based on mmc/next as of yesterday. A branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mmc/reset-api

Looking forward to comments. Happy hacking,

   Wolfram

[1] https://lore.kernel.org/all/20200916090121.2350-1-wsa+renesas@sang-engineering.com/

Wolfram Sang (10):
  mmc: core: improve API to make clear mmc_hw_reset is for cards
  ath10k: sdio: update to new MMC API for resetting cards
  brcmfmac: sdio: update to new MMC API for resetting cards
  mwifiex: sdio: update to new MMC API for resetting cards
  wlcore: sdio: update to new MMC API for resetting cards
  mmc: core: remove fallback for mmc_hw_reset()
  mmc: core: improve API to make clear that mmc_sw_reset is for cards
  mmc: core: improve API to make clear hw_reset from bus_ops is for
    cards
  mmc: core: improve API to make clear sw_reset from bus_ops is for
    cards
  mmc: improve API to make clear hw_reset callback is for cards

 drivers/mmc/core/block.c                      |  2 +-
 drivers/mmc/core/core.c                       | 31 ++++++++++---------
 drivers/mmc/core/core.h                       |  4 +--
 drivers/mmc/core/mmc.c                        | 10 +++---
 drivers/mmc/core/mmc_test.c                   |  3 +-
 drivers/mmc/core/sd.c                         |  8 ++---
 drivers/mmc/core/sdio.c                       | 12 ++++---
 drivers/mmc/host/bcm2835.c                    |  2 +-
 drivers/mmc/host/dw_mmc.c                     |  2 +-
 drivers/mmc/host/meson-mx-sdhc-mmc.c          |  2 +-
 drivers/mmc/host/mtk-sd.c                     |  2 +-
 drivers/mmc/host/sdhci.c                      |  2 +-
 drivers/mmc/host/sunxi-mmc.c                  |  2 +-
 drivers/mmc/host/uniphier-sd.c                |  2 +-
 drivers/net/wireless/ath/ath10k/sdio.c        |  2 +-
 .../broadcom/brcm80211/brcmfmac/sdio.c        |  2 +-
 drivers/net/wireless/marvell/mwifiex/sdio.c   |  2 +-
 drivers/net/wireless/ti/wlcore/sdio.c         |  2 +-
 include/linux/mmc/core.h                      |  4 +--
 include/linux/mmc/host.h                      |  2 +-
 20 files changed, 51 insertions(+), 47 deletions(-)

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
