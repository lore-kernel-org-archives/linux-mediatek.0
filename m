Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7FCC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 07:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1P6DJY4fN1oYQ+fD1hdKIRR5ynxkJi89nJoIba5ERBM=; b=koOhTUBWb12ytFNDfKOKR8aRy4
	ngXanD98pJfw7u4BiUSzMkQCAZ95OlaO7Ohm0iELxywSiwT8R/qaT7QXPAIXjCn8FuvVQ+X/4BnSg
	Izja6EmW4zqYTbpAm/poF9HE36KmmvEOR8zUwcwp973yLdgZMSotEMa36+1OcEBGNabXV3drlUW4o
	oRFv6+AjjgWruzduJbieLsyUpShfvjf4P1VexcwWkAKNue2wyYQOYUWKtMTxiO42Hsz/blK9gt/o+
	Vfcsm9CzmyF7AslbvHLC6B8/I/jQrGIINO5CQumKbUbfoXRNWeiPaEfJ7uGYeMIAUMW3L6eGKv4pc
	NV5tiUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3t59-00000006VNS-1rgG;
	Mon, 06 May 2024 07:48:19 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3t56-00000006VMQ-00Y2
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 07:48:18 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6ee4162061fso1055079a34.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 May 2024 00:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714981693; x=1715586493; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P6DJY4fN1oYQ+fD1hdKIRR5ynxkJi89nJoIba5ERBM=;
        b=GuFngy/r1s9gvEMk2VW4PSXgq3+z5fQXTCOl/JX3flzrj0H+3ehDCyr6FhhupknHZq
         6PBl9L2K3kWLmrM+Pmojppo/u2xlifDE2CnIy6xh1zTDZ/4zvCkt+A6vH8wdmw0l/iRl
         gIfHkooi6lo71D4ve6ioNKxRvYHD62qlTvOq+5nRDxHVebXX8MCcEMeNx/WUc6c0WRP0
         q4gO8Req/un3aO+WY9GHcXpmIgluLpxVyav0qQYWE88y0bFWHWWiLuvS10OjhXAwbZat
         Y2Xcx/IQPf6Tt+2o8tcwrKZXWhC/hBNxlfydd/PqNmhPSYlycVW7QLYuIiWvllHCj+9w
         8QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714981693; x=1715586493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P6DJY4fN1oYQ+fD1hdKIRR5ynxkJi89nJoIba5ERBM=;
        b=bxd4xNuyK61FelX3rKxXyntluj/RgrQ2Y3XvKFMWM/4CxQQ+TfCvjdNI6LdOUYCup9
         uzBfaDulag3RUI6CLqIImdm2dz1gfZtul23UtonljlSRsfNJFjDqP4x7+g9MdpGp3P6y
         GoknVuffXB0souTBChs2JhDqys1alaDwLIHM3izjPxlU8i3CUccZLuuaQsfM0RFf9j+z
         zmv1A8M935sc9tAylguqimgIzbBlJWlgfStTPJc1AfrrSHkxbwAHy5ZrGPDXycd9GRse
         oEcVZOZ7Y6GsS2k2VPvMs5ZuHkS1bvuKbB8svZ1j9dG7GeDjQDVt5TmycgSJi7QZKr1f
         mFNw==
X-Forwarded-Encrypted: i=1; AJvYcCVOeu4udzaOIe6TD769rZncpE3WiJqJYeSn7Etw9KNMtRUTlkKliH6ahju9ntc4ywuE2U+EXtsJkYHbDiTRXKlWaPrINgmIpOOsXvTO06q7yJc+
X-Gm-Message-State: AOJu0YyY1crBo1S91qPK1zluYxW1MJdVI0jBXsXQyZhBT01XBu1xGrjV
	JKjwfejavicfpVK4iFbyHo+SZ9rkkm4ZdmlYcsj4FJoMAByyOEc55PchB+2A4p74O6kgBP2RF97
	Ru09Yly1AH6bpUq1+ZM3jYXEgTZRp7ssvG8AH8A==
X-Google-Smtp-Source: AGHT+IFRjrDF2z1YHBQ36qKpgseIsHm+fGagHI2wj3a0Y3r/oMNEUJ+ZfENTe8UOBiA8G/22/t3PRwFoWT5+QH7FZWc=
X-Received: by 2002:a05:6830:3149:b0:6ee:5560:4031 with SMTP id
 c9-20020a056830314900b006ee55604031mr12325242ots.38.1714981692603; Mon, 06
 May 2024 00:48:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240502085636.4049-1-gavin.liu@mediatek.com>
In-Reply-To: <20240502085636.4049-1-gavin.liu@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 6 May 2024 09:48:01 +0200
Message-ID: <CAHUa44GGzMQjrkFm4JRQ463wqOpZfzoo91TchK=PdH1Rt565pQ@mail.gmail.com>
Subject: Re: [PATCH v2] optee: add timeout value to optee_notif_wait() to
 support timeout
