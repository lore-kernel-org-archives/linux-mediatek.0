Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760D3C5475B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JXoQqib0ov0aI5VfB7sg8XcyAN9y4/ZAnzGM2CXP2HM=; b=MVry9ygo5GRAPNmQjCcgA8vWXR
	M+POeqjIbrWySxeFZ6e7YdFqHjcq7rNnBT1Cb92bPXX8MYIWrRXsbN/B6HGAabBXp9ObLW2F98J7M
	lVhTEg24E+MPoOhv2bHlivy3gUYYJl7ekaYu5uL66NLa4s3MvQLwab1a9+9L9ec1K4VmFQ5tXQNuS
	uvnXlfksWNyfwMfosLBr0Puj515Po0gUQuoSyli0rI0blKPzeEaZcvXQ5XAPbQ04YLKqxSdQPJk0v
	tRbf7Qkwb1hX1iVTZqgEtKXan87dqmXrmn59HlTV/M9i9W1htDVEZ7ZRWyKbA7HVahYJ+05237mXH
	dSOEFS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrpj-00000000Tb9-0Q10;
	Wed, 06 Mar 2024 14:01:23 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhrpe-00000000TZS-3wJv;
	Wed, 06 Mar 2024 14:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709733673;
	bh=OL16fx6KjUVBqodWcez5kPju6qteSkdvY8c4p+ZXvLI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q9wVm5eLpkVFAhVCMsjJ/hcOI1icOPvyOHKdr9rvAH0/Rrb6hMjHXePH37OnLUEHl
	 Nu0mINsbRFk0gOe1fWLv4nBRKJIuXRMirkx9EwomEPFn5OGXYTBrHgyNXoElkd8EVt
	 7BNRcXUNKRa4tjUhjCNrfDE+fp5jLKbiU+e3ZwxkRwCmRdUunG98rB2Lbep7D2MW6C
	 XwDq/ILuj44uJTQuPKle3N1RGORioEzlmYkXZcd8snpXeiM7UflTk2negWjWViyO/Z
	 i4kRhXezOUkaAPvnig3EQCe7eDAxgS4LgQdaoW9LgSjiqDwh9y6k+UHjpBqk46X1MA
	 jqPWrGSQhkv5g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B09037813B6;
	Wed,  6 Mar 2024 14:01:12 +0000 (UTC)
Message-ID: <66a2307a-1420-4cea-aab3-53ac81f8c246@collabora.com>
Date: Wed, 6 Mar 2024 15:01:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: mediatek: vcodec: support 36 bits physical
 address
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240306121902.25069-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240306121902.25069-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_060119_203920_D48178C8 
X-CRM114-Status: GOOD (  17.03  )
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

Il 06/03/24 13:19, Yunfei Dong ha scritto:
> The physical address on the MT8188 platform is larger than 32 bits,
> change the type from unsigned int to dma_addr_t to be able to access
> the high bits of the address.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> compare with v1:
> - change address type from unsigned long to dma_addr_t
> - change vp8 address type
> ---
>   .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c | 2 +-
>   .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> index 19407f9bc773..987b3d71b662 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> @@ -449,7 +449,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>   		       inst->frm_cnt, y_fb_dma, c_fb_dma, fb);
>   
>   	inst->cur_fb = fb;
> -	dec->bs_dma = (unsigned long)bs->dma_addr;
> +	dec->bs_dma = (uint64_t)bs->dma_addr;
>   	dec->bs_sz = bs->size;
>   	dec->cur_y_fb_dma = y_fb_dma;
>   	dec->cur_c_fb_dma = c_fb_dma;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index cf48d09b78d7..eea709d93820 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -1074,7 +1074,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
>   	unsigned int mi_row;
>   	unsigned int mi_col;
>   	unsigned int offset;
> -	unsigned int pa;
> +	dma_addr_t pa;
>   	unsigned int size;
>   	struct vdec_vp9_slice_tiles *tiles;
>   	unsigned char *pos;
> @@ -1109,7 +1109,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
>   	pos = va + offset;
>   	end = va + bs->size;
>   	/* truncated */
> -	pa = (unsigned int)bs->dma_addr + offset;
> +	pa = bs->dma_addr + offset;
>   	tb = instance->tile.va;
>   	for (i = 0; i < rows; i++) {
>   		for (j = 0; j < cols; j++) {


