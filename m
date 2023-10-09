Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AEAE95A8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 12:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lcVjNQqMq/jFf0hj4WOhwnpXmbmmkhvqAkaU8j+i1gk=; b=xZQfGC7Ssl3NqSxGDVzPyO9jy/
	65xcpINfHBv+iZqBTuzd63JpUKwPmdFwsfoNr4mTiA1vw8GR7oxRmkpUtXkwc24YBboHoadU120mL
	wSZsPAUDW7ACsWJi917NaNkl4lQdO4oYMQD+BEhz2Ut7KYsrd8nqWKZzmLlXcH+6fSQJtWhYLQNqr
	o4UoESsY8xWJNnRHRswWZ1TPLVZuCVSH2eHHQj6DfUFgjO0aQgtt23LqhPEGoX52bxhvMnXwuY4+C
	KY5ToeblLSya1P8B7ZlgdI91VK6Iy8eeizTnUcXGsjvZEWRIUS2H20X2u/6ZqLCMZjABJGZzS64Uu
	c+W0UsZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppBD-00AeY6-02;
	Mon, 09 Oct 2023 12:16:11 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppB3-00AeNh-2q;
	Mon, 09 Oct 2023 12:16:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2D639660708F;
	Mon,  9 Oct 2023 13:15:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696853758;
	bh=6IxXuw1iuy8EVSXqn5C22h2EVvDJCRVbqg5t0p+CIgQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TnqHabipIkWGqzyHZA/ulQTttjOzpGUtfN0PlDIzdUGBh6SCCUlxM7Oyu9dWlwSSf
	 lymyQHe9X3e+vpAVk2UJjFYMTk4OG+bh/YC9I34LoF8eX3zV9K+IaOFvgjFcMVFc9h
	 yhrOSvhbbO9aFCibkYwYO2HzKUuCvtJ6OkmgWYdcq0Wj03AGcwdBAjmbWLKyk0MgR5
	 6W8HZWW/jjOJMoGnRLTTqgmhhRhUXikKlQbyoGedCCFXBGH010X9GTC5JoDrnYeQAr
	 lJd5RAmJy5A5oVQsqbAA1nD23gEK/aqc/vsmn3gXTJDZ+fKrg33tQUhWJ5C1sZxpLS
	 dDXgn5yexNlUA==
Message-ID: <42fab116-ce4e-b4bb-c457-821a92ff85b6@collabora.com>
Date: Mon, 9 Oct 2023 14:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] media: mediatek: vcodec: using encoder device to
 alloc/free encoder memory
Content-Language: en-US
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231008031909.32146-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231008031909.32146-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051602_240308_975290C4 
X-CRM114-Status: GOOD (  24.45  )
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

