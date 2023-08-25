Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF876C71133
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 14:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/Nyi2UtJHS2L8Ejnis0sIFHEs44gVXKzFV9je3/KrQ=; b=fRHTt4oQ3u7Mo+oyoSpdevwzyI
	fpTRLgmC9h/zXTgqzqjKHCF0CjcPUqmWUu5eM6J+gfh0/qScAJAJOKkv73mgC5x/pp+Xm28jnD5nO
	agKkh11BVA9IGONgF68pbB+sLaMzifrSshPU2fyZ0HGu7obmDjQj2wkYrjJ6sSUO+VPGcfvquR/ou
	5FcYDbnzWcUhjoxv3Ui5PXScHE0utwsgqBWVjRoR5k5oT1weaHaHx8XZmSpXS7yzOt3jVK60c2h7+
	It/JoShzbIBXQnlXLwFxvKdY8S6xPIwtWPySVlNmAaU0ZMeUew8TGLp8AERp1iq5ZPlajIXmbkgi+
	kH3cDwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZY0K-005cI2-2S;
	Fri, 25 Aug 2023 14:41:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZY0G-005cG6-1w;
	Fri, 25 Aug 2023 14:41:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c3c8adb27so122838066b.1;
        Fri, 25 Aug 2023 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692974492; x=1693579292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/Nyi2UtJHS2L8Ejnis0sIFHEs44gVXKzFV9je3/KrQ=;
        b=m5YpFddniJdsweLpDiBMuTrwp/DFZA7ALBdWjy/ou8KTRnc7m1IFRI+d6jSHq0CEAM
         QhFVj47cdxI+vCV4+9qbuh3aoDvvBm2JOgyx8jY9qcLLmmtrJkkqfq+aSlE7T8wv+4iP
         uhe7HLkAu15rpIFabmISxrkvwM5L47q3+A/GaN/Zxe1GeBVJesIitTuCJOHfqnTe+pnm
         nP2UxSHrwwfBZ0P6xfMo5V+2hntqsaNAGeYTsIgWO5h8S9W/2ESYbh+GDXW9yUOO5yFM
         LLOejgrH7OPsyUOcMRfUViC3pludGiVGC9VygBQV532P5MSingkpNeSPgkrDQZ3GAMq9
         vPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692974492; x=1693579292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/Nyi2UtJHS2L8Ejnis0sIFHEs44gVXKzFV9je3/KrQ=;
        b=bmHHDtjcoNv1/l9bEgLNz/sqr3u7JkIK0U1YYqgWI2r/EEj6M8s2iVY7s0vXMgqCgA
         khnSHzggRKF1623ffzbsZaGku69DW/h53RHpEaHbSJ4p0GL5ZJzxrIA+Ns0e/yk0hqib
         RPUzahwiuNuTyLoh0B0mD0N9cpxk+fiPODCqb74BDEcltnYe/OnNACIhIsjjEi3jK3/E
         uqbeusrPTFIuw9CQnOU+I6xBg+4UJ2IQ4kiEg2jLKe8tkuxnWB6dB1GJDOd8gT838Vfr
         397cV7aY+TpIOtYFYCPCdKowob1aTIf1FWorunHwwEhpQzSGSbj3tXPF/GtBH2mhLmXU
         NKVw==
X-Gm-Message-State: AOJu0YwcXhyIqjPQf9LmEkekaR2ULQTxQsX5vDoPaheoVGzTamAnoY3f
	Ec+kShIaYXa8g+sRuQWUyg+/FqpTH9OEoGpuAjk=
X-Google-Smtp-Source: AGHT+IFTa6AUo8YGThRRtKjSHjpALqvs56DSmtO34KA77It9bSY9eo+tp2QfZnFxYx9KevR2d+AoL9gNtc1jHFksSmA=
X-Received: by 2002:a17:906:cc16:b0:9a1:870e:cc9d with SMTP id
 ml22-20020a170906cc1600b009a1870ecc9dmr14271003ejb.18.1692974492214; Fri, 25
 Aug 2023 07:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGs4p0xXJjsNug45CFiP0n-5h7wpdy22YBryjrnWFROESg@mail.gmail.com>
 <29c7-64e8bc00-3-6afffd8@162524261>
