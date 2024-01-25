Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A513C48260
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 09:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKjEA1ufSVAWNn9i+0G+DRJUHaevlwhyDkwZbs4cgCo=; b=I602AZabNkaPJIV2lLFwQLNn4y
	RvgNhEPl7/MN2gZSpbuiaHoTH9RruBgWvJidgagP0xF040Vnx+wllelTVlA9hTWasx0Uf7oph4y4o
	NQI6rLkc/6XKf7sGk/OCBy5CP/Tc976zXNwaCO/k4GHi6NW7L2i5Nmun2USPIr87e1jUgi53B4wqn
	THqNQ3ksjMCXMeje7DVT9aEvQcYp2Dh1uuZmYpFGQAFjHCmnHSi3fCSxLbIYp/RfagHbZMZ/aClKm
	S4SUBm74bLvTGY+bjxYVUSjTv0twI9TK+N++N03Q3oyq4tsPzGZHkdb/dnvYyQZ0TV4KmIqcG8OLw
	Uza8lNCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwJh-007dMT-18;
	Thu, 25 Jan 2024 09:46:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSwJe-007dLI-0T
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jan 2024 09:46:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40eacb4bfa0so45633085e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jan 2024 01:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706175992; x=1706780792; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uKjEA1ufSVAWNn9i+0G+DRJUHaevlwhyDkwZbs4cgCo=;
        b=MATPdCbha34clzdbc3jcXrd/JqQYwyZycJRsueBF6XZlJoLtITAJHO+tVnHD7SoSba
         DG/m9QrvH73xRCkbQVDyxAMH3z74emzEv2HBNl4pjokpMjNSsHo6I+tpi5kbu1D4IA5A
         Xno3L372lxacD5AQVEvZFm3EHDx7Lqx0hjfQEKlxYEonqyljJmH4sw0bIzrUTBC5PyI9
         1E1wpFtBz+rDRJTYWgDERBhTenyO8ajuFRamJQd3JbhTOhNrY06HJE0XEXgF13lwI1zX
         H3mpe2c5cYa6M4hBmSjwI+siBaCPyBcp6ncVFRgOu81H9/Gre+oN/Q/QU12rNRrSR0kW
         ag1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706175992; x=1706780792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uKjEA1ufSVAWNn9i+0G+DRJUHaevlwhyDkwZbs4cgCo=;
        b=r9ixmPyjYJEUm3F0IfMpVmpkVyaJa6IWbz1y2tXcnYuSRJ4sLRSjYb2xS4LGa15zBw
         RxgA88XfrY81+9YjVJso+aBsLHQGuYYrtoTcaY8eStWpR4nTRSWvd8t9HidFTMrvswG9
         VqrB9Ye14yRHpJ9Lm2nEeaj3jgns35QmWKZozFkxUHRZJkWP8IWi8BfS+ZaJRir3PtGL
         v34WAFt5BZicSGxrYTplV8AKEgztVmSoKAKPg2DZHwoJojKgkEHSSacVclWjgF5ax5+y
         0NwxnRQn8BHAaMKKM6a9ZCKKofTquxy8LAqkSH3MGwL+T2gRQuyhmrImJtOwGV1THrMz
         EaEg==
X-Gm-Message-State: AOJu0YxUQDVqxl9doWviGF4HbwAUL0lSj5zlcJ95NiEXFP2d0XupP10y
	84vKDDJWjE+I0Joam6M8BwdxgtiBwTyFp3LkVMPWw5q2kzlLb8lkdk27r0lJZ6A=
X-Google-Smtp-Source: AGHT+IGn/FM9gXJkdJJpOQ1l+2CxmF5gIptmChuQvcivFbgEobBNM7oIX991MqEP8m0r+4vw7WNaCQ==
X-Received: by 2002:a05:600c:a08:b0:40e:69da:4815 with SMTP id z8-20020a05600c0a0800b0040e69da4815mr295213wmp.35.1706175991985;
        Thu, 25 Jan 2024 01:46:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3cb:7bb0:e809:1d8e:6f0b:53c1? ([2a01:e0a:3cb:7bb0:e809:1d8e:6f0b:53c1])
        by smtp.gmail.com with ESMTPSA id j11-20020a05600c190b00b0040e53f24ceasm1956031wmq.16.2024.01.25.01.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:46:31 -0800 (PST)
