Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD907C61DA7
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 16:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ESolNPPodWQXLh25MkzGWN/PFQ1x/aq31r3CjcUaAs4=; b=OuFAttUUlf9EF3aru6UNThJ5oJ
	8km87ktLQLBsnBQKiPc5PALW/FKdKZO2H4Ja0PmCh+1RcAffsHrJgE0D+vYmj2p7fLTfYkcHgbbvY
	7UDWQbXaJLUoobxAl+0zGYZGzmhnUCGSk9jW0FuvHKLpKRtqKSda4XXZl66FGeqH2IAgTr5q9VCtb
	cjEkYucx6Jg2lDXYDYD9Nu6QT0d6HxEIm1Jg9UhWMumqcAHoKWFQd3IOhm4OJ+tlxO6MEUoEo/LFU
	g9RgIMw4Qx2TUDO9+BJzVn/NHLHZ4eYMUW/ILQoJgC3IwzQEFNcoiiPEnhkzD/dsSnFmeqV70FfB+
	U4jP697w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qID-002WxT-2A;
	Wed, 22 Nov 2023 16:41:37 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qI1-002Wlb-0E;
	Wed, 22 Nov 2023 16:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671283; x=1732207283;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pWnDbmY5RT1+cdoLNLDZdCKDRCY/tWx5Z+RHsFY6D8c=;
  b=kIzvpQZl3fyS0MmuZdR8X1PF5EB7Z4B7jL1blKRlX87O9pUKIVhTQUqm
   wznDHAUO872BtxbgYOusmXyN5qrAkfNCQHFoUA7hG5RgypPQipROaEW4j
   ysWunZZRKV0Z2cAz66OG1Q7vaZfDkl5LuEhS9Lo+/ieL9Guy818uHsLR7
   EKnsM4dMFEi+CUfImj25KBlqIHSBw9E7AIWrXAzs4kh9wRqsq+UUuj/C4
   lqZ7BDFhdSM74vg/WS08hGOKXe/4FtqKvHRIhrTEc/VzFLpT7aU8CggQ4
   w8LCMaiuha+Z+nD1h2gBF3+JW1WIH3dW9qDeE8vC4CGigt4O3if60xixy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456414413"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="456414413"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884681708"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884681708"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 08:41:14 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id EC530A04; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	openbmc@lists.ozlabs.org,
	linux-mips@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
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
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v1 17/17] pinctrl: core: Remove unused members from struct group_desc
Date: Wed, 22 Nov 2023 18:35:49 +0200
Message-ID: <20231122164040.2262742-18-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084125_158208_225869E6 
X-CRM114-Status: GOOD (  12.53  )
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

All drivers are converted to use embedded struct pingroup.
Remove unused members from struct group_desc.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 9 ---------
 drivers/pinctrl/core.h | 9 ---------
 2 files changed, 18 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 981e2e375a39..d3458284b9de 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -559,9 +559,6 @@ const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
 	if (!group)
 		return NULL;
 
-	if (group->name)
-		return group->name;
-
 	return group->grp.name;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_get_group_name);
@@ -588,12 +585,6 @@ int pinctrl_generic_get_group_pins(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	if (group->pins) {
-		*pins = group->pins;
-		*num_pins = group->num_pins;
-		return 0;
-	}
-
 	*pins = group->grp.pins;
 	*num_pins = group->grp.npins;
 
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 7a21af2b437e..7af74bfaff0e 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -199,16 +199,10 @@ struct pinctrl_maps {
 /**
  * struct group_desc - generic pin group descriptor
  * @grp: generic data of the pin group (name and pins)
- * @name: name of the pin group
- * @pins: array of pins that belong to the group
- * @num_pins: number of pins in the group
  * @data: pin controller driver specific data
  */
 struct group_desc {
 	struct pingroup grp;
-	const char *name;
-	int *pins;
-	int num_pins;
 	void *data;
 };
 
@@ -216,9 +210,6 @@ struct group_desc {
 #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
 (struct group_desc) {						\
 	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
-	.name = _name,						\
-	.pins = _pins,						\
-	.num_pins = _num_pins,					\
 	.data = _data,						\
 }
 
-- 
2.43.0.rc1.1.gbec44491f096


