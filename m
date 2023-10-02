Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1503E7849A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 09:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=50/2hsvbLrIvggaR30aYtR9Jo6d9ZOr+OHp/3txBaD0=; b=otphp42/hgSTK98yJ0wjS+M7uN
	FSGxwpVHMJq/pL27iD9hYnA2g7+adlWkg8O5doOym5G64MBb02q7rv+i/4S9A8Bn/VQoBQCtPOpmv
	yqYBfZn7mbiwXAOZLWL1jIznKHrGK7KVXtwfAQWWTzGoW/q7A+vS9irntxTwSYJV/aVQwhL4UYVBz
	KdsZoyaOLHczQ2GR3FYu6xgNVqfq7TZDK0q3KvJHDYkbuZf5bWxXWum5Nu5/w+MuP2U57Cwkah5YW
	QHpb6q87gZ1wxgFaqXzhIhnaYTQtX/7tYDdsI2sybCNd6lZiNinU3JkU19fzUcZ6gsWk8qoofuRpg
	Q6XJaGpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnEqo-00CCRm-12;
	Mon, 02 Oct 2023 09:04:26 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnEql-00CCRI-1P
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 09:04:25 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50308217223so24737041e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 02 Oct 2023 02:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696237461; x=1696842261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=50/2hsvbLrIvggaR30aYtR9Jo6d9ZOr+OHp/3txBaD0=;
        b=EPSgR2qOQurYmO+G4u/JscQRHttpSPNuAK4w0RL45EjN4uwf6xZC8SjXi4bTaYpD1A
         rUBYVEa6veEQF2eSJ7YASJmxDwwF2aam7hbaIptPSvDLeuuwQSWmL2kfva00JbHvWUsN
         p3KSHd2VIXzaLg5BUaTkXpOlOGXlb67ddqHgU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696237461; x=1696842261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50/2hsvbLrIvggaR30aYtR9Jo6d9ZOr+OHp/3txBaD0=;
        b=TIXgK1Oe4AP2ryOntk0MbpD8l+LuUYW0wUTHFzQnvvR4SqAfjeqa3aWTKdEIk+p3qR
         i9eG/pxOY/ciA+8jiLYEHNfoYdQm7buC2jGgQc0PZnUU6qUiFFSz49Q4jKV6kBLcvGTN
         VfwNSymk2OtGw4BuaELYRtJXBvNlcZ9ma3CGjNOwK5ybMu9nj1uHDUhxGk2MGNuFT8iL
         3S8yrKJzM6YaSIGYybC/9a9eI0/lBmgkQ3gPC/mMfK2bHHvJev0dyQXhZ7DDccAuadxv
         D5GW3m03iLizbBvCspBAcvvbR3si+2xOm/aWjdxM+DAT5z0ZlzK9AdGHrW1/6GVM9hjz
         EwYQ==
X-Gm-Message-State: AOJu0YzU8wrxKmREEXJroNfzy5PAQGJ1CIOypmmPOtU5mC9CNv34S0UP
	mywkAmwmJPehcQtC9s1A1o86UZH/qUyFNwiammDojaJTVipePSSS
X-Google-Smtp-Source: AGHT+IGneJ9FgkMSGDGOIASBqdEuFAnrvX8yuv1YB2NtaOm9WDOAb/vk+og0O6KbRm7uTPH/Pc2L428eZfb3dwnSB9I=
X-Received: by 2002:a19:6509:0:b0:503:970:4dbf with SMTP id
 z9-20020a196509000000b0050309704dbfmr7689708lfb.15.1696237460859; Mon, 02 Oct
 2023 02:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230929082009.71843-1-angelogioacchino.delregno@collabora.com>
 <84b2de54-8337-42a3-a25c-a95cf2f3349f@app.fastmail.com> <CAGXv+5FtBcHwEhQEoEUBx24Zf4ABrDeSaWo_mDbM7OvmBLF5nA@mail.gmail.com>
 <660c5c93-4a02-0f6b-4640-ddf67a477490@collabora.com>
In-Reply-To: <660c5c93-4a02-0f6b-4640-ddf67a477490@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 2 Oct 2023 17:04:09 +0800
Message-ID: <CAGXv+5H0jFRj-79XXp+LSE=kD=p1we5Vem4+9AYk2-tS-bHT0A@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Angelo as MediaTek SoC co-maintainer
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, amergnat@baylibre.com, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_020423_509208_A31C1BF9 
X-CRM114-Status: GOOD (  42.58  )
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

