Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB5DC54E69
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CIymuAghRZyBtzAiy8gVFEAQ5hcu6HgzHt3mP+5l8A=; b=0lSl0tvyGzPg4XB6PKfCPT20uJ
	OkU0fefX5EOQwgKBbnQ7BFKwkOIHWEEkxU6xZXHc4qVVv3FocZfUUwrxTmG5bZUnOBnBwiXe+olSe
	3FrRiGaFol6mgSy4B+YAYc+GeFQRUZftHgLjFaeMmEgjFWG6dtzHNY7D1fmpW60QzxB30yUDrzJj5
	GuxXpGBxYOaOWaboFLog+uizbU/5d5Rd0XJl/S9FpfbgwK1WRlQzcwlK22iHl4GGKsD1+nIXtg+je
	J+q85rw/BBHuKUX08sDZqNgZBukzrq0CSbvX6EjbK2y4d1C939RKbWzldYcqgPS6jGX6mC0sWLYGZ
	0ht8IHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4pW-0000000HTOX-2L8n;
	Fri, 15 Mar 2024 10:30:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl4pS-0000000HTNl-1vjM;
	Fri, 15 Mar 2024 10:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710498618;
	bh=Wi/QbN+8ipUEYeOAbUm86xpNE3oPJ0g7EhQMoF7njRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NafJHbAd9/omf5ShUyuD5GKzQhS3XJhF4WMagWXntKDm3n8ti0taj0esJziU84Mdp
	 WxYGljPwkXxB/PIz9ZLteJsSqXoYKViMdBJzKwxa4hy1ptRIMx8uVa3dNz6zuawAiD
	 BT6Otsgt/kFOBfErLJb6+zoetXvFppHZ86JA1bLOb2cBtH40Cs1Lr/UdGQjmk1R6D1
	 sc2FoITqwOwvMCEk7Qf8hjr9Tku2FW4ps+x36BQYhVeob6INGvf88oXDqrVGj72evN
	 ojyf3oZ8szTOXxre1VJoYt0ebtUIYWZdugBIh++MpGJXZ2oS3Wmx5TepO4gGVBoWhb
	 d/+ulbrcypKuw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9D6383782083;
	Fri, 15 Mar 2024 10:30:18 +0000 (UTC)
Date: Fri, 15 Mar 2024 11:30:17 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH] media: mediatek: vcodec: add decoder command to support
 stateless decoder
Message-ID: <20240315094706.xcpjy5s4fjtjvn7j@basti-XPS-13-9310>
References: <20240315072629.27738-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240315072629.27738-1-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_033022_742121_6538F4B2 
X-CRM114-Status: GOOD (  13.83  )
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

Hey Yunfei,

On 15.03.2024 15:26, Yunfei Dong wrote:
>The supported decoder commands are different for stateless and
>stateful architecture. Adding stateless decoder commands to fix

s/Adding/Add/

>below v4l2-compliance test error.

s/below v4l2-compliance test error./the v4l2-compliance test error below./

>
>Codec ioctls:
>    VIDIOC_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
>    VIDIOC_TRY_ENCODER_CMD returned -1 (Inappropriate ioctl for device)
> test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>    VIDIOC_G_ENC_INDEX returned -1 (Inappropriate ioctl for device)
> test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>    VIDIOC_DECODER_CMD returned -1 (Invalid argument)
>    VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>    VIDIOC_TRY_DECODER_CMD returned -1 (Invalid argument)
>    fail: v4l2-test-codecs.cpp(126): ret
> test VIDIOC_(TRY_)DECODER_CMD: FAIL
>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../mediatek/vcodec/decoder/mtk_vcodec_dec.c  | 65 +++++++++++++++++--
> 1 file changed, 59 insertions(+), 6 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>index ba742f0e391d..90579dd92cae 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
>@@ -80,21 +80,20 @@ static struct mtk_q_data *mtk_vdec_get_q_data(struct mtk_vcodec_dec_ctx *ctx,
> 	return &ctx->q_data[MTK_Q_DATA_DST];
> }
>
>-static int vidioc_try_decoder_cmd(struct file *file, void *priv,
>-				struct v4l2_decoder_cmd *cmd)
>+static int mtk_vcodec_stateful_try_decoder_cmd(struct file *file, void *priv,
>+					       struct v4l2_decoder_cmd *cmd)

