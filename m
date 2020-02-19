Return-Path: <SRS0=zz1H=4H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69328C34047
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 11:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 395D42465D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 11:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H4RSeY7b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="slkBxmum"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 395D42465D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/cTXn2EaUmzDRx0c8loMShgIW/KjU3XUq8sCoc/HcpU=; b=H4RSeY7bNw7Ib+
	DVZz0r8B31g4kHt83GAo8iv6cmT+2/fTdOsSlWAYNVHkHO5otxcbxo/uUg6f+NtFBZhtCFqF1fk6j
	oFcOm/jS9A+lSnYmh6CfY2NMXPzAK2FtA9jEIgBfYMk+adQxysIXq/24S8AzDzg+LVoiES9qe/4al
	jK6MBxbCK0N5O3a3DrGEpPfVvthIWV+QWQtxOjfp+qG0TIkeWlBDV01ai+I2Z/myy1PB3lJa227sr
	OFR8zjSGVfNI9hPaIyUj++oP5pxrq0itgPLr+mkAzRCEf1fjqXF9DXs8yAzkFDat9JGL2YjnEOIau
	nvuGNVJYpl/2V4kF4Tyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4N76-0000JP-0W; Wed, 19 Feb 2020 11:01:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4N72-0000Et-68
 for linux-mediatek@lists.infradead.org; Wed, 19 Feb 2020 11:01:54 +0000
X-UUID: d9fc4c9194374ff39ba28ff4277b630c-20200219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AmZc9ORKpGkus+nhQnl/IjBdRGrQrTkVLTutaQB5T1o=; 
 b=slkBxmumxKbTVQ8ammt9Mn8iqA9vA2GuT5Oro6GyKIghIAUIWrGvLePR9ZFOjFRJEEOFm87hw5PlczZfFnqe43mj4O5uaGseCFJVIBJznPVpudcjbysTwRFZI9hHQu/pWXIouBdYEJAXU6e+Pkunb/KemnS0UWBdJpeU716gqHA=;
X-UUID: d9fc4c9194374ff39ba28ff4277b630c-20200219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 392100223; Wed, 19 Feb 2020 03:01:49 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 19 Feb 2020 02:52:11 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 19 Feb 2020 18:49:11 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 19 Feb 2020 18:51:12 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [RESEND PATCH v2 1/2] pinctrl: make MediaTek pinctrl v2 driver ready
 for buidling loadable module
Date: Wed, 19 Feb 2020 18:51:21 +0800
Message-ID: <1582109482-13625-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 397D6BA22DC92E823D36C9EDA32ED649E016D948CC8C71EE9F3135D425C1B96B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_030152_248539_46ED4C28 
X-CRM114-Status: GOOD (  12.90  )
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

In the future we want to be able to build the MediaTek pinctrl driver,
based on paris, as kernel module. This patch allows pinctrl-paris.c, the
external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
be loadable as module.

The following is the rationale for determining whether mtk-eint.c,
pinctrl-mtk-common-v2.c, and pinctrl-paris.c are built as loadable module:

1. drivers/pinctrl/mediatek/Kconfig:
1.1 PINCTRL_MTXXXX: change from bool to tristate. It is specified in
        defconfig file. MTXXXX can only be the user of pinctrl-paris,
        which can MT6765 or MT8183. The patch for changing
        PINCTRL_MT6765 from bool to tristate will be given as the next
        patch of the patch series.
1.2 PINCTRL_MTK_PARIS: change from bool to tristate and select
        PINCTRL_MTK_V2. No need to specify in defconfig file.
      * PINCTRL_MTK_PARIS will be y if any PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS is y.
      * PINCTRL_MTK_PARIS will be n if all PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS is n.
      * PINCTRL_MTK_PARIS will be m if some PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS are m and other PINCTRL_MTXXXX selecting
        PINCTRL_MTK_PARIS are n.
1.3 PINCTRL_MTK_MOORE: select EINT_MTK and PINCTRL_MTK_V2. It is make
        to be ready for building as loadable kernel module because it
        is not used on Android kernel.
1.4 PINCTRL_MTK_V2: add this tristate config which depends on
        PINCTRL_MTK_PARIS and PINCTRL_MTK_MOORE. No need to specify in
        defconfig file.
      * PINCTRL_MTK_V2 will be y if either PINCTRL_MTK_PARIS or
        PINCTRL_MTK_MOORE is y.
      * PINCTRL_MTK_V2 will be n if both PINCTRL_MTK_PARIS and
        PINCTRL_MTK_MOORE are n.
      * PINCTRL_MTK_V2 will be m if PINCTRL_MTK_PARIS is m and
        PINCTRL_MTK_MOORE is n.
1.5 EINT_MTK: change from bool to tristate and add rule for default.
        No need to specify in defconfig file.
      * First rule: determine if EINT_MTK is y or n according to
        selection of PINCTRL_MTK or PINCTRL_MTK_MORE.
      * Second rule: determine if EINT_MTK is y, m, or n according to
        selection of PINCTRL_MTK_PARIS.

2. drivers/pinctrl/mediatek/Makefile: Use PINCTRL_MTK_V2 to determine
        if pinctrl-mtk-common-v2.c is built as loadable module or
        built-in.

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/pinctrl/mediatek/Kconfig                 | 13 +++++++++++--
 drivers/pinctrl/mediatek/Makefile                |  5 +++--
 drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c         |  5 +++++
 drivers/pinctrl/pinconf-generic.c                |  1 +
 6 files changed, 53 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 701f9af..4cd1109 100644
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
@@ -17,23 +19,30 @@ config PINCTRL_MTK
 	select EINT_MTK
 	select OF_GPIO
 
+config PINCTRL_MTK_V2
+	tristate
+	depends on PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS
+
 config PINCTRL_MTK_MOORE
 	bool
 	depends on OF
 	select GENERIC_PINCONF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
+	select EINT_MTK
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
index a74325a..4b71328 100644
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
