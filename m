Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E99DC25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 22:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RY+WVFLqdM7a+qcWgzDS/sUrunQ9bLGJdi2eK9+Oz8E=; b=sDHMl+APX1xPHqRC+gdVrinN54
	8L8pHnfxcrWb14amaaz86aPxLNb4zSjnEvx3D7qGjo/m34u47UyS43ZnaZrl3q/ugk8essNKM4Q4Y
	iC6L2Bn4lC5epQWElfuOgORt5FexIJtHMYsNIZ7eYg22ABkIrWeXNPpaJSe0uHCWi+8F7ENGW9anm
	6nNXBRNIQLrIaavC4NjgIOq/NvFk/gDCJvoFgaocYID6ZQRN7Pf1JVX1rQmPqnmuXWE0AQN/Wf7/j
	wHlOJBoxtGOqXIiYxQLTj54hzEVA3B8TaaQTllu793TK24O+ByjvOqrca27XR6nHipaU/f14Tm3i/
	CECWgoSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBicB-0000000GSdC-1unT;
	Mon, 27 May 2024 22:14:47 +0000
Received: from fgw20-7.mail.saunalahti.fi ([62.142.5.81])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBic6-0000000GSYH-0olY
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 22:14:44 +0000
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id fc2e02ae-1c6f-11ef-8d39-005056bd6ce9;
	Tue, 28 May 2024 00:27:56 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
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
Subject: [PATCH v1 09/11] pinctrl: keembay: Convert to use func member
Date: Tue, 28 May 2024 00:24:44 +0300
Message-ID: <20240527212742.1432960-10-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
References: <20240527212742.1432960-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_151442_443981_6D1ACFD5 
X-CRM114-Status: GOOD (  14.67  )
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

Convert drivers to use func member embedded in struct function_desc,
because other members will be removed to avoid duplication and
desynchronisation of the generic pin function description.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/pinctrl-keembay.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index b1349ee22799..245a74ed97ee 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1566,7 +1566,7 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 		unsigned int grp_idx = 0;
 		int j;
 
-		group_names = devm_kcalloc(kpc->dev, func->num_group_names,
+		group_names = devm_kcalloc(kpc->dev, func->func.ngroups,
 					   sizeof(*group_names), GFP_KERNEL);
 		if (!group_names)
 			return -ENOMEM;
@@ -1576,20 +1576,20 @@ static int keembay_add_functions(struct keembay_pinctrl *kpc,
 			struct keembay_mux_desc *mux;
 
 			for (mux = pdesc->drv_data; mux->name; mux++) {
-				if (!strcmp(mux->name, func->name))
+				if (!strcmp(mux->name, func->func.name))
 					group_names[grp_idx++] = pdesc->name;
 			}
 		}
 
-		func->group_names = group_names;
+		func->func.groups = group_names;
 	}
 
 	/* Add all functions */
 	for (i = 0; i < kpc->nfuncs; i++) {
 		pinmux_generic_add_function(kpc->pctrl,
-					    functions[i].name,
-					    functions[i].group_names,
-					    functions[i].num_group_names,
+					    functions[i].func.name,
+					    functions[i].func.groups,
+					    functions[i].func.ngroups,
 					    functions[i].data);
 	}
 
@@ -1619,17 +1619,17 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 			struct function_desc *fdesc;
 
 			/* Check if we already have function for this mux */
-			for (fdesc = keembay_funcs; fdesc->name; fdesc++) {
-				if (!strcmp(mux->name, fdesc->name)) {
-					fdesc->num_group_names++;
+			for (fdesc = keembay_funcs; fdesc->func.name; fdesc++) {
+				if (!strcmp(mux->name, fdesc->func.name)) {
+					fdesc->func.ngroups++;
 					break;
 				}
 			}
 
 			/* Setup new function for this mux we didn't see before */
 			if (!fdesc->name) {
-				fdesc->name = mux->name;
-				fdesc->num_group_names = 1;
+				fdesc->func.name = mux->name;
+				fdesc->func.ngroups = 1;
 				fdesc->data = &mux->mode;
 				kpc->nfuncs++;
 			}
-- 
2.45.1


