Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A9F0C3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:Content-Type:In-Reply-To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=krbe/WzWAjej+DI0iSje27nwNUEQ89RbPcXR2sMoYlI=; b=zhLU75+g6175l8c8N1xn7k+jXB
	fhqPtSbHP6zH9rdVrW79M22A2IBn1lqB4A+WrSG8myDSk7iF6nV21SclWmEHb13bEJHbQOHybZbSt
	8PznfxCnZHlvfhWwa8TJLTpd1JvNCyw7UtD3YtmSbFwtjQhGd70tz0UpLL0xjAHDJYGaTE60ffszF
	dIdaKo11AkTnJmV2SvyQHQH7T6wUo0oGwtLoiH2g2mCx423qxRPqKfT0h410TvhVwIX2VJzusg/52
	QEuMwgV5W5KcYlWZKKDuR7gJ31IPaqadxnKwAO5RiFhPCfnfBMDvHGDZHbueeoYxPGJO4wBzQ7I8Y
	fFmdeonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYO4-005e4r-2A;
	Fri, 25 Aug 2023 15:06:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZYNy-005e3s-0c;
	Fri, 25 Aug 2023 15:06:10 +0000
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 6E9BA6607285;
	Fri, 25 Aug 2023 16:06:01 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <CAF6AEGsdR4XMQ73mwNEE-fntPFLbQrxmzdoWchjReoVXKexdVw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 25 Aug 2023 16:06:01 +0100
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>, "Vignesh Raman" <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, daniels@collabora.com, martin.blumenstingl@googlemail.com, robclark@freedesktop.org, anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de
To: "Rob Clark" <robdclark@gmail.com>
MIME-Version: 1.0
Message-ID: <3f08-64e8c380-3-f083520@11689262>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/6] =?utf-8?q?drm=3A?==?utf-8?q?_ci=3A?= Force 
 db410c to host mode
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_080606_487261_8ED8F673 
X-CRM114-Status: GOOD (  37.64  )
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

On Friday, August 25, 2023 11:41 -03, Rob Clark <robdclark@gmail.com> w=
rote:

> On Fri, Aug 25, 2023 at 7:34=E2=80=AFAM Helen Mae Koike Fornazier
> <helen.koike@collabora.com> wrote:
> >
> > On Friday, August 25, 2023 11:30 -03, Rob Clark <robdclark@gmail.co=
m> wrote:
> >
> > > On Fri, Aug 25, 2023 at 6:56=E2=80=AFAM Jani Nikula <jani.nikula@=
linux.intel.com> wrote:
> > > >
> > > > On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com=
> wrote:
> > > > > Force db410c to host mode to fix network issue which results =
in failure
> > > > > to mount root fs via NFS.
> > > > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72=
a629b8c15c80a54dda510743cefd1c4b65b8
> > > > >
> > > > > Since this fix is not sent upstream, add it to build.sh scrip=
t
> > > > > before building the kernel and dts. Better approach would be
> > > > > to use devicetree overlays.
> > > > >
> > > > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > > > ---
> > > > >  drivers/gpu/drm/ci/build.sh | 4 ++++
> > > > >  1 file changed, 4 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci=
/build.sh
> > > > > index 7b014287a041..c39834bd6bd7 100644
> > > > > --- a/drivers/gpu/drm/ci/build.sh
> > > > > +++ b/drivers/gpu/drm/ci/build.sh
> > > > > @@ -70,6 +70,10 @@ if [ -z "$CI=5FMERGE=5FREQUEST=5FPROJECT=5F=
PATH" ]; then
> > > > >      fi
> > > > >  fi
> > > > >
> > > > > +# Force db410c to host mode to fix network issue which resul=
ts in failure to mount root fs via NFS.
> > > > > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/c=
b72a629b8c15c80a54dda510743cefd1c4b65b8
> > > > > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\=
n\tdr=5Fmode =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > > > > +
> > > >
> > > > It seems like a really bad idea to me to have the CI build modi=
fy the
> > > > source tree before building.
> > > >
> > > > The kernel being built will have a dirty git repo, and the loca=
lversion
> > > > will have -dirty in it.
> > > >
> > > > I think it would be better to do out-of-tree builds and assume =
the
> > > > source is read-only.
> > >
> > > We have the ${target=5Fbranch}-external-fixes mechanism to merge
> > > necessary changes before building the kernel for CI.  Which is
> > > necessary for a couple of reasons:
> >
> > Should we create an official topic/drm-ci-external-fixes branch ?
>=20
> Hmm, maybe.. I guess as we expand this to more driver trees, and want
> to be able to re-run CI in the drm tree after merges to
> drm-next/drm-fixes, we maybe want to have central
> drm-next-external-fixes and drm-fixes-external-fixes.  I guess we can
> keep those based on drm-next and drm-fixes?  And if there would be
> conflicts because, say, ${driver}-next is behind drm-next, then
> ${driver}-next could be rebased on drm-next?
>=20

tbh this is one of the reasons I would prefer in-code fixes instead of
commits on a -external-fixes branch, since it seems things start to bec=
ome
complex to manage all different trees for people executing ci tests
on different history points, but I don't oppose going for -external-fix=
es
either.

Regards,
Helen

> BR,
> -R
>=20
> > Regards,
> > Helen
> >
> > >
> > > 1) patches like this which aren't appropriate upstream but necess=
ary
> > > due to the CI lab setup
> > > 2) target branch if often based on an early -rc, and it isn't unh=
eard
> > > of to need some fix for some board or another which isn't appropr=
iate
> > > to land via drm-next
> > >
> > > We should use the -external-fixes branch mechanism for patches li=
ke this one.
> > >
> > > BR,
> > > -R
> > >
> > > > >  for opt in $ENABLE=5FKCONFIGS; do
> > > > >    echo CONFIG=5F$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL=5FAR=
CH}.config
> > > > >  done
> > > >
> > > > Ditto for the config changes in the context here. Those are fil=
es in
> > > > git, don't change them.
> > > >
> > > > Shouldn't this use something like 'scripts/config --enable' or
> > > > 'scripts/config --disable' on the .config file to be used for b=
uilding
> > > > instead?
> > > >
> > > >
> > > > BR,
> > > > Jani.
> > > >
> > > >
> > > > --
> > > > Jani Nikula, Intel Open Source Graphics Center
> >


