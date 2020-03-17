Return-Path: <SRS0=yvcX=5C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACB9C10F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 09:28:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061B9205ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2020 09:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WdR9Vtu5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="srtnAY5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061B9205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nC3T1Xfe3BLM/BaRrMZc+0vN+vIBSZt3BA79s9/Rw4s=; b=WdR9Vtu5ZYs5rw
	3PAMOjWkMQVWR6oCcpMhEz+oJsvBC20t+UuQPoNa35VDpw9UO9mTVfD8LT5glN9Y++b7kpKuxj4As
	eWbDYZ+vkffVFdYRLbfptgtSsm6RRqjyXWT5+H6puZ83YB5iTV8JjrgjWut1iOeDoUEdZBF+KoXAv
	g80BAxiVPhiDINP+DZAn11yUc0RB621A/6WPai3u1upojLgmUkaDS1Gy3bitDuV9/0B1l0DKnrRak
	69qSDrwoFJM/RdsJTUv4KpUSJnHi5Qk/4BaGpl8ls0MxyXz0rrVO6VHJDEN8UEgGY1O1iQIeadpht
	mUdmM6Kkf4eAiMaImxFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jE8Wi-0008O3-J5; Tue, 17 Mar 2020 09:28:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE8WZ-0008FV-V0
 for linux-mediatek@lists.infradead.org; Tue, 17 Mar 2020 09:28:38 +0000
X-UUID: 2b7cc636687f40ba9661732ae79cc429-20200317
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=W+eu9gVynKDze5nK3G6WQBjhdJ0znZnM0vaz/ctk4zA=; 
 b=srtnAY5jgCjELNBiv/POCrGAHKsoBgeC3Yu6KBix/56WEBis99Yo3ObhlDyDbgPASEJcHw5A7WFHYLQvVGczJFr6ZjnDySaNoWXpCy9XZIU5YAdBSNbDB5tzSRnwYwTkEEowVdHTlqbZml5STcvr7NzzajI4FR1te107RHJoP3g=;
X-UUID: 2b7cc636687f40ba9661732ae79cc429-20200317
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 518744758; Tue, 17 Mar 2020 01:28:28 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Mar 2020 02:28:59 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Mar 2020 17:25:55 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Mar 2020 17:27:29 +0800
Message-ID: <1584437292.12211.9.camel@mtkswgap22>
Subject: Re: [PATCH v4 1/2] pinctrl: make MediaTek pinctrl v2 driver ready
 for buidling loadable module
From: Light Hsieh <light.hsieh@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
Date: Tue, 17 Mar 2020 17:28:12 +0800
In-Reply-To: <CAGp9LzpJTYXp9R6SKjauemPYMd9wfoacD_czQBVgWtJoMcPFKg@mail.gmail.com>
References: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com>
 <1583825986-8189-2-git-send-email-light.hsieh@mediatek.com>
 <CAGp9LzpJTYXp9R6SKjauemPYMd9wfoacD_czQBVgWtJoMcPFKg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200317_022836_008277_8B083310 
