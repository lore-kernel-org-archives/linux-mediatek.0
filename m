Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0497C5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 08:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EHx8fqSvvCXlCRS96cOi6NcuQX1k76UHUWB26clPB70=; b=O/n7W0uMDKOK8LD41u1P/8icuz
	bUD/KdLsIHTAqSgp8SIchN7PP5FSoIcNr4tSUDzaPv1NPmEHcB7bCAi5B47fvOnE8JcK7NH3L9S4T
	1ycf7vRhEaEekph05OvYewRF29cXknKlwpoGLjNAC+mhIvzI/GQ+MZK/1jNM3Lb6uOC3iuyv0/Ova
	P7ssJFpOdNeD81if/e03sRPZ7ezsWouXM8cW7p0RjulgmUOBRLXV9BB46LQmN/v1zZwQ6Yu6tpD0O
	UEjLJksuCKczqS/Csvskm2Fh8exvz1Yax4xgzIjIT2EHmWtRTVncsNn9e52CRHsa9baM+Meiu4Fn+
	a0ujNM3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWkT-0000000H9R4-3xfU;
	Mon, 26 Feb 2024 08:54:09 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reWj0-0000000H8Ql-06eT
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 08:52:40 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-46d745c4fa6so232616137.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 00:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708937555; x=1709542355; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHx8fqSvvCXlCRS96cOi6NcuQX1k76UHUWB26clPB70=;
        b=cYMT6QK1UrgNWiVWq4M3QJ9/biF1dJGtJ+lo7F7uisr5F1Bx5gzl8khU31Bq0Rqux0
         l6Y75in+ZHIsY0gFpHUcJUSMB0agtjxi2RYCu6qyyeYb8xEBOfS9iYfsmT+P7FNiaOgh
         5l7pykTPfhx0DqlgfyC113Cap6RORoNv0zP08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708937555; x=1709542355;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHx8fqSvvCXlCRS96cOi6NcuQX1k76UHUWB26clPB70=;
        b=hKcQ7vKjWKmZINxRiM286ebT9C+d8Up3K0u+rMYhpTMfwNGWMl9WxcvZFUzbX3+bBy
         Ua662DMP4KxhW1wrxwsaSE74/+D0pzl0SrlQA4w4bZFokW2+DThdiwUMbT/h857KkfAr
         BOKCkrOTQYYX4MlUuXfODq/PoTJUYfnkwVQJq3Tfx7HLS75MFXHojT3FGKYWBdCV7nI8
         S3Ib37+B7aEjkRSDjwQkhENlq5pBQ+UqBfhxKA3Fu5iSn7XrdG0kZB/1O5XBDpxJUR5q
         2nQ2usEnEzNVq0d3yGgJAN1G6gU+IlsMPO4Jp/AvSulKH35ZwKd8kcbno/PyuqeZciU6
         A0mA==
X-Forwarded-Encrypted: i=1; AJvYcCXODcf87m1L7K0rPPtaLShec1DyRhPqIvqFx6xBI8lh3TrLBa5qCxbuKD/C9GzF91fWppNDYUzR8ennj6uNubgZ95WngTISc46W0Rlp2JKr4ixB
X-Gm-Message-State: AOJu0YzoCPwcLfX8upaizbmJN+xXD2zNQqgJ3p/+r8cYu2/EQyEIuFZw
	RgoX7fUOYOYWl85Q1pjbNgyeuBJq7LoZvo5kfDg8F6bShuy6ZUNR/7waWYtxEfVw0VToAQSHNSR
	IVA==