To: "gavin.liu" <gavin.liu@mediatek.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_004816_292801_EAAEE20D 
X-CRM114-Status: GOOD (  22.90  )
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

On Thu, May 2, 2024 at 10:56=E2=80=AFAM gavin.liu <gavin.liu@mediatek.com> =
wrote:
>
> From: Gavin Liu <gavin.liu@mediatek.com>
>
> Add timeout value to support self waking when timeout to avoid waiting
> indefinitely.
>
> Signed-off-by: Gavin Liu <gavin.liu@mediatek.com>
> ---
> Change in v2:
> Change commit message.
> Add description for value[0].c in optee_rpc_cmd.h.
> ---
> ---
>  drivers/tee/optee/notif.c         |  9 +++++++--
>  drivers/tee/optee/optee_private.h |  2 +-
>  drivers/tee/optee/optee_rpc_cmd.h |  1 +
>  drivers/tee/optee/rpc.c           | 10 ++++++++--
>  4 files changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> index 05212842b0a5..d5e5c0645609 100644
> --- a/drivers/tee/optee/notif.c
> +++ b/drivers/tee/optee/notif.c
> @@ -29,7 +29,7 @@ static bool have_key(struct optee *optee, u_int key)
>         return false;
>  }
>
> -int optee_notif_wait(struct optee *optee, u_int key)
> +int optee_notif_wait(struct optee *optee, u_int key, u32 timeout)
>  {
>         unsigned long flags;
>         struct notif_entry *entry;
> @@ -70,7 +70,12 @@ int optee_notif_wait(struct optee *optee, u_int key)
>          * Unlock temporarily and wait for completion.
>          */
>         spin_unlock_irqrestore(&optee->notif.lock, flags);
> -       wait_for_completion(&entry->c);
> +       if (timeout !=3D 0) {
> +               if (!wait_for_completion_timeout(&entry->c, timeout))
> +                       rc =3D -ETIMEDOUT;
> +       } else {
> +               wait_for_completion(&entry->c);
> +       }
>         spin_lock_irqsave(&optee->notif.lock, flags);
>
>         list_del(&entry->link);
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index 7a5243c78b55..da990c4016ec 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -252,7 +252,7 @@ struct optee_call_ctx {
>
>  int optee_notif_init(struct optee *optee, u_int max_key);
>  void optee_notif_uninit(struct optee *optee);
> -int optee_notif_wait(struct optee *optee, u_int key);
> +int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
>  int optee_notif_send(struct optee *optee, u_int key);
>
>  u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_pa=
rams,
> diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee_=
rpc_cmd.h
> index f3f06e0994a7..99342aa66263 100644
> --- a/drivers/tee/optee/optee_rpc_cmd.h
> +++ b/drivers/tee/optee/optee_rpc_cmd.h
> @@ -41,6 +41,7 @@
>   * Waiting on notification
>   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_WAIT
>   * [in]    value[0].b      notification value
> + * [in]    value[0].c      timeout in millisecond or 0 if no timeout

milliseconds

>   *
>   * Sending a synchronous notification
>   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_SEND
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index e69bc6380683..14e6246aaf05 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -130,6 +130,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct t=
ee_context *ctx,
>  static void handle_rpc_func_cmd_wq(struct optee *optee,
>                                    struct optee_msg_arg *arg)
>  {
> +       int rc =3D 0;
> +
>         if (arg->num_params !=3D 1)
>                 goto bad;
>
> @@ -139,7 +141,8 @@ static void handle_rpc_func_cmd_wq(struct optee *opte=
e,
>
>         switch (arg->params[0].u.value.a) {
>         case OPTEE_RPC_NOTIFICATION_WAIT:
> -               if (optee_notif_wait(optee, arg->params[0].u.value.b))
> +               rc =3D optee_notif_wait(optee, arg->params[0].u.value.b, =
arg->params[0].u.value.c);
> +               if (rc)
>                         goto bad;
>                 break;
>         case OPTEE_RPC_NOTIFICATION_SEND:
> @@ -153,7 +156,10 @@ static void handle_rpc_func_cmd_wq(struct optee *opt=
ee,
>         arg->ret =3D TEEC_SUCCESS;
>         return;
>  bad:
> -       arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
> +       if (rc =3D=3D -ETIMEDOUT)
> +               arg->ret =3D TEEC_ERROR_BUSY;

TEEC_ERROR_BUSY is confusing. How about TEE_ERROR_TIMEOUT? We normally
only use TEEC_XXX error codes, but GP doesn't define a
TEEC_ERROR_TIMEOUT so it's better to use the GP-defined
TEE_ERROR_TIMEOUT.

Cheers,
Jens

> +       else
> +               arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
>  }
>
>  static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
> --
> 2.18.0
>

