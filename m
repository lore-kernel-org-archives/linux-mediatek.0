Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CD6606A329
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G+YE21LB;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqM5VpEc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=q1b9Vl4Ai63r6PX/+1MzE13ZwXBrHRrLzRTvx0UyhBM=; b=G+YE21LBf2+17P
	UC/XtryQNdhNjV5+usDfBKi8CMvtgtm6oQIx9vxhEnOFW8FNll8Qv1phpTLjJOiUP9/TUM1EWaLcT
	7/GHzYWGfCIKA/HddBfPm8wLGzN1gDlkVgnZg+RmgNo1yxRP5T5goR3tx3WxIedXrwp4HpEmEPhS8
	/Zc0zhTRre5eRFBVgrA3/HOe1vODaHzbC9TQM68TnvxnsnoN2rxcARe4fBIYQMW716p0HxSQLQ4Pl
	wvGr/JdrDDGK5trVjaOvT9qMVTxAsl0ChbBumjJIlVKyHLdaxncnQpPv0oqwtuVXt6c/+/EQljd61
	TYKa4LpIpxn5LXauiarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPy-0000000BF0h-46TZ;
	Wed, 25 Nov 2026 20:16:38 +0000
Received: from mail-oo2-x0b.google.com ([2607:f8b0:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPb-0000000BElo-0Hto
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:18 +0000
Received: by mail-oo2-x0b.google.com with SMTP id 006d021491bc7-71b7aac1211so400367eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637774; x=1796242574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1b9Vl4Ai63r6PX/+1MzE13ZwXBrHRrLzRTvx0UyhBM=;
        b=sqM5VpEcosS+TqtRuw0Cx3v9GfiUZrgDA+M5APAOerXZDNDj7lgET0REr3NoHT8XXP
         HI9Xs/Pq9UkJkKdxf2UiWBojA4xjpJM4c8D+NRvjuBUyYjdHbXpyaWFstcCtErPfDKQ+
         h5ze0MW6avuPT4tSx3Ll1QbG/aKZhtuahVlWUbrjo6yPQw6kW+Qs2SH12CCYS4zeIt5J
         iORdhCKrtgqfm4sEaDFr8kVKdo7Hr14OaDAt8HbQblgK0LtkgUiDVxJ4bVOgIRl+lJYv
         Y+Tot9JqHZWA4WaDpIQx531t1F6ZCHKs7Rl+arX1T14UViJ7IZwexFFZmqPDjGdo8vxO
         yhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637774; x=1796242574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q1b9Vl4Ai63r6PX/+1MzE13ZwXBrHRrLzRTvx0UyhBM=;
        b=PrcYcc2AdvQHqlq3QSSKY2uRZ3oka8hramA/x/u7zopvQbmzGWy8oL1KVMOatau4vu
         HBn6Pzz8poqkDtMOUT4n9ca4kR/emHpfIWoWuPdAFOIBaen/3jKomsXzgi+u5U0NCoY6
         m26Qz6BD3Hpl1IAW7SHkc6kfVEBNiw7Btq9/Ny8p3yutUspiR3oqySt8vSKH2T7G0VX2
         Ikfp8grjWuw1XtmLI4qrjdN63OZeObv3dhoZTybGtXZxUsT7p4G+/SE7GAes5RjQjVCr
         HbD/g2F8OETu0PqclrDWSioheksGMcxxzTlsVkQwugMHdY6UdwwjqZMKm6g4niasyVZl
         SuCQ==
X-Forwarded-Encrypted: i=1; AL+hErGP76FW35MuWQlXsNlhrsJGI3W/bUrJhvXZZsUgZCLHcG5G2To1qX4Og5NkVEIpQ8TLAi/wXEWclGmADsVqDA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+KjMuRk5xDOook7Iwi3BV+yJ3XfxQtDwLy+UO0XQiXnMfyYU1n
	OEOEwG561moK4elfj8WqS1Eq4gAIFm8gkue1HmZKvh6a1r65y8UeDxQD
X-Gm-Gg: AZFdTZc+wlokQ4j9dZqcBP2FOKHNVrmciqhvfSnSXSrTdF7IUTxFM+wqExKyNrJUU6S
	bHkMQLDQqeu8tLY+1S1HkV+q5yR+hDt8hjPBukDNHWHfwEMryB588mZSppD8jaT8LeCaL+HTr0q
	M4++70Wpxyd6UV7/vP6kU9K74iQmg0VXUOfaWi/x/eUsQMnPArL2d063cVYRdHT8+vSSwz4qFTO
	tTE6gSy0C/3MzJWxzW1yvPpcHnaYxJrGFhY9c78NdtZxxkCmMBhPMz6A7ZurA9Crd2Nfk3MFysj
	dVNIojQeldXd4dbjNdCjYw2wlY95qdcO81NOtuTLV6LN3/hycSeklX9H/pOEEtty8sVEG8ayo0n
	ToExI5YO9kF6/bE1xOnZMyMt03NEx4H+rpaz/LzcV37Jx9ryuEkKvNzpvXGogUoz+P6vpNEtMc7
	hjGL2Q4+EaEFBahWCarc57OWwW7kYzWSgN3KEwFu9W6PlXf+KZuFmypknb4P+p13RPtNg0S8Zga
	E4uiApkI6yMsjRvP4LWitzt9KAWnjZn49RaMGVvAspcfzqnGuRDGXKOAE8x77rI67UkoESjcjgC
	t5hfe2lXfXuU7owHckBwDZmVZHRm5kZtX+g=
X-Received: by 2002:a05:6820:2010:b0:71a:f4ed:7027 with SMTP id 006d021491bc7-71b391fd995mr17169426eaf.2.1795637774010;
        Wed, 25 Nov 2026 12:16:14 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:13 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:06 -0600
Subject: [PATCH v2 3/9] media: mediatek: vcodec: Report the visible
 rectangle as default compose
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-3-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=3460;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=i81oOhR6sJETIKkjiWKY/HxG7mnnnV0yADrWNY8UjSw=;
 b=VV7JHfQrg50/QoNd+JDg86Ov4ZSO8f0L8h1ZiuwJMvL6wo+DTGTbJl4uiRHRxnfV/fZVveKgr
 eLU/5EMwgXJBAiss1JpFxTToGiGh7sXQ/wA0MfYL9lE4C8h4Jh5GB1Y
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121615_153940_AE0A1831 
X-CRM114-Status: GOOD (  13.91  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_PDS_OTHER_BAD_TLD,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The default compose rectangle of a decoder's CAPTURE queue is the
visible rectangle (dev-decoder.rst: equal to V4L2_SEL_TGT_CROP), but the
driver reported the picture size the firmware gives, which for H.264 is
a whole number of macroblocks: 1088 lines for a 1080-line stream, which
GStreamer then shows with eight lines of garbage. Report the crop
rectangle, as V4L2_SEL_TGT_COMPOSE already does for most codecs, and
return the same rectangle for V4L2_SEL_TGT_COMPOSE and from
VIDIOC_S_SELECTION, which only allows the default.

Fall back to the picture size when the codec leaves the crop rectangle
unset (the stateless VP8 and VP9 ones, for which V4L2_SEL_TGT_COMPOSE
returned the caller's rectangle) or reports it empty. Only MT8173 was
tested.

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 .../mediatek/vcodec/decoder/mtk_vcodec_dec.c       | 38 +++++++++++++---------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
index 9339f53431aa..1223738ece4e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.c
@@ -390,6 +390,26 @@ static int vidioc_try_fmt_vid_out_mplane(struct file *file, void *priv,
 	return vidioc_try_fmt(ctx, f, fmt);
 }
 
+/*
+ * The visible rectangle (dev-decoder.rst), which for H.264 is the stream's
+ * cropping rectangle and not the picture size the firmware reports, which
+ * is a whole number of macroblocks. Not every codec fills it in.
+ */
+static void mtk_vdec_visible_rect(struct mtk_vcodec_dec_ctx *ctx,
+				  struct v4l2_rect *r)
+{
+	struct v4l2_rect crop = {};
+
+	r->left = 0;
+	r->top = 0;
+	r->width = ctx->picinfo.pic_w;
+	r->height = ctx->picinfo.pic_h;
+
+	if (!vdec_if_get_param(ctx, GET_PARAM_CROP_INFO, &crop) &&
+	    crop.width && crop.height)
+		*r = crop;
+}
+
 static int vidioc_vdec_g_selection(struct file *file, void *priv,
 			struct v4l2_selection *s)
 {
@@ -403,10 +423,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = ctx->picinfo.pic_w;
-		s->r.height = ctx->picinfo.pic_h;
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
 		s->r.left = 0;
@@ -415,13 +432,7 @@ static int vidioc_vdec_g_selection(struct file *file, void *priv,
 		s->r.height = ctx->picinfo.buf_h;
 		break;
 	case V4L2_SEL_TGT_COMPOSE:
-		if (vdec_if_get_param(ctx, GET_PARAM_CROP_INFO, &(s->r))) {
-			/* set to default value if header info not ready yet*/
-			s->r.left = 0;
-			s->r.top = 0;
-			s->r.width = q_data->visible_width;
-			s->r.height = q_data->visible_height;
-		}
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	default:
 		return -EINVAL;
@@ -449,10 +460,7 @@ static int vidioc_vdec_s_selection(struct file *file, void *priv,
 
 	switch (s->target) {
 	case V4L2_SEL_TGT_COMPOSE:
-		s->r.left = 0;
-		s->r.top = 0;
-		s->r.width = ctx->picinfo.pic_w;
-		s->r.height = ctx->picinfo.pic_h;
+		mtk_vdec_visible_rect(ctx, &s->r);
 		break;
 	default:
 		return -EINVAL;

-- 
2.56.1


