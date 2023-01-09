Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9431CC5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aj54tILATw6IjxGXVi89331IRiw4NYazC/2sU/ZkN+Y=; b=vIt94vKQ0MkpVQpttB1i4mvCaW
	iXNQbW2KFEHKpPigAQ4NUMSbJ40zlBc2K/0RAisUfPQmVW82IXXRf7I7ams45jkTGZg0noq59qpnW
	VybV+NrocitmjG1f9gXFK2Poz06s2T8pwuBr9XVrovtXlHi7pom5vY0lldXQcVAsfULXk8oM0TySI
	fmVk6ldnGhzvnHWV6ntHroOs3ZbU3wTtGxxtTczkSSGSDqPCW4l9fi0aKwh7HHEc/ik8vhp+/rRZk
	lsFSsmHwMq33zq7w8gxWySq81CaBKzyEsBzkxKwPAwHivHr6ENhH0c/fWMiiOR/QS60oUt7CB0E6t
	6k7sMxHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqhg-0016eE-PZ; Mon, 09 Jan 2023 11:52:36 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEqhT-0016Xh-2O
	for linux-mediatek@lists.infradead.org; Mon, 09 Jan 2023 11:52:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id v30so12102378edb.9
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Jan 2023 03:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aj54tILATw6IjxGXVi89331IRiw4NYazC/2sU/ZkN+Y=;
        b=BCCCQEKmZL84Juhc7zGZCXjtK4wyyaCN4hfIM+xbNBfxo2cKpGp5cR4DCifuTkUzdJ
         jhxXnBeM3XShSj/wMrYO9jfOrTHerhq4Vlf73TjgoH7s5JZVtNkCYE2WPHJrhaTcXe6z
         CG+cq6MEKS/MALB+m8YJxvYIHuuPd6kDIx5CA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aj54tILATw6IjxGXVi89331IRiw4NYazC/2sU/ZkN+Y=;
        b=8Q3tKchNA7pVCI18sMyZ9AkWCZOqR+/v+ULah38woo0iUxLmqrNdTNqqisAdXJRY0U
         64uYL6woQr6MU0MCOPiAPfThdS/tDBpExJ8316mjKUT7B9gE3eGO7wArOg9JiU2OMaYg
         B9yiPiuPQb/EdeYCFyqU9zXLxDmI8TjCaJ8Q6/tZNCQWO5QScp0VRpdloLouMjrGoRra
         O7t8VnsokF/KTExOIgTG86GNVk6W7uY/dDTWaxsG3X0OhmZBFPL1adcbjhbWFQukccil
         m/0m5LX/IlPtOA4iJn0yhhJR2QhGQUWVo8BKzM6EDu2CVp6ldTrzieylLadqMHVnHm9Y
         7gMA==
X-Gm-Message-State: AFqh2kqGsRwDrFzfQDfD6YPBMiCxLUgOmCSQ/0ci8Esssen3XRaawxHA
	xCvvMvT742eWX8qpi9tz00ArPzYgy+LSE3LZyukjsw==
X-Google-Smtp-Source: AMrXdXvN+Ats8ThNe0Wauwq+5AC+Xtplphn3hZTaZBEbiZru8LtYPLmG1d5frTknSfPmN1CM7v2/wz2UX19/OcnHhq4=
X-Received: by 2002:a05:6402:a49:b0:48c:974b:cffd with SMTP id
 bt9-20020a0564020a4900b0048c974bcffdmr2271764edb.83.1673265139305; Mon, 09
 Jan 2023 03:52:19 -0800 (PST)
MIME-Version: 1.0
References: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
 <20221214134620.3028726-1-peter.suti@streamunlimited.com> <c6863a3e-8855-50fe-25cb-0b38bc3a05e0@gmail.com>
