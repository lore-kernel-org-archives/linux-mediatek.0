Return-Path: <SRS0=dCaZ=2J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73033C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 441BE206D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Dec 2019 03:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YV3YfGRP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TpULE9OX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 441BE206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R/xxMpgd6eAgbnHKyzwoePy+X3Y6wkJfRwPXa/oB5L8=; b=YV3YfGRPjlgDTO
	cK3FPqh8FgIjGQy8NPVe2hCLyIuPOwAfat7mEKwyNy+GVnutJNJnJW8UJvwwtsC9tgX3bGmA3Co+i
	fQJlfqrpCtT9UdHBhJG7s2n7pnttBRbQnt+8RmXZMTwclnKplKiBA26qhAyFlDqsH1Oy1xDzl6rhd
	hUzCh1tWTA/rbDCHjS2dI+z5s2Mbtd66WqnXBlrNRjsnrJFPwpcFcjaIR8HtVCz7G2ckK9RzwG7oe
	CcuiCXlKduzb7ZR4bZEPPSFUZDu/kp1SHWX2dCLt21gfiEXv50CjRJsxzKCouCu0teRf/0FmMNe6C
	es0DPGoEAy5f/k1jPieA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihmi9-0007B9-KY; Thu, 19 Dec 2019 03:42:49 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihmht-0006zx-4u
 for linux-mediatek@lists.infradead.org; Thu, 19 Dec 2019 03:42:35 +0000
Received: by mail-qk1-x744.google.com with SMTP id x129so3507497qke.8
 for <linux-mediatek@lists.infradead.org>; Wed, 18 Dec 2019 19:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O6LOFVunh/OJDC7JvnA4isOAWmQTXpcdKGgNnEbH64k=;
 b=TpULE9OXsOToVRsqIEUUz/0B5xzbX3OOmWBLyc4F5l6u3dO1p8OyzXbWfPNaWQy/Q9
 oFe99o0qfiy2B83AF2rbUCC0TwM4oTtWJhe97usSuT8iNv4jUH11GbTHJn0uNooIQdAt
 vJqLFDMdnIOQsjKsyCNjK5+w0TSJK6ToFOiNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O6LOFVunh/OJDC7JvnA4isOAWmQTXpcdKGgNnEbH64k=;
 b=DW+dannyS1ad9OD1xMuMj96/e5efdkPOGL1V7I4/nx3RbuM6olUBklawoCARv+66zE
 BIz7YJZdyxSYW/otkx0xtygdVsNg6ilYFEEW5TPr+lQETNCYT9CT6UfLp3UEJBtIfG66
 0P/XJU5CSEurtDPYMAQjQ16BrkWzj6wnVBc6I8A4jpzPSe2sgn/8uhA1OagkbbwmDFKP
 PF4PfiChqQMA7UYR0VIJXUjUB5nXuSlhrV3Acj9x4IcwkAC9Ta8KZN836ES2fU+PhK1d
 fBvSSAO6yuoOajNrNSvePsIxvJOwxn7XBlZTUlVvTLab7VauPQHoIQ7ODyfgg4DXEX2w
 O6aw==
X-Gm-Message-State: APjAAAUeI0UrIUIRYAwPvrU18kTy5fiYljBpK7h9kKk++uB7zuFQHp7Z
 Z/WJgOnf6P9oN+HR9NgljHGpyxeqv3reLyyktC9Gow==
X-Google-Smtp-Source: APXvYqyLgkLmeEnazbCRrjSZ2SBiwnCH2DOGyt2BMNtf/xUV1tD8U3wu7lA97+V5Un2IAowvdm70tIGk8nRKyyJ08zM=
X-Received: by 2002:a37:6551:: with SMTP id z78mr6443627qkb.144.1576726949364; 
 Wed, 18 Dec 2019 19:42:29 -0800 (PST)
MIME-Version: 1.0
References: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
 <1575960413-6900-5-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KA4KL=ZpU=cQtw3LV79DKRdG3Eb16og6vU1SdsnnL=0CA@mail.gmail.com>
 <1576551056.14035.19.camel@mtksdaap41>
 <CANMq1KAn3vwCm5=LJPjE=STw9=XLSwdQ7_LZA2_okkA-V8R_3A@mail.gmail.com>
 <1576635932.13343.8.camel@mtksdaap41>
In-Reply-To: <1576635932.13343.8.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 19 Dec 2019 11:42:18 +0800
Message-ID: <CANMq1KDeoRK8KcSqX9nA0d2iHAeq4oLnzgO16yCM5jK5uNJsSQ@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] soc: mediatek: Add multiple step bus protection
 control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_194233_187784_763CCF3C 
