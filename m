Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39689C001DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fAPrkbK19s/j5Zx9BvuYAYuY534VPCFu5UMSEPN+FAE=; b=Hdp4FhVFA79e/9kw3ebQFkSpCQ
	g0dggTm+64wcBbok0O4hWaH1yPr1h9Y/lha3Cq+7PNhIUSA4wiDf0cy3E/1KzcXyeAiqenkdn7QPJ
	RwEyn4nG5//K+gkBotmTnSZ/o+Z6+IQPeyb/DrDM161hxdPAuJo3bZqNyKhXZJTObj/YNGI/K3QUs
	tvb2AACZTXHaNsShZoigMXwi0KyZ76envU1yNahk0pCzCpbkANzLdzOo+h4NAWN4J89Qh+dhw29Jr
	AeACvVjC5n9zvemedp1IdfG1llg8PIQ84mB3brsTWpZ7zcCRNO6CTUAx7bGIht8QWmAr6942BurZL
	//sUyGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUF2-00GBVg-2z;
	Mon, 31 Jul 2023 14:51:24 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQUEz-00GBUo-1d;
	Mon, 31 Jul 2023 14:51:22 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe078dcc3aso28077595e9.2;
        Mon, 31 Jul 2023 07:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690815079; x=1691419879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAPrkbK19s/j5Zx9BvuYAYuY534VPCFu5UMSEPN+FAE=;
        b=ONefshDkN1jXMyg0wZ8QEmmAPXYcp3mA7Y4rLHbZ0B/sSm8FGewPffgqtdxTL/X1iT
         AtnNYgJ+osFjNol3DgEwCoRMsRzED9sEjdYo+XNB6jA/vpUD06z0WPGVpFwk6veFO9OU
         ibatrDvsrl3GB3m2uFuEY1sklgbBbV+M1ieeB/BLXlqQriOZZEEhJRnlTc6k3zry1pGI
         8gT4pqVcCYAqeSjkliWxyT6pMGXOg8y1USl58BKNqUR4FGu0Ju4rskBjkX0SaL4zQ9IR
         mABJjkmvgdQUqRb0sebjRifxOKcjyv4RmV6FD7aKFsKCahByl3oE/ln33nEvLUOnN/IR
         cPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690815079; x=1691419879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAPrkbK19s/j5Zx9BvuYAYuY534VPCFu5UMSEPN+FAE=;
        b=czzHfEWzaKptAq/20DaR7a87k0LYt2+BGMDX+5xJ+zmG2FGCyki1iIj6Ab+uIE8ATF
         LhVRfvzVFYz4Ea95cWuUPpn579zIVHKpz7pNy/dpe/tUP144ZkWlr/RC/DKoN39GJlSx
         yheKwbAMVLf6pXkP6lndhTG4dEYA7aLjauXqpUW0zrRIXs6hIWKjN6Rzu7NX2tMuaIsw
         gmIGH3vrh9TtwDEoYctCgwkVjO+Wx/XikcaC1pOAvjefKt44UkBvC2LtpNH221BFNvQS
         WJMvGtJ7BPsoB9Veh7ydBFTDe9/2/a4/sHjSLRMdFTkY23emLyuqGjY7f8Fjk91843Lb
         +euA==
X-Gm-Message-State: ABy/qLbjDCCkPHhjKBM6ulOQ3VhXLGybWLWS6iayQEsaRHXRdLU2L6Ci
	RA5/KzjGFECpq++p5ZelB4wxhwvR9ZF6Ck/iQzo=
X-Google-Smtp-Source: APBJJlHp9CxGwet2vmvPctm3AruUc8MW3kWbH5+YX2xIIUpW5tevxLfL1O+U73H0pP1U9NLaYEZRubIxIr3M2m/csAQ=
X-Received: by 2002:adf:e752:0:b0:314:3f98:a788 with SMTP id
 c18-20020adfe752000000b003143f98a788mr58676wrn.7.1690815079341; Mon, 31 Jul
 2023 07:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGtan-bQ7syKAwOKDY=044aKu26SLPQ0j1ieLqXNyQQS3g@mail.gmail.com>
 <282e-64c7a800-77-46253680@38053863>
In-Reply-To: <282e-64c7a800-77-46253680@38053863>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 31 Jul 2023 07:51:07 -0700
Message-ID: <CAF6AEGufEzyOygPt6-tCbSC75GSD7sOB=FHE4nNGwPre6kHuOA@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: Daniel Stone <daniel@fooishbar.org>, emma@anholt.net, linux-doc@vger.kernel.org, 
	david.heidelberg@collabora.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, 
	corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, 
	gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, 
	daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org, 
	anholt@google.com, linux-mediatek@lists.infradead.org, 
	robclark@freedesktop.org, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, 
	neil.armstrong@linaro.org, guilherme.gallo@collabora.com, 
	linux-kernel@vger.kernel.org, tzimmermann@suse.de, 
	Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_075121_542885_4A9940CE 
X-CRM114-Status: GOOD (  31.19  )
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

On Mon, Jul 31, 2023 at 5:25=E2=80=AFAM Helen Mae Koike Fornazier
<helen.koike@collabora.com> wrote:
>
> Hello all,
>
> Thanks for your comments.
>
> On Friday, July 28, 2023 11:37 -03, Rob Clark <robdclark@gmail.com> wrote=
:
>
> > On Thu, Jul 27, 2023 at 10:26=E2=80=AFPM Daniel Stone <daniel@fooishbar=
.org> wrote:
> > >
> > > On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > > > > I did run into a bit of a chicken vs. egg problem with testing th=
e "in
> > > > > tree" version (compared to earlier versions which kept most of th=
e yml
> > > > > and scripts in a separate tree), is that it actually requires thi=
s
> > > > > commit to exist in the branch you want to run CI on.  My earlier
> > > > > workaround of pulling the drm/ci commit in via
> > > > > ${branchname}-external-fixes no longer works.
> > > >
> > > > After unwinding some more gitlab repo settings that were for the
> > > > previous out-of-tree yml setup, I have this working.
> > > >
> > > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > > Acked-by: Rob Clark <robdclark@gmail.com>
> > >
> > > And it's also:
> > > Acked-by: Daniel Stone <daniels@collabora.com>
> > >
> > > It's been back and forth a few times by now and reviewed pretty
> > > heavily by all the people who are across the CI details. I think the
> > > next step is to answer all the workflow questions by actually getting
> > > it into trees and using it in anger. There was some discussion about
> > > whether this should come in from drm-misc, or the core DRM tree, or a
> > > completely separate pull, but I'm not sure what the conclusion was ..=
.
> > > maintainers, thoughts?
> >
> > I'd prefer a separate pull, so that I could merge it into msm-next as
> > well without having to pull in all of drm-misc
>
> Should we create a drm-ci ?

I guess we can just wait and see how often it is that drm/ci updates
need to be merged into multiple driver trees.  Hopefully most of the
drm/ci changes are just expectation file updates which should go via
driver tree.  Maybe i-g-t uprevs, if they have a lot of expectation
changes would be something drivers would want to merge into their own
tree?  But I guess we can see how it goes.

> >
> > Possibly some other driver trees would like to do similar?
> >
> > BR,
> > -R
>
> Also, please wait for v11, I have a few adjustments to make as pointer by
> some comments, and also regarding xfails list and how the configs should
> be organized (unless if you are fine merging this version and I can submi=
t
> the adjustments later).

Ok

BR,
-R

> Thanks,
> Helen
>

