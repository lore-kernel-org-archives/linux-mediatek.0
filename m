Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CCBCD4F3C
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 00:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=; b=Iqc5EK2c6CF0KopjQFuexqJUR3
	hL0WN2xXRbhR2GGbbs1uiZALfhQGgjpuEQLKiAiwOLJi7MNxoq9S7Aeu6QsMvaenLnnWKF/oVn0Mf
	sR/zi8tWMHhe/ek7wR6+C0HJ4JqQXBJhVx4r0/GHU97Z8KJax8CcJfkgkCq4XkFgy87CBoaw5tC18
	rARQvogLn3MTCEAwudAm1qLS46KbJGR2oMe8luK7OE83NRAzZpFildyMWfXUail0k/2HQBUpEOQYY
	YE6n1VKI9tkskaZFkW1zB1gNrzuV3SM+uoGVERhvFmZ9g5xoLIrUCYNNNWjbkfHn5GntMi62/gijA
	LU3G535Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8S6-0000000HHNY-2eRN;
	Tue, 19 May 2026 00:36:54 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP8S4-0000000HHMZ-1oXP
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 00:36:53 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7cb345cb5bfso18876037b3.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 May 2026 17:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779151011; cv=none;
        d=google.com; s=arc-20240605;
        b=BfSUo8t0YR5xJ4RF/zORmkz51ZIpPSckI9OGNHqFd7mlYOKGrO2oXLhA3DvG01nIdj
         3dUEs7hnETCyYUIF/7rvIYY8LtYp3+pWlYV3FFmL2Dh77bkErUL6VmX93LVaow0nq3qD
         WYK59gMJXMx14yB7BsMilh/F2jL93USwVxzfagpdouG90Cesm6LL2D8GU/5xR01Koc+Y
         KaNQo+Dv24SCj5bnXgHaGConLmilUTYTthzks7QZQXWxDOBtQNHUDrEW6OAwl00z3S3k
         Hw5HiszSSfWvUrLU3/G3s5K2bTC/Lb4eg6F7ceGbd3f1+A11XS0vUseEw5oOOOwJ1Udo
         fM3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        fh=1u3cyhDFCs7O4uldV+vGxpyusPWdSy+8sq/fI4jFum8=;
        b=ZSuq8BwGPQwBdCDFWIx361X5lvAK3yDyXxvd152M3zjs5bEY6/zm+sS74uka9vfdsk
         Ak4mK9lJJ7LFo4qNIbv8Z2nVi4+KbBDQ2QkTRBwdtwIjo7mPp12f0nBsZ+8q51SQzxvw
         017Eq+QnPqlHuFwsEhkCQ586UrhL7UqnHYwnCQ5NKoiVzdvu+J1q53FELyf88ULcbhA7
         wx+XTlGmsb+UNR7AVCUIgnKwPG1Ox/6rX9BP73VduY7f5J8G3KTFay5xkVSBcPbbDhQR
         L+jNp34QURdM05zYPFFidNMnW0atIQLNMtRTnRovx0QwQ3XrQAA2fg7ORHa780e2Z3CZ
         pZIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779151011; x=1779755811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=YKDwSMkhfEahul8Wo3lcbPSn2hw3zgQiv26Rkot+h2v96ujLRXF4B70aBIkwjHumTe
         1+r5+choEsTrEoSQi9zRgf56RXWQq58wEcXVcCEFQ5lDGUmpbD65OsVZx9Km266zsdK7
         L0xc7DChn3O86AMa2R9FJJnuOqyNK7ILIj4R0qexJgLqrHzmLoZrRXzl5moI8S+g8CrO
         RIiyDm3jBK7eWob4lwd2cccKlL3jyVv4lbMWAtURc/FRRlCN/R8OIsaeSsscEJ2+ZtuV
         RYBpO0w8KplL1oluI19f/NzbiWXs/FaMK51S33wqYOXtAa0x0VRjc42SnJPAwbrVKt9S
         j5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151011; x=1779755811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e+1ZOpCnfvlGWakwJXz2+pZiiMxmIhCH5N4QtF0t85s=;
        b=AeXEGQHVXEsBJC/ed1QySRm/fBodlJ0jeRdVAwwonM0TLCb2oXu+ThK+KRyiPQCEEQ
         7hTjmgkL237cfR3Fk12ACjp+urU02tVaEnLM0TtrJxPpuCky4M2OSaqwJqUT83MApkz0
         uHHntHXcG3eV6hUyX67S13+ovPu3j+Ponhcc4UnsSZ2pH7DEsbNRh/Cua6G7bU/NMjFK
         qNGPwitG+fCmxcbQieurZNKtyTE0SK/206aOpoPeklPzT3qM2HO30AXTJnOOqXh1Z5yt
         /O87VnV+PXi1e070vqV95uhPz2LzaX4BpQzW2L7hyavE7NdOvsE0i8NRHVJ60+e+G0Ps
         D/9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+CIgUHeAzr1agmWMSW2fkl2VwkCfbhokOPGcxf0hrLNOV9EXU03lEqV7l3qu39Fv5W1MHvIw63byXgvVNYug==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6xINGvYN9x1Jjdq+7KrK+/kApUd8zaW0PqBHkPClqSXxOBaxl
	1cvpE0dpI919Xc4HAxKUgiuDLDGBGnEb9CXqhpvK3tm2vAXhEleh7xX1T/v93BUfmoHkB2ZEz+o
	k65Ts/eYKbXwYMUw40W/kdKIJxh4hZN8=