Message-ID: <d33bad27-da65-4866-96e7-a249824fcb6e@linaro.org>
Date: Thu, 25 Jan 2024 10:46:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] optee: support wq_sleep_timeout
Content-Language: en-US
To: "gavin.liu" <gavin.liu@mediatek.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240125052744.18866-1-gavin.liu@mediatek.com>
From: Jerome Forissier <jerome.forissier@linaro.org>
In-Reply-To: <20240125052744.18866-1-gavin.liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_014634_209809_7CF139AF 
X-CRM114-Status: GOOD (  18.78  )
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



On 1/25/24 06:27, gavin.liu via OP-TEE wrote:
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
> 
> diff --git a/drivers/tee/optee/notif.c b/drivers/tee/optee/notif.c
> index 05212842b0a5..d5e5c0645609 100644
> --- a/drivers/tee/optee/notif.c
> +++ b/drivers/tee/optee/notif.c
> @@ -29,7 +29,7 @@ static bool have_key(struct optee *optee, u_int key)
>  	return false;
>  }
>  
> -int optee_notif_wait(struct optee *optee, u_int key)
> +int optee_notif_wait(struct optee *optee, u_int key, u32 timeout)
>  {
>  	unsigned long flags;
>  	struct notif_entry *entry;
> @@ -70,7 +70,12 @@ int optee_notif_wait(struct optee *optee, u_int key)
>  	 * Unlock temporarily and wait for completion.
>  	 */
>  	spin_unlock_irqrestore(&optee->notif.lock, flags);
> -	wait_for_completion(&entry->c);
> +	if (timeout != 0) {
> +		if (!wait_for_completion_timeout(&entry->c, timeout))
> +			rc = -ETIMEDOUT;
> +	} else {
> +		wait_for_completion(&entry->c);
> +	}
>  	spin_lock_irqsave(&optee->notif.lock, flags);
>  
>  	list_del(&entry->link);
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
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
>  u32 optee_supp_thrd_req(struct tee_context *ctx, u32 func, size_t num_params,
> diff --git a/drivers/tee/optee/rpc.c b/drivers/tee/optee/rpc.c
> index e69bc6380683..14e6246aaf05 100644
> --- a/drivers/tee/optee/rpc.c
> +++ b/drivers/tee/optee/rpc.c
> @@ -130,6 +130,8 @@ static void handle_rpc_func_cmd_i2c_transfer(struct tee_context *ctx,
>  static void handle_rpc_func_cmd_wq(struct optee *optee,
>  				   struct optee_msg_arg *arg)
>  {
> +	int rc = 0;
> +
>  	if (arg->num_params != 1)
>  		goto bad;
>  
> @@ -139,7 +141,8 @@ static void handle_rpc_func_cmd_wq(struct optee *optee,
>  
>  	switch (arg->params[0].u.value.a) {
>  	case OPTEE_RPC_NOTIFICATION_WAIT:
> -		if (optee_notif_wait(optee, arg->params[0].u.value.b))
> +		rc = optee_notif_wait(optee, arg->params[0].u.value.b, arg->params[0].u.value.c);

optee/optee_rpc_cmd.h needs updating (near "Waiting on notification") to reflect the meaning
of value.c.

Was value.c required to be zero prior to this change? Otherwise this could lead to undefined
behavior.
 

> +		if (rc)
>  			goto bad;
>  		break;
>  	case OPTEE_RPC_NOTIFICATION_SEND:
> @@ -153,7 +156,10 @@ static void handle_rpc_func_cmd_wq(struct optee *optee,
>  	arg->ret = TEEC_SUCCESS;
>  	return;
>  bad:
> -	arg->ret = TEEC_ERROR_BAD_PARAMETERS;
> +	if (rc == -ETIMEDOUT)
> +		arg->ret = TEEC_ERROR_BUSY;
> +	else
> +		arg->ret = TEEC_ERROR_BAD_PARAMETERS;
>  }
>  
>  static void handle_rpc_func_cmd_wait(struct optee_msg_arg *arg)

-- 
Jerome

