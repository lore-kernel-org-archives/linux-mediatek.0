Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B74C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 19:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ga1eW2Puko/CFBYQeSNtHdykh4udzY2MeoM9MrS5EIs=; b=VYlcF0hLgdHBNpNuTL4z6X0rc8
	DSVRoM3aSU5G8VoUNEcxfdmbwjyJfZUilzYfdhVxCELvearonqOecC2EmFGcIfkuU7vQmnnPS/PaY
	7MuNpdOxpQW/Rula+4enTJ7VD4o1lXluvmvJj4CCrRMUvti8k4C8RieyZL4Qfss4Vi9ahd8uiC5jH
	KN/YjcDHdAILQsUW/mOMgWgFKAqiHtWHiva6OxCcbA85z52tdz9MjfHh6gbpR/RzfrKtiwFE/jGiK
	c9tCMrqyo6uANO2OLRATNeRpAOeCZQqX0n//RhGUUi7EqT07Ita8kwchhE6vlbNmS7roKl5sPE8Pf
	TzIZxMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZE-007HD1-2g;
	Mon, 11 Dec 2023 19:03:48 +0000
Received: from mgamail.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ3-007H0t-2q;
	Mon, 11 Dec 2023 19:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321417; x=1733857417;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q2BczxrNZm1mBCco6sqW/QGBn/6Xmav22CnVogTYodc=;
  b=RduQeacqgb/9arZ5AqJQFik8Y/nIT4tCmYeQAn4NpAqUp6yFdRSNz9Oq
   lfgyjfXn8Wgg4rVIg/TvBVC/AUkuh9zHYMyg/cs52y6XO0H7THj9sFfy3
   7+vBQW082ekjdY8RrSZvIosmCaCQVOMO7o8o55jQjDID6fzu0w7kzbtJC
   tD3+wf+KbCR68i3wtZ/yAant2SYfp59qHnOhiixi6MYJQkeq1Vo8hJpMB
   s/OmJllyjOuH9VUPdKzhRT60S7XmvKHkFvUFKA63OF5k3J0zcWCZGib07
   sKh2B7hN/j/Rl2+WPoJrAKhofmhxHl/1uxjxNMUykUh9l520OFnsNYWWF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="480893477"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="480893477"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="766491653"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="766491653"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Dec 2023 11:03:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4AFB52AB; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 00/13] pinctrl: Convert struct group_desc to use struct pingroup
Date: Mon, 11 Dec 2023 20:57:53 +0200
Message-ID: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_110337_931900_A165D9F0 
X-CRM114-Status: UNSURE (   9.69  )
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

The struct group_desc has a lot of duplication with struct pingroup.
Deduplicate that by embeddind the latter in the former and convert
users.

NB. The function_desc is in plan to follow the similar deduplication.

This time test-compiled with old GCC 8 for arm64, besides GCC 13 and
LLVM 16 for x86_64.

In v5:
- dropped applied patches
- elaborated the need of the conversion (Fabio)
- reworked to avoid build errors on old GCC (Marek, Krzysztof, Geert)

v4: https://lore.kernel.org/r/20231129161459.1002323-1-andriy.shevchenko@linux.intel.com

In v4:
- made pins also unsigned in struct group_desc (Geert)
- made local pins variable unsigned in renesas drivers (Geert)
- collected more tags (Paul, Geert)

v3: https://lore.kernel.org/r/20231128200155.438722-1-andriy.shevchenko@linux.intel.com

In v3:
- fixed reported bug in equilibrium code (LKP)                                                                   - collected tags (Emil, Florian, Paul)

v2: https://lore.kernel.org/r/20231123193355.3400852-1-andriy.shevchenko@linux.intel.com

In v2:
- added a few patches to fix multiple compile-time errors (LKP)
- added tag (Jonathan)

v1: https://lore.kernel.org/r/20231122164040.2262742-1-andriy.shevchenko@linux.intel.com

Andy Shevchenko (13):
  pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
  pinctrl: mediatek: Use C99 initializers in PINCTRL_PIN_GROUP()
  pinctrl: ingenic: Use C99 initializers in PINCTRL_PIN_GROUP()
  pinctrl: core: Embed struct pingroup into struct group_desc
  pinctrl: bcm: Convert to use grp member
  pinctrl: equilibrium: Convert to use grp member
  pinctrl: imx: Convert to use grp member
  pinctrl: ingenic: Convert to use grp member
  pinctrl: keembay: Convert to use grp member
  pinctrl: mediatek: Convert to use grp member
  pinctrl: renesas: Convert to use grp member
  pinctrl: starfive: Convert to use grp member
  pinctrl: core: Remove unused members from struct group_desc

 drivers/pinctrl/bcm/pinctrl-ns.c              |  4 +--
 drivers/pinctrl/core.c                        | 11 +++---
 drivers/pinctrl/core.h                        | 17 +++++----
 drivers/pinctrl/freescale/pinctrl-imx.c       | 31 ++++++++--------
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 13 ++++---
 drivers/pinctrl/mediatek/pinctrl-moore.h      | 10 +++---
 drivers/pinctrl/mediatek/pinctrl-paris.h      | 10 +++---
 drivers/pinctrl/pinctrl-equilibrium.c         |  4 +--
 drivers/pinctrl/pinctrl-ingenic.c             | 35 ++++++++++---------
 drivers/pinctrl/pinctrl-keembay.c             |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza1.c        |  2 +-
 drivers/pinctrl/renesas/pinctrl-rza2.c        | 10 +++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c       |  4 +--
 drivers/pinctrl/renesas/pinctrl-rzv2m.c       |  4 +--
 .../starfive/pinctrl-starfive-jh7100.c        |  8 ++---
 .../starfive/pinctrl-starfive-jh7110.c        |  8 ++---
 16 files changed, 84 insertions(+), 89 deletions(-)

-- 
2.43.0.rc1.1.gbec44491f096