X-Gm-Gg: Acq92OEfqv831LBCl8Z6/UJF1gXPgyfkoDcR1aHaY37Tn+gcMcYL9EVdzKBw9giHApd
	pLhtlBLnv5akgzZNoXYFfrgiF6zvCle3Wtk1FX26j0G5ADkRUQSWGYF7evDurtzyYG5avThaylN
	aIqYt6e5NshyqtM2cMNkRodKoSgnMg0hNM/Y3smLlct2DPQtTiRiRsZGl6ZQEhqTqku0me3/hH9
	7JgC+0qbeLG/PJHPrztRlmld0ia/dZFYiJ+nKNfSu1w46go4zItj5yr/IbvFJvLqTad51TSDqhw
	dqkw81eh6iGYaS2Xwttq/4jCWd5DUyG7ljVF5Z/Q14plzw6+RApcfl0slg9hdrPR7xYc4BXo
X-Received: by 2002:a05:690c:19:b0:7bd:5cc4:3e49 with SMTP id
 00721157ae682-7c9597a969fmr213746077b3.12.1779151010945; Mon, 18 May 2026
 17:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora>
 <agNJasayW8VCHTiU@e142607> <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
 <20260518091650.5a7a4f4a@fedora>
In-Reply-To: <20260518091650.5a7a4f4a@fedora>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Mon, 18 May 2026 17:36:40 -0700
X-Gm-Features: AVHnY4L_pqXJyhSchHbjEJHIXbJa2yYodKfZcbmSmhWAfddYBdzbaPZTcjMiQrU
Message-ID: <CAPaKu7R9ET767qc3eppBUfG2RAeyrg7E-gE0turgp-u_FU4+Vg@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, =?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_173652_489565_4BA90113 
X-CRM114-Status: GOOD (  54.46  )
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

