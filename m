Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD35C61D99
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3pCoAXUVTPJNXyWVwpcufyPb4MHPdzEPSkECtmUPXWY=; b=IwvtcgXtID8WI1nVUKGYIUuuxI
	Wmkol1cFD5cpZXv1UKQmtHqvpdW36gMkny5GkAoE7BmN02S7GPfin8+Z1IgnZxV53cKfg4lII+8DD
	UmTNGSX3H7rLbwR7C0+uL/wbhLAabFOCYvrFaXXQAUYtp4ljRMGnnBOy625KwGOht7YnmvW4s9u3q
	gdt2BolyOOgKKya5GMBm+ay8+GZfogLj46XnIyeqZ94FKCQMfVSbgCvGmpK5VM2yxpfhupV/26JtX
	ddCYfnHC9gxDv4N/WZ/kZMNIv0OlH4oPpEZi+xlXG3HC0KTzek9srA55ypwK+NHgPtUFG3hAvUnH5
	6RYBgFlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qSd-002ZtW-0T;
	Wed, 22 Nov 2023 16:52:23 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qSO-002ZkW-1I;
	Wed, 22 Nov 2023 16:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671928; x=1732207928;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B/Nvafeg+or7X3fBtSVgPAx87y495D+9YW1QS9ZZz18=;
  b=cx14yQxAA3+KlNN5mgzbTMZrDnuddF3NiTmepW60UvlBa0+aZWy8Cu7D
   bByvR+RU4o4XJn9DHWB5GQN+zWUyLWxMi9mz8dXhvqxXTs/QdA4JTSdbb
   UnuQxOqrCEAimhSk0BYUuxgsZ0VPZdNVcwbU1DrZLTRALxEbN6S3n3sSY
   pUo+qX2PcPXeiZ624erLY3jTmF8fSKdISOz9oMfaEKkgNwzYMZRPseone
   pFrr3BBa65z/o9fUMrGxsCMUJdW7ZQNv+MXUDrfKiotGTlvPMtBW4Akwo
   R1ZltOnjk8J9gAy6aEySQJqLyhe2gOWp1wDn134ccTOuO+s7mB4zFGxxR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="5233446"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="5233446"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:51:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="857812961"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="857812961"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Nov 2023 08:51:25 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6F228623; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
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
Subject: [PATCH v1 09/17] pinctrl: bcm: Convert to use grp member
Date: Wed, 22 Nov 2023 18:35:41 +0200
Message-ID: <20231122164040.2262742-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_085208_454131_D0EC09C2 
X-CRM114-Status: GOOD (  13.03  )
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

Convert drivers to use grp member embedded in struct group_desc.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/bcm/pinctrl-ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-ns.c b/drivers/pinctrl/bcm/pinctrl-ns.c
index d099a7f25f64..6bb2b461950b 100644
--- a/drivers/pinctrl/bcm/pinctrl-ns.c
+++ b/drivers/pinctrl/bcm/pinctrl-ns.c
@@ -171,8 +171,8 @@ static int ns_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev,
 	if (!group)
 		return -EINVAL;
 
-	for (i = 0; i < group->num_pins; i++)
-		unset |= BIT(group->pins[i]);
+	for (i = 0; i < group->grp.npins; i++)
+		unset |= BIT(group->grp.pins[i]);
 
 	tmp = readl(ns_pinctrl->base);
 	tmp &= ~unset;
-- 
2.43.0.rc1.1.gbec44491f096


