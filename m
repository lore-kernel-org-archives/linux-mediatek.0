Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BFEC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Feb 2024 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UFDNzUrVWkbaNuBruetI7ADH1wx88b9ywyJLcpWw2Y=; b=lIu/lJgUPypAkfGDZWBDJ5RveM
	ICkILOHAW+D66oQpj6ip5JAyPK1r+JZ8AJJDo0ThyfPTtAtLyVCHUBX64cvHfNQ3MZW1nJbKSq/zT
	JSGqWnndihZu/KxU5OmFUjUg9/5uoOyEMPYuuyKgDZebitv4+952jeAWoyHxfSi+A9lGD5TnucpEj
	4/6G9C/7vLn+tEOGMEJDErzJnNWxbAtTSZmvc1yb+yZSXpHhdqLzmWczd79LjgJbK5wKBQrDXFZoU
	8HWB8P/DCssose3Iz9BNIglZgkdAODwrqeVu6Qqf9vavgtylsW9aONLEHfA2kwp8g2fl9x3zliZcE
	XN3B0YUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGsT-00000008mT2-1bv4;
	Wed, 28 Feb 2024 10:09:29 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfGsP-00000008mSU-3TvB;
	Wed, 28 Feb 2024 10:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709114964;
	bh=S66s19ilvDHTNIulMAImsMB6AkaPAi9N9/xnkhBU13k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Skew+2LOY7JbHwKpTbn8YnEJTYP2G50KkkHUgi6mQv0GLQVie8KLptOh2ijMyWp25
	 4aFi6QD8QSXodCbY/qyo7t1nSTF1XHcmytnnAhaZ+x3pc3pKGKasqgVigmzCsjnEHr
	 kolcyRw7M+mEU5aA+Ta1zv4ft/DYLLt5LDgcVRDfXcz4h7TAyeoGZSO0q8lnnzZabE
	 DhEeUV14LG5nJLEbnE4d793Dy1nRzHAuFkEtFTrHF6BWWdEzU6s7ZZnRDpscnsjjS3
	 FiZ6L7D4Xsqe7aCd2SJPdL9WPxmDh5y7n5NSzqGrKJg4u3AB1n4ckYgq87Y2/+A8qh
	 Ggcq2RaJdmgAw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AE5D937820CB;
	Wed, 28 Feb 2024 10:09:23 +0000 (UTC)
Message-ID: <e7d57472-08f9-4e71-8c42-2f95d9a81f75@collabora.com>
Date: Wed, 28 Feb 2024 11:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mediatek: vcodec: Fix oops when HEVC init fails
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240226211954.400891-1-nicolas.dufresne@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240226211954.400891-1-nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_020926_045677_30E960A9 
X-CRM114-Status: GOOD (  21.32  )
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

Il 26/02/24 22:19, Nicolas Dufresne ha scritto:
> In stateless HEVC case, the instance pointer was saved in the
> context regardless if the initialization worked. As the pointer
> is freed in failure, this resulted in use after free in the
> deinit function.
> 

 From what I understand, "the pointer" that is freed is struct vdec_vpu_inst; is
that correct?

Since you do have a way to easily reproduce the issue on your side, can we resolve
the safety/reliability root issue as well as making this correct?

The idea is being able to avoid a kernel panic in the situation that you describe
in this fix, but throw an error message (read: throw a big "wtf!") when this does
happen, and handle that with returning an error code (avoiding a kernel crash).

Let's cut it short - please try this:

In functions
   - int vpu_vdec_start()
   - int vpu_dec_get_param()
   - int vcodec_send_ap_ipi()

at the beginning, perform this check:

	if (unlikely(!vpu)) {
		/* Write a scarier message if this is not scary enough */
		mtk_vdec_err("FIXME!! - VPU is NULL. This is unexpected.\n");
		return -EINVAL; /* or something else if more meaningful */
	}

Unless I've misunderstood what's NULL, that'll work. :-)


Meanwhile, for this fix:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

>   Hardware name: Acer Tomato (rev3 - 4) board (DT)
>   pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>   pc : vcodec_vpu_send_msg+0x4c/0x190 [mtk_vcodec_dec]
>   lr : vcodec_send_ap_ipi+0x78/0x170 [mtk_vcodec_dec]
>   sp : ffff80008750bc20
>   x29: ffff80008750bc20 x28: ffff1299f6d70000 x27: 0000000000000000
>   x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>   x23: ffff80008750bc98 x22: 000000000000a003 x21: ffffd45c4cfae000
>   x20: 0000000000000010 x19: ffff1299fd668310 x18: 000000000000001a
>   x17: 000000040044ffff x16: ffffd45cb15dc648 x15: 0000000000000000
>   x14: ffff1299c08da1c0 x13: ffffd45cb1f87a10 x12: ffffd45cb2f5fe80
>   x11: 0000000000000001 x10: 0000000000001b30 x9 : ffffd45c4d12b488
>   x8 : 1fffe25339380d81 x7 : 0000000000000001 x6 : ffff1299c9c06c00
>   x5 : 0000000000000132 x4 : 0000000000000000 x3 : 0000000000000000
>   x2 : 0000000000000010 x1 : ffff80008750bc98 x0 : 0000000000000000
>   Call trace:
>    vcodec_vpu_send_msg+0x4c/0x190 [mtk_vcodec_dec]
>    vcodec_send_ap_ipi+0x78/0x170 [mtk_vcodec_dec]
>    vpu_dec_deinit+0x1c/0x30 [mtk_vcodec_dec]
>    vdec_hevc_slice_deinit+0x30/0x98 [mtk_vcodec_dec]
>    vdec_if_deinit+0x38/0x68 [mtk_vcodec_dec]
>    mtk_vcodec_dec_release+0x20/0x40 [mtk_vcodec_dec]
>    fops_vcodec_release+0x64/0x118 [mtk_vcodec_dec]
>    v4l2_release+0x7c/0x100
>    __fput+0x80/0x2d8
>    __fput_sync+0x58/0x70
>    __arm64_sys_close+0x40/0x90
>    invoke_syscall+0x50/0x128
>    el0_svc_common.constprop.0+0x48/0xf0
>    do_el0_svc+0x24/0x38
>    el0_svc+0x38/0xd8
>    el0t_64_sync_handler+0xc0/0xc8
>    el0t_64_sync+0x1a8/0x1b0
>   Code: d503201f f9401660 b900127f b900227f (f9400400)
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc decoder")
> ---
>   .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c       | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> index 06ed47df693bf..21836dd6ef85a 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
> @@ -869,7 +869,6 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>   	inst->vpu.codec_type = ctx->current_codec;
>   	inst->vpu.capture_type = ctx->capture_fourcc;
>   
> -	ctx->drv_handle = inst;
>   	err = vpu_dec_init(&inst->vpu);
>   	if (err) {
>   		mtk_vdec_err(ctx, "vdec_hevc init err=%d", err);
> @@ -898,6 +897,7 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
>   	mtk_vdec_debug(ctx, "lat hevc instance >> %p, codec_type = 0x%x",
>   		       inst, inst->vpu.codec_type);
>   
> +	ctx->drv_handle = inst;
>   	return 0;
>   error_free_inst:
>   	kfree(inst);


