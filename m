Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473CFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 08:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1fG0K8itlz8dtFDjsud76SzJ9YgThuQJXmGTHeAQVHo=; b=M8lL75DypHMu2S
	8pwcgCQfbB+UeJmpsvVRklJiCzH5v88z7pWkEwdJ25KLKJhG8mG3kjjgCVcMPu//JmD3sdDjN8vxO
	dOPJF1D/aLdJfjsnnqBBNQGOwimRnTPHO0/NOELSh5r70FAqkL6ttYM20kSYTOi5tSXtxgRCuaFkg
	Uc9yeJUpPW99vtcltx6ksJd+Fi8kzh2ldwjUVAoQrgNXe1P0g4GIewg075kI6EabwXoXAB0J7q40F
	NC8Qgi7OgaAEmAuIFlxJOaBp+LVGTL2Zmqc4DZaYZ0h6TC8PWOKcsKG+unZrkFO1sZhAjj6QFjCVh
	O3v01Z8CcsABCLZmp1Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjbI-00FhtV-5K; Fri, 08 Apr 2022 08:04:12 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjYA-00FgFO-RK
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 08:01:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=k1; bh=C7ZjX1Ay6A/plBz2rUUu8D4qiQF
 xw0oR7oGq/pKxKlk=; b=ogqZkcL+bbHbO7CIyhql+OroIyHhLelivbaaveHiJrM
 0TqEqV+Z8yyjphNMQTQoC6rubhkjUmvyu6siOoWt6IsGl58UxSu8pEajUJ/yPzx2
 4B+I7r/Y7vesIl8/YqcJcSf9KAYRS4uw9RfTnn/e6PWrZhbWxltQU1NDMXA0ia2o
 =
Received: (qmail 3517144 invoked from network); 8 Apr 2022 10:00:48 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 8 Apr 2022 10:00:48 +0200
X-UD-Smtp-Session: l3s3148p1@v+kX/h/cTKQgAQnoAEvdAHNhR6IfKwZI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 ath10k@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 brcm80211-dev-list.pdl@broadcom.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com
Subject: [PATCH 0/3] mmc: improve API to make clear {h|s}w_reset is for cards
Date: Fri,  8 Apr 2022 10:00:41 +0200
Message-Id: <20220408080045.6497-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_010059_960054_F58B0631 
X-CRM114-Status: UNSURE (   9.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As discussed in 2020 [1], Ulf and I agreed that it would be easier to
understand the {h|s}w_reset mechanisms if it was clear that they are for
cards. This series implements that by changing the parameter to mmc_card
where apropriate. Also, the callback into host drivers has been renamed
to 'card_hw_reset' to make it obvious what exactly the driver is
expected to reset.

I tested it with my Renesas boards, so far no regressions. Buildbots are
currently checking the series.

This series is based on mmc/next as of yesterday. A branch is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mmc/reset-api-v2

Looking forward to comments. Happy hacking,

   Wolfram

[1] https://lore.kernel.org/all/20200916090121.2350-1-wsa+renesas@sang-engineering.com/

Wolfram Sang (3):
  mmc: core: improve API to make clear mmc_hw_reset is for cards
  mmc: core: improve API to make clear that mmc_sw_reset is for cards
  mmc: improve API to make clear hw_reset callback is for cards

 drivers/mmc/core/block.c                             |  2 +-
 drivers/mmc/core/core.c                              | 12 +++++++-----
 drivers/mmc/core/mmc.c                               |  4 ++--
 drivers/mmc/core/mmc_test.c                          |  3 +--
 drivers/mmc/host/bcm2835.c                           |  2 +-
 drivers/mmc/host/dw_mmc.c                            |  2 +-
 drivers/mmc/host/meson-mx-sdhc-mmc.c                 |  2 +-
 drivers/mmc/host/mtk-sd.c                            |  2 +-
 drivers/mmc/host/sdhci.c                             |  2 +-
 drivers/mmc/host/sunxi-mmc.c                         |  2 +-
 drivers/mmc/host/uniphier-sd.c                       |  2 +-
 drivers/net/wireless/ath/ath10k/sdio.c               |  2 +-
 .../net/wireless/broadcom/brcm80211/brcmfmac/sdio.c  |  2 +-
 drivers/net/wireless/marvell/mwifiex/sdio.c          |  2 +-
 drivers/net/wireless/ti/wlcore/sdio.c                |  2 +-
 include/linux/mmc/core.h                             |  4 ++--
 include/linux/mmc/host.h                             |  2 +-
 17 files changed, 25 insertions(+), 24 deletions(-)

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
