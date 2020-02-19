Return-Path: <SRS0=zz1H=4H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEAAC34047
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 10:48:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D28521D56
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 10:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gTwaqsfy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aHuyHSHl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D28521D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8h8KZ9pZadYy4SPZ0Myk28i2XwSBWwSrhotOQc4dJGg=; b=gTwaqsfymR9HUs
	Jj1M6PAmr1Hj4YFTvgHpo3ZN1THPo/5v2c7vR7osclvk0pQ+2sJoYGR9Xf1tF7+pe+a1mppLbvH/Z
	GDatzJnWv/EXC2nu3hF+ctoPR8ApuOG0AGAYrvu1CZR9+zjGBcv+aUyfwhUAkKy+sDBUugSaCrosU
	lGy9gBnw3aOBuLtS+jHdvpOB8xUO8ejd5k0lme0CFnS9C+bqJ2mBwu3Gy4fKfHKd3qBwyZU5JEsvD
	q7As5fnsGNuB/7SP1byMk+OG/TnSmxL27V4zHa4taFfra5LNOC7est9WIFd7AZVsZd6UL+CnfKSJ8
	P9mqlYF70X1C+TRtt8Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4MuN-0000aN-Ns; Wed, 19 Feb 2020 10:48:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4MuJ-0000Z7-5J
 for linux-mediatek@lists.infradead.org; Wed, 19 Feb 2020 10:48:45 +0000
X-UUID: 7d86d0c7e93b49909b8207e7ac0a30de-20200219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3YmtPpBTFoqK1mGuXfoFfibgOtd96jA8ktNWtU7ethU=; 
 b=aHuyHSHlKrgBQ0uQcvQmFWAE2wvaE8crlpUXKYZS1deb0W3WtqBfTJFrRjdarWvQUbvD/JJZoJXcUiuHolY1Onu1YmhzeW8mexBTfetq1Sopt8/MTrDPAohOa+Wc6PWc6qvskiwFqr4r7kyNU6UtbCfl0N2LJ3NxByjEpVVeBv0=;
X-UUID: 7d86d0c7e93b49909b8207e7ac0a30de-20200219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 532522508; Wed, 19 Feb 2020 02:48:34 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 19 Feb 2020 02:49:25 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 19 Feb 2020 18:46:02 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 19 Feb 2020 18:48:09 +0800
Message-ID: <1582109311.13315.1.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] pinctrl: make MediaTek pinctrl v2 driver ready
 for buidling loadable module
From: Light Hsieh <light.hsieh@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 19 Feb 2020 18:48:31 +0800
In-Reply-To: <a06a4a3e-0a8c-ade6-7916-8d2926de6fd7@gmail.com>
References: <1582078102-26332-1-git-send-email-light.hsieh@mediatek.com>
 <a06a4a3e-0a8c-ade6-7916-8d2926de6fd7@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6E6BF634B96A8174B71E97EEDDDC86B614338917EC525C78D1F6669176B0C5852000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_024843_226556_7A675F7F 
