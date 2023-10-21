Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DFCC004C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Oct 2023 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfBON/QiI6yrxWU74dGyR5P0vZou4ZlPj/ei4KWVEFA=; b=D1/qpfeKkwrGfp228jCIytqblN
	EqWjVby54fjQXan8H3ajaEE/y9CPEZWepTyo72iqcc4I7DXfrNVMsi9kDeJ68jGlWSliW1sxF0gUo
	aXAXBYdlWkz5zt9d2jOnQg+mwBilIe7xQMBs+pXenQu0PbpGfhikk8ylIvY9cVTfY+z2fcczjJvF1
	/sYstOjC7zULudzRTpr4h6zk9nPsLbS50AUb1FoFrKgA5qPExKTI7SwwaOstHDHgb1QHIP5bIHY3o
	0qMdNkcVWd2edm/wiFitobNt6oUadJ/MKUtvTvD96C+1g347tQer1GcCebOWmaZbzEgvWAcDr7GFw
	DY7Cd6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8T4-003iGM-0Y;
	Sat, 21 Oct 2023 09:40:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8Sx-003iFd-38;
	Sat, 21 Oct 2023 09:40:23 +0000
Received: from localhost (89-26-75-29.dyn.cablelink.at [89.26.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6AC846607314;
	Sat, 21 Oct 2023 10:40:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697881217;
	bh=SHLD0rEJI0NmsmsXyArE+2lz+5Be5FbgqrbTnMFX+uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsVF4fCLLntBXs7eKN+oc/Lg6wAyAXrzgEPCw/yrbajMdmNSwcrD3wxfsZeCachRU
	 E/R/7UNoDj9vXVwdV6ULiM6hAGnjxRsGwOlWBhCesyvyOw0z1jy0jMqHkbrg2OM1ck
	 9FmTVqNQfv24kyz9wIUgCfRjvaHogz+ToISpVAecMmiF93Cmu4sT6JjLGxblaC2cex
	 IXBfYqe6nE1HMUHPjWIlVYo959QewzlTEq5yN3qN4kQz0Ou3GOl0AJPh6JL3S360GC
	 mLKJ3VLfih9jqpSc0JI1nM2TuPf8vVTomRIhW3KCaP4kjPcUkX2m6xOf7bjqFsdPfv
	 87UN/UnHAjFoQ==
Date: Sat, 21 Oct 2023 11:40:14 +0200
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
Subject: Re: [PATCH 5/7] media: mediatek: vcodec: Setting the supported h265
 profile for each platform
Message-ID: <20231021094014.7pzdvgouhxjf2pvo@basti-XPS-13-9310>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
 <20231016064346.31451-5-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231016064346.31451-5-yunfei.dong@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_024020_149760_B88317D5 
X-CRM114-Status: GOOD (  10.65  )
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

Set the maximum H265 codec profile for each platform.
The various mediatek platforms support different profiles for decoding,
the profile of the codec limits the capabilities for decoding.

With that you can add:
Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

Regards,
Sebastian

>
>Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>---
> .../vcodec/decoder/mtk_vcodec_dec_stateless.c | 19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
>
>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>index 84c0bed577ed..b15ed773374f 100644
>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>@@ -587,6 +587,20 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
> 	};
> }
>
>+static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_config *cfg,
>+					     struct mtk_vcodec_dec_ctx *ctx)
>+{
>+	switch (ctx->dev->chip_name) {
>+	case MTK_VDEC_MT8188:
>+	case MTK_VDEC_MT8195:
>+		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
>+		break;
>+	default:
>+		cfg->max = V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
>+		break;
>+	};
>+}
>+
> static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 					  struct mtk_vcodec_dec_ctx *ctx)
> {
>@@ -604,6 +618,11 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
> 		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported profile: %lld %lld", cfg->max,
> 				  cfg->menu_skip_mask);
> 		break;
>+	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
>+		mtk_vcodec_dec_fill_h265_profile(cfg, ctx);
>+		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported profile: %lld %lld", cfg->max,
>+				  cfg->menu_skip_mask);
>+		break;
> 	default:
> 		break;
> 	};
>-- 
>2.18.0
>

