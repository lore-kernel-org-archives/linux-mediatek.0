Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FD6C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sVH0boheHEjqFAG/uYCckQKXtdYKR4rZiD2FneAdLPQ=; b=J6oWRzLbztkN9sIwiT+PDHTewd
	SgkGZYYjib5nNv6qXZEjo0JSxP1vW/hD/I0Y5d2mq2UxlO7MIk+cn4XH9r2pIT93n3IlWeFbB1+KU
	5+JClIUGXUa2iCd7M4WUH33wNe0Ivjtg6w6b+lLUXCXLUGiZ9Bi/xRwodStHi+Lwra4GTgzVY/VZ+
	ploBu2QKeQjvDQiNGuqSc0zkA1iSCGQqBKG9vpNz93UAu4dPBhdZs+631vTiuQJWbQ4hykYpegM6N
	tohI1ZC2xyrOfuxEN8aSVc8O/3IFMaakR2C8DMbu4IsaEBTqTyJPgqu4kl+XnCCec9DKz++8tvTUt
	ykjgM6EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTqpa-00000008GlW-2D4F;
	Sat, 27 Jan 2024 22:07:18 +0000
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTqpV-00000008GkT-32FI;
	Sat, 27 Jan 2024 22:07:13 +0000
Message-ID: <0b108b53-0dba-4c8f-91c1-2725f0752f23@infradead.org>
Date: Sat, 27 Jan 2024 14:07:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] media: mediatek: vcodec: Fix kerneldoc
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Bin Liu <bin.liu@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-amlogic@lists.infradead.org
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-9-eed7865fce18@chromium.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-9-eed7865fce18@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 1/26/24 15:16, Ricardo Ribalda wrote:
> Those fields have been removed. They do not need to be documented.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h | 1 -
>  drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h    | 1 -
>  drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> index ece27c880e50..1af075fc0194 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> @@ -39,7 +39,6 @@ struct vdec_fb {
>  /**
>   * struct mtk_video_dec_buf - Private data related to each VB2 buffer.
>   * @m2m_buf:	M2M buffer
> - * @list:	link list
>   * @used:	Capture buffer contain decoded frame data and keep in
>   *			codec data structure
>   * @queued_in_vb2:	Capture buffer is queue in vb2
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
> index fbb3f34a73f0..aa7d08afc2f4 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_vpu_if.h
> @@ -22,7 +22,6 @@ struct mtk_vcodec_dec_ctx;
>   *                in place of inst_addr in messages.
>   * @signaled    : 1 - Host has received ack message from VPU, 0 - not received
>   * @ctx         : context for v4l2 layer integration
> - * @dev		: platform device of VPU
>   * @wq          : wait queue to wait VPU message ack
>   * @handler     : ipi handler for each decoder
>   * @codec_type     : use codec type to separate different codecs
> diff --git a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
> index 82246401ed4a..908d8179b2d2 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc.h
> @@ -26,7 +26,6 @@
>  /**
>   * struct mtk_video_enc_buf - Private data related to each VB2 buffer.
>   * @m2m_buf:	M2M buffer
> - * @list:	list that buffer link to
>   * @param_change: Types of encode parameter change before encoding this
>   *				buffer
>   * @enc_params: Encode parameters changed before encode this buffer
> 

-- 
#Randy