X-CRM114-Status: GOOD (  26.33  )
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
Cc: linus.walleij@linaro.org, sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-02-19 at 10:54 +0100, Matthias Brugger wrote:
> Hi Light,
> 
> On 19/02/2020 03:08, light.hsieh@mediatek.com wrote:
> > From: Light Hsieh <light.hsieh@mediatek.com>
> > 
> > In the future we want to be able to build the MediaTek pinctrl driver,
> > based on paris, as kernel module. This patch allows pinctrl-paris.c, the
> > external interrupt controller mtk-eint.c, and pinctrl-mtk-common-v2.c to
> > be loadable as module.
> > 
> > The following is the rationale for determining whether mtk-eint.c,
> > pinctrl-mtk-common-v2.c, and pinctrl-paris.c are built as loadable module:
> > 
> > 1. drivers/pinctrl/mediatek/Kconfig:
> > 1.1 PINCTRL_MTXXXX: change from bool to tristate. It is specified in
> >         defconfig file. MTXXXX can only be the user of pinctrl-paris,
> >         which can MT6765 or MT8183. The patch for changing
> >         PINCTRL_MT6765 from bool to tristate will be given as the next
> >         patch of the patch series.
> > 1.2 PINCTRL_MTK_PARIS: change from bool to tristate and select
> >         PINCTRL_MTK_V2. No need to specify in defconfig file.
> >       * PINCTRL_MTK_PARIS will be y if any PINCTRL_MTXXXX selecting
> >         PINCTRL_MTK_PARIS is y.
> >       * PINCTRL_MTK_PARIS will be n if all PINCTRL_MTXXXX selecting
> >         PINCTRL_MTK_PARIS is n.
> >       * PINCTRL_MTK_PARIS will be m if some PINCTRL_MTXXXX selecting
> >         PINCTRL_MTK_PARIS are m and other PINCTRL_MTXXXX selecting
> >         PINCTRL_MTK_PARIS are n.
> > 1.3 PINCTRL_MTK_MOORE: select EINT_MTK and PINCTRL_MTK_V2. It is make
> >         to be ready for building as loadable kernel module because it
> >         is not used on Android kernel.
> > 1.4 PINCTRL_MTK_V2: add this tristate config which depends on
> >         PINCTRL_MTK_PARIS and PINCTRL_MTK_MOORE. No need to specify in
> >         defconfig file.
> >       * PINCTRL_MTK_V2 will be y if either PINCTRL_MTK_PARIS or
> >         PINCTRL_MTK_MOORE is y.
> >       * PINCTRL_MTK_V2 will be n if both PINCTRL_MTK_PARIS and
> >         PINCTRL_MTK_MOORE are n.
> >       * PINCTRL_MTK_V2 will be m if PINCTRL_MTK_PARIS is m and
> >         PINCTRL_MTK_MOORE is n.
> > 1.5 EINT_MTK: change from bool to tristate and add rule for default.
> >         No need to specify in defconfig file.
> >       * First rule: determine if EINT_MTK is y or n according to
> >         selection of PINCTRL_MTK or PINCTRL_MTK_MORE.
> >       * Second rule: determine if EINT_MTK is y, m, or n according to
> >         selection of PINCTRL_MTK_PARIS.
> > 
> > 2. drivers/pinctrl/mediatek/Makefile: Use PINCTRL_MTK_V2 to determine
> >         if pinctrl-mtk-common-v2.c is built as loadable module or
> >         built-in.
> > 
> > Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> 
> You forgot to add the Reviewed-by tags from your last series.
> Apart I had a comment on this patch which you didn't address nor objected :)
> 
> https://patchwork.kernel.org/patch/11388087/
> 
> Regards,
> Matthias

Sorry, I will re-send Patch series v2 after adding tags.

