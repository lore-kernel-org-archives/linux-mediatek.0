Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23916C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 10:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6hK26t9FQdUDqcjlAZXAfqHVYr7DnxWtXxIMpk8uxg=; b=1U1RUv2NHk91HQd+TUB0foieXA
	KDtp/qDA9Sauf+02m+2L8B3NITpHscE0VUhvYVVeHdtAqa9TQuVj0jeQe1tf/QwIsvF2Ud4Xz2fFv
	g/0NzkW0u46LYqlrUjRlf26LBJxGKthgZ6vGMgLw+E0qU6PK3n02wY776lG4+4QgOrWFaPxHAEuPH
	w3+0/MfdgADqseual0NByLVLTjkkPP3vvsbAGDaNQvOPZX9SlVOj2PtjRv7UisU+hltWxNq8TGFVp
	BuGLF3qMeQt85DA6CHEWXw5YKKRft/13opEqpP0O6wW3eo91/lQUhJ/933gsqKyGNak38kYEl0ixK
	DV/9OWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjd0M-000000017XT-1bQA;
	Mon, 11 Mar 2024 10:35:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjd04-000000017Pw-1yZy;
	Mon, 11 Mar 2024 10:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710153318;
	bh=bH/XvSdNJiKdE3OIQD4JszYlFQOoKuSIHzKC0Z4hyW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pv1o7omv9nUDixra0TUCrmUf64Z1XaOH4vtQhflvk0u/82LZfRmWRnwlF0poOlTeu
	 8YVQ7UX6lGoEOmbvs976jdhWumwwJuEU1nFvtT0oLK02HioXqh5vkgpcdF0dxIRUXC
	 wcPOJdiyVtMQ820UzhytNHxOo2tNtkWdA9UVJovJTvqE1cYLWpkjTYsD/vQmbj4OlZ
	 rz4+ogdEdw4sxIx/71e39STnfznn6Ui59byCfn0TF5B771rzUlofwD0Pznk+e6VbK5
	 CBHlVpSxLveczgyCdtN5/vPOdM5p3c6FJnmapa43LnsesL7XVPl8WdzqLAS6/suKKE
	 sYWPI5ahUEQfQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C64AC3780629;
	Mon, 11 Mar 2024 10:35:17 +0000 (UTC)
Message-ID: <15267045-045d-484a-b645-3c485a89bf12@collabora.com>
Date: Mon, 11 Mar 2024 11:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: mediatek: vcodec: Replace false function
 description
Content-Language: en-US
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20240309-mediatek-typos-v1-0-fa4aeb59306c@collabora.com>
 <20240309-mediatek-typos-v1-3-fa4aeb59306c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240309-mediatek-typos-v1-3-fa4aeb59306c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_033520_812844_72771D4E 
X-CRM114-Status: GOOD (  16.86  )
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

Il 09/03/24 16:08, Sebastian Fricke ha scritto:
> The function descriptions where falsely copy pasted from another entry,
> write more fitting descriptions for the functions.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> ---
>   .../platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h    | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h
> index 6f624c266246..2d845b1307b6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_common.h
> @@ -185,7 +185,7 @@ void mtk_vdec_h264_get_ref_list(u8 *ref_list,
>   void *mtk_vdec_h264_get_ctrl_ptr(struct mtk_vcodec_dec_ctx *ctx, int id);
>   
>   /**
> - * mtk_vdec_h264_fill_dpb_info - get each CID contrl address.
> + * mtk_vdec_h264_fill_dpb_info - Fill the decoded picture buffer info
>    *
>    * @ctx:		v4l2 ctx
>    * @decode_params:	slice decode params
> @@ -225,7 +225,9 @@ void mtk_vdec_h264_copy_slice_hd_params(struct mtk_h264_slice_hd_param *dst_para
>   					const struct v4l2_ctrl_h264_decode_params *dec_param);
>   
>   /**
> - * mtk_vdec_h264_copy_scaling_matrix - get each CID contrl address.
> + * mtk_vdec_h264_copy_scaling_matrix - Copy the scaling matrix from a source to
> + *				       a destination.
> + *				       (for example into the slice parameters)

That should be a short description; the "for example into the slice parameters"
along with a longer description go in the long description part of the doc.

/*
  * mtk_vdec_h264_copy_scaling_matrix - Copy scaling matrix from HW to driver
  * @dst_matrix: .....
  * @src_matrix: ....
  *
  * This function copies the scaling matrix from the hardware decoder (format?
  * structs? registers? what?) to the driver's scaling matrix structure, because
  * this that and the other tell me why we would ever need to do this, as this
  * is a long description of what this function does.
  * If a long description is not needed, just avoid it, of course.
  *
  * Return: some value for something, some other for something else
  *
  * This return value, as described, is so useful! :-)
  */

Cheers,
Angelo

