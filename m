Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A688C32793
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Jan 2023 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r/MdaMfGpngTvDj1TEFnHjyrcQTvG4jCt3QryBUQJFc=; b=MQ8jqx5xamvqcxcfOYwFXHw4OZ
	MvZTEV0ZKzDXYCd7AyxqAOnNfgUKu9kCYvyCFGB1CKl/GvQjBpjvaP5CHugWS7KpAGy+ASv/5i1gq
	TRvLVQ511eunvqS+LeoUdertcal2BQvgp8Du8o/4Y5s8DDJejpwJQxOqBfTglowxiFmI4TijyDBCl
	wU23C79gBoPkqnH7mPSBshu0RqJyLGGtA/1mTHKvPibY+rJGzMPZLtqlof+QONjEyHD0jyk/1lGDo
	d9dN6KwfedJJMt+9IqcQmRBhPOSQP0OG52w40x5+aZXQ4zwLa6OZZM+Z/XiJC7+/vXGa5WRdEEq2R
	ZhcPo/fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI8ZS-001AoW-9I; Wed, 18 Jan 2023 13:33:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI8Yv-001ARg-6Z
	for linux-mediatek@lists.infradead.org; Wed, 18 Jan 2023 13:33:11 +0000
Received: by mail-ej1-x62d.google.com with SMTP id mp20so36664318ejc.7
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Jan 2023 05:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=streamunlimited.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r/MdaMfGpngTvDj1TEFnHjyrcQTvG4jCt3QryBUQJFc=;
        b=ZZupgezhFoK3Ma5R4scdDL1xnc4rtd41/9W6aJRWZax9QBq3W0G3zCGVJW0U42iCYd
         4KvJbYbw4CQi67BClvaNwX37mzcqLlr0nmJnmb8jvbyaQXvQkAtNOap+C+bD8nXs+OR8
         3toqCE8yeR4NEL9Ne0r+XcH19jWXeAMlNKwv0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/MdaMfGpngTvDj1TEFnHjyrcQTvG4jCt3QryBUQJFc=;
        b=0sMN7hOHyGsm2F9JC465hHwdB//dD0RstpGGfpG4vrtlwVMaJH3biWEmnQQWHpau3A
         surX2tlNoNvosLLgG7/KN/yg74fxvX0Rj1wfLX5AJBgdvRMtPzQzXYqvS4xavkwtrrHl
         DsHBgfopVvKCGGwyYQqH8IOFf9Tp5YkgeXo2pLvMlQtFUsPFjxL0xjORFgfHWk15o+8x
         t6OGBzDWMANdP8oSfFqYecToxHxk6Mav2+nLuESGOiIb6/9PPcUP49yjr63Od6Sn9HuQ
         /WkyyT/BbZv0ZtrGXpLS8Nqefkhc/UU+zkN/Vpf1tB6RIeQ6dZl4Gzb6AmxctiIg7IH1
         18Rw==
X-Gm-Message-State: AFqh2krEGHKFtaTX5CNndEct0APYPK2MtUw/I6EqIp86+WNpbGuCg4a2
	xASveM5HTIPzIoOyjtYk64W+Lm8lRLe8P0QgUPH9Gw==
X-Google-Smtp-Source: AMrXdXty6aY2Hc4VxG7Ode8zCbjODFHEqzOLgr86xygYZq3+W86ERvY0w5qF42m7zwo4OhQfVchNKrC1JPZn0ehrxtI=
X-Received: by 2002:a17:906:7109:b0:84d:1502:a8b4 with SMTP id
 x9-20020a170906710900b0084d1502a8b4mr553373ejj.295.1674048784788; Wed, 18 Jan
 2023 05:33:04 -0800 (PST)
MIME-Version: 1.0
References: <52861a84-0fe2-37f0-d66a-145f2ebe1d79@gmail.com>
 <20221214134620.3028726-1-peter.suti@streamunlimited.com> <c6863a3e-8855-50fe-25cb-0b38bc3a05e0@gmail.com>
 <CACMGZgZY4Zb+3vHUDAS0+3r55K4_J40dtbsTPTFZMd6duBikpQ@mail.gmail.com> <7c4aa0d2-d8e9-416b-b2ad-f5c3c8ea33de@gmail.com>
In-Reply-To: <7c4aa0d2-d8e9-416b-b2ad-f5c3c8ea33de@gmail.com>
From: Peter Suti <peter.suti@streamunlimited.com>
Date: Wed, 18 Jan 2023 14:32:53 +0100
Message-ID: <CACMGZgaS7z2YoViA3jV-gVBvASSq1maiGj_6hfrJQ3zr69esgQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230118_053309_268435_767524CF 
X-CRM114-Status: GOOD (  29.93  )
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

On Thu, Jan 12, 2023 at 10:27 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>
> On 09.01.2023 12:52, Peter Suti wrote:
> > On Wed, Dec 14, 2022 at 10:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> >>
> >> On 14.12.2022 14:46, Peter Suti wrote:
> >>>
> >>> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> >>> index 6e5ea0213b47..7d3ee2f9a7f6 100644
> >>> --- a/drivers/mmc/host/meson-gx-mmc.c
> >>> +++ b/drivers/mmc/host/meson-gx-mmc.c
> >>> @@ -1023,6 +1023,22 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
> >>>       if (ret == IRQ_HANDLED)
> >>>               meson_mmc_request_done(host->mmc, cmd->mrq);
> >>>
> >>> +     /*
> >>> +     * Sometimes after we ack all raised interrupts,
> >>> +     * an IRQ_SDIO can still be pending, which can get lost.
> >>> +     *
> >>
> >> A reader may scratch his head here and wonder how the interrupt can get lost,
> >> and why adding a workaround instead of eliminating the root cause for losing
> >> the interrupt. If you can't provide an explanation why the root cause for
> >> losing the interrupt can't be fixed, presumably you would have to say that
> >> you're adding a workaround for a suspected silicon bug.
> > After talking to the manufacturer, we got the following explanation
> > for this situation:
>
> To which manufacturer did you talk, Marvell or Amlogic?

Amlogic

>
> > "wifi may have dat1 interrupt coming in, without this the dat1
> > interrupt would be missed"
>
> I don't understand this sentence. W/o the interrupt coming in
> the interrupt would be missed? Can you explain it?

So the "without this" part of that sentence referred to the patch.
Which means that without the patch, the interrupt can be missed.

>
> > Supposedly this is fixed in their codebase.
>
> Which codebase do you mean? A specific vendor driver? Or firmware?

The vendor driver from openlinux2.amlogic.com handles SDIO interrupts
a bit differently. It uses mmc_signal_sdio_irq()

>
> > Unfortunately we were not able to find out more and can't prepare a
> > patch with a proper explanation.
>
> The workaround is rather simple, so we should add it.
> It's just unfortunate that we have no idea about the root cause of the issue.

After doing a more long term stress test, it was revealed that this
patch is still not sufficient, but only masks the underlying problem
better. Reverting 066ecde fixes the issue fully for us (verified
overnight with iperf).
v1 and v2 also fix the issue, but v3 does not correct the bug when
WiFi is stressed for a longer time. And therefore it should not be
used.
Could you please give us some advice on how to investigate this further?

