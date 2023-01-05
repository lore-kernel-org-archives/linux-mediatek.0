Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E06C3DA7D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 21:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBneq5lt5MOzMjewVE4OSFgwS9aqC54CXzL7Ey/uWbo=; b=M6rRpHY52zsaKgmxumwFRsyRpL
	VwcgSPw6PBMLjHjZWW5U9v7nizb7BLhTWNMVCRTfCzCXBWt1NGjV6UDbHAMIs3cNJ+SmwA49b3g6p
	GazO1rci1ATC46HyDZOSaHCOB+y7IBn8xVh2/Qt6A3kVoTPuU6Fyrpgs2fSbYkY6lJHMHg2B4oxnG
	DpayvMgPmC2Lpi4peRkhWHx3nulxEnA8MBBKsLOYeoZwEcKw+xhNU4iR5Vi2leukeMg5DaqfBB8Gj
	NUHXdoI9HO5Vh/6UtS56PyuKyrhpQzFh8WCxMAw6pHi/eRFSQcWqv6AdiOv0T9KZxMDfGHm9ljo3N
	RdZhAnOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXgf-00F2wA-BD; Thu, 05 Jan 2023 21:22:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUtB-00DWd3-Ir
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 18:22:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FBneq5lt5MOzMjewVE4OSFgwS9aqC54CXzL7Ey/uWbo=; b=PJ76hNGqiLar7xnWMulmZoSShC
	480bK32ps/vFIoKUgcPGtX5uJc3sWFpFsh6qQRyTcoQfvqXQNWILeZy6p4ypVuIbgNgxRg4xEZhDO
	87oNIAmXXo7XVqqMe0E3n7LG5sNTsh/xcFELQRXlrjB/LFYmfgQuCf64kQhDdGaF9umji4O7KFSl1
	UuNaDPPHFREAwbcNOGMgzI4tS2U3+24qzLAGJ2Ai/T/s5pzQqH2Tk7U0FVV08YPQ+byWId3wYvajn
	ZOslKUtvNEjVhjrt2IDPtLG2DYRNHpK92j3jkjwFM5UiFrIy8+PRB63M0WaAjIt2V1Axb+wcEOoit
	jW5h+mHg==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDRMB-001OBM-1y
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 14:36:38 +0000
Received: by mail-pf1-x436.google.com with SMTP id x26so19210257pfq.10
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 06:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FBneq5lt5MOzMjewVE4OSFgwS9aqC54CXzL7Ey/uWbo=;
        b=D0J+pYxxg/nL6w72HzCmO9Ju7tFJr4HZGEtqpo9TfMRjcP1AmxD4BLEjDniCvxM3h6
         gTn90rVDA3LHWD+a30UHcObPY+SaSgjvTrTAABZ2VI3Bz0dnaOeLF0J2GHQpl5/4Nrzh
         +81yW445LEssZAeIdPgqdLgB50qWVNDkiGB8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBneq5lt5MOzMjewVE4OSFgwS9aqC54CXzL7Ey/uWbo=;
        b=faBlHz6FlrjrHtXR1/IW1QzXInQBSFOkpuOyr2McAou13Jd51806cKlsBJoKqsviLg
         r3LxZZB+tz2TllFBrHpDChwN4AaOz1yW03mjYNcWXtaUndiikTqhyEvSamDnGFS7rbTh
         KkajLwHyTFfZWglWAFKpaaHfY/RpAlg2EMDcoT6QD1n5X9VBibqJRpAf0Dz8quC7PI7g
         N9yKIqQOE3gsch9dsW/uIXF6pVJEu3u3+qPFXpyYm7yA3mFnSGugm+RWCkzFDaLqu1fG
         Si8VNm1MrEWde3Ewcz5ifuI8IWWKfagQ82c9HVZly8IFhN/NjJSJu44N0IFKz34OjtYk
         d3CA==
X-Gm-Message-State: AFqh2kqWrS25iK3dS9nZ5QO6ox8QvMGOLUkm3Gcf4mTWTHzIqcIZHz1g
	GYQikli/uTIWzj5bb8QH8bybfFklXrU6KrGrZ9s=
X-Google-Smtp-Source: AMrXdXuxoD6a5eQSMPYxTzqgJqY32bOEkTxCFVOr/cIulsyyUjcs9sG+VG3yL3BtMddXHMB1leJe4g==
X-Received: by 2002:a05:6a00:1d97:b0:576:9eed:61de with SMTP id z23-20020a056a001d9700b005769eed61demr60183225pfw.4.1672929398660;
        Thu, 05 Jan 2023 06:36:38 -0800 (PST)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com. [209.85.216.51])
        by smtp.gmail.com with ESMTPSA id d188-20020a6236c5000000b0057a9b146592sm24594930pfa.186.2023.01.05.06.36.37
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 06:36:37 -0800 (PST)
Received: by mail-pj1-f51.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so2221278pjq.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 06:36:37 -0800 (PST)
X-Received: by 2002:a17:902:f682:b0:186:9cf4:e53b with SMTP id
 l2-20020a170902f68200b001869cf4e53bmr2678978plg.50.1672929396954; Thu, 05 Jan
 2023 06:36:36 -0800 (PST)
