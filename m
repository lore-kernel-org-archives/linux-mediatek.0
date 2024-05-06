Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD5C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyWYdlp3gwORdcMp3ea1vox51Jn/y1NJTimMt8/PF3g=; b=z3ht7iqjvcIxPR5eQSo5CfUWkw
	mxmLcvR+xv2gqUKs9aYyd68xl4EPfV4NyCWT3hUqW5uwzX0Wi1pwoxEVpTProXEWOu//TL7ogqBRx
	sZDGuIGRpqxpmdPXboc4vJGPT5tMKBC0eXcJw4qaRjr+0BJItEEVwNPaYC/gikwCclpFscK3GAIJG
	3c240KBpBm88a/4cnYk07m8sDgXWqWjR0yega8gVn9+ypxZQQe318RA8DHasrUypz7NzyU9RooMgI
	hhOV7DEAXHsqFj6z/FOkxHuZ6LMSQU6euMhoW2tW4eEEwtbxGIF0A6tdjC9SUmDINsyngn0qED/Sd
	3K6YHQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3tk2-00000006dh3-2EDE;
	Mon, 06 May 2024 08:30:34 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3tjx-00000006dca-0zkJ
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 08:30:32 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-5b20c4eda82so485856eaf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 06 May 2024 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714984219; x=1715589019; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyWYdlp3gwORdcMp3ea1vox51Jn/y1NJTimMt8/PF3g=;
        b=BK0s1QFqkMigQRdxHy/zWbj/l4f17F2JqiAatEcoPvSb0aYVRjEgni9yEMd3dlM57k
         XbMFK2zlSZxIpbJVSM4Wk/t1v3y4X+3/p2c2nrsgw2mhgL1VJDRVAFVvg0GM+mnij5uk
         sadJbGI4y7I0ZdBAFoaeDDo7rnKjNwjzmUtd0t5bbsHdbR5b0jWO42NiHNk9kE2AjxDU
         AIeqYiAxWtxEbcx748nBp0Vuef/maaq/u1dInMpPwIkX93EI5QHYPtZA2jkfQWJdS9yO
         iluWjc9j5o8vi0u7oqIj9V3akUlqJ3nrrHYY2qx7eZDHjMymMNk7XF/2TIWx8eg3BNqf
         t2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714984219; x=1715589019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyWYdlp3gwORdcMp3ea1vox51Jn/y1NJTimMt8/PF3g=;
        b=G1hLpUZlk4n4ZmVFCIoohfYoW760sSGBogaIchJ/W/zjdwhO8+u/OG+ITN3ffnU7wn
         JKEtbUX44+ogAM3FYM/L2uo4COx4lSlCHMpHEkNdNqXc195kfQgjm0rPV0VaR4HkB2RL
         5N42lRlGGf2n7HIVdQ2p+U0Nyh2bCqULMFegGrwmVwqntSBnkcFUoukWvpnWE0ceprG8
         oft6UmGYkM+Y95/RkXVPgRw6JovZwygBG1YZHw2ZfyqUi0p2QQDr2uNfKijJ6wVNG/1n
         60X0X3NDvaYIY5nOTMdvJF8fjIYzX1BJECUkAHIp8pQYupkTuHEl2u3Vtk+AktXy7scY
         hu+g==
X-Forwarded-Encrypted: i=1; AJvYcCWQlbKNplT+e62mEA7mK51ZUtvEte5Re4LP6PlVq8Fb7BmSHcV35CF+IOoSRwg52yy6KP3U502vIss12MoULUCSVktA0GJk1fUZN1B3LMSF3QBp
X-Gm-Message-State: AOJu0YwfOJCpQh4vtugBBsjbA1lbr4kBSXFr1/Sjmz/4i9F8SckFHBdv
	Ao6vfY6r1eRcrs9fypTebCaz0Q0Q/5EiIuL54dNjs1mmgWc5RMpr0d+dGj2gT2grUaDWUIUrvZI
	pKDRlY5c/nYUR84PEwXtQD6g2o4jEIZcnWki+Ew==
