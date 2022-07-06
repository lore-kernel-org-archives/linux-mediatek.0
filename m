Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430CBC43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 14:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSq8WqfHcF8s8rYhY1PS7CBcA+fw5f2mGHNNEiY73pY=; b=CDRrPMsTAfHA+/EXYFi1N5ddpB
	IEQ68f7CP+XBnCCIy1YTAzC9JOqVsmhbKjs3R3ougNkRNaLeBwu2H2ARa1TicnV2KXm8vTnEWn7jp
	NoaJ45iB9aNl/0MZ4/o99We3Eoky0zWLWOyRZwxGBSsOUHzwMjsyUfKWvBwDSsZGPh5MDXQZxSWHM
	xk8ENpqGp3XDzmtIboQFiFuxVfbha4NjRHAwuIXyaPCuH/HIx9Fcp6zXX+rFYknHY4CA7UTkQHlkr
	bWHc/BR7SYm8JoQKkLkRe7ncqcLFY0JcAgMkm8+tM2XJUhcbbBc2j8CgEU7tJTzmQ7VNuEmlAZRWd
	OBEK9A3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95t1-00Aagv-84; Wed, 06 Jul 2022 14:20:15 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95sy-00Aafg-C5; Wed, 06 Jul 2022 14:20:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id a5so7606211wrx.12;
        Wed, 06 Jul 2022 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=FSq8WqfHcF8s8rYhY1PS7CBcA+fw5f2mGHNNEiY73pY=;
        b=XhWdtJ8rpY9y7CQyOSXtpCPpTCnYrUYSXQ0jeWL1/I3o8K1eoLiXBrx5ZpHJD6TRJP
         TESsbkDpysXiE6s6LleuwAV9UoOqJAzWL1xZX/8Co9EWLPIzpz0rG6Hw9/bUtZJ92cOG
         5G85XMElRJaMaR6cIVRGMWIJ19YDutxp3OVzZV6lO4YaXq3tiDkrn5+eiqIpu235YGHV
         OiUi6ZLVf/44ItPzGuyaA3vMcwTTVUQxi/texvIWRs0mfJ7rAeBaOvzYEgtxShXBeCMg
         rkWob8AKrLB7n02jNd8hgBJQ9Cb9d0zRIDyJQBmqZ4IS9G8P/UEoLDKZGPbR9ldBmNc5
         6F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FSq8WqfHcF8s8rYhY1PS7CBcA+fw5f2mGHNNEiY73pY=;
        b=3UYpo1POVfyRBydf5o68CXpFkWqVTpe0P7gJyDEdPS6tvGEBkJgRQhJsFtr1ODBFtf
         NMjaGmXdzoNLDWc9XhPiCn34MQQbnv0xi0bQp+hC+Ch1vZODUes/UuzoISFa2Z97K9OR
         mezZBn+ZUze8oAIGtJcjmUqzigjlPt7vI8w/Zy/OmyqxEXp/T/ZdW7u/hGuACLTh41QC
         tLTfdnLLAuBSTXGOQcj9V7chvRdYQOwm67tbg/ocaIjmL2SGNx9r7LgoZA7yn2zn9U0Q
         SX8TYTwcndVnxk1Ct0/tXowCgxZUzqzQOfbVamX+I9FeYVfR8va1MGF3OXiXoynYPuLZ
         ARvA==
X-Gm-Message-State: AJIora+CTu4ymzMqDCOpFAYSnYmgdRxIvXIT/LVddzM/EVQL6NM82cf8
	EYLFH6ZtPEsWc8cJJmllNyg=
X-Google-Smtp-Source: AGRyM1sZXnl/+u5Hd68LiJOgcVcmcBljAIltD5f9WGcN6SPMvlCo3uIgoQrwv5vNdv+1a30cduT9OA==
X-Received: by 2002:adf:d1eb:0:b0:21b:dbb5:fe05 with SMTP id g11-20020adfd1eb000000b0021bdbb5fe05mr38073330wrd.651.1657117208600;
        Wed, 06 Jul 2022 07:20:08 -0700 (PDT)
Received: from [192.168.0.14] ([37.223.147.254])
        by smtp.gmail.com with ESMTPSA id c8-20020a05600c0a4800b003a02f957245sm22279041wmq.26.2022.07.06.07.20.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 07:20:07 -0700 (PDT)
Message-ID: <65d390ab-7f80-8bd4-66f5-442c46da4f00@gmail.com>
Date: Wed, 6 Jul 2022 16:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] soc: mediatek: Add mmsys func to adapt to dpi output
 for MT8186
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, yongqiang.niu@mediatek.com,
 enric.balletbo@collabora.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com
References: <1656645344-12062-1-git-send-email-xinlei.lee@mediatek.com>
 <1656645344-12062-2-git-send-email-xinlei.lee@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <1656645344-12062-2-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_072012_462968_B66E14D2 
X-CRM114-Status: GOOD (  17.65  )
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



On 01/07/2022 05:15, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys func to manipulate dpi output format config for MT8186.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>   drivers/soc/mediatek/mt8186-mmsys.h    | 1 +
>   drivers/soc/mediatek/mtk-mmsys.c       | 8 ++++++++
>   include/linux/soc/mediatek/mtk-mmsys.h | 2 ++
>   3 files changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
> index eb1ad9c37a9c..0b450b00b829 100644
> --- a/drivers/soc/mediatek/mt8186-mmsys.h
> +++ b/drivers/soc/mediatek/mt8186-mmsys.h
> @@ -3,6 +3,7 @@
>   #ifndef __SOC_MEDIATEK_MT8186_MMSYS_H
>   #define __SOC_MEDIATEK_MT8186_MMSYS_H
>   
> +#define MT8186_MMSYS_DUMMY0			0X400

I don't have access to the datasheet, but I really wonder if it's really called 
dummy0. If so, you would need to explain in more detail in the commit message.

Regards,
Matthias

>   #define MT8186_MMSYS_OVL_CON			0xF04
>   #define MT8186_MMSYS_OVL0_CON_MASK			0x3
>   #define MT8186_MMSYS_OVL0_2L_CON_MASK			0xC
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index 2b0b805c65dd..de3f11cb931f 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -252,6 +252,14 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>   
> +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,
> +			       struct cmdq_pkt *cmdq_pkt)
> +{
> +	mtk_mmsys_update_bits(dev_get_drvdata(dev), MT8186_MMSYS_DUMMY0, mask,
> +			      val, cmdq_pkt);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_dpi_confing);
> +
>   void mtk_mmsys_merge_async_config(struct device *dev, int idx, int width, int height,
>   				  struct cmdq_pkt *cmdq_pkt)
>   {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 343e093f0fc3..40c538c0664b 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -90,4 +90,6 @@ void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool alpha_sel, u16
>   void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx, bool channel_swap,
>   				     struct cmdq_pkt *cmdq_pkt);
>   
> +void mtk_mmsys_ddp_dpi_confing(struct device *dev, u32 mask, u32 val,
> +			       struct cmdq_pkt *cmdq_pkt);
>   #endif /* __MTK_MMSYS_H */

