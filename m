Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E56FC04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33VnrnZQnXRRdfZfVThbMcf3rBaLFM2cLbyWTGtXaGE=; b=JpTG7Op3RY3dEEDDmwi7H9O16T
	Tqb5hgQaCjsEGlXGet+opwmeL8lQFRv/+2VPCbusD+Kbp8jhqJE8liGukJ9bnCDsVDMJkYCMh1Als
	+IIzI5HOII1X0X4HfQn0XFbtizf+mIwEY4d/lz5bIQjjdN00rQlsNd0h7SsKDG5pgpBH7sLb4NRm4
	fo6MLMhFVyaQmFV5+JrYI/rDsl9xUH7pOhVP/9S1aiRFyUk+inHVbnwn5h8aHDbz7unwkd45NNKye
	do6WHjVdvXY1hpbgKi3qZGuiaNnoRv6ujySynDS/PTJJbwcE3Np1SP3t7DVTCkpkayw1KklN1rn4G
	Tmd90ZYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90XV-0000000ECI5-0hBz;
	Mon, 20 May 2024 10:46:45 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90XS-0000000ECGw-0YD9
	for linux-mediatek@lists.infradead.org;
	Mon, 20 May 2024 10:46:43 +0000
Received: by mail-ua1-x92b.google.com with SMTP id a1e0cc1a2514c-7f16ff3aa61so793648241.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 May 2024 03:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716201999; x=1716806799; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=33VnrnZQnXRRdfZfVThbMcf3rBaLFM2cLbyWTGtXaGE=;
        b=a0E3Z7cZ5TqcxyDwbCX9nbF0zicJWKZwZ6VBJvO2OLfMS9rSxKAvSKJgrEZT1M6CH+
         GHTdhDO3kf6ufJMZGTrJBVClypy5iNTOu7qqcD3tWccO+CiZiEd7/j5SOfrqTwWX0YUh
         zE+q5ssOpXyJLYCokzKzRFovoFqqWbIXuMbWetx2lkQNWZv59K8jx20COvagTulOvjd1
         Nza52G5bbEG+imIFYiyBbG3SEg//woTMpoFJ15wK4LFzFfQ8tkaQQl4sFMzaBkou7etm
         uTz8vqL7IypS2fvwj2WZwRMp3PMJVh9dUj136yZuNsdFj/frpTVM5+Od0Ldeup/aQIfP
         d57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716201999; x=1716806799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33VnrnZQnXRRdfZfVThbMcf3rBaLFM2cLbyWTGtXaGE=;
        b=Uqo2KNdJISzvf88HhNZjPu0CFKxOrW2kQw1WWcSwx+TTjbOWeQMQW/vcZiSRbQcnNb
         Z2kvGqf8556WR1wiExMDHrGXZj+93OJbW92Sme/YABbYGF1wb05ThbNEbw9ncmoLh0a5
         v+sqvpY/ZTZ2bYrkVtf/Kf7DSOsYfJFtKxJ9dhJWqmLZz+lZaU560w6czKdGARHjIm4A
         RRSw0qTSYMwJaiEI1scJpinDbNxFgkj252ZnW+KrxT2B1vXdPoAtkM5ykIc7i2+y3rL7
         o2ZBzXz8GTcOz+Z530MECOqnpITEjAPB88r0/FL87q9R/91FMkshydhY5xnulnO0r7ck
         1gAg==
X-Forwarded-Encrypted: i=1; AJvYcCX2U9b/oq2qm1Eabn1pV7s1MsePLPbduMX7awkwccVINDCr3GLn+zDajVlCNMKCR3muCiIlkkb//sRSUhFbHzqj3f4b0yBpea92G/jI3QkgOZtU
X-Gm-Message-State: AOJu0YwVZwc7/PxJavWM5PHrFnabRTAf8/Cs7DVJqR0dcBRSsNIAoXo2
	M56LFhK+bv7P980FQ5ZQoGpQo6LQUFnaY8JK6mV45TqlEr0DTINI4B8gZampbcRfwSgXjWNOePA
	Q575ECpNGzPzBMBN+8q4GgayNqszK49D08/kRWA==
X-Google-Smtp-Source: AGHT+IGs3xAJDCVogm4isgBXwwArR/oG+a8UL/2JuAU4s5nJywQAM3yVXZncptK/GUfVpwY1Us0rOwSRkd1XTe+hwz0=
X-Received: by 2002:a05:6102:3707:b0:47c:24fa:b627 with SMTP id
 ada2fe7eead31-48077de52e5mr31442181137.13.1716201999159; Mon, 20 May 2024
 03:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240507020037.14009-1-gavin.liu@mediatek.com>
