Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FE7CD37B6
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Sep 2024 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=shuryc8UlV73M1Z/RV04h2I1CmqvY0itpik4aNPG9pM=; b=KyxWVGJtZBz7uRo4KX2asZAqSB
	tXIdKXZ/2gpbWzWOFxszRbHG4eBWGEAHLT4uwUczyC6N+QkzjGfQL8DGD25H6frZ4bS8nt9XLhawK
	lBfoxfQZIanHw9Spt3opwR473+yXtUSx3puG0nyohvgDE07QOK557YdLMa/Qfb2zK6pm9Ye1TCWGz
	n+DKymEl8fw4/N0nCR5kRV9Tma3AAYkLR2X5VTD4APafZK+zj0WsyBOllaCzFuYGElJC6vBe5CwW2
	OJmfxhGWadmZ4F7dAVOIFMFGZUswgQ+O+o+pk3As9020cUOPdhoFaSMD/hb7HWGO2nTK5YMLt25eU
	GrIwWwUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slmAa-00000003dgA-2GGA;
	Wed, 04 Sep 2024 09:19:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sllbC-00000003Ty1-2On3;
	Wed, 04 Sep 2024 08:42:48 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42bb7298bdeso70227155e9.1;
        Wed, 04 Sep 2024 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725439365; x=1726044165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=shuryc8UlV73M1Z/RV04h2I1CmqvY0itpik4aNPG9pM=;
        b=JL0RDnjR3LZ59r9W1sJQyLQKO5ky9MNpCRLKDTE+fAXVvgCLfUOdtGLiwkoAWK6Dya
         HzFISoMU9nUohT3Qx/fQ9W9ceKDLPt4h/KmzN33OrK5tYSJ4qhAAVIiLGFutRSfwIWv7
         3ooXY/XYO/Hcqd5nYJE38XCz0aW1gNNbelLYpSecrdEBUxDzlILEpuOFwyTPv2VtLBvx
         NG+yVC5XnnRwJewwuSPOUC/n8q8jcyHnKiCYQklTIv+CtTePg+Br1Y8MnLXM9yGOZFJV
         sRSNmYJJt5U+b/tgohCPyxfVCsszFM3pDPEWKJuCgpBF9BVWO+7pKVB0W/Ey+NYCtkfw
         Yv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439365; x=1726044165;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=shuryc8UlV73M1Z/RV04h2I1CmqvY0itpik4aNPG9pM=;
        b=unzHED3uvZ73/qfQ2zW62E+ZJoSUer9GOBDrgUSGYAK6M1EXG+hZ+oYLOwH5abH5M9
         apd4xqf3TkBGLsdlLdpAVcj0LWjRbg9Q9TOjnhsvST4OQQ3cX2SqBFrhPGLzbqFqsdKW
         BTy5PcvTXSwkVM5XDSg+ZLpGaWg0GelJIM6gbaXgcQ1DYjT4av2h5m00M5A+ico0if2E
         wCTExWitnsLYRYlwA/mzp31l5KWV+ZEDmc2mFDn/Svls9QXw6FpqJLcGKSp8WYKPTi/f
         MRdxFSYH2ee8xQj/50e0zD+C6I22HZqeU17bXZZJ5BRSh+fpFucvMoBiaCuRBDB1xWlp
         RzGw==
X-Forwarded-Encrypted: i=1; AJvYcCW6avL3ewz+BluSepPvp73wRC38sEFGjfKMNCijnypYwevyDdO0j3RSu7GIEapf6D+HVLXzM6EMKdRO7Sy8zv6G@lists.infradead.org, AJvYcCWvsboj4X1u+XJc96FYkjRS5lu6EZiOnMu/1f0y90KTl7j75nAkZ1YAuydSqabkOkfXiy7l4H40H4d2xCJeNZc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+g5u0mwlkghppB2hnGFFBDt3Oj8+evihhfbOMDx0AyY5DU0aE
	r9qWk0cKsvBA0gYjMXGspEPwW/DNBLLQJx/n/KVl42aypYVXb0F2
X-Google-Smtp-Source: AGHT+IF/pOUJJl0LCA5WpJcCGZEm59/Vf3Hin0V6BO18X7t+yP5gInTEKJS1DwObTNtwuSa8H+xXaw==
X-Received: by 2002:a05:600c:1391:b0:426:6f87:65fc with SMTP id 5b1f17b1804b1-42bb01c19c0mr181812735e9.17.1725439364028;
        Wed, 04 Sep 2024 01:42:44 -0700 (PDT)
