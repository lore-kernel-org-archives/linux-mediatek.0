Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D815C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 09:28:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2993921D79
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 09:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2993921D79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LGAyGCgceDHcxeoMr9Swny1OHpxovWFdwYYBtWOBETg=; b=DzH2mVlj9mRvT6ONxJagI7hsv
	a4Iyi4voDbh2f8qtaGZ9m/i0LymooKMbFJkV/kX5F60lWwi6OVioPQzKC0oVDgaKIp8jG63ofrRQo
	qolRs+GfuO/MuKIpU+Rq88T4dqHH9S3/T/r4pHMGkmVx4KmxBgpsUGNMzCABGH605HiIgflSlfvoT
	zTHC7BFnF5WA3ZbR2e6nT6/BIo3dYOm/IEnqdctOzMDXmAi7CVvKNsxGML2ukbgUjf6d3L101i+JU
	WjdQY2nF8elSwEesm/gFrn0Bxe+wKrde9apNQmL1iwtmMGiKn3o+0pvATUBjhrSv7fESrfc8PJ7tw
	4gPIRjLCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwM9p-00062x-Pu; Mon, 04 Jan 2021 09:28:09 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwM9l-000602-HH
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 09:28:07 +0000
Received: by mail-vs1-xe35.google.com with SMTP id s2so14188114vsk.2
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 01:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExeHQWgqTKzH+DZSpsOqxVJU7/CNUO5Q/p82stk7PJg=;
 b=X/Gi1auS3Z+zUYZURdGr75NeBrHpMm88ga/jDKcAnCz36LUKhNeJ0M3y88x8ecm4aW
 jb4mF6EA6DYbILrCj8jk9pSE8WoyyMlSKbaZ7dPLlDioDHoVbnXORu5975RR0wGdbP/f
 UiRWu0Iw93RxoFRjm8IrYO2fT7jyTbN6hNPks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExeHQWgqTKzH+DZSpsOqxVJU7/CNUO5Q/p82stk7PJg=;
 b=KhrLDxfyJRwJ2UGNQgjQCPdY5hIr+jBx4SfmnuQauNHr44e5ZOHGk0Xgr25QH0SpyF
 bb/I7DAAtn2btFFqHeko2JW8F+7M7qbcg0DOCtRFnQxv3suEuIynY6c1/n7qNqDteJ9M
 JejpfoWFZ9waFRbtWi0iwxKu1dk8X5cLn3MJXE9MfHmJnawz4THLelgMB/W+DvR6DoHd
 NGoD2q+cd+WV9mNtnwHvofsDmPPofTYr0IV4bRnSkBqzYk+pov8ekyrGOTSivR3gZAFL
 DqJ8ANDd7z4WFT+yh/1EcERslCoOTmf2HtMYZYRcw5dUm4QBkE/kfUQgKHaFwxDr5Dqj
 qPog==
X-Gm-Message-State: AOAM531zxRi4fHk0bd/aVhlce1E6OBhpnpie0WGbl3XlavFwNWnJ3RO3
 sBSHLF3NjEHKg1kgBo+wScyLnIdBaDUFldhStus8Nw==
X-Google-Smtp-Source: ABdhPJyF2xBh5X4KryFT0WGdabrZwrmbRW9n5pz8Ld0ZfllL2ZL5QKd1r3/IEp7q8KkK01cJ6iv5O7LHMnae2yoQXKE=
X-Received: by 2002:a67:5c03:: with SMTP id q3mr43046284vsb.47.1609752480656; 
 Mon, 04 Jan 2021 01:28:00 -0800 (PST)
MIME-Version: 1.0
References: <20201227105449.11452-1-roger.lu@mediatek.com>
 <20201227105449.11452-4-roger.lu@mediatek.com>
 <CANMq1KBNKy708Vz67WOc+n7V7ne4L1EZVkUVGj6abd5voxKjxA@mail.gmail.com>
 <1609750266.20758.40.camel@mtksdaap41>
In-Reply-To: <1609750266.20758.40.camel@mtksdaap41>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 4 Jan 2021 17:27:49 +0800
Message-ID: <CANMq1KDxVLo=JAAq-gjybke1WiX03COwNX7sHsZDMF9USzSECw@mail.gmail.com>
Subject: Re: [PATCH v10 3/7] [v10,
 3/7]: soc: mediatek: SVS: introduce MTK SVS engine