X-CRM114-Status: GOOD (  21.64  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-03-15 at 14:35 -0700, Sean Wang wrote:
> Hi, Light
> 
> On Tue, Mar 10, 2020 at 12:39 AM <light.hsieh@mediatek.com> wrote:
> >
> > From: Light Hsieh <light.hsieh@mediatek.com>
> >
> 
> Correct the prefix of the subject with "pinctrl: mediatek".
> 
> > In the future we want to be able to build the MediaTek pinctrl driver,
> > based on paris, as kernel module. This patch allows pinctrl-paris.c, the
> > external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
> > be loadable as module.
> >
> > Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> >  drivers/pinctrl/mediatek/Kconfig                 | 13 +++++++++++--
> >  drivers/pinctrl/mediatek/Makefile                |  5 +++--
> >  drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
> >  drivers/pinctrl/mediatek/pinctrl-paris.c         |  6 ++++++
> >  drivers/pinctrl/pinconf-generic.c                |  1 +
> 
> Separate the patches for the device driver and for the core respectively.

Since the patch for pinconf-generic.c had been done in  b88d145191ad
("pinctrl: Export some needed symbols at module load time").
I will remove patch for pinconf-generic.c.

> >  6 files changed, 54 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> > index 701f9af..4cd1109 100644
> > --- a/drivers/pinctrl/mediatek/Kconfig
> > +++ b/drivers/pinctrl/mediatek/Kconfig
> > @@ -3,10 +3,12 @@ menu "MediaTek pinctrl drivers"
> >         depends on ARCH_MEDIATEK || COMPILE_TEST
> >
> >  config EINT_MTK
> > -       bool "MediaTek External Interrupt Support"
> > +       tristate "MediaTek External Interrupt Support"
> >         depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
> >         select GPIOLIB
> >         select IRQ_DOMAIN
> > +       default y if PINCTRL_MTK || PINCTRL_MTK_MOORE
> > +       default PINCTRL_MTK_PARIS
> >
> >  config PINCTRL_MTK
> >         bool
> > @@ -17,23 +19,30 @@ config PINCTRL_MTK
> >         select EINT_MTK
> >         select OF_GPIO
> >
> > +config PINCTRL_MTK_V2
> > +       tristate
> > +       depends on PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS
> 
> PINCTRL_MTK_V2 doesn't have to depend on PINCTRL_MTK_MOORE or
> PINCTRL_MTK_PARIS to work and it can build on it own so that lets us
> remove the dependency.
> 
The usage of PINCTRL_MTK had been describe in cover letter:

1.4 PINCTRL_MTK_V2: add this tristate config which depends on
        PINCTRL_MTK_PARIS and PINCTRL_MTK_MOORE. No need to specify in 
        defconfig file.
      * PINCTRL_MTK_V2 will be y if either PINCTRL_MTK_PARIS or
        PINCTRL_MTK_MOORE is y.
      * PINCTRL_MTK_V2 will be n if both PINCTRL_MTK_PARIS and
        PINCTRL_MTK_MOORE are n.
      * PINCTRL_MTK_V2 will be m if PINCTRL_MTK_PARIS is m and
        PINCTRL_MTK_MOORE is n.


Without PINCTRL_MTK_V2, we cannot specify whether
pinctrl-mtk-common-v2.c is built-in or loadable kernel module.

> > +
> >  config PINCTRL_MTK_MOORE
> >         bool
> >         depends on OF
> >         select GENERIC_PINCONF
> >         select GENERIC_PINCTRL_GROUPS
> >         select GENERIC_PINMUX_FUNCTIONS
> > +       select EINT_MTK
> 
> The original design of PINCTRL_MTK_MOORE doesn't have to work with
> EINT_MTK coupled tightly so that let us remove the reverse dependency.
> 

Actually, PINCTRL_MTK_MOORE use EINT_MTK in the following call flow:
mtk_moore_pinctrl_probe() -> mtk_build_eint() -> mtk_eint_do_init().
mtk_eint_do_init() is defined in mtk-eint.c.

> >         select GPIOLIB
> >         select OF_GPIO
> > +       select PINCTRL_MTK_V2
> >
> >  config PINCTRL_MTK_PARIS
> > -       bool
> > +       tristate
> >         depends on OF
> >         select PINMUX
> >         select GENERIC_PINCONF
> >         select GPIOLIB
> >         select EINT_MTK
> >         select OF_GPIO
> > +       select PINCTRL_MTK_V2
> >
> >  # For ARMv7 SoCs
> >  config PINCTRL_MT2701
> > diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> > index a74325a..4b71328 100644
> > --- a/drivers/pinctrl/mediatek/Makefile
> > +++ b/drivers/pinctrl/mediatek/Makefile
> > @@ -2,8 +2,9 @@
> >  # Core
> >  obj-$(CONFIG_EINT_MTK)         += mtk-eint.o
> >  obj-$(CONFIG_PINCTRL_MTK)      += pinctrl-mtk-common.o
> > -obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o pinctrl-mtk-common-v2.o
> > -obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o pinctrl-mtk-common-v2.o
> > +obj-$(CONFIG_PINCTRL_MTK_V2)   += pinctrl-mtk-common-v2.o
> > +obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o
> > +obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o
> >
> >  # SoC Drivers
> >  obj-$(CONFIG_PINCTRL_MT2701)   += pinctrl-mt2701.o
> > diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> > index 7e526bcf..99703a8 100644
> > --- a/drivers/pinctrl/mediatek/mtk-eint.c
> > +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> > @@ -9,6 +9,7 @@
> >   *
> >   */
> >
> > +#include <linux/module.h>
> 
> Sort in alphabetical order, please.
> 

OK.

> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/gpio/driver.h>
> > @@ -379,6 +380,7 @@ int mtk_eint_do_suspend(struct mtk_eint *eint)
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
> >
> >  int mtk_eint_do_resume(struct mtk_eint *eint)
> >  {
> > @@ -386,6 +388,7 @@ int mtk_eint_do_resume(struct mtk_eint *eint)
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
> >
> >  int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
> >                           unsigned int debounce)
> > @@ -440,6 +443,7 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
> >
> >  int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
> >  {
> > @@ -451,6 +455,7 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
> >
> >         return irq;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
> >
> >  int mtk_eint_do_init(struct mtk_eint *eint)
> >  {
> > @@ -495,3 +500,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_do_init);
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("MediaTek EINT Driver");
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 1da9425..cdf2d69 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -6,6 +6,7 @@
> >   *
> >   */
> >
> > +#include <linux/module.h>
> 
> Sort in alphabetical order, please.

OK.

> 
> >  #include <dt-bindings/pinctrl/mt65xx.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> > @@ -206,6 +207,7 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_hw_set_value);
> >
> >  int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >                      int field, int *value)
> > @@ -225,6 +227,7 @@ int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_hw_get_value);
> >
> >  static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
> >  {
> > @@ -363,6 +366,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
> >
> >         return mtk_eint_do_init(hw->eint);
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_build_eint);
> >
> >  /* Revision 0 */
> >  int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
> > @@ -382,6 +386,7 @@ int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set);
> >
> >  int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
> >                                  const struct mtk_pin_desc *desc, int *res)
> > @@ -404,6 +409,7 @@ int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get);
> >
> >  int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
> >                          const struct mtk_pin_desc *desc, bool pullup)
> > @@ -423,6 +429,7 @@ int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set);
> >
> >  int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
> >                          const struct mtk_pin_desc *desc, bool pullup, int *res)
> > @@ -442,6 +449,7 @@ int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
> >
> >  /* Revision 1 */
> >  int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
> > @@ -456,6 +464,7 @@ int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
> >
> >  int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
> >                                       const struct mtk_pin_desc *desc, int *res)
> > @@ -473,6 +482,7 @@ int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get_rev1);
> >
> >  int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc, bool pullup)
> > @@ -492,6 +502,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
> >
> >  int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc, bool pullup,
> > @@ -517,6 +528,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_gev1);
> 
> That should be EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_rev1);
> 

