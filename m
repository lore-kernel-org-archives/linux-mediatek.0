Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA2AC4363A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 09:41:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A71BD2469B
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 09:41:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tTFEoaDu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PvnCwIef"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A71BD2469B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GlUl9kzAgr1HrR6YuwKXYzl6S4z2KWn2oDFSyF4StRA=; b=tTFEoaDufatHnbphiTB5EoAhj
	IWWvZe6dGB9PwNNa10974GkBs48fnDTdbdPp8GKwMtfjtX5IJd9zi7O7m1jZyRyoMQtNtglLwYjs1
	sLsLi3lUnlA8mke0s6iRSTtg9c4SGcV/IkIsBb9oW2+xeOa5zGI2Hr2r9AuhsDD+DyWjGnvnXJtZp
	J6wSeXcwJIVemRHhOFwRau51KD62mp91G8OveX6MZoQFVidL0uVe0fOMntnwdeTdMBwP+9+OIgIk7
	JC2X0ayRe74KRJR1rYqCHufzM18uCd+TVsKoshsJB+MMsyFv4+PYkD6T/ZZGrBGsHZH821/ZlkjaL
	kTRpsxanw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXhxN-0004B0-Sa; Wed, 28 Oct 2020 09:41:25 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXhxJ-000498-3L
 for linux-mediatek@lists.infradead.org; Wed, 28 Oct 2020 09:41:23 +0000
Received: by mail-vk1-xa43.google.com with SMTP id n141so1028176vke.9
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2020 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmTfdAqJelGk4mThvToPB+vvFy/o2Riv909vC5Pwsvc=;
 b=PvnCwIef6PZCTFzgkQOE6JXpb70433VKOlFqHWLlBDtiPS9mCm8oVghA+eXAC6KxjB
 j5R3n3VjyjW4vD3eVLDjTBVf1/lCrGPrAwyAGG8NFmzunydB3WwepFlnjhYNpJc4cvdl
 WK6xIrldFzHeKcCCMKPLPErRCYpr4qMwZmjQVpYAlw/P2+XKWk4oM88xJLIx07qmVhlG
 vVP4MBcP9wvJpKuwvN31PU+45Fh8W0+q9tF9hEWpvDZfxjq57UcwOkRZru/5mR7uwm8B
 UGpPz2KxfASR16wNtW1LoSLgnwJiuykxEaWXRcZeji/OlQGhQMqWXSK5n5+ayycZGeN8
 EX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmTfdAqJelGk4mThvToPB+vvFy/o2Riv909vC5Pwsvc=;
 b=FKugTUrp1+Tjx7FrPLiQzvAzwqMVpAISWBZAP4AZLf5aiiJHkjNHK+YcnOfR/w754R
 0nzupYNBDGa0L36TodXV2ImzbrdxSGLqPKXlf1kAqnr9gcqbo9CzRroatgy9LOqrlzTo
 AkHvoVHlBa649M2cLI3ebothE7gRuG8u+rK2ODwdFycjLCG6Qwh2o8PnVNQgJXBw7QFL
 uxt7jGY9+wnwOphD6UbmcYUDxHfZ9fytLjrURrc4wfuE7YLGgNsUQ19iFGe50YWt/M0F
 KNpmDlZc9qPUvspb13S4nk/tufvt4AaRAJ2svdaOSLSY2HspR38XLjhQfpB9AHYRbRnJ
 yLww==
X-Gm-Message-State: AOAM5313Q05Hr3d/86hhiakxB60o208L2dqzAuHhaOUPdbEQUvmOf3Na
 cGXCyKIqigAWiw/lKjtP/PmPIpz7/XmAcPozA+/2JA==
X-Google-Smtp-Source: ABdhPJxA6mva6c9AuQcMDkfN09APtSH2RneKpFr1NrXpPaeWepLTqSsiRntY8LrK5rP3qon0g31a7FFbXKcv2+GSxOA=
X-Received: by 2002:a05:6122:10eb:: with SMTP id
 m11mr4439593vko.8.1603878079032; 
 Wed, 28 Oct 2020 02:41:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201023122950.60903-1-fparent@baylibre.com>
 <CAPDyKFrMwLeuQoFDgXYo_-T_e2AzfqM-rgp3-SgeuC6Qn6rxMA@mail.gmail.com>
 <87wnzbg7on.fsf@baylibre.com> <1603869682.6198.23.camel@mhfsdcap03>
