Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A25EC3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 18:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMK19Nn8t89hi1e3ly4VVQjOLnRO+D3abPmsW8/FOMM=; b=WfhprH1yFb3Qq1U9Cs8tZsTSsp
	IqFPnwWgyLKvWRD0hoym7YyXSn/dFXRPNm9yyAj3JMpTfwhh1+e4pK/E2vLISINrBUR1oxyspRTAR
	6CZk36F2dZ4J/b8/EIYbfkibdg6etjLh5GZzv2gJaqN7LzaIy38hGRMc1OQSut/EC/L8AO9I7p/5P
	oakLhbcFFU7H2zp3qBqWLtkG57ci6PQNOfJQnqdzpUEKCx8M+QxDPHP/qDhbzwqMhBPXTYcQzDB93
	cr3XF82lNl7XeGK/gZUPqW6ET3+uVRjQGGcId8pHYY5KGc5qNGpmASN95TiRtKEdKF3cSsLH9CiEZ
	4qA1Djxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxSD-0000000AG4L-3S1S;
	Mon, 22 Jul 2024 18:08:09 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVxQZ-0000000AFub-1QPa
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 18:08:08 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5a869e3e9dfso1835a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jul 2024 11:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721671585; x=1722276385; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HMK19Nn8t89hi1e3ly4VVQjOLnRO+D3abPmsW8/FOMM=;
        b=CKIvWPMLbiF1OSS3RqM7x+GYFd6w08Fsm61EfRS5ueY6CuosHTjxQ2fcXPMwLMFvSH
         AkvxVoPKa5rUPPqQH9gXC4K7VSWQiLkPUVnWyDtQttqk8dR3/DCV37tRWl6grMmNCr0l
         BCdik/2HWOh22dIegL3aNZibZh0qZHobxcQm9wk5EEplM6pyUK0zbF/U2GnYtx6wqITE
         XSuRJ8izfC703XQIV4rgz/hD1O0eyHCEgECYT9zEGzKTobw5SkfvjzUsOXUxyVKd+CEQ
         s96CUQyiIc7ZfSWCV9VQwHlvaL+xJVMWE+Ow/9INya1eQolOFsRmfUFTL3R3S5PN7OVZ
         jvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721671585; x=1722276385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMK19Nn8t89hi1e3ly4VVQjOLnRO+D3abPmsW8/FOMM=;
        b=TF2FiTfrBqVHELl0uhNpNX/m7aCWocX0Kn8BB+4c2X2MI27zKajLqzI3u1XFe0XJu/
         FDTFqTcKtWRrTybteMLGAW7m/Ol0+gz6ZrSIZG+A1vWWRmuZ4UiNQgCaSG4zzH8e/qNu
         3yBDM7i3s/9rm/uMk0QmrTR6wbYtvZg1Virs5Pqr1vJkmjrLfTjEsbMd32zdcKfZPDlq
         a48LkE1qVv25mQGo210u358e/bmtSvdIYdfCyhZDImUoC3y9iT8Xpq4e/ENWCRdzsI3V
         wjSnTOCU0z4rpF9w+NEXn54wTe7Ygyej4DCwIiIuxucukjfFxGs+U870OE0gOuLnvsx8
         TuJw==
X-Forwarded-Encrypted: i=1; AJvYcCUXI4sluGLSw3ldQD5kJmxk3xKPgEqki+CHdZKfxVoUKmdLl52R2bBIQ1xZQdSNuj+yET6wP3DCdBayCr1r13DdawEMw2n7JgW/J8qHSnX2WzWz
X-Gm-Message-State: AOJu0Yw3TqSI7YIELAHd7gAjD2yTE1PAdsiF2Fv/wose4cZ/F8R+KZyh
	NtZ2cbggm1Yr8sH+CGbM54GKndo58HQiAr9UaAn4SFZBVuQbBfzkmGs+esnZh4E0+dvXq1yarE5
	fCdpGUdhzNsTg/msmOf50TpHQl1YBONRbz/Z5xvhypCASxGcv
X-Google-Smtp-Source: AGHT+IEl8zQov63qHRZlZmLKjP+SxF+AuxkB9AjZcfeGtwHxHIcLoa1XC0lM9boUyhzudCkZuPPMVUrlf0ByNKNURws=
X-Received: by 2002:a05:6402:2747:b0:59e:9fb1:a0dc with SMTP id
 4fb4d7f45d1cf-5a456a628aemr396556a12.6.1721671584394; Mon, 22 Jul 2024
 11:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240720071606.27930-6-yunfei.dong@mediatek.com> <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
In-Reply-To: <2f5e5e81-21e1-421d-94ac-e4507b323680@web.de>
From: John Stultz <jstultz@google.com>
Date: Mon, 22 Jul 2024 11:06:12 -0700
Message-ID: <CANDhNCqzme0q7vey1jc84T0HJPiOSQF2fkyBfBLntdiyafEzYA@mail.gmail.com>
Subject: Re: [PATCH v7 05/28] dma-heap: Add proper kref handling on dma-buf heaps
To: Markus Elfring <Markus.Elfring@web.de>
Cc: "T. J. Mercier" <tjmercier@google.com>, Yong Wu <yong.wu@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Jeffrey Kardatzke <jkardatzke@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Hebert <nhebert@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Tomasz Figa <tfiga@chromium.org>, 
	LKML <linux-kernel@vger.kernel.org>, Brian Starkey <Brian.Starkey@arm.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?B?RnJpdHogS8O2bmln?= <frkoenig@chromium.org>, 
	Hsin-yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_110627_402432_D985FE0B 
X-CRM114-Status: GOOD (  10.24  )
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

On Sat, Jul 20, 2024 at 8:13=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > +++ b/drivers/dma-buf/dma-heap.c
> =E2=80=A6
> > +static void dma_heap_release(struct kref *ref)
> > +{
> =E2=80=A6
> > +     mutex_lock(&heap_list_lock);
> > +     list_del(&heap->list);
> > +     mutex_unlock(&heap_list_lock);
> =E2=80=A6
>
> Under which circumstances would you become interested to apply a statemen=
t
> like =E2=80=9Cguard(mutex)(&heap_list_lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196

This strikes me as a strange place to apply it, as it seems like it
would grow the lock hold time to the entire scope of the function
unless one created a subscope for just the list_del, at which point
you're not saving much or really improving readability.  I definitely
think guard usage is very interesting in places where locks are
released in multiple exit paths, etc. but this is a very trivial and
straightforward lock/unlock usage, so I fret I don't quite understand
the suggestion.

thanks
-john

