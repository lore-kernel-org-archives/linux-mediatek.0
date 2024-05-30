Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5FEC25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Od8GwbL0RL0UVBs6NCs5JlGlofA2/1xqGCy3akC8KKY=; b=PO2EDy4ER3N6n+Auea5gtXrcxu
	liz5weJ9DmymEjW+Ybd2XdYjiT7k5EgAS0nUAhCHpKO2OOvL3E+gBWWR0jzLHG6RE246GwpUdSbMi
	Y4K+f1YUAvhMsyHDJR9H/i4uaX2TkNm0SvciVwyba1maKPF5kLKWAo8hyPDy3rKZzA+jK2pZf2EiT
	VkvkSC652md3mWjdPXOczKrAovPTNqbhL5VZp/GuqUzDCcMYRwfOBLW8CeqlI2WxwHpzeKaATVGbe
	ERl+yDWT7NXr7VF/p+tyfk5+0WOcYVKLoALwAmmygpApj3lblGSDhg9tmsVzMCc0WBQhZU5DWyo/D
	QWylvSgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbdT-00000006jOD-05jJ;
	Thu, 30 May 2024 08:59:47 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbcM-00000006iob-3ttn
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 08:58:51 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id cd6d5db0-1e62-11ef-8e2e-005056bdf889;
	Thu, 30 May 2024 11:58:37 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 11/11] pinctrl: pinmux: Remove unused members from struct function_desc
Date: Thu, 30 May 2024 11:55:20 +0300
Message-ID: <20240530085745.1539925-12-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_015848_254654_B590B611 
X-CRM114-Status: UNSURE (   9.11  )
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

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

All drivers are converted to use embedded struct pinfunction.
Remove unused members from struct function_desc.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinmux.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 9b57c1cc9d50..2965ec20b77f 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -134,16 +134,10 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
 /**
  * struct function_desc - generic function descriptor
  * @func: generic data of the pin function (name and groups of pins)
- * @name: name of the function
- * @group_names: array of pin group names
- * @num_group_names: number of pin group names
  * @data: pin controller driver specific data
  */
 struct function_desc {
 	struct pinfunction func;
-	const char *name;
-	const char * const *group_names;
-	int num_group_names;
 	void *data;
 };
 
@@ -151,9 +145,6 @@ struct function_desc {
 #define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
 (struct function_desc) {					\
 	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
-	.name = _name,						\
-	.group_names = _grps,					\
-	.num_group_names = _num_grps,				\
 	.data = _data,						\
 }
 
-- 
2.45.1


