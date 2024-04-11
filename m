Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D599CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 07:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hoCjNmEiVFfOvc3If3IVRL3z8wqSiSiN5ImHcrjZWA=; b=sgbqH/pVa58labilG8L3Lr4CAL
	qYwfYxMfb0+3PnSU43ryx8XZnVIjF6chEPfP3RIa2+U19AuocT/G2SqBTB456Hj3+plpl7ZSUyFcj
	tXPedwTdYSHHzBFi+lfI/ajsVyWrDIgzxWtGUeYrxAuWnzLTvNotA88zZOOzmHaroXynXaP0oN7wq
	LfAwb0a6ZgeYWdZST+r1mcmWf0OWV/zVGmUylxpw69IvUZppmgRsxFaZmQ8wzr14NiGaRgM1x1kc/
	ZyhvFLtr9OG6BmUqCPy7egtuSQzPHVH4F+8wrPr3jGIk+HVAkaDV2sgMJLSfvLI0WoHfTqa7R+3iO
	95koo2vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoai-0000000AlvO-2IOw;
	Thu, 11 Apr 2024 07:11:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruoac-0000000Alqb-0KuS;
	Thu, 11 Apr 2024 07:11:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 25331CE2EFC;
	Thu, 11 Apr 2024 07:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9FAC433F1;
	Thu, 11 Apr 2024 07:11:10 +0000 (UTC)
Message-ID: <d230b840-471b-4f77-b9f4-34a4063f1db9@xs4all.nl>
Date: Thu, 11 Apr 2024 09:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] media: mediatek: vcodec: support 36 bits physical
 address
Content-Language: en-US, nl
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240411070127.12384-1-yunfei.dong@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240411070127.12384-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_001118_701281_D42D5C89 
X-CRM114-Status: GOOD (  19.66  )
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

Hi Yunfei,

Since the v2 patch is now merged in mainline as-is, you need to make a patch
on top of that.

So just post a new patch that applies to the mainline.

Regards,

	Hans

On 11/04/2024 09:01, Yunfei Dong wrote:
> The physical address on the MT8188 platform is larger than 32 bits,
> change the type from unsigned int to dma_addr_t to be able to access
> the high bits of the address.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> compared with v2:
> - remove unless cast
> ---
>  .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c | 2 +-
>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c        | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> index 9649f4ec1f2a..5f848691cea4 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> @@ -449,7 +449,7 @@ static int vdec_vp8_decode(void *h_vdec, struct mtk_vcodec_mem *bs,
>  		       inst->frm_cnt, y_fb_dma, c_fb_dma, fb);
>  
>  	inst->cur_fb = fb;
> -	dec->bs_dma = (unsigned long)bs->dma_addr;
> +	dec->bs_dma = bs->dma_addr;
>  	dec->bs_sz = bs->size;
>  	dec->cur_y_fb_dma = y_fb_dma;
>  	dec->cur_c_fb_dma = c_fb_dma;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index cf48d09b78d7..eea709d93820 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -1074,7 +1074,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
>  	unsigned int mi_row;
>  	unsigned int mi_col;
>  	unsigned int offset;
> -	unsigned int pa;
> +	dma_addr_t pa;
>  	unsigned int size;
>  	struct vdec_vp9_slice_tiles *tiles;
>  	unsigned char *pos;
> @@ -1109,7 +1109,7 @@ static int vdec_vp9_slice_setup_tile_buffer(struct vdec_vp9_slice_instance *inst
>  	pos = va + offset;
>  	end = va + bs->size;
>  	/* truncated */
> -	pa = (unsigned int)bs->dma_addr + offset;
> +	pa = bs->dma_addr + offset;
>  	tb = instance->tile.va;
>  	for (i = 0; i < rows; i++) {
>  		for (j = 0; j < cols; j++) {


