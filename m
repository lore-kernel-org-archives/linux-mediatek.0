Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7051AC25B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 May 2024 06:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmmGEIEiP+RXWcqXsFf6qa0SBKaXKreUvEwc8aJmwc8=; b=lcnCT+Q2yJPT4YIYMDxnFEFOFv
	eUGIbgFIIG/BG48ol6VBTMxCn30h8VsSsidC3jX2HB+h279KlBYOjPGF1Jj1fj01f2mIf3L6YhEPW
	tPjsRubmQQKs6gdVRePm6LlufpZx+4CLOL+fJ/8O5ANjQbjp1qUYrVmDz/l0GMetLj/O39ph756au
	XYPz+P43ZU5AXxc0bwtfVgufX5WY2CxPHsLpByKAiRm5TL7mRWRs6BS+3Rxg5Q8WlGnTar9ki9pa4
	w5lI06UAEwwY90I0Q6/R04+/25VhbkrjXOn5vcwMb+mbVAAmeJOKPaD8Y5zvbPRRP+rtq37ydWLOj
	TESrrfww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwBW-00000009ROt-0NVK;
	Fri, 31 May 2024 06:56:18 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCwBR-00000009RN7-1wV9
	for linux-mediatek@lists.infradead.org;
	Fri, 31 May 2024 06:56:15 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-24c9f628e71so876106fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 23:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717138570; x=1717743370; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmmGEIEiP+RXWcqXsFf6qa0SBKaXKreUvEwc8aJmwc8=;
        b=a4laBXLIX28L2qB8W0BhZ/TMfSJyQh+SLrXqTUnDCoLjRU4FAdU+z3EmoVZwONmpzO
         dODpS0NuekSgBso9q1aeT6YYaKPgTzVJFkJk4ZigeeAiU0c8kLVFQwHbR60r2jPUoJ+S
         JE3HLgVAjl53XQwKGqGe+b8ELUjl5RG0HC8OHIoL256S7wx7GKD3dYq0ZI3G4vXAxi7i
         SxNuL1ZOiD1F4sF5/uXmjpQM+2BZcRmzceO8Xocw4Vmxzh1Dk+hNW2KxGOrtDzIK3d56
         ryzCJj0P8IVckuqUZUJHZ9O4+uv/iE3d4/zwQ6J0aWxT27anYHol4Us65LBcClMV7TVJ
         /nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138570; x=1717743370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmmGEIEiP+RXWcqXsFf6qa0SBKaXKreUvEwc8aJmwc8=;
        b=IpwnyqWPOMA71bZFY0kagh92XXyFxs4OknDU5SbGBtCYciJCwXAFDMusYsLADzvy2j
         1Wc9EuMazgvNZyGEDiKWxXy4s4O/dfUA3xPjV4WsYC8dnILN5Zv22MDZ4ZfxMR7lrXAh
         /blL8hprEsgTmuatgUoaBlgH+DUbtUMFTy8aaLBrnH5dd1lMq7gpVka9dpw3XRik9Wwo
         //wDJ7neaQk0gOom7fJlNkZWsBWBRjA94uH4N0UpPOF8wKBOyDTuIk+zpDtbVAXR/bT9
         NtdhBdDgIynddR9/+lEFE+qWOMS0V53VQoaUvR7+7NNRFRpHZYnuLocesV3NhTC4ri8C
         aheg==
X-Forwarded-Encrypted: i=1; AJvYcCU9gUpcMmnN30tG93jkVXXO2rjD84G8IbN74mGnBNGP/d74zAeZu0CRnANzVM0LdUaQt9+12nK99fCzvh02HavlWXNAbD94LqwyK9hOb+jyfDzQ
X-Gm-Message-State: AOJu0YyUkeBwg3Bt1e7xkAGjewB7WuAFS2DNq/1ChRT+NF2uOb5i7gfL
	89fNYZBY6iB9bl593F160SXmIw4jvFQJsVWv23z2aizjX2tZhU0USpHzdbWVay8lDh5Nv1tQD33
	4s2sMQtL9kCsn1/eAubYRYK3EPCHmOrPFI+evAw==
