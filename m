Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 205C1C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YGZE1m+x9SPS6iVgqx8jcKt9Av6k4v6WXfZY3xI6v0=; b=TC/pieActF9tMtBeiDnF+S3Fw9
	h+omYgNVhmA3rvkhVHKDoj6rldJcRvp2x5smVH1YLES4yfieTx8KeRhKmh50llRSfQOzB7Do2Qnaf
	pUeudG0UcjwkVoF1Xs1NZUmnU8xEUz9h42ToGA8Nd6qxgilYFd1RNZtqqawhhA5tR8A0jXqT1hP2z
	OF9sMGgGqfFElzZT4CTXERgn06TaTx5O4ncF5N/Roltu99VdYMxT8ufPXSOH4esg2S2QRdbWWxN6v
	ChFXEmXUyU8VGEk1d29+0rzvrQ7SZRv5uaoQ2iik1s7O+O5BsY9nOPRcWqxFFQ+g4tus0DWXIe5/d
	bmckIQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA2ym-00000005LTu-44Kw;
	Thu, 23 May 2024 07:35:13 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA2yi-00000005LSf-1X5C
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 07:35:10 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-47efc592d9fso590072137.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 00:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716449706; x=1717054506; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4YGZE1m+x9SPS6iVgqx8jcKt9Av6k4v6WXfZY3xI6v0=;
        b=iwoa063x4+vQDQdynCMPXVO1hvG0iPh0G51A08lPpK0Ipz2d6+f+7GHG+ZjxcQg/H3
         lKRNGs0RfCyvgZAI3yiLyEgX8FcjubS8PzXh5Na0dqxhMknw02XEkhu2tezQGxZaSJuE
         P8/9N3Fm77SwEp/05fSVTeOmGLiCLHDplSkJJ9usjTboiGjOGj28teRbHELbftS9QSY0
         CmFLXizkBjjYK3i0kYHncz20HsRWvTL3GZ2NXhhHL6/SMi49jGiNkyxKLXhQ83Vom9u7
         jUDN0+nkZUFA+prgJWZ/HpF/zDBh/Qzx3gnaUGRmRZZixShzyt+CJI6EMxvP9A8lRQYL
         tdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716449706; x=1717054506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4YGZE1m+x9SPS6iVgqx8jcKt9Av6k4v6WXfZY3xI6v0=;
        b=rkriDzcZUGvze6ZY9bP7mHeLHUoNecpHeepmrL3rKXRytyhIFsibrQ0it22p2P419C
         fIV380pRMaC5FaggrKCydZx84IeetVMfNgak+N4FdJ6qNP5wCauMKiZ50Lsre2517PeV
         sCjE5VHLz0MXkE9HQYKNeEmrBDZXGmPyafkngpPBikTv1UyL4FsTazol8N8Oocn/Sdmj
         cW3nMPzP/66kLoW1INywhs0qiGkV/vt8Y73czZRS6UYVdm4zPIvRnp9tZU9fAYorrDO3
         vD6GWyIn/MWaLb7YMGUypBidij4/z/8gdFmmpSjEKz38hp8TdMtPfoFaOySzuzdNdcwO
         KNRw==
X-Forwarded-Encrypted: i=1; AJvYcCUpera0mWKbDO/KgLPEtEdaDDLqml7CcgjFM8ftNIVtQK8IHlyHaW6htzI326jEspjMxMv9I8EWmEGZRBXiRlzZWzAYD6jSBYnyvASykEox/7vQ
X-Gm-Message-State: AOJu0Yw9CfaSYb0K87raU9doUPzm30AgPNtQb5azZoNR24Ua8LrAmwAI
	qzVOviwmGdV0b3c0sq4ihGB8+lVb4Zhhzuo6GbgOsnMUq/WuPpZpp1m45fmud/EkGEW+Bl1cgf5
	KfgpU4w2QoyilPa0ANYLDH7KMJS2oRKmnYV4V7w==
X-Google-Smtp-Source: AGHT+IF/CSc5xjoYFx79kNTBwY+/NdcvlEoBwd2+PDUny1z5QczOFReKI/K8sM3AzJP71Jl/QyWKbKTbbAGYaPdTa1g=
X-Received: by 2002:a05:6102:3050:b0:47b:dcda:79df with SMTP id
 ada2fe7eead31-489077ce87amr4966258137.19.1716449706032; Thu, 23 May 2024
 00:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240507020037.14009-1-gavin.liu@mediatek.com>
 <CAFA6WYN79E8Hyxsaxu20hkyNebMqBWV7az5ByekTuii7Y7qjng@mail.gmail.com> <929512b561536d4ddfaeda518f2ce306b899f3a9.camel@mediatek.com>
