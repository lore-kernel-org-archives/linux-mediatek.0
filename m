Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E26C352A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 06:15:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5AAE20848
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 06:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gmzQvDh5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Kli98yt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5AAE20848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zLUWLvRxuM5GB5ulMnSHw3xtbknJ2NLkNLv1A9hqhK4=; b=gmzQvDh5G2TQzT
	T+BlbhWMSq3kaxesSqXAHQFp6BIPPlN+v4aBXddMvPTV+yfBOli6JM1vCX/Es928mbWjr4m4PtKIh
	uCHJCjJcvJWwVze8XFn1i4aJRFC6yRUen0BfhyV0UP3XcEXoWOfaIJH6KMj0w6wwDBZCtz4QX8mOs
	pzleusYbaskrg6JkgrRSHWvGT0ccwO6C0CFmVC+eAhoKFlktTcVzX2ng0isPzeCD/fXYXfoXv+Gw6
	k0bO7EKmGpKo9K5xZpHhCgkHkr3bbEtkynADCMZzgeJPD8OV59FHeP220WukzTjfTgVpksYV5QQgp
	HNTVjde8SO+onzI5+yug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j27mt-0008Rm-29; Thu, 13 Feb 2020 06:15:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j27mp-0008RP-GQ
 for linux-mediatek@lists.infradead.org; Thu, 13 Feb 2020 06:15:45 +0000
X-UUID: 4d9358cde10d42ff9e4d2570bb9b8ebb-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=f3e3yqSrTJpIRenjY9iBI7E4Ep2J/25DEt3fIkE9kMg=; 
 b=Kli98yt1z6pH+3oLpUk60RZTQ3wEtEOX/vtKLc2L4hM6b17rZ5WfhtUdZAmox8qHsuiDPJ+P1rzhTP+EAu5OTrUPPwfI9ea2yCaji/3smxBmaRz4oA5WJvjkiXYcXAGl0nJPQzn0+cuUQRQz7gj1QeObgC5bY+BzYLYvARX9nko=;
X-UUID: 4d9358cde10d42ff9e4d2570bb9b8ebb-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 233089670; Wed, 12 Feb 2020 22:15:40 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 22:08:28 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 14:09:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 13 Feb 2020 14:07:23 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v1 1/2] pinctrl: make MediaTek pinctrl v2 driver ready for
 buidling kernel module
Date: Thu, 13 Feb 2020 14:08:24 +0800
Message-ID: <1581574105-1160-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_221543_561963_5A37A449 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

Google plan to make platform driver as kernel module for future
Andriod kernel. This patch make platforms that use pinctrl-paris.c
of MediaTek pinctrl v2 ready for building kernel module.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
 drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         |  5 +++++
 drivers/pinctrl/pinconf-generic.c                |  1 +
 5 files changed, 43 insertions(+)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 7e526bcf..99703a8 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -9,6 +9,7 @@
  *
  */
 
+#include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
@@ -379,6 +380,7 @@ int mtk_eint_do_suspend(struct mtk_eint *eint)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
 
 int mtk_eint_do_resume(struct mtk_eint *eint)
 {
@@ -386,6 +388,7 @@ int mtk_eint_do_resume(struct mtk_eint *eint)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
 
 int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 			  unsigned int debounce)
@@ -440,6 +443,7 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
 
 int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 {
@@ -451,6 +455,7 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
 
 	return irq;
 }
+EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
 
 int mtk_eint_do_init(struct mtk_eint *eint)
 {
@@ -495,3 +500,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_eint_do_init);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek EINT Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
index 905dae8c..2c59d39 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/module.h>
 #include "pinctrl-mtk-mt6765.h"
 #include "pinctrl-paris.h"
 
@@ -1103,3 +1104,6 @@ static int __init mt6765_pinctrl_init(void)
 	return platform_driver_register(&mt6765_pinctrl_driver);
 }
 arch_initcall(mt6765_pinctrl_init);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek MT6765 Pinctrl Driver");
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 1da9425..cdf2d69 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -6,6 +6,7 @@
  *
  */
 
+#include <linux/module.h>
 #include <dt-bindings/pinctrl/mt65xx.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -206,6 +207,7 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_hw_set_value);
 
 int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 		     int field, int *value)
@@ -225,6 +227,7 @@ int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_hw_get_value);
 
 static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
 {
@@ -363,6 +366,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 
 	return mtk_eint_do_init(hw->eint);
 }
+EXPORT_SYMBOL_GPL(mtk_build_eint);
 
 /* Revision 0 */
 int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
@@ -382,6 +386,7 @@ int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set);
 
 int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
 				 const struct mtk_pin_desc *desc, int *res)
@@ -404,6 +409,7 @@ int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get);
 
 int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
 			 const struct mtk_pin_desc *desc, bool pullup)
@@ -423,6 +429,7 @@ int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set);
 
 int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
 			 const struct mtk_pin_desc *desc, bool pullup, int *res)
@@ -442,6 +449,7 @@ int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
 
 /* Revision 1 */
 int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
@@ -456,6 +464,7 @@ int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
 
 int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
 				      const struct mtk_pin_desc *desc, int *res)
@@ -473,6 +482,7 @@ int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get_rev1);
 
 int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, bool pullup)
@@ -492,6 +502,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
 
 int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, bool pullup,
@@ -517,6 +528,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_gev1);
 
 /* Combo for the following pull register type:
  * 1. PU + PD
@@ -717,6 +729,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 out:
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
 
 int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc,
@@ -737,6 +750,7 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 out:
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
 
 /* Revision 0 */
 int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
@@ -766,6 +780,7 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set);
 
 int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 			  const struct mtk_pin_desc *desc, int *val)
@@ -790,6 +805,7 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get);
 
 /* Revision 1 */
 int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
@@ -811,6 +827,7 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_rev1);
 
 int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 			       const struct mtk_pin_desc *desc, int *val)
@@ -828,18 +845,21 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_rev1);
 
 int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
 			       const struct mtk_pin_desc *desc, u32 arg)
 {
 	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_raw);
 
 int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
 			       const struct mtk_pin_desc *desc, int *val)
 {
 	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_raw);
 
 int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, bool pullup,
@@ -880,6 +900,7 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_set);
 
 int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, bool pullup,
@@ -922,6 +943,7 @@ int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_get);
 
 int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 arg)
@@ -948,6 +970,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
 
 int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 *val)
@@ -971,3 +994,4 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 83bf29c..af97794 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -9,6 +9,7 @@
  *	   Hongzhou.Yang <hongzhou.yang@mediatek.com>
  */
 
+#include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <dt-bindings/pinctrl/mt65xx.h>
 #include "pinctrl-paris.h"
@@ -1037,3 +1038,7 @@ static int mtk_paris_pinctrl_resume(struct device *device)
 	.suspend_noirq = mtk_paris_pinctrl_suspend,
 	.resume_noirq = mtk_paris_pinctrl_resume,
 };
+EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");
diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
index 9eb8630..dfef471 100644
--- a/drivers/pinctrl/pinconf-generic.c
+++ b/drivers/pinctrl/pinconf-generic.c
@@ -286,6 +286,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
 	kfree(cfg);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
 
 int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
 		struct device_node *np, struct pinctrl_map **map,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