MIME-Version: 1.0
References: <trinity-bd6bf7f8-5dbc-42fc-891b-8bfc802a1a2c-1672136902605@3c-app-gmx-bap27>
 <24ef21b2-d1db-1525-7d3f-2c978e73c25b@leemhuis.info> <CANiDSCunU4dqiDgNr2mz=MxD+wzTu6V2vZWqY+AC4DqQvwVh4w@mail.gmail.com>
 <752823ee-1aec-7536-095d-6a018e1dd909@leemhuis.info> <1cbfec6f-1f93-379e-608e-17a0d904834d@leemhuis.info>
In-Reply-To: <1cbfec6f-1f93-379e-608e-17a0d904834d@leemhuis.info>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jan 2023 15:36:25 +0100
X-Gmail-Original-Message-ID: <CANiDSCs4HQwX6PG-62yonO8Pfo+N5XZN2zv-bA7=zqMDG0Arwg@mail.gmail.com>
Message-ID: <CANiDSCs4HQwX6PG-62yonO8Pfo+N5XZN2zv-bA7=zqMDG0Arwg@mail.gmail.com>
Subject: Re: [BUG] 6.2-rc1 spi-mt65xx broken on mt7986
To: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_143635_951600_69F85FB0 
X-CRM114-Status: GOOD (  24.90  )
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
Cc: Mark Brown <broonie@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Thorsten

On Thu, 5 Jan 2023 at 14:34, Linux kernel regression tracking
(#update) <regressions@leemhuis.info> wrote:
>
> On 05.01.23 13:59, Thorsten Leemhuis wrote:
> > On 05.01.23 13:40, Ricardo Ribalda wrote:
> >>
> >> I replied on my phone, so the mail came out in html and the list did
> >> not pick it up, then Frank also answered in html.
> >>
> >> I believe we are good with this:
> >> https://lore.kernel.org/all/Y7WOlkuLaLt1DdY+@sirena.org.uk/
> >
> > Ohh, that was the same issue? I had missed that (and it's pretty obvious
> > when I look at it now :-/ ). Sorry for the noise then, but these things
> > happen when dealing with so many different regressions.
> >

Absolutely no worries. Thanks again!

> >> Thanks for headsup anyway
> >
> > Many thx for clarifying!
> >
> > #regzbot fix: spi: mediatek: Enable irq when pdata is ready
>
> Sigh, seem I'm too stupid for proper copy'n'paste today and want to fix
> it up now; sorry for the noise:
>
> #regzbot fix: spi: mediatek: Enable irq before the spi registration
>
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> That page also explains what to do if mails like this annoy you.
>
> >> On Thu, 5 Jan 2023 at 13:21, Thorsten Leemhuis
> >> <regressions@leemhuis.info> wrote:
> >>>
> >>> [CCing the regression mailing list, as it should be in the loop:
> >>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >>>
> >>> On 27.12.22 11:28, Frank Wunderlich wrote:
> >>>> Hi,
> >>>>
> >>>> the following commit breaks SPIM-NOR on mt7986:
> >>>>
> >>>> c6f7874687f7 2022-11-28 spi: mediatek: Enable irq when pdata is ready
> >>>
> >>> Ricardo, do you have this report on your radar? Just wondering, as it
> >>> was posted a week ago and didn't even get a single reply afaics. This of
> >>> course can happen at this time of the year, but I thought a quick status
> >>> inquiry wouldn't hurt.
> >>>
> >>>>> [    2.145931] pc : mtk_spi_can_dma+0x0/0x34
> >>>>> [    2.155212] lr : mtk_spi_interrupt+0x74/0x360
> >>>>>
> >>>>> [    2.091801] mtk-spi 1100a000.spi: spi-mem transfer timeout
> >>>>> [    2.097310] spi-nor: probe of spi0.0 failed with error -110
> >>>>> [    2.102930] Unable to handle kernel read from unreadable memory at virtual address 0000000000000010
> >>>>
> >>>> after reverting the commit, no trace happens and nor is recognized on my board
> >>>
> >>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> >>> --
> >>> Everything you wanna know about Linux kernel regression tracking:
> >>> https://linux-regtracking.leemhuis.info/about/#tldr
> >>> If I did something stupid, please tell me, as explained on that page.
> >>>
> >>> #regzbot poke
> >>
> >>
> >>



-- 
Ricardo Ribalda

