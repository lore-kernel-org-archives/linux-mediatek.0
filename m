Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A5BC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 05:34:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6694B2072B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 05:34:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QsOkQFvg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="admuLUOe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6694B2072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bgucboc/okBQ9sBKTbgeyHdlgqUZ5lrhrMrM+7f6Vs0=; b=QsOkQFvgwqRjaZ
	uDEQtXKgncoJOl/neQHKtXIPpqaqVNRCC417fZOPDGFnJr43NYf/BLey+a8OmMdGhBYDqFyxFbB7u
	s7qWnMvTIEXPFqSYjZixQHIkB0FqfyYMYfZQiyw+hTw+UsEcrLWcEprnMiBbbjI8mBFYewJrLBmIc
	cz11SIeKe15kzsqROH8a2rIf/NwVI3vNKI7wpgsV+27MFLwquSr0Qwx+n8zgPVpaiILIOaLS5VfVk
	tQSqpUWblpYYc0eVWx6GLaF7egmOj7kL8Oz23AVJ4aTDYGngkjlscAvVIIlVOyippLhu7AkXCcERd
	Bw4gVQBG1vpHXAlknhUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih5Uo-0001ur-15; Tue, 17 Dec 2019 05:34:10 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih5Uk-0001u9-Jw
 for linux-mediatek@lists.infradead.org; Tue, 17 Dec 2019 05:34:08 +0000
Received: by mail-qv1-xf41.google.com with SMTP id o18so3732938qvf.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2019 21:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkVbZ8ENkH+ds12UWnjxSjr2MXvX5jj5ICrUbrDVvxM=;
 b=admuLUOe97B1hHycPKuDS2v+2HCcfV08MHZWPicpEZg1unk+0YxvQiCyWEhby4Un+u
 fsAH61GNQ5MlNGgU7VzW8KvX/AkFAGHw340AwFGxos4lz5jsCfY3hAzX/VEm+3V0JGJp
 z17KcYCNgrNnidu60O7dPIRswDqDG+mlzEAIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkVbZ8ENkH+ds12UWnjxSjr2MXvX5jj5ICrUbrDVvxM=;
 b=DVeyHt1fN5hKtzi/GF4otLQqBWAO982HSru4/AaQGoz36aWcblE+RrOwIOclkyLqhE
 h2vTquUL2iKTXivXnoyZHOKWrZzZjn6+ZtAOH82LPH6nhUXo/pEPW2D1BBZR9E0Qjqrj
 XQ64AKsizTvDxw0avQ/R2sRAJrFW9ve94OX/UborqoUuZl4qmYE/wv0fUnHVgkNaepEK
 mxLcsZoq9M/Cewjl5W/GvHQTLdGkdVkRyax0ou3fbBAMTmWlJa3k07iPqQ3JMbP6bSxQ
 dmKqJ5qA2qo8sRHEqAODlYZc83OqsmSVQugSjxFPh140g4ZijGY3mxxPRqUDAyDiNNBB
 rcGg==
X-Gm-Message-State: APjAAAVUqnI3FQxmhyjdjQcQ7SjcwMqJItkqvP4UvjIpb7vSA+RuB1tI
 D/XgkfZBQZ6c0Bt6jCqrEEknpxl3i23ktpsclrLi2Q==
X-Google-Smtp-Source: APXvYqzpoFii6/nUVvr6u8utoeyqvoAQA7ZpTiAVcAyy0QBiKbHi4AR7o9uJb1O+eQ94NeTVX7i2CWc/Uf+N4Cdv9D8=
X-Received: by 2002:a0c:f703:: with SMTP id w3mr3041792qvn.6.1576560843824;
 Mon, 16 Dec 2019 21:34:03 -0800 (PST)
MIME-Version: 1.0
References: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
 <1575960413-6900-5-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KA4KL=ZpU=cQtw3LV79DKRdG3Eb16og6vU1SdsnnL=0CA@mail.gmail.com>
 <1576551056.14035.19.camel@mtksdaap41>
