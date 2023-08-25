Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71081C79F60
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 14:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Subject:Message-ID:MIME-Version:To:Cc:Date:Content-Type:In-Reply-To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=99QBrXupAeXKChwRxYXRSIMCMcm78D8uxGMGd/w0Dvk=; b=iBRvqWhcDDg0RV/QmexztQEXV1
	BTfttZ0TzwY5xmQgSnqFerqujqTIz5/+8wmMUeeHfh4T5EuMXO6w1TEO4JtO+sOdtIdInAH0TgUiF
	iHpedKyGoNbSDQMeH0NBU52xAPJ6H2KeelC1V5fsQ81XDQBxMILUl+QB59gLNGtH7DD4JgqdFVSgB
	bEfASPKnU5UV7V72mLdCL+59LKRwhauJj9yZ+UTxW/I1wGeiGH91mpQmfamMFRZKWxEdvm+uhhxA9
	0Po/qK0Jc1gYZRQod/PKSQX2hkpkrV/zVHvuMh9gyr7X+t30MNB3F35vH5vb1iJolL75mHsG/75Zr
	l0cAvd8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXUy-005ZX4-13;
	Fri, 25 Aug 2023 14:09:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXUt-005ZUl-2b;
	Fri, 25 Aug 2023 14:09:13 +0000
Received: from hamburger.collabora.co.uk (hamburger.collabora.co.uk [IPv6:2a01:4f8:1c1c:f269::1])
	by madras.collabora.co.uk (Postfix) with ESMTP id 4C74566071BE;
	Fri, 25 Aug 2023 15:09:04 +0100 (BST)
From: "Helen Mae Koike Fornazier" <helen.koike@collabora.com>
In-Reply-To: <87pm3b2pkz.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
X-Forward: 127.0.0.1
Date: Fri, 25 Aug 2023 15:09:04 +0100
Cc: "Vignesh Raman" <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com, linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, daniels@collabora.com, martin.blumenstingl@googlemail.com, robclark@freedesktop.org, anholt@google.com, linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org, tzimmermann@suse.de
To: "Jani Nikula" <jani.nikula@linux.intel.com>
MIME-Version: 1.0
Message-ID: <29c7-64e8b600-1-6afffd8@162524228>
Subject: =?utf-8?q?Re=3A?= [PATCH 2/6] =?utf-8?q?drm=3A?==?utf-8?q?_ci=3A?= Force 
 db410c to host mode
User-Agent: SOGoMail 5.8.4
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_070912_006333_716F123F 
X-CRM114-Status: GOOD (  27.36  )
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

Hi Jani, thanks for your comments

On Friday, August 25, 2023 10:56 -03, Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:

> On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrot=
e:
> > Force db410c to host mode to fix network issue which results in fai=
lure
> > to mount root fs via NFS.
> > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8=
c15c80a54dda510743cefd1c4b65b8
> >
> > Since this fix is not sent upstream, add it to build.sh script
> > before building the kernel and dts. Better approach would be
> > to use devicetree overlays.
> >
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---
> >  drivers/gpu/drm/ci/build.sh | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build=
.sh
> > index 7b014287a041..c39834bd6bd7 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -70,6 +70,10 @@ if [ -z "$CI=5FMERGE=5FREQUEST=5FPROJECT=5FPATH"=
 ]; then
> >      fi
> >  fi
> > =20
> > +# Force db410c to host mode to fix network issue which results in =
failure to mount root fs via NFS.
> > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a62=
9b8c15c80a54dda510743cefd1c4b65b8
> > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr=5F=
mode =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > +
>=20
> It seems like a really bad idea to me to have the CI build modify the
> source tree before building.
>=20
> The kernel being built will have a dirty git repo, and the localversi=
on
> will have -dirty in it.

Is it bad?

The other option was to work with device tree overlays (but we still ne=
ed to spend some time to
see how to fit it all together)

>=20
> I think it would be better to do out-of-tree builds and assume the
> source is read-only.

I'm not sure I get what do you call out-of-tree builds.

Another option would be to apply .patch file, or to have another branch
just with fix ups for ci that would be applied in the tree before build=
ing.

>=20
> >  for opt in $ENABLE=5FKCONFIGS; do
> >    echo CONFIG=5F$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL=5FARCH}.co=
nfig
> >  done
>=20
> Ditto for the config changes in the context here. Those are files in
> git, don't change them.

Probably these changes could go directly into drivers/gpu/drm/ci/${KERN=
EL=5FARCH}.config
files, no need to modify them on the fly here

>=20
> Shouldn't this use something like 'scripts/config --enable' or
> 'scripts/config --disable' on the .config file to be used for buildin=
g
> instead?

I wasn't aware about this possibility, looks cleaner indeed.

Regards,
Helen

>=20
>=20
> BR,
> Jani.
>=20
>=20
> --=20
> Jani Nikula, Intel Open Source Graphics Center


