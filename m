Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5095C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 May 2023 10:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IkIBPBoGiDSQsWolC8T9ubMUvq9Vyba3bk7PEDWactk=; b=Q45EjsxW3tWac7SGsiI9OGc93C
	GiPzzMnuurMuhhioSlaV8NtWJs0u1Dc5FnZgn6bBE41DXBUqj15u5dDZB712a2+nasbWP6Bs5iuYk
	q8RN9Ef5g0gx+SzHOhrBrD7aZ82AGh84jG2umzZrgXQfRjAO9OuUs7JoGCK7ezLHydCIfzEtPO2Zr
	qbUQPMSgRb6nvtoYJnPce3UJAOfusbTX4kjyAdVwBai/hmsNZiX+LulP1fOkLK8ZDiT2F5EHO5RU4
	r6LswwCqA4vyCOXkp/Wtq2LGSNIRCGRgvxjTxuHrZm/1tmhPtp4LKUK5XhZcvSef8dg8V82G0RUuL
	4IVRXoiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1liP-00D5vC-2q;
	Wed, 24 May 2023 10:27:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1liM-00D5tD-1e;
	Wed, 24 May 2023 10:27:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A52B563BF5;
	Wed, 24 May 2023 10:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9780C433B3;
	Wed, 24 May 2023 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684924048;
	bh=Ru0fWfqqlX6KQv5nM4MMh2953U7nWaI2cFpOL79ZxOU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ou3dXMmmPknNr2EpgEOhpDzxeenu+FqECpv0vDlyeCIAqxkkvc8omfRowZI9qL48y
	 qNboz4BBDS0oAYCxUfsAjuUpmemUoTPXEe4GkBjgypmE3BTYcgI2CvjvOIpvX5PV+j
	 JcdFpPZhd58XXhMkyxR4poMWU0nEkvRzm7yrIZ3/2LAzZoOnGAB30mjep9cIH4lz0x
	 DwNb/vZTUGgA44zsH8NtXvrLWGDSeUyPbrb4CkFeUE9oKfS4yHu6pFV4i9nMHIf8Cs
	 uNTd7+kDg2Txb8WPRjbfDLH+dnxZBEu5pmUV3H7f9zDLUxWvV9S/dZih7PQoDz4PpF
	 gXGrI5yvj9X9g==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-561c1436c75so10613817b3.1;
        Wed, 24 May 2023 03:27:28 -0700 (PDT)
X-Gm-Message-State: AC+VfDztMd8+AElqId4iZUJsjf+V/2vb7g197M30ghOPx4h9Fut4pPLz
	bTiyQKRaID5/Muv5Lo75PdXFpqc6OkzaS1oF090=
X-Google-Smtp-Source: ACHHUZ5blUe2/ANdrbIUSBlAoc9jfa/cZWRA1ZwikgWcjIP8zS77ACL+X48iAferYBWCpvxnTrwKVSnp1f7b/AK/qBY=
X-Received: by 2002:a0d:fa82:0:b0:55a:18c0:daba with SMTP id
 k124-20020a0dfa82000000b0055a18c0dabamr17616723ywf.50.1684924047318; Wed, 24
 May 2023 03:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230517145237.295461-1-abailon@baylibre.com> <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
 <7ha5xud3m7.fsf@baylibre.com>
In-Reply-To: <7ha5xud3m7.fsf@baylibre.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Wed, 24 May 2023 13:27:00 +0300
X-Gmail-Original-Message-ID: <CAFCwf10hNjGtEYDi24LREnMLRGT7mRECvqQMdZWv=-uA7YELYg@mail.gmail.com>
Message-ID: <CAFCwf10hNjGtEYDi24LREnMLRGT7mRECvqQMdZWv=-uA7YELYg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
To: Kevin Hilman <khilman@baylibre.com>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Alexandre Bailon <abailon@baylibre.com>, airlied@gmail.com, 
	daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	bero@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, christian.koenig@amd.com, 
	linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, 
	linux-mediatek@lists.infradead.org, nbelin@baylibre.com, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_032730_647100_6D923423 
X-CRM114-Status: GOOD (  30.05  )
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

On Wed, May 24, 2023 at 2:34=E2=80=AFAM Kevin Hilman <khilman@baylibre.com>=
 wrote:
>
> Jeffrey Hugo <quic_jhugo@quicinc.com> writes:
>
> > On 5/17/2023 8:52 AM, Alexandre Bailon wrote:
> >> This adds a DRM driver that implements communication between the CPU a=
nd an
> >> APU. The driver target embedded device that usually run inference usin=
g some
> >> prebuilt models. The goal is to provide common infrastructure that cou=
ld be
> >> re-used to support many accelerators. Both kernel, userspace and firmw=
are tries
> >> to use standard and existing to leverage the development and maintenan=
ce effort.
> >> The series implements two platform drivers, one for simulation and ano=
ther one for
> >> the mt8183 (compatible with mt8365).
> >
> > This looks like the 3 existing Accel drivers.  Why is this in DRM?
>
> Yes, this belongs in accel.  I think Alex had some issues around the
> infra in accel with device nodes not appearing/opening properly, but
> I'll let him comment there.  But either way, the right approach should
> be to fix any issues in accel and move it there.
>
> [...]
>
> >>   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
> >>   drivers/gpu/drm/Kconfig                       |   2 +
> >>   drivers/gpu/drm/Makefile                      |   1 +
> >>   drivers/gpu/drm/apu/Kconfig                   |  22 +
> >>   drivers/gpu/drm/apu/Makefile                  |  10 +
> >>   drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
> >>   drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
> >>   drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
> >>   drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++=
++
> >>   drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
> >>   include/uapi/drm/apu_drm.h                    |  81 +++
> >
> > "apu" seems too generic.  We already have 3 "AI processing units" over
> > in drivers/accel already...
>
> Indeed, it is generic, but that's kind of the point for this driver
> since it's targetted at generalizing the interface with "AI processing
> units" on a growing number of embedded SoCs (ARM, RISC-V, etc.)  In
> addition, the generic naming is intentional because the goal is bigger
> than the kernel and is working towards a generic, shared "libAPU"
> userspace[1], but also common firmware for DSP-style inference engines
> (e.g. analgous Sound Open Firmware for audio DSPs.)
>
> As usual, the various SoC vendors use different names (APU, NPU, NN
> unit, etc.)  but we'd like a generic name for the class of devices
> targetted by this driver.  And unfortunately, it looks like the equally
> generic "Versatile processing unit" is already taken Intel's
> drivers/accel/ivpu. :)
>
> Maybe since this is more about generalizing the interface between the
> CPU running linux and the APU, what about the name apu_if?  But I guess
> that applies to the other 3 drivers in drivers/accell also.  Hmmm...
>
> Naming things is hard[2], so we're definitly open to other ideas.  Any
> suggestions?
Maybe model it according to the tiny driver in drm display ? You can
then call it tiny_apu :-)
Disclosure: It was Daniel's suggestion, he can chime in with more
details on the tiny driver concept.
Oded

>
> Kevin
>
> [1] https://gitlab.baylibre.com/baylibre/libapu/libapu
>
> [2]
> "There are 2 hard problems in computer science: cache invalidation,
>  naming things and off-by-1 errors."
>  -- https://twitter.com/secretGeek/status/7269997868
>

