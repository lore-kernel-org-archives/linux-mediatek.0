Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93890C47DDF
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWIGLVURJo4ZNOv6LbG+L2EJurKR+kNUUVg3etTCY74=; b=FDd3EyCRuYLILN/oZG6CJsseTx
	oliFRsoG9p66FwsDX5fJOniLY3nYBwiV9zQJQLVMHCpkWopBf95KzAxWpdkrRJ+vEUhxrGrpb4eAn
	iEPIILJBpE8TS1y+dYcE/nvj7mxDp1X/ZwdyAfEVhueg/hVMLPWA6s2bNTpsBVNxo6ATeSsvI49bI
	gsdjZOkIieeGGyZfN3ur1DLtLcva5pkIBBwtSgsFGgsPgR05Qz3mjqFn48TU2XHKkb4JUqyoojmRO
	g6dWtaGalyL4acyTr224MSGL3l9hIBNl8KatAp6wTg+vWX5v0Z73Je9+D5IUgh0xf+1KxJGqevqRe
	hLIyxGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8oz-000000037AD-04DI;
	Wed, 31 Jan 2024 11:32:01 +0000
Received: from mail-yb1-f169.google.com ([209.85.219.169])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV7o2-00000002n6x-2E3i
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Jan 2024 10:26:59 +0000
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc6c4a5bf2fso282443276.1
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Jan 2024 02:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706696816; x=1707301616; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWIGLVURJo4ZNOv6LbG+L2EJurKR+kNUUVg3etTCY74=;
        b=Y2cbSaVxJZMfWUL7OvCVRoJBJjooxhUCxAjaRA81qNEFC4RHiGlyBUf8sdgXsZTw3q
         nGaIHvepymfk3y3O7Q1G5ym5Anre/ObVtY+cGMsJWhGgqRA1ihfFqB6ZnIMpTyrmiqjG
         yafddICq/AjIBe+fn0yG2S0BGV8S13YfyTfaf/d6CBzuQQidOUYajnEuM692NIvulmCm
         dNKTieVAMv/i+Ad1CkCSphxAYx/onD+9LKlniE2UQQT4/uW3yGfibxKRHnc1twXAxXzT
         HmhtIkyMGLwGAgX5q6RCJk7JPga/YcQjJXSXp/91hIR5K0yZiVBk7IF+g4pB6KxM4POH
         Xpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696816; x=1707301616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWIGLVURJo4ZNOv6LbG+L2EJurKR+kNUUVg3etTCY74=;
        b=p13PicsS4Oz7wIr1cS4S18geW9Gb40X3Xiyd+FsYUqDPFMYLe9+ckRRAN6+0k4Vkt1
         AWUkPUx57zW4wuBAjD7bXxsNRFZ60Px518c9NnGnH+zS2nUMypak6EZZdO3vvrpHZqZp
         uJLq0Bf0/GrX4JbP7SEI+ZiaoFDF1hyGLXPXZwms9Rqq9Xw2I4yBNOeP7Vc9B2uRFhac
         xwHHDDB9P/V44UGhbqsJEXQwVdDhn/L2zr1B0pL0anyOwfZ+HO98HKlm3xYudYfRqnV5
         Y1nI9bAbl4gw3+waXmv+JbGINNLrOhYcA4e6hvfcpEEHhutnOKLCArPoIbzaPtPjeF3y
         sn7Q==
X-Gm-Message-State: AOJu0YyDrJgIBeCV5Luz4leME0OTMudMneXvb1+9MHvpgrdWwmduoXNm
	kQ+DTwmtu8FgoUZkYoBEIfn2UEg5c3mrElq0uPWu6zM7jawBD1VfUNLViwJMfE6MDVVrTAv1wQs
	Skcwjom0NI85GVDzuIUyoGZ9JmAk1NFhhgGvxMA==
X-Google-Smtp-Source: AGHT+IEqJVgu4nIRdtbsrRTsERmdIoAZnatopWJ6POWGE249ajHq/UFYIvx+LLtNTS6kTpwKklekHqS/zpNcV+La09M=
X-Received: by 2002:a25:2fc2:0:b0:dc6:c669:9914 with SMTP id
 v185-20020a252fc2000000b00dc6c6699914mr444876ybv.15.1706696816245; Wed, 31
 Jan 2024 02:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat> <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local> <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
In-Reply-To: <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 12:26:45 +0200
Message-ID: <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"michel@daenzer.net" <michel@daenzer.net>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"mikita.lipski@amd.com" <mikita.lipski@amd.com>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"maxime@cerno.tech" <maxime@cerno.tech>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, 
	"nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, 
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "sean@poorly.run" <sean@poorly.run>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "fshao@chromium.org" <fshao@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"jani.nikula@intel.com" <jani.nikula@intel.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_022658_609305_E17A4C8B 
X-CRM114-Status: GOOD (  35.41  )
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

On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > >
> > > External email : Please do not click links or open attachments until
> > > you have verified the sender or the content.
> > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
> > > > Hi Maxime, Daniel,
> > > >
> > > > We encountered similar issue with mediatek SoCs.
> > > >
> > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > disabling
> > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > drm_atomic_wait_for_vblank() is set to true.
> > > > As the result, we are not actually waiting for a vlbank to wait for
> > > our
> > > > hardware to close the cursor plane. Subsequently, the execution
> > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > > buffer. This can lead to use-after-free issues with our hardware.
> > > >
> > > > Could you please apply this patch to fix our problem?
> > > > Or are there any considerations for not applying this patch?
> > >
> > > Mostly it needs someone to collect a pile of acks/tested-by and then
> > > land
> > > it.
> > >
> >
> > Got it. I would add tested-by tag for mediatek SoC.
> >
> > > I'd be _very_ happy if someone else can take care of that ...
> > >
> > > There's also the potential issue that it might slow down some of the
> > > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > > think
> > > all the drivers where this matters have switched over to the async
> > > plane
> > > update stuff meanwhile. So hopefully that's good.
> > >
> >
> > I think all the drivers should have switched to async plane update.
> >
> > Can we add the checking condition to see if atomic_async_update/check
> > function are implemented?
>
> Pretty sure not all have done that, so really it boils down to whether we
> break a real user's use-case. Which pretty much can only be checked by
> merging the patch (hence the requirement to get as many acks as possible
> from display drivers) and then being willing to handle any fallout that's
> reported as regressions for a specific driver.
>
> It's a pile of work, at least when it goes south, that's why I'm looking
> for volunteers.

I can check this on all sensible msm generations, including mdp4, but
it will be next week, after the FOSDEM.

BTW, for technical reasons one of the msm platforms still has the
legacy cursor implementation might it be related?

>
> Note that handling the fallout doesn't mean you have to fix that specific
> driver, the only realistic option might be to reinstate the legacy cursor
> behaviour, but as an explicit opt-in that only that specific driver
> enables.
>
> So maybe for next round of that patch it might be good to have a 2nd patc=
h
> which implements this fallback plan in the shared atomic modeset code?
>
> Cheers, Sima


--=20
With best wishes
Dmitry

