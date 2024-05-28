Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C69C25B7E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 May 2024 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P68p1HEYJ1lmWTQLtyhb1b1Guc+wf5SaQtvljCR8Cac=; b=zK8t9B9qvzFlKZr4zmSpYwJPrh
	01ESx/z6dM1n+6pGpRAa0+LLobUhsd2U30zbqcuDpvDa6IL8XWzGpxxLAbxl3JSulGKMdDIWdo1cH
	n/xrDn/l3Q6Bh6U3dSS/9+BUS7VydrILmZ13AJTDvNaNlrPjmHs2IhSXs2e8pv5uDXqrZdYPPo0V7
	QBqWj4TH4geVOtAi3b6vid2DNzB899lMdw13LC9Y9j3xbWnEWkXLwB7AZmsg8Up+R+7XgSbvh9+ME
	WpACdMmXJjMjKnEyZ0aEfohbumSPKb1aXG6a4T6VBwbm47UpozeEUFXokc90wamNEBNquxHwVyuCE
	FgE6VDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2q2-00000001smh-0NF2;
	Tue, 28 May 2024 19:50:26 +0000
Received: from fgw22-7.mail.saunalahti.fi ([62.142.5.83])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC2pf-00000001sVS-1RqW
	for linux-mediatek@lists.infradead.org;
	Tue, 28 May 2024 19:50:05 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 7893f7c5-1d2b-11ef-8e2b-005056bdf889;
	Tue, 28 May 2024 22:50:01 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 05/11] pinctrl: pinmux: Add a convenient define PINCTRL_FUNCTION_DESC()
Date: Tue, 28 May 2024 22:44:56 +0300
Message-ID: <20240528194951.1489887-6-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_125003_719170_48786E77 
X-CRM114-Status: GOOD (  11.11  )
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

Add PINCTRL_FUNCTION_DESC() macro for inline use.

While at it, fix adjective form in the comment of PINCTRL_GROUP_DESC().

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/core.h   |  2 +-
 drivers/pinctrl/pinmux.c |  9 +++------
 drivers/pinctrl/pinmux.h | 11 ++++++++++-
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/core.h b/drivers/pinctrl/core.h
index 837fd5bd903d..4e07707d2435 100644
--- a/drivers/pinctrl/core.h
+++ b/drivers/pinctrl/core.h
@@ -206,7 +206,7 @@ struct group_desc {
 	void *data;
 };
 
-/* Convenience macro to define a generic pin group descriptor */
+/* Convenient macro to define a generic pin group descriptor */
 #define PINCTRL_GROUP_DESC(_name, _pins, _num_pins, _data)	\
 (struct group_desc) {						\
 	.grp = PINCTRL_PINGROUP(_name, _pins, _num_pins),	\
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index addba55334d9..8d69fa1b0bff 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -852,13 +852,13 @@ EXPORT_SYMBOL_GPL(pinmux_generic_get_function);
  * @pctldev: pin controller device
  * @name: name of the function
  * @groups: array of pin groups
- * @num_groups: number of pin groups
+ * @ngroups: number of pin groups
  * @data: pin controller driver specific data
  */
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
 				const char * const *groups,
-				const unsigned int num_groups,
+				const unsigned int ngroups,
 				void *data)
 {
 	struct function_desc *function;
@@ -877,10 +877,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->name = name;
-	function->group_names = groups;
-	function->num_group_names = num_groups;
-	function->data = data;
+	*function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
 	if (error)
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 7c8aa25ccc80..52e6e4db88b4 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -145,6 +145,15 @@ struct function_desc {
 	void *data;
 };
 
+/* Convenient macro to define a generic pin function descriptor */
+#define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
+(struct function_desc) {					\
+	.name = _name,						\
+	.group_names = _grps,					\
+	.num_group_names = _num_grps,				\
+	.data = _data,						\
+}
+
 int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
 
 const char *
@@ -162,7 +171,7 @@ struct function_desc *pinmux_generic_get_function(struct pinctrl_dev *pctldev,
 int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char *name,
 				const char * const *groups,
-				unsigned int const num_groups,
+				unsigned int const ngroups,
 				void *data);
 
 int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
-- 
2.45.1