> 
> > ---
> >  drivers/pinctrl/mediatek/Kconfig                 | 13 +++++++++++--
> >  drivers/pinctrl/mediatek/Makefile                |  5 +++--
> >  drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
> >  drivers/pinctrl/mediatek/pinctrl-paris.c         |  5 +++++
> >  drivers/pinctrl/pinconf-generic.c                |  1 +
> >  6 files changed, 53 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> > index 701f9af..4cd1109 100644
> > --- a/drivers/pinctrl/mediatek/Kconfig
> > +++ b/drivers/pinctrl/mediatek/Kconfig
> > @@ -3,10 +3,12 @@ menu "MediaTek pinctrl drivers"
> >  	depends on ARCH_MEDIATEK || COMPILE_TEST
> >  
> >  config EINT_MTK
> > -	bool "MediaTek External Interrupt Support"
> > +	tristate "MediaTek External Interrupt Support"
> >  	depends on PINCTRL_MTK || PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS || COMPILE_TEST
> >  	select GPIOLIB
> >  	select IRQ_DOMAIN
> > +	default y if PINCTRL_MTK || PINCTRL_MTK_MOORE
> > +	default PINCTRL_MTK_PARIS
> >  
> >  config PINCTRL_MTK
> >  	bool
> > @@ -17,23 +19,30 @@ config PINCTRL_MTK
> >  	select EINT_MTK
> >  	select OF_GPIO
> >  
> > +config PINCTRL_MTK_V2
> > +	tristate
> > +	depends on PINCTRL_MTK_MOORE || PINCTRL_MTK_PARIS
> > +
> >  config PINCTRL_MTK_MOORE
> >  	bool
> >  	depends on OF
> >  	select GENERIC_PINCONF
> >  	select GENERIC_PINCTRL_GROUPS
> >  	select GENERIC_PINMUX_FUNCTIONS
> > +	select EINT_MTK
> >  	select GPIOLIB
> >  	select OF_GPIO
> > +	select PINCTRL_MTK_V2
> >  
> >  config PINCTRL_MTK_PARIS
> > -	bool
> > +	tristate
> >  	depends on OF
> >  	select PINMUX
> >  	select GENERIC_PINCONF
> >  	select GPIOLIB
> >  	select EINT_MTK
> >  	select OF_GPIO
> > +	select PINCTRL_MTK_V2
> >  
> >  # For ARMv7 SoCs
> >  config PINCTRL_MT2701
> > diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> > index a74325a..4b71328 100644
> > --- a/drivers/pinctrl/mediatek/Makefile
> > +++ b/drivers/pinctrl/mediatek/Makefile
> > @@ -2,8 +2,9 @@
> >  # Core
> >  obj-$(CONFIG_EINT_MTK)		+= mtk-eint.o
> >  obj-$(CONFIG_PINCTRL_MTK)	+= pinctrl-mtk-common.o
> > -obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o pinctrl-mtk-common-v2.o
> > -obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o pinctrl-mtk-common-v2.o
> > +obj-$(CONFIG_PINCTRL_MTK_V2)	+= pinctrl-mtk-common-v2.o
> > +obj-$(CONFIG_PINCTRL_MTK_MOORE) += pinctrl-moore.o
> > +obj-$(CONFIG_PINCTRL_MTK_PARIS) += pinctrl-paris.o
> >  
> >  # SoC Drivers
> >  obj-$(CONFIG_PINCTRL_MT2701)	+= pinctrl-mt2701.o
> > diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> > index 7e526bcf..99703a8 100644
> > --- a/drivers/pinctrl/mediatek/mtk-eint.c
> > +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> > @@ -9,6 +9,7 @@
> >   *
> >   */
> >  
> > +#include <linux/module.h>
> >  #include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/gpio/driver.h>
> > @@ -379,6 +380,7 @@ int mtk_eint_do_suspend(struct mtk_eint *eint)
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
> >  
> >  int mtk_eint_do_resume(struct mtk_eint *eint)
> >  {
> > @@ -386,6 +388,7 @@ int mtk_eint_do_resume(struct mtk_eint *eint)
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
> >  
> >  int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
> >  			  unsigned int debounce)
> > @@ -440,6 +443,7 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
> >  
> >  int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
> >  {
> > @@ -451,6 +455,7 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
> >  
> >  	return irq;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
> >  
> >  int mtk_eint_do_init(struct mtk_eint *eint)
> >  {
> > @@ -495,3 +500,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
> >  
> >  	return 0;
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
> >  #include <dt-bindings/pinctrl/mt65xx.h>
> >  #include <linux/device.h>
> >  #include <linux/err.h>
> > @@ -206,6 +207,7 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_hw_set_value);
> >  
> >  int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >  		     int field, int *value)
> > @@ -225,6 +227,7 @@ int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_hw_get_value);
> >  
> >  static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
> >  {
> > @@ -363,6 +366,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
> >  
> >  	return mtk_eint_do_init(hw->eint);
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_build_eint);
> >  
> >  /* Revision 0 */
> >  int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
> > @@ -382,6 +386,7 @@ int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set);
> >  
> >  int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
> >  				 const struct mtk_pin_desc *desc, int *res)
> > @@ -404,6 +409,7 @@ int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get);
> >  
> >  int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
> >  			 const struct mtk_pin_desc *desc, bool pullup)
> > @@ -423,6 +429,7 @@ int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set);
> >  
> >  int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
> >  			 const struct mtk_pin_desc *desc, bool pullup, int *res)
> > @@ -442,6 +449,7 @@ int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
> >  
> >  /* Revision 1 */
> >  int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
> > @@ -456,6 +464,7 @@ int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
> >  
> >  int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
> >  				      const struct mtk_pin_desc *desc, int *res)
> > @@ -473,6 +482,7 @@ int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get_rev1);
> >  
> >  int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
> >  			      const struct mtk_pin_desc *desc, bool pullup)
> > @@ -492,6 +502,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
> >  
> >  int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
> >  			      const struct mtk_pin_desc *desc, bool pullup,
> > @@ -517,6 +528,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_gev1);
> >  
> >  /* Combo for the following pull register type:
> >   * 1. PU + PD
> > @@ -717,6 +729,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
> >  out:
> >  	return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
> >  
> >  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> >  			      const struct mtk_pin_desc *desc,
> > @@ -737,6 +750,7 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
> >  out:
> >  	return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
> >  
> >  /* Revision 0 */
> >  int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
> > @@ -766,6 +780,7 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
> >  
> >  	return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set);
> >  
> >  int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
> >  			  const struct mtk_pin_desc *desc, int *val)
> > @@ -790,6 +805,7 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get);
> >  
> >  /* Revision 1 */
> >  int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
> > @@ -811,6 +827,7 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
> >  
> >  	return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_rev1);
> >  
> >  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
> >  			       const struct mtk_pin_desc *desc, int *val)
> > @@ -828,18 +845,21 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_rev1);
> >  
> >  int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
> >  			       const struct mtk_pin_desc *desc, u32 arg)
> >  {
> >  	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_raw);
> >  
> >  int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
> >  			       const struct mtk_pin_desc *desc, int *val)
> >  {
> >  	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_raw);
> >  
> >  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
> >  			     const struct mtk_pin_desc *desc, bool pullup,
> > @@ -880,6 +900,7 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
> >  
> >  	return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_set);
> >  
> >  int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
> >  			     const struct mtk_pin_desc *desc, bool pullup,
> > @@ -922,6 +943,7 @@ int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_get);
> >  
> >  int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
> >  			      const struct mtk_pin_desc *desc, u32 arg)
> > @@ -948,6 +970,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
> >  
> >  	return err;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
> >  
> >  int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
> >  			      const struct mtk_pin_desc *desc, u32 *val)
> > @@ -971,3 +994,4 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
> >  
> >  	return 0;
> >  }
> > +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > index 83bf29c..af97794 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> > @@ -9,6 +9,7 @@
> >   *	   Hongzhou.Yang <hongzhou.yang@mediatek.com>
> >   */
> >  
> > +#include <linux/module.h>
> >  #include <linux/gpio/driver.h>
> >  #include <dt-bindings/pinctrl/mt65xx.h>
> >  #include "pinctrl-paris.h"
> > @@ -1037,3 +1038,7 @@ static int mtk_paris_pinctrl_resume(struct device *device)
> >  	.suspend_noirq = mtk_paris_pinctrl_suspend,
> >  	.resume_noirq = mtk_paris_pinctrl_resume,
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
> >  	kfree(cfg);
> >  	return ret;
> >  }
> > +EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
> >  
> >  int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
> >  		struct device_node *np, struct pinctrl_map **map,
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
