Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5E8DC001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jul 2023 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoBzPwja36fkGB2m2EIbRi55n5XYr4VNaYPCpY7zeKs=; b=HHNDECaIqDDkAWE7KeN9uNsmw9
	wNrH67aL88dDw3krh08Q8DMaKrcScOBFXcLMlOZDKoFfGGGxnAIEvoGKdtYQkgfHN1wsgpJ1Bl47r
	uQxty7VExWI66Z8CXhhk025qHMoOwirP/NiY+N39tsMdP6bISsQTsBMuL+yHo+OdUuiAh97p32UXM
	UR9zTFU+qc5uvHc/u1MQaQsJqlMI/05bmPzeRZodl57yh5YpXYM2gkZPz5ZJIGpFF6eliysBvJWh1
	gegMph/TL1KuEIsziU4l4Xel+vQQ6yk5ZGqClxvJpEWQU0gFZx/vs2nfvejNmymqxTCutIU4Slgia
	KKJHn9Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPObJ-003inl-30;
	Fri, 28 Jul 2023 14:37:53 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPObF-003ilp-2P;
	Fri, 28 Jul 2023 14:37:51 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fe04882c66so3856404e87.3;
        Fri, 28 Jul 2023 07:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690555064; x=1691159864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoBzPwja36fkGB2m2EIbRi55n5XYr4VNaYPCpY7zeKs=;
        b=mH17P6vfTfQdoT14pC3A4FfDJ2VBrkghAG4nBuM7YP9r7FzJpwrAFXB5UMTvtqhF40
         XHnTn9QeyjMKGzDXjQG0c4Tthbnl8t35Fbo4n0fUp5eVbJ8S11AC+mfrG/aPvVGubjpv
         jcunb7H8In7x+NbtE3ATP0FXQh2giufFWcsNZQpuzRCASB4ZZzp/+9+VsRFyxq7TerlQ
         B+DbL/+fE4gdv7uvDxokIcRTP7edsXWY1QHw87YUGF1qk1FfE0wcZmB6VBIGvlKbqDz5
         HQ1cwr6QXDanyk/pTVPTws4QTPAuqgF5F7qbF5rszCMz9nMXITHPXWMZeujKdSciAojn
         hIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690555064; x=1691159864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoBzPwja36fkGB2m2EIbRi55n5XYr4VNaYPCpY7zeKs=;
        b=duCiyL36JEFhwXAePVa+zI6i5wmuoaabKGDCgZcSH/KSwwV1jrYjKZRLlZdV/XHYnE
         K1yIvOFXJPPtFHOgRlbokkUR5ZQiQDqKxQdmFW81EYc7ruPP7KajYLzHbXWxP2IFNWnp
         1OWvLYIxHgPOQPO016kpQn8FidKN7MvnFLLJ0sBjNHExoRJRBm8B3jprh4f75Ng6U7eD
         wfpqBVpVsVrCMK99vEDzuxZzamIFcdpot+v3YGG0NRRr4Re5iAtQzOfypyU64VrNEwQd
         Y5eUBi91LDoWvqRTYxKxfqLXllyOTBbd1V63/SMMfVFYHIejNfKz3P5hEj3z941sfaZ+
         lBcg==
X-Gm-Message-State: ABy/qLZU+pa24Oi0Os66mFR7y4yJlLOB0JnBdIBHyE5MyHY8SzHpxP5h
	GgG+FAS+8fJlb+UjPMslxd8OxoyPeCzEuOFPas4=
X-Google-Smtp-Source: APBJJlGUbR0qC9paIuIRHruH4iJ3Oi11S/UE+z1ge7FEfFZqlKQmVxkAQlUoMKoxelzsZCTu0j9nGxem/4l8cRw0JdU=
X-Received: by 2002:a05:6512:2083:b0:4fd:f590:1ff7 with SMTP id
 t3-20020a056512208300b004fdf5901ff7mr1806954lfr.40.1690555063602; Fri, 28 Jul
 2023 07:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com>
 <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com> <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
In-Reply-To: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 28 Jul 2023 07:37:31 -0700
Message-ID: <CAF6AEGtan-bQ7syKAwOKDY=044aKu26SLPQ0j1ieLqXNyQQS3g@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To: Daniel Stone <daniel@fooishbar.org>
Cc: Helen Koike <helen.koike@collabora.com>, emma@anholt.net, linux-doc@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20230728_073749_783045_328D7A7B 
X-CRM114-Status: GOOD (  20.51  )
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

On Thu, Jul 27, 2023 at 10:26=E2=80=AFPM Daniel Stone <daniel@fooishbar.org=
> wrote:
>
> On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > > I did run into a bit of a chicken vs. egg problem with testing the "i=
n
> > > tree" version (compared to earlier versions which kept most of the ym=
l
> > > and scripts in a separate tree), is that it actually requires this
> > > commit to exist in the branch you want to run CI on.  My earlier
> > > workaround of pulling the drm/ci commit in via
> > > ${branchname}-external-fixes no longer works.
> >
> > After unwinding some more gitlab repo settings that were for the
> > previous out-of-tree yml setup, I have this working.
> >
> > Tested-by: Rob Clark <robdclark@gmail.com>
> > Acked-by: Rob Clark <robdclark@gmail.com>
>
> And it's also:
> Acked-by: Daniel Stone <daniels@collabora.com>
>
> It's been back and forth a few times by now and reviewed pretty
> heavily by all the people who are across the CI details. I think the
> next step is to answer all the workflow questions by actually getting
> it into trees and using it in anger. There was some discussion about
> whether this should come in from drm-misc, or the core DRM tree, or a
> completely separate pull, but I'm not sure what the conclusion was ...
> maintainers, thoughts?

I'd prefer a separate pull, so that I could merge it into msm-next as
well without having to pull in all of drm-misc

Possibly some other driver trees would like to do similar?

BR,
-R

