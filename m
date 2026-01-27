Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB51FD2F000
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 12:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AX4/TNh61IVZB1JNxBYty5bKjxZR2a2kQJgtXocrk4A=; b=PSP103iR4uZIqSGGGu+H8Ui6wq
	winKChFyPltQtkB97X95nwlud7zbyTtcUcgnexM51nEJY1YJN6Qicl3o8WVNZlTFVijC9/Cw3nmIj
	PrvCqKZ00PkzLYy+4W/CekjBTD3JoBqFBgYWwS46bGOcmqsJuCgV/4veGuEVxK0rb+Angd98oNb2w
	YrrF7aUi9ey+h1KBLyL1OfJMOcwbdQpYGkJ6SjB+QLqim8qrLRYvyBW4JWBRyCI+nC1rih01NHLv4
	SIIP2quUAtzkUxwT+PaO/ZdJOj28u7roCjuGgfN8jz7JFaA6pbclar2LgeIN6Z800zGBDQ6qUovlO
	R8upAb0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhrS-0000000ECYR-3KUd;
	Tue, 27 Jan 2026 12:07:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhr2-0000000ECGt-1kOu;
	Tue, 27 Jan 2026 12:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769515649;
	bh=70+/DNYrFggN9eDfMpR3kzVs+VVxrYy4X0zpC3rdZ6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qLVmcoEF9ontFd7As8dWp2/kIT1cZWICwvigRIgKmDifiJcaBhxa6usfq7tK6rS9R
	 UPz3DbYlgs5/hekWcJhJC2MAftQdp8ZWNoxbYsFMDUSqowgOqSNTEZkMhXd/HEOMAt
	 JdbzaBBlMQjhKQKTxv+M0up+XkjLOAvlARBq0x6+iUMzrgpRIf9Lp/YfQ2R+W4bW9G
	 AV4H84TC2KwJqCYr7PEQvi+qKtsFw7yClDNemDAE9k9pU78pkbUtfUSOUVuuVxO1qo
	 /YZHOME7Sz6rAZm2p4he3nP2h8UL9lrxslINiy4O5wgY3Pz8SFhpHmOFcIPiBAOAJW
	 nQScDpmIyFHxw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2517217E13C4;
	Tue, 27 Jan 2026 13:07:29 +0100 (CET)
Message-ID: <069a1c90-9592-41f2-8f45-707231f782f6@collabora.com>
Date: Tue, 27 Jan 2026 13:07:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/10] media: mediatek: vcodec: add decoder compatible
 to support MT8189
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Yilong Zhou <yilong.zhou@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
 <20260127024248.18406-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260127024248.18406-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040732_659513_E3633B3A 
X-CRM114-Status: GOOD (  14.55  )
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

Il 27/01/26 03:42, Kyrie Wu ha scritto:
> MT8189 is pure single core architecture. Add its compatible to
> initialize platform data.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.h   |  1 +
>   .../vcodec/decoder/mtk_vcodec_dec_drv.c        |  4 ++++
>   .../vcodec/decoder/mtk_vcodec_dec_stateless.c  | 18 ++++++++++++++++++
>   3 files changed, 23 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> index 80cb46f1cded..2bde871c0224 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> @@ -71,6 +71,7 @@ extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
>   extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index c7af48f684c5..8f52e002a51e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -555,6 +555,10 @@ static const struct of_device_id mtk_vcodec_match[] = {
>   		.compatible = "mediatek,mt8196-vcodec-dec",
>   		.data = &mtk_vdec_8196_pdata,
>   	},
> +	{
> +		.compatible = "mediatek,mt8189-vcodec-dec",
> +		.data = &mtk_vdec_8189_pdata,
> +	},
>   	{},
>   };
>   
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> index 0745bc3ee490..aba28d276bdf 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
> @@ -968,3 +968,21 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata = {
>   	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
>   	.chip_name = 8186,
>   };
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata = {
> +	.init_vdec_params = mtk_init_vdec_params,
> +	.ctrls_setup = mtk_vcodec_dec_ctrls_setup,
> +	.vdec_vb2_ops = &mtk_vdec_request_vb2_ops,
> +	.vdec_formats = mtk_video_formats,
> +	.num_formats = &num_formats,
> +	.default_out_fmt = &default_out_format,
> +	.default_cap_fmt = &default_cap_format,
> +	.uses_stateless_api = true,
> +	.worker = mtk_vdec_worker,
> +	.flush_decoder = mtk_vdec_flush_decoder,
> +	.cap_to_disp = mtk_vdec_stateless_cap_to_disp,
> +	.get_cap_buffer = vdec_get_cap_buffer,
> +	.is_subdev_supported = true,

You introduced `MTK_STATELESS_DEC_DATA` in the previous patch... and you should
use it here too.

Cheers,
Angelo

> +	.hw_arch = MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name = 8189,
> +};


