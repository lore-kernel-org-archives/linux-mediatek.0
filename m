Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01652C0032E
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Oct 2023 09:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H4pZq63n/tMf4pqaWa5U0np1d10SCIjMQMVnx6e/ie8=; b=R1PwS6iCxZEdGTDnVOWYP18O+O
	/P3fNfaQB7MDtAmOSovYLBy0rotnbWKzrvlMpM6+m3tPApjFRSbgYiBMFKH/isIBlPiGI2OM/HZ/E
	xHAUdI4vYfexkaZugcxdhbNuYn2Bc5t8o+DngSPFy97BrdHEylWzlDTdhM+eeLVtjmVF5hPk/yhCb
	3NnyA98K6thyCdg3jzoM0L7OORGQiz8lmAkAPrKNtAHDcw/cD8jrwFFc9e+jOMNQIHeBXyzKJYCVQ
	LZgbou/P1WfJ6LFXfisJcgxCvic/vf98vrz/kFvODpDG+SnbTWnnsxHrlNn8IR1MY+oL1bQLQIegH
	fVtl8nDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8XL-003iVC-2e;
	Sat, 21 Oct 2023 09:44:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8XG-003iUA-1D;
	Sat, 21 Oct 2023 09:44:50 +0000
Received: from localhost (89-26-75-29.dyn.cablelink.at [89.26.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6C9A56607314;
	Sat, 21 Oct 2023 10:44:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697881484;
	bh=f+LwnRAkpkY3scswn+NP6LVVYjh5/OezzS2acobmtdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Na5uVQl5FIlMs1ff20uKOAjBaQLjCEYH6BiamNklxK2Qi+w1vzJH1LePSlqFd49bR
	 +bzU9xJmCJRtL4exfhaxy45w1/nv0lptA4UkANuNLAgJzWHbG4wrW3PqunaTY+lU6y
	 xj0zKZhkjjcQ8BLxgRtVHV8cYzpKhpI9gvRAzfEF0UN8LllaMgPSh8JqXZJ/ymG/SW
	 MmU8ZpFlGYffQW5xhSsFq9p96Zaq6HDJzyZ9S9WSynUNI4kmibZ31qbOUwsNFU+toG
	 nMchxZztC2EvGftVXlCs9nV4R0nKnZJN2/8mKU0Hr0wCz9UfrYhS14SvlHfFiFecqd
	 V9RCnbMjo+/FA==
Date: Sat, 21 Oct 2023 11:44:41 +0200
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
Subject: Re: [PATCH 6/7] media: mediatek: vcodec: Setting the supported vp9
 level for each platform
Message-ID: <20231021094441.wegn5fc64ssliyb3@basti-XPS-13-9310>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
 <20231016064346.31451-6-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231016064346.31451-6-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_024446_550427_88770DEA 
X-CRM114-Status: GOOD (  12.17  )
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

please replace Setting with Set in the title.

On 16.10.2023 14:43, Yunfei Dong wrote:
>The supported resolution and fps of different platforms are not the
>same. Need to set the supported level according to the chip name.

I would suggest the following rewording:

Set the maximum VP9 codec level for each platform.
The various mediatek platforms support different levels for decoding,
the level of the codec limits among others the maximum resolution, bit
rate, frame rate and compression rate for the decoder.

With that you can add:
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 33 +++++++++++++++++++
> 1 file changed, 33 insertions(+)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index b15ed773374f..02985184fa0f 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -113,6 +113,15 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
> 		},
> 		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
> 	},
>+	{
>+		.cfg = {
>+			.id = V4L2_CID_MPEG_VIDEO_VP9_LEVEL,
>+			.min = V4L2_MPEG_VIDEO_VP9_LEVEL_1_0,
>+			.def = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
>+			.max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
>+		},
>+		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
>+	},
> 	{
> 		.cfg = {
> 			.id = V4L2_CID_STATELESS_HEVC_SPS,
>@@ -601,6 +610,26 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
> 	};
> }
>
>+static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
>+					  struct mtk_vcodec_dec_ctx *ctx)
>+{
>+	switch (ctx->dev->chip_name) {
>+	case MTK_VDEC_MT8188:
>+	case MTK_VDEC_MT8195:
>+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
>+		break;
>+	case MTK_VDEC_MT8192:
>+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_5_0;
>+		break;
>+	case MTK_VDEC_MT8186:
>+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
>+		break;
>+	default:
>+		cfg->max = V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
>+		break;
>+	};
>+}
>+
> static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 					  struct mtk_vcodec_dec_ctx *ctx)
> {
>@@ -613,6 +642,10 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 		mtk_vcodec_dec_fill_h265_level(cfg, ctx);
> 		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported level: %lld %lld", cfg->max, cfg->def);
> 		break;
>+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
>+		mtk_vcodec_dec_fill_vp9_level(cfg, ctx);
>+		mtk_v4l2_vdec_dbg(3, ctx, "vp9 supported level: %lld %lld", cfg->max, cfg->def);
>+		break;
> 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> 		mtk_vcodec_dec_fill_h264_profile(cfg, ctx);
> 		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported profile: %lld %lld", cfg->max,
>-- 
>2.18.0
>