In-Reply-To: <929512b561536d4ddfaeda518f2ce306b899f3a9.camel@mediatek.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Thu, 23 May 2024 13:04:55 +0530
Message-ID: <CAFA6WYNRVa_oem2TdyjoaUOTmW+vED-7LOC4wFjqG+puptg8tQ@mail.gmail.com>
Subject: Re: [PATCH v3] optee: add timeout value to optee_notif_wait() to
 support timeout
To: =?UTF-8?B?R2F2aW4gTGl1ICjlionlk7Llu7cp?= <Gavin.Liu@mediatek.com>
Cc: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"op-tee@lists.trustedfirmware.org" <op-tee@lists.trustedfirmware.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_003508_480224_DCCAC83A 
X-CRM114-Status: GOOD (  35.08  )
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

On Tue, 21 May 2024 at 14:16, Gavin Liu (=E5=8A=89=E5=93=B2=E5=BB=B7) <Gavi=
n.Liu@mediatek.com> wrote:
>
> Hi, Sumit,
>
> The corresponding OPTEE-OS pull request and change is here.
>
> https://github.com/OP-TEE/optee_os/pull/6641

As this is an ABI change where I see backwards compatibility is
maintained. However, the forwards compatibility requires this change
to be backported to stable releases. So for the next version please CC
stable ML.

>
> On Mon, 2024-05-20 at 16:16 +0530, Sumit Garg wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi,
> >
> > On Tue, 7 May 2024 at 07:31, gavin.liu <gavin.liu@mediatek.com>
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
> > > change in v3:
> > > 1. change the comment in optee_rpc_cmd.h
> > > 2. add macro for "TEE_ERROR_TIMEOUT"
> > > 3. change from "TEEC_ERROR_BUSY" to "TEE_ERROR_TIMEOUT"
> > > ---
> > >  drivers/tee/optee/notif.c         |  9 +++++++--
> > >  drivers/tee/optee/optee_private.h |  5 ++++-
> > >  drivers/tee/optee/optee_rpc_cmd.h |  1 +
> > >  drivers/tee/optee/rpc.c           | 10 ++++++++--
> > >  4 files changed, 20 insertions(+), 5 deletions(-)
> > >

FWIW:

Reviewed-by: Sumit Garg <sumit.garg@linaro.org>

> >
> > > diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> > > index 0d7878e770cd..1970880c796f 100644
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
> > > index 429cc20be5cc..424898cdc4e9 100644
> > > --- a/drivers/tee/optee/optee_private.h
> > > +++ b/drivers/tee/optee/optee_private.h
> > > @@ -26,6 +26,9 @@
> > >  #define TEEC_ERROR_BUSY                        0xFFFF000D
> > >  #define TEEC_ERROR_SHORT_BUFFER                0xFFFF0010
> > >
> > > +/* API Return Codes are from the GP TEE Internal Core API
> > Specification */
> > > +#define TEE_ERROR_TIMEOUT              0xFFFF3001
> > > +
> > >  #define TEEC_ORIGIN_COMMS              0x00000002
> > >
> > >  /*
> > > @@ -252,7 +255,7 @@ struct optee_call_ctx {
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
> > > index f3f06e0994a7..4576751b490c 100644
> > > --- a/drivers/tee/optee/optee_rpc_cmd.h
> > > +++ b/drivers/tee/optee/optee_rpc_cmd.h
> > > @@ -41,6 +41,7 @@
> > >   * Waiting on notification
> > >   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_WAIT
> > >   * [in]    value[0].b      notification value
> > > + * [in]    value[0].c      timeout in milliseconds or 0 if no
> > timeout
> > >   *
> > >   * Sending a synchronous notification
> > >   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_SEND
> > > diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> > > index f086812f1179..5de4504665be 100644
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
> > > +               arg->ret =3D TEE_ERROR_TIMEOUT;
> > > +       else
> > > +               arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> > >  }
> > >
> > >  static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
> > > --
> > > 2.18.0
>
> Regards,
> Gavin Liu
> > >
>
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including it=
s
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or beli=
eve
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

This text is not meant for public mailing lists. So please work with
your IT team to allow you to post to public mailing lists without this
text.

-Sumit

