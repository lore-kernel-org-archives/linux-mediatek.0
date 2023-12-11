Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47B5C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Dec 2023 19:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G07EA5sYUMUL3Tim8BDgxh3YuaRiwuPigXkeC03JEpI=; b=zJsYjfF/J6S1xC9vND2EfNT46V
	1unCYACb31irvdypk1JvvSk4LkY2Q1CtmD/RJVKn4/0qm1PufLjGd2SzQFJr33z/KFety2MYZ0MFN
	0JYLdunAS53U67CRmn4fGCUyOJn2xfpJLi/ATidjNKxS3i6gfgS27B+INgA0stGrdnXB6P3Qjxmt6
	qGeMMICUCTyZnVAnfEdYWf+19jqYylhMNPM71txVcGk2IV714KB7OZx3TCwfnv6tenyUsxeop3mr1
	qgZeMHYYXS7g59bfpJ5JBJeGaEBeWo9cbwxD3a+vfgf8Fsqyro31qXj7tFcZzdKEIiyZTYj4VsI1V
	DOWTzF2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ9-007H7Y-0q;
	Mon, 11 Dec 2023 19:03:43 +0000
Received: from mgamail.intel.com ([134.134.136.126])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rClZ2-007GxK-39;
	Mon, 11 Dec 2023 19:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702321416; x=1733857416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LiqBDpyusmg3WhaebVfG+XnzpgrEpQqtzwlk9RFgoFg=;
  b=lYM7k2YkPBig5lc/ib9fWrMuSUmpHaclxOBNqZ7Tab+Jn/wYI29gHVlk
   YAgyj+0gI30V7zlXZnB2BQdGcHW9IRe6HqyyGicG74CTzy7ScrHN86HgV
   8LiFBcuxEWHdR5FGXptUFMxcpbZu7gdKSsC+VlIuuTlo5/Ma309IFZOMJ
   jVOXVkf50hCE4TtaTsgwwP3M/6P1pLzZvEN5mIjmmUMQ0QVT4gt1cS8pb
   zU8JBzaSdlDuAo8pde7+S2NO1lGEIknDS9IPVbkSE77ZskNYaqhiFumCk
   FUmVBn47iI/AsEoeOJB1OaPmShDkuSfDIdiC6pKeS2mvCaj2mwwWjtLdY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="379692472"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="379692472"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 11:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="946445046"
X-IronPort-AV: E=Sophos;i="6.04,268,1695711600"; 
   d="scan'208";a="946445046"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 11 Dec 2023 11:03:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 58B9CE7; Mon, 11 Dec 2023 21:03:23 +0200 (EET)
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
Subject: [PATCH v5 01/13] pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
Date: Mon, 11 Dec 2023 20:57:54 +0200
Message-ID: <20231211190321.307330-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
References: <20231211190321.307330-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_110337_081516_2AB37739 
X-CRM114-Status: GOOD (  11.09  )
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

Add PINCTRL_GROUP_DESC() macro for inline use.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 5 +----
 drivers/pinctrl/core.h | 9 +++++++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 6380e1fa6509..75f2689c3bad 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -658,10 +658,7 @@ int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
 	if (!group)
 		return -ENOMEM;
 
-	group->name = name;
-	group->pins = pins;
-	group->num_pins = num_pins;
-	group->data = data;
+	*group = PINCTRL_GROUP_DESC(name, pins, num_pins, data);
 
 	error = radix_tree_insert(&pctldev->pin_group_tree, selector, group);
 	if (error)
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 8ef4b536bca5..bf971e6a7846 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -208,6 +208,15 @@ struct group_desc {
 	void *data;
 };
 
+/* Convenience macro to define a generic pin group descriptor */
+#define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
+(struct group_desc) {						\
+	.name = _name,						\
+	.pins = _pins,						\
+	.num_pins = _num_pins,					\
+	.data = _data,						\
+}
+
 int pinctrl_generic_get_group_count(struct pinctrl_dev *pctldev);
 
 const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
-- 
2.43.0.rc1.1.gbec44491f096