In-Reply-To: <29c7-64e8bc00-3-6afffd8@162524261>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Aug 2023 07:41:19 -0700
Message-ID: <CAF6AEGsdR4XMQ73mwNEE-fntPFLbQrxmzdoWchjReoVXKexdVw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230825_074136_638075_69B7D673 
X-CRM114-Status: GOOD (  37.06  )
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

On Fri, Aug 25, 2023 at 7:34=E2=80=AFAM Helen Mae Koike Fornazier
<helen.koike@collabora.com> wrote:
>
> On Friday, August 25, 2023 11:30 -03, Rob Clark <robdclark@gmail.com> wro=
te:
>
> > On Fri, Aug 25, 2023 at 6:56=E2=80=AFAM Jani Nikula <jani.nikula@linux.=
intel.com> wrote:
> > >
> > > On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrot=
e:
> > > > Force db410c to host mode to fix network issue which results in fai=
lure
> > > > to mount root fs via NFS.
> > > > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8=
c15c80a54dda510743cefd1c4b65b8
> > > >
> > > > Since this fix is not sent upstream, add it to build.sh script
> > > > before building the kernel and dts. Better approach would be
> > > > to use devicetree overlays.
> > > >
> > > > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > > > ---
> > > >  drivers/gpu/drm/ci/build.sh | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build=
.sh
> > > > index 7b014287a041..c39834bd6bd7 100644
> > > > --- a/drivers/gpu/drm/ci/build.sh
> > > > +++ b/drivers/gpu/drm/ci/build.sh
> > > > @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
> > > >      fi
> > > >  fi
> > > >
> > > > +# Force db410c to host mode to fix network issue which results in =
failure to mount root fs via NFS.
> > > > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a62=
9b8c15c80a54dda510743cefd1c4b65b8
> > > > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr_=
mode =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > > > +
> > >
> > > It seems like a really bad idea to me to have the CI build modify the
> > > source tree before building.
> > >
> > > The kernel being built will have a dirty git repo, and the localversi=
on
> > > will have -dirty in it.
> > >
> > > I think it would be better to do out-of-tree builds and assume the
> > > source is read-only.
> >
> > We have the ${target_branch}-external-fixes mechanism to merge
> > necessary changes before building the kernel for CI.  Which is
> > necessary for a couple of reasons:
>
> Should we create an official topic/drm-ci-external-fixes branch ?

Hmm, maybe.. I guess as we expand this to more driver trees, and want
to be able to re-run CI in the drm tree after merges to
drm-next/drm-fixes, we maybe want to have central
drm-next-external-fixes and drm-fixes-external-fixes.  I guess we can
keep those based on drm-next and drm-fixes?  And if there would be
conflicts because, say, ${driver}-next is behind drm-next, then
${driver}-next could be rebased on drm-next?

BR,
-R

> Regards,
> Helen
>
> >
> > 1) patches like this which aren't appropriate upstream but necessary
> > due to the CI lab setup
> > 2) target branch if often based on an early -rc, and it isn't unheard
> > of to need some fix for some board or another which isn't appropriate
> > to land via drm-next
> >
> > We should use the -external-fixes branch mechanism for patches like thi=
s one.
> >
> > BR,
> > -R
> >
> > > >  for opt in $ENABLE_KCONFIGS; do
> > > >    echo CONFIG_$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> > > >  done
> > >
> > > Ditto for the config changes in the context here. Those are files in
> > > git, don't change them.
> > >
> > > Shouldn't this use something like 'scripts/config --enable' or
> > > 'scripts/config --disable' on the .config file to be used for buildin=
g
> > > instead?
> > >
> > >
> > > BR,
> > > Jani.
> > >
> > >
> > > --
> > > Jani Nikula, Intel Open Source Graphics Center
>