In-Reply-To: <1576551056.14035.19.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 17 Dec 2019 13:33:52 +0800
Message-ID: <CANMq1KAn3vwCm5=LJPjE=STw9=XLSwdQ7_LZA2_okkA-V8R_3A@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] soc: mediatek: Add multiple step bus protection
 control
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_213406_681737_F1DBAD07 
X-CRM114-Status: GOOD (  27.78  )
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

On Tue, Dec 17, 2019 at 10:51 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> On Mon, 2019-12-16 at 15:21 +0800, Nicolas Boichat wrote:
> > On Tue, Dec 10, 2019 at 2:47 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> > >
> > > Both MT8183 & MT6765 have more control steps of bus protection
> > > than previous project. And there add more bus protection registers
> > > reside at infracfg & smi-common. Also add new APIs for multiple
> > > step bus protection control with more customized arguments.
> > >
> > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > ---
> > >  drivers/soc/mediatek/Makefile           |  2 +-
> > >  drivers/soc/mediatek/mtk-scpsys-ext.c   | 99 +++++++++++++++++++++++++++++++++
> > >  drivers/soc/mediatek/mtk-scpsys.c       | 39 +++++++++----
> > >  include/linux/soc/mediatek/scpsys-ext.h | 39 +++++++++++++
> > >  4 files changed, 168 insertions(+), 11 deletions(-)
> > >  create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
> > >  create mode 100644 include/linux/soc/mediatek/scpsys-ext.h
> > >
> > > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > > index b017330..b442be9 100644
> > > --- a/drivers/soc/mediatek/Makefile
> > > +++ b/drivers/soc/mediatek/Makefile
> > > @@ -1,5 +1,5 @@
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >  obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> > > -obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
> > > +obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o mtk-scpsys-ext.o
> > >  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> > >  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> > > diff --git a/drivers/soc/mediatek/mtk-scpsys-ext.c b/drivers/soc/mediatek/mtk-scpsys-ext.c
> > > new file mode 100644
> > > index 0000000..4f1adda
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/mtk-scpsys-ext.c
> > > @@ -0,0 +1,99 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2018 MediaTek Inc.
> > > + * Author: Owen Chen <Owen.Chen@mediatek.com>
> > > + */
> > > +#include <linux/ktime.h>
> > > +#include <linux/mfd/syscon.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/regmap.h>
> > > +#include <linux/soc/mediatek/scpsys-ext.h>
> > > +
> > > +#define MTK_POLL_DELAY_US   10
> > > +#define MTK_POLL_TIMEOUT    USEC_PER_SEC
> > > +
> > > +static int set_bus_protection(struct regmap *map, u32 mask, u32 ack_mask,
> > > +               u32 reg_set, u32 reg_sta, u32 reg_en)
> > > +{
> > > +       u32 val;
> > > +
> > > +       if (reg_set)
> > > +               regmap_write(map, reg_set, mask);
> > > +       else
> > > +               regmap_update_bits(map, reg_en, mask, mask);
> >
> > At least for 8183, we never seen to use the reg_set case, can we
> > simplify this function?
> >
>
> Actually 6765 will use it and all the other MediaTek chips at least in
> near future.
> https://patchwork.kernel.org/patch/11042003/

Ok, that's fine then.

> > > +
> > > +       return regmap_read_poll_timeout(map, reg_sta,
> > > +                       val, (val & ack_mask) == ack_mask,
> > > +                       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> >
> > From 8183, I see that you have either:
> >  1. mask == ack_mask
> >  2. ack_mask == 0 (essentially this skips this test)
> >
> > Would it be simpler to just skip this test if reg_sta == 0, and always
> > assume mask == ack_mask otherwise?
> >
> > e.g.
> > if (reg_sta == 0)
> >    return 0;
> >
> > return regmap_read_poll_timeout(map, reg_sta,
> >                        val, (val & mask) == mask,
> >                        MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
> >
>
> I'm not sure if you mean ack_mask == 0?
> reg_sta would be possible to be 0 because it's a register address
> offset.

Right, so maybe "0" is not a good invalid value, or maybe you can have a
#define REG_STA_INVALID U32_MAX

And then test for:
if (reg_sta == REG_STA_INVALID)
   return 0;

My point here is that mask and ack_mask are always the same (unless
you don't care about reading back the status), so maybe you only need
to specify mask?

(but if you need different mask and ack_mask for future chips, feel
free to ignore)

> I guess what you'd actually suggest is like below?
>
> if (ack_mask == 0)
>     return 0;
>
> return regmap_read_poll_timeout(map, reg_sta,
>                        val, (val & mask) == mask,
>                        MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
>
>
> > > +}
> > > +
> > > [snip]
> > > +
> > > +int mtk_scpsys_ext_set_bus_protection(const struct bus_prot *bp_table,
> > > +       struct regmap *infracfg, struct regmap *smi_common)
> > > +{
> > > +       int i;
> > > +
> > > +       for (i = 0; i < MAX_STEPS; i++) {
> > > +               struct regmap *map = NULL;
> > > +               int ret;
> > > +
> > > +               if (bp_table[i].type == INVALID_TYPE)
> > > +                       continue;
> >
> > break? (but yes the one below in mtk_scpsys_ext_clear_bus_protection
> > has to be continue).
> >
>
> Thanks. I'll fix in next version.
>
> > > +               else if (bp_table[i].type == IFR_TYPE)
> > > +                       map = infracfg;
> > > +               else if (bp_table[i].type == SMI_TYPE)
> > > +                       map = smi_common;
> > > +
> > > +               ret = set_bus_protection(map,
> > > +                               bp_table[i].mask, bp_table[i].mask,
> > > +                               bp_table[i].set_ofs, bp_table[i].sta_ofs,
> > > +                               bp_table[i].en_ofs);
> > > +
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +int mtk_scpsys_ext_clear_bus_protection(const struct bus_prot *bp_table,
> > > +       struct regmap *infracfg, struct regmap *smi_common)
> > > +{
> > > +       int i;
> > > +
> > > +       for (i = MAX_STEPS - 1; i >= 0; i--) {
> > > +               struct regmap *map = NULL;
> > > +               int ret;
> > > +
> > > +               if (bp_table[i].type == INVALID_TYPE)
> > > +                       continue;
> > > +               else if (bp_table[i].type == IFR_TYPE)
> > > +                       map = infracfg;
> > > +               else if (bp_table[i].type == SMI_TYPE)
> > > +                       map = smi_common;
> > > +
> > > +               ret = clear_bus_protection(map,
> > > +                               bp_table[i].mask, bp_table[i].clr_ack_mask,
> > > +                               bp_table[i].clr_ofs, bp_table[i].sta_ofs,
> > > +                               bp_table[i].en_ofs);
> > > +
> > > +               if (ret)
> > > +                       return ret;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> > > index 915d635..466bb749 100644
> > > --- a/drivers/soc/mediatek/mtk-scpsys.c
> > > +++ b/drivers/soc/mediatek/mtk-scpsys.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/pm_domain.h>
> > >  #include <linux/regulator/consumer.h>
> > >  #include <linux/soc/mediatek/infracfg.h>
> > > +#include <linux/soc/mediatek/scpsys-ext.h>
> > >
> > >  #include <dt-bindings/power/mt2701-power.h>
> > >  #include <dt-bindings/power/mt2712-power.h>
> > > @@ -120,6 +121,7 @@ enum clk_id {
> > >   * @basic_clk_id: provide the same purpose with field "clk_id"
> > >   *                by declaring basic clock prefix name rather than clk_id.
> > >   * @caps: The flag for active wake-up action.
> > > + * @bp_table: The mask table for multiple step bus protection.
> > >   */
> > >  struct scp_domain_data {
> > >         const char *name;
> > > @@ -131,6 +133,7 @@ struct scp_domain_data {
> > >         enum clk_id clk_id[MAX_CLKS];
> > >         const char *basic_clk_id[MAX_CLKS];
> > >         u8 caps;
> > > +       struct bus_prot bp_table[MAX_STEPS];
> >
> > As with the previous patch, I'm not a big fan of having 2 approaches
> > for something similar (bus_prot_mask vs bp_table), can we define a
> > simple macro for this?
> > e.g.:
> > .bp_table = BUS_PROT_SINGLE(mask)
>
> Agree! I'll fix it.
>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
