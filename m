Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB606C3DA6F
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/FGw8WTQcGNaVQqRBSGTtSHwW9E63Wb1NNcuS9eK8s=; b=YSgHHBBMdUKM0Y8WT1nhSgFgTZ
	Bxd6zHT4WK+kI6v+WX7yW4BEk1FztrlycVWSxRzhkeiS9g17qxbgUFjBenwW7gxzwgB00PXiDF5Pr
	I1JzKEtAtOykVPERyKEWBCrQIOGH8/U77ftlUkWWwMbwSnwGvYb8T2ZIN0hfRAEcD8spcAmAYTJ/x
	SXm7xctwxzxZRXz9esyFayZvn6k0u1mtHwW8QLf8ejs/e9nMUqY5fV8DteG8dsbf8vRrb+qV2pzZq
	rR81gflos5xKMDRUzWU2E24M/tIcYrOFPlIoYt3/UwmOgNQuFg2V6rIqqEd6ty9haa/+f2iwGJAgL
	YcMMbYdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbLY-005qWO-1F;
	Fri, 25 Aug 2023 18:15:48 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZbLT-005qUV-0o;
	Fri, 25 Aug 2023 18:15:45 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5007c8308c3so1877847e87.0;
        Fri, 25 Aug 2023 11:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692987339; x=1693592139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/FGw8WTQcGNaVQqRBSGTtSHwW9E63Wb1NNcuS9eK8s=;
        b=OxzC34VYQ/lOuAIJBv07wp6fPeLehLOAi1mU0uJLZSHMKrmj+EwYKRbIIaTKzGM0OD
         FELyHBv8icVGpooaDMH3pX56dJa2Wwqw0V1UOotJHLaAiAGC1WhZgkjwzjb+PigyH2OO
         qFu/a5ucbI3kLN3Rx4zRSLPky+hrc1dteGIHl/xz3OLfM3wEhzCkuhFy8oZFBdcQUsIl
         CetyjZ4N7p2FqAbZhzJxrFNfPtCayDJZ+fEtxSGfa3e621rdXxWjQR+5/+GD5oFVXLKu
         NBQYlM4Z037DJO07cmUfuVuyUIkjCbxMv2CfK1LjPyWxZWSdiHITq0jJPn22qbsZ/miw
         X1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692987339; x=1693592139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/FGw8WTQcGNaVQqRBSGTtSHwW9E63Wb1NNcuS9eK8s=;
        b=dOM+HwmnRG9ykjDyRDZkgY7CQTjnW67Y4HRA4cy+7RQOaOWqZbW04N0dA7wyJHYRzi
         ikVsOCPaTCaH9028cmnfHPItDeKfybm5js46DiqCKqPPSuAswPnZtBjVjQbegE1mq9qG
         kxH6Q1QOpe91DLiRQ8IqVOdMJ/jxZZr5bdRD8WUfThZQeRWYvgqU+g4Nu9P+k+9xosR/
         Imeo8qWf8BPBXf2Qy/hjKEeKtWc4uurNEsLaExyDmvQyM1DT4yBxZ6haNZR0tH84R8rl
         6wzbJYproAOUi0R3fftCffC1VFTKMBRSwhDZWFUFUq/vP9LMg99zRsOZkdBWuWJ7ZVjD
         NnSA==
X-Gm-Message-State: AOJu0YybMlF4eIy7uc5wtRYeBfJTPIpytofAvyulVEmIxlaqRaWbupem
	MXQYVNodtVt6wqFW4DyLMWEBnLkUFeoaH2qB3lE=
X-Google-Smtp-Source: AGHT+IHpRCVvS7diQdycBT5DGX0/HZUcX9oDLtQP3DT3UbV1oJ30vCnXpa+uG6GgEKk5nHZkYu+C35njfaJ8/ELaD5A=
X-Received: by 2002:ac2:5f85:0:b0:500:9860:f8a with SMTP id
 r5-20020ac25f85000000b0050098600f8amr5130105lfe.4.1692987338930; Fri, 25 Aug
 2023 11:15:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGsdR4XMQ73mwNEE-fntPFLbQrxmzdoWchjReoVXKexdVw@mail.gmail.com>
 <3f08-64e8c380-3-f083520@11689262>
In-Reply-To: <3f08-64e8c380-3-f083520@11689262>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Aug 2023 11:15:26 -0700
Message-ID: <CAF6AEGtzfEFpr610c8TdLAH_zEYEtXzt61ywQTcFbvCOj-G9-A@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
To: Helen Mae Koike Fornazier <helen.koike@collabora.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
	Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
	emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com, 
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, 
	corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, 
	gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, 
	daniels@collabora.com, martin.blumenstingl@googlemail.com, 
	robclark@freedesktop.org, anholt@google.com, 
	linux-mediatek@lists.infradead.org, mripard@kernel.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, 
	guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org, 
	tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_111543_290091_D311C262 
X-CRM114-Status: GOOD (  48.04  )
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

