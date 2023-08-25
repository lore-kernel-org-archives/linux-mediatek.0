Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B966AC3DA66
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TKRKdJyVPQnXrud/UFhZyJn/bFLsStYMULRC9lmJOg=; b=HTewYFiqVyJc8dhh3seaAYheGD
	WpT4DJE4R4lKFi/GuFn3Uul48L6/ZdKyLBbXvrawskh8eLDl+ERrwd9vWMLnxjyqcS/Wd+04BR7iv
	ilucqacai3/MhOarxhY4yRygyODVjt0EbG8GUsuBe45GTL7v0pen3ieP+9VKEbuYVYTKDpzfxTMo9
	SQ4o4BIwmFj9Kwi6dIg+5+UiZ97XH9+NadMouFaJ5ZYxHOv6/VDC+2ce3WIVidGnl6WlrclfTn3M2
	AygdGI8GQvPuOEOJSJCtPDFlWEfXLDE8XtKgaKvjqs/KK24YOEHX0ifrS78Ty46F4K+Gmypb3JZ7Y
	QBKXcQuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXpb-005bV2-1W;
	Fri, 25 Aug 2023 14:30:35 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXpX-005bTd-35;
	Fri, 25 Aug 2023 14:30:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-99bcc0adab4so125421566b.2;
        Fri, 25 Aug 2023 07:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692973829; x=1693578629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TKRKdJyVPQnXrud/UFhZyJn/bFLsStYMULRC9lmJOg=;
        b=OQXrYSh/ZTaRcrWWA0vglXPp3TlsL1Ma7vpCxlFdwF1lEPdbMdGQ/tKMaMonLuwtO5
         JABJFdxaAHTAHmpQ686SHGkxHl979MSfAFLV+3B5HIinjzcPUGnuPBGRlMn6pbEscsw4
         b0PqksMuIqStaAEvnyVczSfPUB69oWqBDHLqH0RNamea7U8iC2tZ6nNFXK2HuYAt/32n
         2kynjPi6lEJRwFgree9ATo/CaHaPlGM78Qu24dsK7wKNCKVFgt5H/HBeLRbk++6K2c1l
         0MoGgedsO6+4cm5hC27BUve7gq5G1M1pu2ApSyFKqsJXzh2yWo+9u/FQYYSPKg4EXygz
         Vhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692973829; x=1693578629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TKRKdJyVPQnXrud/UFhZyJn/bFLsStYMULRC9lmJOg=;
        b=JOeWGbWVf9Fs79I5NHT/azBNyK4bc2PM5HHta/tN5Rm00ptyS+TnBuNNABGld2dN+v
         y6GEBBMVwxvotj4Jb4DTEs9Uu/lbG43jO4V/9DR6R/+aOknfdgs5bINjflNZ7LdMlwXy
         wfx0onKNnHaXVkPpU2HAzPQ6K3njgNzu8Ut/UeBg63OGKoOiZx6KrVySHAdmkU9h4OyU
         VsTpt6mXhsOq8vCi/dj2+KsJaXytKsfb8AiYRFc0qn0jER9/k8NLo80GLlyWKqrAyiIu
         IBzcvBX9RohUL3KXw1lStQQCetDJrXMhv8CQSxGgsg+qt8Q5TNaU06mxH+Wc9Se7uiqF
         Ukpg==
X-Gm-Message-State: AOJu0YywpMicmWk4f6kks0udNFyTyFj0RvwabApP5RTEeTP7lY6YDjJY
	cFaqVB2MG3A1fTTxaCETUwlLBdO4FSOjQSSAhUU=
X-Google-Smtp-Source: AGHT+IEES/Rzsyvr1JvufABrAQWEAlPgt7MuBwIREScZLrLGFwNRoIXbaWrIdhd46oBepXht/zkQv0lQ0dAVqCGxlr0=
X-Received: by 2002:a17:906:150:b0:9a1:d79a:418e with SMTP id
 16-20020a170906015000b009a1d79a418emr6028363ejh.40.1692973829204; Fri, 25 Aug
 2023 07:30:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230825122435.316272-1-vignesh.raman@collabora.com>
 <20230825122435.316272-3-vignesh.raman@collabora.com> <87pm3b2pkz.fsf@intel.com>
In-Reply-To: <87pm3b2pkz.fsf@intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 25 Aug 2023 07:30:17 -0700
Message-ID: <CAF6AEGs4p0xXJjsNug45CFiP0n-5h7wpdy22YBryjrnWFROESg@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: ci: Force db410c to host mode
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
	emma@anholt.net, linux-doc@vger.kernel.org, david.heidelberg@collabora.com, 
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com, robdclark@google.com, 
	corbet@lwn.net, khilman@baylibre.com, sergi.blanch.torne@collabora.com, 
	gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org, 
	daniels@collabora.com, martin.blumenstingl@googlemail.com, 
	robclark@freedesktop.org, helen.koike@collabora.com, anholt@google.com, 
	linux-mediatek@lists.infradead.org, mripard@kernel.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, 
	guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org, 
	tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_073032_003661_748DCC12 
X-CRM114-Status: GOOD (  29.64  )
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

On Fri, Aug 25, 2023 at 6:56=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 25 Aug 2023, Vignesh Raman <vignesh.raman@collabora.com> wrote:
> > Force db410c to host mode to fix network issue which results in failure
> > to mount root fs via NFS.
> > See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c=
80a54dda510743cefd1c4b65b8
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
> > diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> > index 7b014287a041..c39834bd6bd7 100644
> > --- a/drivers/gpu/drm/ci/build.sh
> > +++ b/drivers/gpu/drm/ci/build.sh
> > @@ -70,6 +70,10 @@ if [ -z "$CI_MERGE_REQUEST_PROJECT_PATH" ]; then
> >      fi
> >  fi
> >
> > +# Force db410c to host mode to fix network issue which results in fail=
ure to mount root fs via NFS.
> > +# See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c=
15c80a54dda510743cefd1c4b65b8
> > +sed -i '/&usb {/,/status =3D "okay";/s/status =3D "okay";/&\n\tdr_mode=
 =3D "host";/' arch/arm64/boot/dts/qcom/apq8016-sbc.dts
> > +
>
> It seems like a really bad idea to me to have the CI build modify the
> source tree before building.
>
> The kernel being built will have a dirty git repo, and the localversion
> will have -dirty in it.
>
> I think it would be better to do out-of-tree builds and assume the
> source is read-only.

We have the ${target_branch}-external-fixes mechanism to merge
necessary changes before building the kernel for CI.  Which is
necessary for a couple of reasons:

1) patches like this which aren't appropriate upstream but necessary
due to the CI lab setup
2) target branch if often based on an early -rc, and it isn't unheard
of to need some fix for some board or another which isn't appropriate
to land via drm-next

We should use the -external-fixes branch mechanism for patches like this on=
e.

BR,
-R

> >  for opt in $ENABLE_KCONFIGS; do
> >    echo CONFIG_$opt=3Dy >> drivers/gpu/drm/ci/${KERNEL_ARCH}.config
> >  done
>
> Ditto for the config changes in the context here. Those are files in
> git, don't change them.
>
> Shouldn't this use something like 'scripts/config --enable' or
> 'scripts/config --disable' on the .config file to be used for building
> instead?
>
>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel Open Source Graphics Center

