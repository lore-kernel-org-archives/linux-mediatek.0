Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A384C41513
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 11:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNkO7n9iFI3x5Yuof9DjMG9aFBC/jzOd4VsLGCN4cpY=; b=NebVR+26u88oYYXmoCIxFKQmfP
	NYPjRvNtoxu0kGH9IFJNPVBxbGxP2okWrUCJx92t4KN6zzTbdqJhY9G+EWN1KO01H0Rfolm4RVrG0
	av8RE8vQSl8GeRXbwGBF6tjM95Gdv/2MCPP0gvoSaDuvLN7bb9S8/lPNl5h6tXuZHqjuGeD7vKu1g
	dK09zXcsTRQFZqERSAyt2HAVubuM5DSL3dfQLwjJkEnIYDlkFj1/0G6yN06X6ZSHzVyihLfUokg8U
	Vi60hC58iucC83+CxJ96XUDT9fMMeAnGeH9wTOaJEFe+ASVKJAdk0KfMrDeKSJ5CyjNzL7NvNAiYm
	QtiQC9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy8i-00GymB-1M;
	Mon, 07 Aug 2023 11:11:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSy8e-00Gyhn-0S;
	Mon, 07 Aug 2023 11:11:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A1F84617E1;
	Mon,  7 Aug 2023 11:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EF0C433C8;
	Mon,  7 Aug 2023 11:10:58 +0000 (UTC)
Message-ID: <daaafe46-ce37-fe2e-4b77-d1e24d2b5662@xs4all.nl>
Date: Mon, 7 Aug 2023 13:10:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [v3] media: mediatek: vcodec: fix AV1 decoding on MT8188
Content-Language: en-US, nl
To: Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
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
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230803111017.2418-1-xiaoyong.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_041104_269619_932433E1 
X-CRM114-Status: GOOD (  21.29  )
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

FYI: the v2 patch has already been merged, so I dropped this v3.

On 03/08/2023 13:10, Xiaoyong Lu wrote:
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

It's only subject/commit message changes, the actual code is the same.

Regards,

	Hans

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
>  .../mediatek/vcodec/vdec/vdec_av1_req_lat_if.c       | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> index 404a1a23fd402..e9f2393f6a883 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_av1_req_lat_if.c
> @@ -1658,9 +1658,9 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
>  	u32 allow_update_cdf = 0;
>  	u32 sb_boundary_x_m1 = 0, sb_boundary_y_m1 = 0;
>  	int tile_info_base;
> -	u32 tile_buf_pa;
> +	u64 tile_buf_pa;
>  	u32 *tile_info_buf = instance->tile.va;
> -	u32 pa = (u32)bs->dma_addr;
> +	u64 pa = (u64)bs->dma_addr;
>  
>  	if (uh->disable_cdf_update == 0)
>  		allow_update_cdf = 1;
> @@ -1673,8 +1673,12 @@ static void vdec_av1_slice_setup_tile_buffer(struct vdec_av1_slice_instance *ins
>  		tile_info_buf[tile_info_base + 0] = (tile_group->tile_size[tile_num] << 3);
>  		tile_buf_pa = pa + tile_group->tile_start_offset[tile_num];
>  
> -		tile_info_buf[tile_info_base + 1] = (tile_buf_pa >> 4) << 4;
> -		tile_info_buf[tile_info_base + 2] = (tile_buf_pa % 16) << 3;
> +		/* save av1 tile high 4bits(bit 32-35) address in lower 4 bits position
> +		 * and clear original for hw requirement.
> +		 */
> +		tile_info_buf[tile_info_base + 1] = (tile_buf_pa & 0xFFFFFFF0ull) |
> +			((tile_buf_pa & 0xF00000000ull) >> 32);
> +		tile_info_buf[tile_info_base + 2] = (tile_buf_pa & 0xFull) << 3;
>  
>  		sb_boundary_x_m1 =
>  			(tile->mi_col_starts[tile_col + 1] - tile->mi_col_starts[tile_col] - 1) &


