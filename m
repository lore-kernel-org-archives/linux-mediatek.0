Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A810C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 20:09:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D45B52074B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 20:09:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RjLtlXFL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H56INWUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D45B52074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7bmh1dQob2drqUoGc9HCNw1R6eKAcXawEkBudos8TJU=; b=RjLtlXFLopbJmG
	xxWJffoscMRse4kftQUk1++HF7XBMoYrqiR/6FbXzidyCh9oaHEutedAulgwLogHrSBHjhZDuQUQc
	KxziZ7D58unm9yD6D5e3+ozyxE5ArgvDD2E40pRk3ilJ+SGuYPz6j5IrOlj99rom1YG1rrRYcKlDd
	K5fy+0KQRiQg/aqdK/Nr6XrUJMB+JG6QBQYhEfUWuE+ZAJ0EH9O4OIuC9+jYkm6w0mpdUtexeB1TK
	vfuq7KhrzTTCNiIha5VDd3E+FAZ1zXR1TvP1BY90lZYTQIhDCxVOM0XuVCL6o0T5j4GiD/zwj2ks1
	WVeSpvVlsH3wKN/x+m5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLuXU-0000N7-SR; Tue, 07 Apr 2020 20:09:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLuWY-0007oQ-Ky; Tue, 07 Apr 2020 20:08:44 +0000
X-UUID: fb62ff7146d746c390932654c296b719-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=k0N1E34+nhOU0U/t407+WqxpA7Qe1683WlAodaboMmc=; 
 b=H56INWUSNIqVybLuB/LfUkMOn7HOK7QvMH8sTc65uikM9px9Avfntecqk+isVabe191b4LtW8PrKHJ4QsP7sPMG0xMxccV5y05GcqDUuAIu+QpXRSK7jqAAHqc2KbCBrLIbPaI9QjIl2D9o8+AtKYkf+Uj/QCSOzPX37C5+BSA8=;
X-UUID: fb62ff7146d746c390932654c296b719-20200407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1023236609; Tue, 07 Apr 2020 12:08:37 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 13:08:33 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Apr 2020 04:08:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 8 Apr 2020 04:08:16 +0800
From: <sean.wang@mediatek.com>
To: <linus.walleij@linaro.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v7 1/2] pinctrl: mediatek: make MediaTek pinctrl v2 driver
 ready for buidling loadable module
Date: Wed, 8 Apr 2020 04:08:16 +0800
Message-ID: <9feeb04805e5a406fe22a92e3f280abda39ddda4.1586289920.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: E4434ADE93FB1DFDD2AC2821CF367BC3B4DFB0D230027CD63D42298064DF61562000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_130842_703947_179C678F 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: linux-gpio@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Light Hsieh <light.hsieh@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

In the future we want to be able to build the MediaTek pinctrl driver,
based on paris, as kernel module. This patch allows pinctrl-paris.c, the
external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
be loadable as module.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
v6->v7: no change
---
 drivers/pinctrl/mediatek/Kconfig              | 11 +++++++--
 drivers/pinctrl/mediatek/Makefile             |  5 ++--
 drivers/pinctrl/mediatek/mtk-eint.c           |  9 +++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 24 +++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  6 +++++
 5 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 701f9af63f5e..551ac716b10c 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -3,10 +3,12 @@ menu "MediaTek pinctrl drivers"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 
 config EINT_MTK
-	bool "MediaTek External Interrupt Support"
+	tristate "MediaTek External Interrupt Support"
 	depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
 	select GPIOLIB
 	select IRQ_DOMAIN
+	default y if PINCTRL_MTK || PINCTRL_MTK_MOORE
+	default PINCTRL_MTK_PARIS
 
 config PINCTRL_MTK
 	bool
@@ -17,6 +19,9 @@ config PINCTRL_MTK
 	select EINT_MTK
 	select OF_GPIO
 
+config PINCTRL_MTK_V2
+	tristate
+
 config PINCTRL_MTK_MOORE
 	bool
 	depends on OF
@@ -25,15 +30,17 @@ config PINCTRL_MTK_MOORE
 	select GENERIC_PINMUX_FUNCTIONS
 	select GPIOLIB
 	select OF_GPIO
+	select PINCTRL_MTK_V2
 
 config PINCTRL_MTK_PARIS
-	bool
+	tristate
 	depends on OF
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
 	select EINT_MTK
 	select OF_GPIO
