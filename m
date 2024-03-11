Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18446C54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 10:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8Dl7TYJWWzJm8sHnIipW9JuPj8vHYpASleHhy11dO8=; b=JYPfUD3CtDNDSvoLNj6JQc7/oS
	O4HKcH8tLbhz0sqJYBJVDZZSPf0La3rRv6nwPkkL8Cp33WDZQzHpoFDHF/Jn6BllRHd3DBXcZEd8N
	9Vuq53RxcYu/76RXfgokQbZH4kEOQANYE5kBvHbtm+BJUD8KsJ6SuKEA8ZVapjnq/8k986vTVuOua
	9AJpd4vIGulzH/CVRKHpy3E9Tled+zqMvQAa//1KxI/ky686pGBi/AP3WoxKe0Jyby4XCWurAmbaU
	DfAZaNsh/sA+qp6wdWXRDqxgGNIa4WGGlutSZ+JxkXpWhVScWW3BuaHAqX3reJtgp9e5yTsKLgC3b
	/Nv8RTTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjct3-000000016KW-2r8U;
	Mon, 11 Mar 2024 10:28:05 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjcsy-000000016Hi-1mDS;
	Mon, 11 Mar 2024 10:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710152878;
	bh=wHQ4vlUGoL2z6qkxE8BaQRaSfdBVhRWAnhaO/rToAfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YZG/gzB1a9w3vaQs4XNNdLsv2tqzV+jwngD+mckw1686kj55qPaftWratb7tXcPZZ
	 n0Ll626CGOLr7RyfIRBmvMRrQ1gqPNyNBVx/pN0I0e0sKdJEWCm28AgqIiz54ziVi3
	 yk0+sFz5qSGrCUWIA7sAMmhYdnjrdRz8ueZm36l+Rr1douOB8w3UVfdtfB2yEtNZoi
	 IXnkK7KeWRDdw53KwjcwFnHCp+hkK+L4a/hSh6ffCMfwn/XhuUYpYCu2Of6gBKjpoY
	 I/DvF5gEfsbMI9YndInHJ3si5HkY8YJa09abvbJmEmvxuXMebnoFhVsD+/o5KjDhq5
	 +v+5BK6UQt8+w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 949D337813F2;
	Mon, 11 Mar 2024 10:27:57 +0000 (UTC)
Message-ID: <483ba231-4b7b-44c5-a5b6-c58ec0760407@collabora.com>
Date: Mon, 11 Mar 2024 11:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: mediatek: vcodec: Improve wording & fix
 grammatic issues
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
 <20240309-mediatek-typos-v1-2-fa4aeb59306c@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240309-mediatek-typos-v1-2-fa4aeb59306c@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_032800_633717_9A97D7BB 
X-CRM114-Status: GOOD (  19.93  )
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
> Multiple issues detected while scanning the code by far not a complete
> list of required changes but some small improvements.
> 
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>   drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h   | 2 +-
>   .../media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c    | 2 +-
>   .../platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c    | 2 +-
>   .../platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c    | 2 +-
>   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c     | 4 ++--
>   drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c | 2 +-
>   6 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index a0451116f2e4..f975db4293da 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -71,7 +71,7 @@ enum mtk_vdec_hw_arch {
>    * @fb_sz: bitstream size of each plane
>    * E.g. suppose picture size is 176x144,
>    *      buffer size will be aligned to 176x160.
> - * @cap_fourcc: fourcc number(may changed when resolution change)
> + * @cap_fourcc: fourcc number(may change on a resolution change)

This goes to patch 1/3

>    * @reserved: align struct to 64-bit in order to adjust 32-bit and 64-bit os.
>    */
>   struct vdec_pic_info {
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
> index 37c41b673876..668e87bf30e8 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_if.c
> @@ -27,7 +27,7 @@ struct mtk_h264_dec_slice_param {
>   /**
>    * struct vdec_h264_dec_info - decode information
>    * @dpb_sz		: decoding picture buffer size
> - * @resolution_changed  : resolution change happend
> + * @resolution_changed  : flag to notify that a resolution change happend

happend -> happened

>    * @realloc_mv_buf	: flag to notify driver to re-allocate mv buffer
>    * @cap_num_planes	: number planes of capture buffer
>    * @bs_dma		: Input bit-stream buffer dma address
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> index d5224c9584b6..c4ac6b6f7acf 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_multi_if.c
> @@ -131,7 +131,7 @@ struct vdec_h264_slice_share_info {
>   /**
>    * struct vdec_h264_slice_inst - h264 decoder instance
>    *
> - * @slice_dec_num:	how many picture be decoded
> + * @slice_dec_num:	how many pictures to be decoded

number of frames to be decoded ?

Cheers,
Angelo

>    * @ctx:		point to mtk_vcodec_dec_ctx
>    * @pred_buf:		HW working prediction buffer
>    * @mv_buf:		HW working motion vector buffer
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> index a44db6139ff2..349b510d355a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> @@ -342,7 +342,7 @@ struct vdec_hevc_slice_share_info {
>   /**
>    * struct vdec_hevc_slice_inst - hevc decoder instance
>    *
> - * @slice_dec_num:      how many picture be decoded
> + * @slice_dec_num:      how many pictures to be decoded
>    * @ctx:                point to mtk_vcodec_dec_ctx
>    * @mv_buf:             HW working motion vector buffer
>    * @vpu:                VPU instance
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> index 19407f9bc773..9649f4ec1f2a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_if.c
> @@ -56,7 +56,7 @@
>    * @cur_c_fb_dma      : current plane C frame buffer dma address
>    * @bs_dma	      : bitstream dma address
>    * @bs_sz	      : bitstream size
> - * @resolution_changed: resolution change flag 1 - changed,  0 - not change
> + * @resolution_changed: resolution change flag 1 - changed,  0 - not changed

This goes to patch [1/3]

>    * @show_frame	      : display this frame or not
>    * @wait_key_frame    : wait key frame coming
>    */
> @@ -109,7 +109,7 @@ struct vdec_vp8_hw_reg_base {
>   /**
>    * struct vdec_vp8_vpu_inst - VPU instance for VP8 decode
>    * @wq_hd	: Wait queue to wait VPU message ack
> - * @signaled	: 1 - Host has received ack message from VPU, 0 - not receive
> + * @signaled	: 1 - Host has received ack message from VPU, 0 - not received

same

>    * @failure	: VPU execution result status 0 - success, others - fail
>    * @inst_addr	: VPU decoder instance address
>    */
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
> index f677e499fefa..e27e728f392e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
> @@ -35,7 +35,7 @@
>    * @cur_c_fb_dma:	current plane C frame buffer dma address
>    * @bs_dma:		bitstream dma address
>    * @bs_sz:		bitstream size
> - * @resolution_changed:resolution change flag 1 - changed,  0 - not change
> + * @resolution_changed:resolution change flag 1 - changed,  0 - not changed

ditto

>    * @frame_header_type:	current frame header type
>    * @crc:		used to check whether hardware's status is right
>    * @reserved:		reserved, currently unused
> 

Cheers,
Angelo


