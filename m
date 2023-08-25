Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A67C7EE2C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:Content-Type:In-Reply-To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=qz0Pp1iqxhzY3eIzEi/dHJuFpdHvmW31bqjS4Z1pRuE=; b=jcGOoBx+5Xl3DQVGTz4FSN9KRE
	o5ZaiIGV3V842hwFH001vPfob7j3UuQmpoOvZfM3ZTVuuVG8I8vNbUet9GmbInuzpoKmdJSWlYTzD
	U+EpJQxLzLiTwu/IqKOGA4kwQFlPjOZlVtcHKQIxQ5P083x3UKBLWV/4PvXsR4zKjVCXw1J6besxG
	fsNsXgxSuRSsWhluQON0Zcj0kBySimPpxP0h/JKYhvbWrISmielBdeVBCfWlXsfcNliMYqiQynRJE
	U33cRuS20WI9PYCc7v59nJ8sdRl4t4G9n5fipqfbuuNFKasn4pcEasl8pF/LHDCkK42a4HjnZn6P5
	tVnPWWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXtH-005bnp-2k;
	Fri, 25 Aug 2023 14:34:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXtE-005bn0-0T;
	Fri, 25 Aug 2023 14:34:21 +0000
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 12B3E66071BE;
	Fri, 25 Aug 2023 15:34:15 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <CAF6AEGs4p0xXJjsNug45CFiP0n-5h7wpdy22YBryjrnWFROESg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 25 Aug 2023 15:34:15 +0100
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>, "Vignesh Raman" <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, daniels@collabora.com, martin.blumenstingl@googlemail.com, robclark@freedesktop.org, anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de
To: "Rob Clark" <robdclark@gmail.com>
MIME-Version: 1.0
Message-ID: <29c7-64e8bc00-3-6afffd8@162524261>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/6] =?utf-8?q?drm=3A?==?utf-8?q?_ci=3A?= Force 
 db410c to host mode
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_073420_314227_06C97699 
X-CRM114-Status: GOOD (  30.40  )
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

On Friday, August 25, 2023 11:30 -03, Rob Clark <robdclark@gmail.com> w=
rote:

> On Fri, Aug 25, 2023 at 6:56=E2=80=AFAM Jani Nikula <jani.nikula@linu=
x.intel.com> wrote:
> >
> > On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wr=
ote:
> > > Force db410c to host mode to fix network issue which results in f=
ailure
> > > to mount root fs via NFS.
> > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629=
b8c15c80a54dda510743cefd1c4b65b8
> > >
> > > Since this fix is not sent upstream, add it to build.sh script
> > > before building the kernel and dts. Better approach would be
> > > to use devicetree overlays.
> > >
> > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > ---
> > >  drivers/gpu/drm/ci/build.sh | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/bui=
ld.sh
> > > index 7b014287a041..c39834bd6bd7 100644
> > > --- a/drivers/gpu/drm/ci/build.sh
> > > +++ b/drivers/gpu/drm/ci/build.sh
> > > @@ -70,6 +70,10 @@ if [ -z "$CI=5FMERGE=5FREQUEST=5FPROJECT=5FPAT=
H" ]; then
> > >      fi
> > >  fi
> > >
> > > +# Force db410c to host mode to fix network issue which results i=
n failure to mount root fs via NFS.
> > > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a=
629b8c15c80a54dda510743cefd1c4b65b8
> > > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\td=
r=5Fmode =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > > +
> >
> > It seems like a really bad idea to me to have the CI build modify t=
he
> > source tree before building.
> >
> > The kernel being built will have a dirty git repo, and the localver=
sion
> > will have -dirty in it.
> >
> > I think it would be better to do out-of-tree builds and assume the
> > source is read-only.
>=20
> We have the ${target=5Fbranch}-external-fixes mechanism to merge
> necessary changes before building the kernel for CI.  Which is
> necessary for a couple of reasons:

Should we create an official topic/drm-ci-external-fixes branch ?

Regards,
Helen

>=20
> 1) patches like this which aren't appropriate upstream but necessary
> due to the CI lab setup
> 2) target branch if often based on an early -rc, and it isn't unheard
> of to need some fix for some board or another which isn't appropriate
> to land via drm-next
>=20
> We should use the -external-fixes branch mechanism for patches like t=
his one.
>=20
> BR,
> -R
>=20
> > >  for opt in $ENABLE=5FKCONFIGS; do
> > >    echo CONFIG=5F$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL=5FARCH}.=
config
> > >  done
> >
> > Ditto for the config changes in the context here. Those are files i=
n
> > git, don't change them.
> >
> > Shouldn't this use something like 'scripts/config --enable' or
> > 'scripts/config --disable' on the .config file to be used for build=
ing
> > instead?
> >
> >
> > BR,
> > Jani.
> >
> >
> > --
> > Jani Nikula, Intel Open Source Graphics Center


