Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B73AC25B10
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 09:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4A/xX1yuoTXQPJxZSU++qe3x9DPYpUYp1GCrfLK9Ek=; b=PVEcVzPkthyuQykKlcD8ADP/AM
	jq3VB0ti/8DEWzQzmqOu8k4s03VuEfwJyaC/jysapT+t1ZfzcIua5GLdErlX6dEh3I/MrEvFjQyDs
	bJqfHPB7tcR983wxVH+Ae/+xtZq9Hco4r3X2Oc2i8nk+yAoWqWW3/QdJlvOnM2xVCHJumpE4YfbOb
	QLLk4eMz7GEVb8tzHeA9IjklE/cqYONKw5xsYbdtI30iysQVXSORfCXQpp8+TMGI16BFtdIWM+VXi
	5WwB/BeP0W4xyQYSDtRloTEI/deeQs/jooyJukBo6AFo2iAkhFJO8+aKx8NfXcKYHR/wR5/tYxtPE
	eKOxY0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50UB-000000012tU-1haE;
	Thu, 09 May 2024 09:54:47 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s50U8-000000012rF-1HfB;
	Thu, 09 May 2024 09:54:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715248472;
	bh=vlum46Tb8PK1ROm2H5JtmPI6YiTvRNegUq7mRooArb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=njHpLvDQoHLR62SJqkphCa4t2y6tge0nUhsPjiEp71pkNWsyrAN9BxUS304Kx7X7p
	 gNzc+DR86MGpZTq+PcN5NGK7RqX1XBRruJSACmb0wweYeaAXtNL9djgi9y32NYf7Fp
	 z7IBKnI5nwAd7fhzO8nGjt/Kl/UTDQaQRXAETNW7sYcIYYl3xj6ufid1lfBQmy9dOr
	 1JKijGa9ezVTF6Aj3opG0KkReV/MAVHTvZx24CDxcp7a9nysq14/ymKDQ+MAVnSeez
	 9hsjM1FNr3fdjZEE7DZu18QYbwQvt3fFVSNeBM7HbE06eEI+geyYFFWJQoOCfG+UVr
	 1szJShnvwrpvA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C518637820FA;
	Thu,  9 May 2024 09:54:31 +0000 (UTC)
Message-ID: <2aefd938-f70a-4133-a3a8-9c96464c9f5f@collabora.com>
Date: Thu, 9 May 2024 11:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: mediatek: vcodec: add decoder command to
 support stateless decoder
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>,
 Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240316081344.4262-1-yunfei.dong@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240316081344.4262-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_025444_495043_A28C6E2B 
X-CRM114-Status: GOOD (  21.17  )
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

Il 16/03/24 09:13, Yunfei Dong ha scritto:
> The supported decoder commands are different for stateless and
> stateful architecture. Add stateless decoder commands to fix
> the v4l2-compliance test error below.
> 
> Codec ioctls:
>      VIDIOC_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
>      VIDIOC_TRY_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
>   test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>      VIDIOC_G_ENC_INDEX returned -1 (Inappropriate ioctl for device)
>   test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>      VIDIOC_DECODER_CMD returned -1 (Invalid argument)
>      VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>      VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>      fail: v4l2-test-codecs.cpp(126): ret
>   test VIDIOC_(TRY_)DECODER_CMD: FAIL
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Nicolas, Sebastian, anything to add?

Cheers,
Angelo

> ---
> changed with v1:
> - remove the static function prefix.
> - fix some messages not reasonable.
> ---
>   .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 60 +++++++++++++++++--
>   1 file changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> index ba742f0e391d..c2b64a528028 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
> @@ -80,21 +80,18 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_dec_ctx *ctx,
>   	return &ctx->q_data[MTK_Q_DATA_DST];
>   }
>   
> -static int vidioc_try_decoder_cmd(struct file *file, void *priv,
> -				struct v4l2_decoder_cmd *cmd)
> +static int stateful_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>   {
>   	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
>   }
>   
> -
> -static int vidioc_decoder_cmd(struct file *file, void *priv,
> -				struct v4l2_decoder_cmd *cmd)
> +static int stateful_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>   {
>   	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>   	struct vb2_queue *src_vq, *dst_vq;
>   	int ret;
>   
> -	ret = vidioc_try_decoder_cmd(file, priv, cmd);
> +	ret = stateful_try_decoder_cmd(file, priv, cmd);
>   	if (ret)
>   		return ret;
>   
> @@ -128,6 +125,57 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
>   	return 0;
>   }
>   
> +static int stateless_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
> +}
> +
> +static int stateless_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
> +	int ret;
> +
> +	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
> +	if (ret)
> +		return ret;
> +
> +	mtk_v4l2_vdec_dbg(3, ctx, "decoder cmd=%u", cmd->cmd);
> +	switch (cmd->cmd) {
> +	case V4L2_DEC_CMD_FLUSH:
> +		/*
> +		 * If the flag of the output buffer is equals V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF,
> +		 * this command will prevent dequeueing the capture buffer containing the last
> +		 * decoded frame. Or do nothing
> +		 */
> +		break;
> +	default:
> +		mtk_v4l2_vdec_err(ctx, "invalid stateless decoder cmd=%u", cmd->cmd);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
> +
> +	if (ctx->dev->vdec_pdata->uses_stateless_api)
> +		return stateless_try_decoder_cmd(file, priv, cmd);
> +
> +	return stateful_try_decoder_cmd(file, priv, cmd);
> +}
> +
> +static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
> +{
> +	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
> +
> +	if (ctx->dev->vdec_pdata->uses_stateless_api)
> +		return stateless_decoder_cmd(file, priv, cmd);
> +
> +	return stateful_decoder_cmd(file, priv, cmd);
> +}
> +
>   void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
>   {
>   	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);