Received: from [192.168.0.20] ([148.56.230.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc127ec5sm169965315e9.19.2024.09.04.01.42.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:42:43 -0700 (PDT)
Message-ID: <e58b27cc-69a8-4338-827c-c27f09856802@gmail.com>
Date: Wed, 4 Sep 2024 10:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] media: platform: mtk-mdp3: Use cmdq_pkt_create()
 and cmdq_pkt_destroy()
To: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?UTF-8?B?TW91ZHkgSG8gKOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
References: <20240901143259.16849-1-chunkuang.hu@kernel.org>
 <20240901143259.16849-3-chunkuang.hu@kernel.org>
 <1d4e9e86-aaaf-4d19-b89f-6f7207ab72d8@gmail.com>
 <d5c512d06e013555397722137d5790dc8a627bfd.camel@mediatek.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <d5c512d06e013555397722137d5790dc8a627bfd.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_014246_649573_F13F7BEC 
X-CRM114-Status: GOOD (  18.72  )
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



On 03/09/2024 11:39, CK Hu (胡俊光) wrote:
> Hi, Matthias:
> 
> On Mon, 2024-09-02 at 17:31 +0200, Matthias Brugger wrote:
>>   	
>> External email : Please do not click links or open attachments until you have verified the sender or the content.
>>   
>>
>> On 01/09/2024 16:32, Chun-Kuang Hu wrote:
>>> Use cmdq_pkt_create() and cmdq_pkt_destroy() common function
>>> instead of implementing mdp3 version.
>>>
>>> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>>> ---
>>>    .../platform/mediatek/mdp3/mtk-mdp3-cmdq.c    | 46 ++-----------------
>>>    .../platform/mediatek/mdp3/mtk-mdp3-cmdq.h    |  1 +
>>>    2 files changed, 6 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> index ef5dade35fd3..740a484c8eb4 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
>>> @@ -471,43 +471,6 @@ static int mdp_path_config(struct mdp_dev *mdp, struct mdp_cmdq_cmd *cmd,
>>>    return 0;
>>>    }
>>>    
>>> -static int mdp_cmdq_pkt_create(struct cmdq_client *client, struct cmdq_pkt *pkt,
>>> -       size_t size)
>>> -{
>>> -struct device *dev;
>>> -dma_addr_t dma_addr;
>>> -
>>> -pkt->va_base = kzalloc(size, GFP_KERNEL);
>>> -if (!pkt->va_base)
>>> -return -ENOMEM;
>>> -
>>> -pkt->buf_size = size;
>>> -pkt->cl = (void *)client;
>>
>> cmdq_pkt_create does not set the callback. Why doesn't that break things?
>> Same holds for the crtc driver that is already in linux-next.
> 
> This series is to remove pkt->cl.
> For the helper function whick need pkt->cl, add parameter to pass the cmdq_client information.
> Up to now, only cmdq_pkt_finalize() use pkt->cl, but it is replaced by cmdq_pkt_eoc() and cmdq_pkt_jump_rel() in [PATCH v4 1/3].
> So this would not break any thing.
> 

Right, actually this is explained in the cover letter. Sorry for the noise.

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> Regards,
> CK
> 
>>
>> Regards,
>> Matthias
>>
>>> -
>>> -dev = client->chan->mbox->dev;
>>> -dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
>>> -  DMA_TO_DEVICE);
>>> -if (dma_mapping_error(dev, dma_addr)) {
>>> -dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
>>> -kfree(pkt->va_base);
>>> -return -ENOMEM;
>>> -}
>>> -
>>> -pkt->pa_base = dma_addr;
>>> -
>>> -return 0;
>>> -}
>>> -
>>> -static void mdp_cmdq_pkt_destroy(struct cmdq_pkt *pkt)
>>> -{
>>> -struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
>>> -
>>> -dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
>>> - DMA_TO_DEVICE);
>>> -kfree(pkt->va_base);
>>> -pkt->va_base = NULL;
>>> -}
>>> -
>>>    static void mdp_auto_release_work(struct work_struct *work)
>>>    {
>>>    struct mdp_cmdq_cmd *cmd;
>>> @@ -538,7 +501,7 @@ static void mdp_auto_release_work(struct work_struct *work)
>>>    wake_up(&mdp->callback_wq);
>>>    }
>>>    
>>> -mdp_cmdq_pkt_destroy(&cmd->pkt);
>>> +cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>>>    kfree(cmd->comps);
>>>    cmd->comps = NULL;
>>>    kfree(cmd);
>>> @@ -578,7 +541,7 @@ static void mdp_handle_cmdq_callback(struct mbox_client *cl, void *mssg)
>>>    if (refcount_dec_and_test(&mdp->job_count))
>>>    wake_up(&mdp->callback_wq);
>>>    
>>> -mdp_cmdq_pkt_destroy(&cmd->pkt);
>>> +cmdq_pkt_destroy(mdp->cmdq_clt[cmd->pp_idx], &cmd->pkt);
>>>    kfree(cmd->comps);
>>>    cmd->comps = NULL;
>>>    kfree(cmd);
>>> @@ -620,7 +583,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>>>    goto err_uninit;
>>>    }
>>>    
>>> -ret = mdp_cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
>>> +ret = cmdq_pkt_create(mdp->cmdq_clt[pp_idx], &cmd->pkt, SZ_16K);
>>>    if (ret)
>>>    goto err_free_cmd;
>>>    
>>> @@ -700,6 +663,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>>>    cmd->comps = comps;
>>>    cmd->num_comps = num_comp;
>>>    cmd->mdp_ctx = param->mdp_ctx;
>>> +cmd->pp_idx = pp_idx;
>>>    
>>>    kfree(path);
>>>    return cmd;
>>> @@ -711,7 +675,7 @@ static struct mdp_cmdq_cmd *mdp_cmdq_prepare(struct mdp_dev *mdp,
>>>    err_free_comps:
>>>    kfree(comps);
>>>    err_destroy_pkt:
>>> -mdp_cmdq_pkt_destroy(&cmd->pkt);
>>> +cmdq_pkt_destroy(mdp->cmdq_clt[pp_idx], &cmd->pkt);
>>>    err_free_cmd:
>>>    kfree(cmd);
>>>    err_uninit:
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
>>> index 53a30ad7e0b0..935ae9825728 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.h
>>> @@ -35,6 +35,7 @@ struct mdp_cmdq_cmd {
>>>    struct mdp_comp *comps;
>>>    void *mdp_ctx;
>>>    u8 num_comps;
>>> +u8 pp_idx;
>>>    };
>>>    
>>>    struct mdp_dev;

