Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF17C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 20:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3xjyb4iAiIdZ6TSPrml4isCXpTYsj/Ts2N2sf7raSs=; b=E3vT/zMlZzlSmkm+0yt+nrTJwx
	hwGMHN0rsDAjNWPCBI8Qj/QBt0clUCPYFTfW4ZB1BqKg27yogTHCU53pvhXDzxF76NU4tcrAfqP6s
	NoY8zb45jilRSBlq0TJzTSEBFs6ZQKZ3x4XRIRIlwmp7+cpWxKyuQPa15qp8ArhWlM88eMsDur36V
	A1qrOhWLxcos+Ot7Jg6Gl8vmJADxVqx3lCfyb6EbiW1nPPWvlhUYIkVuFOskcjorLoPyNC0uGJSJR
	LLrqjf9cQO+qWsd7kX/d5goeh8m1hzydXkyQLOc0IyKL7KZrdU2Z09RxbmaRGwdoKVSvzyDxR2J2s
	m8n21x9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Js-006Cxt-1v;
	Tue, 28 Nov 2023 20:04:32 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r84Je-006Cp4-13;
	Tue, 28 Nov 2023 20:04:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701201859; x=1732737859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JWDRh374Weqf1RM/wPs/cLPeGRfYhQLZdPEPrnsQ9gU=;
  b=mJ6PM0GvwKG6gxBjYtzEZBYjDBcOG5uQdkfPUW/QP/exAaLbMelWvPRO
   IZz1aC0afcODajylmorLlsbiIpFlu8rfKhNt7NznmzR3nw1/R8+qVUhuv
   DkHUeH2t/MSNcOoMzpIgpz/ljY9lK4PwHsj9ZZ2aU0uYyVLhAX8GQKCFF
   Jou+zM9VyPCTSjfDRGSw6EnVzSclK9D6lTgTotaRnyfeFxbvsrQxvy2s3
   KAVnVQBenu8ZG425qCnzkhJgfdco20aCdkupv018g5iLssczMIU5EnSA/
   9S6ybcB/ydUghZ1kWgrSQx1eHuYyPEwrGstgn9PFV2oYPwgwtS0W4pGKc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="6217725"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="6217725"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 12:02:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="797687941"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="797687941"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 28 Nov 2023 12:02:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2835BA5F; Tue, 28 Nov 2023 22:01:58 +0200 (EET)
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
Subject: [PATCH v3 06/22] pinctrl: core: Make pins const in struct group_desc
Date: Tue, 28 Nov 2023 21:56:55 +0200
Message-ID: <20231128200155.438722-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_120418_510598_106F6AA6 
X-CRM114-Status: GOOD (  13.14  )
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

It's unclear why it's not a const from day 1. Make the pins member
const in struct group_desc. Update necessary APIs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 2 +-
 drivers/pinctrl/core.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index f2977eb65522..d20e3aad923e 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -642,7 +642,7 @@ static int pinctrl_generic_group_name_to_selector(struct pinctrl_dev *pctldev,
  * Note that the caller must take care of locking.
  */
 int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
-			      int *pins, int num_pins, void *data)
+			      const int *pins, int num_pins, void *data)
 {
 	struct group_desc *group;
 	int selector, error;
diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 530370443c19..01ea1ce99fe8 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -203,7 +203,7 @@ struct pinctrl_maps {
  */
 struct group_desc {
 	const char *name;
-	int *pins;
+	const int *pins;
 	int num_pins;
 	void *data;
 };
@@ -222,7 +222,7 @@ struct group_desc *pinctrl_generic_get_group(struct pinctrl_dev *pctldev,
 					     unsigned int group_selector);
 
 int pinctrl_generic_add_group(struct pinctrl_dev *pctldev, const char *name,
-			      int *gpins, int ngpins, void *data);
+			      const int *pins, int num_pins, void *data);
 
 int pinctrl_generic_remove_group(struct pinctrl_dev *pctldev,
 				 unsigned int group_selector);
-- 
2.43.0.rc1.1.gbec44491f096