X-Google-Smtp-Source: AGHT+IE4yD38y5AdtHYPKUms3Hy+6LqmqfcyGFSdRUko8EfpS3s03bwYdSyMk+EcwygGhNeZ7cRjUA==
X-Received: by 2002:a67:fa01:0:b0:470:5c4a:86ad with SMTP id i1-20020a67fa01000000b004705c4a86admr2631123vsq.22.1708937555609;
        Mon, 26 Feb 2024 00:52:35 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id hx1-20020a67e781000000b0046d37342e6dsm855945vsb.29.2024.02.26.00.52.35
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 00:52:35 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-46d745c4fa6so232609137.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 00:52:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw31ngEPuTlTYWI8Wc6kFXGQOLyLVKp2eZ6aZspPXGUUYnRl5SY9Q+XVW8iIoPdKUO7ov4+dM8vySFA/Y4Et1Q95YV2N7+JM2/+gDwQmYPtPTL
X-Received: by 2002:a05:6102:3234:b0:471:b7ed:e112 with SMTP id
 x20-20020a056102323400b00471b7ede112mr2376132vsf.1.1708937554848; Mon, 26 Feb
 2024 00:52:34 -0800 (PST)
MIME-Version: 1.0
References: <20240221165643.1679073-1-greenjustin@chromium.org>
 <c7d6259b-90e7-41a3-998f-a12edf7c1554@collabora.com> <CAC=S1njw4JM++D4kYyi4Z2rcDTsvqD1b0VtpQ5A071dgvtVGdg@mail.gmail.com>
 <c4814e25-42c9-4604-b86a-8ef0bd634f78@collabora.com>
In-Reply-To: <c4814e25-42c9-4604-b86a-8ef0bd634f78@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 26 Feb 2024 16:51:58 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngRerkkopcQqvA6s9Fs2u_23rLmxf8n_hzz=R7yO2bfOw@mail.gmail.com>
Message-ID: <CAC=S1ngRerkkopcQqvA6s9Fs2u_23rLmxf8n_hzz=R7yO2bfOw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Add MT8188 Overlay Driver Data
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Green <greenjustin@chromium.org>, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_005238_215307_E043EAE4 
X-CRM114-Status: GOOD (  21.01  )
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

On Mon, Feb 26, 2024 at 4:43=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/02/24 09:21, Fei Shao ha scritto:
> > On Thu, Feb 22, 2024 at 4:43=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 21/02/24 17:56, Justin Green ha scritto:
> >>> Add MT8188 overlay driver configuration data. This change consequentl=
y
> >>> enables 10-bit overlay support on MT8188 devices.
> >>>
> >>> Tested by running ChromeOS UI on MT8188 and using modetest -P. AR30 a=
nd
> >>> BA30 overlays are confirmed to work from modetest.
> >>>
> >>> Signed-off-by: Justin Green <greenjustin@chromium.org>
> >>> Tested-by: Justin Green <greenjustin@chromium.org>
> >>
> >> Hello Justin,
> >>
> >> I'm 99.9% sure that you don't need this, you can just use compatibles
> >>
> >> compatible =3D "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl";
> >>
> >> as they *are* indeed compatible, and MT8188 does support AFBC as well.
> >
> > Hi,
> >
> > I confirmed that I can lit up the MT8188 display with that plus a
> > follow-up patch [1].
> > Otherwise a compatible sequence of mt8188, mt8195 and mt8192 would be
> > needed, but that would be somewhat redundant.
> >
>
> Actually, that wouldn't be MT8192, but MT8183 - following MT8195's device=
tree,

Ah yes, you're right.

>
> so it would be
>
> compatible =3D "mediatek,mt8188-disp-ovl", "mediatek,mt8195-disp-ovl",
>               "mediatek,mt8183-disp-ovl";
>
> And yes that could be redundant, but I'm not sure that adding a compatibl=
e
> string to the mtk_drm_drv matches is a good idea.
>
> I'd be more for using the triple compatible strings in there instead, as =
it'd
> be like that for only *one* node and not more than that - IMO, that is to=
tally
> acceptable and it's also the best (and lightest) solution.

I see, I'm also fine with this approach. Thanks for the feedback!

Regards,
Fei

>
> Cheers,
> Angelo
>
> > [1]: https://lore.kernel.org/all/20240226080721.3331649-1-fshao@chromiu=
m.org/
> >
> > Regards,
> > Fei
> >
>

