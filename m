Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB78CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHPPT7ZkbrUn9pl1hVWn7R61jGe9Uaxnb9axyjuhqaM=; b=2YzGcm8VnY/XD33PQEfU+kdEVq
	yaAhtkOognZ9eoxGNSsKOkBhiAGdegks5eDw2DX7yqAgRyC4s6jfQsbObDiB7h6rH9TkQU5vQTD2q
	AaLNBv/Ygz74ZQLtQGg2xqvT4CtiUfYFaUVROp6xvicVZ4ZBuuWqcWx0TmPuTfNOOaKvPTiu/z08L
	iZkZhHP8AUNVVUdC+CUNQEd9MBocu5sxa52+fFmX4Gy+nttBzVmQR7aWHxRgm7ta2h9f+1nERxvrR
	dH0b0UFspEZ1XCbJlAj5XmjrNiH5Fod20V6BAvUoCRI6fZeEYpsXVtn4lRZE0Y6uYUPf5QoDx23av
	E9GK99ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl8la-0000000EoXL-24Zg;
	Mon, 02 Sep 2024 15:14:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl8i3-0000000Enu2-1jnh;
	Mon, 02 Sep 2024 15:11:16 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-533463f6b16so5520103e87.1;
        Mon, 02 Sep 2024 08:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725289873; x=1725894673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oHPPT7ZkbrUn9pl1hVWn7R61jGe9Uaxnb9axyjuhqaM=;
        b=WkM0mp6chilgzkpqn+hQt18k/2V+icvNyBb9ix/SG+5sbfmM4xEV0bLoC+RHdZsnrL
         jzLsuxnfowkAHWP9B93AM9/7GVV+skvI1H8mLlVuwhmtbKRY8fig1lk3llzgF/DG0Tyh
         n2xvvyPot09xPcqHnaB1+SagCHnftDv4SufoYANd552PMXI1B50gVZ7Ln1tYYbZNioI7
         QoJGcZwGRPSuBYDFGXUfK+vMZZPWSEvQ8S2m6TjHNz+O4JK7yO0bNdpfyA7YgSJROrgM
         BWcdNa5nrm58gKRx7z9LBX0rM3Bfd4udywPCvLxTSpoHLZkqCBb8d+AjvaxklR6bVLVZ
         AvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725289873; x=1725894673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHPPT7ZkbrUn9pl1hVWn7R61jGe9Uaxnb9axyjuhqaM=;
        b=h1if6zrpFw2Gk5tWBCfGIy2fZcAjOXogkPQu26m7NovBq/7QSvpxJ9MpdykK0iFzIf
         sjdrTZIRdDjM0INYb8EZ9TH61MO9duRIWTLQia6oLq3WYINSJHgf9BZqwrGf/7FjFLqZ
         DNTHdJE8C6TG5Ee07D9x7wOTdQuQRTiNyqEUyxqxYMDSLmSICzByOUnY7R7FPIn880B2
         IQyg04DmaKovD5uHbQz0+rEOidAHTHgpHtL8ReGwKEqirDcR3COpWmGszRp6zYNW31si
         mNwbF+MFsmRZiBi7egLGE+mmIDcLkvGyTU9zgTm0eUxx0Uc+X/wMz9EhAejHwc/kEf99
         bugw==
X-Forwarded-Encrypted: i=1; AJvYcCV4Mo3tmnOtOEpGl9cE6pB/0lQix8B3MvJf/afPV3dB2GyjSoBxIo+kRn62iChYDEBgR0vW76gMjv1eIODqPWQ=@lists.infradead.org, AJvYcCW9fmNQiP19TbjNnDwC/uGLdh92J4dKD4TCJl9ttOERmCMgz92St3O5jHScwXyZRX8oAFItaDroHgmZ1Nmzq9j4@lists.infradead.org
X-Gm-Message-State: AOJu0YwubDombatYmBcbRSGbzrTVsL5Y3lgMg54YaMT+mKE6zKgD/kR9
	k1qAKCv1AyDtxxOcRsyRTMKP3D0r+CsEg1OnyodUONHv36Sc1yignXQmpQ==
X-Google-Smtp-Source: AGHT+IEhldxyDJcBrDs2vYqNrg252hxWD17bYDAn8+/XFJg2FKk5uLztJCbcGo4d6p/MUi1uw1jGwQ==
X-Received: by 2002:a05:6512:e83:b0:52e:be2c:4b05 with SMTP id 2adb3069b0e04-53546aff49emr7203604e87.21.1725289872514;
        Mon, 02 Sep 2024 08:11:12 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196b79sm567152366b.112.2024.09.02.08.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:11:11 -0700 (PDT)
Message-ID: <a47e464c-6a6e-4121-b521-7dec741caa66@gmail.com>
Date: Mon, 2 Sep 2024 17:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] media: platform: mtk-mdp3: Get fine-grain control
 of cmdq_pkt_finalize()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-2-chunkuang.hu@kernel.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240901143259.16849-2-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_081115_490092_066C71B0 
X-CRM114-Status: GOOD (  17.10  )
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



On 01/09/2024 16:32, Chun-Kuang Hu wrote:
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
>   3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index ea2ea119dd2a..ef5dade35fd3 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -676,7 +676,8 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   		dev_err(dev, "mdp_path_config error %d\n", pp_idx);
>   		goto err_free_path;
>   	}
> -	cmdq_pkt_finalize(&cmd->pkt);
> +	cmdq_pkt_eoc(&cmd->pkt);
> +	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa[pp_idx]);
>   
>   	for (i = 0; i < num_comp; i++) {
>   		s32 inner_id = MDP_COMP_NONE;
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 37e7b985d52c..40623c1980bf 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -312,6 +312,8 @@ static int mdp_probe(struct platform_device *pdev)
>   			ret = PTR_ERR(mdp->cmdq_clt[i]);
>   			goto err_mbox_destroy;
>   		}
> +
> +		mdp->cmdq_shift_pa[i] = cmdq_get_shift_pa(mdp->cmdq_clt[i]->chan);
>   	}
>   
>   	init_waitqueue_head(&mdp->callback_wq);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 430251f63754..05cade1d098e 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -126,6 +126,7 @@ struct mdp_dev {
>   	u32					id_count;
>   	struct ida				mdp_ida;
>   	struct cmdq_client			*cmdq_clt[MDP_PP_MAX];
> +	u8					cmdq_shift_pa[MDP_PP_MAX];
>   	wait_queue_head_t			callback_wq;
>   
>   	struct v4l2_device			v4l2_dev;

