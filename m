Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E69FC001B0
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 10:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R7hsZqtyoqQt21/TWUQXzVnmsj6oyIZ+sWReSAWIGk=; b=l1CkCKls9ihmCORntyXXUKRsgJ
	xTWblRdfRD/cLuxttiaU9VC5sljYA3R2Ent9uMf3sfEzdcI4y+VXW8++JOLhi2wzSLA+DuBS4j3O2
	7sqaiP6nxX89Ml00TBde1Q1jZW0ruusN4GN1Z4ZAOr5jimTc74Xnv1ch0l5p+/6ryTPOjgN1bmLW/
	2RFe4qRnOKVAa+p5AWQi/pQEofsriOZ7T5KgDFTCBy4/LiDLw/CyqprOK3nzjAJjconxqskffLz9Q
	FXsO5/2dRUDgfTt2cXCQbgIgWHXZNS6R/iRisM5YEQgQq1OtjxqbW11yIsZcm81HiErL3BJy0Opxh
	ndoROGYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSxqR-00GvCq-1k;
	Mon, 07 Aug 2023 10:52:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSxqN-00GvAz-2P;
	Mon, 07 Aug 2023 10:52:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FB97617A0;
	Mon,  7 Aug 2023 10:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA53C433C8;
	Mon,  7 Aug 2023 10:52:07 +0000 (UTC)
Message-ID: <1cb55979-b2a9-9a1f-067e-1ea898229203@xs4all.nl>
Date: Mon, 7 Aug 2023 12:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: mediatek: vcodec: Fix an error handling path in
 vdec_msg_queue_init()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <efa0d4910998931a2ec9d933117fa71482d7b33a.1689624542.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_035211_844519_36851A22 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Christophe,

This no longer applies after some major rework of the driver from Yunfei that
was merged to our media_stage tree.

Can you rebase this patch (if it is even still relevant)?

Thanks,

	Hans

On 17/07/2023 22:09, Christophe JAILLET wrote:
> All errors go to the error handling path, except this one. Be consistent
> and also branch to it.
> 
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> index 04e6dc6cfa1d..c6cc2785e0e8 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec_msg_queue.c
> @@ -338,14 +338,16 @@ int vdec_msg_queue_init(struct vdec_msg_queue *msg_queue,
>  			err = mtk_vcodec_mem_alloc(ctx, &lat_buf->rd_mv_addr);
>  			if (err) {
>  				mtk_v4l2_err("failed to allocate rd_mv_addr buf[%d]", i);
> -				return -ENOMEM;
> +				err = -ENOMEM;
> +				goto mem_alloc_err;
>  			}
>  
>  			lat_buf->tile_addr.size = VDEC_LAT_TILE_SZ;
>  			err = mtk_vcodec_mem_alloc(ctx, &lat_buf->tile_addr);
>  			if (err) {
>  				mtk_v4l2_err("failed to allocate tile_addr buf[%d]", i);
> -				return -ENOMEM;
> +				err = -ENOMEM;
> +				goto mem_alloc_err;
>  			}
>  		}
>  


