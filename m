Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612EED3E18D
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of73KtYHZF5VGPuc2VVBApwFV0wGjbK7ryGZCnOyECM=; b=jaUp2qozAVGERZ5pq5awMhFMHw
	qE2LMvddPhTtRgu1J+fksgi7QQDDF77P8PlwSVtbW2K13RipCUOAgJgtHa99OW00ez1GBUgS4OejQ
	LgZxHO5QFU52jnnbaGKHXgIy0JsPaQQ2gStPIej+kVEnG+b5vG/vIlBdnA6c6SU1cw15Z4Mp7wepz
	4TeqhAP9Ro/6T+AKtbCyIAyeF7U8Y+Jp3/cJQZVlfNf5KmDwr0fN7ucklckg1dUWyNg5eL5kVE+kN
	hEQU/hrZqGDJ9iHQ4IprbZM4wkHHZXYuYlE/lZ2oE2sGAbGHlp3bvpvohiwBAMWURoqjl4uNkKdse
	DgpnmekQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1vgd-00000002CKF-3b5R;
	Fri, 18 Oct 2024 22:43:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1vfA-00000002C6k-2so4;
	Fri, 18 Oct 2024 22:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 25681A44BD2;
	Fri, 18 Oct 2024 22:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF23AC4CEC3;
	Fri, 18 Oct 2024 22:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729291298;
	bh=9MYUEN+y7bGhQ5uRf0uI07lO/K3C7KNY5c2cLXqPh0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=evCiJPUCO4yWevyL7//o8c6xzDvBdx/+3P2JRJAqCmxhOZZopbmfBAFE3SkJ2WB4F
	 N3epTMeT3tBOeG0y4vV5TL3iB5+jmxyD9kNSL6nWxs9ZMV1iTQ1IkqhcsJqU2yKAwu
	 S1FAYgcgxQacKOd5biXHyWF17AI7ZQ7SxQELEuQRU+4Hhss2hi0M4g0mk7xsk6yny1
	 IHn4kMB3qyiF+HxFqtNeLZNP9rs+SW7W+COuFysLxjLdcKa33lcFLjbXD4bFjL9thn
	 JfzDmpIDXTh63O2CEqPlHNDUEOkMw5CNFJghTHun6XRErBfJxQXJABqLecAldvKfHf
	 2s0Gi/iuKgAsw==
Date: Fri, 18 Oct 2024 15:41:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] media: mtk-vcodec: venc: avoid
 -Wenum-compare-conditional warning
Message-ID: <20241018224136.GB2635543@thelio-3990X>
References: <20241018152127.3958436-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018152127.3958436-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_154140_814576_6AE8EEB4 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <acourbot@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, linux-mediatek@lists.infradead.org, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 18, 2024 at 03:21:10PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is one of three clang warnings about incompatible enum types
> in a conditional expression:
> 
> drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c:597:29: error: conditional expression between different enumeration types ('enum scp_ipi_id' and 'enum ipi_id') [-Werror,-Wenum-compare-conditional]
>   597 |         inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
>       |                                    ^ ~~~~~~~~~~~~~~~~~   ~~~~~~~~~~~~~
> 
> The code is correct, so just rework it to avoid the warning.
> 
> Fixes: 0dc4b3286125 ("media: mtk-vcodec: venc: support SCP firmware")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  .../platform/mediatek/vcodec/encoder/venc/venc_h264_if.c    | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> index f8145998fcaf..8522f71fc901 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
> @@ -594,7 +594,11 @@ static int h264_enc_init(struct mtk_vcodec_enc_ctx *ctx)
>  
>  	inst->ctx = ctx;
>  	inst->vpu_inst.ctx = ctx;
> -	inst->vpu_inst.id = is_ext ? SCP_IPI_VENC_H264 : IPI_VENC_H264;
> +	if (is_ext)
> +		inst->vpu_inst.id = SCP_IPI_VENC_H264;
> +	else
> +		inst->vpu_inst.id = IPI_VENC_H264;
> +
>  	inst->hw_base = mtk_vcodec_get_reg_addr(inst->ctx->dev->reg_base, VENC_SYS);
>  
>  	ret = vpu_enc_init(&inst->vpu_inst);
> -- 
> 2.39.5
> 

