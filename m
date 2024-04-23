Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA173C4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 12:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdEuS8XRlyMWs8i+nahfC/xh1vWX2u7uUNV94NmtyxI=; b=NqLtEC71KIIkf2AUSGcQGTtgcc
	ysTSD6m6EBMtNBb7imS7qaH9nNEaiBcyHKIJfZGjl8WyyRYsaaC8uoVHME8H+N6MfGRnrk7TFL6KK
	re5ik4KQTdyKonXlxhhsJI4iHd+AA5oWQ0OVZNcALYhMvhrA1DY+P2UCimqnblyUAMMPUv9GVo6F9
	5o0iK4lhlNbVMCNRr9dGGG88E79H+r9IkWl+sW4OxTr9Ph4n3kTF9RtWJy7gxvEBQAAP3l35jOayd
	q72T1KUbSWtyLRO0mug55dY8XB1hhx429rgtes+QtRZXwXrJsBSEN8Rmdl2zv+ULoDSAw0+vJUWyg
	mtPU2p9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFBH-0000000HMZF-2OE4;
	Tue, 23 Apr 2024 12:23:27 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzFBE-0000000HMWF-1H9M
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Apr 2024 12:23:26 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-de45385a1b4so5240885276.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Apr 2024 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713874997; x=1714479797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdEuS8XRlyMWs8i+nahfC/xh1vWX2u7uUNV94NmtyxI=;
        b=qB8vE3qUIxbf6A5nQ7ruJlmHhpmh5BrPY7iQ3Bez7lUxx96IuGzC+yYD/ELFEuMc35
         hf3HbvIVOPFuW1u4fVqUbo8RzlmOS4iPpkkN3bOd04MZzsxRBoWmh1uPCguDEekUWr7M
         4U5bIXfFSrI2FhIClMdTkyAF9c+I3WxkMQbdLLFmq0uq3l7y2hn2mJIPYRNb3Mbph0/D
         qsTfk63BEbuE6JR7yMfOb1f9RI82f416iL+tUvJw3wDnRHWrGI/5V/hsKdkd/GkbnEkQ
         vXRlTdGziy92UIJeH14hiQ+hqNfIdrccI0m0x7IpmYyvSJFLf8epXDIxH7jPdVpMsaS6
         Yfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713874997; x=1714479797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zdEuS8XRlyMWs8i+nahfC/xh1vWX2u7uUNV94NmtyxI=;
        b=Bw6o0vJih9ogNbqWulsNOcjN5+miduUcx1N/tlu+vR0U1EE/7NJg+AAZN5UYkDFOHN
         ifDiMkchnXfuVmRoZt+5X2M+cRfXjKaUBDcbeXBAISk3odvrY9NFti2JUvfFxQrTyHUr
         hRCAJDV8bD32NIt4YSdc9NIbzbrPJncSVkYwnuPhNTx4phg7l1xkzrJ96Dq2PTA5Rjz3
         Y7YwjB/GLeK+MS/3ujHjGYZml7Fi+F9gww0OuhVos4I+ElJjcfPvPLgt7IzsmjRpRnPE
         3dBH4fR7xRKo5VJMX+ETxn9mVgToJZimmbcHU/iO5Q+tWZUR1hZ9dm2YD8TczXbifw0L
         QvUw==
X-Forwarded-Encrypted: i=1; AJvYcCXW2ol7lTj6P19pyALfvND2rGeWwCHHA6RKrtH37U99MjQZWRzRycAvMZb0imRtztB9hj3SNod68kEol9O+M3vbKVRcL4lZNJah8AisFMuJxBIt
X-Gm-Message-State: AOJu0YzTVi2WpW7PdA79I9MPjIdJ8gkgSf7FRcGZXjRZpf3wPk9ZS+Sm
	8qsyVSuP9BYiaNgakWCq1rp0b8CPogBUyfYW4k7D2zY0yaU/deVf7cUkx7c9MMgTOTLVaP5WPSR
	I+Xqq4rf42I/+UBhlnXlTv63jSH4b3vx4Kj6zFg==
X-Google-Smtp-Source: AGHT+IFGEmHXL5CwAkBYa70XCoYWKwe8UnjgAcbc2h7iJmpsycDinZVPrwrOVKWCKX5O935DZ/QH6hClp73iSys2pzI=
X-Received: by 2002:a25:8251:0:b0:dc7:4067:9f85 with SMTP id
 d17-20020a258251000000b00dc740679f85mr12766959ybn.58.1713874997608; Tue, 23
 Apr 2024 05:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240423040243.448091-1-vignesh.raman@collabora.com>
 <20240423040243.448091-4-vignesh.raman@collabora.com> <e3a0ea8f-d306-488c-a69c-aa18078e5e03@igalia.com>
In-Reply-To: <e3a0ea8f-d306-488c-a69c-aa18078e5e03@igalia.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 Apr 2024 15:23:06 +0300
Message-ID: <CAA8EJppaaitcXkXSFTB4-S2CbBcrAVHouB0wWiU5Nw2FvpagqA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] drm/ci: uprev IGT and generate testlist from build
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Vignesh Raman <vignesh.raman@collabora.com>, dri-devel@lists.freedesktop.org, 
	daniels@collabora.com, helen.koike@collabora.com, airlied@gmail.com, 
	daniel@ffwll.ch, robdclark@gmail.com, david.heidelberg@collabora.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_052324_540511_B9D3747A 
X-CRM114-Status: GOOD (  15.03  )
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

On Tue, 23 Apr 2024 at 13:24, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> On 4/23/24 01:02, Vignesh Raman wrote:
> > Uprev IGT to the latest version and stop vendoring the
> > testlist into the kernel. Instead, use the testlist from
> > the IGT build to ensure we do not miss renamed or newly
> > added tests.
>
> Nitpick: wouldn't it be better to (1) stop vendoring the
> testlist into the kernel in one patch and then (2) uprev
> IGT to the latest version? I feel that this patch is changing
> a lot of different stuff.

Definitely. Otherwise it's hard to understand whether a change to
fails/flakes is caused by the uprev or by the testlist change. E.g. in
several cases the list of failing subtests seems to be replaced with
the test itself.

>
> Best Regards,
> - Ma=C3=ADra
>
> >
> > Skip kms tests for panfrost driver since it is not a kms
> > driver and skip driver-specific tests. Update xfails with
> > the latest testlist.
> >
> > Increase the timoout of i915 jobs to 2h30m since some jobs
> > takes more than 2 hours to complete.
> >
> > Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> > ---


--=20
With best wishes
Dmitry