+	select PINCTRL_MTK_V2
 
 # For ARMv7 SoCs
 config PINCTRL_MT2701
diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
index a74325abd877..4b7132876e71 100644
--- a/drivers/pinctrl/mediatek/Makefile
+++ b/drivers/pinctrl/mediatek/Makefile
@@ -2,8 +2,9 @@
 # Core
 obj-$(CONFIG_EINT_MTK)		+= mtk-eint.o
 obj-$(CONFIG_PINCTRL_MTK)	+= pinctrl-mtk-common.o
-obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o pinctrl-mtk-common-v2.o
-obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o pinctrl-mtk-common-v2.o
+obj-$(CONFIG_PINCTRL_MTK_V2)	+= pinctrl-mtk-common-v2.o
+obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o
+obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o
 
 # SoC Drivers
 obj-$(CONFIG_PINCTRL_MT2701)	+= pinctrl-mt2701.o
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 7e526bcf5e0b..22736f60c16c 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -15,6 +15,7 @@
 #include <linux/io.h>
 #include <linux/irqchip/chained_irq.h>
 #include <linux/irqdomain.h>
+#include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
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
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index d3169a87e1b3..6ea40b501328 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -12,6 +12,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <linux/module.h>
 #include <linux/of_irq.h>
 
 #include "mtk-eint.h"
@@ -204,6 +205,7 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_hw_set_value);
 
 int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 		     int field, int *value)
@@ -223,6 +225,7 @@ int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_hw_get_value);
 
 static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
 {
@@ -361,6 +364,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 
 	return mtk_eint_do_init(hw->eint);
 }
+EXPORT_SYMBOL_GPL(mtk_build_eint);
 
 /* Revision 0 */
 int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
@@ -380,6 +384,7 @@ int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set);
 
 int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
 				 const struct mtk_pin_desc *desc, int *res)
@@ -402,6 +407,7 @@ int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get);
 
 int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
 			 const struct mtk_pin_desc *desc, bool pullup)
@@ -421,6 +427,7 @@ int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set);
 
 int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
 			 const struct mtk_pin_desc *desc, bool pullup, int *res)
@@ -440,6 +447,7 @@ int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
 
 /* Revision 1 */
 int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
@@ -454,6 +462,7 @@ int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
 
 int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
 				      const struct mtk_pin_desc *desc, int *res)
@@ -471,6 +480,7 @@ int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get_rev1);
 
 int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, bool pullup)
@@ -490,6 +500,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
 
 int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, bool pullup,
@@ -515,6 +526,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_rev1);
 
 /* Combo for the following pull register type:
  * 1. PU + PD
@@ -715,6 +727,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
 out:
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
 
 int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc,
@@ -735,6 +748,7 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
 out:
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
 
 /* Revision 0 */
 int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
@@ -764,6 +778,7 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set);
 
 int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 			  const struct mtk_pin_desc *desc, int *val)
@@ -788,6 +803,7 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get);
 
 /* Revision 1 */
 int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
@@ -809,6 +825,7 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_rev1);
 
 int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 			       const struct mtk_pin_desc *desc, int *val)
@@ -826,18 +843,21 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
 
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
@@ -878,6 +898,7 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_set);
 
 int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
 			     const struct mtk_pin_desc *desc, bool pullup,
@@ -920,6 +941,7 @@ int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_get);
 
 int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 arg)
@@ -946,6 +968,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
 
 	return err;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
 
 int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 			      const struct mtk_pin_desc *desc, u32 *val)
@@ -969,3 +992,4 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 3853ec3a2a8e..d006ce4c9238 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/gpio/driver.h>
+#include <linux/module.h>
 #include <dt-bindings/pinctrl/mt65xx.h>
 #include "pinctrl-paris.h"
 
@@ -633,6 +634,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 
 	return len;
 }
+EXPORT_SYMBOL_GPL(mtk_pctrl_show_one_pin);
 
 #define PIN_DBG_BUF_SZ 96
 static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
@@ -1021,6 +1023,7 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
 
 static int mtk_paris_pinctrl_suspend(struct device *device)
 {
@@ -1040,3 +1043,6 @@ const struct dev_pm_ops mtk_paris_pinctrl_pm_ops = {
 	.suspend_noirq = mtk_paris_pinctrl_suspend,
 	.resume_noirq = mtk_paris_pinctrl_resume,
 };
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
