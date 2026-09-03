Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495A0C61DD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 06:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKftuYppPOmGQX9OKW8UIKFo5kG4eD0AIf8jGCWgFcw=; b=O/EB+MSGlCnBuiQsC1HMNiX5KI
	Mm9qpGdDXp+B/jYcevCLoDArqUyMUpssyY87Lb+Ix0VZAtKbIfRb/oM4gHT6BYh/9JeoUA8g0baie
	NMO6FS0SR09khHI9mh8bAbJHH3+Bjg0x4zF20UBD4PR1GC95zKBKlCwssjOTG7+yyQgiIhDiLYggu
	Y3LGOTh71T35I6Fx7H0zGc+lFTM3y9LFQIoaO8KGmsfhtOkiL0fxm/ljNeccDucEEyclTahFr7Gq2
	S7vA7BwC2vZcqVcqzmRXk77fYrrK3wdZSpw1FXeAHtmvUUFzEWqswli5/qeOxKYaVnKe3WtO41NcD
	F68nLkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21J8-0000000GW2A-0eib;
	Thu, 03 Sep 2026 06:52:22 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21J6-0000000GW1d-06dU;
	Thu, 03 Sep 2026 06:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788418335; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jsJ+Pyd3DOlCYfziQiXASa0bVgkf3eHlIFTKBl8Sn8vob00+saKgglEDEfsBacT0kfbJn8/byZdUfs1uWMpi4UaAHCV8G/w5VlcyWeCY30LQIji8bnLn34dLFwdQOZiccFbAuDmCq/1VGFCHEUlq8OrHmuMz1QQBZifbUQLAiw4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418335; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=dKftuYppPOmGQX9OKW8UIKFo5kG4eD0AIf8jGCWgFcw=; 
	b=XLew3CUkwHm42PhjE1qIbZJOYQLMCoXL0LD3lUo2Jf8jkRNADr2oIZqnc7MAHr42txbM+AjsFVTRHIYm+e7jI0rZA29kXSTQZWYmWYhYeLmiBooLWpi/Xi8fp6blROhtJpmnsgJ582PwRQCBoBALcTAqQ2QUVmBChzjL8BkbKgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418335;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=dKftuYppPOmGQX9OKW8UIKFo5kG4eD0AIf8jGCWgFcw=;
	b=fD5LuFllDF3xJC3IiT+LFE+gm1oV63JomWNcoV9EaHDSJ+l3gLhHA8p9XGaIO60G
	OyNUVtakkKyP3KGqXUEOkbRvNhs/lI3fVdGdlKra8LhRK7vYxU3xWg7PdyWWh7t3BtD
	Xh+0Lp6lDHMMvM2CMXSzEIdZAptK7TA/9tjLbkII=
Received: by mx.zohomail.com with SMTPS id 1788418334779674.9966100435952;
	Wed, 2 Sep 2026 23:52:14 -0700 (PDT)
Message-ID: <805fa7a9-bd32-4364-a228-5ff17f22ae56@collabora.com>
Date: Thu, 3 Sep 2026 08:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/9] media: verisilicon: rockchip: guard VPU981 AV1
 divisor and tile buffer
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
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
 <20260617021906.2746743-7-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-7-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_235220_089504_4C57E535 
X-CRM114-Status: GOOD (  20.86  )
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


Le 17/06/2026 à 04:19, Michael Bommarito a écrit :
> rockchip_vpu981_av1_dec_set_tile_info() divides context_update_tile_id by
> tile_info->tile_cols and writes one descriptor per tile into the tile_info
> DMA buffer, which holds AV1_MAX_TILES entries; tile_cols and tile_rows
> come from the bitstream. Guard the division against a zero tile_cols by
> initialising the context-update values to zero and computing them only
> when tile_cols is non-zero, and stop the descriptor writes once the
> tile_info buffer is full. The tile geometry written to the hardware
> registers is left unmodified; the per-dimension and total tile bounds are
> enforced by the control validation.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 32 +++++++++++++++----
>   1 file changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index e4e21ad373233..fd00dbd79fe46 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -578,16 +578,30 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   	const struct v4l2_av1_tile_info *tile_info = &ctrls->frame->tile_info;
>   	const struct v4l2_ctrl_av1_tile_group_entry *group_entry =
>   	    ctrls->tile_group_entry;
> -	int context_update_y =
> -	    tile_info->context_update_tile_id / tile_info->tile_cols;
> -	int context_update_x =
> -	    tile_info->context_update_tile_id % tile_info->tile_cols;
> -	int context_update_tile_id =
> -	    context_update_x * tile_info->tile_rows + context_update_y;
> +	int context_update_y = 0;
> +	int context_update_x = 0;
> +	int context_update_tile_id = 0;
>   	u8 *dst = av1_dec->tile_info.cpu;
> +	u8 *dst_end = dst + av1_dec->tile_info.size;
>   	struct hantro_dev *vpu = ctx->dev;
>   	int tile0, tile1;
>   
> +	/*
> +	 * tile_cols and tile_rows are bounded by the V4L2 control validation
> +	 * (V4L2_AV1_MAX_TILE_{COLS,ROWS} and V4L2_AV1_MAX_TILE_COUNT). Guard
> +	 * the divisor here, and keep the descriptor writes within the
> +	 * AV1_MAX_TILES tile_info buffer below; the register values use the
> +	 * unmodified tile geometry.
> +	 */
> +	if (tile_info->tile_cols) {
> +		context_update_y =
> +		    tile_info->context_update_tile_id / tile_info->tile_cols;
> +		context_update_x =
> +		    tile_info->context_update_tile_id % tile_info->tile_cols;
> +		context_update_tile_id =
> +		    context_update_x * tile_info->tile_rows + context_update_y;
> +	}
> +
>   	memset(dst, 0, av1_dec->tile_info.size);
>   
>   	for (tile0 = 0; tile0 < tile_info->tile_cols; tile0++) {
> @@ -598,6 +612,10 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   			    tile_info->height_in_sbs_minus_1[tile1] + 1;
>   			u32 x0 = tile_info->width_in_sbs_minus_1[tile0] + 1;
>   
> +			/* Stop once the tile_info descriptor buffer is full. */
> +			if (dst + 16 > dst_end)
> +				break;
> +
>   			/* tile size in SB units (width,height) */
>   			*dst++ = x0;
>   			*dst++ = 0;
> @@ -622,6 +640,8 @@ static void rockchip_vpu981_av1_dec_set_tile_info(struct hantro_ctx *ctx)
>   			*dst++ = (end >> 16) & 255;
>   			*dst++ = (end >> 24) & 255;
>   		}
> +		if (dst + 16 > dst_end)
> +			break;
>   	}
>   
>   	hantro_reg_write(vpu, &av1_multicore_expect_context_update, !!(context_update_x == 0));

