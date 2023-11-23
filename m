Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD90FC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYptDPmUHUBPIL2BGdHO5tQXLiJSx/pk4xrhZuhmw7M=; b=Cdnihs1xmFpj/D0LzMBGZ5nZvj
	ztZW48VlWpNydT+62Y7ciUMRD0YUGosBi7fOfM2/DUgMphpmSzqhIE1Hv8Vds5N0sCWHWsFgkq2Y/
	aa/v4bcqAPqSnWEr34Z1cKXLWpkGUvZ+zsBE5cFCKvhwU626qnh7YETEjTMS2AgAgAip6OeZW9TwA
	122bl06dwB2iXRv9T6FfAJziyI5/apTga1iZQYAnkF6OERsiEy8UdoTMh2nGsOALYkWp3JMRrwbTQ
	N1pcOO6JcLuUx687X1Oc/COj/oQ33k2ScL0yvcAth7zukv4cpjYKh3zfcI7WA8PTbP6BtixH+qeor
	rLPiUSHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FTS-005c4L-2A;
	Thu, 23 Nov 2023 19:34:54 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FSr-005bg9-1a;
	Thu, 23 Nov 2023 19:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768057; x=1732304057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oWROro8zaz/FXYo/HWfHQvzRYrdVT7osWgNgoAMuX7s=;
  b=Mu1xLNsTC8F+Lu0qBuq3xpn68jtrHF+8t+G/LieVfHEpD6kIYG7SunMg
   Vjvf1266B0UxYaf+QYRJvy6a7AqL2RsvLLLawnhCMFTnkb/qb8PZY5Se1
   DbDfhFeiGYMBaUQOaOaW59RydCACDlbaKZQtI11DWtE8HlOmrRxWpCedI
   sqHWapKlyO7knhYBX2v0osKrVE8AqkRKsOP94pHDAm2+gQjWYsN7LS01k
   xkbJkY6ADQbj5uAfHkcmYpKprWlmIaHRQVCcM1y0t6H2npfrN1LR5vFuc
   q6o0FMBz6/iyIVvEuAkWlrx/S1A3xL4c6YEUvF8I4QqDuD1E/iWf3G5tD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371671424"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="371671424"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771062252"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="771062252"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2023 11:34:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3141F6E3; Thu, 23 Nov 2023 21:33:59 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
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
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v2 12/21] pinctrl: core: Embed struct pingroup into struct group_desc
Date: Thu, 23 Nov 2023 21:31:40 +0200
Message-ID: <20231123193355.3400852-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113417_560185_32361951 
X-CRM114-Status: GOOD (  14.93  )
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

struct group_desc is a particular version of the struct pingroup
with associated opaque data. Start switching pin control core and
drivers to use it explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 15 ++++++++++++---
 drivers/pinctrl/core.h |  5 +++++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 3f1fd50fbb10..e08d4b3b0a56 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -559,7 +559,10 @@ const char *pinctrl_generic_get_group_name(struct pinctrl_dev *pctldev,
 	if (!group)
 		return NULL;
 
-	return group->name;
+	if (group->name)
+		return group->name;
+
+	return group->grp.name;
 }
 EXPORT_SYMBOL_GPL(pinctrl_generic_get_group_name);
 
@@ -585,8 +588,14 @@ int pinctrl_generic_get_group_pins(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 	}
 
-	*pins = group->pins;
-	*num_pins = group->num_pins;
+	if (group->pins) {
+		*pins = group->pins;
+		*num_pins = group->num_pins;
+		return 0;
+	}
+
+	*pins = group->grp.pins;
+	*num_pins = group->grp.npins;
 
 	return 0;
 }
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 276a631fd49c..863b4956a41e 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -194,14 +194,18 @@ struct pinctrl_maps {
 
 #ifdef CONFIG_GENERIC_PINCTRL_GROUPS
 
+#include <linux/pinctrl/pinctrl.h>
+
 /**
  * struct group_desc - generic pin group descriptor
+ * @grp: generic data of the pin group (name and pins)
  * @name: name of the pin group
  * @pins: array of pins that belong to the group
  * @num_pins: number of pins in the group
  * @data: pin controller driver specific data
  */
 struct group_desc {
+	struct pingroup grp;
 	const char *name;
 	const int *pins;
 	int num_pins;
@@ -211,6 +215,7 @@ struct group_desc {
 /* Convenience macro to define a generic pin group descriptor */
 #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
 (struct group_desc) {						\
+	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
 	.name = _name,						\
 	.pins = _pins,						\
 	.num_pins = _num_pins,					\
-- 
2.43.0.rc1.1.gbec44491f096