Il 08/10/23 05:19, Yunfei Dong ha scritto:
> Need to use encoder device to allocate/free encoder memory when calling
> mtk_vcodec_mem_alloc/mtk_vcodec_mem_free, or leading to below crash log
> when test encoder with decoder device.
> 
> pc : dma_alloc_attrs+0x44/0xf4
> lr : mtk_vcodec_mem_alloc+0x50/0xa4 [mtk_vcodec_common]
> sp : ffffffc0209f3990
> x29: ffffffc0209f39a0 x28: ffffff8024102a18 x27: 0000000000000000
> x26: 0000000000000000 x25: ffffffc00c06e2d8 x24: 0000000000000001
> x23: 0000000000000cc0 x22: 0000000000000010 x21: 0000000000000800
> x20: ffffff8024102a18 x19: 0000000000000000 x18: 0000000000000000
> x17: 0000000000000009 x16: ffffffe389736a98 x15: 0000000000000078
> x14: ffffffe389704434 x13: 0000000000000007 x12: ffffffe38a2b2560
> x11: 0000000000000800 x10: 0000000000000004 x9 : ffffffe331f07484
> x8 : 5400e9aef2395000 x7 : 0000000000000000 x6 : 000000000000003f
> x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000cc0
> x2 : ffffff8024102a18 x1 : 0000000000000800 x0 : 0000000000000010
> Call trace:
>   dma_alloc_attrs+0x44/0xf4
>   mtk_vcodec_mem_alloc+0x50/0xa4 [mtk_vcodec_common 2819d3d601f3cd06c1f2213ac1b9995134441421]
>   h264_enc_set_param+0x27c/0x378 [mtk_vcodec_enc 772cc3d26c254e8cf54079451ef8d930d2eb4404]
>   venc_if_set_param+0x4c/0x7c [mtk_vcodec_enc 772cc3d26c254e8cf54079451ef8d930d2eb4404]
>   vb2ops_venc_start_streaming+0x1bc/0x328 [mtk_vcodec_enc 772cc3d26c254e8cf54079451ef8d930d2eb4404]
>   vb2_start_streaming+0x64/0x12c
>   vb2_core_streamon+0x114/0x158
>   vb2_streamon+0x38/0x60
>   v4l2_m2m_streamon+0x48/0x88
>   v4l2_m2m_ioctl_streamon+0x20/0x2c
>   v4l_streamon+0x2c/0x38
>   __video_do_ioctl+0x2c4/0x3dc
>   video_usercopy+0x404/0x934
>   video_ioctl2+0x20/0x2c
>   v4l2_ioctl+0x54/0x64
>   v4l2_compat_ioctl32+0x90/0xa34
>   __arm64_compat_sys_ioctl+0x128/0x13c
>   invoke_syscall+0x4c/0x108
>   el0_svc_common+0x98/0x104
>   do_el0_svc_compat+0x28/0x34
>   el0_svc_compat+0x2c/0x74
>   el0t_32_sync_handler+0xa8/0xcc
>   el0t_32_sync+0x194/0x198
> Code: aa0003f6 aa0203f4 aa0103f5 f900
> 
> 'Fixes: 01abf5fbb081c ("media: mediatek: vcodec: separate struct 'mtk_vcodec_ctx'")'
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
>   .../mediatek/vcodec/common/mtk_vcodec_util.c  | 66 ++++++++++++++++++-
>   1 file changed, 64 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> index 908602031fd0..62bb7290c56d 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_util.c
> @@ -45,7 +45,7 @@ int mtk_vcodec_write_vdecsys(struct mtk_vcodec_dec_ctx *ctx, unsigned int reg,
>   }
>   EXPORT_SYMBOL(mtk_vcodec_write_vdecsys);
>   
> -int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
> +static int mtk_vcodec_mem_dec_alloc(void *priv, struct mtk_vcodec_mem *mem)
>   {
>   	unsigned long size = mem->size;
>   	struct mtk_vcodec_dec_ctx *ctx = priv;
> @@ -64,9 +64,39 @@ int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
>   
>   	return 0;
>   }
> +
> +static int mtk_vcodec_mem_enc_alloc(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	unsigned long size = mem->size;
> +	struct mtk_vcodec_enc_ctx *ctx = priv;
> +	struct device *dev = &ctx->dev->plat_dev->dev;
> +
> +	mem->va = dma_alloc_coherent(dev, size, &mem->dma_addr, GFP_KERNEL);
> +	if (!mem->va) {
> +		mtk_v4l2_venc_err(ctx, "%s dma_alloc size=%ld failed!", dev_name(dev), size);
> +		return -ENOMEM;
> +	}
> +
> +	mtk_v4l2_venc_dbg(3, ctx, "[%d]  - va      = %p", ctx->id, mem->va);
> +	mtk_v4l2_venc_dbg(3, ctx, "[%d]  - dma     = 0x%lx", ctx->id,
> +			  (unsigned long)mem->dma_addr);
> +	mtk_v4l2_venc_dbg(3, ctx, "[%d]    size = 0x%lx", ctx->id, size);
> +
> +	return 0;
> +}
> +
> +int mtk_vcodec_mem_alloc(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	enum mtk_instance_type inst_type = *((unsigned int *)priv);

I agree in that the first member of both mtk_vcodec_{enc,dec}_ctx is this
enum mtk_instance_type, but no, you're not passing that as priv: you're actually
passing one of the two structures, and this would add up complexity in human
readability, and would also open the road for mistakes.

You should at this point pass the instance type to the function.

int mtk_vcodec_mem_alloc(void *priv, enum mtk_instance_type /* or int, but I prefer 
enum */ inst_type, struct mtk_vcodec_mem *mem)

...and then, since the only difference between the two `alloc` function is just
only about debugging logs, you could commonize the allocation part... an idea:

struct platform_device *pdev;
unsigned long size;
int id;


if (inst_type == MTK_INST_DECODER) {
	struct mtk_vcodec_enc_ctx *enc_ctx = priv;
	pdev = enc_ctx->dev->plat_dev;
	id = enc_ctx->id;
} else {
	struct mtk_vcodec_dec_ctx *dec_ctx = priv;
	pdev = dec_ctx->dev->plat_dev;
	id = dec_ctx->id;
}

mem->va = dma_alloc_coherent(&pdev->dev, etc.....)
if (!mem->va) {
	mtk_v4l2_err(pdev, .....);
}

mtk_v4l2_debug(&pdev->dev, 3, "[%d]  - va      = %p", id, mem->va);

...you wouldn't even need one function for enc_alloc and one for dec_alloc, as
the logic would be pretty much commonized like this.

> +
> +	if (inst_type == MTK_INST_ENCODER)
> +		return mtk_vcodec_mem_enc_alloc(priv, mem);
> +	else
> +		return mtk_vcodec_mem_dec_alloc(priv, mem);
> +}
>   EXPORT_SYMBOL(mtk_vcodec_mem_alloc);
>   
> -void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> +static void mtk_vcodec_mem_dec_free(void *priv, struct mtk_vcodec_mem *mem)
>   {
>   	unsigned long size = mem->size;
>   	struct mtk_vcodec_dec_ctx *ctx = priv;
> @@ -87,6 +117,38 @@ void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
>   	mem->dma_addr = 0;
>   	mem->size = 0;
>   }
> +
> +static void mtk_vcodec_mem_enc_free(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	unsigned long size = mem->size;
> +	struct mtk_vcodec_enc_ctx *ctx = priv;
> +	struct device *dev = &ctx->dev->plat_dev->dev;
> +
> +	if (!mem->va) {
> +		mtk_v4l2_venc_err(ctx, "%s dma_free size=%ld failed!", dev_name(dev), size);
> +		return;
> +	}
> +
> +	mtk_v4l2_venc_dbg(3, ctx, "[%d]  - va      = %p", ctx->id, mem->va);
> +	mtk_v4l2_venc_dbg(3, ctx, "[%d]  - dma     = 0x%lx", ctx->id,
> +			  (unsigned long)mem->dma_addr);
> +	mtk_v4l2_venc_dbg(3, ctx, "[%d]    size = 0x%lx", ctx->id, size);
> +
> +	dma_free_coherent(dev, size, mem->va, mem->dma_addr);
> +	mem->va = NULL;
> +	mem->dma_addr = 0;
> +	mem->size = 0;
> +}
> +
> +void mtk_vcodec_mem_free(void *priv, struct mtk_vcodec_mem *mem)
> +{
> +	enum mtk_instance_type inst_type = *((unsigned int *)priv);
> +
> +	if (inst_type == MTK_INST_ENCODER)
> +		mtk_vcodec_mem_enc_free(priv, mem);
> +	else
> +		mtk_vcodec_mem_dec_free(priv, mem);

same comments apply to the xxxx_free() function as well.
You're in the "common" scope here, so you wouldn't be forced to use the enc/dec
specific logging functions, as you can use the more generic mtk_v4l2_{debug,err}()
and mtk_vcodec_{debug,err}() functions here, which are *perfect* for the common
code.

Cheers,
Angelo


