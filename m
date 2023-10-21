Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22611C0032E
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Oct 2023 09:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYhVjSxmiNe8wo6V7ME+0J7gbYM6iLcm6/KgSZfse3Y=; b=1l8Y4cdhBpFy6cODR/99INGX6y
	pbzSlCMhTyQBDioed9o0nnlXf3oarI9zwAn+ddGw7MH1D60QlYKUAAASIHxWfbDZ3hq0+Ddi4Joky
	Aun3or1k/gyGilSGBbqhRyU2GMQAlrFiydZw46JbiWXTP3ferKG9/Nfe6I94WEt0JqFT99mEUzEo+
	Bch8z0FUuXPDtCBwFFOWQd+U9ji26gKz1Yeae3kP6pmrM5jxCLVA1a5TltipOhyKYmJ5CyvLrnRtJ
	ehBXmDU4Hj5UmuU2a9fyuq7Q9XWw9Mm844I1NT9nkLL2AMfA5Wm6hzWPbGOiGqz7sT86pWfK3brN0
	rLg+ZfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8XW-003iY2-37;
	Sat, 21 Oct 2023 09:45:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8XI-003iUX-07;
	Sat, 21 Oct 2023 09:44:51 +0000
Received: from localhost (89-26-75-29.dyn.cablelink.at [89.26.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A04C26607337;
	Sat, 21 Oct 2023 10:44:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697881486;
	bh=ti3+0qlDl3N/PPkGisFxcRpahI6GOcbLzoK1uCIWoV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZK1TGZJisg5QZItFBbAWoksBY5RewuX/mMgau6VTTafRJrrMXlaTyzEsSThJ2fROK
	 lV13bsN08tvJZqUHfdC1ubITVFAGtczBVueiRhmuazOJSLfEaLWy1e6/3TM8PRg5pe
	 eckvX97m7qosxt7VVxGWVYrhAco/MkvPzwGXC4d7bGz6bZjq0W3GUyFyOeTsN0s7IE
	 0Ms+ZmcaTIE+HdkgMcsUkTqm4wIjkD+a0JfA5QgQFOqov2rSRrWmcMfLm2X9WeIx40
	 atyOpmBmuL5V2SUd3nyscRneuYB6wTpxnLQG2aq35nAWumS5eyMT4YCgwPr/KF14zA
	 wwVQkf3WdmyMw==
Date: Sat, 21 Oct 2023 11:44:44 +0200
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
Subject: Re: [PATCH 7/7] media: mediatek: vcodec: Setting the supported vp9
 profile for each platform
Message-ID: <20231021094444.l4it4bh4y56a2qtt@basti-XPS-13-9310>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
 <20231016064346.31451-7-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231016064346.31451-7-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_024448_208129_1451CEC4 
X-CRM114-Status: GOOD (  12.20  )
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

Please replace Setting with Set in the title.

On 16.10.2023 14:43, Yunfei Dong wrote:
>The supported format type of different platforms are not the
>same. Need to set the supported profile according to the chip name.

I would suggest the following rewording:

Set the maximum VP9 codec profile for each platform.
The various mediatek platforms support different profiles for decoding,
the profile of the codec limits the capabilities for decoding.

With that you can add:
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 22 ++++++++++++++++++-
> 1 file changed, 21 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index 02985184fa0f..ae181498c3c3 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -109,7 +109,8 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
> 			.id = V4L2_CID_MPEG_VIDEO_VP9_PROFILE,
> 			.min = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
> 			.def = V4L2_MPEG_VIDEO_VP9_PROFILE_0,
>-			.max = V4L2_MPEG_VIDEO_VP9_PROFILE_3,
>+			.max = V4L2_MPEG_VIDEO_VP9_PROFILE_2,
>+			.menu_skip_mask = BIT(V4L2_MPEG_VIDEO_VP9_PROFILE_1),
> 		},
> 		.codec_type = V4L2_PIX_FMT_VP9_FRAME,
> 	},
>@@ -630,6 +631,20 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *cfg,
> 	};
> }
>
>+static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config *cfg,
>+					    struct mtk_vcodec_dec_ctx *ctx)
>+{
>+	switch (ctx->dev->chip_name) {
>+	case MTK_VDEC_MT8188:
>+	case MTK_VDEC_MT8195:
>+		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_2;
>+		break;
>+	default:
>+		cfg->max = V4L2_MPEG_VIDEO_VP9_PROFILE_1;
>+		break;
>+	};
>+}
>+
> static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 					  struct mtk_vcodec_dec_ctx *ctx)
> {
>@@ -656,6 +671,11 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported profile: %lld %lld", cfg->max,
> 				  cfg->menu_skip_mask);
> 		break;
>+	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
>+		mtk_vcodec_dec_fill_vp9_profile(cfg, ctx);
>+		mtk_v4l2_vdec_dbg(3, ctx, "vp9 supported profile: %lld %lld", cfg->max,
>+				  cfg->menu_skip_mask);
>+		break;
> 	default:
> 		break;
> 	};
>-- 
>2.18.0
>

