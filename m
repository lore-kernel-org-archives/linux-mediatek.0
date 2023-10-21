Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92DDC001E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Oct 2023 09:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Szeo6GlGumuAsnymcDakPzz+tmLHwzRckC8ZIPb3qcs=; b=iEExjk/tWE7n/22TH7/ZqVNTyA
	UlMXHiwo7JzCxi8/7JOCDxwLyGaLuh4c6aTYwfHXYF4ITsyud4u56mrm+gXOX/KGJWx+w+mb5aJsl
	1XOZB4sVR+6UwVFOclD/8ZD7BT9aApBo7yvpRhX9A5VhtEILmIhix6taOrAnAC5PN692sGfp/xxrj
	BC3Ec/UyGVplw34VApnnwgxh/pjEQF5vXpD793F2FEJReCYeWHV6zNTX5afmcIDv4MCsOXD285bxd
	xhCo8ZaldqmBjbTYW8Q+I+QLhhmbpDfQ0fF9UTdhK5+QyQ9doTnQGj+PGKFpwXEV4bdEICgRWz9qJ
	ZvSy/+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8a4-003j5K-2N;
	Sat, 21 Oct 2023 09:47:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qu8a1-003j3T-2q;
	Sat, 21 Oct 2023 09:47:39 +0000
Received: from localhost (89-26-75-29.dyn.cablelink.at [89.26.75.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F39F6607337;
	Sat, 21 Oct 2023 10:47:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697881656;
	bh=3EEfWwRJVneHJoBHkAnll2cb7orvXzxeDtOgWDZBml0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J1SYoNWGM08YbCHkOFz7n1c/HdRk9GioDlFlnVqrELuqxMX/12NhpPM4Gu66SS7nh
	 FKpxN5lxoIa7VvV9PuaHuTrZInnfqBTwboRA4clIq3zv2QwVqlwxAIsq0gEPBUqyuQ
	 q2mQTjWl6Z7zdMcSok1MYgJSTtvVc4tml5/glCrWlT5EG8qDQUzJTaUBCyV0Jrrg/0
	 lLE0Pwl5BZBdlxAtCpbo3tJ6yXFzFnUog7iJCmN8vfDb8cgTRRYyjwAT7NoR+4+5lS
	 CgSRb+/rX8mUnP+SnB5sozjfKh/v8NcZx0JHt305kuLkpHJkSvZJoIJw/AJv7FEuFn
	 CgC5s9c/2xx0g==
Date: Sat, 21 Oct 2023 11:47:34 +0200
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
Subject: Re: [PATCH 4/7] media: mediatek: vcodec: Setting the supported h264
 profile for each platform
Message-ID: <20231021094734.7osgimxoljlseztv@basti-XPS-13-9310>
References: <20231016064346.31451-1-yunfei.dong@mediatek.com>
 <20231016064346.31451-4-yunfei.dong@mediatek.com>
 <20231021092905.3uxfwckgn5ndon6x@basti-XPS-13-9310>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20231021092905.3uxfwckgn5ndon6x@basti-XPS-13-9310>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231021_024738_049561_78213DB2 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On 21.10.2023 11:29, Sebastian Fricke wrote:
>Hey Yunfei,
>
>On 16.10.2023 14:43, Yunfei Dong wrote:
>>The supported format type of different platforms are not the
>>same. Need to set the supported profile according to the chip name.
>
>I would suggest the following rewording:
>
>Set the maximum H264 codec profile for each platform.
>The various mediatek platforms support different profiles for decoding,
>the profile of the codec limits the capabilities for decoding.
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
>>.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 19 +++++++++++++++++++
>>1 file changed, 19 insertions(+)
>>
>>diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>index 1fdb21dbacb8..84c0bed577ed 100644
>>--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c
>>@@ -559,6 +559,20 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config *cfg,
>>	};
>>}
>>
>>+static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_config *cfg,
>>+					     struct mtk_vcodec_dec_ctx *ctx)
>>+{
>>+	switch (ctx->dev->chip_name) {
>>+	case MTK_VDEC_MT8188:
>>+	case MTK_VDEC_MT8195:
>>+		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
>>+		break;
>>+	default:
>>+		cfg->max = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
>>+		break;
>>+	};
>>+}
>>+
>>static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config *cfg,
>>					   struct mtk_vcodec_dec_ctx *ctx)
>>{
>>@@ -585,6 +599,11 @@ static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *cfg,
>>		mtk_vcodec_dec_fill_h265_level(cfg, ctx);
>>		mtk_v4l2_vdec_dbg(3, ctx, "h265 supported level: %lld %lld", cfg->max, cfg->def);
>>		break;
>>+	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
>>+		mtk_vcodec_dec_fill_h264_profile(cfg, ctx);
>>+		mtk_v4l2_vdec_dbg(3, ctx, "h264 supported profile: %lld %lld", cfg->max,
>>+				  cfg->menu_skip_mask);
>>+		break;
>>	default:
>>		break;
>>	};
>>-- 
>>2.18.0
>>

