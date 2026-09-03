Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763E7C624D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2026 06:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcAgh7yeDVgqAgxkootRruKaN/q5Ils7BQ1JU/M50TM=; b=RcA2J3UqVuCJrRybZBec/0V/GB
	7bGOBqSB3vorYNoPB/phgJ6+tsFfh3dLUXFPExjACqkwFMfvRjXhvQsVUTQe1K1R/jvNaYyPDK+k3
	tFAdBw+6W0TQQwhImcVJETq8JvGezPXAuFu/G53XcK43lcTOX7unvoTNIUXRAu3XfO0upwrE8xLle
	CgW/hVsZCVhDWnef3agevjUaaaC8ZHLCWuS7Ufv4A7ggx03/wfVmrQZZr0fyFnldSvka0q7pien8/
	v/t0WnIuVL1q1C4KkRxfpzPNXU/sLf+u4ZTyzuIuyyUuXZPMBDisrdaILrmO5Z/ErIrBvrUmjzEmW
	Oh3bZpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21KF-0000000GW7i-1WVB;
	Thu, 03 Sep 2026 06:53:31 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x21KD-0000000GW7D-1jph;
	Thu, 03 Sep 2026 06:53:30 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788418401; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SwgiiL7JypWIcPRqpcIVFPijZn6LNlJb5JT651HfJXHRVp0sfftjdzP6qJnUkT2ZtKgf7lLltTrGx5NzfMQCPoI4U0RfufFl4Dn7O5iBpMC3SaRmwt7HRi9JT4Gm8c4GvFfmAbD+wjXI28vbpexbMXJnZvPVsdRq5C4xkA1QjsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788418401; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BcAgh7yeDVgqAgxkootRruKaN/q5Ils7BQ1JU/M50TM=; 
	b=CW2uhRYNkjJBqMi7CSiTP0LI2Y+5nWDCLMzzQmxoAf5xX9SJ6SsiKPmGK5hXolf2EW86uueYO8+wJRS1tR2kwo7c7AAd4d/rhFXj743LZoZtdBDEopgKbkoAa1RARJUnJg+xW/xO7KGaXSB5Ql3gvMnfI26JW6QYeZDshbd0jO4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788418401;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=BcAgh7yeDVgqAgxkootRruKaN/q5Ils7BQ1JU/M50TM=;
	b=GiiQIUm+kTc1zufpfzm3a783q/nodFXeyKBnykl2in6effSR2lI3Ebs/7X3qt5DE
	cETFVm/zRy/JQIoPtMsyqcXHtKTKkUySfF1KqggFvkorYmaAPLkWOnrgN3Yenq75a6j
	xi56h2wekD/k0KhEPYGf+89YJ698PHg1QhBPrTzI=
Received: by mx.zohomail.com with SMTPS id 1788418400533958.155498276706;
	Wed, 2 Sep 2026 23:53:20 -0700 (PDT)
Message-ID: <922a07e5-cd6c-432b-947a-21a2d026720c@collabora.com>
Date: Thu, 3 Sep 2026 08:53:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/9] media: verisilicon: rockchip: reject AV1 frames
 exceeding the tile capacity
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
 <20260617021906.2746743-8-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260617021906.2746743-8-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_235329_479665_D8AB6EA2 
X-CRM114-Status: GOOD (  21.08  )
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
> rockchip_vpu981_av1_dec_set_tile_info() indexes the tile group entry
> array by tile1 * tile_cols + tile0, reading up to tile_cols * tile_rows
> entries, lays out one descriptor per tile in the AV1_MAX_TILES tile_info
> buffer, and programs the real tile_cols / tile_rows into the hardware.
>
> The tile group entry control is a dynamic array sized to the number of
> entries userspace submitted, independent of tile_cols / tile_rows, so a
> frame that claims more tiles than entries reads past the array. A frame
> that claims more than AV1_MAX_TILES tiles also leaves the hardware
> programmed for more tiles than the descriptor buffer holds.
>
> Reject both in prepare_run(): tile_cols * tile_rows must not exceed the
> submitted entry count or AV1_MAX_TILES. The entry count is read via
> v4l2_ctrl_find() (ctrl->elems). This mirrors the bound the mediatek AV1
> decoder already enforces.
>
> Fixes: 727a400686a2 ("media: verisilicon: Add Rockchip AV1 decoder")
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   .../verisilicon/rockchip_vpu981_hw_av1_dec.c  | 25 ++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> index fd00dbd79fe46..00aa566a4ccdb 100644
> --- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> +++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
> @@ -431,20 +431,39 @@ static int rockchip_vpu981_av1_dec_prepare_run(struct hantro_ctx *ctx)
>   {
>   	struct hantro_av1_dec_hw_ctx *av1_dec = &ctx->av1_dec;
>   	struct hantro_av1_dec_ctrls *ctrls = &av1_dec->ctrls;
> +	const struct v4l2_av1_tile_info *tile_info;
> +	struct v4l2_ctrl *tge;
> +	u32 num_tiles;
>   
>   	ctrls->sequence = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_SEQUENCE);
>   	if (WARN_ON(!ctrls->sequence))
>   		return -EINVAL;
>   
> -	ctrls->tile_group_entry =
> -	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> -	if (WARN_ON(!ctrls->tile_group_entry))
> +	tge = v4l2_ctrl_find(&ctx->ctrl_handler,
> +			     V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY);
> +	if (WARN_ON(!tge))
>   		return -EINVAL;
> +	ctrls->tile_group_entry = tge->p_cur.p;
>   
>   	ctrls->frame = hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FRAME);
>   	if (WARN_ON(!ctrls->frame))
>   		return -EINVAL;
>   
> +	/*
> +	 * rockchip_vpu981_av1_dec_set_tile_info() indexes the tile group
> +	 * entry array by tile1 * tile_cols + tile0, so it reads up to
> +	 * tile_cols * tile_rows entries, and lays out one descriptor per tile
> +	 * in the AV1_MAX_TILES tile_info buffer while programming the real
> +	 * tile geometry into the hardware. Reject a frame that claims more
> +	 * tiles than userspace submitted, or more than the hardware tile
> +	 * buffer holds, so the read stays in bounds and the programmed
> +	 * geometry matches the descriptors written.
> +	 */
> +	tile_info = &ctrls->frame->tile_info;
> +	num_tiles = (u32)tile_info->tile_cols * tile_info->tile_rows;
> +	if (num_tiles > tge->elems || num_tiles > AV1_MAX_TILES)
> +		return -EINVAL;
> +
>   	ctrls->film_grain =
>   	    hantro_get_ctrl(ctx, V4L2_CID_STATELESS_AV1_FILM_GRAIN);
>   