OK.

> >
> >  /* Combo for the following pull register type:
> >   * 1. PU + PD
> > @@ -717,6 +729,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> >  out:
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
> >
> >  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc,
> > @@ -737,6 +750,7 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> >  out:
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
> >
> >  /* Revision 0 */
> >  int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
> > @@ -766,6 +780,7 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
> >
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set);
> >
> >  int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
> >                           const struct mtk_pin_desc *desc, int *val)
> > @@ -790,6 +805,7 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get);
> >
> >  /* Revision 1 */
> >  int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
> > @@ -811,6 +827,7 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
> >
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_rev1);
> >
> >  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
> >                                const struct mtk_pin_desc *desc, int *val)
> > @@ -828,18 +845,21 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_rev1);
> >
> >  int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> >                                const struct mtk_pin_desc *desc, u32 arg)
> >  {
> >         return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_raw);
> >
> >  int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> >                                const struct mtk_pin_desc *desc, int *val)
> >  {
> >         return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_raw);
> >
> >  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
> >                              const struct mtk_pin_desc *desc, bool pullup,
> > @@ -880,6 +900,7 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
> >
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_set);
> >
> >  int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
> >                              const struct mtk_pin_desc *desc, bool pullup,
> > @@ -922,6 +943,7 @@ int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_get);
> >
> >  int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc, u32 arg)
> > @@ -948,6 +970,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
> >
> >         return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
> >
> >  int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
> >                               const struct mtk_pin_desc *desc, u32 *val)
> > @@ -971,3 +994,4 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
> >
> >         return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > index 83bf29c..028a3de 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > @@ -9,6 +9,7 @@
> >   *        Hongzhou.Yang <hongzhou.yang@mediatek.com>
> >   */
> >
> > +#include <linux/module.h>
> 
> Sort in alphabetical order, please.
> 

OK.

> >  #include <linux/gpio/driver.h>
> >  #include <dt-bindings/pinctrl/mt65xx.h>
> >  #include "pinctrl-paris.h"
> > @@ -633,6 +634,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
> >
> >         return len;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pctrl_show_one_pin);
> >
> >  #define PIN_DBG_BUF_SZ 96
> >  static void mtk_pctrl_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
> > @@ -1037,3 +1039,7 @@ static int mtk_paris_pinctrl_resume(struct device *device)
> >         .suspend_noirq = mtk_paris_pinctrl_suspend,
> >         .resume_noirq = mtk_paris_pinctrl_resume,
> >  };
> > +EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");
> > diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
> > index 9eb8630..dfef471 100644
> > --- a/drivers/pinctrl/pinconf-generic.c
> > +++ b/drivers/pinctrl/pinconf-generic.c
> > @@ -286,6 +286,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
> >         kfree(cfg);
> >         return ret;
> >  }
> > +EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
> >
> 
> The change probably has been done in b88d145191ad ("pinctrl: Export
> some needed symbols at module load time").
> 

OK. I will remove patch for pinconf-generic.c

> >  int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
> >                 struct device_node *np, struct pinctrl_map **map,
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
