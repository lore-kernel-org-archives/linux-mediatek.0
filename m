Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C23C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 07:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEqTvNM+jsZjZI+7JGQt1mFWY94TcOH6GPmA2DQxr8s=; b=mZQ7k0W6DGqo12ey6OhDM0sPuO
	Sy7SU6BwLr8DNEQIK+ozmBsjuOsNVH0W4JnURSbLepEio2wqyDHcHytTvVSJjxEbNz92YXWPHe9Eb
	sOoiRDK7AX1ExirrgS5vqppJ06HqUtM9f2xPJKZAxA3qj1L2HzTSGaf7Cpw7EHN9tSu5OW1qtQESb
	LB3LnMuFpR/VAkuCS3UE8Wv4MhJ37kZnUn40PYcbfftkqLLK5NErpSDhmd/Zb8PaOWs77J68Pyo+U
	YctuUa6KQp/ZIfxloITd36oenL5QQBWQfhdPoiLmTuQP6nsVGu4ZHQdoSRSPV4sqUuS9COZIPYd3P
	RR/7MeGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prwLP-005iUb-2T;
	Thu, 27 Apr 2023 07:47:11 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prwLE-005iPR-33;
	Thu, 27 Apr 2023 07:47:02 +0000
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-54fb89e1666so63621177b3.3;
        Thu, 27 Apr 2023 00:46:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682581618; x=1685173618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEqTvNM+jsZjZI+7JGQt1mFWY94TcOH6GPmA2DQxr8s=;
        b=IiumWP0e9gZnZsaXALjuaxM2Xs+oiS+qdFLBSI4e/ilIW8tlhSNlmETYMwIgtrqQ/b
         4mYsLuV8JOa6F2xYx/qQBk/hPq/4h7HgGRLHJMNKoP/R8qXlcU/1XF7ZIZw+kxjlW4Tr
         L8aqncInpg457yKgu9q3CHlAlDnKuBHIz4Or0vjpaX3byET9GTEJ5tmWC6dgaMNBMoDt
         XWo4ZPVno7p7voVhPYMN2kjgCmzShuIHDAeQfL+tR1WVR431OxtQ4zkMleTrV0X8q9kZ
         BQHJSdu9h8w0j75Cv705YFyFPUxgGJlfS2JDR7rHtoh6vaqMwcljRtwMAlcEtTMLfQoA
         vHVg==
X-Gm-Message-State: AC+VfDwuymkcpEqdPAyM3kuC+ZJGfHaH/tOtXfQC5wQ5rCuGOjqg++C9
	Grw2wbYl0kc48LPC5/JkpmwQJ7TwbeM21w==
X-Google-Smtp-Source: ACHHUZ6F5KAsp/g5rnkVccRSZ8t06ir3Lk6ES+kOo3utTAcqLuluiFvN7F/MYHx8MAfC8RUDbl9vbg==
X-Received: by 2002:a0d:d6c3:0:b0:54e:ddbb:64df with SMTP id y186-20020a0dd6c3000000b0054eddbb64dfmr544680ywd.30.1682581618030;
        Thu, 27 Apr 2023 00:46:58 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id y73-20020a81a14c000000b0054f52b73ea8sm4631403ywg.26.2023.04.27.00.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5529f3b8623so63581017b3.2;
        Thu, 27 Apr 2023 00:46:56 -0700 (PDT)
X-Received: by 2002:a0d:d712:0:b0:54e:ed46:6b39 with SMTP id
 z18-20020a0dd712000000b0054eed466b39mr582224ywd.31.1682581616022; Thu, 27 Apr
 2023 00:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com> <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain> <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com> <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
In-Reply-To: <1cfc224b-f8b0-3143-42d2-188b56368c61@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Apr 2023 09:46:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Message-ID: <CAMuHMdU91NtZeFKe6mB3B48TNb64wfPu77xRbOEVX4tV65e38w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Ansuel Smith <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-oxnas@groups.io, 
	linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_004700_984800_DAA4E7F3 
X-CRM114-Status: GOOD (  25.81  )
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

On Thu, Apr 27, 2023 at 9:37=E2=80=AFAM Matthias Brugger <matthias.bgg@gmai=
l.com> wrote:
> On 25/04/2023 17:57, Rob Herring wrote:
> > On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> >> On Tue, Apr 25, 2023 at 12:16=E2=80=AFAM Rob Herring <robh+dt@kernel.o=
rg> wrote:
> >>> I have a script[1] that does the conversion written the last time thi=
s
> >>> came up. Just have to agree on directory names. I think the easiest
> >>> would be for Arnd/Olof to run it at the end of a merge window before
> >>> rc1.
> >>
> >> "emev2" and "sh7" are missing for renesas.
> >
> > No doubt it's been bitrotting (or I may have missed some).
> >
> >> Does your script also cater for .dts files not matching any pattern,
> >> but including a .dtsi file that does match a pattern?
> >
> > I assume I built everything after moving, but maybe not...
> >
> > That's all just "details". First, we need agreement on a) moving
> > things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> > been stuck on a) for being 'too much churn'.
> >
>
> I think it makes sense to move them and probably the best way to do so is=
, as
> you proposed: that Arnd or Olof run the script to move them just before -=
rc1

FTR, no objections from my side.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