In some cases you seem to name these functions with the prefix
`mtk_vdec` and sometimes with the prefix `mtk_vcodec` but all of these
are for decoders, so could you settle for one naming scheme? Also as
these functions are static I don't think it is strictly necessary to add
a prefix for each function.

> {
> 	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
> }
>
>-
>-static int vidioc_decoder_cmd(struct file *file, void *priv,
>-				struct v4l2_decoder_cmd *cmd)
>+static int mtk_vcodec_stateful_decoder_cmd(struct file *file, void *priv,
>+					   struct v4l2_decoder_cmd *cmd)
> {
> 	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
> 	struct vb2_queue *src_vq, *dst_vq;
> 	int ret;
>
>-	ret = vidioc_try_decoder_cmd(file, priv, cmd);
>+	ret = mtk_vcodec_stateful_try_decoder_cmd(file, priv, cmd);
> 	if (ret)
> 		return ret;
>
>@@ -128,6 +127,60 @@ static int vidioc_decoder_cmd(struct file *file, void *priv,
> 	return 0;
> }
>
>+static int mtk_vcodec_stateless_try_decoder_cmd(struct file *file, void *priv,
>+						struct v4l2_decoder_cmd *cmd)
>+{
>+	return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
>+}
>+
>+static int mtk_vcodec_stateless_decoder_cmd(struct file *file, void *priv,
>+					    struct v4l2_decoder_cmd *cmd)
>+{
>+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>+	int ret;
>+
>+	ret = v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv, cmd);
>+	if (ret)
>+		return ret;
>+
>+	mtk_v4l2_vdec_dbg(3, ctx, "decoder cmd=%u", cmd->cmd);
>+	switch (cmd->cmd) {
>+	case V4L2_DEC_CMD_FLUSH:
>+		/*
>+		 * If the flag of output buffer is set with V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF,

s/output/the output/
s/is set with/equals/

>+		 * this command will prevent dequeueing the capture buffer containing the last
>+		 * decoded frame. Or do nothing
>+		 */
>+		break;
>+

Please remove this newline.

>+	default:
>+		mtk_v4l2_vdec_err(ctx, "invalid stateless decoder cmd=%u", cmd->cmd);
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
>+static int vidioc_try_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>+{
>+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>+
>+	if (ctx->dev->vdec_pdata->uses_stateless_api)
>+		return mtk_vcodec_stateless_try_decoder_cmd(file, priv, cmd);
>+	else

As these conditional branches contain return statements you can skip the
else.
E.g.
	if (ctx->dev->vdec_pdata->uses_stateless_api)
		return mtk_vcodec_stateless_try_decoder_cmd(file, priv, cmd);
   return mtk_vcodec_stateful_try_decoder_cmd(file, priv, cmd);

>+		return mtk_vcodec_stateful_try_decoder_cmd(file, priv, cmd);
>+}
>+
>+static int vidioc_decoder_cmd(struct file *file, void *priv, struct v4l2_decoder_cmd *cmd)
>+{
>+	struct mtk_vcodec_dec_ctx *ctx = fh_to_dec_ctx(priv);
>+
>+	if (ctx->dev->vdec_pdata->uses_stateless_api)
>+		return mtk_vcodec_stateless_decoder_cmd(file, priv, cmd);
>+	else

Same as mentioned above.

>+		return mtk_vcodec_stateful_decoder_cmd(file, priv, cmd);
>+}
>+
> void mtk_vdec_unlock(struct mtk_vcodec_dec_ctx *ctx)
> {
> 	mutex_unlock(&ctx->dev->dec_mutex[ctx->hw_id]);
>-- 
>2.18.0
>

