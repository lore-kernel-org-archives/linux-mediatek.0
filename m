Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49950C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 04:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDZS0haLyzX2rMNjByhL90PK2pxpUuZrfSW8MqJOxn0=; b=qjfUIFs2pFNbjHAo4xYrrAlLo8
	PL/R7lnxW60IU+R9O/EBQI+SHfAHrG9fuavMncbdftYcjR56BCkTfW9Jm/SLqW9MRaI1EUlHFjfp9
	XUOq3nt+K7pcW54VJUUhXVMXAey/AXCK2jtbS8gH4uc8izbERi1I321/HOkEH/QT1TL2difI9BBCd
	2YYPqkYvY1PJhrsBcpNlsnVESUg1iflMzO3KV0BzV3iRP4OUtuSrNv9UYPtcYAtbQGEX8gNovcqBM
	JqpQApQv7lMsjUccKyEXuk1iFZiQtqlUVTm+TJBAcnDMWJ39JZckzKrfGMvajvW31UFn2ynPdJEwj
	tH1BZT+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSOK-00Efmb-36;
	Fri, 08 Dec 2023 04:23:08 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBSOH-00Efla-0f
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 04:23:07 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-4b2e0492fffso451597e0c.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 20:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702009383; x=1702614183; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CDZS0haLyzX2rMNjByhL90PK2pxpUuZrfSW8MqJOxn0=;
        b=GcweE+Z7xe2h2tTSbANGZ3WtlYiHb9enfFmYvmLyviTWEJLo91KKi05CdtzusZao5L
         qkPHR3ORtXbqkGHAj/2HnzvnClTspCeRM/heaHoklI6KaiEVM8P/CV+HmJk5ht2HCW5a
         dsf3Vojcaa29cLlHj6PAYtlhsU05j0bLrrHgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702009383; x=1702614183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CDZS0haLyzX2rMNjByhL90PK2pxpUuZrfSW8MqJOxn0=;
        b=kpqF7gg1pNyrCR306A3aGiSYF0IjRNItgXaTJ6I/YIwdJvpbqC/6BEhl904W6J1vCH
         /1IXGFg7PUg/BV5VV46KwfH44Ot7A/HHk1l9swmkPhwwNcZgM8YgXWNkgF0aGOSX3LKc
         Y5R/tr64SqC6/hhWNuKdn2oMHLaCOvNVm0l6hS/5/hFuhSoKZl66a1DWCjpAObqKocnt
         ihyvlV9SM3AChp3wAMjnquj+3rZYZ7XB0Pv6eFouGG3oZCQdiewuSQxHJxr8E4rHC7Lq
         Rll4hB5DbOtSXGJJ98V1rpXGEBddb8+lWqY+dKM4I2hjoDs09qbblQGbuleGoj4yLBSp
         e2mw==
X-Gm-Message-State: AOJu0YxBwIPW6WZwNqgNM0XkeJrPYbN1xLNfwcPbBmb4i1dKpoXhj8CO
	xVMwd4Pb/KpCKPJYJXrkKuYeY4dXI2FFev37+hY=
X-Google-Smtp-Source: AGHT+IHkeJAzkTbAuBWftijwuK4K7aDdTkRh3TJznhuJuAk+eyVtmekjpYWAdFsRqZIO3B+0ljyLKQ==
X-Received: by 2002:a05:6122:4595:b0:4b2:ce5c:2060 with SMTP id de21-20020a056122459500b004b2ce5c2060mr4177300vkb.3.1702009382700;
        Thu, 07 Dec 2023 20:23:02 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id cm26-20020a056122421a00b004b2e71661c4sm102988vkb.24.2023.12.07.20.23.01
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 20:23:01 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7bb3e55c120so403074241.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 20:23:01 -0800 (PST)
X-Received: by 2002:a67:e893:0:b0:464:7c8c:e17d with SMTP id
 x19-20020a67e893000000b004647c8ce17dmr3179679vsn.9.1702009381069; Thu, 07 Dec
 2023 20:23:01 -0800 (PST)
MIME-Version: 1.0
References: <20231113123049.4117280-1-fshao@chromium.org> <20231113123049.4117280-4-fshao@chromium.org>
 <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com> <CAC=S1nhp3HoKGQr1UgKtZJ9SLMqvm-G_YZi9dEWWF3tj2d=OFQ@mail.gmail.com>
 <6046a40b-800c-4bf8-ab45-d7f1015b2d9c@collabora.com>
In-Reply-To: <6046a40b-800c-4bf8-ab45-d7f1015b2d9c@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 8 Dec 2023 12:22:24 +0800
X-Gmail-Original-Message-ID: <CAC=S1niMVxoryzg6X+vFcDpMRuO6YCzUFj4A+2yex+mfOBALRg@mail.gmail.com>
Message-ID: <CAC=S1niMVxoryzg6X+vFcDpMRuO6YCzUFj4A+2yex+mfOBALRg@mail.gmail.com>
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free()
 error log criteria
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_202305_604901_D0D6C2CC 
X-CRM114-Status: GOOD (  47.82  )
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