In-Reply-To: <20240507020037.14009-1-gavin.liu@mediatek.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Mon, 20 May 2024 16:16:28 +0530
Message-ID: <CAFA6WYN79E8Hyxsaxu20hkyNebMqBWV7az5ByekTuii7Y7qjng@mail.gmail.com>
Subject: Re: [PATCH v3] optee: add timeout value to optee_notif_wait() to
 support timeout
To: "gavin.liu" <gavin.liu@mediatek.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_034642_184722_430096B3 
X-CRM114-Status: GOOD (  24.49  )
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

Hi,

On Tue, 7 May 2024 at 07:31, gavin.liu <gavin.liu@mediatek.com> wrote:
>
> From: Gavin Liu <gavin.liu@mediatek.com>
>
> Add timeout value to support self waking when timeout to avoid waiting
> indefinitely.
>
> Signed-off-by: Gavin Liu <gavin.liu@mediatek.com>
> ---
> change in v3:
> 1. change the comment in optee_rpc_cmd.h
> 2. add macro for "TEE_ERROR_TIMEOUT"
> 3. change from "TEEC_ERROR_BUSY" to "TEE_ERROR_TIMEOUT"
> ---
>  drivers/tee/optee/notif.c         |  9 +++++++--
>  drivers/tee/optee/optee_private.h |  5 ++++-
>  drivers/tee/optee/optee_rpc_cmd.h |  1 +
>  drivers/tee/optee/rpc.c           | 10 ++++++++--
>  4 files changed, 20 insertions(+), 5 deletions(-)
>

Although the change looks reasonable to me, can you point me to
corresponding OP-TEE OS changes to be sure that ABI compatibility is
maintained?

-Sumit

> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> index 0d7878e770cd..1970880c796f 100644
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
> +       if (timeout != 0) {
> +               if (!wait_for_completion_timeout(&entry->c, timeout))
> +                       rc = -ETIMEDOUT;
> +       } else {
> +               wait_for_completion(&entry->c);
> +       }
>         spin_lock_irqsave(&optee->notif.lock, flags);
>
>         list_del(&entry->link);
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
> index 429cc20be5cc..424898cdc4e9 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -26,6 +26,9 @@
>  #define TEEC_ERROR_BUSY                        0xFFFF000D
>  #define TEEC_ERROR_SHORT_BUFFER                0xFFFF0010
>
> +/* API Return Codes are from the GP TEE Internal Core API Specification */
> +#define TEE_ERROR_TIMEOUT              0xFFFF3001
> +
>  #define TEEC_ORIGIN_COMMS              0x00000002
>
>  /*
> @@ -252,7 +255,7 @@ struct optee_call_ctx {
>
>  int optee_notif_init(struct optee *optee, u_int max_key);
>  void optee_notif_uninit(struct optee *optee);
> -int optee_notif_wait(struct optee *optee, u_int key);
> +int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
>  int optee_notif_send(struct optee *optee, u_int key);
>
>  u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
> diff --git a/drivers/tee/optee/optee_rpc_cmd.h b/drivers/tee/optee/optee_rpc_cmd.h
> index f3f06e0994a7..4576751b490c 100644
> --- a/drivers/tee/optee/optee_rpc_cmd.h
> +++ b/drivers/tee/optee/optee_rpc_cmd.h
> @@ -41,6 +41,7 @@
>   * Waiting on notification
>   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_WAIT
>   * [in]    value[0].b      notification value
> + * [in]    value[0].c      timeout in milliseconds or 0 if no timeout
>   *
>   * Sending a synchronous notification
>   * [in]    value[0].a      OPTEE_RPC_NOTIFICATION_SEND
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index f086812f1179..5de4504665be 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -130,6 +130,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
>  static void handle_rpc_func_cmd_wq(struct optee *optee,
>                                    struct optee_msg_arg *arg)
>  {
> +       int rc = 0;
> +
>         if (arg->num_params != 1)
>                 goto bad;
>
> @@ -139,7 +141,8 @@ static void handle_rpc_func_cmd_wq(struct optee *optee,
>
>         switch (arg->params[0].u.value.a) {
>         case OPTEE_RPC_NOTIFICATION_WAIT:
> -               if (optee_notif_wait(optee, arg->params[0].u.value.b))
> +               rc = optee_notif_wait(optee, arg->params[0].u.value.b, arg->params[0].u.value.c);
> +               if (rc)
>                         goto bad;
>                 break;
>         case OPTEE_RPC_NOTIFICATION_SEND:
> @@ -153,7 +156,10 @@ static void handle_rpc_func_cmd_wq(struct optee *optee,
>         arg->ret = TEEC_SUCCESS;
>         return;
>  bad:
> -       arg->ret = TEEC_ERROR_BAD_PARAMETERS;
> +       if (rc == -ETIMEDOUT)
> +               arg->ret = TEE_ERROR_TIMEOUT;
> +       else
> +               arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>  }
>
>  static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)
> --
> 2.18.0
>

