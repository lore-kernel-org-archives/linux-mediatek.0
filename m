Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F8CC47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 15:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTHYIZzUxtAT+UZGnWW/PMLr3D1IxYvIdKjSA4oFUS4=; b=CtkwTkuIl0k0X2iUZoQbm1L40t
	yaBxFdtvI90ODgJl/dgQBHek5waIu4wNL26tpy0mlEp8KPjeuW4j+aeTV6JVBy9qxT0HDOyWNGz6S
	BCfsXhK+sO+nFb74MQeNcv4R3fPpZg8eR+libzTf0YueGxI4/trX48d5QAovLbaLKeJ6BADssuidS
	2YjNro+NXuO0BXNq4Jlcd1SldLMViCu+x0XJJw7p0VwXua52kJD3slDgYaJq8bSHxckYdCpyr/+Vl
	16qIjUNcL0ZNA0UvJSbPLnSgPR3IXmskcvKJIM/+/HeTHk2+zPHJ5oljYbi58zwGyiUHh6Tj0ZLm8
	iM18/6Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1FL-00000000WY0-26HU;
	Thu, 25 Jan 2024 15:02:27 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT1FI-00000000WWO-275m
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 15:02:25 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-214410e969cso415733fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 07:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194942; x=1706799742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XTHYIZzUxtAT+UZGnWW/PMLr3D1IxYvIdKjSA4oFUS4=;
        b=t2kRssBSoxL4VE8HVvCxHMHA47QPw4a8GSNGv/iWsCIzw9X+kDlxhg4hZvpoJaXodn
         gU5JMXNmaeIakUhJFHmt/4VrbNwB+Tehm2ppxtsQCmlwQ+XpHD14iRKS3p0v2mdOLrWJ
         8Mv7QbF8p4U5Iji2cpFV6/AmrtpUIzSatMzpiU1To4Rs7B/2VjyFUT1QAsCwsW9jAt7K
         1UV+dVEuYRRiYgDh6m9rmjegq/4nCrCBbM5HqR9mtSl3WCZmsH/o7n5OWOcMcM6Tasn1
         YRRxzwZqlArFuIj+8aVE5yjA4sXZtOxqjZfraDokBbir/hSLiDGYU9v4SMxBCuOffA3s
         Z2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194942; x=1706799742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XTHYIZzUxtAT+UZGnWW/PMLr3D1IxYvIdKjSA4oFUS4=;
        b=NVvNFBAfu4LOYxjfJ5jNhB/ygmKb/F/sFK8MzhZurjpn0+/Ok+c2EY2IYVN7fpTcfe
         RVpiLkVDVB/doz+hxoyp7OWllBkgkany9Dgeqkhoz4dqsMQkG6NXjC/Kja6m+K42Au3U
         zBY+6s950QqzRvjQMiZx24Iz2HsBkliLdeWHGxNoxYGiK4mvNOmFU1FYZy+UBLhCXstL
         ZNG8PNgJRvKhDqPzceuVI0kBTOzGOokE0OVB7A9mPTw3hVh+nWgBzB2WApczsTAtMuYV
         VEa1oR2v/QuBUpgJfOz7XuTP9G780ibn8HjUPHjZXorBJGbfOLcfWzWA2sZBTviZfVSu
         Wi8Q==
X-Gm-Message-State: AOJu0YxA31eRD5pKTb15CkbbSTaWftMBxLLfzqljrJPXsflNi9UzfDAA
	BboUUUhaWKy/DGupJ0YpvVDawFCzb636hi0vKtx4bGaTfxVi/NxMUxouS+5KW7e5a1sdRKW6l72
	G6HAWcqWurMpSX/kTtKfhppJa2jp0U072NystRw==
X-Google-Smtp-Source: AGHT+IH18fERkDlyVopUGZsEyzj2rkiDR7TmWSqJRbHrxYPyuZZATjZVn5OWkncC1o6/boI68kzvD+uz9/xOct5JPB4=
X-Received: by 2002:a05:6870:9e9c:b0:214:d0c9:b8d9 with SMTP id
 pu28-20020a0568709e9c00b00214d0c9b8d9mr433312oab.1.1706194940332; Thu, 25 Jan
 2024 07:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20240125052744.18866-1-gavin.liu@mediatek.com>
In-Reply-To: <20240125052744.18866-1-gavin.liu@mediatek.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 25 Jan 2024 16:02:08 +0100
Message-ID: <CAHUa44EcGnOno8TQ-wPE8Q_ghG8t5J5uRLqnYduAnQXx6oRATg@mail.gmail.com>
Subject: Re: [PATCH] optee: support wq_sleep_timeout
To: "gavin.liu" <gavin.liu@mediatek.com>
Cc: Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, op-tee@lists.trustedfirmware.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Jerome Forissier <jerome.forissier@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_070224_578355_B4F714E5 
X-CRM114-Status: GOOD (  19.47  )
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

On Thu, Jan 25, 2024 at 6:28=E2=80=AFAM gavin.liu <gavin.liu@mediatek.com> =
wrote:
>
> From: Gavin Liu <gavin.liu@mediatek.com>
>
> Add wq_sleep_timeout to support self waking when timeout for secure
> driver usage.
>
> Signed-off-by: Gavin Liu <gavin.liu@mediatek.com>
> ---
>  drivers/tee/optee/notif.c         |  9 +++++++--
>  drivers/tee/optee/optee_private.h |  2 +-
>  drivers/tee/optee/rpc.c           | 10 ++++++++--
>  3 files changed, 16 insertions(+), 5 deletions(-)

I'd like to see the corresponding secure world changes taking
advantage of this ABI change before we take this any further.

Thanks,
Jens

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
> +       else
> +               arg->ret =3D TEEC_ERROR_BAD_PARAMETERS;
>  }
>
>  static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
> --
> 2.18.0
>

