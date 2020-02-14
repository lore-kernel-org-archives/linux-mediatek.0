Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB94C2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 10:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D5D32067D
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 10:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UiVb+4G0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQNEmwEe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D5D32067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLpytgYGZTpSyLcapQky8TbTCk1TAVh5z0Jvipb919c=; b=UiVb+4G06iXfLS
	11CLI2AopXSpDlL+2vLxnuptMIq30C4lm2ALiOwWH2cyxgFvAgR+ZQzop71vyzCAtsKXdgrreC73D
	oPSjx5vFqEKJ0U02hxWDPHUMbzvLuQ6zytY39rHm4xV47PHDZZutbbUkNAzWtkx7/LzlCMY7h8+Xx
	yy74So1TzANrAwr1Fug23A+lQjxP91jDy2Yi/KqgfVCxGvJHqizzZaiEEXgSswr1Gw+lfxZJXrwSU
	1+vurXwQVnX7pFGLMaHt4/lAcWZY1zOkFvDRG8nGT20XFijmjabs6FeqIkI3Xdcame9dx7DSYlkAz
	8d4iUOVLkUS/c3UzSqEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2YLd-0007ki-3x; Fri, 14 Feb 2020 10:37:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2YLZ-0007kD-FV
 for linux-mediatek@lists.infradead.org; Fri, 14 Feb 2020 10:37:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so10059244wme.2
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Feb 2020 02:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MC/XiRNn6JIhnfrc+ytZFQznTw34f2IQXIE/Qznp/Bg=;
 b=kQNEmwEew339Pnww8IzGgEqAfTt9oZW6mPhcGyyC7D+GEr5sRCKtR6jaJBYmry6DXS
 Kt4vyVcv9u42kD70nTZl2VhZ02f2zMypwwM8SbTMbvGLbG6LHXhjOX+J/VqGKmckqK+n
 X3ojRDSk/vgrLAEJjHcrPTPhrxgwsFWJcgMXOOar2FF4snyz/EydA4JBIVFVpk7lIuvF
 iC8yviMD5t+Sb0gik87Pbtl4Z599leVfjoL3JI2NOcZFO+2lVqFUsAg25OxmadlTvg/x
 BwXcBv3qfkVzVJebFU4c5rjTSwv+B417ukX8W7pxfLSsz5aG43b2U34li8Ds94ifhvhq
 bVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MC/XiRNn6JIhnfrc+ytZFQznTw34f2IQXIE/Qznp/Bg=;
 b=AkGNVIbrDH3XCKJuYJ4mkoVwpEa/jRI2OCqJN+4hBHIw8XlnZR5rwY4qsnaW1jGEdB
 3GdMbX2BtVobOqh7xZV40bkLEchXa/hqunIikz0M0EIyPvBNwsMwyWAN4Sq93x9qEoC9
 1m62rn5llhbLwIPbecXfXZdRJZKivXaY3uGlTeknnxTZKw37hdTXJAIFoWjpoJZf6a35
 5xqTRjhRBXVVnoDrOlD4HcMOq5SbgyyIeZlGprJMvuwQawC9lX5Too71xqeIPqKwYiNa
 XXWtzUfXnQ1yMhNzvu2z5Bsclt92LyfkoNZb+J97PVOdc1KXk/trb7YUBMajT76wTWk3
 0hXA==
X-Gm-Message-State: APjAAAXpzUiYGqMPE4fPyIslkPR7vv+1nLmSpjkZOgQbIagtVve2X9HO
 IL7sCwQQf8b5vy1QdaFPmwB+AX94
X-Google-Smtp-Source: APXvYqxgbCOKDmE/7EaVBkcBaVElBo+ZD83+KJ0awes6AN4PMo7jdlROrvN7fFQvnKKCVCgLX+foUQ==
X-Received: by 2002:a1c:65d6:: with SMTP id z205mr3885034wmb.38.1581676639561; 
 Fri, 14 Feb 2020 02:37:19 -0800 (PST)
Received: from ziggy.stardust ([37.223.145.31])
 by smtp.gmail.com with ESMTPSA id c13sm6541912wrn.46.2020.02.14.02.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 02:37:18 -0800 (PST)
Subject: Re: [PATCH v1 1/2] pinctrl: make MediaTek pinctrl v2 driver ready for
 buidling kernel module
To: Light Hsieh <light.hsieh@mediatek.com>, linus.walleij@linaro.org
References: <1581574105-1160-1-git-send-email-light.hsieh@mediatek.com>
 <1581574624.1827.4.camel@mtkswgap22>
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <b35c33a9-0d58-c98d-05eb-241efdc0c9af@gmail.com>
Date: Fri, 14 Feb 2020 11:37:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581574624.1827.4.camel@mtkswgap22>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_023721_525120_4E3E7826 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: linux-gpio@vger.kernel.org, sean.wang@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/02/2020 07:17, Light Hsieh wrote:
> Dear Reviewers:
> 
> Google plan to make platform driver as kernel module in future Android
> kernel.
> This patch series prepare to make platforms that use MediaTek pinctrl
> paris driver (pinctrl-paris.c, pinctrl-mtk-common-v2.c, and mtk-eint.c)
> compatible for building either kernel module or built-in.
> 
> Please give your comments.
> 

