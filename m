Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABB42C54E67
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxRC8Fq9QERcJb2UzuZo004M89nErmy23IOOPk9M5fQ=; b=EczZ6MHytorhzU1mvKmVmPJf2o
	eNV1adolBGNjIIbhBNFzTpFKr+yrcVmxfjVkjTnCjAkcSRul+bwmuGnutSYOppEOs5S7niW+dHx33
	IRuiuCtp5hjz9nIAucbbuGJyk1kHSI8ohBB4kVAJAKy6xo1LOnDmpbHctLkc+zaQwKtPM8wKPCPrI
	Y5Wz/EN5jv/O3o+vD+OUDjwLi/zRtZmOOTjzxFwAwvxrd/HWwImPtwAkhGaiXSobRbCzQkmWepRjF
	2Iag3wXr/3XIffpVYTygo27kJ7jseTUYIuNNMswpPkRdpOnE5WVMAHf/bSKSW2L87fAoM+RzWl+yF
	Rek7j5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP9y-0000000AK9z-15AM;
	Wed, 13 Mar 2024 14:00:46 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP9t-0000000AK8x-3tMG;
	Wed, 13 Mar 2024 14:00:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710338440;
	bh=sbE/oJOP+xX5Lc9uR9YZEG+4mUwEDJhSytN76LNWq08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j33gQHjbQ2kOimxuku7kTz/iiCCqlQEC3yHUb+UJe92MzppLMEq+gkRySJvkDSof0
	 lVKWvU5jtadwhR3aEABQ2G5pswNXmV6HelhaehNPoM2S9qKqllE0YZMSSp25wowUrB
	 1NPJAq96Pp23tO21I4Wj1Hr2r31g0N4xOZIyqHbADxRacfPfzMAki3SR5o7a1MZKd6
	 99mrqoOEjFWU7S8yQVIMBUu3ISDCMNFWz0OgmPxlAlRVVWAWDR5lP4zJnbN2Vato6r
	 mVpdU1xBQHCbtaPwUqgJ87I6cm9Auz9AETBf/o1Elr/zLImxXL/t/S3XpIG2FeRwXM
	 YYlP3pg+IsMng==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E925937820D4;
	Wed, 13 Mar 2024 14:00:38 +0000 (UTC)
Date: Wed, 13 Mar 2024 15:00:28 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: mediatek: vcodec: Fix oops when HEVC init fails
Message-ID: <20240313140028.zk47awvadwfrutu6@basti-XPS-13-9310>
References: <20240226211954.400891-1-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240226211954.400891-1-nicolas.dufresne@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_070042_293539_2A437C94 
X-CRM114-Status: GOOD (  14.04  )
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

Hey Nicolas,

On 26.02.2024 16:19, Nicolas Dufresne wrote:
>In stateless HEVC case, the instance pointer was saved in the
>context regardless if the initialization worked. As the pointer
>is freed in failure, this resulted in use after free in the
>deinit function.

just to fix some grammatic erros in the commit log, my suggestion:

```
The stateless HEVC decoder saves the instance pointer in the context
regardless if the initialization worked or not. This caused a use after
free, when the pointer is freed in case of a failure in the deinit
function.
Only store the instance pointer when the initialization was successful,
to solve this issue.
```

Greetings,
Sebastian

>
> Hardware name: Acer Tomato (rev3 - 4) board (DT)
> pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : vcodec_vpu_send_msg+0x4c/0x190 [mtk_vcodec_dec]
> lr : vcodec_send_ap_ipi+0x78/0x170 [mtk_vcodec_dec]
> sp : ffff80008750bc20
> x29: ffff80008750bc20 x28: ffff1299f6d70000 x27: 0000000000000000
> x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> x23: ffff80008750bc98 x22: 000000000000a003 x21: ffffd45c4cfae000
> x20: 0000000000000010 x19: ffff1299fd668310 x18: 000000000000001a
> x17: 000000040044ffff x16: ffffd45cb15dc648 x15: 0000000000000000
> x14: ffff1299c08da1c0 x13: ffffd45cb1f87a10 x12: ffffd45cb2f5fe80
> x11: 0000000000000001 x10: 0000000000001b30 x9 : ffffd45c4d12b488
> x8 : 1fffe25339380d81 x7 : 0000000000000001 x6 : ffff1299c9c06c00
> x5 : 0000000000000132 x4 : 0000000000000000 x3 : 0000000000000000
> x2 : 0000000000000010 x1 : ffff80008750bc98 x0 : 0000000000000000
> Call trace:
>  vcodec_vpu_send_msg+0x4c/0x190 [mtk_vcodec_dec]
>  vcodec_send_ap_ipi+0x78/0x170 [mtk_vcodec_dec]
>  vpu_dec_deinit+0x1c/0x30 [mtk_vcodec_dec]
>  vdec_hevc_slice_deinit+0x30/0x98 [mtk_vcodec_dec]
>  vdec_if_deinit+0x38/0x68 [mtk_vcodec_dec]
>  mtk_vcodec_dec_release+0x20/0x40 [mtk_vcodec_dec]
>  fops_vcodec_release+0x64/0x118 [mtk_vcodec_dec]
>  v4l2_release+0x7c/0x100
>  __fput+0x80/0x2d8
>  __fput_sync+0x58/0x70
>  __arm64_sys_close+0x40/0x90
>  invoke_syscall+0x50/0x128
>  el0_svc_common.constprop.0+0x48/0xf0
>  do_el0_svc+0x24/0x38
>  el0_svc+0x38/0xd8
>  el0t_64_sync_handler+0xc0/0xc8
>  el0t_64_sync+0x1a8/0x1b0
> Code: d503201f f9401660 b900127f b900227f (f9400400)
>
>Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
>Fixes: 2674486aac7d ("media: mediatek: vcodec: support stateless hevc decoder")
>---
> .../mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c       | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
>index 06ed47df693bf..21836dd6ef85a 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_multi_if.c
>@@ -869,7 +869,6 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
> 	inst->vpu.codec_type = ctx->current_codec;
> 	inst->vpu.capture_type = ctx->capture_fourcc;
>
>-	ctx->drv_handle = inst;
> 	err = vpu_dec_init(&inst->vpu);
> 	if (err) {
> 		mtk_vdec_err(ctx, "vdec_hevc init err=%d", err);
>@@ -898,6 +897,7 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec_ctx *ctx)
> 	mtk_vdec_debug(ctx, "lat hevc instance >> %p, codec_type = 0x%x",
> 		       inst, inst->vpu.codec_type);
>
>+	ctx->drv_handle = inst;
> 	return 0;
> error_free_inst:
> 	kfree(inst);
>-- 
>2.43.2
>
>_______________________________________________
>Kernel mailing list -- kernel@mailman.collabora.com
>To unsubscribe send an email to kernel-leave@mailman.collabora.com
>This list is managed by https://mailman.collabora.com

