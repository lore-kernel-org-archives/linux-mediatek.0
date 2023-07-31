Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DFCC001DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jul 2023 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:Content-Type:In-Reply-To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xlqjbZD8Olr9Rt4iJaano3yCaOvodCX1R2mTY02oa7c=; b=NCF8KnHT97J8dJtEfFceV2A8ZD
	mwTvREITeZmf6doGLEKwuq30BpD+h09zvahzeXM0efnCjHDkHaSd5vAyAFtN6uGPiaq+TzwQTRF1L
	P7l0AsdtpNhZqEzCW8ZjsdcJ+AeKcwFRsBb7IFQs3352hDb191EU1CsfbcnHy4xIStIYqn8uptK2u
	BuPzBHitMzahLqFxduf6EBGCerTf/q1PPY12BojzVs8KPh9GzcL7Id0JfSERckzbZQ39dklxjLNZj
	Agxw77wK967AmN+1hv0pREL6ytaO0bf/CTT049SMu02XYZpkQlxOJrZD2YZVk5xQpymsXPOx7GJ9u
	57DX/bUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRxa-00FYvv-2x;
	Mon, 31 Jul 2023 12:25:14 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQRxX-00FYuS-1b;
	Mon, 31 Jul 2023 12:25:12 +0000
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 17F5166020AE;
	Mon, 31 Jul 2023 13:25:06 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <CAF6AEGtan-bQ7syKAwOKDY=044aKu26SLPQ0j1ieLqXNyQQS3g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Mon, 31 Jul 2023 13:25:05 +0100
Cc: "Daniel Stone" <daniel@fooishbar.org>, emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com, dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, daniels@collabora.com, martin.blumenstingl@googlemail.com, mripard@kernel.org, anholt@google.com, linux-mediatek@lists.infradead.org, robclark@freedesktop.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de, "Dave Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
To: "Rob Clark" <robdclark@gmail.com>
MIME-Version: 1.0
Message-ID: <282e-64c7a800-77-46253680@38053863>
Subject: =?utf-8?q?Re=3A?= [PATCH v10] =?utf-8?q?drm=3A?= Add initial ci/ 
 subdirectory
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_052511_687207_C9B4F5F8 
X-CRM114-Status: GOOD (  21.20  )
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

Hello all,

Thanks for your comments.

On Friday, July 28, 2023 11:37 -03, Rob Clark <robdclark@gmail.com> wro=
te:

> On Thu, Jul 27, 2023 at 10:26=E2=80=AFPM Daniel Stone <daniel@fooishb=
ar.org> wrote:
> >
> > On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote=
:
> > > > I did run into a bit of a chicken vs. egg problem with testing =
the "in
> > > > tree" version (compared to earlier versions which kept most of =
the yml
> > > > and scripts in a separate tree), is that it actually requires t=
his
> > > > commit to exist in the branch you want to run CI on.  My earlie=
r
> > > > workaround of pulling the drm/ci commit in via
> > > > ${branchname}-external-fixes no longer works.
> > >
> > > After unwinding some more gitlab repo settings that were for the
> > > previous out-of-tree yml setup, I have this working.
> > >
> > > Tested-by: Rob Clark <robdclark@gmail.com>
> > > Acked-by: Rob Clark <robdclark@gmail.com>
> >
> > And it's also:
> > Acked-by: Daniel Stone <daniels@collabora.com>
> >
> > It's been back and forth a few times by now and reviewed pretty
> > heavily by all the people who are across the CI details. I think th=
e
> > next step is to answer all the workflow questions by actually getti=
ng
> > it into trees and using it in anger. There was some discussion abou=
t
> > whether this should come in from drm-misc, or the core DRM tree, or=
 a
> > completely separate pull, but I'm not sure what the conclusion was =
...
> > maintainers, thoughts?
>=20
> I'd prefer a separate pull, so that I could merge it into msm-next as
> well without having to pull in all of drm-misc

Should we create a drm-ci ?

>=20
> Possibly some other driver trees would like to do similar?
>=20
> BR,
> -R

Also, please wait for v11, I have a few adjustments to make as pointer =
by
some comments, and also regarding xfails list and how the configs shoul=
d
be organized (unless if you are fine merging this version and I can sub=
mit
the adjustments later).

Thanks,
Helen