X-Google-Smtp-Source: AGHT+IEtLc8q750EW+lhfvstjGAuhAQBsRVsWSDNxtmSoDQYn3O6DHfwpdwQD3UPV6TyURClBWGTjrlbf6AI7cLNbeU=
X-Received: by 2002:a05:6870:724a:b0:250:8255:e793 with SMTP id
 586e51a60fabf-2508b993d50mr1295191fac.23.1717138570065; Thu, 30 May 2024
 23:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240507020037.14009-1-gavin.liu@mediatek.com>
 <CAFA6WYN79E8Hyxsaxu20hkyNebMqBWV7az5ByekTuii7Y7qjng@mail.gmail.com>
 <929512b561536d4ddfaeda518f2ce306b899f3a9.camel@mediatek.com> <CAFA6WYNRVa_oem2TdyjoaUOTmW+vED-7LOC4wFjqG+puptg8tQ@mail.gmail.com>
In-Reply-To: <CAFA6WYNRVa_oem2TdyjoaUOTmW+vED-7LOC4wFjqG+puptg8tQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 31 May 2024 08:55:58 +0200
Message-ID: <CAHUa44Hpfq+6qsuZ9NYUB55br=5H0Bi1p7ALoAY3Cad5egOcdg@mail.gmail.com>
Subject: Re: [PATCH v3] optee: add timeout value to optee_notif_wait() to
 support timeout
To: Sumit Garg <sumit.garg@linaro.org>
Cc: =?UTF-8?B?R2F2aW4gTGl1ICjlionlk7Llu7cp?= <Gavin.Liu@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_235613_539966_A6F5B8BC 
X-CRM114-Status: GOOD (  21.48  )
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

On Thu, May 23, 2024 at 9:35=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> On Tue, 21 May 2024 at 14:16, Gavin Liu (=E5=8A=89=E5=93=B2=E5=BB=B7) <Ga=
vin.Liu@mediatek.com> wrote:
> >
> > Hi, Sumit,
> >
> > The corresponding OPTEE-OS pull request and change is here.
> >
> > https://github.com/OP-TEE/optee_os/pull/6641
>
> As this is an ABI change where I see backwards compatibility is
> maintained. However, the forwards compatibility requires this change
> to be backported to stable releases. So for the next version please CC
> stable ML.
>
> >
> > On Mon, 2024-05-20 at 16:16 +0530, Sumit Garg wrote:
> > >
> > > External email : Please do not click links or open attachments until
> > > you have verified the sender or the content.
> > >  Hi,
> > >
> > > On Tue, 7 May 2024 at 07:31, gavin.liu <gavin.liu@mediatek.com>
> > > wrote:
> > > >
> > > > From: Gavin Liu <gavin.liu@mediatek.com>
> > > >
> > > > Add timeout value to support self waking when timeout to avoid
> > > waiting
> > > > indefinitely.
> > > >
> > > > Signed-off-by: Gavin Liu <gavin.liu@mediatek.com>
> > > > ---
> > > > change in v3:
> > > > 1. change the comment in optee_rpc_cmd.h
> > > > 2. add macro for "TEE_ERROR_TIMEOUT"
> > > > 3. change from "TEEC_ERROR_BUSY" to "TEE_ERROR_TIMEOUT"
> > > > ---
> > > >  drivers/tee/optee/notif.c         |  9 +++++++--
> > > >  drivers/tee/optee/optee_private.h |  5 ++++-
> > > >  drivers/tee/optee/optee_rpc_cmd.h |  1 +
> > > >  drivers/tee/optee/rpc.c           | 10 ++++++++--
> > > >  4 files changed, 20 insertions(+), 5 deletions(-)
> > > >
>
> FWIW:
>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

I'm picking up this.

Thanks,
Jens