On Mon, Oct 2, 2023 at 4:27=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 02/10/23 05:30, Chen-Yu Tsai ha scritto:
> > On Sat, Sep 30, 2023 at 3:37=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> w=
rote:
> >>
> >> On Fri, Sep 29, 2023, at 04:20, AngeloGioacchino Del Regno wrote:
> >>> I am a top reviewer mainly for MediaTek SoC related patches in most
> >>> subsystems and I've also been upstreaming both improvements, fixes
> >>> and new drivers and devicetrees when required.
> >>>
> >>> The MediaTek scene saw a generous increase in number of patches that
> >>> are sent to the lists every week, increasing the amount of required
> >>> efforts to maintain the MTK bits overall, and we will possibly see
> >>> even more of that.
> >>>
> >>> For this reason, and also because of suggestions and encouragement
> >>> coming from the community, I'm stepping up to be a co-maintainer of
> >>> MediaTek SoCs support.
> >>>
> >>> Signed-off-by: AngeloGioacchino Del Regno
> >>> <angelogioacchino.delregno@collabora.com>
> >>> ---
> >>>
> >>> P.S.: I tried to reach to Matthias for almost two months, but I could=
n't
> >>> find any way to talk to him and he has been unresponsive on the maili=
ng
> >>> lists as well.
> >>>
> >>> P.P.S.: This also comes after Rob Herring's suggestion to have myself=
 as
> >>> a MediaTek SoC co-maintainer [1] and support from other people.
> >>>
> >>> [1]: https://lore.kernel.org/all/20230804225813.12493-1-robh@kernel.o=
rg/
> >>
> >> Thanks for volunteering for this!
> >>
> >> I have no information on what Mattias is doing, but I see that he
> >> has not merged any patches since June, and that he never sent a
> >> pull request for your patches that are still in his for-next
> >> branch.
> >>
> >> I hope he's going to be ok, but let's plan for you to take over
> >> for the moment, at least until Matthias is again able to keep
> >> maintaining the platform in the near future.
> >>
> >> Here is my suggestion for how to continue from here:
> >>
> >> - Please send your MAINTAINERS file update to soc@kernel.org
> >>    along  with any urgent bugfixes you may have, so I can forward
> >>    them for 6.7. I'm wrapping up the current set of fixes at
> >>    the moment, so this would be for next week's rc
> >>
> >> - Create a git tree with the ususal branches (drivers, soc, dt,
> >>    fixes, for-next) and ask Stephen Rothwell (on Cc) to add
> >>    the combined for-next branch  to linux-next for integration testing
> >
> > I suggest creating a shared git tree from the start. That way when
> > Mattias comes back and does agree to co-maintainership, or if anyone
> > else joins in, you don't have to change the git tree URL in a lot of
> > places.
> >
>
> I agree with creating a shared git tree from the start... I currently don=
't have
> a kernel.org account yet, as I'm waiting for helpdesk to grant my account=
 request.
>
> They asked me to send a patch adding myself to MAINTAINERS as they would =
use that
> as a basis to grant the account request... so I guess it's happening soon=
; seen
> the urgency, I would do anything in my power to speed up the process, but=
 probably
> there's "nothing to do" about it.

If you do end up not getting an account in time, I can do all the patch
queuing and sending out PR work using my account for this cycle, if that's
OK with the soc maintainers.

That said, we have a long weekend (Oct. 7 to Oct. 10) during which I will b=
e
travelling. I might also be travelling during parts of the remaining three
work days, but the whole thing is still up in the air.

> I am guessing that the right thing to do right now is to just send the mo=
stly
> critical fixes to soc@kernel.org, along with this patch, and wait until a=
 shared
> tree is created to keep things clean?

+1 Sounds good to me.


> >> - Start each branch on 6.6-rc2 (usually we use rc1, but this time
> >>    rc2 is a better candidate because of the last-minute
> >>    drivers/pmdomain rename), and merge the corresponding branches
> >>    from git://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/lin=
ux.git
> >>    into those to avoids conflicts with his tree
> >>
> >> - Add any further patches you want in 6.7 on top
> >>
> >> - Send a first set of pull requests to soc@kernel.org for whatever
> >>    you have merged as soon as you are confident about them,
> >>    ideally by the end of next week.
> >>
> >> - Send additional pull requests for fixups or late features in
> >>    the weeks after that as you see fit.
> >>
> >> See Documentation/process/maintainer-soc.rst for more details
> >> on the above. When Mattias comes back, you can work out a new
> >> process together with him.
> >
> > I can also answer any questions you might have about the process.
> >
>
> Many thanks for your support, I greatly appreciate that.
>
> Cheers,
> Angelo
>

