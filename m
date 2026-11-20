Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F4F606A6F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=W4I1q2Rv;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zDIsJQBI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=; b=W4I1q2RvA4E9XY
	jLNRkBEts6ea+/tiqP4gZ6uCOv52thsUY30JT4DiisXydsubJ7UmUINr2A3c6Qxgsta/RtVWyp8hC
	F5pFGNyktjcM2ZXkd3oJ1+AoXhDRyp/jso80jGaIqq6MhSi6pOVwtMCDNrf97sX8wi1Qeq+vzj4sn
	+PFCSh4S1e2Mw3H4WFuupy20TIcQFVN7rgKVkz4GajXMwGdd5sLkfMZPrDFvDECAM4O567wDsHVtn
	GifG5BOJyW/QDpopnDgvUfSKRIx/Y2ywR++7y7M+pe932G6QZwugUzY1RduTAKGlgKGhNKkGvtCJ0
	Wt15zJ4k/j+oa0HdMmPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiC-0000000G9Ue-0Hnm;
	Fri, 20 Nov 2026 19:55:56 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi0-0000000G9H6-2Fve
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:55:50 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-862a1dbb516so245121a34.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204543; x=1795809343; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
        b=zDIsJQBIz6poCOAXkBNz1Iqa5h4bTne5sOXacm7zwqXVJz3UKtJnzHN2ARc4BFaFQC
         bCetlU63ctZaOZZ+/onnrwTapMc6EZ/mzlKYASe1kASnYN0uaikFwp3m5N9PDtTZvtcE
         2FkG0Px13+T0dv/4+yxwuG8vVCXDeryi1xu0DbeiN7gngsEYAfWHhMFsPzn6NoOZobpy
         S5JYa4Zb5X7hBAF7Tc2Cwh3Rf2nfrMaXNR0X15qo17vHIdoTuc5FJCbGmcCxzmBq0bSX
         JfUyqkhxh/mvZx+mR+UpqifgRw0KkdIREQabiuIeshUBsxw7KUAga7rsJVqX6mBCD9U4
         Q5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204543; x=1795809343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eftqcv9qvPmxYW8Z6+X08Y50XJ4HZw+RRHpMnGeSvBA=;
        b=Zitfj3SwjfhyCb3hD2MvMby0a8NDl6lpZDMolcIYCQlhOKP+rS3e/aokKR5vJ4ATv1
         TFYdPSUaCNGNl4NDcgqkyXR+rFEEV77xTTqMArbW/vHo6JNsmP7GPaX8N5w715X/xwXa
         ++IV2szSstd8IJoIPZJNg5gmu+U9i5aKRc4d2mPB9N2OIaACGQyuU/xufDy/fAgAb/B3
         W73jz57iem4f8JyLKEV6P8vLyCjDKdZb7SyA/bNYNlm+Z/OEyCDFpmOCngeWZ7kuDxhJ
         fSBI96Xb4bToeocyEUHxtYtDBZstgazCn88toxiDFhbKIWYZ1TWvCXm6JMDwaHJVnnqL
         6pJw==
X-Forwarded-Encrypted: i=1; AL+hErEdBqi9hwDNqSHHXhrH+/UDy4pF1DCghAmHZpO7g1VAKJTUpDspdZB64qO1xZbdZvrRVtt56oL2lhR/j4mqWQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z97q3/ZLg3RQlGxKl+s//vIE9ZTXugI196QJfTnzmcAkPsynkBp
	p4C3lx3TvXNXz/W9W+z9izCBu2jRnWmjy7YV80LQenws9VlkTx3hkfis
X-Gm-Gg: AYBFou1u1QzxLLUlV7BAXbp/g2gjanIaI0Q/EkD5RHNscKOktAAVqWtRZoFcOfcZsIL
	Y0PcwY28/fwTSl0psNnITl2L1FMxAPvOssUzQ1IhYWgmvUW3YjBYAgBWXbtJ/dGigcBEY014XoK
	VzwdjlKGNPoix9t9Uiqt05N0DyTUwqWiTYdCc3FTDE0/knQbwd7uLFYycX/qjTQSu/VaqucFhor
	fwZ+h/DV1jcWrnPgaV1rLIERGvtSwOUZyW0j+NPBMK8/bN/DVKM6nTi3WLR0NCP6gM4SofuFC98
	9gKPrYnC1RflJldhIv48u2CetBJK1fQmDHX2Z/eCMDwbqB/jItS173wW2rxHVLeHR3zvdumkAcq
	xHwDpRWtFmkLaA0S3m1OsccTQU5CAViQL21kadK3miwHMqDBEEXNM1OZsKmynZEtBoxVuxlq+Yy
	kjypNXWQilAG3Fo5G/rsKndQUfhkYvuqd2PBPtVrLOb5501og6/xGM8eEjFearOn6ZO0wP9kiDL
	C4+QbGxl55DzCBI8kKiHAofPSfNnp0Qx9+FS30eGKN3WsRtaxz7TiKuW+g4D8xLjbGql81QF050
	2aocwzyBoNAui+PdfAL/BqOYh4LCTsd/LMq8kTVge+VmBDmZLFjWKB06fBn2n6d+xYGo7T30mA6
	YMEJH1YvKytI7dRBbu5g=
X-Received: by 2002:a05:6830:438e:b0:814:8259:781e with SMTP id 46e09a7af769-863151bb271mr4983334a34.1.1795204543316;
        Fri, 20 Nov 2026 11:55:43 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:42 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:37 -0600
Subject: [PATCH 3/8] media: mediatek: vcodec: Report the visible rectangle
 as default compose
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-3-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=3432;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=oiFySgVqt+7XnX7ycDBKE4VLYw9gJVvkD5dQiMAZTM8=;
 b=cTogffUF7xjKiziZK+BVcGyBnc5RI5Ib23pwR0Td1xK+sjGiQJPiF7n90B2SdcuSuAOUv+O5w
 XiJvJBspeomC0HkqHIxlGpJFymYsi665HAx2H9LY0sG8CnDiMCyfytT
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115544_733972_463368D3 
X-CRM114-Status: GOOD (  12.98  )
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
2.56.0


