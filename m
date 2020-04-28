Return-Path: <SRS0=8Gmr=6M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A5BEC83006
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 12:14:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5DE206A1
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2020 12:14:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fd/pDE7v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A5Sijg+k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5DE206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hD3C7w5/QD7I0jbxBLixIXh+cz/Bi5UPqw/LZGyipU=; b=fd/pDE7vulB9OZ
	+GKBxuZyRCO8UCQ1Q5Ib0StoGZfqAskVnOOPFjdNXqKwPK39Nrz9O8olluA/+y6pc7djswofE06yB
	fLx/GiomMcocxzf6yvkoZcWrP70Rinh9awxWdzUqwo6pEY3lXRYT7QBZOepj/FCZRuqDb0kHP/EgK
	yk5Ler9tDlPcT75bU7mFjJPR0Bcg4RXd4qZbdRrXCPWpFMSRuKXhDS3jiRcosn0DnQOcm0F37iQUb
	VuRgaCbTclqOz4tnpppPOL6ORz5qvmqMNRi+A6ddM4hdfU0NdjCzYi5PWLbBC0QGf1fkox20WfEi1
	hZwqjfUw42XvzRLqZSiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTP7x-0001m2-Vk; Tue, 28 Apr 2020 12:14:17 +0000
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTP7m-0001ba-JK
 for linux-mediatek@lists.infradead.org; Tue, 28 Apr 2020 12:14:08 +0000
Received: by mail-ua1-x944.google.com with SMTP id i5so21074127uaq.1
 for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2020 05:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Si7QUx2lJaDXoOqwKRzvd/FqwJiW8O4bymVE3/8B3ns=;
 b=A5Sijg+k44OBG56boCW5SC8UnJ7ex3iO/soWNrUQ5voF2m/ptYSQIKN71PHSiPPkoO
 eigYpYxmn6IxQ9IL7wRTmGeXrXf71r2La7KtTzOtGIfY1YtExiSFtYxvPIXBiJfIovsD
 VOcBL9NUzfeaw+ldYSjxbBxWl8FO3zJGE8Tt/4pjWZqRZFxEhgYYLmK1ornUQMBAqnm0
 WTv3YzAb4txKP30dESYuDYf7O+vmvPoky1fidkQ52iKdlVE49UK6+Y9UvKgxjx7/kA8N
 EbUWenpXx5R1hjPo4LxyJaRTmL4Hf2L1g/UGjW8rCflH6my2LPpxPAQpUjZoU2WNixyw
 39aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Si7QUx2lJaDXoOqwKRzvd/FqwJiW8O4bymVE3/8B3ns=;
 b=mcq3cJfSNqXDZSJarALCt6+U3kAOvdqaPGBVgUE7E3TBBlEVc7KqzR1UsvjSbRN+Ab
 n3Idbas4PoOuiBCl79T+WcxLgbC/k/Q9FPr9uXJeXYV+Cp1W3xv4Yo4k37SBURdnO248
 /6i5kB7KIc24gHj3kSphyrAVwu05HCHWVb3SztKZZNWBv91HERyecopbujcv3fj9GQ+r
 DG9f2KWM9qPkSmF074Ol8U7CG14OLQqHcD1QxMLwjjbjRZ43tkqG2732yiGxEy0EA8R4
 Ib8qnuiYVzxCb+VgVMt8UJdINLDfoPMEES7MwXvmKiOZPECyPrd24hIM/V+KGxteIpqa
 pNBA==
X-Gm-Message-State: AGi0PuaTxTzKKNDCjU8ZlheepBRMQlVuWaLHCAbN2p15arjfRAJSTDQc
 LtK/9xoMsk9qLJKzTRJt6gOs32u4mfgmW36Icc+VQQ==
X-Google-Smtp-Source: APiQypLbHUMx3UMDbWJ6CNDiWmz1dbLLDJ3jr2Zb9fx7iExKVYW+P1I0WNBMwukiq/PNOP+qA0Yx6/Ewnd9S2sheWhk=
X-Received: by 2002:a67:f24b:: with SMTP id y11mr20631794vsm.165.1588076045066; 
 Tue, 28 Apr 2020 05:14:05 -0700 (PDT)
MIME-Version: 1.0
References: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
 <1586835611-13857-2-git-send-email-yong.mao@mediatek.com>
 <CAPDyKFo40tBpowmWN3gxH8b=jMmCK8O5ALNQ7y6XZ5AosX=GUA@mail.gmail.com>
 <1588066038.30914.28.camel@mhfsdcap03>
In-Reply-To: <1588066038.30914.28.camel@mhfsdcap03>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 28 Apr 2020 14:13:28 +0200
Message-ID: <CAPDyKFrBd0E2Qy89JgTE3YH0iiXB7due0JmnSVAhYL5aubSczA@mail.gmail.com>
Subject: Re: [PATCH 1/3] mmc: core: need do mmc_power_cycle in
 mmc_sdio_resend_if_cond