X-Google-Smtp-Source: AGHT+IFgsl0ENznxWP6Gtdy7tlgh4rQRQQiUH+qwCU8fG9nnDy5PFbqVHodTCkuxicxfqPjIcgLlVkVVSN4CsVK/fIA=
X-Received: by 2002:a4a:4b82:0:b0:5a4:9977:446b with SMTP id
 q124-20020a4a4b82000000b005a49977446bmr8922876ooa.6.1714984218929; Mon, 06
 May 2024 01:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240502085636.4049-1-gavin.liu@mediatek.com> <CAHUa44GGzMQjrkFm4JRQ463wqOpZfzoo91TchK=PdH1Rt565pQ@mail.gmail.com>
 <a14c567b4528840ab77c9f3faf19afc6c40f62cc.camel@mediatek.com>
In-Reply-To: <a14c567b4528840ab77c9f3faf19afc6c40f62cc.camel@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 6 May 2024 10:30:06 +0200
Message-ID: <CAHUa44G86Hg3BeRRvGvBOyOu4w0FryvDC4bMacW65J7uQuMG5g@mail.gmail.com>
Subject: Re: [PATCH v2] optee: add timeout value to optee_notif_wait() to
 support timeout
To: =?UTF-8?B?R2F2aW4gTGl1ICjlionlk7Llu7cp?= <Gavin.Liu@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"sumit.garg@linaro.org" <sumit.garg@linaro.org>, 
	"op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_013029_304836_18A9474E 
X-CRM114-Status: GOOD (  33.62  )
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

