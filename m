Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E08EC004C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Oct 2023 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btfsvtjeNmNFNqPdRQ33LFhEphT53dObx4LFlgsE17Y=; b=c1jopgoIlICw1qw9Lklo8/8QNa
	KnMaHjEGtS4qttmbr5VUE2sqhLGIuHDFchnoBQ2FpEQfvaEIqzGge0FC72UPgktHzKnfDhOSEcAzM
	0lUHUvPQYw3HwIQt4dDg3B1Rv6s6KLMLvFYb8Cx9vV9xJJAP0OpENxKVBNb0FfXVDj5QmJoj3tPYh
	beTmPHJLL06szpUhYSF5m86sUI3oIOfyPfWbp45P2xtOQ2Gupd7Aj62F7eJPn+xwhoQnf8dv5l5zO
	YeKtnKfFHv93MQISxgH1IaFhNk5/7dLork43QCGayNEwSyJkOLxIcezV/G3vcmMpGWWMhlqrVbRt6
	Aqlrerpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8Zt-003j0V-1p;
	Sat, 21 Oct 2023 09:47:29 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8Zm-003iy5-2d;
	Sat, 21 Oct 2023 09:47:26 +0000
Received: from localhost (89-26-75-29.dyn.cablelink.at [89.26.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 707A26607314;
	Sat, 21 Oct 2023 10:47:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697881641;
	bh=MW4fq3IoOrkm/uKuin0n5jWD7y//DvYP8PEHA13Kat8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=idEU5E+v2YLIbsQ2nZiOOu6R4Lp5Q9MJblCkcY0SpRr0Pw0iYYt+uckIZz54FRPlX
	 7Xs6h1XkwQz7D7QsFYgX3fRGQjW8WkBgLQWcDoL0ZyCC5xKawEkJD+del6x4Fb9kDZ
	 h3fvzXQTvReuOKngWoZVEWmZW78Zb9+Po4ach4DQpeC10OX7ukdqDiA4SKUx92Dcd2
	 tbJ/ZYSq/PehDv4s2DSalNdHnvxo9ViRmAs3yKl968PODM0pk+OdCz8pXiHMIuHsUf
	 D3a+KviTUvxIGwmYz8cgX1WXyXk+dfjUDhAUtYl0dRzVgBIiaoFk7rQuXlVZvg59Ij
	 ORPQPK6vBZNrw==
Date: Sat, 21 Oct 2023 11:47:18 +0200
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
Message-ID: <20231021094718.fgy32sevjjdx2d3c@basti-XPS-13-9310>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
 <20231016064346.31451-3-yunfei.dong@mediatek.com>
 <20231021092535.hna2fzgbevluczm4@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231021092535.hna2fzgbevluczm4@basti-XPS-13-9310>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_024722_984458_4162C623 
X-CRM114-Status: GOOD (  11.05  )
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

On 21.10.2023 11:25, Sebastian Fricke wrote:
>Hey Yunfei,
>
>On 16.10.2023 14:43, Yunfei Dong wrote:
>>The supported resolution and fps of different platforms are not the
>>same. Need to set the supported level according to the chip name.
>
>I would suggest the following rewording:
>
>Set the maximum H265 codec level for each platform.
>The various mediatek platforms support different levels for decoding,
>the level of the codec limits among others the maximum resolution, bit
>rate and frame rate for the decoder.
>
>With that you can add:
>Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>
>
>Regards,
>Sebastian
>
>>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>---
>>.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 28 +++++++++++++++++++
>>1 file changed, 28 insertions(+)
>>
>>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>index f4af81bddc58..1fdb21dbacb8 100644
>>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>@@ -147,6 +147,16 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
>>		},
>>		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
>>	},
>>+	{
>>+		.cfg = {
>>+			.id = V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
>>+			.min = V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
>>+			.def = V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
>>+			.max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1,
>>+		},
>>+		.codec_type = V4L2_PIX_FMT_HEVC_SLICE,
>>+	},
>>+
>>	{
>>		.cfg = {
>>			.id = V4L2_CID_STATELESS_HEVC_DECODE_MODE,
>>@@ -549,6 +559,20 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
>>	};
>>}
>>
>>+static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
>>+					   struct mtk_vcodec_dec_ctx *ctx)
>>+{
>>+	switch (ctx->dev->chip_name) {
>>+	case MTK_VDEC_MT8188:
>>+	case MTK_VDEC_MT8195:
>>+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
>>+		break;
>>+	default:
>>+		cfg->max = V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
>>+		break;
>>+	};
>>+}
>>+
>>static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
>>					  struct mtk_vcodec_dec_ctx *ctx)
>>{
>>@@ -557,6 +581,10 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
>>		mtk_vcodec_dec_fill_h264_level(cfg, ctx);
>>		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported level: %lld %lld", cfg->max, cfg->def);
>>		break;
>>+	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
>>+		mtk_vcodec_dec_fill_h265_level(cfg, ctx);
>>+		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported level: %lld %lld", cfg->max, cfg->def);
>>+		break;
>>	default:
>>		break;
>>	};
>>-- 
>>2.18.0
>>