In-Reply-To: <c6863a3e-8855-50fe-25cb-0b38bc3a05e0@gmail.com>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Mon, 9 Jan 2023 12:52:08 +0100
Message-ID: <CACMGZgZY4Zb+3vHUDAS0+3r55K4_J40dtbsTPTFZMd6duBikpQ@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: meson-gx: fix SDIO interrupt handling
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_035223_231760_FCF928DA 
X-CRM114-Status: GOOD (  39.97  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 14, 2022 at 10:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 14.12.2022 14:46, Peter Suti wrote:
> > With the interrupt support introduced in commit 066ecde sometimes the
> > Marvell-8987 wifi chip got stuck using the marvell-sd-uapsta-8987
> > vendor driver. The cause seems to be that after sending ack to all interrupts
> > the IRQ_SDIO still happens, but it is ignored.
> >
> > To work around this, recheck the IRQ_SDIO after meson_mmc_request_done().
> >
> > Inspired by 9e2582e ("mmc: mediatek: fix SDIO irq issue") which used a
> > similar fix to handle lost interrupts.
> >
> The commit description of the referenced fix isn't clear with regard to
> who's fault it is that an interrupt can be lost. I'd interpret it being
> a silicon bug rather than a kernel/driver bug.
Unfortunately I can't confirm that the referenced bug is in the
silicon for the original commit either.
However a similar workaround works in this case too which is why I
referenced that commit.

> Not sure whether it's the case, but it's possible that both vendors use
> at least parts of the same IP in the MMC block, and therefore the issue
> pops up here too.
>
> > Fixes: 066ecde ("mmc: meson-gx: add SDIO interrupt support")
> >
> > Signed-off-by: Peter Suti <peter.suti@streamunlimited.com>
> > ---
> > Changes in v2:
> >       - use spin_lock instead of spin_lock_irqsave
> >       - only reenable interrupts if they were enabled already
> >
> > Changes in v3:
> >       - Rework the patch based on feedback from Heiner Kallweit.
> >               The IRQ does not happen on 2 CPUs and the hard IRQ is not re-entrant.
> >               But still one SDIO IRQ is lost without this change.
> >               After the ack, reading the SD_EMMC_STATUS BIT(15) is set, but
> >               meson_mmc_irq() is never called again.
> >
> >               The fix is similar to Mediatek msdc_recheck_sdio_irq().
> >               That platform also loses an IRQ in some cases it seems.
> >
> >  drivers/mmc/host/meson-gx-mmc.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> > index 6e5ea0213b47..7d3ee2f9a7f6 100644
> > --- a/drivers/mmc/host/meson-gx-mmc.c
> > +++ b/drivers/mmc/host/meson-gx-mmc.c
> > @@ -1023,6 +1023,22 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
> >       if (ret == IRQ_HANDLED)
> >               meson_mmc_request_done(host->mmc, cmd->mrq);
> >
> > +     /*
> > +     * Sometimes after we ack all raised interrupts,
> > +     * an IRQ_SDIO can still be pending, which can get lost.
> > +     *
>
> A reader may scratch his head here and wonder how the interrupt can get lost,
> and why adding a workaround instead of eliminating the root cause for losing
> the interrupt. If you can't provide an explanation why the root cause for
> losing the interrupt can't be fixed, presumably you would have to say that
> you're adding a workaround for a suspected silicon bug.
After talking to the manufacturer, we got the following explanation
for this situation:
"wifi may have dat1 interrupt coming in, without this the dat1
interrupt would be missed"
Supposedly this is fixed in their codebase.
Unfortunately we were not able to find out more and can't prepare a
patch with a proper explanation.
Thank you for reviewing.
>
> > +     * To prevent this, recheck the IRQ_SDIO here and schedule
> > +     * it to be processed.
> > +     */
> > +     raw_status = readl(host->regs + SD_EMMC_STATUS);
> > +     status = raw_status & (IRQ_EN_MASK | IRQ_SDIO);
>
> This isn't needed here. Why not simply:
>
> status = readl(host->regs + SD_EMMC_STATUS);
> if (status & IRQ_SDIO)
>   ...
>
>
> > +     if (status & IRQ_SDIO) {
> > +             spin_lock(&host->lock);
> > +             __meson_mmc_enable_sdio_irq(host->mmc, 0);
> > +             sdio_signal_irq(host->mmc);
> > +             spin_unlock(&host->lock);
> > +     }
> > +
> >       return ret;
> >  }
> >
>

