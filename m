Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B342C04A94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJu2DR7WQxtZBvEOMPXvJAvbx2wjuBoKDi0KSmOz7ig=; b=uwESUoailziNGTColOv+A/SFd5
	GTPIcsLTaCzMynmj/Uv35FByxWNXeSy8/rv2VViJhhLgeRVCo8p7zagirQE1GIcfoi3+3rAvN2akO
	oRH9ePUb+4e8i7wu6ma6mEXhSMPeMTUF8L62yZLAdXalyz+hXCoLDb82XgxtNfiWAJdqavtvUPHWa
	cTefy1A+vnQO+zZFB3tEGlB+Np2baAtcSgODaYymRCS3uKGpzd7uncZfP35rSYIMJDy60/6PukmAn
	RMx59oX+NiLaIB2vhI/caCW9jJq+Q5NnoAgihTjzepgYwv0Z6q32AaWLckwPeFNe45AEh1EtrjvsY
	DVbY8QlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpen-00BpS5-2P;
	Fri, 04 Aug 2023 07:55:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRpek-00BpRM-1M;
	Fri, 04 Aug 2023 07:55:31 +0000
Received: from [172.20.10.2] (unknown [109.166.131.29])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D642E66071B9;
	Fri,  4 Aug 2023 08:55:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691135728;
	bh=7r9GShoKmneDSmX53QgcnbJVa5KPZiLE0eJ/AjUQWvY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Cbn7oSahDKki5y/OmUcpKp1jjzOPgQjLRBIMBYtWUBhNzAoQNrEbfAe/ryEDD2Jw+
	 UXMrqXfCnRqixCkB+NRgSHiLoWpeCaWW/7Czx/dTgFIYPFdbc/dCs+fOg33O4tqvWY
	 P2fckGcjMJAEpb7Qpu2CVAY2/G9/c+zJspITRV+EvZrsYFhZzBFGjWERkCHyHXfRQ6
	 Ku4wHjtMJHvkWbyuTNNSLtGxUSbsvMSy3B8RcwjaRpRBx3wcYcuZYkXpzfK8E3+PzN
	 h4u9HbgqI5TN+l2oxA6ymCSvR2Rq8kjCkJpAQxb42d4i88mJeJOPBJ2wTrSOggpBDZ
	 YarRuShh65W8A==
Message-ID: <d986cba3-5feb-079c-dd07-e4a2c2cbf2b1@collabora.com>
Date: Fri, 4 Aug 2023 10:55:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v3] media: mediatek: vcodec: fix AV1 decoding on MT8188
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230803111017.2418-1-xiaoyong.lu@mediatek.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230803111017.2418-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_005530_597571_D7319FA7 
X-CRM114-Status: GOOD (  23.95  )
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

Hi Xiaoyong,

On 8/3/23 14:10, Xiaoyong Lu wrote:
> Fix AV1 decoding failure when the iova is 36bit.
> 
> Before this fix, the decoder was accessing incorrect addresses with 36bit
> iova tile buffer, leading to iommu faults.
> 
> Fixes: 2f5d0aef37c6 ("media: mediatek: vcodec: support stateless AV1 decoder")
> Signed-off-by: Xiaoyong Lu<xiaoyong.lu@mediatek.com>
> ---
> Changes from v2:
> 
> - refine commit subject and message
> 
> Changes from v1:
> 
> - prefer '|' rather than '+'
> - prefer '&' rather than shift operation
> - add comments for address operations
> 
> v1:
> - VDEC HW can access tile buffer and decode normally.
> - Test ok by mt8195 32bit and mt8188 36bit iova.
> 
> ---
>   .../mediatek/vcodec/vdec/vdec_av1_req_lat_if.c       | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> index 404a1a23fd402..e9f2393f6a883 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> @@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
>   	u32 allow_update_cdf = 0;
>   	u32 sb_boundary_x_m1 = 0, sb_boundary_y_m1 = 0;
>   	int tile_info_base;
> -	u32 tile_buf_pa;
> +	u64 tile_buf_pa;
>   	u32 *tile_info_buf = instance->tile.va;
> -	u32 pa = (u32)bs->dma_addr;
> +	u64 pa = (u64)bs->dma_addr;

If it this is a dma address, can't we use dma_addr_t ? isn't it more 
generic? Or maybe you have a specific reason not to ?

>   
>   	if (uh->disable_cdf_update == 0)
>   		allow_update_cdf = 1;
> @@ -1673,8 +1673,12 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
>   		tile_info_buf[tile_info_base + 0] = (tile_group->tile_size[tile_num] << 3);
>   		tile_buf_pa = pa + tile_group->tile_start_offset[tile_num];
>   
> -		tile_info_buf[tile_info_base + 1] = (tile_buf_pa >> 4) << 4;
> -		tile_info_buf[tile_info_base + 2] = (tile_buf_pa % 16) << 3;
> +		/* save av1 tile high 4bits(bit 32-35) address in lower 4 bits position
> +		 * and clear original for hw requirement.
> +		 */
> +		tile_info_buf[tile_info_base + 1] = (tile_buf_pa & 0xFFFFFFF0ull) |
> +			((tile_buf_pa & 0xF00000000ull) >> 32);
> +		tile_info_buf[tile_info_base + 2] = (tile_buf_pa & 0xFull) << 3;

Would it be better to use GENMASK if you plan to mask out some of the 
bits in the tile_buf_pa ?


>   
>   		sb_boundary_x_m1 =
>   			(tile->mi_col_starts[tile_col + 1] - tile->mi_col_starts[tile_col] - 1) &

Greetings,
Eugen

