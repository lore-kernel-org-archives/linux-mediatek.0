Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D7BCD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 15:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1lEAaITg61rMOKoeV9sGqIv6NT56UG0eY9VP45Si6Hs=; b=zxSvqNIfKGcC9O59L9lfesqf2E
	QApbI9dG0k/YE7BaYT0Gq+bpzc3/OFxRbAuDAYM6R6WZEfMxT+9FApBJ7L9vJ7S5bj6kAvpLNovgo
	304xIWlnY/uuj0ByKarc3wNoztpMEWb1Cf1bFnI7J5uFlvZmKwcP8bx3eOoAIx37Mp+8igygZ7XXI
	74xiS5rQNucHhPM9npkzx5+jYJDpvLCPXHoEcNE7pyV9ZWlaiarYEaBbjyqt1SXNrkwsolmvzMESa
	zyJQgMKmjQHVbQ3j+RzdI9d8mOPHh1SWrV4cG+l5En9wBuvmIhYrFaZIp9M2Sd0LYgjIRAzPNcH46
	USRx1RIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl95P-0000000Es2u-39eo;
	Mon, 02 Sep 2024 15:35:23 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl925-0000000ErCc-1QJd;
	Mon, 02 Sep 2024 15:31:58 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-53345604960so4906965e87.3;
        Mon, 02 Sep 2024 08:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725291115; x=1725895915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1lEAaITg61rMOKoeV9sGqIv6NT56UG0eY9VP45Si6Hs=;
        b=d63JS1egrLCTz2G9MSJf0E0JlC2Ju7MrBvWo1p1XeV+Jxku8joTqefMVptXbbkubmn
         PT4oOu+5/7BUMrE/v/cl95Lz5nHMQq9U2gdvsQfCtco27vhhErbTzcSYtCGXGNJU8hvC
         3b67z2c9HtXSnSiihEbr7wDZb+XPqEy5R3mBnABbWVt3DXC+TWbkSUGi46pXLFX6tY/E
         rjbjEEp7cLwZVxePhXhRbpW1d+jvoFa74Q32PYfNQqo4L4MvqXSw8Vi2bZz3pvruzuYD
         LRLBaX8Ie0/awV34xlzmXc7Ng8BRscghLeqO375kvMFooS55sFqW2yULrmHiUruFLLTb
         z3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725291115; x=1725895915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lEAaITg61rMOKoeV9sGqIv6NT56UG0eY9VP45Si6Hs=;
        b=L+PbfMXb/kkFKzPhrs+MdYQwyrhQ87CbAs5Hv5k8mZcJeFFiH3d7A3jTDZ9u78bH6s
         gCWLAW/ksiFALwIWiZBnIJ7h0RDL1bBIzExbu4UCGs4TXLt/PQbXynOAV5/0P6jTKiDC
         9vqOZpJxsbNrp4dsEXwI82ie83z6Y46pBtOikR1NSQE3tCr6DamqP2E6Xmg5KYWBNSyZ
         YSjAChp4kSxNX92NhjQ0sdzw8amUhLy4AFmGUu/JPnXWKxuQU1ThH/yaEc3xN68AASGK
         XEIcXC99JBYLsc+WYAn47fN1MyTSvnixWz+8YibaM28oCy6bkgNd/dR5YPq3WC/xLQIp
         7eig==
X-Forwarded-Encrypted: i=1; AJvYcCU4l5wzxLXFmxgY23cmGYbZOYJvws+2XJ+HHPO/46SrYN0LJNexJYOc5QQIIWkBhvstNR8ks6CD7ahOdo0xvci+@lists.infradead.org, AJvYcCUbu5E54enehnkN6SLMbxW5279934PMFMszgtiJVr6fYuI8zghW45rt6hwHrMJxckVz1WXuL2nJpQh3jE5Y4Nc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGt48PaP/H4TObWuKze1zyl9vDN77mAyDfSELy8cGHuweoO4U7
	lkhmG2apuNUrdZbOBXKZARqPynzu3QncSBOgdZUVPvrjhRCJm6b7
X-Google-Smtp-Source: AGHT+IGYGf8VX7LIcYOgdyPmt731pfn6LVYofo2CruraVVYwx7aQjpnX8k6VgUS23jgFdINd2tm2Fw==
X-Received: by 2002:a05:6512:a92:b0:533:77d:1176 with SMTP id 2adb3069b0e04-53546af3011mr6978933e87.4.1725291114527;
        Mon, 02 Sep 2024 08:31:54 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989233403sm569728466b.212.2024.09.02.08.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 08:31:53 -0700 (PDT)
Message-ID: <f6566469-36fe-4cf8-b1c1-4a476e5c5645@gmail.com>
Date: Mon, 2 Sep 2024 17:31:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: mediatek: cmdq: Remove cmdq_pkt_finalize()
 helper function
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-4-chunkuang.hu@kernel.org>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20240901143259.16849-4-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_083157_419107_E9FDAE11 
X-CRM114-Status: GOOD (  16.27  )
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

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 22 ----------------------
>   include/linux/soc/mediatek/mtk-cmdq.h  | 13 -------------
>   2 files changed, 35 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index a8fccedba83f..2a47dda4dd4a 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -538,27 +538,5 @@ int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_eoc);
>   
> -int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> -{
> -	struct cmdq_instruction inst = { {0} };
> -	int err;
> -
> -	/* insert EOC and generate IRQ for each command iteration */
> -	inst.op = CMDQ_CODE_EOC;
> -	inst.value = CMDQ_EOC_IRQ_EN;
> -	err = cmdq_pkt_append_command(pkt, inst);
> -	if (err < 0)
> -		return err;
> -
> -	/* JUMP to end */
> -	inst.op = CMDQ_CODE_JUMP;
> -	inst.value = CMDQ_JUMP_PASS >>
> -		cmdq_get_shift_pa(((struct cmdq_client *)pkt->cl)->chan);
> -	err = cmdq_pkt_append_command(pkt, inst);
> -
> -	return err;
> -}
> -EXPORT_SYMBOL(cmdq_pkt_finalize);
> -
>   MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 5bee6f7fc400..0c3906e8ad19 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -391,14 +391,6 @@ int cmdq_pkt_jump_rel(struct cmdq_pkt *pkt, s32 offset, u8 shift_pa);
>    */
>   int cmdq_pkt_eoc(struct cmdq_pkt *pkt);
>   
> -/**
> - * cmdq_pkt_finalize() - Append EOC and jump command to pkt.
> - * @pkt:	the CMDQ packet
> - *
> - * Return: 0 for success; else the error code is returned
> - */
> -int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
> -
>   #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
>   
>   static inline int cmdq_dev_get_client_reg(struct device *dev,
> @@ -519,11 +511,6 @@ static inline int cmdq_pkt_eoc(struct cmdq_pkt *pkt)
>   	return -EINVAL;
>   }
>   
> -static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
> -{
> -	return -EINVAL;
> -}
> -
>   #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
>   
>   #endif	/* __MTK_CMDQ_H__ */

