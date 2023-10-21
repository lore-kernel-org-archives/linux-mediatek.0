Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BA2C001E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Oct 2023 09:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBfsiUSQkdCIlnohOzVPszUMDeDer7x3urIdLkjY4rU=; b=RCRV/USN2HkISs3C347lypEfsJ
	jLHIadNFn+6HapAiTFf7nmaOnaYc2TeF/h6nGj5qhQICcYvuNDnBF0hepA2xW1wXLahSWSMZLE59k
	riOr3DeZWlhEav5ZQpHUz7nsWjmUp9Gv8lk4ldX++jsAbHLiu2QnPUch+CZn93xxG2kTFKQu/zB0j
	4NKojyWO2ivgPto0LU+b+VZc6281orqxmoX3ngGC1X1vDJ6hd9hDETjhHkRw9zuQ76Bk4Ae2Vz5VL
	D6ZiTOQZ/FI+HDYgfzGw6deN7BL3LUMFV+MEtVbzmOWKNx0iMvBWAdkuq/Wstc/zDqpNarHxGDxPC
	lErA4Ahg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8Zd-003ivF-0H;
	Sat, 21 Oct 2023 09:47:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8ZX-003itD-1L;
	Sat, 21 Oct 2023 09:47:11 +0000
Received: from localhost (89-26-75-29.dyn.cablelink.at [89.26.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1A1116607314;
	Sat, 21 Oct 2023 10:47:06 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697881626;
	bh=LyoLLL+0iahSppNDISM/wLW84taWhA7/2bDg/F2nugo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAhJwMvCVbrkmjr9krtydeV9DW1KH2ILFowN0whOdr85b4XLh7mx7JD9a8I4i1y3h
	 EvcONPCQPCSki02bKyvS8lozJ3ipOk7L4/hXUy422Vn8r23RFI61Sn83clYm7dxZAD
	 gmakw809pKliCTZYNNFw77Ydxsa7b//TiBROoHVyt+xDs6N0sYjXfCKVVY4vq/Jjwh
	 OSW40rIzyKvD1keBSG3/wKnIHeyCa1KOUoNNmfYzvktbPLp7vJK7mOmZTuyr38KXgO
	 rnhrdSKdp4iyy2JRpbjR9Pbh6zXbzwicFI1xN+oDSKaQp9cCxexNfiSZPW6fMoRz6S
	 SuTJhiPD1SxfQ==
Date: Sat, 21 Oct 2023 11:47:03 +0200
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
Subject: Re: [PATCH 2/7] media: mediatek: vcodec: Setting the supported h264
 level for each platform
Message-ID: <20231021094703.ght7jrrrv6n2u5ef@basti-XPS-13-9310>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
 <20231016064346.31451-2-yunfei.dong@mediatek.com>
 <20231021092345.2636a7utfdb3nbv5@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231021092345.2636a7utfdb3nbv5@basti-XPS-13-9310>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_024707_718733_89404585 
X-CRM114-Status: GOOD (  12.12  )
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

On 21.10.2023 11:23, Sebastian Fricke wrote:
>Hey Yunfei,
>
>On 16.10.2023 14:43, Yunfei Dong wrote:
>>The supported resolution and fps of different platforms are not the
>>same. Need to set the supported level according to the chip name.
>
>I would suggest the following rewording:
>
>Set the maximum H264 codec level for each platform.
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
>>
>>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>---
>>.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 45 +++++++++++++++++++
>>1 file changed, 45 insertions(+)
>>
>>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>index e29c9c58f3da..f4af81bddc58 100644
>>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>@@ -56,6 +56,15 @@ static const struct mtk_stateless_control mtk_stateless_controls[] = {
>>		},
>>		.codec_type = V4L2_PIX_FMT_H264_SLICE,
>>	},
>>+	{
>>+		.cfg = {
>>+			.id = V4L2_CID_MPEG_VIDEO_H264_LEVEL,
>>+			.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
>>+			.def = V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
>>+			.max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
>>+		},
>>+		.codec_type = V4L2_PIX_FMT_H264_SLICE,
>>+	},
>>	{
>>		.cfg = {
>>			.id = V4L2_CID_STATELESS_H264_DECODE_MODE,
>>@@ -519,6 +528,40 @@ static const struct v4l2_ctrl_ops mtk_vcodec_dec_ctrl_ops = {
>>	.s_ctrl = mtk_vdec_s_ctrl,
>>};
>>
>>+static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
>>+					   struct mtk_vcodec_dec_ctx *ctx)
>>+{
>>+	switch (ctx->dev->chip_name) {
>>+	case MTK_VDEC_MT8192:
>>+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
>>+		break;
>>+	case MTK_VDEC_MT8188:
>>+	case MTK_VDEC_MT8195:
>>+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
>>+		break;
>>+	case MTK_VDEC_MT8183:
>>+	case MTK_VDEC_MT8186:
>>+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
>>+		break;
>>+	default:
>>+		cfg->max = V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
>>+		break;
>>+	};
>>+}
>>+
>>+static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
>>+					  struct mtk_vcodec_dec_ctx *ctx)
>>+{
>>+	switch (cfg->id) {
>>+	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
>>+		mtk_vcodec_dec_fill_h264_level(cfg, ctx);
>>+		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported level: %lld %lld", cfg->max, cfg->def);
>>+		break;
>>+	default:
>>+		break;
>>+	};
>>+}
>>+
>>static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
>>{
>>	unsigned int i;
>>@@ -532,6 +575,8 @@ static int mtk_vcodec_dec_ctrls_setup(struct mtk_vcodec_dec_ctx *ctx)
>>	for (i = 0; i < NUM_CTRLS; i++) {
>>		struct v4l2_ctrl_config cfg = mtk_stateless_controls[i].cfg;
>>		cfg.ops = &mtk_vcodec_dec_ctrl_ops;
>>+
>>+		mtk_vcodec_dec_reset_controls(&cfg, ctx);
>>		v4l2_ctrl_new_custom(&ctx->ctrl_hdl, &cfg, NULL);
>>		if (ctx->ctrl_hdl.error) {
>>			mtk_v4l2_vdec_err(ctx, "Adding control %d failed %d", i,
>>-- 
>>2.18.0
>>

