Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE83C61D97
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TzbCptLRuu1GV53O4GULzqD/Pq+hy3/rRyRgiJFweEI=; b=w1hLeaR8m5PJnzvouGpn+AZB7Q
	ekF3fN8xHOBwhub/liuGXG61eisQ0LlA0OpKbxgPzLdlEan0ZSUTcIWRAGfQZZtvopVWpqa3s2UHq
	62f2Glrr0yXxNmSXDj6GSPjBIn5Czl4pVXdW3zeZCAcGRoUmwr9CdMSGNGnatKoJwvI2u7NzsNalA
	85R+6m4JkGLfYbaYNe8VCP5Eay817Nnri8TTT9i3ktEJy5WahvXIWY6SuK9JJtS7r+1l4faWVDkuz
	IZHetEK0w1h6bARFWtaZFlc5QAtNb7sn8HivGFsMqJNYsbM9Do3LCpmoAEMfaqS7GQ8TAoJIkWXMO
	44l3etuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qI7-002WsZ-2F;
	Wed, 22 Nov 2023 16:41:31 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qHz-002Wlb-1n;
	Wed, 22 Nov 2023 16:41:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700671282; x=1732207282;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7v2CAg5DroP23VK/yC7/YkMVF79slYQ+EVkLEfbZi+o=;
  b=eRvLkWgD55A3lR2H3RQvijRU+zMBl2J3pGjGIOCNPcebds4S+Xp/Ni4t
   7JOXhCaKCmqpAtlF4f5HHNrH49jlyB3Ae5X7drEg6ekIZH/yiyURfQjL1
   HXak57+OFObBKIb8eJfuScgeKi0iDG3wYDpXBMFgZsly20NywULgUfpJQ
   BawWE5Rhub0Rpznwpmv0JAS059gBw+ujvnu47hsOXahiJuJrQdGvmBNSM
   UjVZfkRMEG7xDgHKDGSzbAd2stRoF9d14nOdbDDCTGRphrXO8fAyphRgf
   FKoG4xrDG6ul3oefacjkJqX8QxsHrmNHw11k2+BazAqwXEt7ymjzELujZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="456414395"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="456414395"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 08:41:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884681699"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884681699"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 08:41:13 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DF13E9EF; Wed, 22 Nov 2023 18:40:45 +0200 (EET)
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
Subject: [PATCH v1 16/17] pinctrl: starfive: Convert to use grp member
Date: Wed, 22 Nov 2023 18:35:48 +0200
Message-ID: <20231122164040.2262742-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084123_686943_C0C436C0 
X-CRM114-Status: GOOD (  14.79  )
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
 drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c | 8 ++++----
 drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index ea70b8c61679..21bfbbaede72 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -654,7 +654,7 @@ static int starfive_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	pinmux = group->data;
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
 		unsigned int gpio = starfive_pinmux_to_gpio(v);
 		u32 dout = starfive_pinmux_to_dout(v);
@@ -797,7 +797,7 @@ static int starfive_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (!group)
 		return -EINVAL;
 
-	return starfive_pinconf_get(pctldev, group->pins[0], config);
+	return starfive_pinconf_get(pctldev, group->grp.pins[0], config);
 }
 
 static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
@@ -876,8 +876,8 @@ static int starfive_pinconf_group_set(struct pinctrl_dev *pctldev,
 		}
 	}
 
-	for (i = 0; i < group->num_pins; i++)
-		starfive_padctl_rmw(sfp, group->pins[i], mask, value);
+	for (i = 0; i < group->grp.npins; i++)
+		starfive_padctl_rmw(sfp, group->grp.pins[i], mask, value);
 
 	return 0;
 }
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 9d71e8c13310..60160965cd29 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -307,7 +307,7 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
 		return -EINVAL;
 
 	pinmux = group->data;
-	for (i = 0; i < group->num_pins; i++) {
+	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
 
 		if (info->jh7110_set_one_pin_mux)
@@ -437,7 +437,7 @@ static int jh7110_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (!group)
 		return -EINVAL;
 
-	return jh7110_pinconf_get(pctldev, group->pins[0], config);
+	return jh7110_pinconf_get(pctldev, group->grp.pins[0], config);
 }
 
 static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
@@ -508,8 +508,8 @@ static int jh7110_pinconf_group_set(struct pinctrl_dev *pctldev,
 		}
 	}
 
-	for (i = 0; i < group->num_pins; i++)
-		jh7110_padcfg_rmw(sfp, group->pins[i], mask, value);
+	for (i = 0; i < group->grp.npins; i++)
+		jh7110_padcfg_rmw(sfp, group->grp.pins[i], mask, value);
 
 	return 0;
 }
-- 
2.43.0.rc1.1.gbec44491f096


