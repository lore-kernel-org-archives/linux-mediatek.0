Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8F9CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgWcvugTcq0n4IcB8sHG/SbLm3GxVM4wHTGq3cvMrNM=; b=Eyk0F3oOg8fEvexTmFytl8YRvF
	cTgUL0/2XAoWAhkyQgSnVQgvKEMGSij1PDyLMLl8sgWcO07GqsY8lGbgU89+OVYwwKlIyWI8WTi4F
	CUDkfVY9op45ZHJdFmT0oOK3QrU3zttdl81yLpbanGdPuLcqSGQ9IjS5Xqs08OriWzOmnTIMm7w1D
	pJgyS9H5YFlc7r9+KZLazg00bXlI3lLe//RB0y/vPOwlYs8sFa236rhHEz72KARAYdd1zH1K3i25S
	nnxi4wTIGgGWT1U2fXSkygDfAYObdqdwP1eYOrcuZq4sUtNNEx3VrG+sR6JFlCm3mhwAKd7QI54Ox
	sFKquXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl94X-0000000Erl1-29Pl;
	Mon, 02 Sep 2024 15:34:29 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl91d-0000000Er22-40eQ;
	Mon, 02 Sep 2024 15:31:31 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2f3f163e379so70766911fa.3;
        Mon, 02 Sep 2024 08:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725291088; x=1725895888; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zgWcvugTcq0n4IcB8sHG/SbLm3GxVM4wHTGq3cvMrNM=;
        b=jjvpK8LWC7V/yODzUJsPvfPfnVV/r73luOATfD5WwdibJVj8up32Z4QpVGYzwq8I5Y
         +qCjUZolvlO3av/CvccEQJhULow4NC4Asp20naMxKxS2OL04BVN6NL5/4PbsIKYV8ZNc
         me8hcIqLJs34GKMKwu9J/BMKnVAdYDVcRcwsl52Zv3fDu4ns9mSy/8qzDdB/60kLM8X1
         +xPb+bF6ESBHnhRWRRAECgtD8o8sHZ6q1go077TN/xeMnN8mTjpx9z60kloG0kUr/48p
         a6Wyfg+yWmLdG44bSXHXPf5Hcs8dh5EInzMge3KZ2Ogz4iakdtT9fS3vJxKngb574Kn4
         mefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291088; x=1725895888;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgWcvugTcq0n4IcB8sHG/SbLm3GxVM4wHTGq3cvMrNM=;
        b=glTOS+0ap1IXBmA9yLJcGbDiQkgQsIZmo1jayyvoXNRps1eZ9nvUmc0TBmFRGHmb7V
         hRmt95apkw5UjZ9L/jjvgnPuk69xvMLR6/24IikK7vxDB0FmPQpO+X/Ed3DLArL1qrdL
         pNl32LWAwDEwOoLsNx7ep50huPw3Kqy1qSo/rDatSsMt05h0Vycys6L+a0BIPFfqds2b
         gs6sQiOWx2KjrTbbnINRl2Myl5lcUH6Xx5zdk2KH9airgQXwU43MFcU3qQuVlihi2dGd
         Po6dIII4ZKgT7MLdLK5qTQxQfCJWZ/udbmdQmwADWPYjFOKq0YQuQKRXXTZhI0D1DUmW
         KnPA==
X-Forwarded-Encrypted: i=1; AJvYcCW1UOIeiuelEZIFGEBEZd0cdKTMWl71ZeI3yCFqoKi05DtP5Zgw3ockh/EvNF+/toULqRkkawhToXO4b1tm9eW0@lists.infradead.org, AJvYcCWv4wdq9ps+9Ek8fhn2yFjzaOnyLYSLYO12UA3H/sZRb2Yxqlke/0EMr4BBph+ulxcoZi/Fq+M7VKr2nd33Roc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6hjjOaDj1ze+hZMO8F/2y1AqErM7B3nVZ+ZqV9UPKq28RwWNP
	vRA2YhiUON4O5UJUGqWuP38GD/Yvva+g4uokp85pts4SYn3qe6AB
