Return-Path: <SRS0=fVgr=5A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E734AC10F29
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Mar 2020 21:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B750B20663
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Mar 2020 21:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KoFcwMo9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1tyGz5j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B750B20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cIRytIAbAsXziccO6NAQHr/NL96k4uyNGyyalRzxqY0=; b=KoFcwMo97VpvnL
	g8TNhvEodCummf+ZHm8QgFsoJ94sKO2jG8IzHZVm4XU/yYkpln3b0OPAq/OX3aLzcV7Y+VUIDR4Kt
	LkcRrvcI1wSo2uflvk8J6ie4QqWgDql/tchlamJvwwei1xSVywyvkPyXbbL6VX33NyRtcFdKc8c4W
	oiKrQyKxZyeeMxzMroIpqIMRFPcyhsZckZi02eBeQ5mrLBhjqE8a7ZOiyBb+lqL9FIdAR5DhrHb9G
	T8gfGpm7YYglkajfjhnIRjmO8/O1rWBYPZoD+3mVSyTnV3+g9VoxwfX3PyPCEaqpuJfkRJs1pLhqt
	Jx1Mk3DwOnaCRSLJtVmQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDabW-0007EE-9F; Sun, 15 Mar 2020 21:15:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDabT-0007Df-LN
 for linux-mediatek@lists.infradead.org; Sun, 15 Mar 2020 21:15:25 +0000
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 55389206B1
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Mar 2020 21:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584306922;
 bh=I0g6ojUYaVQQh4Yfg/YJnRtaQaO75W6X4bRMQz89Ssc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=U1tyGz5j1knx7F7AOjLZ0kHMBz3jiKJ9N2o+QnPAluXRnWbt76Dn6iMeICVxCOpMn
 3K9X0w8jyRk3oJ/lN5wayrkyOJuC4R2WicZ2pp/RPLlcQQIbAJxM188U/0jlZG5gEP
 6sdGzUkp61RiDbC8UPLEY2jVFw/bypaReiAT3yDc=
Received: by mail-il1-f177.google.com with SMTP id w15so7186788ilq.6
 for <linux-mediatek@lists.infradead.org>; Sun, 15 Mar 2020 14:15:22 -0700 (PDT)
X-Gm-Message-State: ANhLgQ36AQ5uW+jsdB3auIwT0gXfnE80siBVhnfXxtJjv8bONUpUl7ws
 LACDxz7RNi5bkODG0rQ+j+kwDRDOk430E2x6r7Y=
X-Google-Smtp-Source: ADFU+vt4PuCONW+VhbJRvtM7lzRmHkPT9FHvRDtafzkxRpQO9Oxna27KSMtEWJgHjV7CZ6FKg8l2LzUJNgsXbnQY3tc=
X-Received: by 2002:a92:216:: with SMTP id 22mr24194655ilc.53.1584306921712;
 Sun, 15 Mar 2020 14:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <1583825986-8189-1-git-send-email-light.hsieh@mediatek.com>
 <1583825986-8189-3-git-send-email-light.hsieh@mediatek.com>
In-Reply-To: <1583825986-8189-3-git-send-email-light.hsieh@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Sun, 15 Mar 2020 14:15:10 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzo-HkmiitBBJF9Mybbrdgy-Kphfyi2wf0SwMGXTeuWGVA@mail.gmail.com>
Message-ID: <CAGp9Lzo-HkmiitBBJF9Mybbrdgy-Kphfyi2wf0SwMGXTeuWGVA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] pinctrl: make MediaTek MT6765 pinctrl ready for
 buidling loadable module
To: Light Hsieh <light.hsieh@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_141523_728703_29055222 
X-CRM114-Status: GOOD (  15.03  )
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
 Linus Walleij <linus.walleij@linaro.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, kuohong.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Light

On Tue, Mar 10, 2020 at 12:39 AM <light.hsieh@mediatek.com> wrote:
>
> From: Light Hsieh <light.hsieh@mediatek.com>
>
> This patch make pinctrl-mt6765 ready for building as loadable module.
s/building/building/

I got build error after when those two patches are being applied
../drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c:529:1: error:
'mtk_pinconf_bias_set_gev1' undeclared here (not in a function)

>
> Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig          | 2 +-
>  drivers/pinctrl/mediatek/pinctrl-mt6765.c | 4 ++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 4cd1109..c645fdb 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -89,7 +89,7 @@ config PINCTRL_MT2712
>         select PINCTRL_MTK
>
>  config PINCTRL_MT6765
> -       bool "Mediatek MT6765 pin control"
> +       tristate "Mediatek MT6765 pin control"
>         depends on OF
>         depends on ARM64 || COMPILE_TEST
>         default ARM64 && ARCH_MEDIATEK
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6765.c b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> index 905dae8c..2c59d39 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6765.c
> @@ -6,6 +6,7 @@
>   *
>   */
>
> +#include <linux/module.h>
>  #include "pinctrl-mtk-mt6765.h"
>  #include "pinctrl-paris.h"
>
> @@ -1103,3 +1104,6 @@ static int __init mt6765_pinctrl_init(void)
>         return platform_driver_register(&mt6765_pinctrl_driver);
>  }
>  arch_initcall(mt6765_pinctrl_init);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("MediaTek MT6765 Pinctrl Driver");
> --
> 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
