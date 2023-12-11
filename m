Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77738C4167D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/F4KkxxcZDASZbFDAtLzUHPjVyFHpZY6rdS9xgN+DqI=; b=MDaBUF/bCaMtEpSZnzWkboz70B
	1UrIGDgEitiD4je0BT9OiDO16+RVNiXI3YcK+3peVHXZt7caGAWAtK7J12Vb6lXvJ5dVKSnmBfZoA
	rVZ9xDbdL3X0G2RMLqHDOn4OQlp03QsD6plgTYUwamzdLRVhCXD5b5nXWjdgtB7OKx/akxyaVTNm1
	1VXSjkYO2FctwSBxb5VgWOJ5CvuIALmozArFa7hUnANivUYB2QjkWGPEA4yU0PUJCqIzbV9F4TR5p
	Wp0QfIQ3j4rVy3YRVvuG+dO/LEZwJXfOUNUtfsWFhMkU7g8W9KLo4UwwXLyLPATrRUQlhi1RKzEwM
	/ogFFfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZE-007HCY-15;
	Mon, 11 Dec 2023 19:03:48 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ4-007GxK-1W;
	Mon, 11 Dec 2023 19:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321418; x=1733857418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ACcmTJgIefDIVYbDCBBfrcMa7Src+AAIG2eWNqY+244=;
  b=PiXi40Dvk5DiOd0v0tYcjOFNcyYj41Z6wKsnMe01NswT078nxZhVMklf
   3LuvrrExxh/GLqAKXT/AtIG25nPgKctZeSWG+nxRvt7IDqaZnM5lgbTMT
   S3bx6rs9nEmQGYBvusA6JLEgNiexq6x8voHj9otfnoo9OovlqwHJwXBrT
   dpM0syFNmqyIDDogqEsI3uLm0fEvzYv6Xdj8tiz8TBVunTn9ownJvYvl4
   aletzaw2q09ZTCXhprXw6vM6t9evX5lfoHp+x9gdXS1Ud1A4MJQceYCJh
   YGX7Cm7OwutzI9O2YXeWDEMZnVx7XLfoJ6G/dfILWgq75+yp1ZOqM18HN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379692514"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379692514"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946445054"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946445054"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 11:03:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7601E3AE; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
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
Subject: [PATCH v5 03/13] pinctrl: ingenic: Use C99 initializers in PINCTRL_PIN_GROUP()
Date: Mon, 11 Dec 2023 20:57:56 +0200
Message-ID: <20231211190321.307330-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_110338_588213_D100762F 
X-CRM114-Status: GOOD (  10.09  )
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

For the better flexibility use C99 initializers in PINCTRL_PIN_GROUP().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index ee718f6e2556..f5661dcdedf5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -82,16 +82,21 @@
 #define PINS_PER_GPIO_CHIP			32
 #define JZ4730_PINS_PER_PAIRED_REG	16
 
-#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
-	{						\
-		name,					\
-		id##_pins,				\
-		ARRAY_SIZE(id##_pins),			\
-		funcs,					\
+#define INGENIC_PIN_GROUP_FUNCS(_name_, id, funcs)					\
+	{										\
+		.name = _name_,								\
+		.pins = id##_pins,							\
+		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.data = funcs,								\
 	}
 
-#define INGENIC_PIN_GROUP(name, id, func)		\
-	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
+#define INGENIC_PIN_GROUP(_name_, id, func)						\
+	{										\
+		.name = _name_,								\
+		.pins = id##_pins,							\
+		.num_pins = ARRAY_SIZE(id##_pins),					\
+		.data = (void *)func,							\
+	}
 
 enum jz_version {
 	ID_JZ4730,
-- 
2.43.0.rc1.1.gbec44491f096


