Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49D8C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 21:46:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8272420737
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 21:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FMdA9ME3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Az1kFmsC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8272420737
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLtTPxH1LjMjkgu9cl2y0HfIBqpxSU9elw0D7EZHA6w=; b=FMdA9ME3LOyHig
	JTrmzuyAD1TWNzpTH/oRTZvcfynwM/4RekJKbKjYmE6dhCxXm4056hGYA7yk3g9X7qaEc5fD/brBH
	s3LJN+lI37Hfhk5Bv+7fGat/ulZPUWQmjgRI9Y1YfnYCyeUp6G6YqAdPOCz/7z3hpmhK9ar6O2C/T
	IOg3Mfuz/hNGlyWc9MJiw1R6H3AM9GmyUreDKYYb3PgGSLZmzsds1hesHxXyOtpZUeKUHUi+aaLgR
	V90645RIo/90iMf2v8C+iKZNoU5Y45t12k/vUDylqfFA8J/Qq8J6sd/Dbh1qvXb0EmNTjI6IYbZc3
	1gG4WW7aQ0M910z3VdfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK7fL-0004K2-O1; Thu, 02 Apr 2020 21:46:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK7fJ-0004Ja-Km
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 21:46:22 +0000
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29D04208E0
 for <linux-mediatek@lists.infradead.org>; Thu,  2 Apr 2020 21:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585863981;
 bh=jjK1H/hAvk5yQ4FEwfBH7ucz1rxv/FjvZrwzR0iLZno=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Az1kFmsCyVVEKiSnVTQCQbb7LpDlfNCNq0XOZUq06hOENuK2uipb8iz/cwEEF2XfB
 GKPFw0HWQugSY5NCifihDntuIBEMJq80Obt62Apd9AZCvKDfy3TB2+jPMyE2FiUEZ7
 lqlXr1EpKgaKctxdS8jdZHRbCLaV/NPTjWlUDEig=
Received: by mail-io1-f52.google.com with SMTP id o127so5368882iof.0
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Apr 2020 14:46:21 -0700 (PDT)
X-Gm-Message-State: AGi0PubPFj4I+4igQaI7FOmQ8Qz33GB2OljeqNRdH8IkQAodUzb5RutP
 ug+55bs90kMvddImqrHW63Cl+on9B3Y+G4/CL2g=
X-Google-Smtp-Source: APiQypLC6ryaAD8pUnhVXj/E/W7ovtmW8rrj1k7DAualWv4qMHv6pcGlDQqkDbuw1rs+o3K6zcRDIVNKkrssYo0BkUE=
X-Received: by 2002:a02:c792:: with SMTP id n18mr5501365jao.5.1585863980559;
 Thu, 02 Apr 2020 14:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
 <1585128694-13881-5-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1585128694-13881-5-git-send-email-hanks.chen@mediatek.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 2 Apr 2020 14:46:10 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzrci=qhU6QXPfGg=-dGtKNq1Xn-rhYWvPp-8Wj6v6oJwA@mail.gmail.com>
Message-ID: <CAGp9Lzrci=qhU6QXPfGg=-dGtKNq1Xn-rhYWvPp-8Wj6v6oJwA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] pinctrl: mediatek: add pinctrl support for MT6779
 SoC
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_144621_725540_772DBA0A 
X-CRM114-Status: GOOD (  17.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hanks,

On Wed, Mar 25, 2020 at 2:31 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
>
> This adds MT6779 pinctrl driver based on MediaTek pinctrl-paris core.
>

We can add some useful help text about MT6779 pinctrl, especially
about specific parts like virtual gpio and its attributes
Then Acked-by: Sean Wang <sean.wang@kernel.org>

> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig              |    7 +
>  drivers/pinctrl/mediatek/Makefile             |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt6779.c     |  775 +++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h | 2085 +++++++++++++++++++++++++
>  4 files changed, 2868 insertions(+)
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6779.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6779.h
>
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 701f9af..f628d01 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -86,6 +86,13 @@ config PINCTRL_MT6765
>         default ARM64 && ARCH_MEDIATEK
>         select PINCTRL_MTK_PARIS
>
> +config PINCTRL_MT6779
> +       bool "Mediatek MT6779 pin control"
> +       depends on OF
> +       depends on ARM64 || COMPILE_TEST
> +       default ARM64 && ARCH_MEDIATEK
> +       select PINCTRL_MTK_PARIS
> +
>  config PINCTRL_MT6797
>         bool "Mediatek MT6797 pin control"
>         depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index a74325a..59c1c60 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -11,6 +11,7 @@ obj-$(CONFIG_PINCTRL_MT2712)  += pinctrl-mt2712.o
>  obj-$(CONFIG_PINCTRL_MT8135)   += pinctrl-mt8135.o
>  obj-$(CONFIG_PINCTRL_MT8127)   += pinctrl-mt8127.o
>  obj-$(CONFIG_PINCTRL_MT6765)   += pinctrl-mt6765.o
> +obj-$(CONFIG_PINCTRL_MT6779)   += pinctrl-mt6779.o
>  obj-$(CONFIG_PINCTRL_MT6797)   += pinctrl-mt6797.o
>  obj-$(CONFIG_PINCTRL_MT7622)   += pinctrl-mt7622.o
>  obj-$(CONFIG_PINCTRL_MT7623)   += pinctrl-mt7623.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6779.c b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
> new file mode 100644
> index 0000000..145bf22
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
> @@ -0,0 +1,775 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2019 MediaTek Inc.
> + * Author: Andy Teng <andy.teng@mediatek.com>
> + *
> + */
> +
> +#include "pinctrl-mtk-mt6779.h"
> +#include "pinctrl-paris.h"
> +
> +/* MT6779 have multiple bases to program pin configuration listed as the below:
> + * gpio:0x10005000,     iocfg_rm:0x11C20000, iocfg_br:0x11D10000,
> + * iocfg_lm:0x11E20000, iocfg_lb:0x11E70000, iocfg_rt:0x11EA0000,
> + * iocfg_lt:0x11F20000, iocfg_tl:0x11F30000
> + * _i_based could be used to indicate what base the pin should be mapped into.
> + */
> +
> +#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
> +       PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
> +                      32, 0)
> +

<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
