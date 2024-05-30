Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7C5C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 08:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0RxA+eCzC4Ug8pMqgqB2Ol4RzoGcpLwnxBpne9EJJY=; b=owJnqCzHtwYz/lNIJnVkH6isQz
	6EK5dTZSgPEHbCHkBbtuWoVLVkWuUAGn8Xa//uonRdxDOwNSXNoNgVKAoG+wmdhRBHHwhHzKMtxmW
	G/Turxo8MoYP40L02zqQF1Lyg9GzSmaGF7vB0z9uUaQm8T56J5PIKfdyP9D+SzYR0TQL9nIQU+gRo
	gHLwb+dik87SsHWkQZ42xEdLNRM+F4Yi3PoFDumrAX88mAwcBadwAJiaaZqHccJW+VO52Xsdnga4S
	rOyAluo3dnkJZRxE8qRd3FfVdEEI3M3XBmjMXqciZ0FLdwhI8zrhqEn1r9TxZNM0Iat/64J/HOTtg
	BaL2TIUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbcs-00000006j0q-2LL1;
	Thu, 30 May 2024 08:59:10 +0000
Received: from fgw23-7.mail.saunalahti.fi ([62.142.5.84])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbbw-00000006iXp-29vj
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 08:58:18 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id bd740b5a-1e62-11ef-80c8-005056bdfda7;
	Thu, 30 May 2024 11:58:10 +0300 (EEST)
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
Subject: [PATCH v3 06/11] pinctrl: pinmux: Embed struct pinfunction into struct function_desc
Date: Thu, 30 May 2024 11:55:15 +0300
Message-ID: <20240530085745.1539925-7-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_015813_035567_41DF257A 
X-CRM114-Status: GOOD (  14.23  )
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

struct function_desc is a particular version of the struct pinfunction
with associated opaque data. Start switching pin control core and
drivers to use it explicitly.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinmux.c | 10 +++++-----
 drivers/pinctrl/pinmux.h |  5 ++++-
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 8d69fa1b0bff..aae71a37219b 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -796,7 +796,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 	if (!function)
 		return NULL;
 
-	return function->name;
+	return function->func.name;
 }
 EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
 
@@ -805,12 +805,12 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function_name);
  * @pctldev: pin controller device
  * @selector: function number
  * @groups: array of pin groups
- * @num_groups: number of pin groups
+ * @ngroups: number of pin groups
  */
 int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 				       unsigned int selector,
 				       const char * const **groups,
-				       unsigned int * const num_groups)
+				       unsigned int * const ngroups)
 {
 	struct function_desc *function;
 
@@ -821,8 +821,8 @@ int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 			__func__, selector);
 		return -EINVAL;
 	}
-	*groups = function->group_names;
-	*num_groups = function->num_group_names;
+	*groups = function->func.groups;
+	*ngroups = function->func.ngroups;
 
 	return 0;
 }
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 52e6e4db88b4..9b57c1cc9d50 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -133,12 +133,14 @@ static inline void pinmux_init_device_debugfs(struct dentry *devroot,
 
 /**
  * struct function_desc - generic function descriptor
+ * @func: generic data of the pin function (name and groups of pins)
  * @name: name of the function
  * @group_names: array of pin group names
  * @num_group_names: number of pin group names
  * @data: pin controller driver specific data
  */
 struct function_desc {
+	struct pinfunction func;
 	const char *name;
 	const char * const *group_names;
 	int num_group_names;
@@ -148,6 +150,7 @@ struct function_desc {
 /* Convenient macro to define a generic pin function descriptor */
 #define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
 (struct function_desc) {					\
+	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
 	.name = _name,						\
 	.group_names = _grps,					\
 	.num_group_names = _num_grps,				\
@@ -163,7 +166,7 @@ pinmux_generic_get_function_name(struct pinctrl_dev *pctldev,
 int pinmux_generic_get_function_groups(struct pinctrl_dev *pctldev,
 				       unsigned int selector,
 				       const char * const **groups,
-				       unsigned int * const num_groups);
+				       unsigned int * const ngroups);
 
 struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 						  unsigned int selector);
-- 
2.45.1