On Mon, May 18, 2026 at 12:16=E2=80=AFAM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Wed, 13 May 2026 12:31:32 -0700
> Chia-I Wu <olvaffe@gmail.com> wrote:
>
> > On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.co=
m> wrote:
> > >
> > > On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > > > On Tue, 12 May 2026 14:47:27 +0100
> > > > Liviu Dudau <liviu.dudau@arm.com> wrote:
> > > >
> > > > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > > > >
> > > > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wro=
te:
> > > > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panth=
or_device *ptdev)
> > > > > > > > >                     return ret;
> > > > > > > > >     }
> > > > > > > > >
> > > > > > > > > +   /* If a protected heap name is specified but not foun=
d, defer the probe until created */
> > > > > > > > > +   if (protected_heap_name && strlen(protected_heap_name=
)) {
> > > > > > > >
> > > > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() =
fail is the
> > > > > > > > name is "" already?
> > > > > > >
> > > > > > > If dma_heap_find() will fail, then the whole probe with fail =
too.
> > > > > > > This check prevents that.
> > > > > >
> > > > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > > > currently probe and boot the FW even though we never setup the
> > > > > > protected FW sections, so why should we defer the probe here? C=
an't we
> > > > > > just retry the next time a group with the protected bit is crea=
ted and
> > > > > > fail if we can find a protected heap?
> > > > >
> > > > > The problem we have with the current firmware is that it does a n=
umber of setup steps at "boot"
> > > > > time only. One of the steps is preparing its internal structures =
for when it enters protected
> > > > > mode and it stores them in the buffer passed in at firmware loadi=
ng. We cannot later run the
> > > > > process when we have a group with protected mode set.
> > > >
> > > > No, but we can force a full/slow reset and have that thing
> > > > re-initialized, can't we? I mean, that's basically what we do when =
a
> > > > fast reset fails: we re-initialize all the sections and reset again=
, at
> > > > which point the FW should start from a fresh state, and be able to
> > > > properly initialize the protected-related stuff if protected sectio=
ns
> > > > are populated. Am I missing something?
> > >
> > > Right, we can do that. For some reason I keep associating the reset w=
ith the
> > > error handling and not with "normal" operations.
> > I kind of hope we end up with either
> >
> >  - panthor knows the exact heap to use and fails with EPROBE_DEFER if
> > the heap is missing, or
> >  - panthor gets a dma-buf from userspace and does the full reset
> >    - userspace also needs to provide a dma-buf for each protected
> > group for the suspend buffer
> >
> > than something in-between. The latter is more ad-hoc and basically
> > kicks the issue to the userspace.
>
> Indeed, the second option is more ad-hoc, but when you think about it,
> userspace has to have this knowledge, because it needs to know the
> dma-heap to use for buffer allocation that cross a device boundary
> anyway. Think about frames produced by a video decoder, and composited
> by the GPU into a protected scanout buffer that's passed to the KMS
> device. Why would the GPU driver be source of truth when it comes to
> choosing the heap to use to allocate protected buffers for the video
> decoder or those used for the display?
I don't think the GPU driver is ever the source of truth. If the
system integrator wants to specify the source of truth (SoT) from
kernel space, they should use the device tree (or module params /
config options). If they want to specify the SoT in userspace, then we
don't really care how it is done other than providing an ioctl.
Panthor is always on the receiving end.

If we don't want to delay this functionality, but it takes time to
converge on SoT, maybe a solution that is not a long-term promise can
work? Of the options on the table (dt, module params, kconfig options,
ioctls), a kconfig option, potentially marked as experimental, seems
like a good candidate.

>
> >
> > For the former, expressing the relation in DT seems to be the best,
> > but only if possible :-). Otherwise, a kconfig option (instead of
> > module param) should be easier to work with.
> >
> > Looking at the userspace implementation, can we also have an panthor
> > ioctl to return the heap to userspace?
>
> Yes, it's something we can add, but again, I'm questioning the
> usefulness of this: how can we ensure the heap used by panthor to
> allocate its protected FW buffers is suitable for scanout buffers
> (buffers that can be used by display drivers). There needs to be a glue
> leaving in usersland and taking the decision, and I'm not too sure
> trusting any of the component in the chain (vdec, gpu, display) is the
> right thing to do.
The heap returned by panthor is only for panfrost/panvk. It says
nothing about compatibility with other components on the system.