In-Reply-To: <1603869682.6198.23.camel@mhfsdcap03>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Oct 2020 10:40:42 +0100
Message-ID: <CAPDyKFrjov40BxHRrG6WoUVLaVbPbvPPf_ot2xybVEfGerST9g@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: mtk-sd: enable recheck_sdio_irq for MT8516 SoC
To: "yong.mao@mediatek.com" <yong.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_054121_466834_A3AAC3A4 
X-CRM114-Status: GOOD (  34.85  )
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
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 28 Oct 2020 at 08:22, yong.mao@mediatek.com
<yong.mao@mediatek.com> wrote:
>
> On Tue, 2020-10-27 at 13:44 +0100, Mattijs Korpershoek wrote:
> > Hi Ulf,
> >
> > Ulf Hansson <ulf.hansson@linaro.org> writes:
> >
> > > + Yong Mao, Chaotian Jing
> > >
> > > On Fri, 23 Oct 2020 at 14:29, Fabien Parent <fparent@baylibre.com> wrote:
> > >>
> > >> MT8516 SoC suffers from sometimes losing SDIO IRQs, this makes SDIO
> > >> devices sometimes unstable. Make use of the new property
> > >> recheck_sdio_irq to fix the SDIO stability issues on MT8516.
> > >>
> > >> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > >
> > > Maybe this is a common problem, thus I am thinking that potentially we
> > > should enable the workaround for all variants?
> > Not sure if this is of any help, but: we use the btmtksdio driver on a
> > MT8183 soc with an Android kernel based on upstream.
> >
> > With that kernel, we did not to apply this work-around in order to
> > have a stable bluetooth experience (pairing with a remote controller)
> >
> > However, on the MT8516 SoC, it's impossible for us to use btmtksdio
> > without Fabien's fix.
> >
> Yes. For mt8516 SoC,recheck_sdio_irq should be set to true for avoiding
> SDIO dat1 irq lost issue. But for mt8183 SoC, it does not need recheck
> sdio irq mechanism.

Okay, thanks for confirming.

>
> > >
> > > I have looped in Yong Mao (who invented the workaround) and Chaotian
> > > Jing, to see if they can advise us how to proceed.
> > >
> > > In any case, I think we should add a stable tag and a fixes tag.
> > >
> > > Kind regards
> > > Uffe
>
> Hi Ulf,
> Sorry. On the patch "mmc:mediatek:fix SDIO irq issue", I only consider
> fixing the issue on mt8173 SoC.But for the whole MTK upstream SoC,
> mt8183, mt2712, mt6779 and mt8192 does not need this mechanism,
> but the other upstream Soc such as mt8135, mt8173, mt2701, mt7622,
> mt8516 and mt7620 need this recheck mechanism. And all future SoC of our
> company does not need this mechanism.
> If it's convenient for you, please help me to revise it.
> Or I will submit a new patch to correct the value of setting.
> Thanks.

Please submit a new patch to enable the "recheck_sdio_irq" flag for
those variants that need it.

I would also add a fixes+stable tag and add reported-by tags from
Fabien and Mattijs.

Kind regards
Uffe

> > >
> > >> ---
> > >>  drivers/mmc/host/mtk-sd.c | 2 +-
> > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> > >> index a704745e5882..3dc102eefe49 100644
> > >> --- a/drivers/mmc/host/mtk-sd.c
> > >> +++ b/drivers/mmc/host/mtk-sd.c
> > >> @@ -524,7 +524,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
> > >>
> > >>  static const struct mtk_mmc_compatible mt8516_compat = {
> > >>         .clk_div_bits = 12,
> > >> -       .recheck_sdio_irq = false,
> > >> +       .recheck_sdio_irq = true,
> > >>         .hs400_tune = false,
> > >>         .pad_tune_reg = MSDC_PAD_TUNE0,
> > >>         .async_fifo = true,
> > >> --
> > >> 2.28.0
> > >>
> > >
> > > _______________________________________________
> > > Linux-mediatek mailing list
> > > Linux-mediatek@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-mediatek
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
