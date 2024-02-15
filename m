Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EB6C4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGCqPOE3uEj9Yv+MTb5vZzUvk7Vk9qIiPRaP9L7uhSU=; b=P0AGSyBLafYW17yDFuwtpOJpYN
	C6RtgQmnqOhrm1k13v3X4PoTOfK3FqhMBUzez4+/En1fARYhcasSj/QZJ6RMzRsPWAY/14Bd+PvCV
	s62kT8tomaxNQkfP3Rs9bhNHAAdvL45rdlk3B3MTsgMmgXRxdvOjDxBrz95CruXXqSnsZobOkoxyB
	fAe7xMGFluM35ZMmmOOxUK5VfWKU9X5F8TTQVfbLx5jVovAt6FHYW2W8iyYFr5hZlHOMgzr+I228P
	fTc48hjmuQIB0niZkE8lpf7iR/95a3SrcS3q/9MzRRQC/z4wk5IBywe2imN7ewQgjs7NWpyaRwhyQ
	PfS49V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZ02-0000000Fkpf-2lDA;
	Thu, 15 Feb 2024 10:29:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raYzz-0000000FkoS-0DUP;
	Thu, 15 Feb 2024 10:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707992983;
	bh=lCKAiQ1BgMuFxaAEpE7w6O8TyAdEMRj0SufRx1KfSQ4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=vdRLr0SLlXy+WD9tG1YIsF9FZLOC9Ck90t/SzhMX1YTkqmHPhs3662tv1zeYOqzbP
	 gYtysHX1iaaVtaO/quHSWYrygrR/LZnsDrz2jmC2XeFBBTMJQGMVeRlMy+k2mI27yH
	 b5D8CRBLTfu3XdhTzjoQox4Ip+SS+xFBhwK/S9MEYK9VIPQIptvPEoB5bk6Ng7xvKY
	 bISZqW458jcqsXYHaX5zaRxjaw4fz1lgmf0kUQOI+5YJ+u8z2VqBbh/dL3D8S5nTnp
	 ZGO1hMVhNcG6Kat2SZ1QQGw0OEypsUHoGLTyD2uURgDOsSRpsrYzmFfV5MVgNtYaUq
	 MmVdQ4+9Z39ZA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 178123780FC7;
	Thu, 15 Feb 2024 10:29:43 +0000 (UTC)
Message-ID: <4dcfaf49-aaac-4980-a149-02fec3109f31@collabora.com>
Date: Thu, 15 Feb 2024 11:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] media: platform: mtk-mdp3: drop calling
 cmdq_pkt_finalize()
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Moudy Ho <moudy.ho@mediatek.com>
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-7-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240215004931.3808-7-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_022947_425887_11661E2A 
X-CRM114-Status: GOOD (  18.23  )
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

Il 15/02/24 01:49, Chun-Kuang Hu ha scritto:
> Because client driver has the information of struct cmdq_client, so
> it's not necessary to store struct cmdq_client in struct cmdq_pkt.
> cmdq_pkt_finalize() use struct cmdq_client in struct cmdq_pkt, so it's
> going to be abandoned. Therefore, use cmdq_pkt_eoc() and cmdq_pkt_nop()
> to replace cmdq_pkt_finalize().

No, it's not because cmdq_pkt_finalize() has cmdq_client, but because we want
finer grain control over the CMDQ packets, as not all cases require the NOP
packet to be appended after EOC.

Besides, honestly I'm not even sure if the NOP is always required in MDP3, so...

...Moudy, you know the MDP3 way better than anyone else - can you please
check if NOP is actually needed here?

Thanks!
Angelo

> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
>   3 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 6adac857a477..a420d492d879 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -471,7 +471,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
>   		dev_err(dev, "mdp_path_config error\n");
>   		goto err_free_path;
>   	}
> -	cmdq_pkt_finalize(&cmd->pkt);
> +	cmdq_pkt_eoc(&cmd->pkt);
> +	cmdq_pkt_nop(&cmd->pkt, mdp->cmdq_shift_pa);
>   
>   	for (i = 0; i < num_comp; i++)
>   		memcpy(&comps[i], path->comps[i].comp,
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 94f4ed78523b..2214744c937c 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -231,6 +231,8 @@ static int mdp_probe(struct platform_device *pdev)
>   		goto err_put_scp;
>   	}
>   
> +	mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
> +
>   	init_waitqueue_head(&mdp->callback_wq);
>   	ida_init(&mdp->mdp_ida);
>   	platform_set_drvdata(pdev, mdp);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 7e21d226ceb8..ed61e0bb69ee 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -83,6 +83,7 @@ struct mdp_dev {
>   	u32					id_count;
>   	struct ida				mdp_ida;
>   	struct cmdq_client			*cmdq_clt;
> +	u8					cmdq_shift_pa;
>   	wait_queue_head_t			callback_wq;
>   
>   	struct v4l2_device			v4l2_dev;