I think I didn't explain myself good enough.
These should be three patches:

1. change mtk-eint driver + Kconfig to be loadable as a module
2. change pinctrl-paris + Kconfig to be loadable as a module
3. change mt6765.

Please make sure that every patch compiles and does not break the system. This
will later help to use git-bisect to hunt down bugs in the kernel.

Regards,
Matthias

> Light
> 
> On Thu, 2020-02-13 at 14:08 +0800, light.hsieh@mediatek.com wrote:
>> From: Light Hsieh <light.hsieh@mediatek.com>
>>
>> Google plan to make platform driver as kernel module for future
>> Andriod kernel. This patch make platforms that use pinctrl-paris.c
>> of MediaTek pinctrl v2 ready for building kernel module.
>>
>> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
>> ---
>>  drivers/pinctrl/mediatek/mtk-eint.c              |  9 +++++++++
>>  drivers/pinctrl/mediatek/pinctrl-mt6765.c        |  4 ++++
>>  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 24 ++++++++++++++++++++++++
>>  drivers/pinctrl/mediatek/pinctrl-paris.c         |  5 +++++
>>  drivers/pinctrl/pinconf-generic.c                |  1 +
>>  5 files changed, 43 insertions(+)
>>
>> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
>> index 7e526bcf..99703a8 100644
>> --- a/drivers/pinctrl/mediatek/mtk-eint.c
>> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
>> @@ -9,6 +9,7 @@
>>   *
>>   */
>>  
>> +#include <linux/module.h>
>>  #include <linux/delay.h>
>>  #include <linux/err.h>
>>  #include <linux/gpio/driver.h>
>> @@ -379,6 +380,7 @@ int mtk_eint_do_suspend(struct mtk_eint *eint)
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
>>  
>>  int mtk_eint_do_resume(struct mtk_eint *eint)
>>  {
>> @@ -386,6 +388,7 @@ int mtk_eint_do_resume(struct mtk_eint *eint)
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_eint_do_resume);
>>  
>>  int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>>  			  unsigned int debounce)
>> @@ -440,6 +443,7 @@ int mtk_eint_set_debounce(struct mtk_eint *eint, unsigned long eint_num,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_eint_set_debounce);
>>  
>>  int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>>  {
>> @@ -451,6 +455,7 @@ int mtk_eint_find_irq(struct mtk_eint *eint, unsigned long eint_n)
>>  
>>  	return irq;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>>  
>>  int mtk_eint_do_init(struct mtk_eint *eint)
>>  {
>> @@ -495,3 +500,7 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_eint_do_init);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("MediaTek EINT Driver");
>> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
>> index 905dae8c..2c59d39 100644
>> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
>> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
>> @@ -6,6 +6,7 @@
>>   *
>>   */
>>  
>> +#include <linux/module.h>
>>  #include "pinctrl-mtk-mt6765.h"
>>  #include "pinctrl-paris.h"
>>  
>> @@ -1103,3 +1104,6 @@ static int __init mt6765_pinctrl_init(void)
>>  	return platform_driver_register(&mt6765_pinctrl_driver);
>>  }
>>  arch_initcall(mt6765_pinctrl_init);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("MediaTek MT6765 Pinctrl Driver");
>> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
>> index 1da9425..cdf2d69 100644
>> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
>> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
>> @@ -6,6 +6,7 @@
>>   *
>>   */
>>  
>> +#include <linux/module.h>
>>  #include <dt-bindings/pinctrl/mt65xx.h>
>>  #include <linux/device.h>
>>  #include <linux/err.h>
>> @@ -206,6 +207,7 @@ int mtk_hw_set_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_hw_set_value);
>>  
>>  int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>>  		     int field, int *value)
>> @@ -225,6 +227,7 @@ int mtk_hw_get_value(struct mtk_pinctrl *hw, const struct mtk_pin_desc *desc,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_hw_get_value);
>>  
>>  static int mtk_xt_find_eint_num(struct mtk_pinctrl *hw, unsigned long eint_n)
>>  {
>> @@ -363,6 +366,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
>>  
>>  	return mtk_eint_do_init(hw->eint);
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_build_eint);
>>  
>>  /* Revision 0 */
>>  int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
>> @@ -382,6 +386,7 @@ int mtk_pinconf_bias_disable_set(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set);
>>  
>>  int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
>>  				 const struct mtk_pin_desc *desc, int *res)
>> @@ -404,6 +409,7 @@ int mtk_pinconf_bias_disable_get(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get);
>>  
>>  int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
>>  			 const struct mtk_pin_desc *desc, bool pullup)
>> @@ -423,6 +429,7 @@ int mtk_pinconf_bias_set(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set);
>>  
>>  int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
>>  			 const struct mtk_pin_desc *desc, bool pullup, int *res)
>> @@ -442,6 +449,7 @@ int mtk_pinconf_bias_get(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
>>  
>>  /* Revision 1 */
>>  int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
>> @@ -456,6 +464,7 @@ int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
>>  
>>  int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
>>  				      const struct mtk_pin_desc *desc, int *res)
>> @@ -473,6 +482,7 @@ int mtk_pinconf_bias_disable_get_rev1(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_get_rev1);
>>  
>>  int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
>>  			      const struct mtk_pin_desc *desc, bool pullup)
>> @@ -492,6 +502,7 @@ int mtk_pinconf_bias_set_rev1(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_rev1);
>>  
>>  int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>>  			      const struct mtk_pin_desc *desc, bool pullup,
>> @@ -517,6 +528,7 @@ int mtk_pinconf_bias_get_rev1(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_gev1);
>>  
>>  /* Combo for the following pull register type:
>>   * 1. PU + PD
>> @@ -717,6 +729,7 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
>>  out:
>>  	return err;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_set_combo);
>>  
>>  int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
>>  			      const struct mtk_pin_desc *desc,
>> @@ -737,6 +750,7 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
>>  out:
>>  	return err;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get_combo);
>>  
>>  /* Revision 0 */
>>  int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
>> @@ -766,6 +780,7 @@ int mtk_pinconf_drive_set(struct mtk_pinctrl *hw,
>>  
>>  	return err;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set);
>>  
>>  int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
>>  			  const struct mtk_pin_desc *desc, int *val)
>> @@ -790,6 +805,7 @@ int mtk_pinconf_drive_get(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get);
>>  
>>  /* Revision 1 */
>>  int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>> @@ -811,6 +827,7 @@ int mtk_pinconf_drive_set_rev1(struct mtk_pinctrl *hw,
>>  
>>  	return err;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_rev1);
>>  
>>  int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>>  			       const struct mtk_pin_desc *desc, int *val)
>> @@ -828,18 +845,21 @@ int mtk_pinconf_drive_get_rev1(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_rev1);
>>  
>>  int mtk_pinconf_drive_set_raw(struct mtk_pinctrl *hw,
>>  			       const struct mtk_pin_desc *desc, u32 arg)
>>  {
>>  	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_DRV, arg);
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_set_raw);
>>  
>>  int mtk_pinconf_drive_get_raw(struct mtk_pinctrl *hw,
>>  			       const struct mtk_pin_desc *desc, int *val)
>>  {
>>  	return mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_DRV, val);
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_drive_get_raw);
>>  
>>  int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>>  			     const struct mtk_pin_desc *desc, bool pullup,
>> @@ -880,6 +900,7 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
>>  
>>  	return err;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_set);
>>  
>>  int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
>>  			     const struct mtk_pin_desc *desc, bool pullup,
>> @@ -922,6 +943,7 @@ int mtk_pinconf_adv_pull_get(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_pull_get);
>>  
>>  int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
>>  			      const struct mtk_pin_desc *desc, u32 arg)
>> @@ -948,6 +970,7 @@ int mtk_pinconf_adv_drive_set(struct mtk_pinctrl *hw,
>>  
>>  	return err;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_set);
>>  
>>  int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>>  			      const struct mtk_pin_desc *desc, u32 *val)
>> @@ -971,3 +994,4 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
>> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
>> index 83bf29c..af97794 100644
>> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
>> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
>> @@ -9,6 +9,7 @@
>>   *	   Hongzhou.Yang <hongzhou.yang@mediatek.com>
>>   */
>>  
>> +#include <linux/module.h>
>>  #include <linux/gpio/driver.h>
>>  #include <dt-bindings/pinctrl/mt65xx.h>
>>  #include "pinctrl-paris.h"
>> @@ -1037,3 +1038,7 @@ static int mtk_paris_pinctrl_resume(struct device *device)
>>  	.suspend_noirq = mtk_paris_pinctrl_suspend,
>>  	.resume_noirq = mtk_paris_pinctrl_resume,
>>  };
>> +EXPORT_SYMBOL_GPL(mtk_paris_pinctrl_probe);
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("MediaTek Pinctrl Common Driver V2 Paris");
>> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
>> index 9eb8630..dfef471 100644
>> --- a/drivers/pinctrl/pinconf-generic.c
>> +++ b/drivers/pinctrl/pinconf-generic.c
>> @@ -286,6 +286,7 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>>  	kfree(cfg);
>>  	return ret;
>>  }
>> +EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
>>  
>>  int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>>  		struct device_node *np, struct pinctrl_map **map,
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