On Mon, May 6, 2024 at 10:19=E2=80=AFAM Gavin Liu (=E5=8A=89=E5=93=B2=E5=BB=
=B7) <Gavin.Liu@mediatek.com> wrote:
>
> Hi Jens,
>
> Thanks for the reviews.
>
> On Mon, 2024-05-06 at 09:48 +0200, Jens Wiklander wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  On Thu, May 2, 2024 at 10:56=E2=80=AFAM gavin.liu <gavin.liu@mediatek.=
com>
> > wrote:
> > >
> > > From: Gavin Liu <gavin.liu@mediatek.com>
> > >
> > > Add timeout value to support self waking when timeout to avoid
> > waiting
> > > indefinitely.
> > >
> > > Signed-off-by: Gavin Liu <gavin.liu@mediatek.com>
> > > ---
> > > Change in v2:
> > > Change commit message.
> > > Add description for value[0].c in optee_rpc_cmd.h.
> > > ---
> > > ---
> > >  drivers/tee/optee/notif.c         |  9 +++++++--
> > >  drivers/tee/optee/optee_private.h |  2 +-
> > >  drivers/tee/optee/optee_rpc_cmd.h |  1 +
> > >  drivers/tee/optee/rpc.c           | 10 ++++++++--
> > >  4 files changed, 17 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> > > index 05212842b0a5..d5e5c0645609 100644
> > > --- a/drivers/tee/optee/notif.c
> > > +++ b/drivers/tee/optee/notif.c
> > > @@ -29,7 +29,7 @@ static bool have_key(struct optee *optee, u_int
> > key)
> > >         return false;
> > >  }
> > >
> > > -int optee_notif_wait(struct optee *optee, u_int key)
> > > +int optee_notif_wait(struct optee *optee, u_int key, u32 timeout)
> > >  {
> > >         unsigned long flags;
> > >         struct notif_entry *entry;
> > > @@ -70,7 +70,12 @@ int optee_notif_wait(struct optee *optee, u_int
> > key)
> > >          * Unlock temporarily and wait for completion.
> > >          */
> > >         spin_unlock_irqrestore(&optee->notif.lock, flags);
> > > -       wait_for_completion(&entry->c);
> > > +       if (timeout !=3D 0) {
> > > +               if (!wait_for_completion_timeout(&entry->c,
> > timeout))
> > > +                       rc =3D -ETIMEDOUT;
> > > +       } else {
> > > +               wait_for_completion(&entry->c);
> > > +       }
> > >         spin_lock_irqsave(&optee->notif.lock, flags);
> > >
> > >         list_del(&entry->link);
> > > diff --git a/drivers/tee/optee/optee_private.h
> > b/drivers/tee/optee/optee_private.h
> > > index 7a5243c78b55..da990c4016ec 100644
> > > --- a/drivers/tee/optee/optee_private.h
> > > +++ b/drivers/tee/optee/optee_private.h
> > > @@ -252,7 +252,7 @@ struct optee_call_ctx {
> > >
> > >  int optee_notif_init(struct optee *optee, u_int max_key);
> > >  void optee_notif_uninit(struct optee *optee);
> > > -int optee_notif_wait(struct optee *optee, u_int key);
> > > +int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
> > >  int optee_notif_send(struct optee *optee, u_int key);
> > >
> > >  u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t
> > num_params,
> > > diff --git a/drivers/tee/optee/optee_rpc_cmd.h
> > b/drivers/tee/optee/optee_rpc_cmd.h
> > > index f3f06e0994a7..99342aa66263 100644
> > > --- a/drivers/tee/optee/optee_rpc_cmd.h
> > > +++ b/drivers/tee/optee/optee_rpc_cmd.h
> > > @@ -41,6 +41,7 @@
> > >   * Waiting on notification
> > >   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_WAIT
> > >   * [in]    value[0].b      notification value
> > > + * [in]    value[0].c      timeout in millisecond or 0 if no
> > timeout
> >
> > milliseconds
>
> Ok, I'll change it.
>
> >
> > >   *
> > >   * Sending a synchronous notification
> > >   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_SEND
> > > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > > index e69bc6380683..14e6246aaf05 100644
> > > --- a/drivers/tee/optee/rpc.c
> > > +++ b/drivers/tee/optee/rpc.c
> > > @@ -130,6 +130,8 @@ static void
> > handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
> > >  static void handle_rpc_func_cmd_wq(struct optee *optee,
> > >                                    struct optee_msg_arg *arg)
> > >  {
> > > +       int rc =3D 0;
> > > +
> > >         if (arg->num_params !=3D 1)
> > >                 goto bad;
> > >
> > > @@ -139,7 +141,8 @@ static void handle_rpc_func_cmd_wq(struct optee
> > *optee,
> > >
> > >         switch (arg->params[0].u.value.a) {
> > >         case OPTEE_RPC_NOTIFICATION_WAIT:
> > > -               if (optee_notif_wait(optee, arg-
> > >params[0].u.value.b))
> > > +               rc =3D optee_notif_wait(optee, arg-
> > >params[0].u.value.b, arg->params[0].u.value.c);
> > > +               if (rc)
> > >                         goto bad;
> > >                 break;
> > >         case OPTEE_RPC_NOTIFICATION_SEND:
> > > @@ -153,7 +156,10 @@ static void handle_rpc_func_cmd_wq(struct
> > optee *optee,
> > >         arg->ret =3D TEEC_SUCCESS;
> > >         return;
> > >  bad:
> > > -       arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > > +       if (rc =3D=3D -ETIMEDOUT)
> > > +               arg->ret =3D TEEC_ERROR_BUSY;
> >
> > TEEC_ERROR_BUSY is confusing. How about TEE_ERROR_TIMEOUT? We
> > normally
> > only use TEEC_XXX error codes, but GP doesn't define a
> > TEEC_ERROR_TIMEOUT so it's better to use the GP-defined
> > TEE_ERROR_TIMEOUT.
> >
> > Cheers,
> > Jens
> >
>
> Agreed, we also use TEE_ERROR_TIMEOUT in the corresponding patch for
> optee-os. But, the "TEE_ERROR_TIMEOUT" is currently undefined in Linux
> Kernel. Do you have a suggestion for which header would be better to
> place it in?

Please put it in drivers/tee/optee/optee_private.h below
TEEC_ERROR_SHORT_BUFFER with a comment that it's from the GP TEE
Internal Core API Specification.

Cheers,
Jens