To: "yong.mao@mediatek.com" <yong.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_051406_805064_93C4CA1F 
X-CRM114-Status: GOOD (  34.11  )
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
Cc: srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 28 Apr 2020 at 11:28, yong.mao@mediatek.com
<yong.mao@mediatek.com> wrote:
>
>
> On Fri, 2020-04-24 at 12:09 +0200, Ulf Hansson wrote:
> > On Tue, 14 Apr 2020 at 05:40, Yong Mao <yong.mao@mediatek.com> wrote:
> > >
> > > From: yong mao <yong.mao@mediatek.com>
> > >
> > > When mmc_sdio_resned_if_cond is invoked, it indicates the SDIO
> > > device is not in the right state. In this condition, the previous
> > > implementation of mmc_sdio_resend_if_cond can't make sure SDIO
> > > device be back to idle state. mmc_power_cycle can reset the SDIO
> > > device by HW and also make sure SDIO device enter to idle state
> > > correctly.
> > >
> > > Signed-off-by: Yong Mao <yong.mao@mediatek.com>
> > > ---
> > >  drivers/mmc/core/sdio.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> > > index ebb387a..ada0a80 100644
> > > --- a/drivers/mmc/core/sdio.c
> > > +++ b/drivers/mmc/core/sdio.c
> > > @@ -546,6 +546,7 @@ static int mmc_sdio_init_uhs_card(struct mmc_card *card)
> > >  static void mmc_sdio_resend_if_cond(struct mmc_host *host,
> > >                                     struct mmc_card *card)
> > >  {
> > > +       mmc_power_cycle(host, host->card->ocr);
> >
> > This looks wrong to me. mmc_sdio_resend_if_cond() is called from two places.
> >
> > 1. In the case when mmc_set_uhs_voltage() fails in
> > mmc_sdio_init_card(), which means a call to mmc_power_cycle() has
> > already been done.
> >
>   Thanks for your comment.
>   Yes. It is right that mmc_power_cycle() has already been done when
>   mmc_sdio_resend_if_cond() is called. In normal re-initialization case,
>   this mmc_power_cycle() (currently in 1.8v voltage and 208Mhz clock)
>   can make SDIO device really back to idle state. Unfortunately, in some
>   special SDIO device, it will enter to unstable state.
>
>   At this unstable state, device may keep data0 always low after receiving CMD11.
>   And then every other SDIO CMD can't be sent to device any more due to card
>   is busy(data0 is low). Therefore, previous implementation can't save the
>   device. At this time, mmc_power_cycle() may be the final solution to make
>   sure SDIO device can back to idle state correctly.

Well, this still sounds a bit vague to me. I need to understand more
exactly under what circumstances the problem occurs.

What platform are you testing with and what SDIO card is being used?

Is the problem happening during the system resume phase?

Are the SDIO func driver using runtime PM and then is the host capable
of MMC_CAP_POWER_OFF_CARD?

Is it easy to reproduce the problem for you?

>
> > 2. Wen sdio_read_cccr() fails and when we decide to retry the UHS-I
> > voltage switch. Then perhaps it could make sense to run a power cycle.
> > But if so, we better do it only for that path.
> >
> > I will continue to look a bit, as I think there are really more issues
> > that we may want to look into while looking at this piece of code.
> > However, allow me some more time before I can provide some more ideas
> > of how to move forward.
>   In the actual project, we do encounter many relative issues about re-initialized card.
>   The following two categories are the most common issue we met before.
>   A. the SDIO card is initialized by UHS-I mode at the first time, but will be
>      re-initialized by High Speed mode at the second time.
>      ==> All this type of issues is relative with S18A in response of CMD5.
>          And most of the issues are related to the interval between powering off and
>          powering on card.
>   B. If there is something wrong in the flow of voltage switch(after CMD11), card will
>      always keep all data pins to low. And then it hangs up because data0 is always low.
>   Hope this information will be helpful for you.

Thanks for sharing these details! I think we need to continue to debug
this issue, to fully understand.

In principle, it sounds to me that maybe mmc_power_cycle(), isn't
really successfully power-cycling the SDIO card. Perhaps insert a few
delays or so in that code to see how that would affect things?

Anyway, how is the power to the SDIO card controlled in this case? Are
you using a mmc-pwrseq?

>
>   Anyway, we will wait for your advises.
> >
> > >         sdio_reset(host);
> > >         mmc_go_idle(host);
> > >         mmc_send_if_cond(host, host->ocr_avail);
> > > --
> > > 1.9.1
> >
> > Kind regards
> > Uffe

I have a few patches in the pipe, which fixes some other problems in
mmc_sdio_init_card(). Possibly those can be related, but I need a day
or so to post them, let's see.

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
