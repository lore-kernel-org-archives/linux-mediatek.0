Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C896E784A7
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 03:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fxrswed9LXFiMLWzaLJZwhwURVs4ghK//pBojhrWxiw=; b=EtjhAJez6khfiC3RickK6rMt0/
	tHMHeyn2+hz0sJrDsxAfAQo1lQz1oG/Htxbfxwy8ZM10EkkTGiTTb1oPpvl34nqjcMWBKXHUudDwm
	JsqpbTE7VTSVVExwXF5Qm/ourOiGH6fONYFydxIKrdSiCR8M/Cf6ZAKr1Jg+gX8n6cpStchzzsOMn
	hq9fJlb1UmNmDI4nMedtcAmcbEQVsAzsGRmA1Wj1Dmj46JBirMUuJiBMbv/t9D9LU4x1GaPX3gBjB
	/CrapQecX0h46VWHosp/DBhAzlyAU8cpdfoxtWfKTBSO7MqLMH2qyJrDSeUrEo9X7aUutJ3Ek7fzs
	meK8rplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qn9df-00BtoW-0x;
	Mon, 02 Oct 2023 03:30:31 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qn9dc-00Bto3-2H
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 03:30:30 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50433d8385cso24125869e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Oct 2023 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696217425; x=1696822225; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxrswed9LXFiMLWzaLJZwhwURVs4ghK//pBojhrWxiw=;
        b=LyJ54q6qPmknxnE/cy8C2uju13CW5BxZEQ7QtMtnv19+AsUg6Ip8S02ylyXz4nMTFJ
         jvWl9+BnwrqZqI8hZXjrDNDjxX2cbf8yckoM8YX+utrjY+laC+GPSWvHW0twNQXZn+WF
         ikkt6xyNivEb76e3s3OmpfBv7H0e2eZpFdbNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696217425; x=1696822225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fxrswed9LXFiMLWzaLJZwhwURVs4ghK//pBojhrWxiw=;
        b=nfRkMrgdhBgsFbj8lh79DZ/KcpcESeHbXD1/qx9SDraTw7pi2ZoHKSlxpoPlad7EzT
         TfBelQNUwROdt6hDbOrLJChEie34aCWiBrXGbdwJ8DmC6m/3pR3y+OIz5OR+FzI2ctT5
         6Wjgmp9vzdlETQBRfKA8DYsHkg7LK6LIiM7Pcbry81EaEY+4NEV0lHi86Jl/oQdPuToW
         CB7xFgz3ltw2RkOykq2lX6HeAa9o1A2fNTWS4FPW9jtPMf1TbdxKdve6JlmtJ7kgfIKI
         9RwnHU6UB988cwIu9MXXeglKcmDlHan4MatE/byqF03f8/wwGHxrr8VyD0BycYuw9Yn4
         CSJQ==
X-Gm-Message-State: AOJu0YylLQ1JwsR2vRHNUl4qByCYKcLYRqn+H2mzt3bt4huyZJ+8Bfsb
	mX4viw3djRCmmHWOqNiUlJcgaYIRnmnmkTsiSwaOLg==
X-Google-Smtp-Source: AGHT+IF+QatVocFmRGJXKsFlY239FHUEt/InSagl685uTbNTsTU5IYYV6+uN84C44RNwztMDPSDeexsTiihSb+Hslig=
X-Received: by 2002:a05:6512:485b:b0:503:3707:66ed with SMTP id
 ep27-20020a056512485b00b00503370766edmr8048003lfb.34.1696217424296; Sun, 01
 Oct 2023 20:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com> <84b2de54-8337-42a3-a25c-a95cf2f3349f@app.fastmail.com>
In-Reply-To: <84b2de54-8337-42a3-a25c-a95cf2f3349f@app.fastmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Oct 2023 11:30:13 +0800
Message-ID: <CAGXv+5FtBcHwEhQEoEUBx24Zf4ABrDeSaWo_mDbM7OvmBLF5nA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
To: Arnd Bergmann <arnd@arndb.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, amergnat@baylibre.com, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231001_203028_791773_39855E85 
X-CRM114-Status: GOOD (  35.02  )
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

On Sat, Sep 30, 2023 at 3:37=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Fri, Sep 29, 2023, at 04:20, AngeloGioacchino Del Regno wrote:
> > I am a top reviewer mainly for MediaTek SoC related patches in most
> > subsystems and I've also been upstreaming both improvements, fixes
> > and new drivers and devicetrees when required.
> >
> > The MediaTek scene saw a generous increase in number of patches that
> > are sent to the lists every week, increasing the amount of required
> > efforts to maintain the MTK bits overall, and we will possibly see
> > even more of that.
> >
> > For this reason, and also because of suggestions and encouragement
> > coming from the community, I'm stepping up to be a co-maintainer of
> > MediaTek SoCs support.
> >
> > Signed-off-by: AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com>
> > ---
> >
> > P.S.: I tried to reach to Matthias for almost two months, but I couldn'=
t
> > find any way to talk to him and he has been unresponsive on the mailing
> > lists as well.
> >
> > P.P.S.: This also comes after Rob Herring's suggestion to have myself a=
s
> > a MediaTek SoC co-maintainer [1] and support from other people.
> >
> > [1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.org=
/
>
> Thanks for volunteering for this!
>
> I have no information on what Mattias is doing, but I see that he
> has not merged any patches since June, and that he never sent a
> pull request for your patches that are still in his for-next
> branch.
>
> I hope he's going to be ok, but let's plan for you to take over
> for the moment, at least until Matthias is again able to keep
> maintaining the platform in the near future.
>
> Here is my suggestion for how to continue from here:
>
> - Please send your MAINTAINERS file update to soc@kernel.org
>   along  with any urgent bugfixes you may have, so I can forward
>   them for 6.7. I'm wrapping up the current set of fixes at
>   the moment, so this would be for next week's rc
>
> - Create a git tree with the ususal branches (drivers, soc, dt,
>   fixes, for-next) and ask Stephen Rothwell (on Cc) to add
>   the combined for-next branch  to linux-next for integration testing

I suggest creating a shared git tree from the start. That way when
Mattias comes back and does agree to co-maintainership, or if anyone
else joins in, you don't have to change the git tree URL in a lot of
places.

> - Start each branch on 6.6-rc2 (usually we use rc1, but this time
>   rc2 is a better candidate because of the last-minute
>   drivers/pmdomain rename), and merge the corresponding branches
>   from git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.g=
it
>   into those to avoids conflicts with his tree
>
> - Add any further patches you want in 6.7 on top
>
> - Send a first set of pull requests to soc@kernel.org for whatever
>   you have merged as soon as you are confident about them,
>   ideally by the end of next week.
>
> - Send additional pull requests for fixups or late features in
>   the weeks after that as you see fit.
>
> See Documentation/process/maintainer-soc.rst for more details
> on the above. When Mattias comes back, you can work out a new
> process together with him.

I can also answer any questions you might have about the process.


ChenYu

