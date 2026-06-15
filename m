Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925B9CD98DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Tt8dDxvwIeWwXFVwhwvQmA54l/UDZWHrl2UfyKiGlg=; b=S6LtQG0WHSNpBY3n5MT80bPCO6
	S+rMRGmDO8mSLNtrDt8W0rKJCTE5fhUGx78hdVFRdAIhFYmJOyXvIT6YX3aYk5VchXr0YdSbc05L/
	arktSsLUcX6MVnTeKXTDJfZE5nHTqmiZG+J8sJ5pYSrWwfzSqusbizDd6JYrMv1ZMHH98Dc29M7Og
	EpuvWlUzjbLhEp2zwa3pE1UHPvj38dxxKZmOMKS50+t1LyR8719Qh8iOgOECt60H8Ffkvd6j3TmgT
	CiOimcAzQFXK+CtuS0OVc+KJjvEplDA6+tkT0lmG8MxJKCSGeftMzP+GPZ67wxgmylkLhqGCQIU5g
	XnnHIGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2Jw-0000000DpwH-3S3H;
	Mon, 15 Jun 2026 08:05:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2Jt-0000000DpvI-33w8
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 08:05:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781510718;
	bh=sL8cR43QWU9QUsElApFsojl/jS1GXIJxigOn8vOlCUw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=HqxL/NalwuBkYYCCnFYIB+PZnGXCf/H5kt1aQD11y8tp2Q+Gfz7O2hYtkv4XxzCu1
	 oI0BFtx54P9mON5EFSNUGNTA5szwtypGhMqrH+V0hSJUV2TVLE3OOFNgILIfJOZH9T
	 hvraBY90j1E0m4kQVFlJoJxy/rAkS77JBZxKLg3MB2QRKv6+oz0lfHDSouX5kbU73P
	 gAJ9LcKJftzvnDosh4LIwNOaSCekQQQJ7CL3R66fVnm56B8huG2PlUjqHTWhlX+yiH
	 bOcluhoX6rA+9sQdpsU9KzS9ydaprGmz/eKGGlt6OfJjd7Og/ui8wYdvp2zVl5YOsn
	 gRlrs+VGzKoMQ==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 19E4A17E04CA
	for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 10:05:18 +0200 (CEST)
Message-ID: <c38c6511-8753-4bc9-b932-523e412b51e6@collabora.com>
Date: Mon, 15 Jun 2026 10:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] media: v4l2-ctrls: validate HEVC and AV1 tile
 counts
To: linux-mediatek@lists.infradead.org
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
 <20260614155609.3107600-2-michael.bommarito@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20260614155609.3107600-2-michael.bommarito@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_010521_932138_7C4DD408 
X-CRM114-Status: GOOD (  21.44  )
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
> The stateless HEVC and AV1 controls carry tile counts that several SoC
> decoder drivers consume as loop bounds when laying out fixed-size hardware
> descriptor buffers, but std_validate_compound() does not bound them.
>
> For V4L2_CTRL_TYPE_HEVC_PPS with tiling enabled, num_tile_columns_minus1
> and num_tile_rows_minus1 (u8) drive loops over column_width_minus1[20] and
> row_height_minus1[22]. For V4L2_CTRL_TYPE_AV1_FRAME, tile_info.tile_cols
> and tile_rows (u8) bound loops over the mi_*_starts[] / *_in_sbs_minus_1[]
> arrays. Reject counts beyond the uAPI array capacity with -EINVAL.
>
> These are active-count fields (loop bounds), so bounding the upper limit
> here mirrors the existing num_active_dpb_entries check. Only the upper
> bound is enforced; a zero tile count is left to the consuming driver, so
> the zero-initialised AV1 frame control that existing userspace submits is
> not rejected, and the AV1 divisor (context_update_tile_id / tile_cols) is
> guarded where it is used in the rockchip decoder (patch 4).
>
> Driver-interpreted index values (HEVC pic_parameter_set_id, AV1
> context_update_tile_id) are bounded in the consuming drivers instead
> (patches 2 and 4).
>
> Fixes: 256fa3920874 ("media: v4l: Add definitions for HEVC stateless decoding")
> Fixes: 9de30f579980 ("media: Add AV1 uAPI")

I think you need to do a patch for each of the codec with only one "Fixes" tag on each.

Regards,
Benjamin

> Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> ---
>   drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 6b375720e395c..58e2eb7002a19 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -790,10 +790,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
>   	return 0;
>   }
>   
> +static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
> +{
> +	/* Loop bounds in the stateless AV1 drivers. */
> +	if (t->tile_cols > V4L2_AV1_MAX_TILE_COLS)
> +		return -EINVAL;
> +
> +	if (t->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>   static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>   {
>   	int ret = 0;
>   
> +	ret = validate_av1_tile_info(&f->tile_info);
> +	if (ret)
> +		return ret;
>   	ret = validate_av1_quantization(&f->quantization);
>   	if (ret)
>   		return ret;
> @@ -1242,6 +1257,14 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>   
>   			p_hevc_pps->flags &=
>   				~V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED;
> +		} else {
> +			/* Loop bounds in the stateless HEVC drivers. */
> +			if (p_hevc_pps->num_tile_columns_minus1 >=
> +			    ARRAY_SIZE(p_hevc_pps->column_width_minus1))
> +				return -EINVAL;
> +			if (p_hevc_pps->num_tile_rows_minus1 >=
> +			    ARRAY_SIZE(p_hevc_pps->row_height_minus1))
> +				return -EINVAL;
>   		}
>   
>   		if (p_hevc_pps->flags &

