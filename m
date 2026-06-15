Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B44CD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuZapTuGBDIjGRDqbXdD0aRNkuP1wNOHtygJ1xQ69To=; b=Q7/fttPKDxH3oI/Hj0d6pvcD/i
	p8y5seNGPQ6XtwhKAabX9qTA3h3RoFkLW+5maCO4FByMvYiwf+zTk97vQuD+aNOQ4jTv3RBHCly1f
	ucXXTvjUfHToA4ykMB3HghtYLqeeHDSWzKmIRpqLtCDcpFqgBFi0WJwougUPVCatP19PxfWSHUuZm
	w9wRhSTkJJAWp+1KOYnOAzByCZePYtoBpLy5X9YOSVslTNPilSNpjOU9sZCmL29jSVS1/Zk/hJZVT
	Ex7irOjH4u64d1TWp7A6AQZGcoF3fOC87/zN4hYHYpMqn12az3pUZXaOm1vMpyvouj27ySMQt3ji+
	he1dgHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2dr-0000000DrR3-0chg;
	Mon, 15 Jun 2026 08:25:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2do-0000000DrQD-49EA;
	Mon, 15 Jun 2026 08:25:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781511953;
	bh=kAmC+E/8rBpCeZR6wivIKX8D5/vOqrGWaZb2OhFQpCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PdOQj2g1PcKrwOWHwIY18Ry4zrb3hNuk3RhYQ6sthcj12/lfB7x+zAx7clsFsMoO2
	 0eLrpTd/IC+gv7ARznPw6IG/IPvlCUYEWfcrpShYe2LYEhHRgGi+bDpE07eTqbqMx6
	 wnSwMZZg5TWP5Gb7o6lvHLaVxq1kwzcSfGb8pLtGUDMK+Ta0cIpXhZeS57F4IlssVM
	 vgiHDM72D1OAfJNJZlGqcETBQ/fRMQDkSEUYF879iE3U9RHJl9FQi1YIayLB+buehD
	 9Lo8O9Ly5z/QtWFsvCnHpNlZzADswyWydVyAD6RosVtOnWL9jPdX36Ry5NZsjbHvNd
	 dN/9YE7w19J8Q==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7713E17E03CE;
	Mon, 15 Jun 2026 10:25:53 +0200 (CEST)
Message-ID: <cf38fbb9-a17c-4297-a696-2efa199afcbb@collabora.com>
Date: Mon, 15 Jun 2026 10:25:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] media: verisilicon: rockchip: bound VPU981 AV1
 tile loop and guard divisor
To: Michael Bommarito <michael.bommarito@gmail.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
 <20260614155609.3107600-5-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260614155609.3107600-5-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_012557_183600_B28F61D2 
X-CRM114-Status: GOOD (  19.60  )
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


Le 14/06/2026 à 17:56, Michael Bommarito a écrit :
> rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
> tile_info->tile_cols and writes one descriptor per tile into the tile_info
> DMA buffer, sized for AV1_MAX_TILES. tile_cols / tile_rows come straight
> from the bitstream; reject a zero column or row count and bound the grid to
> AV1_MAX_TILES so the division is safe and the writes stay in the buffer.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 29 +++++++++++++------
>   1 file changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad373233..71d2ef72c4402 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -578,21 +578,32 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
>   	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
>   	    ctrls->tile_group_entry;
> -	int context_update_y =
> -	    tile_info->context_update_tile_id / tile_info->tile_cols;
> -	int context_update_x =
> -	    tile_info->context_update_tile_id % tile_info->tile_cols;
> -	int context_update_tile_id =
> -	    context_update_x * tile_info->tile_rows + context_update_y;
> +	unsigned int tile_cols, tile_rows;
> +	int context_update_y, context_update_x, context_update_tile_id;
>   	u8 *dst = av1_dec->tile_info.cpu;
>   	struct hantro_dev *vpu = ctx->dev;
>   	int tile0, tile1;
>   
> +	/* Guard the divisor and bound the grid to the tile_info buffer. */
> +	tile_cols = tile_info->tile_cols;
> +	tile_rows = tile_info->tile_rows;
> +	if (!tile_cols || !tile_rows)
> +		return;

NACK
because you completely ignore how these values are used later in this function
to set registers.

> +	if (tile_cols * tile_rows > AV1_MAX_TILES) {
> +		tile_cols = min_t(unsigned int, tile_cols, AV1_MAX_TILES);
> +		tile_rows = min_t(unsigned int, tile_rows,
> +				  AV1_MAX_TILES / tile_cols);
> +	}
> +

It isn't possible to recompute tile_cols and tile_rows like that.
Please add this check in validate_av1_tile_info().

> +	context_update_y = tile_info->context_update_tile_id / tile_cols;
> +	context_update_x = tile_info->context_update_tile_id % tile_cols;
> +	context_update_tile_id = context_update_x * tile_rows + context_update_y;

To fix the possible division by zero: initialize the variable to zero when declare them
and only do the division if tile_cols isn't zero.

Thanks,
Benjamin

> +
>   	memset(dst, 0, av1_dec->tile_info.size);
>   
> -	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
> -		for (tile1 = 0; tile1 < tile_info->tile_rows; tile1++) {
> -			int tile_id = tile1 * tile_info->tile_cols + tile0;
> +	for (tile0 = 0; tile0 < tile_cols; tile0++) {
> +		for (tile1 = 0; tile1 < tile_rows; tile1++) {
> +			int tile_id = tile1 * tile_cols + tile0;
>   			u32 start, end;
>   			u32 y0 =
>   			    tile_info->height_in_sbs_minus_1[tile1] + 1;