X-CRM114-Status: GOOD (  27.94  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 18, 2019 at 10:25 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> On Tue, 2019-12-17 at 13:33 +0800, Nicolas Boichat wrote:
> > On Tue, Dec 17, 2019 at 10:51 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > >
> > > On Mon, 2019-12-16 at 15:21 +0800, Nicolas Boichat wrote:
> > > > On Tue, Dec 10, 2019 at 2:47 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > > > >
> > > > > Both MT8183 & MT6765 have more control steps of bus protection
> > > > > than previous project. And there add more bus protection registers
> > > > > reside at infracfg & smi-common. Also add new APIs for multiple
> > > > > step bus protection control with more customized arguments.
> > > > >
> > > > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > > > ---
> > > > >  drivers/soc/mediatek/Makefile           |  2 +-
> > > > >  drivers/soc/mediatek/mtk-scpsys-ext.c   | 99 +++++++++++++++++++++++++++++++++
> > > > >  drivers/soc/mediatek/mtk-scpsys.c       | 39 +++++++++----
> > > > >  include/linux/soc/mediatek/scpsys-ext.h | 39 +++++++++++++
> > > > >  4 files changed, 168 insertions(+), 11 deletions(-)
> > > > >  create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
> > > > >  create mode 100644 include/linux/soc/mediatek/scpsys-ext.h
> > > > >
> > > > > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > > > > index b017330..b442be9 100644
> > > > > --- a/drivers/soc/mediatek/Makefile
> > > > > +++ b/drivers/soc/mediatek/Makefile
> > > > > @@ -1,5 +1,5 @@
> > > > >  # SPDX-License-Identifier: GPL-2.0-only
> > > > >  obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> > > > > -obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> > > > > +obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o mtk-scpsys-ext.o
> > > > >  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> > > > >  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> > > > > diff --git a/drivers/soc/mediatek/mtk-scpsys-ext.c b/drivers/soc/mediatek/mtk-scpsys-ext.c
> > > > > new file mode 100644
> > > > > index 0000000..4f1adda
> > > > > --- /dev/null
> > > > > +++ b/drivers/soc/mediatek/mtk-scpsys-ext.c
> > > > > @@ -0,0 +1,99 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Copyright (c) 2018 MediaTek Inc.
> > > > > + * Author: Owen Chen <Owen.Chen@mediatek.com>
> > > > > + */
> > > > > +#include <linux/ktime.h>
> > > > > +#include <linux/mfd/syscon.h>
> > > > > +#include <linux/of_device.h>
> > > > > +#include <linux/regmap.h>
> > > > > +#include <linux/soc/mediatek/scpsys-ext.h>
> > > > > +
> > > > > +#define MTK_POLL_DELAY_US   10
> > > > > +#define MTK_POLL_TIMEOUT    USEC_PER_SEC
> > > > > +
> > > > > +static int set_bus_protection(struct regmap *map, u32 mask, u32 ack_mask,
> > > > > +               u32 reg_set, u32 reg_sta, u32 reg_en)
> > > > > +{
> > > > > +       u32 val;
> > > > > +
> > > > > +       if (reg_set)
> > > > > +               regmap_write(map, reg_set, mask);
> > > > > +       else
> > > > > +               regmap_update_bits(map, reg_en, mask, mask);
> > > >
> > > > At least for 8183, we never seen to use the reg_set case, can we
> > > > simplify this function?
> > > >
> > >
> > > Actually 6765 will use it and all the other MediaTek chips at least in
> > > near future.
> > > https://patchwork.kernel.org/patch/11042003/
> >
> > Ok, that's fine then.
> >
> > > > > +
> > > > > +       return regmap_read_poll_timeout(map, reg_sta,
> > > > > +                       val, (val & ack_mask) == ack_mask,
> > > > > +                       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > > >
> > > > From 8183, I see that you have either:
> > > >  1. mask == ack_mask
> > > >  2. ack_mask == 0 (essentially this skips this test)
> > > >
> > > > Would it be simpler to just skip this test if reg_sta == 0, and always
> > > > assume mask == ack_mask otherwise?
> > > >
> > > > e.g.
> > > > if (reg_sta == 0)
> > > >    return 0;
> > > >
> > > > return regmap_read_poll_timeout(map, reg_sta,
> > > >                        val, (val & mask) == mask,
> > > >                        MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> > > >
> > >
> > > I'm not sure if you mean ack_mask == 0?
> > > reg_sta would be possible to be 0 because it's a register address
> > > offset.
> >
> > Right, so maybe "0" is not a good invalid value, or maybe you can have a
> > #define REG_STA_INVALID U32_MAX
> >
> > And then test for:
> > if (reg_sta == REG_STA_INVALID)
> >    return 0;
> >
> > My point here is that mask and ack_mask are always the same (unless
> > you don't care about reading back the status), so maybe you only need
> > to specify mask?
> >
> > (but if you need different mask and ack_mask for future chips, feel
> > free to ignore)
> >
>
> I do need different mask and ack_mask.
> For the special case of 8183 here, we still have to check the ack status
> when setting bus protection but only ignore the ack status when clearing
> bus protection.
>
> case A.
> SET: reg_set, reg_sta, mask == ack mask
> CLEAR: reg_clr, reg_sta, mask == clear ack mask
>
> case B. (the special case we discussed)
> SET: reg_set, reg_sta, mask == ack mask
> CLEAR: reg_clr, reg_sta, mask != clear ack mask(which is 0 now)
>
> If I use the REG_STA_INVALID to replace the clear ack mask way.
> I might need two reg_sta to satisfy the check of set and clear bus
> protection.
> One is valid for setting case and another is invalid for clearing case,
> e.g. case 2 below
>
> case 1.
> SET: reg_set, reg_sta(valid), mask == ack mask
> CLEAR: reg_clr, reg_sta(valid), mask == ack mask
>
> case 2.
> SET: reg_set, reg_sta(valid), mask == ack mask
> CLEAR: reg_clr, reg_sta(invalid then return), mask == ack mask
>
> so I'd like to keep the original proposal. What do you think?

Ooh, I see. This is quite confusing to be honest... I wonder if it
wouldn't be clearer to have a boolean instead in bus_prot (something
like "clk_no_check", can't find a better name right now).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
