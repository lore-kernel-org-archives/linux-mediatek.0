Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F4EC04A94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 04:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UTWHLndGeXwlwFxJfP692jPfynwn2x9U2iKvEF971w=; b=C2QJyqQv3kAYC90sKVEf6J/Fkx
	0mZCVnIirnFmexYJvcESt2q3cdDFUf8IlTBHbO3cfe8V4KX79IqOPVGM0GAiNoBgbNukcNZHMcDAA
	zqrpa1fyC9ZCx6Lz9XMspubm/v/zepj7RGvAX/X+9oacPj/5LhQYJVuVnvmk5m5QFjZ0gOmMpByFa
	C7qoHhML5/jZMHQt2pNurt5Vx/99VYTyV6/BnFEd8aHC4q2uIYMU0k9tp4LLYSLOYIXDYqoSjXV/N
	v6F1uR9Sm9Q+spr4TUIXv48No/TNHa9fDiewdBtd7kf0vsO354KWtVSJuRhnhUWaUdX6s4KO+uM6Y
	4NizKu5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRmfB-00BY4y-0N;
	Fri, 04 Aug 2023 04:43:45 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRmf9-00BY4V-0B
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Aug 2023 04:43:44 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-348d6bc349eso6321645ab.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 21:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691124220; x=1691729020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9UTWHLndGeXwlwFxJfP692jPfynwn2x9U2iKvEF971w=;
        b=dDOn4jen7D2FSeI5qe7zmIjUi5bp7bqRTm1TT7lupA7wnP61sKRJxiF6m44iE8hM6z
         gkY/ToZPsP88o+o/vPHogeLwIT8OSeZ9VUybix4P2E9sEYK5P2MR+kLhifNeU8G+poxi
         DrkLzsIQw1ZtTEyTMqgPChkpUgclKykJrMayo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691124220; x=1691729020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9UTWHLndGeXwlwFxJfP692jPfynwn2x9U2iKvEF971w=;
        b=V3VlNnFc38SfA/ZdnEQ6YpZaBZTM2G0m81AeNogtiKRfa9HZwEiFeznIlTLp+0ELM4
         ENl5uMt75qu4Z8oWwu+nCEGiu3Ndrr3xVSwZDB9uNPillLMG/p/hAPKOY3DV506aRlQY
         YLnj02FSb++j5l1ocaHS65gmKu0TVAe6Mtn03BgDLCOI1zq2diSCcz/uMI4Szdw2H1Bl
         weG+6y31F2xyp1YncJG5u79ltwmhMcAdzHGz5InuIHbpvbMu0fbwQBxTjB+yGIwfpLWG
         oQmmDRJCOBwsprnNOYmNz6N3dELps44UdkMaT50O6fcX1zwvmger8M4McadNvJjL0Ha+
         UKwQ==
X-Gm-Message-State: AOJu0YxKBTPGRlINKtGBfrQFIexG9fy3TCe9nDDdLQTV0vq+KD7JjVoP
	DgxtSoJzu8ktP50UFxIuqf67Awon3FbnZ5t6B9I=
X-Google-Smtp-Source: AGHT+IFstRWtV7csV9dV74ygXCRh2GhdZygowQTq4TBs8bXn4PD/l8xM61WpJ2nAINH7Rv6vzCUElw==
X-Received: by 2002:a92:c04b:0:b0:349:1552:8134 with SMTP id o11-20020a92c04b000000b0034915528134mr947487ilf.30.1691124220479;
        Thu, 03 Aug 2023 21:43:40 -0700 (PDT)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com. [209.85.166.51])
        by smtp.gmail.com with ESMTPSA id gj21-20020a0566386a1500b0042b6a760c31sm354776jab.28.2023.08.03.21.43.35
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Aug 2023 21:43:35 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-790c6d966e0so63925139f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 21:43:35 -0700 (PDT)
X-Received: by 2002:a5e:a815:0:b0:790:bf09:55b7 with SMTP id
 c21-20020a5ea815000000b00790bf0955b7mr715779ioa.6.1691124214863; Thu, 03 Aug
 2023 21:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230724175839.675911-1-greenjustin@chromium.org>
 <ZMtkIHkfhbOCodhw@phenom.ffwll.local> <CAHC42Rfz6jjY9RfVsrrPuENgXiaCB7EecH=-Dnfzm0KynGFNjA@mail.gmail.com>
 <ZMvAV42bm7ZTKXfv@phenom.ffwll.local>
In-Reply-To: <ZMvAV42bm7ZTKXfv@phenom.ffwll.local>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 4 Aug 2023 12:42:58 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngh4z5vbKYQ0yEULfmmQLA-deadJYKvvKcPyyaVOEcbdw@mail.gmail.com>
Message-ID: <CAC=S1ngh4z5vbKYQ0yEULfmmQLA-deadJYKvvKcPyyaVOEcbdw@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: Add valid modifier check
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Justin Green <greenjustin@chromium.org>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org, 
	jason-jh.lin@mediatek.com, justin.yeh@mediatek.com, wenst@chromium.org, 
	angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_214343_118142_557D3FBB 
X-CRM114-Status: GOOD (  18.02  )
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

On Thu, Aug 3, 2023 at 10:57=E2=80=AFPM Daniel Vetter <daniel@ffwll.ch> wro=
te:
>
> On Thu, Aug 03, 2023 at 08:48:56AM -0400, Justin Green wrote:
> > > See c91acda3a380 ("drm/gem: Check for valid formats") and the related=
 gem
> > fb helper functions to see how this is supposed to be done.

Thanks for shedding the light, Sima.
I think that change is exactly what we need here, which is somehow
recent and we don't have that in our downstream kernels.
Applying that also fixes the test failure I saw, so I agree with you
that this patch is not needed for the mainline kernel.

Thanks,
Fei


> >
> > Oh that's interesting, so does this imply that the infrastructure
> > automatically calls format_mod_supported() during framebuffer
> > creation? In that case, this entire patch might be unnecessary in the
> > tip of tree kernel.
>
> It /should/, but maybe a wheel fell off somewhere. So please double-check
> that it doesn indeed work.
>
> Also because we had to put the check into gem helpers, if your driver
> doesn't use those but hand-rolls a bit of that code (the helpers predate =
a
> bunch of drivers, not sure all got converted), then you might also have a
> validation gap here.
>
> Cheers, Sima