On Fri, Aug 25, 2023 at 8:06=E2=80=AFAM Helen Mae Koike Fornazier
<helen.koike@collabora.com> wrote:
>
> On Friday, August 25, 2023 11:41 -03, Rob Clark <robdclark@gmail.com> wro=
te:
>
> > On Fri, Aug 25, 2023 at 7:34=E2=80=AFAM Helen Mae Koike Fornazier
> > <helen.koike@collabora.com> wrote:
> > >
> > > On Friday, August 25, 2023 11:30 -03, Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > > On Fri, Aug 25, 2023 at 6:56=E2=80=AFAM Jani Nikula <jani.nikula@li=
nux.intel.com> wrote:
> > > > >
> > > > > On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> =
wrote:
> > > > > > Force db410c to host mode to fix network issue which results in=
 failure
> > > > > > to mount root fs via NFS.
> > > > > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a6=
29b8c15c80a54dda510743cefd1c4b65b8
> > > > > >
> > > > > > Since this fix is not sent upstream, add it to build.sh script
> > > > > > before building the kernel and dts. Better approach would be
> > > > > > to use devicetree overlays.
> > > > > >
> > > > > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/ci/build.sh | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/b=
uild.sh
> > > > > > index 7b014287a041..c39834bd6bd7 100644
> > > > > > --- a/drivers/gpu/drm/ci/build.sh
> > > > > > +++ b/drivers/gpu/drm/ci/build.sh
> > > > > > @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; =
then
> > > > > >      fi
> > > > > >  fi
> > > > > >
> > > > > > +# Force db410c to host mode to fix network issue which results=
 in failure to mount root fs via NFS.
> > > > > > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb7=
2a629b8c15c80a54dda510743cefd1c4b65b8
> > > > > > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\=
tdr_mode =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > > > > > +
> > > > >
> > > > > It seems like a really bad idea to me to have the CI build modify=
 the
> > > > > source tree before building.
> > > > >
> > > > > The kernel being built will have a dirty git repo, and the localv=
ersion
> > > > > will have -dirty in it.
> > > > >
> > > > > I think it would be better to do out-of-tree builds and assume th=
e
> > > > > source is read-only.
> > > >
> > > > We have the ${target_branch}-external-fixes mechanism to merge
> > > > necessary changes before building the kernel for CI.  Which is
> > > > necessary for a couple of reasons:
> > >
> > > Should we create an official topic/drm-ci-external-fixes branch ?
> >
> > Hmm, maybe.. I guess as we expand this to more driver trees, and want
> > to be able to re-run CI in the drm tree after merges to
> > drm-next/drm-fixes, we maybe want to have central
> > drm-next-external-fixes and drm-fixes-external-fixes.  I guess we can
> > keep those based on drm-next and drm-fixes?  And if there would be
> > conflicts because, say, ${driver}-next is behind drm-next, then
> > ${driver}-next could be rebased on drm-next?
> >
>
> tbh this is one of the reasons I would prefer in-code fixes instead of
> commits on a -external-fixes branch, since it seems things start to becom=
e
> complex to manage all different trees for people executing ci tests
> on different history points, but I don't oppose going for -external-fixes
> either.

If by in-code you mean in the same branch that we are running CI on, I
think that will be difficult to do without having force-pushes later
to remove the unrelated patch.

It doesn't happen every release, but sometimes there is an issue
requiring a fix outside of drm, which really shouldn't land via
drm-next.  In some cases even, we might need a temporary hack fix when
a proper solution is still being worked out.  Since the kernel
development is unlike mesa, where we have a single main branch and CI
runs on every change entering that main branch, we are going to have
to deal occasionally with breakage that comes in via another tree that
isn't running CI.  But IME so far with msm-next-external-fixes, it
hasn't been so bad.. I haven't even had to rebase it every kernel
cycle.  (If the fix cherry-picked into -external-fixes from a previous
release cycle already exists in msm-next then the merge of that commit
is a no-op.)

BR,
-R

> Regards,
> Helen
>
> > BR,
> > -R
> >
> > > Regards,
> > > Helen
> > >
> > > >
> > > > 1) patches like this which aren't appropriate upstream but necessar=
y
> > > > due to the CI lab setup
> > > > 2) target branch if often based on an early -rc, and it isn't unhea=
rd
> > > > of to need some fix for some board or another which isn't appropria=
te
> > > > to land via drm-next
> > > >
> > > > We should use the -external-fixes branch mechanism for patches like=
 this one.
> > > >
> > > > BR,
> > > > -R
> > > >
> > > > > >  for opt in $ENABLE_KCONFIGS; do
> > > > > >    echo CONFIG_$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL_ARCH}.co=
nfig
> > > > > >  done
> > > > >
> > > > > Ditto for the config changes in the context here. Those are files=
 in
> > > > > git, don't change them.
> > > > >
> > > > > Shouldn't this use something like 'scripts/config --enable' or
> > > > > 'scripts/config --disable' on the .config file to be used for bui=
lding
> > > > > instead?
> > > > >
> > > > >
> > > > > BR,
> > > > > Jani.
> > > > >
> > > > >
> > > > > --
> > > > > Jani Nikula, Intel Open Source Graphics Center
> > >
>

