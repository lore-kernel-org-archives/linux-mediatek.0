Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6A6C00A98
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Oct 2023 09:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjrE0xb1F8PO0O3yiV7vAqIvkO3BQ+nO5QWRbU9foF4=; b=WfPUCkTeGxaP1jH+6m5cCtjb9K
	yDRMrBeDM4+Ik2zkmrZQFBp0tzczbQgsEACK1px110URP2X1zpPEsqJn/aQHGUDMCdg11+Rr7AQ8q
	iypTp02aaL881TKTD6TpWRA+bntclmCx0u4PqWZgEa4XvSz7fw3MrsY7BqZ+U1WZAY/3B15mQphm6
	8V2WjITHuLoXwGIJEw5Fu7Y5tPtAlWvUK8xjxAJ0v2ADXhGOYcmBkwNoSThXXWgregxx1qk3EuNTw
	NLznNr3HHlwFIRxsfHzReyO8ZuX3sFeQC18wtonrYnly/KKUmUTIQFkwS48scoDVogKufOwId0F0I
	YoXEx5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8Er-003hT8-1g;
	Sat, 21 Oct 2023 09:25:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8El-003hSI-1n;
	Sat, 21 Oct 2023 09:25:43 +0000
Received: from localhost (89-26-75-29.dyn.cablelink.at [89.26.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1BD06607337;
	Sat, 21 Oct 2023 10:25:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697880338;
	bh=tHF89MFfLcL7e+zhlIBsjsDendLMw9pOYO/8Zqw5oH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L5rpE5dpesmdENn4qbO++LTB3Yae6XBFFoJhp6UnpZBdxWMH54o1os8PR+uiWt1wI
	 3XUyccg/eZDO1xOJECICqFS3Z4lOOXxLpEP/6QyWYXM0zsDdqF76nN3lNkUg19yxLA
	 j2rYyN3hG4ZWJeyMc0BjaJUfor36x0NC7iJk45FrAw4qGHF+gJTUHSSpp5WWVjZCJS
	 AhTZ268gIHuqMCShURLjVQZJAQ80FFkTdJsvbFYICLpHtehtqPDJbEgcUXWPHMVfmD
	 m3RMlAw5gJdrMW80hVjnz74aQOyIaGoJad5363NsYcQ57cMAUwjnE7Sk/iUwSGmKAG
	 jMpRPQpXHPXoA==
Date: Sat, 21 Oct 2023 11:25:35 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>
Cc: =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 3/7] media: mediatek: vcodec: Setting the supported h265
 level for each platform
Message-ID: <20231021092535.hna2fzgbevluczm4@basti-XPS-13-9310>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
 <20231016064346.31451-3-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231016064346.31451-3-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_022539_728671_9E68E416 
X-CRM114-Status: GOOD (  11.71  )
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

On 16.10.2023 14:43, Yunfei Dong wrote:
>The supported resolution and fps of different platforms are not the
>same. Need to set the supported level according to the chip name.

I would suggest the following rewording:

Set the maximum H265 codec level for each platform.
The various mediatek platforms support different levels for decoding,
the level of the codec limits among others the maximum resolution, bit
rate and frame rate for the decoder.

With that you can add:
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian

>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 28 +++++++++++++++++++
> 1 file changed, 28 insertions(+)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index f4af81bddc58..1fdb21dbacb8 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -147,6 +147,16 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
> 		},
> 		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
> 	},
>+	{
>+		.cfg = {
>+			.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>+			.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>+			.def = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>+			.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
>+		},
>+		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
>+	},
>+
> 	{
> 		.cfg = {
> 			.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>@@ -549,6 +559,20 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
> 	};
> }
>
>+static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
>+					   struct mtk_vcodec_dec_ctx *ctx)
>+{
>+	switch (ctx->dev->chip_name) {
>+	case MTK_VDEC_MT8188:
>+	case MTK_VDEC_MT8195:
>+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
>+		break;
>+	default:
>+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
>+		break;
>+	};
>+}
>+
> static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 					  struct mtk_vcodec_dec_ctx *ctx)
> {
>@@ -557,6 +581,10 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 		mtk_vcodec_dec_fill_h264_level(cfg, ctx);
> 		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported level: %lld %lld", cfg->max, cfg->def);
> 		break;
>+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
>+		mtk_vcodec_dec_fill_h265_level(cfg, ctx);
>+		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported level: %lld %lld", cfg->max, cfg->def);
>+		break;
> 	default:
> 		break;
> 	};
>-- 
>2.18.0
>