To: Roger Lu <roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_042805_939245_417D0CBB 
X-CRM114-Status: GOOD (  30.36  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Angus Lin <Angus.Lin@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 lkml <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 HenryC Chen <HenryC.Chen@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, YT Lee <yt.lee@mediatek.com>,
 Fan Chen <fan.chen@mediatek.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 4, 2021 at 4:51 PM Roger Lu <roger.lu@mediatek.com> wrote:
>
>
> Hi Nicolas,
>
> Thanks for all the advices.
>
> On Thu, 2020-12-31 at 10:10 +0800, Nicolas Boichat wrote:
> > On Sun, Dec 27, 2020 at 6:55 PM Roger Lu <roger.lu@mediatek.com> wrote:
[snip]
> > > +static int svs_adjust_pm_opp_volts(struct svs_bank *svsb, bool force_update)
> > > +{
> > > +       int tzone_temp, ret = -EPERM;
> >
> > No need to initialize ret.
>
> Oh, excuse me, some coding check tool warn that this `ret` might return
> without being uninitialized. Therefore, I'll keep the initialization.

Oh, you're right, there is a possible path where ret is not set. sgtm then.

>
> >
> > > +       u32 i, svsb_volt, opp_volt, temp_offset = 0;
> > > +
> > > +       mutex_lock(&svsb->lock);
> > > +
> > > +       /*
> > > +        * If svs bank is suspended, it means signed-off voltages are applied.
> > > +        * Don't need to update opp voltage anymore.
> > > +        */
> > > +       if (svsb->suspended && !force_update) {
> > > +               dev_notice(svsb->dev, "bank is suspended\n");
> > > +               ret = -EPERM;
> > > +               goto unlock_mutex;
> > > +       }
> > > +
> > > +       /* Get thermal effect */
> > > +       if (svsb->phase == SVSB_PHASE_MON) {
> > > +               if (svsb->temp > svsb->temp_upper_bound &&
> > > +                   svsb->temp < svsb->temp_lower_bound) {
> > > +                       dev_warn(svsb->dev, "svsb temp = 0x%x?\n", svsb->temp);
> > > +                       ret = -EINVAL;
> > > +                       goto unlock_mutex;
> > > +               }
> > > +
> > > +               ret = svs_get_bank_zone_temperature(svsb->tzone_name,
> > > +                                                   &tzone_temp);
> > > +               if (ret) {
> > > +                       dev_err(svsb->dev, "no \"%s\"?(%d)?\n",
> > > +                               svsb->tzone_name, ret);
> > > +                       dev_err(svsb->dev, "set signed-off voltage\n");
> >
> > Please merge the error message in one line (I'm not sure what "set
> > signed-off voltage" means here).
>
> 1. Ok, I'll merge them. Thanks.
> 2. signed-off voltages means CPU DVFS default voltages

So just write "default voltages" then? ,-)

>
> >
[snip]
> > > +static irqreturn_t svs_isr(int irq, void *data)
> > > +{
> > > +       struct svs_platform *svsp = (struct svs_platform *)data;
> >
> > cast not needed.
>
> Ok, I'll remove it. Thanks.
>
> >
> > > +       struct svs_bank *svsb = NULL;
> > > +       unsigned long flags;
> > > +       u32 idx, int_sts, svs_en;
> > > +
> > > +       for (idx = 0; idx < svsp->bank_num; idx++) {
> > > +               svsb = &svsp->banks[idx];
> > > +
> > > +               spin_lock_irqsave(&mtk_svs_lock, flags);
> > > +               svsp->pbank = svsb;
> > > +
> > > +               /* Find out which svs bank fires interrupt */
> > > +               if (svsb->int_st & svs_readl(svsp, INTST)) {
> > > +                       spin_unlock_irqrestore(&mtk_svs_lock, flags);
> > > +                       continue;
> > > +               }
> > > +
> > > +               if (!svsb->suspended) {
> > > +                       svs_switch_bank(svsp);
> > > +                       int_sts = svs_readl(svsp, INTSTS);
> > > +                       svs_en = svs_readl(svsp, SVSEN);
> > > +
> > > +                       if (int_sts == SVSB_INTSTS_COMPLETE &&
> > > +                           ((svs_en & SVSB_EN_MASK) == SVSB_EN_INIT01))
> > > +                               svs_init01_isr_handler(svsp);
> > > +                       else if ((int_sts == SVSB_INTSTS_COMPLETE) &&
> > > +                                ((svs_en & SVSB_EN_MASK) == SVSB_EN_INIT02))
> > > +                               svs_init02_isr_handler(svsp);
> > > +                       else if (!!(int_sts & SVSB_INTSTS_MONVOP))
> >
> > !! is not required.
>
> Ok, I'll remove it. Thanks.
>
> >
> > > +                               svs_mon_mode_isr_handler(svsp);
> > > +                       else
> > > +                               svs_error_isr_handler(svsp);
> > > +               }
> > > +
> > > +               spin_unlock_irqrestore(&mtk_svs_lock, flags);
> > > +               break;
> > > +       }
> >
> > This will panic if svsb is NULL, is that ok or do you want to catch that?
>
> Oh, it is fine. Thanks for the heads-up.

I should have been stronger in my statement, I think you want to add a
BUG_ON(!svsb) to crash in a slightly more predictable manner.

[snip]
> > > +
> > > +       svsp->tefuse = (u32 *)nvmem_cell_read(cell, &svsp->tefuse_num);
> >
> > Cast not needed.
>
> Ok, I'll remove it if build/test ok. Because nvmem_cell_read returns
> (void *).
>
> >
> > Also, this need to be freed somewhere in remove code (kfree(svsp->tefuse)).
> >
> > And it seems like svsp->tefuse is only used in this function, can you
> > just allocate it here?
>
> Oh, svsp->tefuse will be used in SVS debug patch for debug purpose. So,
> I need to save it as struct member.

Oh I missed that, sgtm then. Thanks.

>
[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