On Thu, Dec 7, 2023 at 8:55=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/12/23 12:17, Fei Shao ha scritto:
> > Hi Angelo,
> >
> > On Wed, Dec 6, 2023 at 6:19=E2=80=AFPM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> Il 13/11/23 13:26, Fei Shao ha scritto:
> >>> mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer =
has
> >>> never been allocated or was freed properly in the previous call. That
> >>> makes log confusing.
> >>>
> >>> Update the error path to print log only when the caller attempts to f=
ree
> >>> nonzero-size buffer with VA being NULL, which indicates something ind=
eed
> >>> went wrong.
> >>>
> >>> This brings another benefit that the callers no more need to check
> >>> mem->va explicitly to avoid the error, which can make the code more
> >>> compact and neat.
> >>>
> >>> Signed-off-by: Fei Shao <fshao@chromium.org>
> >>
> >> I think that this error is supposed to catch two issues in one:
> >>    - We're called to free no memory (something that does make no sense=
),
> >>      this may happen for example when calling xxx_free() twice, and it
> >>      is a mistake that *must* be fixed;
> > When I made the change, I was thinking of kfree() that doesn't warn
> > against a NULL pointer.
> > I imagine mtk_vcodec_mem_free() calls with NULL VA and mem size 0
> > probably have the similar nuance (if the buffer exists, free it; never
> > mind otherwise), but I could have missed some important differences
> > specific to the MTK vcodec driver.
> >
> > Looking at the mtk_vcodec_mem_free() usages, almost every one of those
> > checks VA beforehand, but nothing else - they don't warn or do
> > anything special when they encounter a NULL VA, and they should if
> > that's a concern.
> > Some even don't check at all (and I think that's why I ended up seeing
> > the errors mentioned in the cover letter). As for that, I think
> > there's nothing else we can fix except prepending "if (mem->va)".
> > So from all this, I feel perhaps we don't need to worry much about
> > those NULL VA, and we can further remove the checks (or at least move
> > it into mtk_vcodec_mem_free()) to trim the lines in the driver. That's
> > the reason for patch [4/4].
> >
> > Not sure if that makes sense to you.
>
> What you say does make sense - and a lot - but still, I think that freein=
g
> a NULL VA (=3D freeing nothing) is something that shouldn't happen...
>
> >
> >>    - We're failing to free memory for real (which you covered)
> >>
> >> ....that said, I think that if you want to clarify the error messages
> >> in this function, it should look something like this:
> >>
> >> if (!mem->va) {
> >>          mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func_=
_);
> >>          if (mem->size)
> >>                  mtk_v4l2_err(plat_dev, "Failed to free %lu bytes", me=
m->size);
> >>          return;
> >> }
> > Sure, I can revise the patch with this, but I also want to make sure
> > if the NULL VA print needs to be an error.
> > If you still think it should, I guess I'll drop the current patch
> > [4/4] and instead add the check before every mtk_vcodec_mem_free()
> > calls. This should also work for the issue I want to address in the
> > first place.
> >
>
> ... because if you notice, some of the calls to mtk_vcodec_mem_free() are=
 not
> checked with `if (something->va)` beforehand, so I think that those are c=
ases
> in which freeing with a NULL VA would actually be an indication of someth=
ing
> going wrong and/or not as expected anyway (checking beforehand =3D error =
won't
> get printed from mtk_vcodec_mem_free(), not checking =3D print error if v=
a=3D=3DNULL)
>
> It's an easy check:
> cd drivers/media/platform/mediatek/vcodec
> grep -rb1 mtk_vcodec_mem_free
>
> P.S.: h264_if, av1_req_lat :-)
Yes, these are exactly what I wanted to imply in ">> Some even don't
check at all", and I should have pointed them out to avoid
ambiguity...
And I understand your concern. Presuming the NULL VA case is and will
always be safe to ignore can be too assertive, and getting explicit
error logs is always better than lurking bugs.

>
> That's why I think that you should drop your [4/4] - unless MediaTek come=
s in
> stating that the missed checks are something unintended, and that every i=
nstance
> of VA=3D=3DNULL should print an error.
>
> I honestly wouldn't be surprised if they did so, because anyway this occu=
rs only
> in two decoders...
Agree, it would be nice if Yunfei can share some thoughts here, or I
can reach out to him through other channels for alignment first, and
adjust this series based on the response.
The h264_if part was written a while ago (2016) and the av1_req_lat
part is relatively new (mid 2023), I hope it won't be too hard to
reach a conclusion for those.

Regards,
Fei

>
> Regards,
> Angelo

