Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A68C61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anTtiC2OivjXTLiFNi+8mAML1Z7aJiqLP2gBQpQzTLw=; b=eX2k1DboDkyO1ErBHBBw8S3rir
	S7evTLHM3B/Z92WgeF9wjOcmBJXH6B4OsaKO1ALkZBBupn0Z6Z2yGIKmsDaeUClu5zBpHC0H7bHoH
	iiF04ERamzqz9LFEn0zI4YpToIo6EXUyvDI1Qgv5KVHTHCD+wOKFGlF72wL8V3l+yTcH97w6Lj/aI
	spAq5DXZF1fyhF9o+p03iBkq5Ed+UFiCAS2/aRXG3rqdnNJJGzejUmJ/xMnA+rrgHF6vG9Ff93JPf
	B9h+w60so4Bo0rS0OA0PHHiiCHZSLM5tcNu3zXIMj9DZtcahFWq27DrmO2GH7TOVrqIevkpA8LwP4
	q8glTe9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FTh-005cF4-2L;
	Thu, 23 Nov 2023 19:35:09 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FSs-005bcN-18;
	Thu, 23 Nov 2023 19:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700768058; x=1732304058;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3nCf9Nawx9DZLMwtP7gm5hKJWHmWiIVjJbmiWUav9q4=;
  b=ja7daz8WRMe22UB95QTJFFc4StHMXjuhuEjg6iMrBU7IkP9ePDHWb0TU
   ZxpgvGTowLG/MxgIMthEZd3b0+C4V3bNN+6jXU7o+j0IJ9i2i+h4QQdhW
   f7InqcxnKoNt+dS0LufICUbpv7Q94x3q7rFSOjS5uftWjiFLUZUpEedkJ
   JdYQNVVPq7g1sjFzlFvoUQaVkOwEqN/YADUzGsZAmB9nqzXCynYfCM0Mr
   lPl8hHZjIE17pqC8pVPv/AFrxnGhPfirAEQsP7UavAWJyVsLcZbm4EHID
   R7Zzvnyap4leqdwPHEIDVVMYWp7uOlXmpyzpggVyAepS73vezn8Qzo5Ht
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371671440"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="371671440"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 11:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="771062254"
X-IronPort-AV: E=Sophos;i="6.04,222,1695711600"; 
   d="scan'208";a="771062254"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 23 Nov 2023 11:34:09 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2590463E; Thu, 23 Nov 2023 21:33:59 +0200 (EET)
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
Subject: [PATCH v2 11/21] pinctrl: mediatek: Make use of PINCTRL_GROUP_DESC()
Date: Thu, 23 Nov 2023 21:31:39 +0200
Message-ID: <20231123193355.3400852-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
References: <20231123193355.3400852-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113418_437078_DD5A88E1 
X-CRM114-Status: UNSURE (   9.30  )
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

Make use of PINCTRL_GROUP_DESC() instead of open coding it.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.h | 7 +------
 drivers/pinctrl/mediatek/pinctrl-paris.h | 7 +------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index e1b4b82b9d3d..22ef1ffbcdcb 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -38,12 +38,7 @@
 	}
 
 #define PINCTRL_PIN_GROUP(name, id)			\
-	{						\
-		name,					\
-		id##_pins,				\
-		ARRAY_SIZE(id##_pins),			\
-		id##_funcs,				\
-	}
+	PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
 
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.h b/drivers/pinctrl/mediatek/pinctrl-paris.h
index 8762ac599329..f208a904c4a8 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.h
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.h
@@ -50,12 +50,7 @@
 	}
 
 #define PINCTRL_PIN_GROUP(name, id)			\
-	{						\
-		name,					\
-		id##_pins,				\
-		ARRAY_SIZE(id##_pins),			\
-		id##_funcs,				\
-	}
+	PINCTRL_GROUP_DESC(name, id##_pins, ARRAY_SIZE(id##_pins), id##_funcs)
 
 int mtk_paris_pinctrl_probe(struct platform_device *pdev);
 
-- 
2.43.0.rc1.1.gbec44491f096