X-Google-Smtp-Source: AGHT+IHxV1Ic5u6QxGdGvSwxSn91NdIhv16sGfo2ufqHeeF2dqvYS7NMoiTVZIKB1TAarfANOvwn5g==
X-Received: by 2002:a05:651c:19a3:b0:2ef:c8a1:ff4 with SMTP id 38308e7fff4ca-2f6105c49a9mr126039951fa.7.1725291087133;
        Mon, 02 Sep 2024 08:31:27 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900e95dsm573187066b.54.2024.09.02.08.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:31:25 -0700 (PDT)
Message-ID: <1d4e9e86-aaaf-4d19-b89f-6f7207ab72d8@gmail.com>
Date: Mon, 2 Sep 2024 17:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-3-chunkuang.hu@kernel.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240901143259.16849-3-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_083130_037361_8B918A03 
X-CRM114-Status: GOOD (  18.30  )
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
> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
> instead of implementing mdp3 version.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 46 ++-----------------
>   .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
>   2 files changed, 6 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index ef5dade35fd3..740a484c8eb4 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -471,43 +471,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
>   	return 0;
>   }
>   
> -static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
> -			       size_t size)
> -{
> -	struct device *dev;
> -	dma_addr_t dma_addr;
> -
> -	pkt->va_base = kzalloc(size, GFP_KERNEL);
> -	if (!pkt->va_base)
> -		return -ENOMEM;
> -
> -	pkt->buf_size = size;
> -	pkt->cl = (void *)client;

cmdq_pkt_create does not set the callback. Why doesn't that break things?
Same holds for the crtc driver that is already in linux-next.

Regards,
Matthias

> -
> -	dev = client->chan->mbox->dev;
> -	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
> -				  DMA_TO_DEVICE);
> -	if (dma_mapping_error(dev, dma_addr)) {
> -		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
> -		kfree(pkt->va_base);
> -		return -ENOMEM;
> -	}
> -
> -	pkt->pa_base = dma_addr;
> -
> -	return 0;
> -}
> -
> -static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> -{
> -	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
> -
> -	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
> -			 DMA_TO_DEVICE);
> -	kfree(pkt->va_base);
> -	pkt->va_base = NULL;
> -}
> -
>   static void mdp_auto_release_work(struct work_struct *work)
>   {
>   	struct mdp_cmdq_cmd *cmd;
> @@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
>   		wake_up(&mdp->callback_wq);
>   	}
>   
> -	mdp_cmdq_pkt_destroy(&cmd->pkt);
> +	cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>   	kfree(cmd->comps);
>   	cmd->comps = NULL;
>   	kfree(cmd);
> @@ -578,7 +541,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
>   		if (refcount_dec_and_test(&mdp->job_count))
>   			wake_up(&mdp->callback_wq);
>   
> -		mdp_cmdq_pkt_destroy(&cmd->pkt);
> +		cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>   		kfree(cmd->comps);
>   		cmd->comps = NULL;
>   		kfree(cmd);
> @@ -620,7 +583,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   		goto err_uninit;
>   	}
>   
> -	ret = mdp_cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
> +	ret = cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
>   	if (ret)
>   		goto err_free_cmd;
>   
> @@ -700,6 +663,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   	cmd->comps = comps;
>   	cmd->num_comps = num_comp;
>   	cmd->mdp_ctx = param->mdp_ctx;
> +	cmd->pp_idx = pp_idx;
>   
>   	kfree(path);
>   	return cmd;
> @@ -711,7 +675,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>   err_free_comps:
>   	kfree(comps);
>   err_destroy_pkt:
> -	mdp_cmdq_pkt_destroy(&cmd->pkt);
> +	cmdq_pkt_destroy(mdp->cmdq_clt[pp_idx], &cmd->pkt);
>   err_free_cmd:
>   	kfree(cmd);
>   err_uninit:
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
> index 53a30ad7e0b0..935ae9825728 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
> @@ -35,6 +35,7 @@ struct mdp_cmdq_cmd {
>   	struct mdp_comp *comps;
>   	void *mdp_ctx;
>   	u8 num_comps;
> +	u8 pp_idx;
>   };
>   
>   struct mdp_dev;

